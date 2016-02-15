Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:52476 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751667AbcBOGMs (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 15 Feb 2016
 01:12:48 -0500
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 14 Feb
 2016 23:12:47 -0700
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 0D3CB19D803F	for <perfbook@vger.kernel.org>; Sun, 14 Feb 2016 23:00:42 -0700
 (MST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1F6CivF33882352	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 06:12:44
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1F6Ch9N002785	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 01:12:43
 -0500
Date: Sun, 14 Feb 2016 22:12:48 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] cpu: rearrange summary of chapter
Message-ID: <20160215061248.GY6719@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1455406117-6924-1-git-send-email-sj38.park@gmail.com>
 <1455406117-6924-2-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455406117-6924-2-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 14, 2016 at 08:28:37AM +0900, SeongJae Park wrote:
> Summary of chapter and introduction about following chapters is in the
> end part of `swdesign.tex` though it is not software design specific
> content.  Moreover, the detailed introduction about following chapters
> is in `cpu.tex`, too.  It would be better to gather them in one `tex`
> file.  This commit gather them in `cpu.tex`.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

I hesitated before taking this, as I am not much on pure code-motion
patches, but did eventually queue it.  Thank you!

							Thanx, Paul

> ---
>  cpu/cpu.tex      | 13 +++++++++++++
>  cpu/swdesign.tex | 13 -------------
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/cpu/cpu.tex b/cpu/cpu.tex
> index 6f1ae54..d765e71 100644
> --- a/cpu/cpu.tex
> +++ b/cpu/cpu.tex
> @@ -43,6 +43,19 @@ text~\cite{Hennessy95a}.
>  \input{cpu/hwfreelunch}
>  \input{cpu/swdesign}
> 
> +So, to sum up:
> +
> +\begin{enumerate}
> +\item	The good news is that multicore systems are inexpensive and
> +	readily available.
> +\item	More good news:  The overhead of many synchronization operations
> +	is much lower than it was on parallel systems from the early 2000s.
> +\item	The bad news is that the overhead of cache misses is still high,
> +	especially on large systems.
> +\end{enumerate}
> +
> +The remainder of this book describes ways of handling this bad news.
> +
>  In particular,
>  Chapter~\ref{chp:Tools of the Trade} will cover some of the low-level
>  tools used for parallel programming,
> diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
> index cdae106..4e9e91d 100644
> --- a/cpu/swdesign.tex
> +++ b/cpu/swdesign.tex
> @@ -88,16 +88,3 @@ problem into one for which an embarrassingly parallel solution exists.
>  	techniques to be used on the non-performance-critical bulk of
>  	the program.
>  } \QuickQuizEnd
> -
> -So, to sum up:
> -
> -\begin{enumerate}
> -\item	The good news is that multicore systems are inexpensive and
> -	readily available.
> -\item	More good news:  The overhead of many synchronization operations
> -	is much lower than it was on parallel systems from the early 2000s.
> -\item	The bad news is that the overhead of cache misses is still high,
> -	especially on large systems.
> -\end{enumerate}
> -
> -The remainder of this book describes ways of handling this bad news.
> -- 
> 1.9.1
> 

