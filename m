Return-Path: <SRS0=/lsJ=75=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680739767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNgnQIQpkZdV5lfuK7bZZzcsHA3UuCJhNCn+117EeHc=;
        b=DDFX+Ip4uCTmMWEG9eNJ/57D9v+DmqYKiB7LLosCmre7Mi+BEyigTFyJJkhI4Z6I+6
         Ond+c6zbMUT6BU/nqbo0OfvgagBJSTyeS87AuSfFZXKUa9F6mhTG9ZDRWqosVbUpkFSw
         YllZuAoz47mmXVXCdVSH/T/h2W6UBaX872aYlC2ljtiJ6dXV5rP35PHr36k0Yg/8wu1Q
         uAL9PCJaz1qKVr6OnEGKygMAU9sUHfVlyMNozrzmQYw6wlsKXUfWoqUDD0/zxQBpwO8J
         9mpon4L5izlmWCTJKx6MYsEPnxeRUdGt28nLbgJwmnjeXn47zyaFzPCGtGygkD8kWvnk
         jkBA==
Message-ID: <9a64ab8c-6894-ee88-91ae-1fa9b71bbf8a@gmail.com>
Date: Thu, 6 Apr 2023 09:09:22 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples/count: change full memory barrier to partial
 one
References: <20230405165641.1326208-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230405165641.1326208-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed,  5 Apr 2023 12:56:41 -0400, Alan Huang wrote:
> The original memory barriers in count_stat_eventual.c ensure
> writing to global_count happens before writing to stopflag and
> reading from stopflag happens before later reading from global_count.
> 
> Thus, smp_load_acquire and smp_store_release will suffice.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  CodeSamples/count/count_stat_eventual.c | 6 ++----
>  count/count.tex                         | 6 +++---
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
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
>  
> diff --git a/count/count.tex b/count/count.tex
> index 80ada104..8ab67e2e 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -1013,9 +1013,9 @@ between passes.
>  
>  The \co{count_cleanup()} function on
>  \clnrefrange{cleanup:b}{cleanup:e} coordinates termination.
> -The calls to \co{smp_mb()} here and in \co{eventual()} ensure
> -that all updates to \co{global_count} are visible to code following
> -the call to \co{count_cleanup()}.
> +The call to \co{smp_load_acquire()} here and the call to \co{smp_store_release()}
> +in \co{eventual()} ensure that all updates to \co{global_count} are visible
> +to code following the call to \co{count_cleanup()}.
>  
>  This approach gives extremely fast counter read-out while still
>  supporting linear counter-update scalability.

Looks good to me!  Thanks.

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
