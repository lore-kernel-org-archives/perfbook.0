Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51715 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752165AbdBFPDI (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 6 Feb 2017 10:03:08 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v16Es1dV025510
 for <perfbook@vger.kernel.org>; Mon, 6 Feb 2017 10:03:07 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28et9sb8ht-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 06 Feb 2017 10:03:07 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 6 Feb 2017
 08:03:05 -0700
Date: Sun, 5 Feb 2017 19:17:00 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/7] Bibliography update round 4
Reply-To: paulmck@linux.vnet.ibm.com
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Message-Id: <20170206031700.GH30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Feb 03, 2017 at 11:04:13PM +0900, Akira Yokosawa wrote:
> >From d6a74ae528d3d8134d4d21f385c34745d5a31a7b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 3 Feb 2017 22:56:57 +0900
> Subject: [PATCH 0/7] Bibliography update round 4
> 
> Hi Paul,
> 
> This time, I picked up remaining patches to salvage broken urls.
> They are mostly straightforward updates.

Good rescues, thank you!  Applied and pushed.

							Thanx, Paul

>                                      Thanks, Akira
> --
> Akira Yokosawa (7):
>   bib/TM: Replace url with doi of DaveDice2006DISC
>   bib/swtools: Salvage url of DouglasEngelbart1968
>   bib/RCU: Salvage broken url of McKenney01a
>   bib/os: Salvage url of Molnar00a
>   bib/hw: Salvage url of CSIRACMuseumVictoria
>   bib/syncrefs: Replace broken url of radovic02efficient with doi
>   bib/syncrefs: Replace broken url of radovic03hierarchical with doi
> 
>  bib/RCU.bib      | 7 ++++---
>  bib/TM.bib       | 4 +---
>  bib/hw.bib       | 6 +++---
>  bib/os.bib       | 5 +++--
>  bib/swtools.bib  | 6 +++---
>  bib/syncrefs.bib | 4 ++--
>  6 files changed, 16 insertions(+), 16 deletions(-)
> 
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

