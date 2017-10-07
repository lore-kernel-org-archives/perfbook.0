Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48176 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751823AbdJGUU3 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 7 Oct 2017 16:20:29 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v97KJ8E4078459
 for <perfbook@vger.kernel.org>; Sat, 7 Oct 2017 16:20:29 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2deuex8kxf-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 07 Oct 2017 16:20:28 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 7 Oct 2017
 16:20:28 -0400
Date: Sat, 7 Oct 2017 13:20:25 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronize with a non-atomic flag
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
 <CAJYFCiMCnyZnP1kCBAQfpGGd4PBkoMz5ALnkH2K2aqsmwjs+SA@mail.gmail.com>
 <20171006191250.GH3521@linux.vnet.ibm.com>
 <CAJYFCiMni6Kz43PPKw8H2o1-Zez-Av22ub34sOOz=9sjfYSEng@mail.gmail.com>
 <edfed509-278e-0a15-579c-f527acc988ec@gmail.com>
 <CAJYFCiMfy-23Wts3m80Qr10H1uL1NpykG0zM8wpK8gziBZh7hQ@mail.gmail.com>
 <535634db-b618-46f2-9abe-9a8c4b3291ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <535634db-b618-46f2-9abe-9a8c4b3291ce@gmail.com>
Message-Id: <20171007202025.GX3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 07, 2017 at 11:36:45PM +0900, Akira Yokosawa wrote:
> On 2017/10/07 21:43:53 +0800, Yubin Ruan wrote:
> > 2017-10-07 19:40 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
> >> On 2017/10/07 15:04:50 +0800, Yubin Ruan wrote:
> >>> Thanks Paul and Akira,
> >>>
> >>> 2017-10-07 3:12 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.co=
m>:
> >>>> On Fri, Oct 06, 2017 at 08:35:00PM +0800, Yubin Ruan wrote:
> >>>>> 2017-10-06 20:03 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
> >>>>>> On 2017/10/06 14:52, Yubin Ruan wrote:
> >>>>
> >>>> [ . . . ]
> >>>>
> >>>>>> I/O operations in printf() might make the situation trickier.
> >>>>>
> >>>>> printf(3) is claimed to be thread-safe, so I think this issue will =
not
> >>>>> concern us.
> >>>
> >>> so now I can pretty much confirm this.
> >>
> >> Yes. Now I recognize that POSIX.1c requires stdio functions to be MT-s=
afe.
> >> By MT-safe, one call to printf() won't be disturbed by other racy func=
tion
> >> calls involving output to stdout.
> >>
> >> I was disturbed by the following description of MT-Safe in attributes(=
7)
> >> man page:
> >>
> >>     Being MT-Safe does not imply a function is atomic, nor  that  it
> >>     uses  any of the memory synchronization mechanisms POSIX exposes
> >>     to users. [...]
> >>
> >> Excerpt from a white paper at http://www.unix.org/whitepapers/reentran=
t.html:
> >>
> >>     The POSIX.1 and C-language functions that operate on character str=
eams
> >>     (represented by pointers to objects of type FILE) are required by =
POSIX.1c
> >>     to be implemented in such a way that reentrancy is achieved (see I=
SO/IEC
> >>     9945:1-1996, =A78.2). This requirement has a drawback; it imposes
> >>     substantial performance penalties because of the synchronization t=
hat
> >>     must be built into the implementations of the functions for the sa=
ke of
> >>     reentrancy. [...]
> >>
> >> Yubin, thank you for giving me the chance to realize this.
> >>
> >>>
> >>>>>> In a more realistic case where you do something meaningful in
> >>>>>> do_something() in both threads:
> >>>>>>
> >>>>>>     //process 1
> >>>>>>     while(1) {
> >>>>>>         if(READ_ONCE(flag) =3D=3D 0) {
> >>>>>>             do_something();
> >>>>>>             WRITE_ONCE(flag, 1); // let another process to run
> >>>>>>         } else {
> >>>>>>             continue;
> >>>>>>         }
> >>>>>>     }
> >>>>>>
> >>>>>>     //process 2
> >>>>>>     while(1) {
> >>>>>>         if(READ_ONCE(flag) =3D=3D 1) {
> >>>>>>             do_something();
> >>>>>>             WRITE_ONCE(flag, 0); // let another process to run
> >>>>>>         } else {
> >>>>>>             continue;
> >>>>>>         }
> >>>>>>     }
> >>>>
> >>>> In the Linux kernel, there is control-dependency ordering between
> >>>> the READ_ONCE(flag) and any stores in either the then-clause or
> >>>> the else-clause.  However, I see no ordering between do_something()
> >>>> and the WRITE_ONCE().
> >>>
> >>> I was not aware of the "control-dependency" ordering issue in the
> >>> Linux kernel before. Is it true for all architectures?

It is true for all architectures that the Linux kernel supports.
But beware, control dependencies are quite fragile because compilers
break them easily.  See the control dependencies section of the book
for some guidelines for using them -- and for the advice to avoid
using them where feasible.

> >>> But anyway, the ordering between READ_ONCE(flag) and any subsequent
> >>> stores are guaranteed on X86/X64, so we didn't need any memory barrier
> >>> here.

But you do need something to keep the compiler from messing with you,
much the same as if you were using a control dependency.

