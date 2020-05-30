Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgE3Mn0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 30 May 2020 08:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590842605;
        bh=MH05WzJZHFNwb3D8P6Z1kg5TJkYGVOSJmMJA4EeIK4I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=1UkOsNcmHRpJVcgcWbzl6RgWMtJDsx1v+VZubQHKSTY7FvZCqqOhGu36SITrTg1zh
         9vr/reBkLXT5yCh597TLyUgSv40P1zRF9fr/Xfe8an+QUGOkd0i7qUoeEMlMR+8gau
         w3vWtXZtAprIJy7BqPVEW2Prk7CmVGxGKUjUdObI=
Date: Sat, 30 May 2020 05:43:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: how to understand cpu in-order commit
Message-ID: <20200530124325.GI2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <tencent_6DF95DF59D4DE5B8B0784806C6A5BD6DE308@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_6DF95DF59D4DE5B8B0784806C6A5BD6DE308@qq.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: laokz <laokz@foxmail.com>
Cc: perfbook <perfbook@vger.kernel.org>

On Sat, May 30, 2020 at 06:36:37PM +0800, laokz wrote:
> Hello Paul,
> 
> This is a bit longer story, I am still searching and stuck in the mist:-)
> Hope to get light from you. Thanks!
> 
> I commented out smb_mb() from tools/memory-model/litmus-
> tests/LB+fencembonceonce+ctrlonceonce.litmus.
> 
> P0(int *x, int *y)
> {
> 	int r0;
> 
> 	r0 = READ_ONCE(*x);
> 	if (r0)
> 		WRITE_ONCE(*y, 1);
> }
> 
> P1(int *x, int *y)
> {
> 	int r0;
> 
> 	r0 = READ_ONCE(*y);
> //	smp_mb();
> 	WRITE_ONCE(*x, 1);
> }
> 
> And confused by that LKMM said it existed P0:r0=1 /\ P1:r0=1
> 
> I want to clear these questions:
> 
> 1. Is there 'out-of-order commit/retirement' CPU among linux supported
> architectures? If yes, which one? and then the following is trivial.

The powerpc architecture allows prior reads to be reordered with
subsequent writes.  To see this, point your browser here:

	https://www.cl.cam.ac.uk/~pes20/ppcmem/index.html#PPC

And "Select POWER Test" LB -> ctrl+po.  You will then have this:

	PC LB+ctrl+po
	"DpCtrldW Rfe PodRW Rfe"
	Cycle=Rfe PodRW Rfe DpCtrldW
	{
	0:r2=x; 0:r4=y;
	1:r2=y; 1:r4=x;
	}
	 P0           | P1           ;
	 lwz r1,0(r2) | lwz r1,0(r2) ;
	 cmpw r1,r1   | li r3,1      ;
	 beq  LC00    | stw r3,0(r4) ;
	 LC00:        |              ;
	 li r3,1      |              ;
	 stw r3,0(r4) |              ;
	exists
	(0:r1=1 /\ 1:r1=1)

You then should be able to easily force the P0:r0=1 /\ P1:r0=1 after
clicking on the "Interactive" button.  (Hint: First commit Thread 1's
"li" instruction, then its "stw" instruction, then all of Thread 0's
instructions, and then Thread 1's remaining "lwz" instruction.)

> 2. READ_ONCE, WRITE_ONCE assure compiler respect program order.
> If P0:r0=1, then it must have observed P1 write to x(wall time ahead P0:r0).
> If P1 write to x happened(committed, so visible to outside), then its read
> from y must happened before, because cpu's in-order commit/retirement
> restriction(wall time ahead P1:write). 
> Then how the most earlier P1:r0 to get value 1?

On powerpc architecture, it can.  But don't take my word for it, try
it out on the website listed above.  ;-)

							Thanx, Paul

> Thanks again,
> laokz
> 
> On 2019-11-19 Tue 13:11 -0800，Paul E. McKenney wrote：
> > On Tue, Nov 19, 2019 at 11:45:03PM +0800, laokz wrote:
> > > Hello paul,
> > > 
> > > 在 2019-11-19二的 06:44 -0800，Paul E. McKenney写道：
> > > > On Tue, Nov 19, 2019 at 10:11:48PM +0800, laokz wrote:
> > > > > But wonder how about cpu in-order commit. So I removed smp_mb(), the
> > > > > litmus
> > > > > test showed the result exist! This confused me. In my understanding,
> > > > > cpu
> > > > > in-
> > > > > order commit means out-of-order-execution results commit to
> > > > > register/memory
> > > > > in compiled program order. That is cpu P1 must retire r0=y first
> > > > > then
> > > > > x=1,
> > > > > thus P0 can see P1's update of x. So P1's r0 should never be 1.
> > > > > 
> > > > > Is this caused by LKMM's compatibility with out-of-order commit
> > > > > architectures? Or what's wrong with me?
> > > > 
> > > > Nothing is wrong with you.  You are just going through a common phase
> > > > in learning about memory models.  ;-)
> > > > 
> > > > So you modified P1() as follows, correct?
> > > > 
> > > > 	P1(int *x, int *y)
> > > > 	{
> > > > 		int r0;
> > > > 
> > > > 		r0 = READ_ONCE(*y);
> > > > 		WRITE_ONCE(*x, 1);
> > > > 	}
> > > > 
> > > > The compiler is free to rearrange this code as follows:
> > > > 
> > > > 	P1(int *x, int *y)
> > > > 	{
> > > > 		int r0;
> > > > 
> > > > 		WRITE_ONCE(*x, 1);
> > > > 		r0 = READ_ONCE(*y);
> > > > 	}
> > > > 
> > > > This can clearly satisfy the exists clause:  P1() does its write,
> > > > P0() does its read and its write, and finally P1() does its read.
> > > 
> > > Compiler is one big deal. It seems that seldom compilers obey C11
> > > standard strictly. "Accesses to volatile objects are evaluated strictly
> > > according to the rules of the abstract machine." at least means they
> > > should
> > > not change the sequence point.
> > 
> > Yes, you are right, the volatile nature of READ_ONCE() and WRITE_ONCE()
> > would prohibit the reordering above.  On the other hand, the C++11
> > standard really does allow relaxed atomic loads and stores to be
> > reordered.  And since I was at a C++ standards committee a few weeks
> > ago, I had relaxed atomics on my brain.  Apologies for my confusion.
> > 
> > > > But suppose we prevented the compiler from moving the code:
> > > > 
> > > > 	P1(int *x, int *y)
> > > > 	{
> > > > 		int r0;
> > > > 
> > > > 		r0 = READ_ONCE(*y);
> > > > 		barrier();
> > > > 		WRITE_ONCE(*x, 1);
> > > > 	}
> > > > 
> > > > Then, as you say, weakly ordered CPUs might still reorder P1()'s
> > > > read and write.  So LKMM must still say that the exists clause is
> > > > satisfied.
> > > 
> > > Legacy resource is another big deal.
> > 
> > I will let you argue the "Legacy resource" point with the vendors still
> > selling weakly ordered CPUs.  ;-)
> > 
> > > Thanks your quick reply. It really clears my head.
> > 
> > ;-) ;-) ;-)
> > 
> > 							Thanx, Paul
> >
