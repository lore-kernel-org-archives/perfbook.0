Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55985 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752155AbcL2D4B (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 28
 Dec 2016 22:56:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBT3rjcp113188
 for <perfbook@vger.kernel.org>; Wed, 28 Dec 2016 22:56:00 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27mjynmycp-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 28 Dec 2016 22:56:00 -0500
Received: from localhost by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 28 Dec
 2016 20:55:59 -0700
Date: Wed, 28 Dec 2016 19:56:03 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
Reply-To: paulmck@linux.vnet.ibm.com
References: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
 <20161227205345.GO3742@linux.vnet.ibm.com>
 <111de212-9aeb-95b8-4e72-9edef7cff417@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <111de212-9aeb-95b8-4e72-9edef7cff417@gmail.com>
Message-Id: <20161229035603.GB3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 28, 2016 at 07:07:28AM +0900, Akira Yokosawa wrote:
> On 2016/12/27 12:53:45 -0800, Paul E. McKenney wrote:
> > On Wed, Dec 28, 2016 at 12:25:48AM +0900, Akira Yokosawa wrote:
> >> >From 3f4f73d738b77422bd074322f3ac67f644a8d580 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Wed, 28 Dec 2016 00:10:28 +0900
> >> Subject: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
> >>
> >> Hi Paul,
> >>
> >> On 2016/12/26 16:39:52 -0800, Paul E. McKenney wrote:
> >>> On Mon, Dec 26, 2016 at 11:52:40PM +0900, Akira Yokosawa wrote:
> >> [snip]
> >>>> One idea is to use alphapf.bst only for 1c with inlinelinks enabled. 
> >>>>
> >>>> Thoughts?
> >>>
> >>> I am good with enabling alphaph.bst inlinelinks only for 1c!
> >>
> >> So, this patch set does the change.
> >> For 2c, we reverted to the original alpha bibliography style for the
> >> moment.
> >> And I'll keep polishing the band-aid script to shorten the href-ed part
> >> in titles. You might want to try it for 2c when you do a release.
> > 
> > Applied and pushed, thank you!
> > 
> > Speaking of releases, for whatever it is worth, I expect to do one
> > in a few days.
> 
> Every 6 month!
> 
> At the current state of ongoing bibliography update, I don't think
> it makes much difference if you try inlinelinks for 2c.
> Or, will you apply the "bib-append-dio" series this time?
> Then it might be worthwhile. You can replace the released .pdf with
> inlinelinks enabled after the fact.
> 
> I have readied other branches of url updates of .bib files, but I thought
> I should wait and send their pull request after the doi updates are applied.
> If you are willing to apply the other (lot of) updates for the next release,
> I can send the pull requests soon. But it is not urgent.
> 
> By the way, I want the "courier scaled" font to be default monospace
> font for 2c and 1c builds. Have you tried the "mss" target lately?
> If you are ok with it, I'll prepare a patch to do so.

It does build, but what am I looking for?  Does it allow me to remove
the bogus "~" characters in some of the tables containing \co{}?

							Thanx, Paul

>                                                  Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>                                                   Thanks, Akira
> >> --
> >> Akira Yokosawa (2):
> >>   Makefile: Fix .bbl dependency
> >>   Enable 'inlinelinks' option of alphapf.bst for 1c layout
> >>
> >>  Makefile              | 4 ++--
> >>  alphapf.bst           | 2 +-
> >>  appendix/appendix.tex | 6 +++++-
> >>  3 files changed, 8 insertions(+), 4 deletions(-)
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> > 
> 

