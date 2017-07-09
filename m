Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43325 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753110AbdGJByJ (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 9
 Jul 2017 21:54:09 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6A1rbLn069111
 for <perfbook@vger.kernel.org>; Sun, 9 Jul 2017 21:54:08 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bjukqa01c-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 09 Jul 2017 21:54:08 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 9 Jul 2017
 21:54:07 -0400
Date: Sun, 9 Jul 2017 12:26:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] litmus test updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
Message-Id: <20170709192655.GW2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 09, 2017 at 10:39:46AM +0900, Akira Yokosawa wrote:
> >From 955eefe8ad5a64fddd2e33b343ac3a1e171dd089 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 9 Jul 2017 09:53:28 +0900
> Subject: [PATCH 0/2] litmus test updates
> 
> Hi Paul,
> 
> I thought that embedding kernel API definitions in each litmus test is
> redundant. We can use #include instead. In this case, we need to
> specify a -I option for gcc as the compilation is done in a temporally
> directory. We can do so by using -ccopts option of litmus7.
> 
> Patch 1 does this change.

You know, I tried this and it kept complaining about not finding the
include file.  No idea what I was doing wrong, but whatever it was,
thank you very much for getting it right!!!

> However, in native run on x86_64, I'm seeing a significant difference
> in the resulting statistics.
> Before the change, a typical result is:
> 
>     Test C-SB+o-o+o-o Allowed
>     Histogram (4 states)
>     54    *>0:r2=0; 1:r2=0;
>     49999628:>0:r2=2; 1:r2=0;
>     49999697:>0:r2=0; 1:r2=2;
>     621   :>0:r2=2; 1:r2=2;
>     Ok
> 
> After the change, the result is something like:
> 
>     Test C-SB+o-o+o-o Allowed
>     Histogram (4 states)
>     26    *>0:r2=0; 1:r2=0;
>     49999782:>0:r2=2; 1:r2=0;
>     49999818:>0:r2=0; 1:r2=2;
>     374   :>0:r2=2; 1:r2=2;
>     Ok
> 
> In cross compilation mode, the result is similar and consistent
> with the native run after the change.
> So I suspect litmus7's behavior of native run is affected by the
> "-ccopts" option. Again, this might depend on the platform variation.

Between differences in compilers, compiler options, and hardware,
we should expect quite a bit of of variation.  In fact, there are
sometimes specific pieces of hardware that have much stronger
memory ordering than the architecture guarantees.

> Patch 2 adds targets for cross compilation mode of litmus7.
> Because we need to copy the custom header file "api.h" into the target
> directory, I made the recipe to do so.

Looks good!

> I stopped short of adding recipes to make an archive and scp it to
> remote host and to do remote compilation and execution via ssh.
> They can be added later.

Your choice on this one.  ;-)

> On PPC, the result of C-SB+o-o+o-o.litmus looks interesting.
> (Of course, you are familiar with PPC, but...)
> 
>     Test C-SB+o-o+o-o Allowed
>     Histogram (4 states)
>     988335*>0:r2=0; 1:r2=0;
>     49516879:>0:r2=2; 1:r2=0;
>     49494779:>0:r2=0; 1:r2=2;
>     7     :>0:r2=2; 1:r2=2;
>     Ok

I am not surprised by this.  PPC tends to do more local processing for
longer than x86 does, as an extremely rough rule of thumb.  PPC's weak
ordering enables this.  So getting the outcome where both CPUs communicate
with each other should be harder on PPC than on x86.

>     Witnesses
>     Positive: 988335, Negative: 99011665
>     Condition exists (1:r2=0 /\ 0:r2=0) is validated
>     Hash=9bb70a6ed845b4be5f335c7eeb134f3f
> 
> Note that I've not tested the result of "cross-arm" target actually
> builds and runs on ARM hosts.

There are supposed to be places to get free access to ARM hardware.
If you don't find one, let me know, and I will be happy to reach out
to my contacts at ARM and Linaro.

> How does this approach look like?

Quite nice!  I queued and pushed it, again, thank you!

							Thanx, Paul

>         Thanks, Akira
> -- 
> Akira Yokosawa (2):
>   advsync: Use '#include "api.h"' in litmus tests
>   advsync: Add cross compilation targets
> 
>  CodeSamples/advsync/herd/.gitignore                |  5 ++++
>  CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus |  4 +--
>  CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus       |  3 +-
>  CodeSamples/advsync/herd/Makefile                  | 34 ++++++++++++++++++++--
>  CodeSamples/advsync/herd/api.h                     |  8 +++++
>  5 files changed, 47 insertions(+), 7 deletions(-)
>  create mode 100644 CodeSamples/advsync/herd/api.h
> 
> -- 
> 2.7.4
> 

