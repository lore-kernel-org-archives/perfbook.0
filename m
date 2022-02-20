Return-Path: <SRS0=L4Oq=TD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=2ca3kJeJ49EbfJ7kVS7DupbFFY6GUreF9UNicjs4Ig0=;
        b=nSxjTDbmyhIr5599M3Tj8GuUhb8pEXYo/vJT6eF1TMQWNcmeM6CP/QViRtAAYDzH6s
         tee9qpbUlgaKhyGk+dDuppUad+OHDZV6DqPouQdxHhEwFY5MwTvI272UQSzUOrhd4+Bp
         OFIvDQixiR6jjZS6Joiy5rt9VKOGKKpQnnGeSDoWOFugxiWcrPImxm0W9+YNmKwQYFsg
         8UvCuWwuwMtYZCGFhPutVwLB5iBV6juxvX/XVc1FPT6nhYZ9Ta6ooTQ+BwimKgKoy4IB
         51Fkoe/mKwin62QILiP+bt8ssXeCP3Wm3N0A/icPgrxSr9piuIMHlMzTzX/5qEfAPiZS
         6c3A==
Message-ID: <f00893a2-bf04-8473-2268-530bf24f715c@gmail.com>
Date: Sun, 20 Feb 2022 20:51:21 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Q -perfbook] Extra \midrule in Table 9.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In commit 9c0c058db09d ("defer/rcuapi: Describe SRCU initialization and
cleanup"), you added a row in Table 9.2.

> --- a/defer/rcuapi.tex

> +++ b/defer/rcuapi.tex
> @@ -148,6 +148,14 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
>  		{\bf Tasks RCU Rude}: Free idle-task tracing trampolines &
>  		    {\bf Tasks RCU Trace}: Protect sleepable BPF programs \\
>  \midrule
> +{\bf Initialization and Cleanup} &
> +    &
> +	\tco{DEFINE_SRCU()} \tco{DEFINE_STATIC_SRCU()}
> +	\tco{init_srcu_struct()} \tco{cleanup_srcu_struct()} &
> +	    &
> +		&
> +		    \\
> +\midrule

Did you add this \midrule intentionally?
The added row looks similar to the rows below it.

        Thanks, Akira

>  {\bf Read-side critical-section markers} &
>      \tco{rcu_read_lock()}~! \tco{rcu_read_unlock()}~!
>      \tco{rcu_read_lock_bh()} \tco{rcu_read_unlock_bh()}

