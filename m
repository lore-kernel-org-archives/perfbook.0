Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:37112 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1753403AbcEWQ6f (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 23 May 2016
 12:58:35 -0400
Received: from localhost	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 23 May
 2016 10:58:34 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 7E61B1FF0068	for <perfbook@vger.kernel.org>; Mon, 23 May 2016 10:58:14 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4NGwSff19857516	for <perfbook@vger.kernel.org>; Mon, 23 May 2016 16:58:28
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4NGwSV0006765	for <perfbook@vger.kernel.org>; Mon, 23 May 2016 12:58:28
 -0400
Date: Mon, 23 May 2016 09:58:28 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpu: Add citation of HP11
Message-ID: <20160523165828.GD3825@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <9cd19ab1-37ce-b528-fddc-919e88a21bfc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cd19ab1-37ce-b528-fddc-919e88a21bfc@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 22, 2016 at 12:57:44PM +0900, Akira Yokosawa wrote:
> >From ffbc919394b33fd71a2ee0203083b0d7388d541d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 5 May 2016 11:59:04 +0900
> Subject: [PATCH] cpu: Add citation of HP11
> 
> Latest edition of Hennessy and Patterson's "Computer Architecture"
> is Fifth edition (2011). This commit adds a citation of it in
> Chapter 3.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

I had to split this patch to accommodate my centralized LaTeX bibliography
setup, hope that is OK.

							Thanx, Paul

> ---
>  bib/hw.bib  | 7 +++++++
>  cpu/cpu.tex | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/bib/hw.bib b/bib/hw.bib
> index 943206a..4c3f418 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -74,6 +74,13 @@ year="1992"
>  ,publisher="Morgan Kaufman"
>  }
> 
> +@Book{Hennessy2011
> +,author="John L. Hennessy and David A. Patterson"
> +,title="Computer Architecture, Fifth Edition: A Quantitative Approach"
> +,year="2011"
> +,publisher="Morgan Kaufman"
> +}
> +
>  @Book{DavidECuller1999
>  ,author="David E. Culler and Jaswinder Pal Singh and Anoop Gupta"
>  ,title="Parallel Computer Architecture: a Hardware/Software Approach"
> diff --git a/cpu/cpu.tex b/cpu/cpu.tex
> index 04cca00..b9c7ef2 100644
> --- a/cpu/cpu.tex
> +++ b/cpu/cpu.tex
> @@ -15,7 +15,7 @@ within a shared-memory system.
>  These few pages can do no more than scratch the surface of shared-memory
>  parallel hardware design; readers desiring more detail would do well
>  to start with a recent edition of Hennessy and Patterson's classic
> -text~\cite{Hennessy95a}.
> +text~\cite{Hennessy2011,Hennessy95a}.
> 
>  \QuickQuiz{}
>  	Why should parallel programmers bother learning low-level
> -- 
> 1.9.1
> 

