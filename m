Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiJSWQC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 19 Oct 2022 18:16:02 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F1E1B6C93
        for <perfbook@vger.kernel.org>; Wed, 19 Oct 2022 15:16:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 439C9CE247B
        for <perfbook@vger.kernel.org>; Wed, 19 Oct 2022 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666217757;
        bh=X7Rn34X/qXggkXv/fH+aNx9m8m2V5dz9qt8CmUNDmCs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=l6hgVTuYO6CpTcyeP/oTrNG4GDlRvVVY1RZZ4P+/o1aFWCeHvGUogQuQcMBXZmMtW
         IypIIVC0411UXQeaEAhWk1r2RxS46G8IrSdrHoiPnxUudJaYbWAUSZZrDjn7BCSekh
         5XLL4QJHhJ4ZAR2mnmAkWkEXcdcBsSf/MXcvvRjha+gV30Efnf6dr06/u5ZOIfhO4C
         Wf+LMmxZ9jH6E730DPtBTH56kAg9ApQY2A3F9MeBnMjKiC/DQIhWwl19XFBhX4B+gd
         ++o2rcYwLFpro29VEDqKz4V3DJk49lM3rpQ0uvsN8rD0ReefjP/XgX2IulJ2aevYnI
         pBS2yLkULBF0A==
Date: Wed, 19 Oct 2022 15:15:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 7.3.2: Mention of futexes
Message-ID: <20221019221556.GG5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FXoEOio8u72S20cWxJYcu1Z5No7n9bpNOQB8THnVzraqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FXoEOio8u72S20cWxJYcu1Z5No7n9bpNOQB8THnVzraqA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 14, 2022 at 08:01:29AM -0400, Elad Lahav wrote:
> Hello,
> 
> I'm not sure about the statement made in this section: "In contrast,
> Linux avoids these hints, in-
> stead getting similar results from a mechanism called futexes".
> Futexes are just wrappers around kernel mutexes, to speed up the case
> of acquiring a free lock. As such they do not solve the priority
> inversion problem, and are certainly not a replacement for disabling
> pre-emption when using spin locks.
> Kernel-level mutexes may address priority inversion by employing one
> of the established protocols (priority inheritance or priority
> protection).
> 
> Am I missing something?

Futexes were the response of the Linux kernel community to the request
from certain large database vendors for the ability to disable preemption
in userspace applications.  I was there and I heard it with my own ears,
but to your point I find little on the web to back this up.  In fact,
I am not easily finding the fact that most proprietary UNIX kernels did
in fact have userspace disable-preemption hints.

Futexes are more a sleep/wakeup mechanism than a wrapper around mutexes,
though there was a hilarious bug early on that allowed a usermode
application to force a kernel-mode deadlock.  The semantics are involved,
a fact being driven home to those attempting to standardize it.

How about the following change?  This documents futexes as the response
to the request for scheduler-conscious synchronization, but does not
claim anything beyond that.

							Thanx, Paul

------------------------------------------------------------------------

commit 63c4deb868d5eec9df96fd8810e58e1519abb392
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Oct 19 15:14:03 2022 -0700

    locking: Avoid over-claiming for futexes
    
    It is true that futexes were the response of the Linux-kernel community
    to requests for user-mode disabling of preemption, but it is not clear
    how futexes were evaluated by those making the requests.
    
    Reported-by: Elad Lahav <e2lahav@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/locking/locking.tex b/locking/locking.tex
index b138cd59..6d3bb1c8 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2057,8 +2057,9 @@ being placed in a machine register.
 These hints frequently take the form of a bit set in a particular
 machine register, which enables extremely low per-lock-acquisition overhead
 for these mechanisms.
-In contrast, Linux avoids these hints, instead getting
-similar results from a mechanism called
+In contrast, Linux avoids these hints.
+Instead, the Linux kernel community's response to requests for
+scheduler-conscious synchronization was a mechanism called
 \emph{futexes}~\cite{HubertusFrancke2002Futex,IngoMolnar2006RobustFutexes,StevenRostedt2006piFutexes,UlrichDrepper2011Futexes}.
 
 Interestingly enough, atomic instructions are not strictly needed to
