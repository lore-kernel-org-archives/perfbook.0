Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48746 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751713AbcHHAPb (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 7
 Aug 2016 20:15:31 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u780Da6E018637
 for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 20:15:30 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24nce73rpe-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 07 Aug 2016 20:15:30 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 7 Aug 2016
 18:15:29 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 0132319D801C	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 18:15:00 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u780FUYm18350568	for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 00:15:30 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u780FQ1F003664	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 20:15:26 -0400
Date: Sun, 7 Aug 2016 17:15:28 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] SMPdesign: Use subscript in lockdeqhash figures
Reply-To: paulmck@linux.vnet.ibm.com
References: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
 <20160807181839.GE3482@linux.vnet.ibm.com>
 <8e4b5679-a2aa-fc23-c086-8b1deb8f8603@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4b5679-a2aa-fc23-c086-8b1deb8f8603@gmail.com>
Message-Id: <20160808001528.GG3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 08, 2016 at 07:08:17AM +0900, Akira Yokosawa wrote:
> On 2016/08/07 11:18:39 -0700, Paul E. McKenney wrote:
> > On Sat, Aug 06, 2016 at 07:07:29PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> This is somewhat related to the "using hyphens for minus signs" issue.
> >> In Figures 6.8 and 6.9, entry names such as "L-2" are used.
> >> The "-" here means minus, but it is *not* obvious at first glance if
> >> it means "L minus 2" or not.
> >>
> >> If we make "-2" a subscript, it would be much easier to see that
> >> it means "L whose sequence number is 'minus 2'".
> >> So, I tweaked the xfig sources of the figures to make those numbers
> >> in entries look like subscripts. I also altered the numbers in entry names
> >> mentioned in the corresponding text as subscripts (using math mode).
> >>
> >> I'm sending this as a pull request as the resulting patch became fairly
> >> large due to eps files.
> >>
> >> I hope you like there tweaks.
> >>
> >> Additional patch is a fix of entry numbers of Figure 6.9, which is
> >> actually 16 if my understanding of the figure is correct.
> > 
> > I pulled both, thank you.
> > 
> > Any thoughts on converting .fig files to .svg?  My approach has been to
> > import .fig files into inkscape as I need to modify them.  The results
> > are OK, but not perfect (for example, arrows in .fig become two objects
> > in .svg, the line and the arrowhead).
> 
> So, I tried this.
> But by importing into inkscape, all the texts get the same font size...
> Unfortunately, font size specifier in .fig seems to be ignored.
> Or I might be missing something.

Hmmm...  I guess I have been getting lucky, working only with .fig files
with a single font size.

> BTW, now that we can use -jN option for building .pdf files, wouldn't it
> be a good idea to get rid of .eps files in the repository whose sources
> are .fig files by adding a ".fig -> .eps" rule in Makefile?
> Then the patch would have been much smaller.
> 
> Let me know what you think.

Making that initial clone and build go faster makes a lot of sense to me!

							Thanx, Paul

>                                           Thanks, Akira
> > 
> > 						Thanx, Paul
> > 
> >>                                              Thanks, Akira 
> >>
> >> ---------
> >> The following changes since commit ec15e80376f04f5b2be8779aedfda3ba184a4e37:
> >>
> >>   Fix URL for MathieuDesnoyers2009LFCollabSummit (2016-08-05 13:12:07 -0700)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git lockdeqhash-use-subscript
> >>
> >> for you to fetch changes up to 7893124def444db34fbb6bc2b4e9b2f20675c2eb:
> >>
> >>   SMPdesign: Fix number of elements regarding Figure 6.9 (2016-08-06 18:14:07 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (2):
> >>       SMPdesign: Use subscript in lockdeqhash figures
> >>       SMPdesign: Fix number of elements regarding Figure 6.9
> >>
> >>  SMPdesign/lockdeqhash1R.eps   | 330 +++++++++++++++++++++++++++++++++++-------
> >>  SMPdesign/lockdeqhash1R.fig   |  39 +++--
> >>  SMPdesign/lockdeqhashlots.eps | 323 +++++++++++++++++++++++++++++++++++------
> >>  SMPdesign/lockdeqhashlots.fig |  48 ++++--
> >>  SMPdesign/partexercises.tex   |  14 +-
> >>  5 files changed, 622 insertions(+), 132 deletions(-)
> >>
> > 
> > 
> 

