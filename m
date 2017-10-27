Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y0uwZSLMSnkeO3WplQZZKG1QL4vnja0C++MqfFKGicM=;
 b=D4GFo9dp8DRyWy+DpQ4UMl0scAPERLWX0/LulyRf6TsA6ieXYTtp7hxm4epVh+6Lfb
 a+jRrif0IzbSgiBWh3c1tbdQlQJkqcq3zGP3wi97yTdkr8NfTQrhWmA8eVW36t66AhNR
 5YsNgVYrv3sT5ohdfM7uzNoVwHgtQcTZkN4x2mArdBCJJ/P+97QN3RCP/2KZICxKrWdK
 zIMFN2v971O7fLqrpl1hRbIb+vPuaSJcoPttdHheFWcS/FsY9CaunrDuFhTAhoY41kdO
 IZTOqzxKalEnjdjckWoc5DSs5x+gokVvLtMRT90V9MugsWkWQFaiFA8W+FjKUCEzz2RJ
 UF0Q==
Subject: Re: [PATCH] typo at Chp 7.
References: <20171027092317.GA8509@HP> <20171027093317.GB8509@HP>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a15a6a6b-010b-6284-41fb-23ab36a39aa5@gmail.com>
Date: Sat, 28 Oct 2017 00:18:47 +0900
MIME-Version: 1.0
In-Reply-To: <20171027093317.GB8509@HP>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/27 18:33, Yubin Ruan wrote:
> And here are some more modification to some wording in chapter 7, but I am not
> sure whether you like it or not.
> 
> Anyway, chapter 7 makes me feel good ;-) It makes me know that home-brewing a
> lock primitives with atomic instructions(which is what I was doing) is
> something that is possible and used in production.
> 
> Thanks,
> Yubin
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 14db27d..a9f46f1 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -2166,8 +2166,8 @@ Signal-handler deadlocks can be explicitly avoided as follows:
>  	of a signal handler.
>  \item	If the application invokes the library function
>  	while holding a lock acquired within a given signal
> -	handler, then that signal must be blocked every time that the
> -	library function is called outside of a signal handler.
> +	handler, then that signal must be blocked every time that lock
> +    is to be acquired outside of a signal handler.

The talking point here is library function and signal handler. So something like:

+	handler, then that signal must be blocked every time that one
+	of related library functions is called outside of the signal handler.

Thoughts?

        Thanks, Akira

>  \end{enumerate}
> 
>  These rules can be enforced by using tools similar to
> @@ -2329,7 +2329,7 @@ locking's villainy.
>  If there are a very large number of uses of a callback-heavy library,
>  it may be wise to again add a parallel-friendly API to the library in
>  order to allow existing users to convert their code incrementally.
> -Alternatively, some advocate use of transactional memory in these cases.
> +Alternatively, some advocate using transactional memory in these cases.

Or may be the following?

+Alternatively, some advocate the use of transactional memory in these cases.

Either looks OK to me.

       Thanks, Akira

>  While the jury is still out on transactional memory,
>  Section~\ref{sec:future:Transactional Memory} discusses its strengths and
>  weaknesses.
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

