Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42540 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750708AbdCDGpT (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 4
 Mar 2017 01:45:19 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v246cmlB044913
 for <perfbook@vger.kernel.org>; Sat, 4 Mar 2017 01:45:18 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28y34qj37v-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 04 Mar 2017 01:45:17 -0500
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 4 Mar 2017
 01:45:16 -0500
Date: Fri, 3 Mar 2017 12:51:27 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Bibliography updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
 <20170302011710.GR30506@linux.vnet.ibm.com>
 <8db9401a-88cb-e1c2-2f49-7c710547fa3e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db9401a-88cb-e1c2-2f49-7c710547fa3e@gmail.com>
Message-Id: <20170303205127.GW30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 03, 2017 at 08:48:46PM +0900, Akira Yokosawa wrote:
> On 2017/03/01 17:17:10 -0800, Paul E. McKenney wrote:
> > On Thu, Mar 02, 2017 at 07:10:01AM +0900, Akira Yokosawa wrote:
> >> >From f7c3656241243faf11d23bf17fea9da765c260f3 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Thu, 2 Mar 2017 06:52:36 +0900
> >> Subject: [PATCH 0/2] Bibliography updates
> >>
> >> Hi Paul,
> >>
> >> This is another round of bibliography updates.
> >> Patch 2 enables "pdfborder" of links in bibliography for 1c layout.
> >> Please try it and see if it is not too distracting. If you think
> >> it is good for 2c layout, please let me know.
> > 
> > Applied, thanks!  The 1c borders look fine.  Given that the 2c bibliography
> > is now single-column, we should avoid the bug, so making 2c have the
> > borders sounds good -- especially good to flag the known broken URLs.
> 
> Ah, I didn't intend to flag the broken URLs.
> I'll submit a patch to enable the borders regardless of layout.

Are you sure?  Might be nice to have a visual hint as to which URLs
work and which do not.

> ## Looks like your reply took a while to reach your mail server.

Yes, having some connectivity problems.  It seems to be necessary to
choose the right hotspot for a given function...  :-/

Should be back to normal next week.

							Thanx, Paul

>                                    Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>                                 Thanks, Akira
> >>
> >> Akira Yokosawa (2):
> >>   Bibliography updates
> >>   appendix: Draw hyperlink border in bibliography for 1c layout
> >>
> >>  appendix/appendix.tex | 14 +++++++++-----
> >>  bib/RCU.bib           | 10 ++++++++--
> >>  bib/TM.bib            |  5 +++--
> >>  bib/WFS.bib           |  2 ++
> >>  bib/os.bib            |  3 +++
> >>  bib/parallelsys.bib   |  5 +++++
> >>  bib/syncrefs.bib      |  1 +
> >>  7 files changed, 31 insertions(+), 9 deletions(-)
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> > 
> 

