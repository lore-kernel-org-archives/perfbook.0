Return-Path: <SRS0=89ej=AU=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682811698; x=1685403698;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C0N8/Og9+LMG6mUtYUeynCGimZATm82KuIIGD8P+LI8=;
        b=EoRNiftZAa0JJhA3JRW1NGk+Phpo+duwFyFSNClp/cNkd3Bsg5t4nPoJfVIHv7qCUC
         cdIgrf2R+Uv8k9AF17Z7nTI/Sx7XHjgzKj8GTJ/S9zcYVLhnE32tFFl6xY2N7VltKqLO
         dst40I1Xe1x2ahsiCvYTHu7O1gRQcZ794qf0Yj/BnTeJBgCU7aX1xo5uli/I1+2bb9s/
         nJ90TqLw6Tl3suNnQwOxSLaBhxQzYzZEAUCRyqDyTlG0Qpn7HllutD0iO5ZrxiAgfInG
         yWfa5zYjGdKvrBgFbsKhph/WwShzj1Tej1oaGAPEVjMYaocqB66QfZbCagt4ClALxGVv
         rlKQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH -perfbook 2/7] formal/ppcmem: Use \qco{} as intended
Date: Sat, 29 Apr 2023 16:41:37 -0700
Message-Id: <20230429234137.18677-1-sj@kernel.org>
In-Reply-To: <46c02030-ceca-2547-7b68-1e8642ae18fa@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, 30 Apr 2023 08:07:18 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> Commit f87fadc4c8ea ("formal/ppcmem: Use \qco{} instead of ``\co{}''")
> did not use \qco{} in one of the hunks.
> 
> Use \qco{} as intended.

Nice catch!  Thank you for this fix!

> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: SeongJae Park <sj38.park@gmail.com>

Reviewed-by: SeongJae Park <sj38.park@gmail.com>


Thanks,
SJ

> ---
>  formal/ppcmem.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
> index 10526bca88ae..9d7704fa43d0 100644
> --- a/formal/ppcmem.tex
> +++ b/formal/ppcmem.tex
> @@ -99,7 +99,7 @@ exists						@lnlbl[assert:b]
>  
>  \begin{fcvref}[ln:formal:PPCMEM Litmus Test]
>  In the example, \clnref{type} identifies the type of system (\qco{ARM} or
> -\co{PPC}) and contains the title for the model.
> +\qco{PPC}) and contains the title for the model.
>  \Clnref{altname} provides a place for an
>  alternative name for the test, which you will usually want to leave
>  blank as shown in the above example.
> -- 
> 2.25.1
> 
> 
