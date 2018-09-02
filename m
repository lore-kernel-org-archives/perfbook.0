Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43680 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1725962AbeIBI22 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 2 Sep 2018 04:28:28 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w824E8EU102250
 for <perfbook@vger.kernel.org>; Sun, 2 Sep 2018 00:14:08 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2m880bs0br-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 02 Sep 2018 00:14:08 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 2 Sep 2018
 00:14:07 -0400
Date: Sat, 1 Sep 2018 21:14:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Add info where to obtain 'noindentafter' package
Reply-To: paulmck@linux.vnet.ibm.com
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
 <20180901172947.GN4225@linux.vnet.ibm.com>
 <e7b62093-acdf-5969-f6b9-c4d2951f6d09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7b62093-acdf-5969-f6b9-c4d2951f6d09@gmail.com>
Message-Id: <20180902041405.GP4225@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 02, 2018 at 08:33:04AM +0900, Akira Yokosawa wrote:
> >From bb7727a5e3a9a22ec53a870f09b7bbf39448f95e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 2 Sep 2018 08:12:36 +0900
> Subject: [PATCH] Add info where to obtain 'noindentafter' package
> 
> LPPL 1.3c Clause 6.d.2 requires us to provide information to obtain
> a complete, unmodified copy of the Work.
> 
> Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Very good, applied and all four pushed, thank you!

							Thanx, Paul

> ---
>  noindentafter.sty | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/noindentafter.sty b/noindentafter.sty
> index 2ea6e22..7a36224 100644
> --- a/noindentafter.sty
> +++ b/noindentafter.sty
> @@ -1,3 +1,8 @@
> +%% Notice to comply with Clause 6 of LPPL v 1.3c
> +%% This file is copied from TeX Live 2015/Debian.
> +%% Whole package including documentation can be obtained from:
> +%%     https://ctan.org/pkg/noindentafter
> +
>  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \iffalse %%%%
>  %                                                                              %
>  %  Copyright (c) 2014 - Michiel Helvensteijn - www.mhelvens.net                %
> -- 
> 2.7.4
> 
> 

