Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60476 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1728083AbeGUTDW (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 21
 Jul 2018 15:03:22 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6LI92ne127909
 for <perfbook@vger.kernel.org>; Sat, 21 Jul 2018 14:09:46 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2kc6b65eau-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sat, 21 Jul 2018 14:09:46 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 21 Jul
 2018 14:09:45 -0400
Date: Sat, 21 Jul 2018 11:09:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Fix a mistake about line number pointing
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180721180410.20353-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180721180410.20353-1-sj38.park@gmail.com>
Message-Id: <20180721180941.GF12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 22, 2018 at 03:04:10AM +0900, SeongJae Park wrote:
> Fixes: c88cc9eba7a5 ("toolsoftrade: Give a forward reference for READ_ONCE() and WRITE_ONCE()")
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Hmmm...  There is both a READ_ONCE() and a WRITE_ONCE() on line 41, so
the original is accurate.  That said, this might be an indication that the
question is confusing.  If so, would you like to take a shot at rewording?

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 00db182..f02d339 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -629,7 +629,7 @@ primitives.
>  } \QuickQuizEnd
> 
>  \QuickQuiz{}
> -	What is the \co{READ_ONCE()} on lines~17 and~41 and the
> +	What is the \co{READ_ONCE()} on lines~17 and the
>  	\co{WRITE_ONCE()} on line~41 of
>  	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
>  \QuickQuizAnswer{
> -- 
> 2.10.0
> 

