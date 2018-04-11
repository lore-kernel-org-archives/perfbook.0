Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;        bh=ZlawrsNTPpy6m9wTYtd1tG26lrzoq/IBDnl5uJzX6m4=;
 b=WKOccA6zb5hWQn0VPff5b8bz1AbuDAzTlkZdbDsLg8OWLUrJcfOkzaFjrSgGdj+iiW
 EhdCR10jYyRFGIl4KSyUwmKYj6aJYa5ez+Qm+17+4gJuzPXAb0rW4nFNi1PIUQUmWad0
 3RUgV06+pNlj5MFb4J5uRSotI0CBVd4m1FHS8gpMqagrGpLMXIyPkOL47oKL6eBEp/Rk
 mH77t7jdINXcUejoN3XP/DnsES3TiP7j2dGY/JTlG8fqSw5IpuuIcKGpyATwt1BX6cUm
 grALHg1vRzoRKpYslCNxSKusK4DihYQi4+RChX3sm4f4jwNypvym+0HvdJYpmH/urTZZ
 DUKQ==
Date: Wed, 11 Apr 2018 11:59:08 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: different kind of memory reordering clarification
Message-ID: <20180411035908.nphhtjpbfrwt6pwb@HP>
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
 <20180411024538.grp62hwvtxpapzeh@HP> <20180411030058.dwnk52wctplchxbt@HP>
 <20180411030904.GI3948@linux.vnet.ibm.com>
 <20180411034324.3zcgym67h2c5dbmp@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180411034324.3zcgym67h2c5dbmp@HP>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, Apr 11, 2018 at 11:43:24AM +0800, Yubin Ruan wrote:
> On Tue, Apr 10, 2018 at 08:09:04PM -0700, Paul E. McKenney wrote:
> > On Wed, Apr 11, 2018 at 11:00:58AM +0800, Yubin Ruan wrote:
> > > On Wed, Apr 11, 2018 at 10:46:28AM +0800, Yubin Ruan wrote:
> > > > On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> > > > > On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > > > > > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
> > > > [...]
> > > > > > > 
> > > > > > > Can you please provide me with some examples or references for different kinds
> > > > > > > of memory reordering in a SMP system? You know, there are different kinds of
> > > > > > > reordering:
> > > > > > > 
> > > > > > >    - Loads reordered after loads
> > > > > > >    - Loads reordered after stores
> > > > > > >    - Stores reordered after stores
> > > > > > >    - Stores reordered after loads
> > > > > > >    - Atomic reordered with loads
> > > > > > >    - Atomic reordered with stores
> > > > > > >    - Dependent loads reordered (DEC alpha)
> > > > > > 
> > > > > > I remember there is open-std.org webpage containing comparision of C++'s
> > > > > > memory model to those primitives used in the Linux kernel. But I just can't
> > > > > > find that page.
> > > > > 
> > > > > Here you go!
> > > > > 
> > > > > http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
> > > > > 
> > > > > There will be an update in a month or so, but the above is pretty
> > > > > close.  Also, the Linux-kernel memory model was presented at
> > > > > ASPLOS and accepted into the Linux kernel itself:
> > > > > 
> > > > > https://paulmck.livejournal.com/49667.html
> > > > 
> > > > Many thanks. But I am currently confused about the relationship between
> > > > terminologies used in the Linux kernel and those used in some programming
> > > > languages (e.g., C++), i.e., the relationships between
> > > > 
> > > >     memory_order_release
> > > >     memory_order_relaxed
> > > >     memory_order_acquire
> > > >     memory_order_seq_cst
> > > >     ...
> > > > 
> > > > and those used in the kernel:
> > > > 
> > > >     READ_ONCE() / WRITE_ONCE()
> > > >     rmb() / wmb() / mb() / smp_mb()
> > > >     ...
> > > > 
> > > > Any materials for that?
> > > 
> > > Hmm, to be more exact, what I want is something like this:
> > > 
> > >     “These primitives can be expressed directly in terms of the upcoming
> > >     C++0x standard. For the smp_mb() primitive this correspondence is not
> > >     exact; our memory barriers are somewhat stronger than the standard’s
> > >     atomic_thread_fence(memory_order_seq_cst). The LOAD_SHARED() primitive
> > >     maps to x.load(memory_order_relaxed) and STORE_SHARED() to
> > >     x.store(memory_order_relaxed). The barrier() primitive maps to
> > >     atomic_signal_fence(memory_order_seq_cst). In addition, rcu_dereference()
> > >     maps to x.load(memory_order_consume) and rcu_assign_pointer() maps to
> > >     x.store(v, memory_order_release).”
> > 
> > Those are still valid.  Again, the other paper from my earlier email
> > has more mappings.
> 
> Sorry I missed that! (trying to read too much all at once)
> 
> I read about atomic_ops here
> 
>     https://www.kernel.org/doc/html/v4.14/core-api/atomic_ops.html
> 
> and find that many "atomic" operations such as
> atomic_set/atomic_read/atomic_write does not require volatile semantic, nor
> does it require alignment constraints that force the CPU to do load/store "at
> once". In this situation, both the compiler and the processor are all allowed
> to tear apart a read/write atomic operation. How can it be "atomic" in this
> case?

Hmm... Reading more source code confirms that there are READ_ONCE/WRITE_ONCE
used in atomic_set/atomic_read/atomic_write. But these does not prevent the
processor from tearing apart the reads/write. Can the definition

    typedef struct { int counter; } atomic_t;

guarantee necessary alignment constraints required by the processor to perform
atomic operations?

Yubin

