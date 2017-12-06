Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55824 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752235AbdLFWyY (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 6
 Dec 2017 17:54:24 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vB6MsDNF055985
 for <perfbook@vger.kernel.org>; Wed, 6 Dec 2017 17:54:24 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2epmpwcwt4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 06 Dec 2017 17:54:24 -0500
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 6 Dec 2017
 17:54:23 -0500
Date: Wed, 6 Dec 2017 14:54:21 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] future: Update Locking and HTM comparison tables
Reply-To: paulmck@linux.vnet.ibm.com
References: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
 <96abd2d1-8383-fef6-549b-3e156b9c571b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96abd2d1-8383-fef6-549b-3e156b9c571b@gmail.com>
Message-Id: <20171206225421.GE7829@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 07, 2017 at 07:19:02AM +0900, Akira Yokosawa wrote:
> >From 0525a99211ea5bce67be8f5137c4abde142d8e8e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 7 Dec 2017 07:05:32 +0900
> Subject: [PATCH v2 0/2] future: Update Locking and HTM comparison tables
> 
> Hi Paul,
> 
> I found another typo in HTMtableRCU.tex.
> This is a respin including the fix.
> Please apply this set instead.
> 
> Change since v1:
> 
>     Fix typo (Privitization -> Privatization)
> 
>         Thanks, Akira

Ah, good catch!  I queued and pushed your updated patches and my
wording change, thank you!

							Thanx, Paul

> --
> Akira Yokosawa (2):
>   future: Update Locking and HTM comparison tables
>   future: Add merged table of locking & HTM comparison
> 
>  appendix/styleguide/styleguide.tex |   6 -
>  future/HTMtable.tex                | 201 ++++++++++++++---------------
>  future/HTMtableColor.tex           |   9 ++
>  future/HTMtableFull.tex            | 148 +++++++++++++++++++++
>  future/HTMtableRCU.tex             | 254 +++++++++++++++++--------------------
>  future/htm.tex                     |   6 +
>  perfbook.tex                       |   1 +
>  7 files changed, 370 insertions(+), 255 deletions(-)
>  create mode 100644 future/HTMtableColor.tex
>  create mode 100644 future/HTMtableFull.tex
> 
> -- 
> 2.7.4
> 
> 

