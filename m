Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36559 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751323AbdCCDjz (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 2
 Mar 2017 22:39:55 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v233VlR4101667
 for <perfbook@vger.kernel.org>; Thu, 2 Mar 2017 22:38:05 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28xs8e1rhw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 02 Mar 2017 22:38:05 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 2 Mar 2017
 20:38:04 -0700
Date: Wed, 1 Mar 2017 17:17:10 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Bibliography updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
Message-Id: <20170302011710.GR30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Mar 02, 2017 at 07:10:01AM +0900, Akira Yokosawa wrote:
> >From f7c3656241243faf11d23bf17fea9da765c260f3 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 2 Mar 2017 06:52:36 +0900
> Subject: [PATCH 0/2] Bibliography updates
> 
> Hi Paul,
> 
> This is another round of bibliography updates.
> Patch 2 enables "pdfborder" of links in bibliography for 1c layout.
> Please try it and see if it is not too distracting. If you think
> it is good for 2c layout, please let me know.

Applied, thanks!  The 1c borders look fine.  Given that the 2c bibliography
is now single-column, we should avoid the bug, so making 2c have the
borders sounds good -- especially good to flag the known broken URLs.

							Thanx, Paul

>                                 Thanks, Akira
> 
> Akira Yokosawa (2):
>   Bibliography updates
>   appendix: Draw hyperlink border in bibliography for 1c layout
> 
>  appendix/appendix.tex | 14 +++++++++-----
>  bib/RCU.bib           | 10 ++++++++--
>  bib/TM.bib            |  5 +++--
>  bib/WFS.bib           |  2 ++
>  bib/os.bib            |  3 +++
>  bib/parallelsys.bib   |  5 +++++
>  bib/syncrefs.bib      |  1 +
>  7 files changed, 31 insertions(+), 9 deletions(-)
> 
> -- 
> 2.7.4
> 

