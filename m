Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e19.ny.us.ibm.com ([129.33.205.209]:38513 "EHLO
 e19.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S965455AbcDLQAI (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 12 Apr 2016
 12:00:08 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 12 Apr
 2016 12:00:07 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 71BB8C90045
 for <perfbook@vger.kernel.org>; Tue, 12 Apr 2016 11:59:57 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3CG022Z26673198	for <perfbook@vger.kernel.org>; Tue, 12 Apr 2016 16:00:02
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3CG01WR010615	for <perfbook@vger.kernel.org>; Tue, 12 Apr 2016 12:00:01
 -0400
Date: Tue, 12 Apr 2016 09:00:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Another fix to use latex reference feature
 consistently
Message-ID: <20160412160027.GH3568@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <57087D07.6030207@gmail.com>
 <alpine.DEB.2.10.1604091434270.32362@hxeon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1604091434270.32362@hxeon>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Apr 09, 2016 at 02:46:15PM +0900, SeongJae Park wrote:
> Hello,
> 
> The patch looks good to me.  Just FYI, however, I think it would be
> better to use `git format-patch` for patch creation because a patch that
> made with the command can be merged in git repository more easily.
> 
> Acked-by: SeongJae Park <sj38.park@gmail.com>

Queued with SeongJae's Acked-by, thank you both.

Akira, in the future, please do use "git format-patch" and also please
use the Linux-kernel preferred format for referencing commits, as shown
in the updated commit below.  The idea is to use the first 12 digits of
the SHA-1 commit ID, followed by the subject line in both quotes and
parentheses.

							Thanx, Paul

> On Sat, 9 Apr 2016, Akira Yokosawa wrote:
> 
> >Hello,
> >
> >This is the first time I submit a patch.
> >I'm not sure the format below is acceptable or not, but just trying.
> >If there is any issue, please advise me.
> >
> >Regards,
> >
> >Akira Yokosawa <akiyks@gmail.com>
> >
> >-- >8 --
> >Subject: [PATCH] advsync: Another fix to use latex reference feature consistently
> >
> >In commit 91bde6aa87c2884f19d2a83534236cdbb319d625, SeongJae Park
> >has made changes to enforce latex reference feature to the references
> >in the `Advanced Synchronization` chapter. However one of section
> >name direct citations is left unchanged in the commit.
> >This commit fixes the remaining one.
> >
> >Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> >---
> >advsync/memorybarriers.tex | 2 +-
> >1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> >index 12771ec..e527def 100644
> >--- a/advsync/memorybarriers.tex
> >+++ b/advsync/memorybarriers.tex
> >@@ -1508,7 +1508,7 @@ Read memory barriers imply data dependency barriers, and so can substitute
> >for them.
> >
> >$\dagger$ Note that read barriers should normally be paired with write barriers;
> >-see the ``SMP barrier pairing'' subsection.
> >+see Secton~\ref{sec:advsync:SMP Barrier Pairing}.
> >
> >\paragraph{General Memory Barriers}
> >
> >-- 
> >1.9.1

------------------------------------------------------------------------

commit 5795796caa89e7a5720b74a05886ba7c7f897725
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Tue Apr 12 08:56:45 2016 -0700

    advsync: Another fix to use latex reference feature consistently
    
    In commit 91bde6aa87c2 ("advsync: Use latex reference feature
    consistently"), SeongJae Park has made changes to enforce latex
    reference feature to the references in the `Advanced Synchronization`
    chapter. However one of section name direct citations is left unchanged
    in the commit.  This commit fixes the remaining one.
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Acked-by: SeongJae Park <sj38.park@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 12771ec38bee..e527def5b2ea 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1508,7 +1508,7 @@ Read memory barriers imply data dependency barriers, and so can substitute
 for them.

 $\dagger$ Note that read barriers should normally be paired with write barriers;
-see the ``SMP barrier pairing'' subsection.
+see Secton~\ref{sec:advsync:SMP Barrier Pairing}.

 \paragraph{General Memory Barriers}


