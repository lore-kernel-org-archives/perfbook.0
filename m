Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16194 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1752072AbcHHQmr (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Mon, 8 Aug 2016 12:42:47 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u78GYA7s089916
 for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 12:42:47 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24nc307g1g-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 08 Aug 2016 12:42:46 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 8 Aug 2016
 12:42:45 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 56B5D38C8039
 for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 12:42:43 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u78GgmGt54919214	for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 16:42:48 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u78GghFh008624	for <perfbook@vger.kernel.org>; Mon, 8 Aug 2016 12:42:43 -0400
Date: Mon, 8 Aug 2016 09:42:45 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] SMPdesign: Use subscript in lockdeqhash figures
Reply-To: paulmck@linux.vnet.ibm.com
References: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
 <20160807181839.GE3482@linux.vnet.ibm.com>
 <8e4b5679-a2aa-fc23-c086-8b1deb8f8603@gmail.com>
 <20160808001528.GG3482@linux.vnet.ibm.com>
 <60290e7c-1444-9064-d481-640ae3e5daa0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60290e7c-1444-9064-d481-640ae3e5daa0@gmail.com>
Message-Id: <20160808164245.GK3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 09, 2016 at 12:21:04AM +0900, Akira Yokosawa wrote:
> On 2016/08/07 17:15:28 -0700, Paul E. McKenney wrote:
> > On Mon, Aug 08, 2016 at 07:08:17AM +0900, Akira Yokosawa wrote:
> >> On 2016/08/07 11:18:39 -0700, Paul E. McKenney wrote:
> >>> On Sat, Aug 06, 2016 at 07:07:29PM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> This is somewhat related to the "using hyphens for minus signs" issue.
> >>>> In Figures 6.8 and 6.9, entry names such as "L-2" are used.
> >>>> The "-" here means minus, but it is *not* obvious at first glance if
> >>>> it means "L minus 2" or not.
> >>>>
> >>>> If we make "-2" a subscript, it would be much easier to see that
> >>>> it means "L whose sequence number is 'minus 2'".
> >>>> So, I tweaked the xfig sources of the figures to make those numbers
> >>>> in entries look like subscripts. I also altered the numbers in entry names
> >>>> mentioned in the corresponding text as subscripts (using math mode).
> >>>>
> >>>> I'm sending this as a pull request as the resulting patch became fairly
> >>>> large due to eps files.
> >>>>
> >>>> I hope you like there tweaks.
> >>>>
> >>>> Additional patch is a fix of entry numbers of Figure 6.9, which is
> >>>> actually 16 if my understanding of the figure is correct.
> >>>
> >>> I pulled both, thank you.
> >>>
> >>> Any thoughts on converting .fig files to .svg?  My approach has been to
> >>> import .fig files into inkscape as I need to modify them.  The results
> >>> are OK, but not perfect (for example, arrows in .fig become two objects
> >>> in .svg, the line and the arrowhead).
> >>
> >> So, I tried this.
> >> But by importing into inkscape, all the texts get the same font size...
> >> Unfortunately, font size specifier in .fig seems to be ignored.
> >> Or I might be missing something.
> > 
> > Hmmm...  I guess I have been getting lucky, working only with .fig files
> > with a single font size.
> > 
> >> BTW, now that we can use -jN option for building .pdf files, wouldn't it
> >> be a good idea to get rid of .eps files in the repository whose sources
> >> are .fig files by adding a ".fig -> .eps" rule in Makefile?
> >> Then the patch would have been much smaller.
> >>
> >> Let me know what you think.
> > 
> > Making that initial clone and build go faster makes a lot of sense to me!
> 
> Well, current build starts from .eps and if we remove .eps, then the build
> will start from .fig. So the build time should increase somewhat.
> Reduction of the patch size will be the point of doing this.

Fair point!

> I'll try and evaluate how much longer the first build would take.
> Give me a week or so. Ah, my environment has only a few cores so the
> evaluation result would be only a hint.

I do have a 128-core system, although it is shared, so use of more than
(say) 64 cores is unlikely to give reproducible results.  Just let me
know exactly what you want tested, preferably by sending me a simple
script that does what you want.

							Thanx, Paul

