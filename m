Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39318 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751027AbdFDV6J (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 4
 Jun 2017 17:58:09 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v54LrPv4045947
 for <perfbook@vger.kernel.org>; Sun, 4 Jun 2017 17:58:08 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2avtekg68t-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 04 Jun 2017 17:58:08 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 4 Jun 2017
 17:58:07 -0400
Date: Sun, 4 Jun 2017 14:58:06 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] CodeSamples: Fixes for ppc64
Reply-To: paulmck@linux.vnet.ibm.com
References: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
 <20170603202028.GJ3721@linux.vnet.ibm.com>
 <bd82cda7-3ddc-fee8-4b10-bbb0f71da03e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd82cda7-3ddc-fee8-4b10-bbb0f71da03e@gmail.com>
Message-Id: <20170604215806.GM3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jun 04, 2017 at 08:32:49AM +0900, Akira Yokosawa wrote:
> On 2017/06/03 13:20:28 -0700, Paul E. McKenney wrote:
> > On Sat, Jun 03, 2017 at 04:01:39PM +0900, Akira Yokosawa wrote:
> >> >From 7c151a100ef7d6c30259a966c68c45421edd7707 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sat, 3 Jun 2017 13:32:49 +0900
> >> Subject: [PATCH 0/2] CodeSamples: Fixes for ppc64
> >>
> >> Hi Paul,
> >>
> >> With the help of you, I now have an access to a ppc64 instance on
> >> OSU Open Source Lab.
> >>
> >> I tried to build under CodeSamples/ there.
> >> But I needed to fix dependency rules I updated recently.
> >> Also, script for ppc64 in Makefile failed to copy
> >> api-pthreads/api-gcc.h to api.h.
> >> Patch 1 fixes them.
> >>
> >> Patch 2 removes GCC flags specific to POWER5, and update links
> >> to pages with regard to optimization for POWER.
> >>
> >> And there are a few things I want to confirm regarding CodeSamples.
> >>
> >> (1) Is libucru a must now?
> >>
> >> If it is the case, we should remove "else" blocks in Makefile
> >> which copu linux/list.h to api.h.
> > 
> > These were put in place because old versions of liburcu didn't support
> > lists.  I would guess that there still are some distros using those
> > old versions, but if not, then you are right that there would be no
> > point in keeping the "else" blocks.
> 
> I asked this because without liburcu installed, build fails with errors
> and warnings saying:
> 
> > cc -g -O3 -Wall -g -o lockdeq -DTEST lockdeq.c -lpthread
> > lockdeq.c:70:23: error: field 'chain' has incomplete type
> >   struct cds_list_head chain;
> >                        ^
> > lockdeq.c: In function 'init_pdeq':
> > lockdeq.c:103:3: warning: implicit declaration of function 'CDS_INIT_LIST_HEAD' [-Wimplicit-function-declaration]
> >    CDS_INIT_LIST_HEAD(&d->bkt[i].chain);
> >    ^
> > lockdeq.c: In function 'pdeq_pop_l':
> > lockdeq.c:117:6: warning: implicit declaration of function 'cds_list_empty' [-Wimplicit-function-declaration]
> >   if (cds_list_empty(&p->chain))
> >       ^
> > lockdeq.c:121:3: warning: implicit declaration of function 'cds_list_del' [-Wimplicit-function-declaration]
> >    cds_list_del(e);
> >    ^
> > lockdeq.c: In function 'pdeq_push_l':
> > lockdeq.c:162:2: warning: implicit declaration of function 'cds_list_add_tail' [-Wimplicit-function-declaration]
> >   cds_list_add_tail(e, &p->chain);
> >   ^
> > lockdeq.c: In function 'pdeq_push_r':
> > lockdeq.c:177:2: warning: implicit declaration of function 'cds_list_add' [-Wimplicit-function-declaration]
> >   cds_list_add(e, &p->chain);
> >   ^
> > In file included from lockdeq.c:184:0:
> > deqtorture.h: At top level:
> > deqtorture.h:24:23: error: field 'l' has incomplete type
> >   struct cds_list_head l;
> >                        ^
> > deqtorture.h: In function 'concurrent_ppop':
> > deqtorture.h:110:8: warning: implicit declaration of function 'cds_list_entry' [-Wimplicit-function-declaration]
> >    p1 = cds_list_entry(p0, struct deq_elem, l);
> >         ^
> > deqtorture.h:110:27: error: expected expression before 'struct'
> >    p1 = cds_list_entry(p0, struct deq_elem, l);
> >                            ^
> > deqtorture.h: In function 'simple_deq_perf':
> > deqtorture.h:359:23: error: storage size of 'd' isn't known
> >   struct cds_list_head d;
> >                        ^
> > deqtorture.h:359:23: warning: unused variable 'd' [-Wunused-variable]
> > deqtorture.h: In function 'getdata':
> > deqtorture.h:477:27: error: expected expression before 'struct'
> >   return cds_list_entry(p, struct deq_elem, l)->data;
> >                            ^
> > deqtorture.h: In function 'main':
> > deqtorture.h:483:26: warning: variable 'e3' set but not used [-Wunused-but-set-variable]
> >   struct deq_elem e1, e2, e3;
> >                           ^
> > deqtorture.h:483:22: warning: variable 'e2' set but not used [-Wunused-but-set-variable]
> >   struct deq_elem e1, e2, e3;
> >                       ^
> > deqtorture.h:483:18: warning: variable 'e1' set but not used [-Wunused-but-set-variable]
> >   struct deq_elem e1, e2, e3;
> >                   ^
> > deqtorture.h: In function 'getdata':
> > deqtorture.h:478:1: warning: control reaches end of non-void function [-Wreturn-type]
> >  }
> >  ^
> > Makefile:35: recipe for target 'lockdeq' failed
> > make[1]: *** [lockdeq] Error 1
> 
> Can you look into this?
> I suppose linux/list.h needs some update.

