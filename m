Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;        bh=JRJEl2e36iylXJKYlC51HmxXhePdGbo4zl1sxwwL3lY=;
 b=LEv7qU1UQq6lY9OnjfZ4qrLQS7si6G67SoTUBu2vWcPVPVDj/Mh5MpO07Xxms3EPEE
 MwFPW4i6ZBVtLVfEgwMN8ufgHbI7WNR7Uc+P8ztU4azBvI6yhdSWyaIpOnnPwneGCQTj
 yHOIG+RxS5zIxhzlNgg6inc8Ns3newehardZO2sOC8NN9Hmyinj/OHd15t1dHqYJ4osn
 K8f76NR0wzFFpHEgqN7zLq09OumQfq7KJ8OAG9NROh0aqfLfnL8j7v9f5XmI1ezRn9Qq
 773VeMpfrkJKBqjoxE6FTNP/bw7SeGY6dMSMYF50mDxKra/sdAvb3CkWHSuo9AuxooB8
 r+cg==
Date: Wed, 11 Apr 2018 11:43:24 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: different kind of memory reordering clarification
Message-ID: <20180411034324.3zcgym67h2c5dbmp@HP>
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
 <20180411024538.grp62hwvtxpapzeh@HP> <20180411030058.dwnk52wctplchxbt@HP>
 <20180411030904.GI3948@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180411030904.GI3948@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 10, 2018 at 08:09:04PM -0700, Paul E. McKenney wrote:
> On Wed, Apr 11, 2018 at 11:00:58AM +0800, Yubin Ruan wrote:
> > On Wed, Apr 11, 2018 at 10:46:28AM +0800, Yubin Ruan wrote:
> > > On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> > > > On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > > > > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
> > > [...]
> > > > > >=20
> > > > > > Can you please provide me with some examples or references fo=
r different kinds
> > > > > > of memory reordering in a SMP system? You know, there are dif=
ferent kinds of
> > > > > > reordering:
> > > > > >=20
> > > > > >    - Loads reordered after loads
> > > > > >    - Loads reordered after stores
> > > > > >    - Stores reordered after stores
> > > > > >    - Stores reordered after loads
> > > > > >    - Atomic reordered with loads
> > > > > >    - Atomic reordered with stores
> > > > > >    - Dependent loads reordered (DEC alpha)
> > > > >=20
> > > > > I remember there is open-std.org webpage containing comparision=
 of C++'s
> > > > > memory model to those primitives used in the Linux kernel. But =
I just can't
> > > > > find that page.
> > > >=20
> > > > Here you go!
> > > >=20
> > > > http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.h=
tml
> > > >=20
> > > > There will be an update in a month or so, but the above is pretty
> > > > close.  Also, the Linux-kernel memory model was presented at
> > > > ASPLOS and accepted into the Linux kernel itself:
> > > >=20
> > > > https://paulmck.livejournal.com/49667.html
> > >=20
> > > Many thanks. But I am currently confused about the relationship bet=
ween
> > > terminologies used in the Linux kernel and those used in some progr=
amming
> > > languages (e.g., C++), i.e., the relationships between
> > >=20
> > >     memory_order_release
> > >     memory_order_relaxed
> > >     memory_order_acquire
> > >     memory_order_seq_cst
> > >     ...
> > >=20
> > > and those used in the kernel:
> > >=20
> > >     READ_ONCE() / WRITE_ONCE()
> > >     rmb() / wmb() / mb() / smp_mb()
> > >     ...
> > >=20
> > > Any materials for that?
> >=20
> > Hmm, to be more exact, what I want is something like this:
> >=20
> >     =E2=80=9CThese primitives can be expressed directly in terms of t=
he upcoming
> >     C++0x standard. For the smp_mb() primitive this correspondence is=
 not
> >     exact; our memory barriers are somewhat stronger than the standar=
d=E2=80=99s
> >     atomic_thread_fence(memory_order_seq_cst). The LOAD_SHARED() prim=
itive
> >     maps to x.load(memory_order_relaxed) and STORE_SHARED() to
> >     x.store(memory_order_relaxed). The barrier() primitive maps to
> >     atomic_signal_fence(memory_order_seq_cst). In addition, rcu_deref=
erence()
> >     maps to x.load(memory_order_consume) and rcu_assign_pointer() map=
s to
> >     x.store(v, memory_order_release).=E2=80=9D
>=20
> Those are still valid.  Again, the other paper from my earlier email
> has more mappings.

Sorry I missed that! (trying to read too much all at once)

I read about atomic_ops here

    https://www.kernel.org/doc/html/v4.14/core-api/atomic_ops.html

and find that many "atomic" operations such as
atomic_set/atomic_read/atomic_write does not require volatile semantic, n=
or
does it require alignment constraints that force the CPU to do load/store=
 "at
once". In this situation, both the compiler and the processor are all all=
owed
to tear apart a read/write atomic operation. How can it be "atomic" in th=
is
case?

Yubin

