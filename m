Return-Path: <SRS0=UFo0=BL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684718334; x=1687310334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T79jZwMcT9rTe2+hRYtFAwSUI4lty8T3koXesnhnsPw=;
        b=rpMaafZHyYZJ5G9KPir5Vtj0auIVpFkWYERKURoPibeBBSt/CjrKa/eI+gT2zNTh8g
         Hk9VYiU1AimoyAOq9CEFl44k8AlhamvbqbYEQ50smaRX05U5nWE5AdDt1PPypKJI5Z5u
         EtE0phzA59Qg92cMWI1Ppc3ONb9AXz1AwY+pWzFihVVw1Fzu/7CPC5mNQ67SMqHIGXuM
         wS8c+BoSd/TKHQGrEERdiKhLkg7gkD69mLGp3wTxTAHydxWQX04zJf/A9RmMQotHZpUn
         rCFMn2jGLOlEHstGKUZ8MkXLuIsy6TuhuCp2gdkxYMesfi3JfvUamJpao915xRN9GuUc
         Xf1w==
Message-ID: <528192fd-8d2a-4006-2b5e-3a5cdb0de2a0@gmail.com>
Date: Mon, 22 May 2023 10:18:49 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] formal: Fix references
References: <20230521162417.3751-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230521162417.3751-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Sun, 21 May 2023 16:24:17 +0000, Alan Huang wrote:
> The two references are misplaced, this patch fixes that.

Nice catches!

As I made the mistake in commit 30db63ed4177
("formal/dyntickrcu: Cite git commits of dyntickrcu fixes"),
let me add a Fixes: tag along with my R-b.

Fixes: 30db63ed4177 ("formal/dyntickrcu: Cite git commits of dyntickrcu fixes")
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  formal/dyntickrcu.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index 42c0c55c..2d118e69 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -1132,7 +1132,7 @@ This effort provided some lessons (re)learned:
>  	In this case, the documentation effort located
>  	a misplaced memory barrier in
>  	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
> -	as shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
> +	as shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
>  
>  \begin{VerbatimU}
>   static inline void rcu_enter_nohz(void)
> @@ -1155,7 +1155,7 @@ This effort provided some lessons (re)learned:
>  	This effort located one subtle bug in
>  	\co{rcu_try_flip_waitack_needed()}
>  	that would have been quite difficult to test or debug, as
> -	shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
> +	shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
>  
>  \begin{VerbatimU}
>  -       if ((curr - snap) > 2 || (snap & 0x1) == 0)
