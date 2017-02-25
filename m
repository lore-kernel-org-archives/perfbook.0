Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52765 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751496AbdBYFtA (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 25
 Feb 2017 00:49:00 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1P5XS9i077491
 for <perfbook@vger.kernel.org>; Sat, 25 Feb 2017 00:48:59 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28u3q0rjxg-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 25 Feb 2017 00:48:59 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 24 Feb
 2017 22:48:58 -0700
Date: Fri, 24 Feb 2017 21:48:55 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Bibliography updates (misc fixes)
Reply-To: paulmck@linux.vnet.ibm.com
References: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
Message-Id: <20170225054855.GU30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 22, 2017 at 11:27:00PM +0900, Akira Yokosawa wrote:
> >From cd89aaf41ef91a1f7210243b883e8ef111ae08ef Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 22 Feb 2017 23:16:27 +0900
> Subject: [PATCH 0/3] Bibliography updates (misc fixes)
> 
> Hi Paul,
> 
> This is the final round of bibliography updates I have prepared.
> I will submit patches to append location fields when I notice.

Applied and pushed, thank you!

							Thanx, Paul


>                                 Thanks, Akira
> --
> Akira Yokosawa (3):
>   bib/WFS.bib: Update info in Valois95a
>   bib/TM: Append location to Volos2008TRANSACT
>   bib/syncrefs: Fix booktitle and append location
> 
>  bib/TM.bib       | 1 +
>  bib/WFS.bib      | 8 ++++++--
>  bib/syncrefs.bib | 8 +++++---
>  3 files changed, 12 insertions(+), 5 deletions(-)
> 
> -- 
> 2.7.4
> 

