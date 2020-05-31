Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgEaRBI (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 31 May 2020 13:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590944468;
        bh=SOODCGDVcavIY6/iGm7lgN7jV9XObYWFAn4qG9xT0pk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nWuvoItyUQJWL/LOVfyVQOhlyGruHKVKbGBY5oGtcSRo8vX2JKl8PGWhm7xxPw9r/
         7E0RwEL43o24WLWJnUKhzJHmnGGCTbpsXNmWpw4ZtPi6bBdybEKRqu95L8+q/VPTNG
         z3V8/F40iaZu3Doq9RYkQtxI79nBdV/299qGjO3U=
Date: Sun, 31 May 2020 10:01:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: how to understand cpu in-order commit
Message-ID: <20200531170106.GM2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <tencent_6DF95DF59D4DE5B8B0784806C6A5BD6DE308@qq.com>
 <20200530124325.GI2869@paulmck-ThinkPad-P72>
 <20200530151057.8E808206A1@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200530151057.8E808206A1@mail.kernel.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: laokz <laokz@foxmail.com>
Cc: perfbook <perfbook@vger.kernel.org>

On Sat, May 30, 2020 at 11:09:42PM +0800, laokz wrote:
> Hi Paul,
> 
> Many appreciation for your light! 
> 
> On 2020-05-30 Sat 05:43 -0700，Paul E. McKenney wrote：
> > On Sat, May 30, 2020 at 06:36:37PM +0800, laokz wrote:
> > > Hello Paul,
> > > 
> > > This is a bit longer story, I am still searching and stuck in the mist:-
> > > )
> > > Hope to get light from you. Thanks!
> > > 
> > > I commented out smb_mb() from tools/memory-model/litmus-
> > > tests/LB+fencembonceonce+ctrlonceonce.litmus.
> > > 
> > > P0(int *x, int *y)
> > > {
> > > 	int r0;
> > > 
> > > 	r0 = READ_ONCE(*x);
> > > 	if (r0)
> > > 		WRITE_ONCE(*y, 1);
> > > }
> > > 
> > > P1(int *x, int *y)
> > > {
> > > 	int r0;
> > > 
> > > 	r0 = READ_ONCE(*y);
> > > //	smp_mb();
> > > 	WRITE_ONCE(*x, 1);
> > > }
> > > 
> > > And confused by that LKMM said it existed P0:r0=1 /\ P1:r0=1
> > > 
> > > I want to clear these questions:
> > > 
> > > 1. Is there 'out-of-order commit/retirement' CPU among linux supported
> > > architectures? If yes, which one? and then the following is trivial.
> > 
> > The powerpc architecture allows prior reads to be reordered with
> > subsequent writes.  To see this, point your browser here:
> > 
> > 	https://www.cl.cam.ac.uk/~pes20/ppcmem/index.html#PPC
> > 
> > And "Select POWER Test" LB -> ctrl+po.  You will then have this:
> > 
> > 	PC LB+ctrl+po
> > 	"DpCtrldW Rfe PodRW Rfe"
> > 	Cycle=Rfe PodRW Rfe DpCtrldW
> > 	{
> > 	0:r2=x; 0:r4=y;
> > 	1:r2=y; 1:r4=x;
> > 	}
> > 	 P0           | P1           ;
> > 	 lwz r1,0(r2) | lwz r1,0(r2) ;
> > 	 cmpw r1,r1   | li r3,1      ;
> > 	 beq  LC00    | stw r3,0(r4) ;
> > 	 LC00:        |              ;
> > 	 li r3,1      |              ;
> > 	 stw r3,0(r4) |              ;
> > 	exists
> > 	(0:r1=1 /\ 1:r1=1)
> > 
> > You then should be able to easily force the P0:r0=1 /\ P1:r0=1 after
> > clicking on the "Interactive" button.  (Hint: First commit Thread 1's
> > "li" instruction, then its "stw" instruction, then all of Thread 0's
> > instructions, and then Thread 1's remaining "lwz" instruction.)
> 
> I followed your pointer. Yes, it showed the same result with my questioning
> litmus test.
> 
> > > 2. READ_ONCE, WRITE_ONCE assure compiler respect program order.
> > > If P0:r0=1, then it must have observed P1 write to x(wall time ahead
> > > P0:r0).
> > > If P1 write to x happened(committed, so visible to outside), then its
> > > read
> > > from y must happened before, because cpu's in-order commit/retirement
> > > restriction(wall time ahead P1:write). 
> > > Then how the most earlier P1:r0 to get value 1?
> > 
> > On powerpc architecture, it can.  But don't take my word for it, try
> > it out on the website listed above.  ;-)
> 
> In this website, I got 
> https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/pldi105-sarkar.pdf. It gave
> me a clue in section 8 page 11:
> 
> >> Specifically: the model allows instructions to **commit out of program
> order**, which permits the LB and LB+rs test outcomes (not observed in
> practice);...
> 
> It sounds resonable to me. Now I try to conclude: If the CPU was implemented
> in-order commit, then my questioning test result(after comment out P1's
> smb_mb) was forbidden. Can I?

The CPUs are quite a bit more complicated than that, and there are a lot
of ways that things can get out of order.  One mechanism is, as you say,
instruction commit order.  Another is the store buffer.  Yet another is
invalidation queues.  A third is the cache coherence protocol.

Appendix C of "Is Parallel Programming Hard, And, If So, What Can You
Do About It?" gives more details.

https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html

							Thanx, Paul
