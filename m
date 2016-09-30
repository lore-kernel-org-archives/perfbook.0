Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39412 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S935005AbcI3APZ (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 29
 Sep 2016 20:15:25 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8U0DIvn088329
 for <perfbook@vger.kernel.org>; Thu, 29 Sep 2016 20:15:24 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25s8sr9xg1-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 29 Sep 2016 20:15:24 -0400
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 29 Sep
 2016 18:15:23 -0600
Date: Thu, 29 Sep 2016 17:15:23 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] count: Enclose 'REQACK' in \mbox{}
Reply-To: paulmck@linux.vnet.ibm.com
References: <c2f828ca-14da-971e-427a-2edeb9d7e916@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2f828ca-14da-971e-427a-2edeb9d7e916@gmail.com>
Message-Id: <20160930001523.GH14933@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 29, 2016 at 11:23:53PM +0900, Akira Yokosawa wrote:
> >From 793c4a74be5cb0997b82789d19eebb2b7836d2fa Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 29 Sep 2016 23:17:12 +0900
> Subject: [PATCH] count: Enclose 'REQACK' in \mbox{}
> 
> This commit prevents "REQACK" from being hyphenated in Answer of
> Quick Quiz 5.47.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  count/count.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 39747d0..0eb95c3 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2641,7 +2641,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
>  		the fastpath.
>  	\item	The following race would result:
>  		\begin{enumerate}
> -		\item	The slowpath sets a given thread's state to REQACK.
> +		\item	The slowpath sets a given thread's state to \mbox{REQACK}.
>  		\item	That thread has just finished its fastpath, and
>  			notes the REQACK state.
>  		\item	The thread receives the signal, which also notes
> @@ -2652,7 +2652,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
>  		\item	The fastpath sets the state to READY, disabling
>  			further fastpath execution for this thread.
>  		\end{enumerate}
> -		The basic problem here is that the combined REQACK state
> +		The basic problem here is that the combined \mbox{REQACK} state
>  		can be referenced by both the signal handler and the
>  		fastpath.
>  		The clear separation maintained by the four-state
> -- 
> 2.7.4
> 

