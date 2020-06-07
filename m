Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbgFGSk7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 7 Jun 2020 14:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591555258;
        bh=nX0ZMaXA8yqYexIV1BNy4Shu7Q8pbk2Ni8hmPnySfbI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SKbnZFVt7Gj0z96FBvXeqV5q7qbpY8mF9ogl23p0NmCUrA5009KSuHK7qNsz3Edn4
         CiyGw5FYiXA7pwzzE57VJuSmV0XgfVHUusdlm7eIg8cUg8IwLEpteEMEMTckq4uXF5
         T4a5ZFsSA5bp4yCf4x5absEsjHTOmAW43amx5FVA=
Date: Sun, 7 Jun 2020 11:40:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] defer/rcuusage: Fix minor issues
Message-ID: <20200607184058.GF4455@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <13411f41-7969-541d-485c-73aad77f9674@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13411f41-7969-541d-485c-73aad77f9674@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jun 07, 2020 at 07:29:00PM +0900, Akira Yokosawa wrote:
> >From c1abebc5482939250f26cb46f4f915ddb6e9b2d5 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 7 Jun 2020 19:06:25 +0900
> Subject: [PATCH] defer/rcuusage: Fix minor issues
> 
> Fix minor issues in recently updated rcuusage section including:
> 
>     o Use of nbsp
>     o Order of references to figures
>     o A couple of typo
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Applied and pushed, thank you!

							Thanx, Paul

> ---
>  defer/rcuusage.tex | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 55771415..d90ab2b3 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -105,9 +105,9 @@ and especially
>  Figure~\ref{fig:defer:QSBR: Waiting for Pre-Existing Readers},
>  for a discussion of RCU QSBR.)
>  
> -The answer to this shown in
> +The answer to this is shown in
>  Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
> -which shows that RCU QSBR's performance and scalability actuaally exceeds
> +which shows that RCU QSBR's performance and scalability actually exceeds
>  that of the ideal synchronization-free workload.
>  
>  \QuickQuizSeries{%
> @@ -356,7 +356,7 @@ than RCU on a single CPU, and is more than \emph{four} orders of magnitude
>  slower on 192~CPUs.
>  In contrast, RCU scales quite well.
>  In both cases, the error bars cover the full range of the measurements
> -from 30 runs, with the line being the median.
> +from 30~runs, with the line being the median.
>  
>  \begin{figure}[tb]
>  \centering
> @@ -394,8 +394,8 @@ The error bars span the full range of data.
>  \end{figure}
>  
>  Of course, the low performance of reader-writer locking in
> -Figures~\ref{fig:defer:Performance Advantage of Preemptible RCU Over Reader-Writer Locking}
> -and~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}
> +\cref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking,%
> +fig:defer:Performance Advantage of Preemptible RCU Over Reader-Writer Locking}
>  is exaggerated by the unrealistic zero-length critical sections.
>  The performance advantages of RCU decrease as the overhead of the critical
>  sections increase.
> @@ -825,13 +825,13 @@ But why bother?
>  Again, part of the answer is performance, as shown in
>  Figures~\ref{fig:defer:Performance of RCU vs. Reference Counting}
>  and~\ref{fig:defer:Performance of Preemptible RCU vs. Reference Counting},
> -again showing data taken on a 488-CPU 2.1\,GHz Intel x86 system
> +again showing data taken on a 448-CPU 2.1\,GHz Intel x86 system
>  for non-preemptible and preemptible Linux-kernel RCU, respectively.
>  Non-preemptible RCU's advantage over reference counting ranges from
>  more than an order of magnitude at one CPU up to about four orders of
> -magnitude at 192 CPUs.
> +magnitude at 192~CPUs.
>  Preemptible RCU's advantage ranges from about a factor of three at
> -one CPU up to about three orders of magnitude at 192 CPUs.
> +one CPU up to about three orders of magnitude at 192~CPUs.
>  
>  \begin{figure}[tb]
>  \centering
> @@ -902,9 +902,9 @@ misleading.
>  Perhaps the best way to think of the relationship between RCU
>  and automatic garbage collectors (GCs) is that RCU resembles
>  a GC in that the \emph{timing} of collection is automatically
> -determined, but that RCU differs from a GC in that: (1) the programmer
> +determined, but that RCU differs from a GC in that: (1)~the programmer
>  must manually indicate when a given data structure is eligible
> -to be collected, and (2) the programmer must manually mark the
> +to be collected, and (2)~the programmer must manually mark the
>  RCU read-side critical sections where references might legitimately
>  be held.
>  
> @@ -1140,7 +1140,7 @@ for the duration of any pre-existing RCU read-side critical sections.
>  
>  These algorithms typically use a validation step that checks to make
>  sure that the newly referenced data structure really is the one that
> -was requested~\cite[Section 2.5]{LaninShasha1986TSM}.
> +was requested~\cite[Section~2.5]{LaninShasha1986TSM}.
>  These validation checks require that portions of the data structure
>  remain untouched by the free-reallocate process.
>  Such validation checks are usually very hard to get right, and can
> -- 
> 2.17.1
> 
