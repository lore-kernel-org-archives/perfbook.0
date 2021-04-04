Return-Path: <SRS0=kQd0=JB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Bw24JmMdJLd6HvnB4SS55Adp1TNIehEuflxEUNNALk=;
        b=pRjuRc0BIY2uZ0vyOgCW3l3raXllkzOhpBpGA2Jv8qkWpZYEqEbbbWAmn+f42NFtZM
         eI6SntGDSgzACkJ1A8k6lS0ukQDq6E5zcUkHTDBER96laVaOte/G15g2LDibr9UJ/BLW
         h2Lj5rTHtU5L7Ai/LpauslW82+HIlAMQdgMrVWEIwDzkaY2KCVmeXFhn5lg/NN36qJXh
         bofB/co1tEbn8FKOny6UEaqJnF0epCe2ivmcnaVHk/fDucrBNAFrUxs8sEosB/Frma4z
         ptGY14U5kjAGLRSf4JB1a+4o+mEyh2O3a4tJGP+Th7TpMj/tTuFawiXAf+OXyy6bAumT
         tpZA==
Subject: Re: [PATCH v2 1/4] howto: Use '\cref' and '\Cref' instead of
 'Chapter~\ref'
References: <20210404100503.20978-1-sj38.park@gmail.com>
 <20210404100503.20978-2-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <37416a08-7a16-7547-03bc-b00018b5bec7@gmail.com>
Date: Sun, 4 Apr 2021 19:47:32 +0900
MIME-Version: 1.0
In-Reply-To: <20210404100503.20978-2-sj38.park@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi SeongJae,

On Sun, 4 Apr 2021 12:05:00 +0200, SeongJae Park wrote:
> This commit replaces 'Chapter~\ref' with '\cref' and '\Cref'.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  howto/howto.tex | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

While we are here, could you please also replace "Appendix~\ref"
and "Listing~\ref" with \cref/\Cref?

I think those "clever" macros should work as you would expect.

And changes in howto.tex won't conflict with my pending
topic branch on indexing/acronyms.

        Thanks, Akira

> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 7de1dbd9..627ae776 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -56,22 +56,22 @@ that it has brought to us!
>  This book is a handbook of widely applicable and heavily
>  used design techniques, rather than
>  a collection of optimal algorithms with tiny areas of applicability.
> -You are currently reading Chapter~\ref{chp:How To Use This Book}, but
> +You are currently reading \cref{chp:How To Use This Book}, but
>  you knew that already.
> -Chapter~\ref{chp:Introduction} gives a high-level overview of parallel
> +\Cref{chp:Introduction} gives a high-level overview of parallel
>  programming.
>  
[...]

