Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40327 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfGUMHX (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 21 Jul 2019 08:07:23 -0400
Received: by mail-oi1-f194.google.com with SMTP id w196so6292367oie.7
        for <perfbook@vger.kernel.org>; Sun, 21 Jul 2019 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9zqWWzgXnmNUFgiaC4FLjYTqyVGvYNJip5oJJ1dQlY=;
        b=YikcJ7Zky6X9d0yOz4eB7QT5FvJZE2FOl9hMIW4bZ4qr0FC9p3gd7LqpV6+rejO8JK
         ZMey0z9jPsM30IOn+0c+RoMacCp0p6BXNjyOjKxPTBPaQhz5qoFYQyvVXX842FSHnFJm
         T5UmrP0aVeKW1RnsLnDy3/vqSpCdI9MGnpPQUYYvrNeiagMo9mS7Viqdfta/Q3Yiv8o0
         y/x2BBNeM5tjrrQWl5/fIMD53ZLMX1k4N7++94qyUOM9UDLaaimmwYr7eMdRoEVtB7X+
         pFVWSxpfnwL3/EBWbfkBNZq5/Tnf3zfJsDDX5K+2f5PfO94qYv7jisRKbaW/sud8qYCu
         8a5Q==
MIME-Version: 1.0
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com> <1cd27b04-dd6c-984a-9bce-56d3f6148e7d@gmail.com>
In-Reply-To: <1cd27b04-dd6c-984a-9bce-56d3f6148e7d@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 21 Jul 2019 20:07:11 +0800
Message-ID: <CABoNC80vzXtMx2_jW4Ln9c8JxSsAdT4uq2fxaFW=-HLvQtNhhA@mail.gmail.com>
Subject: Re: [PATCH 1/7] toyrcu: Convert Listing B.1 to new scheme
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org

Hi Akira,

Thanks for the patch. The new scheme worked great as a good example of
composing my commits. So,

Acked-by: Junchang Wang <junchangwang@gmail.com>


Thanks,
--Junchang

On Sun, Jul 21, 2019 at 8:02 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> From 245899f43fd007aa344180c0089515cd90f84db2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 27 Apr 2019 21:04:40 +0900
> Subject: [PATCH 1/7] toyrcu: Convert Listing B.1 to new scheme
>
> This commit was originally presented to Junchang as an example where
> code fragments extracted from two source files under CodeSamples/ are
> merged into a code snippet.
>
> Junchan employed this scheme in commits 686f3f3b721c ("rcu: Use
> READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr"),
> a26c1625bb0d ("rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared
> variable rcu_gp_ctr"), and b9696a4a456f ("rcu_nest: Update description
> of rcu_nest.[hc]").
>
> Extra vertical space needs to be canceled by the \vspace*{} command
> between the two \input{} commands.
> \fvset{firstnumber=last} is to continue line numbering.
> \fvset{firstnumber=auto} restores the default setting.
>
> Also tweak positioning option of the listing environment.
>
> Cc: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/defer/rcu_lock.c |  2 ++
>  CodeSamples/defer/rcu_lock.h |  2 ++
>  appendix/toyrcu/toyrcu.tex   | 26 ++++----------------------
>  3 files changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/CodeSamples/defer/rcu_lock.c b/CodeSamples/defer/rcu_lock.c
> index 8d45ac89..08b87fbd 100644
> --- a/CodeSamples/defer/rcu_lock.c
> +++ b/CodeSamples/defer/rcu_lock.c
> @@ -20,12 +20,14 @@
>
>  #include "../api.h"
>  #include "rcu_lock.h"
> +//\begin{snippet}[labelbase=ln:defer:rcu_lock:synchronize,commandchars=\\\[\]]
>
>  void synchronize_rcu(void)
>  {
>         spin_lock(&rcu_gp_lock);
>         spin_unlock(&rcu_gp_lock);
>  }
> +//\end{snippet}
>
>  #ifdef TEST
>  #include "rcutorture.h"
> diff --git a/CodeSamples/defer/rcu_lock.h b/CodeSamples/defer/rcu_lock.h
> index 224ea0e4..bf6f9b3c 100644
> --- a/CodeSamples/defer/rcu_lock.h
> +++ b/CodeSamples/defer/rcu_lock.h
> @@ -26,6 +26,7 @@ static void rcu_init(void)
>  {
>  }
>
> +//\begin{snippet}[labelbase=ln:defer:rcu_lock:lock_unlock,commandchars=\\\[\]]
>  static void rcu_read_lock(void)
>  {
>         spin_lock(&rcu_gp_lock);
> @@ -35,5 +36,6 @@ static void rcu_read_unlock(void)
>  {
>         spin_unlock(&rcu_gp_lock);
>  }
> +//\end{snippet}
>
>  extern void synchronize_rcu(void);
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index 0e84b058..d876595b 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -30,29 +30,11 @@ provides a summary and a list of desirable RCU properties.
>
>  \section{Lock-Based RCU}
>  \label{sec:app:toyrcu:Lock-Based RCU}
> +\NoIndentAfterThis
>
> -\begin{listing}[bp]
> -{ \scriptsize
> -\begin{verbbox}
> -  1 static void rcu_read_lock(void)
> -  2 {
> -  3   spin_lock(&rcu_gp_lock);
> -  4 }
> -  5
> -  6 static void rcu_read_unlock(void)
> -  7 {
> -  8   spin_unlock(&rcu_gp_lock);
> -  9 }
> - 10
> - 11 void synchronize_rcu(void)
> - 12 {
> - 13   spin_lock(&rcu_gp_lock);
> - 14   spin_unlock(&rcu_gp_lock);
> - 15 }
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\begin{listing}[htbp]
> +\input{CodeSamples/defer/rcu_lock@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
> +\input{CodeSamples/defer/rcu_lock@synchronize.fcv}\fvset{firstnumber=auto}
>  \caption{Lock-Based RCU Implementation}
>  \label{lst:app:toyrcu:Lock-Based RCU Implementation}
>  \end{listing}
> --
> 2.17.1
>
>

