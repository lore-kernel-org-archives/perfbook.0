Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35072 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752498AbeDKDIF (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 10 Apr 2018 23:08:05 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3B34Y1J022793
 for <perfbook@vger.kernel.org>; Tue, 10 Apr 2018 23:08:04 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2h97gjncce-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Tue, 10 Apr 2018 23:08:04 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 10 Apr
 2018 23:08:03 -0400
Date: Tue, 10 Apr 2018 20:09:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: different kind of memory reordering clarification
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
 <20180411024538.grp62hwvtxpapzeh@HP> <20180411030058.dwnk52wctplchxbt@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180411030058.dwnk52wctplchxbt@HP>
Message-Id: <20180411030904.GI3948@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 11, 2018 at 11:00:58AM +0800, Yubin Ruan wrote:
> On Wed, Apr 11, 2018 at 10:46:28AM +0800, Yubin Ruan wrote:
> > On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> > > On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > > > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
> > [...]
> > > > > 
> > > > > Can you please provide me with some examples or references for different kinds
> > > > > of memory reordering in a SMP system? You know, there are different kinds of
> > > > > reordering:
> > > > > 
> > > > >    - Loads reordered after loads
> > > > >    - Loads reordered after stores
> > > > >    - Stores reordered after stores
> > > > >    - Stores reordered after loads
> > > > >    - Atomic reordered with loads
> > > > >    - Atomic reordered with stores
> > > > >    - Dependent loads reordered (DEC alpha)
> > > > 
> > > > I remember there is open-std.org webpage containing comparision of C++'s
> > > > memory model to those primitives used in the Linux kernel. But I just can't
> > > > find that page.
> > > 
> > > Here you go!
> > > 
> > > http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
> > > 
> > > There will be an update in a month or so, but the above is pretty
> > > close.  Also, the Linux-kernel memory model was presented at
> > > ASPLOS and accepted into the Linux kernel itself:
> > > 
> > > https://paulmck.livejournal.com/49667.html
> > 
> > Many thanks. But I am currently confused about the relationship between
> > terminologies used in the Linux kernel and those used in some programming
> > languages (e.g., C++), i.e., the relationships between
> > 
> >     memory_order_release
> >     memory_order_relaxed
> >     memory_order_acquire
> >     memory_order_seq_cst
> >     ...
> > 
> > and those used in the kernel:
> > 
> >     READ_ONCE() / WRITE_ONCE()
> >     rmb() / wmb() / mb() / smp_mb()
> >     ...
> > 
> > Any materials for that?
> 
> Hmm, to be more exact, what I want is something like this:
> 
>     “These primitives can be expressed directly in terms of the upcoming
>     C++0x standard. For the smp_mb() primitive this correspondence is not
>     exact; our memory barriers are somewhat stronger than the standard’s
>     atomic_thread_fence(memory_order_seq_cst). The LOAD_SHARED() primitive
>     maps to x.load(memory_order_relaxed) and STORE_SHARED() to
>     x.store(memory_order_relaxed). The barrier() primitive maps to
>     atomic_signal_fence(memory_order_seq_cst). In addition, rcu_dereference()
>     maps to x.load(memory_order_consume) and rcu_assign_pointer() maps to
>     x.store(v, memory_order_release).”

Those are still valid.  Again, the other paper from my earlier email
has more mappings.

> This is extracted from the paper "User-Level Implementations of Read-Copy
> Update" by M. Desnoyers and P. McKenney,  A. S. Stern, M. R. Dagenais and J.
> Walpole[1]. And the LOAD_SHARED() and STORE_SHARED() above are READ_ONCE() and
> WRITE_ONCE(), respectively. (BTW, LOAD_SHARED/STORE_SHARED seem to be better
> names than READ_ONCE/WRITE_ONCE, which are a bit confusing. How come people
> adopted those name?)

They came from ACCESS_ONCE().  They are _ONCE() because they prevent the
compiler from fusing and splitting accesses, which it can do with normal
loads and stores.  This Linux Weekly News article has some of this history:

	http://lwn.net/Articles/508991/

> (I find this after digging into a whole bunch of emails...hmm..email is a good
> thing)

;-) ;-) ;-)

							Thanx, Paul

> [1]: https://www.efficios.com/pub/rcu/urcu-main-accepted.pdf
> 
> Yubin
> 

