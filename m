Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36502 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725728AbeLBFna (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 2 Dec 2018 00:43:30 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB1ITFFp050276
        for <perfbook@vger.kernel.org>; Sat, 1 Dec 2018 13:30:23 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p3qayq90b-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 01 Dec 2018 13:30:22 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 1 Dec 2018 18:30:22 -0000
Date: Sat, 1 Dec 2018 10:30:19 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: lockless_dereference() in perfbook
Reply-To: paulmck@linux.ibm.com
References: <04a39364-9f34-16e6-fb01-4ac85a50fb6f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a39364-9f34-16e6-fb01-4ac85a50fb6f@gmail.com>
Message-Id: <20181201183019.GV4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Dec 01, 2018 at 04:48:03PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> As LKMM dropped lockless_dereference() when it was merged in v4.17,
> CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus fails to
> be evaluated by "make run-herd7" under CodeSamples/formal/herd.
> 
> lockless_dereference() is still covered by CodeSamples/formal/litmus/api.h
> and klitmus7, so the test can be evaluated by litmus7 and "klitmus7 at the
> moment.
> 
> In commit 48ec12dac0c3 ("memorder: Update based on v4.15 Linux kernel
> de-Alpha-ication"), you added a footnote in Section 15.2.3 saying:
> 
>     Note that lockless_dereference() is not needed on v4.15 and later,
>     and therefore is not available in these later Linux kernels.
> 
> There remain several lockless_dereference()s in perfbook without any
> updates.
> 
> In the Answer to Quick Quiz 15.15, lockless_dereference() is mentioned
> several times.
> 
> Quick Quiz 15.17 says:
> 
>     Why doesn't line 18 of Listing 15.12 need a lockless_dereference()?
> 
> Leading paragraph of Section 15.3.2.1 says:
> 
>     The load that heads your dependency chain must use proper ordering,
>     for example, lockless_dereference(), rcu_dereference(), or a READ_ONCE()
>     followed by smp_read_barrier_depends().
> 
> In the middle of Section 15.5, there is a sentence:
> 
>     Note also that a dependency leading to a load must be headed by a
>     lockless_dereference() or an rcu_dereference(): READ_ONCE() is not
>     sufficient.
> 
> Could you look into them?
> 
> One problem in regard to litmus tests might be that there is no means
> to indicate plain accesses with no memory barrier in current LKMM.
> At the moment, C-MP+o-wmb-o+o-addr-o.litmus behaves identically as
> C-MP+o-wmb-o+ld-addr-o.litmus would do.

Good catches!  How about the following?

1.	I remove CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus.

2.	I add a comment to the lockless_dereference() call in
	lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test
	stating that this API member is obsolete.

3.	I remove the (\path{C-MP+o-wmb-o+ld-addr-o.litmus}) from the
	discussion.  I also add a LaTeX comment stating which commit
	removed this file for future reference.

4.	I remove lockless_dereference() from CodeSamples/formal/litmus/api.h.

Does that sound reasonable?

							Thanx, Paul

