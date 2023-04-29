Return-Path: <SRS0=89ej=AU=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682811604; x=1685403604;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NL6LyS7ITNemiU2yoox6uJ5dFw9F9rezGbYWozwhETc=;
        b=M7XfyV+nKYZbRp/mpgXsxFCX6TXttubfgkoScS4OWc8KCLP0NqjD8q0ewxQD9fL7Tt
         9UAeFbqoGWNdGi2f22EtXcDcOsm0LzY04DRcQqjO5KVLP/ENdpg4kXM2A+I6a+qLvhPE
         dr2KWW4+fx0UuDk4uUqpDOc8k52hQXNF12fSsyI9t3yXnLABkAqNEr/aQcIpUffjCV5n
         i1Qe6nis2dEPDpBbX0OkOkzF/YUxrLf6zbeU/w+tSR5WvOo0+3pM9yWssLaT9Xqx7V2F
         +hOkIy8jYoq/MMg7fmjHmIIWe5vpZOBsMdxvdnyaIn8zT39qQglgOwEWZbB2c1Hd9CB+
         ewPg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH -perfbook 1/7] formal/spinhint: Don't use \qco{} for long message
Date: Sat, 29 Apr 2023 16:40:02 -0700
Message-Id: <20230429234002.18552-1-sj@kernel.org>
In-Reply-To: <8e1a521a-7d95-ebf6-e783-6a15c01a43a5@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, 30 Apr 2023 08:05:30 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> \qco{} is intended to be used for short snippets and suppresses line
> breaks in its argument by using \nbco{} in its definition.
> Commit 88fd12717c61 ("formal/spinhint: Use \qco{} instead of``\co{}''")
> applied \qco{} for a long error message.
> It causes "Underfull \hbox" of large badness preceding it.
> 
> In perfbook-1c.log and perfbook-eb.log:
> 
>     Underfull \hbox (badness 10000) in paragraph at lines 277--281
>     []\T1/ntxtlf/m/n/10 (+20) If you see a mes-sage from [][][][] say-ing:
>      []
> 
> In perfbook.log:
> 
>     Underfull \hbox (badness 2495) in paragraph at lines 277--281
>     []\T1/ntxtlf/m/n/10 (+20) If you see a mes-sage from [][][][] say-ing:
>      []
> 
> Revert the change and permit line breaks in the middle of the quoted
> message.

Thank you for fixing this, Akira!

> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: SeongJae Park <sj38.park@gmail.com>

Reviewed-by: SeongJae Park <sj38.park@gmail.com>


Thanks,
SJ

> ---
>  formal/spinhint.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index 9bb5f5749470..16764aef8620 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -275,7 +275,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
>  	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
>  
>  	If you see a message from \co{./pan} saying:
> -	\qco{error: max search depth too small}, you need to increase
> +	``\co{error: max search depth too small}'', you need to increase
>  	the maximum depth by a \co{-mN} option for a complete search.
>  	The default is \co{-m10000}.
>  
> -- 
> 2.25.1
> 
> 
