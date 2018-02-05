Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38318 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752838AbeBEBcP (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 4 Feb 2018 20:32:15 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w151Sne2129051
 for <perfbook@vger.kernel.org>; Sun, 4 Feb 2018 20:32:15 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2fxdbdrkqj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 04 Feb 2018 20:32:14 -0500
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 4 Feb 2018
 20:32:14 -0500
Date: Sun, 4 Feb 2018 17:32:20 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] toolsoftrade: Add a missed unbreakable space for line
 number
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180204221135.1001-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180204221135.1001-1-sj38.park@gmail.com>
Message-Id: <20180205013220.GT3617@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 05, 2018 at 07:11:34AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catches, both applied, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index e7a922b..ac25855 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -272,7 +272,7 @@ If the process ID is instead $-1$, this indicates that the \co{wait()}
>  primitive was unable to wait on a child.
>  If so, line~9 checks for the \co{ECHILD} errno, which indicates that there
>  are no more child processes, so that line~10 exits the loop.
> -Otherwise, lines~11 and 12 print an error and exit.
> +Otherwise, lines~11 and~12 print an error and exit.
> 
>  \QuickQuiz{}
>  	Why does this \co{wait()} primitive need to be so complicated?
> -- 
> 2.10.0
> 

