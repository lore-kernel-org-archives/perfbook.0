Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:47197 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S932903AbcECNEU (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 3 May 2016
 09:04:20 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 3 May 2016
 09:04:19 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 6B0556E8041
 for <perfbook@vger.kernel.org>; Tue, 3 May 2016 09:03:55 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u43D49Tj40894612	for <perfbook@vger.kernel.org>; Tue, 3 May 2016 13:04:09 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u43D49PB008530	for <perfbook@vger.kernel.org>; Tue, 3 May 2016 09:04:09 -0400
Date: Tue, 3 May 2016 06:04:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: RFT withdrawn (was Re: [RFT PATCH 0/5] Another round of build
 script tweaks)
Message-ID: <20160503130414.GA3800@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
 <dfd9ba68-6653-d26e-65ed-01d098327417@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfd9ba68-6653-d26e-65ed-01d098327417@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 03, 2016 at 09:55:51PM +0900, Akira Yokosawa wrote:
> On 2016/05/03 7:47, Akira Yokosawa wrote:
> >>From 4ce174f3c72367fed945fb4448e294d205b8d88a Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiysw@gmail.com>
> > Date: Tue, 3 May 2016 00:18:53 +0900
> > Subject: [RFT PATCH 0/5]  Another round of build script tweaks
> > 
> > This series restructures build scripts rather radically. 
> > My initial feeling was that [5/5] would be the most controversial,
> > and placed at the end of the series.
> > But in hindsight, [1/5] seems to be the most controversial one.
> > 
> > Anyway, I'd like people to try them and give feedback.
> > 
> > In commit 4038e781ed56 ("Improve behavior of build scripts"),
> > I caused some regressions.  They were fixed soon after,
> > but I think changes in build scripts need to be heavily tested
> > before being pulled in.
> > 
> > Any feedback is welcome. Thanks.
> > 
> > Akira Yokosawa (5):
> >   Further improvement of build scripts
> >   Add font installation check
> >   Add short name targets in Makefile
> >   Add explanation of short name target in FAQ.txt
> >   Make default target of Makefile overridable
> > 
> >  .gitignore            |   10 +-
> >  FAQ.txt               |   23 +
> >  Makefile              |  322 +--
> >  contrib.tex           |   60 -
> >  count/sig-theft.dot   |   19 +-
> >  count/sig-theft.eps   |  457 ---
> >  origpub.tex           |    8 -
> >  qqz.tex               | 7707 -------------------------------------------------
> >  utilities/eps2pdf.sh  |   12 +
> >  utilities/runlatex.sh |    9 +
> >  10 files changed, 181 insertions(+), 8446 deletions(-)
> >  delete mode 100644 contrib.tex
> >  delete mode 100644 count/sig-theft.eps
> >  delete mode 100644 origpub.tex
> >  delete mode 100644 qqz.tex
> > 
> 
> As I reported in another mail, this series causes painful side-effects.
> Please refrain from trying this series.
> 
> I'll resubmit v2 of this series soon.
> 
> Sorry for the trouble.

Not a problem, as I was slow about getting to it anyway.  Looking forward
to the next version!

							Thanx, Paul

