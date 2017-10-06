Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37530 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751491AbdJFRFK (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Fri, 6 Oct 2017 13:05:10 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v96H4Txk046125
 for <perfbook@vger.kernel.org>; Fri, 6 Oct 2017 13:05:10 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2de9v9pn29-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 06 Oct 2017 13:05:10 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 6 Oct 2017
 13:05:09 -0400
Date: Fri, 6 Oct 2017 10:05:07 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Fix 'Non-Other-Multicopy Atomic?' row in
 summary table
Reply-To: paulmck@linux.vnet.ibm.com
References: <dc43b2af-dc79-c0f0-6946-03a700a794a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc43b2af-dc79-c0f0-6946-03a700a794a8@gmail.com>
Message-Id: <20171006170507.GG3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 06, 2017 at 11:44:11PM +0900, Akira Yokosawa wrote:
> >From a28209de2cced673aa9a924cf7d038571886b6fd Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 6 Oct 2017 23:29:24 +0900
> Subject: [PATCH] memorder: Fix 'Non-Other-Multicopy Atomic?' row in summary table
> 
> In commit c99a5407b2a6 ("memorder: Transpose table 'Summary of Memory
> Ordering'"), (PA-RISC), SPARC TSO, and x86 were marked "Y" in
> the "Non-Other-Multicopy Atomic?" row.
> The corresponding cells before the transposition had been blank.
> 
> Remove those bogus "Y"s.
> 
> Fixes: c99a5407b2a6
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Hmmm...  I didn't proofread that transposition change very well, did I?

Anyway, applied and pushed, thank you!!!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index ba54fee..eb498fb 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3744,7 +3744,7 @@ dependencies.
>  		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
>  \cellcolor{white}
>  	& Non-Other-Multicopy Atomic?
> -		 & Y   & ~   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
> +		 & Y   & ~   & Y   & Y     & Y  & ~     & ~   & Y & ~   & ~ & ~ \\
>  	& Non-Cache Coherent?
>  		 & ~   & ~   & ~   & Y     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
>  	\cmidrule(r){1-2} \cmidrule{3-13}
> -- 
> 2.7.4
> 

