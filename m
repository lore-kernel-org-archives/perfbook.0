Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbfKSVLS (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Nov 2019 16:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574197877;
        bh=OUGdl0mK9cCF5CV+h5Y47axj7opjeqhfvl7+2hbOInU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=y7fOw0kmUaCKNl1nmcKo51JBdag84w6HlHGxPAR2mAc77LAAWsPbMCAfS6WNBNBS9
         z0S0aNKhSDMNhbITqI4mwwlLSLKX7w/zuGtGMRpoxHm7APOCrhdjf/s13rXEP6Z6Fz
         Za1cOlnpeJxkq6pe8lenFS3BylSPzbd/OXrRXJ3c=
Date: Tue, 19 Nov 2019 13:11:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: how to understand cpu in-order commit
Message-ID: <20191119211117.GG2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <5dd3f840.1c69fb81.26205.0055SMTPIN_ADDED_BROKEN@mx.google.com>
 <20191119144421.GU2889@paulmck-ThinkPad-P72>
 <5dd40e5c.1c69fb81.4c51.e557SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dd40e5c.1c69fb81.4c51.e557SMTPIN_ADDED_BROKEN@mx.google.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: laokz <laokz@foxmail.com>
Cc: perfbook mailing list <perfbook@vger.kernel.org>

On Tue, Nov 19, 2019 at 11:45:03PM +0800, laokz wrote:
> Hello paul,
> 
> 在 2019-11-19二的 06:44 -0800，Paul E. McKenney写道：
> > On Tue, Nov 19, 2019 at 10:11:48PM +0800, laokz wrote:
> > > But wonder how about cpu in-order commit. So I removed smp_mb(), the
> > > litmus
> > > test showed the result exist! This confused me. In my understanding, cpu
> > > in-
> > > order commit means out-of-order-execution results commit to
> > > register/memory
> > > in compiled program order. That is cpu P1 must retire r0=y first then
> > > x=1,
> > > thus P0 can see P1's update of x. So P1's r0 should never be 1.
> > > 
> > > Is this caused by LKMM's compatibility with out-of-order commit
> > > architectures? Or what's wrong with me?
> > 
> > Nothing is wrong with you.  You are just going through a common phase
> > in learning about memory models.  ;-)
> > 
> > So you modified P1() as follows, correct?
> > 
> > 	P1(int *x, int *y)
> > 	{
> > 		int r0;
> > 
> > 		r0 = READ_ONCE(*y);
> > 		WRITE_ONCE(*x, 1);
> > 	}
> > 
> > The compiler is free to rearrange this code as follows:
> > 
> > 	P1(int *x, int *y)
> > 	{
> > 		int r0;
> > 
> > 		WRITE_ONCE(*x, 1);
> > 		r0 = READ_ONCE(*y);
> > 	}
> > 
> > This can clearly satisfy the exists clause:  P1() does its write,
> > P0() does its read and its write, and finally P1() does its read.
> 
> Compiler is one big deal. It seems that seldom compilers obey C11
> standard strictly. "Accesses to volatile objects are evaluated strictly
> according to the rules of the abstract machine." at least means they should
> not change the sequence point.

Yes, you are right, the volatile nature of READ_ONCE() and WRITE_ONCE()
would prohibit the reordering above.  On the other hand, the C++11
standard really does allow relaxed atomic loads and stores to be
reordered.  And since I was at a C++ standards committee a few weeks
ago, I had relaxed atomics on my brain.  Apologies for my confusion.

> > But suppose we prevented the compiler from moving the code:
> > 
> > 	P1(int *x, int *y)
> > 	{
> > 		int r0;
> > 
> > 		r0 = READ_ONCE(*y);
> > 		barrier();
> > 		WRITE_ONCE(*x, 1);
> > 	}
> > 
> > Then, as you say, weakly ordered CPUs might still reorder P1()'s
> > read and write.  So LKMM must still say that the exists clause is
> > satisfied.
> 
> Legacy resource is another big deal.

I will let you argue the "Legacy resource" point with the vendors still
selling weakly ordered CPUs.  ;-)

> Thanks your quick reply. It really clears my head.

;-) ;-) ;-)

							Thanx, Paul
