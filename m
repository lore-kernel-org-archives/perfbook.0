Return-Path: <SRS0=aj67=ZL=foxmail.com=laokz@kernel.org>
Message-ID: <5dd40e5c.1c69fb81.4c51.e557SMTPIN_ADDED_BROKEN@mx.google.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1574178306;
	bh=/pPXfxyD974tkUvDxaPRjz5TgXHFJlFFP/9hQe4+lTA=;
	h=Message-ID:Subject:From:To:Date:MIME-Version;
	b=Jrb1z64cOaddwgaX2fH1vzRjSReCrDka1cUZByTqpkAM2fTvIz1TYrl7M8qKpiCQM
	 ZVZbKgE0924geIPHDzKuEN2iiAzV5So/ycxRWSZ6kePuxLjXGES9yMP8erxGSsiy4Z
	 pFmRWx+6PMbX5U+YPsCKzkxIGKwFENLR4xiGz9gQ=
Subject: Re: how to understand cpu in-order commit
From: laokz <laokz@foxmail.com>
Date: Tue, 19 Nov 2019 23:45:03 +0800
In-Reply-To: <20191119144421.GU2889@paulmck-ThinkPad-P72>
References: <5dd3f840.1c69fb81.26205.0055SMTPIN_ADDED_BROKEN@mx.google.com>
	 <20191119144421.GU2889@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook mailing list <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hello paul,

在 2019-11-19二的 06:44 -0800，Paul E. McKenney写道：
> On Tue, Nov 19, 2019 at 10:11:48PM +0800, laokz wrote:
> > But wonder how about cpu in-order commit. So I removed smp_mb(), the
> > litmus
> > test showed the result exist! This confused me. In my understanding, cpu
> > in-
> > order commit means out-of-order-execution results commit to
> > register/memory
> > in compiled program order. That is cpu P1 must retire r0=y first then
> > x=1,
> > thus P0 can see P1's update of x. So P1's r0 should never be 1.
> > 
> > Is this caused by LKMM's compatibility with out-of-order commit
> > architectures? Or what's wrong with me?
> 
> Nothing is wrong with you.  You are just going through a common phase
> in learning about memory models.  ;-)
> 
> So you modified P1() as follows, correct?
> 
> 	P1(int *x, int *y)
> 	{
> 		int r0;
> 
> 		r0 = READ_ONCE(*y);
> 		WRITE_ONCE(*x, 1);
> 	}
> 
> The compiler is free to rearrange this code as follows:
> 
> 	P1(int *x, int *y)
> 	{
> 		int r0;
> 
> 		WRITE_ONCE(*x, 1);
> 		r0 = READ_ONCE(*y);
> 	}
> 
> This can clearly satisfy the exists clause:  P1() does its write,
> P0() does its read and its write, and finally P1() does its read.

Compiler is one big deal. It seems that seldom compilers obey C11
standard strictly. "Accesses to volatile objects are evaluated strictly
according to the rules of the abstract machine." at least means they should
not change the sequence point.

> But suppose we prevented the compiler from moving the code:
> 
> 	P1(int *x, int *y)
> 	{
> 		int r0;
> 
> 		r0 = READ_ONCE(*y);
> 		barrier();
> 		WRITE_ONCE(*x, 1);
> 	}
> 
> Then, as you say, weakly ordered CPUs might still reorder P1()'s
> read and write.  So LKMM must still say that the exists clause is
> satisfied.

Legacy resource is another big deal.

Thanks your quick reply. It really clears my head.

Best regards,
laokz



