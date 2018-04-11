Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44332 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750734AbeDKRxr (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 11 Apr 2018 13:53:47 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3BHkAud078735
 for <perfbook@vger.kernel.org>; Wed, 11 Apr 2018 13:53:46 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2h9nf34nvs-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Wed, 11 Apr 2018 13:53:44 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 11 Apr
 2018 13:53:44 -0400
Date: Wed, 11 Apr 2018 10:54:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: different kind of memory reordering clarification
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
 <20180411024538.grp62hwvtxpapzeh@HP> <20180411030058.dwnk52wctplchxbt@HP>
 <20180411030904.GI3948@linux.vnet.ibm.com>
 <20180411034324.3zcgym67h2c5dbmp@HP> <20180411035908.nphhtjpbfrwt6pwb@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180411035908.nphhtjpbfrwt6pwb@HP>
Message-Id: <20180411175444.GT3948@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 11, 2018 at 11:59:08AM +0800, Yubin Ruan wrote:
> On Wed, Apr 11, 2018 at 11:43:24AM +0800, Yubin Ruan wrote:
> > On Tue, Apr 10, 2018 at 08:09:04PM -0700, Paul E. McKenney wrote:
> > > On Wed, Apr 11, 2018 at 11:00:58AM +0800, Yubin Ruan wrote:
> > > > On Wed, Apr 11, 2018 at 10:46:28AM +0800, Yubin Ruan wrote:
> > > > > On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> > > > > > On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > > > > > > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
> > > > > [...]
> > > > > > > > 
> > > > > > > > Can you please provide me with some examples or references for different kinds
> > > > > > > > of memory reordering in a SMP system? You know, there are different kinds of
> > > > > > > > reordering:
> > > > > > > > 
> > > > > > > >    - Loads reordered after loads
> > > > > > > >    - Loads reordered after stores
> > > > > > > >    - Stores reordered after stores
> > > > > > > >    - Stores reordered after loads
> > > > > > > >    - Atomic reordered with loads
> > > > > > > >    - Atomic reordered with stores
> > > > > > > >    - Dependent loads reordered (DEC alpha)
> > > > > > > 
> > > > > > > I remember there is open-std.org webpage containing comparision of C++'s
> > > > > > > memory model to those primitives used in the Linux kernel. But I just can't
> > > > > > > find that page.
> > > > > > 
> > > > > > Here you go!
> > > > > > 
> > > > > > http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
> > > > > > 
> > > > > > There will be an update in a month or so, but the above is pretty
> > > > > > close.  Also, the Linux-kernel memory model was presented at
> > > > > > ASPLOS and accepted into the Linux kernel itself:
> > > > > > 
> > > > > > https://paulmck.livejournal.com/49667.html
> > > > > 
> > > > > Many thanks. But I am currently confused about the relationship between
> > > > > terminologies used in the Linux kernel and those used in some programming
> > > > > languages (e.g., C++), i.e., the relationships between
> > > > > 
> > > > >     memory_order_release
> > > > >     memory_order_relaxed
> > > > >     memory_order_acquire
> > > > >     memory_order_seq_cst
> > > > >     ...
> > > > > 
> > > > > and those used in the kernel:
> > > > > 
> > > > >     READ_ONCE() / WRITE_ONCE()
> > > > >     rmb() / wmb() / mb() / smp_mb()
> > > > >     ...
> > > > > 
> > > > > Any materials for that?
> > > > 
> > > > Hmm, to be more exact, what I want is something like this:
> > > > 
> > > >     “These primitives can be expressed directly in terms of the upcoming
> > > >     C++0x standard. For the smp_mb() primitive this correspondence is not
> > > >     exact; our memory barriers are somewhat stronger than the standard’s
> > > >     atomic_thread_fence(memory_order_seq_cst). The LOAD_SHARED() primitive
> > > >     maps to x.load(memory_order_relaxed) and STORE_SHARED() to
> > > >     x.store(memory_order_relaxed). The barrier() primitive maps to
> > > >     atomic_signal_fence(memory_order_seq_cst). In addition, rcu_dereference()
> > > >     maps to x.load(memory_order_consume) and rcu_assign_pointer() maps to
> > > >     x.store(v, memory_order_release).”
> > > 
> > > Those are still valid.  Again, the other paper from my earlier email
> > > has more mappings.
> > 
> > Sorry I missed that! (trying to read too much all at once)
> > 
> > I read about atomic_ops here
> > 
> >     https://www.kernel.org/doc/html/v4.14/core-api/atomic_ops.html
> > 
> > and find that many "atomic" operations such as
> > atomic_set/atomic_read/atomic_write does not require volatile semantic, nor
> > does it require alignment constraints that force the CPU to do load/store "at
> > once". In this situation, both the compiler and the processor are all allowed
> > to tear apart a read/write atomic operation. How can it be "atomic" in this
> > case?
> 
> Hmm... Reading more source code confirms that there are READ_ONCE/WRITE_ONCE
> used in atomic_set/atomic_read/atomic_write. But these does not prevent the
> processor from tearing apart the reads/write.

But it does prevent the compiler from doing so if the variable is
small enough to be accessed with a single load/store instruction.
And if the variable is aligned, the processor won't split a single
load/store instruction.  And if the processor doesn't have (say) a
load-byte instruction, the current C-language standard requires it to use
an atomic read-modify-write sequence, which also avoids the tearing apart.

>                                               Can the definition
> 
>     typedef struct { int counter; } atomic_t;
> 
> guarantee necessary alignment constraints required by the processor to perform
> atomic operations?

Yes, the compiler aligns machine types (including int).  Unless you use
"packed" or some such, but if you do that, you get what you deserve.  ;-)

							Thanx, Paul

