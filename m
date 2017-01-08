Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41078 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751620AbdAHVYB (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 8
 Jan 2017 16:24:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v08LINqO005774
 for <perfbook@vger.kernel.org>; Sun, 8 Jan 2017 16:24:00 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27usd1pq51-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 08 Jan 2017 16:23:59 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 8 Jan 2017
 14:23:59 -0700
Date: Sun, 8 Jan 2017 13:23:53 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] appendix/questions: Add missing NBSPs
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170108163445.26748-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170108163445.26748-1-sj38.park@gmail.com>
Message-Id: <20170108212353.GR3800@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 09, 2017 at 01:34:45AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued and pushed, thank you, SeongJae!

							Thanx, Paul

> ---
>  appendix/questions/after.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
> index cbba768dd443..e648667614a4 100644
> --- a/appendix/questions/after.tex
> +++ b/appendix/questions/after.tex
> @@ -184,13 +184,13 @@ SMP code?
>  Simply use SMP primitives as designed.
> 
>  In this example, the easiest fix is to use locking, for example,
> -acquire a lock in the producer before line 10 in
> +acquire a lock in the producer before line~10 in
>  Figure~\ref{fig:app:questions:After Producer Function} and in
>  the consumer before line~13 in
>  Figure~\ref{fig:app:questions:After Consumer Function}.
>  This lock must also be released after line~13 in
>  Figure~\ref{fig:app:questions:After Producer Function} and
> -after line 17 in
> +after line~17 in
>  Figure~\ref{fig:app:questions:After Consumer Function}.
>  These locks cause the code segments in lines~10-13 of
>  Figure~\ref{fig:app:questions:After Producer Function} and in lines~13-17 of
> -- 
> 2.10.0
> 

