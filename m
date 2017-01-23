Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43019 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750945AbdAWV3N (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 23
 Jan 2017 16:29:13 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0NLOAHu022260
 for <perfbook@vger.kernel.org>; Mon, 23 Jan 2017 16:28:26 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 285kysyjxr-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 23 Jan 2017 16:28:26 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 23 Jan
 2017 14:28:25 -0700
Date: Mon, 23 Jan 2017 13:28:23 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/7] Bibliography update round 2
Reply-To: paulmck@linux.vnet.ibm.com
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Message-Id: <20170123212823.GT28085@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 22, 2017 at 11:57:22PM +0900, Akira Yokosawa wrote:
> >From 01ba68ac394333779c7745f249df5f78a500e091 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 22 Jan 2017 23:31:05 +0900
> Subject: [PATCH 0/7] Bibliography update round 2
> 
> Hi Paul,
> 
> This is the 2nd batch of bibliography update.
> This time, I picked up more aggressive fixes which touch somewhere other
> than urls in note fields. They may need closer review.
> Some of the fixes reflect the context of citations in perfbook, so they
> might cause context mismatches in your other publications.
> I'm anticipating some feedback from you.

They look good -- and most of these are only cited by perfbook anyway.

Applied and pushed, thank you!

							Thanx, Paul

>                                                Thanks, Akira
> 
> Akira Yokosawa (7):
>   bib/hw: Update url note of JohnKnickerbocker2008:3DI
>   bib/syncrefs: Update BengHongLim94
>   bib/RCU: Salvage url of Spraul01
>   bib/syncrefs: Salvage url of AdrianSutton2013LCA:Disruptor
>   bib/RCU: Append followup mail's url to LinusTorvalds2001a
>   bib/syncrefs: Salvage url of DavidUngar2011unsync
>   bib/swtools: Salvage url of RichardBornat2006SheepGoats
> 
>  bib/RCU.bib      | 13 +++++++------
>  bib/hw.bib       |  6 ++++--
>  bib/swtools.bib  | 12 ++++++++----
>  bib/syncrefs.bib | 26 +++++++++++++++++++-------
>  4 files changed, 38 insertions(+), 19 deletions(-)
> 
> -- 
> 2.7.4
> 

