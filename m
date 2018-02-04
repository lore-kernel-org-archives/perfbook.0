Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33124 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750899AbeBDK2i (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 4 Feb 2018 05:28:38 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w14ASaow075491
 for <perfbook@vger.kernel.org>; Sun, 4 Feb 2018 05:28:37 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2fwu9uyv13-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 04 Feb 2018 05:28:37 -0500
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 4 Feb 2018
 05:28:32 -0500
Date: Sun, 4 Feb 2018 02:28:38 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] bib/QC: Fix url of 'NobelPrizeChemistry2017'
Reply-To: paulmck@linux.vnet.ibm.com
References: <8f138f22-8421-5600-6166-4e2feb4ef602@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f138f22-8421-5600-6166-4e2feb4ef602@gmail.com>
Message-Id: <20180204102838.GQ3617@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 03, 2018 at 02:06:15PM +0900, Akira Yokosawa wrote:
> >From 6255a56b31fd895e0602f1c62a454c1efa61d821 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 3 Feb 2018 14:01:00 +0900
> Subject: [PATCH] bib/QC: Fix url of 'NobelPrizeChemistry2017'
> 
> Use proper URL of the press release.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, applied and pushed, thank you!

							Thanx, Paul

> ---
>  bib/QC.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bib/QC.bib b/bib/QC.bib
> index ebef662..48cadd2 100644
> --- a/bib/QC.bib
> +++ b/bib/QC.bib
> @@ -925,7 +925,7 @@
>  ,month="October"
>  ,day="4"
>  ,year="2017"
> -,note="\url{Cool microscope technology revolutionises biochemistry}"
> +,note="\url{https://www.nobelprize.org/nobel_prizes/chemistry/laureates/2017/press.html}"
>  }
> 
>  @unpublished{JohnTimmer2017ChemistryNobel
> -- 
> 2.7.4
> 

