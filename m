Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44196 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932430AbdIYANN (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 24
 Sep 2017 20:13:13 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8P0B05W144136
 for <perfbook@vger.kernel.org>; Sun, 24 Sep 2017 20:13:13 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d6mnr4bes-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 24 Sep 2017 20:13:12 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 24 Sep
 2017 20:13:11 -0400
Date: Sun, 24 Sep 2017 17:13:07 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] memorder: Update table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
 <8da24358-1887-bb29-b1b1-e65bb7468624@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8da24358-1887-bb29-b1b1-e65bb7468624@gmail.com>
Message-Id: <20170925001307.GK3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 25, 2017 at 07:10:39AM +0900, Akira Yokosawa wrote:
> On 2017/09/25 07:00:53 +0900, Akira Yokosawa wrote:
> >>From acefbb69d69562438d7a7568f671fc85528d5b5f Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Mon, 25 Sep 2017 06:38:06 +0900
> > Subject: [PATCH 0/5] memorder: Update table layout
> > 
> > Hi Paul,
> > 
> > My first thought was to update a few experimental tables to catch up
> > the changes in memorder.tex.
> > But these new tables are likely to change further.
> > So I changed my mind and converted the 5 tables in memorder.tex using
> > the new scheme of shading alternate rows. 3 of the 5 tables are already
> > presented in the style guide.
> > In the memorder chapter, we already converted code snippets to the
> > "listing" environment. So using the new table layout in this chapter
> > sounds reasonable to me.
> > 
> > Patch #1 updates already experimented tables and a similar one.
> > Patch #2 is an attempt to apply new scheme to the remaining table.
> > Patch #3 is an improvement of the table changed in Patch #2.
> > Patch #4 removes experimental tables in style guide.
> 
> The order of #3 and #4 was reversed.
> 
> > Patch #5 is a separate patch to improve MoreThanOneValue and
> > MoreThanOneValue-15CPU figures.
> > 
> > I'd like to know if the changes in Patches #2 and #3 work with you.
> 
> I mean "changes in Patches #2 and #4".

Got it.  They look good, so applied, thank you!

							Thanx, Paul

> >         Thanks, Akira
> > --
> > Akira Yokosawa (5):
> >   memorder: Convert tables to alternate-row coloring scheme
> >   memorder: Convert 'Summary of Memory Ordering' table to new scheme
> >   styleguide: Remove experimental tables updated in memorder chapter
> >   memorder: Add multi-column headers to 'Summary of Memory Ordering'
> >     table
> >   memorder: Reduce color saturation of MoreThanOneValue figure
> > 
> >  appendix/styleguide/styleguide.tex  | 113 +---------------------
> >  memorder/MoreThanOneValue-15CPU.fig |   2 +
> >  memorder/MoreThanOneValue.fig       |  26 ++---
> >  memorder/memorder.tex               | 183 ++++++++++++++++--------------------
> >  perfbook.tex                        |   1 +
> >  utilities/MoreThanOneValue-15CPU.c  |   3 +
> >  6 files changed, 107 insertions(+), 221 deletions(-)
> > 
> 

