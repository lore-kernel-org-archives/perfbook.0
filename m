Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55308 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752915AbdJUA05 (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 20
 Oct 2017 20:26:57 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9L0NXIj102118
 for <perfbook@vger.kernel.org>; Fri, 20 Oct 2017 20:26:57 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dqt8eafqm-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 20 Oct 2017 20:26:57 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 20 Oct
 2017 20:26:56 -0400
Date: Fri, 20 Oct 2017 17:26:53 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] debugging: Use \ln for natural logarithm in Eq E.9
Reply-To: paulmck@linux.vnet.ibm.com
References: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
Message-Id: <20171021002653.GK3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 21, 2017 at 09:07:28AM +0900, Akira Yokosawa wrote:
> >From ad506b1b01a5c13bbbe393c7acaa11b4320d0601 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 21 Oct 2017 07:53:36 +0900
> Subject: [PATCH 1/3] debugging: Use \ln for natural logarithm in Eq E.9
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I applied all three, thank you!  Good eyes, especially on the log->ln
change.  ;-)

							Thanx, Paul

> ---
>  debugging/debugging.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index a4537b0..700e725 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1265,7 +1265,7 @@ following formula:
>  	Equation~\ref{eq:debugging:Error-Free Test Duration}, resulting in:
> 
>  	\begin{equation}
> -		T = - \frac{1}{3} \log \frac{100 - 99.9}{100} = 2.3
> +		T = - \frac{1}{3} \ln \frac{100 - 99.9}{100} = 2.3
>  	\end{equation}
> 
>  	If the test runs without failure for 2.3 hours, we can be 99.9\,\%
> -- 
> 2.7.4
> 

