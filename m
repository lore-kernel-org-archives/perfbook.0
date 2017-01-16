Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50626 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750990AbdAPWoq (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 16
 Jan 2017 17:44:46 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0GMhkcf120620
 for <perfbook@vger.kernel.org>; Mon, 16 Jan 2017 17:44:11 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2812r0s5x7-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 16 Jan 2017 17:44:11 -0500
Received: from localhost by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 16 Jan
 2017 15:44:10 -0700
Date: Mon, 16 Jan 2017 14:44:07 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] glossary: Use proper quotation marks
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170116160906.22579-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170116160906.22579-1-sj38.park@gmail.com>
Message-Id: <20170116224407.GR5238@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 17, 2017 at 01:09:05AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued both, thank you!

							Thanx, Paul

> ---
>  glossary.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index 6e4a83798a3d..4dde152979f0 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -233,7 +233,7 @@
>  	expect~\cite{AndreasHaas2012FIFOisnt}.
>  \item[Lock:]
>  	A software abstraction that can be used to guard critical sections,
> -	as such, an example of a ''mutual exclusion mechanism''.
> +	as such, an example of a ``mutual exclusion mechanism''.
>  	An ``exclusive lock'' permits only one thread at a time into the
>  	set of critical sections guarded by that lock, while a
>  	``reader-writer lock'' permits any number of reading
> -- 
> 2.10.0
> 

