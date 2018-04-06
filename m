Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52690 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751936AbeDFUCZ (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Fri, 6 Apr 2018 16:02:25 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w36K0MuE004068
 for <perfbook@vger.kernel.org>; Fri, 6 Apr 2018 16:02:25 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2h6bxah1jw-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Fri, 06 Apr 2018 16:02:24 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 6 Apr 2018
 16:02:24 -0400
Date: Fri, 6 Apr 2018 13:03:21 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] count: Use consistent coding style
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180406003105.7332-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406003105.7332-1-sj38.park@gmail.com>
Message-Id: <20180406200321.GB3948@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 06, 2018 at 09:31:04AM +0900, SeongJae Park wrote:
> One code snippet in `Counting` chapter has no space between 'if' keyword
> and its opening brace while other snippets have.  This commit fixes the
> snippet to use consistent coding style.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  I queued and pushed both patches, thank you!

							Thanx, Paul

> ---
>  count/count.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 752371f..cf79753 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -1544,7 +1544,7 @@ references only per-thread variables, and should not incur any cache misses.
>  	\begin{minipage}[t]{\columnwidth}
>  	\small
>  	\begin{verbatim}
> -  3 if (counter + delta <= countermax){
> +  3 if (counter + delta <= countermax) {
>    4   counter += delta;
>    5   return 1;
>    6 }
> -- 
> 2.10.0
> 

