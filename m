Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44662 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751729AbdLMDY1 (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 12
 Dec 2017 22:24:27 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vBD3NrA7088862
 for <perfbook@vger.kernel.org>; Tue, 12 Dec 2017 22:24:26 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ettagcbnc-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 12 Dec 2017 22:24:26 -0500
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 12 Dec
 2017 22:24:25 -0500
Date: Tue, 12 Dec 2017 19:24:23 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Fix typo: s/Curiosty Rover/Curiosity Rover/
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171213021627.25740-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171213021627.25740-1-sj38.park@gmail.com>
Message-Id: <20171213032423.GI7829@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 13, 2017 at 11:16:27AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  Applied and pushed, thank you!

							Thanx, Paul

> ---
>  formal/regression.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/formal/regression.tex b/formal/regression.tex
> index 4e06cb7..4e8476d 100644
> --- a/formal/regression.tex
> +++ b/formal/regression.tex
> @@ -584,6 +584,6 @@ Just because many of them are poor fit for regression testing does
>  not at all mean that they are useless, in fact,
>  many of them have proven their worth many times over.\footnote{
>  	For but one example, Promela was used to verify the file system
> -	of none other than the Curiosty Rover.
> +	of none other than the Curiosity Rover.
>  	Was \emph{your} formal verification tool used on a Mars rover?}
>  Just not for regression testing.
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

