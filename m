Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbU0EXv/SrhE2777eDnYvA2Xo8bspbSf+ir99TGM9/M=;
        b=seiGdkgHv+mhF7tnaFE78tRASToRTAL3oevRNavHjAgwAKJsqaxHlq4GtgQMSygKnq
         PNvAZ/GZ3Dc5xdCL2GD+hiAwF2/OpdqvKkThfmV3mKIVZbHwe7dvcJqTyULou5aWPDfs
         qtik9ub3JpiFNqHR2kZO9U/sDhXFvQxN2MjAC+gA6VCjKWyWV+wIfE5bCHL55s8VHoyZ
         Rb1SRDITbU9M3rO8WpryMimGKWmto2NIJHWWdQ8ECEJ6nftmPF75EKX3NKSVtzwY1Glr
         ADi7Uad3QoUfD78Lu/qemGo4wkXWbm7a6cIBmZprtsJqE7X16VEdJOWgJW9oFqXdOEs7
         rn4w==
MIME-Version: 1.0
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com> <84ebfab3-1c39-295e-19b4-86063f230018@gmail.com>
In-Reply-To: <84ebfab3-1c39-295e-19b4-86063f230018@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 21 Jul 2019 20:12:18 +0800
Message-ID: <CABoNC80uQutLiSZDZ+0YHmByv400ivz+-QTQhxm6-HUUt+e5fA@mail.gmail.com>
Subject: Re: [PATCH 6/7] toyrcu: Extract Listing B.13 from rcu.h
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

This patch also looks good to me. Thanks, Akira!

--Junchang

On Sun, Jul 21, 2019 at 8:12 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> From f37685cb3821daf0d9ee55a538ec462e5de0a6a8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 4 Jun 2019 00:35:02 +0900
> Subject: [PATCH 6/7] toyrcu: Extract Listing B.13 from rcu.h
>
> Commit 686f3f3b721c ("rcu: Use READ_ONCE() and WRITE_ONCE() for
> shared variable rcu_gp_ctr") updated B.14 to reflect the changes
> in rcu.[hc]. For consistency, extract Listing B.13 from rcu.h.
>
> Cc: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/defer/rcu.h    |  2 ++
>  appendix/toyrcu/toyrcu.tex | 11 +----------
>  2 files changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
> index 3641c33a..b3c3e2c4 100644
> --- a/CodeSamples/defer/rcu.h
> +++ b/CodeSamples/defer/rcu.h
> @@ -20,10 +20,12 @@
>
>  #include "rcu_pointer.h"
>
> +//\begin{snippet}[labelbase=ln:defer:rcu:define,commandchars=\%\@\$]
>  DEFINE_SPINLOCK(rcu_gp_lock);
>  long rcu_gp_ctr = 0;   /* always even, +=2 at start of each grace period. */
>  DEFINE_PER_THREAD(long, rcu_reader_gp);
>  DEFINE_PER_THREAD(long, rcu_reader_gp_snap);
> +//\end{snippet}
>
>  static inline void rcu_init(void)
>  {
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index 81f222c6..f6ce2bee 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -1185,16 +1185,7 @@ thread-local accesses to one, as is done in the next section.
>  \label{sec:app:toyrcu:RCU Based on Free-Running Counter}
>
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}
> -  1 DEFINE_SPINLOCK(rcu_gp_lock);
> -  2 long rcu_gp_ctr = 0;
> -  3 DEFINE_PER_THREAD(long, rcu_reader_gp);
> -  4 DEFINE_PER_THREAD(long, rcu_reader_gp_snap);
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\input{CodeSamples/defer/rcu@define.fcv}
>  \caption{Data for Free-Running Counter Using RCU}
>  \label{lst:app:toyrcu:Data for Free-Running Counter Using RCU}
>  \end{listing}
> --
> 2.17.1
>
>
