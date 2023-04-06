Return-Path: <SRS0=/lsJ=75=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680791590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JgG/O3cr3dEMpIHkdZXSOfmunlM2MRXjf9L9QbB9YE=;
        b=axYGAqrcb+KHZsnhc9x0HChiLQYXWA8Z13syNrj8oF7hFgnQUwdJB3LIiii7mQHQdx
         RISEeYXnxIPf4n7blwmo/6Frvw4vso7uhuz99zqXVcKVwp1580OS8KDnRDYh+YZon9HX
         WG/5v/leGAR9jL+ho9ndybo8Kk5fZhPsrJfTxZ7OmCb3gtzsHeh/fnHru9fBXpHiBRkl
         DFWqlmw1gR6BqRVtsUUAVuNRMObFKGEFXoetcKh3BUFUf+rvIcmuaRsRtueZW/06ydE/
         qRX3VZbK5jgRiuVkOBLVWP3a+pu8X29u1Tb35YNAsK0g/bTjrKnGdRCgeI2+ZmbbjuBF
         X/Dg==
Message-ID: <653947fc-3846-32a5-4386-35abd39b792b@gmail.com>
Date: Thu, 6 Apr 2023 23:33:07 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2] CodeSamples/count: change full memory barrier to
 partial one
References: <20230404164753.1317498-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230404164753.1317498-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue,  4 Apr 2023 12:47:53 -0400, Alan Huang wrote:
> The original memory barriers in count_stat_eventual.c ensure
> writing to global_count happens before writing to stopflag and
> reading from stopflag happens before later reading from global_count.
> 
> Thus, smp_load_acquire and smp_store_release will suffice.
> 
> In count_lim_sig.c, there is only one ordering required, that is
> writing to counter happens before setting theft to THEFT_READY in
> add_count/sub_count's fast path. Therefore, partial memory barrier
> will suffice.

Hi Alan,

My comment on count_lim_sig.c here.  See below

> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/count/count_lim_sig.c       | 10 +++-------
>  CodeSamples/count/count_stat_eventual.c |  6 ++----
>  count/count.tex                         |  9 ++++-----
>  3 files changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
> index 59da8077..c2f61197 100644
> --- a/CodeSamples/count/count_lim_sig.c
> +++ b/CodeSamples/count/count_lim_sig.c
> @@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
>  {
>  	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
>  		return;				//\lnlbl{flush_sig:return:n}
> -	smp_mb();				//\lnlbl{flush_sig:mb:1}
>  	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
>  	if (!counting) {			//\lnlbl{flush_sig:check:fast}
> -		WRITE_ONCE(theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
> +		smp_store_release(&theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
>  	}
> -	smp_mb();
>  }						//\lnlbl{flush_sig:e}

You see, this a signal handler.
It can interrupt anywhere in normal threads.

That is why you see a lot of barrier() calls in updater functions.

This code has no assumption on memory barriers around signal handlers.

So, I'd rather keep smp_mb()s in this function.

Do you have a good reasoning why the pair of smp_mb()s can be safely
replaced with the single smp_store_release() ?
 
>  
>  static void flush_local_count(void)			//\lnlbl{flush:b}
> @@ -125,8 +123,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
>  	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
>  	barrier();					//\lnlbl{barrier:3}
>  	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
> -		smp_mb();				//\lnlbl{mb}
> -		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
> +		smp_store_release(&theft, THEFT_READY);		//\lnlbl{READY}
>  	}>  	if (fastpath)
>  		return 1;				//\lnlbl{return:fs}
> @@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
>  	WRITE_ONCE(counting, 0);
>  	barrier();
>  	if (READ_ONCE(theft) == THEFT_ACK) {
> -		smp_mb();
> -		WRITE_ONCE(theft, THEFT_READY);
> +		smp_store_release(&theft, THEFT_READY);
>  	}
>  	if (fastpath)
>  		return 1;

These changes in updater functions look good to me.
I'm stopping here.  Let's reach a consensus on code changes first.

        Thanks, Akira

[...]

