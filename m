Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44836 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932205AbeBTACC (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 19
 Feb 2018 19:02:02 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1JNwo8N117910
 for <perfbook@vger.kernel.org>; Mon, 19 Feb 2018 19:02:02 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2g87rnshv6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 19 Feb 2018 19:01:47 -0500
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 19 Feb
 2018 19:01:46 -0500
Date: Mon, 19 Feb 2018 16:02:06 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] CodeSamples/formal/herd: Remove dependency to
 linux-kernel-hardware.cat
Reply-To: paulmck@linux.vnet.ibm.com
References: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
 <20180219175353.GX3617@linux.vnet.ibm.com>
 <2f80327a-ee5e-b7c6-5248-291400a0bcb9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f80327a-ee5e-b7c6-5248-291400a0bcb9@gmail.com>
Message-Id: <20180220000206.GB3617@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 20, 2018 at 07:54:59AM +0900, Akira Yokosawa wrote:
> On 2018/02/20 2:53, Paul E. McKenney wrote:
> > On Tue, Feb 20, 2018 at 12:14:24AM +0900, Akira Yokosawa wrote:
> >> >From 9ef0701c8f161c8582bd6084e5d2706a0ad92d00 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Tue, 20 Feb 2018 00:09:53 +0900
> >> Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to linux-kernel-hardware.cat
> >>
> >> linux-kernel-hardware.cat is not present in the branch expected
> >> to be merged in 4.17 window.
> > 
> > Good point, but it might be added at some later date.
> 
> Let me rephrase the change log. How about the following reasoning.
> 
> The target "run-herd7" doesn't depend on linux-kernel-hardware.cat.
> So remove it from the dependency list.
> This change also makes the target compatible with memory-consistency-model
> branch[1] intended to be in Linux 4.17 window at the moment.

What I get for looking at patches too early in the morning!  For some
reason I got the idea that you were removing linux-kernel-hardware.cat
itself.

> NOTE: They say https://github.com/aparri/memory-model.git won't be
> updated any more.
> 
> NOTE: We can add a target to run litmus tests with linux-kernel-hardware.cat
> once it is added in mainline or a prospective branch.
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git lkmm

This would be quite good, but let's wait until it gets to mainline.

But yes, please do update the change log as above and I will be happy
to apply the result.

> >                                                       This does raise
> > the question of whether it makes any sense to try to keep up with the
> > Linux-kernel memory model once that model is in mainline.  ;-)
> 
> You mean litmus tests used in perfbook and their explanation?

I mean the models themselves in CodeSamples/formal/herd/memory-model.
Except that yes, this is a symbolic link.  So clearly not a problem
at all.

Never mind!!!  Like I said, too early this morning!  :-/

							Thanx, Paul

>       Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >>  CodeSamples/formal/herd/Makefile | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
> >> index 8e0635a..3162659 100644
> >> --- a/CodeSamples/formal/herd/Makefile
> >> +++ b/CodeSamples/formal/herd/Makefile
> >> @@ -31,7 +31,7 @@
> >>
> >>  LKMM_DIR     := memory-model
> >>  LKMM_FILES   := linux-kernel.bell linux-kernel.cat linux-kernel.cfg \
> >> -		linux-kernel.def linux-kernel-hardware.cat lock.cat
> >> +		linux-kernel.def lock.cat
> >>  LKMM_LIST    := $(addprefix $(LKMM_DIR)/,$(LKMM_FILES))
> >>  HERD_DIR     := $(shell pwd)
> >>  HERD7_CMD    := $(shell which herd7)
> >> -- 
> >> 2.7.4
> >>
> > 
> 

