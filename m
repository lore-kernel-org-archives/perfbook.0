Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbfKSOoW (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Nov 2019 09:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574174662;
        bh=XTnGoiptjTORBNafjexu1Joh+HqTkLduGPOqVrfVdts=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PciNAj2l8X4MRk1bOZZmWOGRwxvdwcRpnL1EKq5ahhcu6gzTDuRk9UfyLd3koC0GO
         hVQ09W1PNtGZWjWRJ+z9iqdQDRO4a6a6JgJbvqLpKuG1fk60yRbQ8eBpLTJMZrKnPc
         /Z9KUyM+wQIJx6cDKs+ci5WhfLml71dvzlmXvNnU=
Date: Tue, 19 Nov 2019 06:44:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: how to understand cpu in-order commit
Message-ID: <20191119144421.GU2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <5dd3f840.1c69fb81.26205.0055SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd3f840.1c69fb81.26205.0055SMTPIN_ADDED_BROKEN@mx.google.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: laokz <laokz@foxmail.com>
Cc: perfbook mailing list <perfbook@vger.kernel.org>

On Tue, Nov 19, 2019 at 10:11:48PM +0800, laokz wrote:
> Hello Paul,
> 
> With your perfbook help, now I can understand base memory-model issue. Such
> as tools/memory-model/litmus/LB+fencembonceonce+ctrlonceonce.litmus :
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
> 	smp_mb();
> 	WRITE_ONCE(*x, 1);
> }
> 
> exists (0:r0=1 /\ 1:r0=1)
> 
> But wonder how about cpu in-order commit. So I removed smp_mb(), the litmus
> test showed the result exist! This confused me. In my understanding, cpu in-
> order commit means out-of-order-execution results commit to register/memory
> in compiled program order. That is cpu P1 must retire r0=y first then x=1,
> thus P0 can see P1's update of x. So P1's r0 should never be 1.
> 
> Is this caused by LKMM's compatibility with out-of-order commit
> architectures? Or what's wrong with me?

Nothing is wrong with you.  You are just going through a common phase
in learning about memory models.  ;-)

So you modified P1() as follows, correct?

	P1(int *x, int *y)
	{
		int r0;

		r0 = READ_ONCE(*y);
		WRITE_ONCE(*x, 1);
	}

The compiler is free to rearrange this code as follows:

	P1(int *x, int *y)
	{
		int r0;

		WRITE_ONCE(*x, 1);
		r0 = READ_ONCE(*y);
	}

This can clearly satisfy the exists clause:  P1() does its write,
P0() does its read and its write, and finally P1() does its read.

But suppose we prevented the compiler from moving the code:

	P1(int *x, int *y)
	{
		int r0;

		r0 = READ_ONCE(*y);
		barrier();
		WRITE_ONCE(*x, 1);
	}

Then, as you say, weakly ordered CPUs might still reorder P1()'s
read and write.  So LKMM must still say that the exists clause is
satisfied.

							Thanx, Paul
