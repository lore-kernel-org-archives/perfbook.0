Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50032 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S933164AbeFUOxy (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 21
 Jun 2018 10:53:54 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5LEn9MN112226
 for <perfbook@vger.kernel.org>; Thu, 21 Jun 2018 10:53:54 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2jrc94nvp6-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Thu, 21 Jun 2018 10:53:54 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 21 Jun
 2018 10:53:52 -0400
Date: Thu, 21 Jun 2018 07:55:51 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] bib/QC: Use ASCII apostrophe
Reply-To: paulmck@linux.vnet.ibm.com
References: <d9f4012a-8b2a-e227-34e2-0002a38a91fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9f4012a-8b2a-e227-34e2-0002a38a91fd@gmail.com>
Message-Id: <20180621145551.GD3593@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 21, 2018 at 10:17:51PM +0900, Akira Yokosawa wrote:
> >From d31dccd5a0e41c8082893c8caef8a43ae4065f94 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 21 Jun 2018 21:23:43 +0900
> Subject: [PATCH] bib/QC: Use ASCII apostrophe
> 
> Also keep some capital letters in title.
> 
> Fixes: f1903322bdb8 ("Bibliography update")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queued and pushed, thank you!

							Thanx, Paul

> ---
>  bib/QC.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bib/QC.bib b/bib/QC.bib
> index f598d26..0c80e46 100644
> --- a/bib/QC.bib
> +++ b/bib/QC.bib
> @@ -1167,7 +1167,7 @@
> 
>  @unpublished{JohnBoyd2018ClassicalAnneal
>  ,Author="Johhn Boyd"
> -,Title="Fujitsu’s CMOS Digital Annealer Produces Quantum Computer Speeds"
> +,Title="Fujitsu's {CMOS Digital Annealer} Produces Quantum Computer Speeds"
>  ,month="May"
>  ,day="30"
>  ,year="2018"
> -- 
> 2.7.4
> 

