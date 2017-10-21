Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35842 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932179AbdJURp3 (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 21
 Oct 2017 13:45:29 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9LHixUU109284
 for <perfbook@vger.kernel.org>; Sat, 21 Oct 2017 13:45:29 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dr0jp3h3w-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 21 Oct 2017 13:45:28 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 21 Oct
 2017 13:45:27 -0400
Date: Sat, 21 Oct 2017 10:45:25 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Probably redundant code at listing 7.7
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiPGe4NaZMef_-gXF4Oyk8tP+DhmPYfrhgvEEHzTnmm59g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiPGe4NaZMef_-gXF4Oyk8tP+DhmPYfrhgvEEHzTnmm59g@mail.gmail.com>
Message-Id: <20171021174525.GN3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 21, 2017 at 09:58:12PM +0800, Yubin Ruan wrote:
> Hi,
> 
> In Listing 7.7, a hierarchy/conditional locking example is used to
> show how to reduce how contention:
> 
> 1 void force_quiescent_state(struct rcu_node *rnp_leaf)
> 2 {
> 3      int ret;
> 4      struct rcu_node *rnp = rnp_leaf;
> 5      struct rcu_node *rnp_old = NULL;
> 6
> 7      for (; rnp != NULL; rnp = rnp->parent) {
> 8          ret = (ACCESS_ONCE(gp_flags)) ||
> 9                  !raw_spin_trylock(&rnp->fqslock);
> 10         if (rnp_old != NULL)
> 11             raw_spin_unlock(&rnp_old->fqslock);
> 12         if (ret)
> 13             return;
> 14         rnp_old = rnp;
> 15     }
> 16     if (!ACCESS_ONCE(gp_flags)) {
> 17         ACCESS_ONCE(gp_flags) = 1;
> 18         do_force_quiescent_state();
> 19         ACCESS_ONCE(gp_flags) = 0;
> 20     }
> 21     raw_spin_unlock(&rnp_old->fqslock);
> 22 }
> 
> I understand the purpose and most of the implementation of the code.
> But one thing I don't really understand is that why we need line 16
> here? By reaching line 16, we can be sure that that particular process
> have already acquired the fqslock of the root node and it should be
> the only one to reach there. So, it will always see gp_flags == 0 when
> reaching line 16.
> 
> Did I miss anything? I read Quick Quiz 7.21 and it seems that there
> might be some tricky things there.

Within the confines of this particular example, you miss nothing.

I simplified the code from that in the Linux kernel, which you can see at
http://elixir.free-electrons.com/linux/latest/source/kernel/rcu/tree.c#L2942

In that code, force_quiescent_state() doesn't clear ->gp_flags itself,
it instead invokes rcu_gp_kthread_wake() to wake up another kernel
thread.  This means that the second CPU can acquire the root-level
->fqslock and see ->gp_flags equal to 1.

So how should I fix this example?

One approach would be to drop the check on line 16, as reflected in
your question.  The downside of this approach is that two closely
spaced calls to force_quiescent_state() might needlessly both call
do_force_quiescent_state() -- the first call would service both requests,
so the second call would be needless overhead.  But perhaps that is too
detailed a consideration.

Another approach would be to move line 19 to follow line 21, possibly
with a timed wait in between.  The idea here is that you never need to
invoke do_force_quiescent_state() more than (say) ten times a second,
so the "winner" waits a tenth of a second before clearing gp_flags.

A third approach would be to add the wake-up code from the Linux kernel
back into the example.

Right now, the timed-wait approach seems best, as it is simple, yet
teaches the point of this technique.  But does anyone have a better idea?

							Thanx, Paul