At this point, I am happy to have the dependency on a recent version
of liburcu.  It is readily available, and it does not make much sense
to try to replicate its code within perfbook.  ;-)

> >> (2) Is little endian assuemed?
> >>
> >> You suggested to choose ppc64le for the instance on OSU Open Source Lab.
> >> Is there any code that doesn't work on big-endian platform?
> > 
> > Things should work on both big-endian and on little-endian.  But
> > Power is slowly shifting from big-endian to little-endian, so I
> > figured we should look to the future rather than the past.
> > 
> > Hmmm...  Do you have access to some big-endian Linux system?  Maybe
> > a SPARC or some such?
> 
> No.
> I asked because if it is known to not work on big-endian, I thought
> "make" should spit some warning. And I didn't know Ubuntu's POWER support
> is only for ppc64le... So, never mind.

Fair enough!

> >> (3) Can we remove gprof-helper.c?
> >>
> >> Although I fixed the entry in .gitignore the other day, gprof-helper.c
> >> lives in the repository from the beginning. Can we get rid of it?
> > 
> > It was necessary long ago, but it has been one long time since I used
> > gprof.  I tend to use perf instead.  So no objection here to removing it.
> 
> I see. I'll submit a patch to do so.

Looking forward to it!

> >>             Thanks, Akira
> >> -- 
> >> Akira Yokosawa (2):
> >>   CodeSamples: Fixes for build on ppc64le
> >>   CodeSamples: Remove cpu specific flag for ppc64
> > 
> > Queued and pushed, thank you!
> 
> BTW, I can create an account for you on the OSUOSL instance (Ubuntu 16.04).
> I believe you have accesses to ppc64, but having another would do
> no harm.
> Let me know your SSH public key if you'd like to.

No need!  I do have access, and it won't look good for me to be using
your machine.  ;-)

The main reason I wanted you to have your own access was to make it so
that you don't have to wait for me to get around to running tests on
your code.

							Thanx, Paul

>            Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>  CodeSamples/Makefile                 | 2 ++
> >>  CodeSamples/arch-ppc64/Makefile.arch | 7 +++++--
> >>  CodeSamples/depends.mk               | 2 ++
> >>  3 files changed, 9 insertions(+), 2 deletions(-)
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> > 
> 

