Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50846 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752235AbeDGXkJ (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 7
 Apr 2018 19:40:09 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w37Nd03q122073
 for <perfbook@vger.kernel.org>; Sat, 7 Apr 2018 19:40:09 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2h6t5d5nbq-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sat, 07 Apr 2018 19:40:08 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 7 Apr 2018
 19:40:07 -0400
Date: Sat, 7 Apr 2018 16:41:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] future/formalregress: Fix staccato of 'been'
Reply-To: paulmck@linux.vnet.ibm.com
References: <b1a921af-ee58-8dfd-cda2-0523b89c66b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a921af-ee58-8dfd-cda2-0523b89c66b0@gmail.com>
Message-Id: <20180407234105.GN3948@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 08, 2018 at 12:23:05AM +0900, Akira Yokosawa wrote:
> >From b4f82853b7425a54e5ac898b91660fff66e4190b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 7 Apr 2018 23:14:24 +0900
> Subject: [PATCH] future/formalregress: Fix staccato of 'been'
> 
> Also remove redundant "v" in "v4.17".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, applied and pushed, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> If you prefer "v4.17", "version" can be removed instead.
> 
>         Thanks, Akira
> --
>  future/formalregress.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index dd37ec8..8402da1 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -116,7 +116,7 @@ In contrast, one of the great strengths of PPCMEM and \co{herd}
>  is their detailed modeling of various CPU families memory models,
>  including x86, ARM, Power, and, in the case of \co{herd},
>  even a Linux-kernel memory model~\cite{Alglave:2018:FSC:3173162.3177156},
> -which has been been accepted into version v4.17 of
> +which has been accepted into version 4.17 of
>  the Linux kernel.
> 
>  The \co{cbmc} and Nidhugg tools provide some ability to select
> -- 
> 2.7.4
> 

