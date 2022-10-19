Return-Path: <SRS0=So6Q=2U=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0e0OhMMtMo/GXsigz/odl8kkKcGRKX97tmOP8ke6zs=;
        b=Y05eGNhHojWTYVaxk0M0eo9tnf4W5LbcAtFEJmq5QvNbmi+Qs0UWc3dsU5zNvQNXA2
         aEY7e0WEtaT5EIxVie4lNIxZPlD2x5yuInuG60ITSKfY8Z2pksrAwLPgDc+GxAgUtcvi
         gp72C0H86ROL54qRE6it9LL2FhXOwrfLAcmUYeiKCukOrBXPy7GKT95yeeVpqTD4w77T
         pL5BuwXffqWRmf2iuEXK06GNuYGrVSsLCVOZPG8Y7SoVD8fS4R8JZWGYEqoLjfa4hQQk
         rzEMhUZrwKfZKTJqCfmwBihZu3PHORyi0XufOGQrPC7XcvWhWs9fZkjIGxzj5I6c6OTq
         pj0Q==
Message-ID: <fdb0fd83-5cbc-eda2-c127-3d4a26ded8ad@gmail.com>
Date: Wed, 19 Oct 2022 21:47:11 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook] memorder: fix a typo in Listing 15.25's caption
References: <20221019084442.8025-1-zhouzhouyi@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221019084442.8025-1-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com
List-ID: <perfbook.vger.kernel.org>

Hi,

On Wed, 19 Oct 2022 16:44:42 +0800, Zhouyi Zhou wrote:
> Caption of Listing 15.25 should be "Z6.2 Release-Acquire Chain (Ordering?)"
> instead of "Z6.0 Release-Acquire Chain (Ordering?)"
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul and Akira:
> 
> I guess there is a typo in caption of listing 15.25

Nice catch!

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira
> 
> Many thanks
> Zhouyi
> --
>  memorder/memorder.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 28319bfb..0c96d43b 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2325,14 +2325,14 @@ prevents the \co{exists} clause on \clnref{exists} from triggering.
>  
>  \begin{listing}
>  \input{CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o@whole.fcv}
> -\caption{Z6.0 Release-Acquire Chain (Ordering?)}
> -\label{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)}
> +\caption{Z6.2 Release-Acquire Chain (Ordering?)}
> +\label{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)}
>  \end{listing}
>  
>  \QuickQuiz{
>  	Suppose we have a short release-acquire chain along with one
>  	load-to-store link and one store-to-store link, like that shown in
> -	\cref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)}.
> +	\cref{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)}.
>  	Given that there is only one of each type of non-store-to-load
>  	link, the \co{exists} cannot trigger, right?
>  }\QuickQuizAnswer{
> @@ -2345,7 +2345,7 @@ prevents the \co{exists} clause on \clnref{exists} from triggering.
>  	thereof, it is necessary to have at least one full barrier
>  	(\co{smp_mb()} or better) between each non-store-to-load link.
>  	In
> -	\cref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)},
> +	\cref{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)},
>  	preventing the \co{exists} clause from triggering therefore requires
>  	an additional full barrier between either \co{P0()}'s or
>  	\co{P1()}'s accesses.
