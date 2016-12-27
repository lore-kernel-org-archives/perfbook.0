Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32949 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752216AbcL0Uxq (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 27
 Dec 2016 15:53:46 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBRKrjqQ098123
 for <perfbook@vger.kernel.org>; Tue, 27 Dec 2016 15:53:45 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27kp3qngr5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 27 Dec 2016 15:53:45 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 27 Dec
 2016 13:53:43 -0700
Date: Tue, 27 Dec 2016 12:53:45 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
Reply-To: paulmck@linux.vnet.ibm.com
References: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
Message-Id: <20161227205345.GO3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 28, 2016 at 12:25:48AM +0900, Akira Yokosawa wrote:
> >From 3f4f73d738b77422bd074322f3ac67f644a8d580 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 28 Dec 2016 00:10:28 +0900
> Subject: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
> 
> Hi Paul,
> 
> On 2016/12/26 16:39:52 -0800, Paul E. McKenney wrote:
> > On Mon, Dec 26, 2016 at 11:52:40PM +0900, Akira Yokosawa wrote:
> [snip]
> >> One idea is to use alphapf.bst only for 1c with inlinelinks enabled. 
> >>
> >> Thoughts?
> >
> > I am good with enabling alphaph.bst inlinelinks only for 1c!
> 
> So, this patch set does the change.
> For 2c, we reverted to the original alpha bibliography style for the
> moment.
> And I'll keep polishing the band-aid script to shorten the href-ed part
> in titles. You might want to try it for 2c when you do a release.

Applied and pushed, thank you!

Speaking of releases, for whatever it is worth, I expect to do one
in a few days.

							Thanx, Paul

>                                                   Thanks, Akira
> --
> Akira Yokosawa (2):
>   Makefile: Fix .bbl dependency
>   Enable 'inlinelinks' option of alphapf.bst for 1c layout
> 
>  Makefile              | 4 ++--
>  alphapf.bst           | 2 +-
>  appendix/appendix.tex | 6 +++++-
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> -- 
> 2.7.4
> 

