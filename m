Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37732 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752468AbdA3UGf (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 30 Jan 2017 15:06:35 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0UK3pkd099557
 for <perfbook@vger.kernel.org>; Mon, 30 Jan 2017 15:05:48 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 289yx00cnh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 30 Jan 2017 15:05:47 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 30 Jan
 2017 13:05:46 -0700
Date: Mon, 30 Jan 2017 12:05:47 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/8] Bibliography update round 3
Reply-To: paulmck@linux.vnet.ibm.com
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Message-Id: <20170130200547.GQ3989@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 30, 2017 at 12:26:05AM +0900, Akira Yokosawa wrote:
> >From f49e93ec4178feeb7b7fdbeb4291051541daf9de Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 29 Jan 2017 19:57:24 +0900
> Subject: [PATCH 0/8] Bibliography update round 3
> 
> Hi Paul,
> 
> In this patch set, I picked up updates which contain some fixes
> other than just appending url or doi.
> They seem OK to me, but I want you to check yourself.
> 
> The "eprint" field appended in patch 1 is a field whose support has been
> added to alphapf style by "urlbst" package. This is the first entry
> it is utilized.

Applied, and thank you for your attention to detail!

							Thanx, Paul

>                                           Thanks, Akira
> --
> Akira Yokosawa (8):
>   bib/WFS: Add 'eprint' field to DanAlitarh2013PracticalProgress
>   bib/swtools: Fix url of SaeedDehnadi2009SheepGoats
>   bib/WFS: Add doi to Herlihy93
>   bib/syncrefs: Add doi to Kontothanassis97a
>   bib/TM: Fix doi of DBLomet1977SIGSOFT
>   bib/TM: Correct url of YujieLiu2011ToxicTransactions
>   bib/hw: Add doi to TrevorMudge2000Power
>   bib/parallelsys: Fix typo of OpenMPI2008's title
> 
>  bib/TM.bib          | 12 ++++++++----
>  bib/WFS.bib         |  4 +++-
>  bib/hw.bib          |  5 +++--
>  bib/parallelsys.bib |  2 +-
>  bib/swtools.bib     |  3 ++-
>  bib/syncrefs.bib    |  5 +++--
>  6 files changed, 20 insertions(+), 11 deletions(-)
> 
> -- 
> 2.7.4
> 

