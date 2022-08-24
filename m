Return-Path: <SRS0=kjfn=Y4=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qK9Gw7pqzHdFTxoztvVMpneb1XxcDh7mleQithOXo9A=;
        b=oy7lQTR+/oiWoPxdrNdZOZdAegh5j+y1vF5m4jNGc/3lolDBbs3qBW37b+LJbZgPPw
         neIFRaf6K9bJIADfsanrSrI+cUy3UhgK7QMhoLluJgbzZrKCDW3IZJSQSs6t1HbLVxBF
         JopScnGVHb87/CeScfvR7jJwnPV3S2fvShJ16ACc6YoAgPq73921/uCunZ8Jl04OVvPD
         D+tTkfCdAeX1aK9b3CBwcYzPxz23DLfIrigA9CwzKRGFDjacJhReWN8YT9gQJJmJz7Ds
         gyS/W2V5lEiudsGvQiJgEKSJ5L9hBV3A0/V/OU1WWpjgAvlPHVnNODyjXJRmt/f3Z3AJ
         d3Aw==
MIME-Version: 1.0
References: <f96b6945-0727-b9f2-c34b-0c58a508cd92@gmail.com>
In-Reply-To: <f96b6945-0727-b9f2-c34b-0c58a508cd92@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 24 Aug 2022 07:22:38 -0400
Message-ID: <CAJbg=FV20mZD0RfVFa7DWb4NDQE38B9V5mNU4FTVtFnZOmVF-A@mail.gmail.com>
Subject: Re: [PATCH -perfbook] count: Adjust index marker of _Thread_local
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Ah, yes, I was wondering what apig was. Now I get it.
Thanks, Akira.

--Elad

On Tue, 23 Aug 2022 at 22:43, Akira Yokosawa <akiyks@gmail.com> wrote:
>
> \apic{} is there for ISO C std APIs.  Use it.
>
> While we are here, fix a couple of minor nits:
>    - align //\lnlbl{var:b} in count_end.c;
>    - not line-break in front of \footnote{}, indent footnote text.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Fixes: 24e8f711d2cf ("count: Switch from GCC to C11 thread-local storage")
> Cc: Elad Lahav <e2lahav@gmail.com>
> ---
>  CodeSamples/count/count_end.c |  2 +-
>  count/count.tex               | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
> index 5e7b9ee1025c..b6ed851c35a9 100644
> --- a/CodeSamples/count/count_end.c
> +++ b/CodeSamples/count/count_end.c
> @@ -23,7 +23,7 @@
>  #include "../api.h"
>
>  //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
> -unsigned long _Thread_local counter = 0;               //\lnlbl{var:b}
> +unsigned long _Thread_local counter = 0;       //\lnlbl{var:b}
>  unsigned long *counterp[NR_THREADS] = { NULL };
>  unsigned long finalcount = 0;
>  DEFINE_SPINLOCK(final_mutex);                  //\lnlbl{var:e}
> diff --git a/count/count.tex b/count/count.tex
> index 775cf77e90a8..b2de4646b18f 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -721,12 +721,12 @@ This is the topic of the next section.
>  \subsection{Per-Thread-Variable-Based Implementation}
>  \label{sec:count:Per-Thread-Variable-Based Implementation}
>
> -The C language, since C11, features a \apig{_Thread_local} storage class that
> -provides per-thread storage.
> -\footnote{\GCC\ provides its own \apig{__thread} storage class, which was used
> -in previous versions of this book.
> -The two methods for specifying a thread-local variable are interchangeable
> -when using \GCC\@.}
> +The C language, since C11, features a \apic{_Thread_local} storage class that
> +provides per-thread storage.\footnote{
> +       \GCC\ provides its own \apig{__thread} storage class, which was used
> +       in previous versions of this book.
> +       The two methods for specifying a thread-local variable are
> +       interchangeable when using \GCC\@.}
>  This can be used as shown in
>  \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
>  to implement
>
> base-commit: ba01403b34de88d3060e119f899f5eb053c5f162
> --
> 2.25.1
>
