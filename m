Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kzr5gtnYUPLzLEIjlDUMAAg+tfvtqQvJMIWlGi/E0N0=;
        b=aI3DTyIzqystaflgQVQvw3aammLFcY27xggyGyAZYpyaYA4odtr87TU7xoqPpEWGkl
         Ob5H+prqNv0VWvs12t69haEp5ORscLysGewTyt5geelXa/NuXHkBqmBwUokAUUWwEKms
         sbZrRyurbshJ50un7o1KBKDB4B+D9IPeMiKK26DIZ/WN3yWeeB4+WqH4CKVK/Sq8ZzkR
         1jtFuAbvCw+0OdwtsWYwfqUtDj6CFF92lEw3IMQYy0LscB41399khQcbtShj5EXmZATX
         R8fJaFtf++8EdEacYLEBHsqXXOir+VDNlwvwJB8szpILSLltqfjV+on4ulEPTs3+siEe
         tEEQ==
MIME-Version: 1.0
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com> <e6cd44c9-6561-3a71-159c-dc2ffe7d312c@gmail.com>
In-Reply-To: <e6cd44c9-6561-3a71-159c-dc2ffe7d312c@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 21 Jul 2019 20:10:18 +0800
Message-ID: <CABoNC80wE257-WN0__BXu+vt4kHpc9ozvqHr4tTBuzj44g=-VA@mail.gmail.com>
Subject: Re: [PATCH 2/7] toyrcu: Extract Listing B.15 from rcu_nest.h
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks for helping complete applying the new scheme on rcu_nest. The
patch looks good to me.

Thanks,
--Junchang

On Sun, Jul 21, 2019 at 8:03 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> From d89573cab1299a8b8dfc731caa24057249c88296 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 2 Jun 2019 23:55:49 +0900
> Subject: [PATCH 2/7] toyrcu: Extract Listing B.15 from rcu_nest.h
>
> Commit b9696a4a456f ("rcu_nest: Update description of rcu_nest.[hc]")
> updated B.16 to reflect the changes in rcu_nest.[hc]. For consistency,
> extract Listing B.15 from rcu_nest.h.
>
> Cc: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/defer/rcu_nest.h |  2 ++
>  appendix/toyrcu/toyrcu.tex   | 13 +------------
>  2 files changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
> index 19a09568..3c5a5207 100644
> --- a/CodeSamples/defer/rcu_nest.h
> +++ b/CodeSamples/defer/rcu_nest.h
> @@ -24,6 +24,7 @@
>  #define ULONG_CMP_GE(a, b)      (ULONG_MAX / 2 >= (a) - (b))
>  #define ULONG_CMP_LT(a, b)      (ULONG_MAX / 2 < (a) - (b))
>
> +//\begin{snippet}[labelbase=ln:defer:rcu_nest:define,commandchars=\%\@\$]
>  DEFINE_SPINLOCK(rcu_gp_lock);
>  #define RCU_GP_CTR_SHIFT 7
>  #define RCU_GP_CTR_BOTTOM_BIT (1 << RCU_GP_CTR_SHIFT)
> @@ -31,6 +32,7 @@ DEFINE_SPINLOCK(rcu_gp_lock);
>  #define MAX_GP_ADV_DISTANCE (RCU_GP_CTR_NEST_MASK << 8)
>  unsigned long rcu_gp_ctr = 0;  /* increment by RCU_GP_CTR_BOTTOM_BIT each gp. */
>  DEFINE_PER_THREAD(unsigned long, rcu_reader_gp);
> +//\end{snippet}
>
>  static inline int rcu_gp_ongoing(int cpu)
>  {
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index d876595b..81f222c6 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -1360,18 +1360,7 @@ variables.
>  \label{sec:app:toyrcu:Nestable RCU Based on Free-Running Counter}
>
>  \begin{listing}[tb]
> -{ \scriptsize
> -\begin{verbbox}
> -  1 DEFINE_SPINLOCK(rcu_gp_lock);
> -  2 #define RCU_GP_CTR_SHIFT 7
> -  3 #define RCU_GP_CTR_BOTTOM_BIT (1 << RCU_GP_CTR_SHIFT)
> -  4 #define RCU_GP_CTR_NEST_MASK (RCU_GP_CTR_BOTTOM_BIT - 1)
> -  5 long rcu_gp_ctr = 0;
> -  6 DEFINE_PER_THREAD(long, rcu_reader_gp);
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\input{CodeSamples/defer/rcu_nest@define.fcv}
>  \caption{Data for Nestable RCU Using a Free-Running Counter}
>  \label{lst:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}
>  \end{listing}
> --
> 2.17.1
>
>

