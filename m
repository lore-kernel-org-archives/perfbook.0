Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57593 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1756920AbcG0SuI (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 27
 Jul 2016 14:50:08 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6RIn05f089341
 for <perfbook@vger.kernel.org>; Wed, 27 Jul 2016 14:50:07 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24e0gmuqew-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Wed,
 27 Jul 2016 14:50:07 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 27 Jul
 2016 14:50:06 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id AB35DC90062
 for <perfbook@vger.kernel.org>; Wed, 27 Jul 2016 14:49:45 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6RIntIR49610994	for <perfbook@vger.kernel.org>; Wed, 27 Jul 2016 18:49:55
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6RIntND027155	for <perfbook@vger.kernel.org>; Wed, 27 Jul 2016 14:49:55
 -0400
Date: Wed, 27 Jul 2016 11:49:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] Tweak width of epigraph
Reply-To: paulmck@linux.vnet.ibm.com
References: <7dd18275-9406-b024-9766-6fe6aa3cb7e4@gmail.com>
 <20160726152216.GY7094@linux.vnet.ibm.com>
 <86975302-4961-0437-8170-df9e12145390@gmail.com>
 <fadd9a11-78e8-ced4-ae35-66ca845b7fd4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fadd9a11-78e8-ced4-ae35-66ca845b7fd4@gmail.com>
Message-Id: <20160727184955.GG3873@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 28, 2016 at 12:09:32AM +0900, Akira Yokosawa wrote:
> >From 63252e8e5f8e3a74e1ab41fd577b90cdf037e36c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 27 Jul 2016 23:51:18 +0900
> Subject: [PATCH v2] Tweak width of epigraph
> 
> The default of \epigraphwidth is .5\textwidth.
> This causes different widths of one-column and two-column layouts.
> This commit defines it in an absolute length to specify same
> width for both layouts
> 
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Much better!!!  Queued, thank you!

							Thanx, Paul

> ---
>  perfbook.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index 9216485..95902be 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -31,7 +31,7 @@
>  \usepackage{footnotebackref} % to enable cross-ref of footnote
>  \usepackage[all]{hypcap} % for going to the top of figure and table
>  \usepackage{epigraph}
> -
> +\setlength{\epigraphwidth}{2.3in}
>  % custom packages
> 
>  \usepackage{qqz}
> -- 
> 1.9.1
> 
> 