> >>>>>> and if do_something() uses some shared variables other than "flag",
> >>>>>> you need a couple of memory barriers to ensure the ordering of
> >>>>>> READ_ONCE(), do_something(), and WRITE_ONCE() something like:
> >>>>>>
> >>>>>>     //process 1
> >>>>>>     while(1) {
> >>>>>>         if(READ_ONCE(flag) =3D=3D 0) {
> >>>>>>             smp_rmb();
> >>>>>>             do_something();
> >>>>>>             smp_wmb();
> >>>>>>             WRITE_ONCE(flag, 1); // let another process to run
> >>>>>>         } else {
> >>>>>>             continue;
> >>>>>>         }
> >>>>>>     }
> >>>>>>
> >>>>>>     //process 2
> >>>>>>     while(1) {
> >>>>>>         if(READ_ONCE(flag) =3D=3D 1) {
> >>>>>>             smp_rmb();
> >>>>>>             do_something();
> >>>>>>             smp_wmb();
> >>>>>>             WRITE_ONCE(flag, 0); // let another process to run
> >>>>>>         } else {
> >>>>>>             continue;
> >>>>>>         }
> >>>>>>     }
> >>>>
> >>>> Here, the control dependency again orders the READ_ONCE() against la=
ter
> >>>> stores, and the smp_rmb() orders the READ_ONCE() against any later
> >>>> loads.
> >>>
> >>> Understand and agree.
> >>>
> >>>> The smp_wmb() orders do_something()'s writes (but not its reads!)
> >>>> against the WRITE_ONCE().
> >>>
> >>> Understand and agree. But do we really need the smp_rmb() on X86/64?
> >>> As far as I know, on X86/64 stores are not reordered with other
> >>> stores...[1]

Give or take SSE instructions.  But the constraints on these are rumored
to have tightened, so I need to check up on this.

> >>>>>> In Linux kernel memory model, you can use acquire/release APIs ins=
tead:
> >>>>>>
> >>>>>>     //process 1
> >>>>>>     while(1) {
> >>>>>>         if(smp_load_acquire(&flag) =3D=3D 0) {
> >>>>>>             do_something();
> >>>>>>             smp_store_release(&flag, 1); // let another process to=
 run
> >>>>>>         } else {
> >>>>>>             continue;
> >>>>>>         }
> >>>>>>     }
> >>>>>>
> >>>>>>     //process 2
> >>>>>>     while(1) {
> >>>>>>         if(smp_load_acquire(&flag) =3D=3D 1) {
> >>>>>>             do_something();
> >>>>>>             smp_store_release(&flag, 0); // let another process to=
 run
> >>>>>>         } else {
> >>>>>>             continue;
> >>>>>>         }
> >>>>>>     }
> >>>>
> >>>> This is probably the most straightforward of the above approaches.
> >>>>
> >>>> That said, if you really want a series of things to execute in a
> >>>> particular order, why not just put them into the same process?
> >>>
> >>> I will be very happy if I can. But sometimes we just have to deal with
> >>> issues concerning multiple processes...
> >>>
> >>> [1]: One thing I got a little confused is that some people claim that
> >>> on x86/64 there are several guarantees[2]:
> >>>     1) Loads are not reordered with other loads.
> >>>     2) Stores are not reordered with other stores.
> >>>     3) Stores are not reordered with older loads.
> >>> (note that Loads may still be reordered with older stores to different
> >>> locations)
> >>>
> >>> So, if 1) and 2) are true, why do we have "lfence" and "sfence"
> >>> instructions at all?
> >>
> >> Excerpt from Intel 64 and IA-32 Architectures Developer's Manual: Vol.=
 3A
> >> Section 8.2.5
> >>
> >>     [...] Despite the fact that Pentium 4, Intel Xeon, and P6 family
> >>     processors support processor ordering, Intel does not guarantee
> >>     that future processors will support this model. To make software
> >>     portable to future processors, it is recommended that operating sy=
stems
> >>     provide critical region and resource control constructs and API's
> >>     (application program interfaces) based on I/O, locking, and/or
> >>     serializing instructions be used to synchronize access to shared
> >>     areas of memory in multiple-processor systems. [...]
> >>
> >> So the answer seems "to make software portable to future processors".
> >=20
> > Hmm...so currently these instructions are nops effectively?
>=20
> According to perfbook's Section 14.4.9 "x86" (as of current master),
>=20
>     However, note that some SSE instructions are weakly ordered (clflush
>     and non-temporal move instructions [Int04a]). CPUs that have SSE can
>     use mfence for smp_mb(), lfence for smp_rmb(), and sfence for smp_wmb=
().
>=20
> So as long as you don't use SSE extensions, I guess they are effectively
> nops. But I'm not sure.
>=20
> Paul, could you enlighten us?

I do need to update that section.  My current understanding is that the
rules on SSE extensions have been tightened to allow reordering within
the sequence of memory operations making up the SSE sequence in question,
but that the CPU is not permitted to reorder the SSE accesses with
surrounding accesses, with the usual exception for reordering prior
stores with later loads.

But I do need to read a current manual and update that section.

In other words, I will be happy to enlighten you guys, but must
enlighten myself first.  ;-)

							Thanx, Paul

> Akira
>=20
> > Yubin
> >=20
> >>
> >>>
> >>> [2]: I found those claims here, but not so sure whether or not they
> >>> are true: https://bartoszmilewski.com/2008/11/05/who-ordered-memory-f=
ences-on-an-x86/
> >>>
> >>
> >=20
>=20

