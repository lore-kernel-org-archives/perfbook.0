Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57442 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752449AbdKDQJH (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 4
 Nov 2017 12:09:07 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA4G3tXd012131
 for <perfbook@vger.kernel.org>; Sat, 4 Nov 2017 12:09:07 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2e18v2fkfr-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 04 Nov 2017 12:09:07 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 4 Nov 2017
 12:09:05 -0400
Date: Sat, 4 Nov 2017 09:09:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] cpu/overheads: Don't break just after nn-mm
Reply-To: paulmck@linux.vnet.ibm.com
References: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
 <479e6ed4-b56d-a9d8-3f98-28439201a348@gmail.com>
 <20171104044025.GU3624@linux.vnet.ibm.com>
 <0347fa89-d3c2-c11d-f47c-737fa177dfb9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0347fa89-d3c2-c11d-f47c-737fa177dfb9@gmail.com>
Message-Id: <20171104160904.GV3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 04, 2017 at 02:24:22PM +0900, Akira Yokosawa wrote:
> On 2017/11/03 21:40:25 -0700, Paul E. McKenney wrote:
> > On Sat, Nov 04, 2017 at 10:40:40AM +0900, Akira Yokosawa wrote:
> >> >From 96995ec9781970d633f554579465e9f053ec316a Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sat, 4 Nov 2017 07:44:36 +0900
> >> Subject: [PATCH 2/3] cpu/overheads: Don't break just after nn-mm
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > You lost me with this one.  Shouldn't there be a non-breaking space
> > between the "350-500" and the "sheets"?  Or is there some magic here
> > that I am missing?
> 
> I intentionally chose normal space because the preceding number is
> 3 digits and "sheets" can't be hyphenated. It can cause large underfil
> in 2c layout.
> In the current Answer, line breaking is done at different places in
> both 1c and 2c layout, so it doesn't matter at the moment.
> 
> Also, non-breaking spaces can be enforced by a script something like
> hypen2endash.sh. The added pattern in Patch #1 does the conversion
> to nbsp. (I use this script for mostly 1c layout.)
> 
> Thoughts?

OK, I am finally seeing the connection between this change and the
change to the sripts.  So, yes, it has no direct effect on LaTeX,
but does have an indirect effect after the scripts have run.  And some
quick-quiz answers do look much better as well!

I applied and pushed all three, thank you

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> ---
> >>  cpu/overheads.tex | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> >> index bd4c814..366b071 100644
> >> --- a/cpu/overheads.tex
> >> +++ b/cpu/overheads.tex
> >> @@ -290,8 +290,8 @@ cycles, as shown in the ``Global Comms'' row.
> >>  	How can I possibly get my head around them?
> >>  \QuickQuizAnswer{
> >>  	Get a roll of toilet paper.
> >> -	In the USA, each roll will normally have somewhere around 350-500
> >> -	sheets.
> >> +	In the USA, each roll will normally have somewhere around
> >> +	350-500 sheets.
> >>  	Tear off one sheet to represent a single clock cycle, setting it aside.
> >>  	Now unroll the rest of the roll.
> >>
> >> -- 
> >> 2.7.4
> >>
> >>
> > 
> > 
> 

