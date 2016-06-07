Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e17.ny.us.ibm.com ([129.33.205.207]:53931 "EHLO
 e17.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752401AbcFGXMN (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 7 Jun 2016
 19:12:13 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 7 Jun 2016
 19:12:12 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 052346E8041
 for <perfbook@vger.kernel.org>; Tue, 7 Jun 2016 19:11:53 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u57NCARP44302496	for <perfbook@vger.kernel.org>; Tue, 7 Jun 2016 23:12:10 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u57NC90P022396	for <perfbook@vger.kernel.org>; Tue, 7 Jun 2016 19:12:10 -0400
Date: Tue, 7 Jun 2016 16:12:12 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 0/3] Another round of cleanup and improvement of build
 scripts
Message-ID: <20160607231212.GO3723@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
 <20160607203351.GL3723@linux.vnet.ibm.com>
 <654099e5-1ade-4f17-c5e0-ccc395f2fea9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <654099e5-1ade-4f17-c5e0-ccc395f2fea9@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 08, 2016 at 07:21:23AM +0900, Akira Yokosawa wrote:
> On 2016/06/07 13:33:51 -0700, Paul E. McKenney wrote:
> > On Sun, Jun 05, 2016 at 11:52:36PM +0900, Akira Yokosawa wrote:
> >> >From d6c5dc0374c6e558d0acc003273b42537e50297f Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 5 Jun 2016 23:34:26 +0900
> >> Subject: [RFC PATCH 0/3] Another round of cleanup and improvement of build scripts
> >>
> >> Hi, 
> >>
> >> This series enables parallel build of '.pdf' figures in the first build
> >> or a build after removing them by 'make distclean' or 'make neatfreak'.
> >>
> >> It is by no means complete, but it works just fine for the evaluation
> >> purposes. Any feedback is welcome. Further improvements and cosmetic
> >> changes are in my to-do list.
> >>                                                      Thanks, Akira
> > 
> > I applied and pushed these, thank you.
> 
> Oh! I didn't expect them to be applied at the half baked stage...
> Anyway, thanks.

Easy to back them out if you would rather rework them  -- just let
me know.

> > (And yes, I missed the pull request, so the SHA-1's do not match,
> > apologies!)
> 
> No problem!
> 
> I'll submit followup patches later today. (I mean within 20 hours.)

Looking forward to them!

							Thanx, Paul

>                                                    Thanks, Akira
> 
> > 							Thanx, Paul
> > 
> >> The series can also be pulled as follows:
> >>
> >> ---- 
> >> The following changes since commit e719d43325af354d6f0a8a8c8d914b82430a9ff4:
> >>
> >>   Add TEST_HASH symbol to allow tests to be excluded (2016-05-30 09:50:52 -0700)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git cleanup-makefile
> >>
> >> for you to fetch changes up to d6c5dc0374c6e558d0acc003273b42537e50297f:
> >>
> >>   Makefile: Promote eps2pdf.sh to implicit rules (2016-06-05 23:17:49 +0900)
> >> ----
> >>
> >> Akira Yokosawa (3):
> >>   Remove .eps files whose sources are .dot
> >>   FAQ-BUILD.txt: Add graphviz package as required
> >>   Makefile: Promote eps2pdf.sh to implicit rules
> >>
> >>  FAQ-BUILD.txt           |   4 +-
> >>  Makefile                |  62 ++---
> >>  advsync/.gitignore      |   1 +
> >>  advsync/store15tred.eps | 653 ------------------------------------------------
> >>  count/.gitignore        |   1 +
> >>  count/sig-theft.eps     | 435 --------------------------------
> >>  6 files changed, 30 insertions(+), 1126 deletions(-)
> >>  create mode 100644 advsync/.gitignore
> >>  delete mode 100644 advsync/store15tred.eps
> >>  create mode 100644 count/.gitignore
> >>  delete mode 100644 count/sig-theft.eps
> >>
> >> -- 
> >> 1.9.1
> >>
> > 
> > 
> 

