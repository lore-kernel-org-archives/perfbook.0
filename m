Return-Path: <SRS0=eYHJ=74=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680703719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cw8P8g9ad6xVKJHcuRWCmNPy9DKWbLm1A/517eiR5k=;
        b=Ic81b1nMk/T1LVpdPiOj3EZr35YLzRHnz/80NA7Zod0sY4Zzc+BfbTaJOCSDaOwv5H
         OmAz/aY5flHzlsLtBgPM6RlVZFCbfchnawkfO43Ey0blLhAxt6PxXpkD1Zju5XSHD7SO
         NJUKihTAHnnC8i6LYC1uUmQPWGb/bdQ59uPEjE7XlJmzk+K3p6vKOsgTNZQWnZtwzu9I
         R9POZvHm4aIGQB5wo8HpoFSInKnCJLGNChLBCirKXHH39MtrW8dK/v1IS7IXHzlFS5oE
         7WpjmdGWf7lyrDtxnoLEjE163oJUvmUPglU8PreIO8wEYJfMJJTL2MADlVk8XznoC6Cr
         2tyg==
Message-ID: <b0829b05-3c90-197a-50ea-f3ce5cce94ea@gmail.com>
Date: Wed, 5 Apr 2023 23:08:29 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2] CodeSamples/count: change full memory barrier to
 partial one
References: <20230404164753.1317498-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230404164753.1317498-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Tue,  4 Apr 2023 12:47:53 -0400, Alan Huang wrote:
> The original memory barriers in count_stat_eventual.c ensure
> writing to global_count happens before writing to stopflag and
> reading from stopflag happens before later reading from global_count.
> 
> Thus, smp_load_acquire and smp_store_release will suffice.

So far, looks good.
But those smp_mb()s are mentioned in Section 5.2.4.
Please see inline comments below:

> 
> In count_lim_sig.c, there is only one ordering required, that is
> writing to counter happens before setting theft to THEFT_READY in
> add_count/sub_count's fast path.

I'm kind of not 100% sure of your changes in count_lim_sig.c.
I'll comment in another mail.  That might take a while.

>                                  Therefore, partial memory barrier
> will suffice.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/count/count_lim_sig.c       | 10 +++-------
>  CodeSamples/count/count_stat_eventual.c |  6 ++----
>  count/count.tex                         |  9 ++++-----
>  3 files changed, 9 insertions(+), 16 deletions(-)
> 

[...]

> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 967644de..7157ee0e 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -51,8 +51,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
>  		WRITE_ONCE(global_count, sum);
>  		poll(NULL, 0, 1);
>  		if (READ_ONCE(stopflag)) {
> -			smp_mb();
> -			WRITE_ONCE(stopflag, stopflag + 1);
> +			smp_store_release(&stopflag, stopflag + 1);
>  		}
>  	}
>  	return NULL;
> @@ -73,9 +72,8 @@ void count_init(void)					//\lnlbl{init:b}
>  void count_cleanup(void)				//\lnlbl{cleanup:b}
>  {
>  	WRITE_ONCE(stopflag, 1);
> -	while (READ_ONCE(stopflag) < 3)
> +	while (smp_load_acquire(&stopflag) < 3)
>  		poll(NULL, 0, 1);
> -	smp_mb();
>  }							//\lnlbl{cleanup:e}
>  //\end{snippet}

So, you'd also need to update a paragraph in Section 5.2.4,
which currently reads:

    The count_cleanup() function on lines 48--54 coordinates termination.
    The calls to smp_mb() here and in eventual() ensure that all updates to
    global_count are visible to code following the call to count_cleanup().

And I think splitting the changes in count_stat_eventual.c and
count_lim_sig.c into individual patches would ease the review on
our side.

So, can you send a patch concerning count_stat_eventual.c
first ?

I'll comment on count_lim_sig.c later, that is, if Paul won't beat
me to it.

        Thanks, Akira
 

