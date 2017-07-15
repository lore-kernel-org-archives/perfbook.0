Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37166 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751192AbdGOMJL (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 15
 Jul 2017 08:09:11 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6FC9ATM004371
 for <perfbook@vger.kernel.org>; Sat, 15 Jul 2017 08:09:11 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bqfked479-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 15 Jul 2017 08:09:11 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 15 Jul
 2017 08:08:47 -0400
Date: Sat, 15 Jul 2017 05:08:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] future/QC: Fix typos
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170713231923.4929-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170713231923.4929-1-sj38.park@gmail.com>
Message-Id: <20170715120843.GB2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 14, 2017 at 08:19:22AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes, both applied, thank you!

							Thanx, Paul

> ---
>  future/QC.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/future/QC.tex b/future/QC.tex
> index d16c080..f985437 100644
> --- a/future/QC.tex
> +++ b/future/QC.tex
> @@ -411,7 +411,7 @@ ten digits of precision.
>  If this was all that QC provided, QC would be a rather slow and very
>  low-quality analog computer.
>  Given that digital computers obsoleted analog computers some decades back,
> -This analogy might lead many developers to ignore QC and to
> +this analogy might lead many developers to ignore QC and to
>  use classic-computing floating point instead.
>  However, QC provides a powerful capability covered in the next section.
> 
> @@ -798,7 +798,7 @@ For example, perhaps machine-learning techniques will allow difficult
>  cases to be detected so that alternative solution methods can be applied
>  as needed.
> 
> -Of course, much of this work has been heuristic and/or probabalistic,
> +Of course, much of this work has been heuristic and/or probabilistic,
>  so it might at first glance seem unfair to compare them to
>  QC algorithms.
>  However, QC algorithms are inherently probabilistic due to error rates
> -- 
> 2.10.0
> 

