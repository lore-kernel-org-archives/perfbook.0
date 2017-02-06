Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56397 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752158AbdBFPDH (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 6
 Feb 2017 10:03:07 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v16EsJfX055073
 for <perfbook@vger.kernel.org>; Mon, 6 Feb 2017 10:03:06 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28db52mucw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 06 Feb 2017 10:03:05 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 6 Feb 2017
 08:03:03 -0700
Date: Sun, 5 Feb 2017 19:20:09 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] SMPdesign/beyond: Remove redundant 'although'
Reply-To: paulmck@linux.vnet.ibm.com
References: <ab3d990e-b19c-d0cb-6f08-613e990221e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab3d990e-b19c-d0cb-6f08-613e990221e9@gmail.com>
Message-Id: <20170206032009.GI30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 05, 2017 at 12:07:48AM +0900, Akira Yokosawa wrote:
> >From 4c4f3e57a64fc74e312bf24c00174b2db3dbe27f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 4 Feb 2017 23:49:51 +0900
> Subject: [PATCH] SMPdesign/beyond: Remove redundant 'although'
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This "although" seems redundant, doesn't it?

Indeed it is, good eyes!  Applied and pushed.

							Thanx, Paul

>                                         Thanks, Akira
> --
>  SMPdesign/beyond.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
> index 0f86303..ee1a27d 100644
> --- a/SMPdesign/beyond.tex
> +++ b/SMPdesign/beyond.tex
> @@ -626,7 +626,7 @@ to be retrofitted into existing programs.
>  \section{Partitioning, Parallelism, and Optimization}
>  \label{sec:SMPdesign:Partitioning, Parallelism, and Optimization}
> 
> -Most important, although this chapter has demonstrated that although applying
> +Most important, although this chapter has demonstrated that applying
>  parallelism at the design level gives excellent results, this final
>  section shows that this is not enough.
>  For search problems such as maze solution, this section has shown that
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

