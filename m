Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37756 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754518AbdGSRiU (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 19 Jul 2017 13:38:20 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6JHYYGX003668
 for <perfbook@vger.kernel.org>; Wed, 19 Jul 2017 13:38:19 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2bt4kx57u4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 19 Jul 2017 13:38:19 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 19 Jul
 2017 13:38:19 -0400
Date: Wed, 19 Jul 2017 10:38:17 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix two-CPU control-dependency example
Reply-To: paulmck@linux.vnet.ibm.com
References: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
 <2caf7648-6f8a-f679-2d02-b215d45d3718@gmail.com>
 <20170716234028.GN2393@linux.vnet.ibm.com>
 <158186a8-f58c-0d73-0b79-b8edfc94d367@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158186a8-f58c-0d73-0b79-b8edfc94d367@gmail.com>
Message-Id: <20170719173817.GG3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 17, 2017 at 09:45:26AM +0900, Akira Yokosawa wrote:
> On 2017/07/16 16:40:28 -0700, Paul E. McKenney wrote:
> > On Sun, Jul 16, 2017 at 11:27:58PM +0900, Akira Yokosawa wrote:
> >> >From 8996357b6bd21245ef6545fca0c282fb4a31349e Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 16 Jul 2017 20:33:14 +0900
> >> Subject: [PATCH] advsync: Fix two-CPU control-dependency example
> >>
> >> The two-CPU example always results in r1==0 && r2==0 when the
> >> operator ">" is used in the "if" statement.
> >> The point of this example is to use control dependency for ordering,
> >> and the WRITE_ONCE() should always be executed.
> >>
> >> So the corresponding example in memory-barriers.txt was correct
> >> before commit 5646f7acc95f in Linux kernel repository.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >> Hi Paul,
> >>
> >> So sounds like you didn't like the previous patch in this thread.
> >> I tried to convert the examples to litmus test format,
> >> and found out the two-CPU example results in a single outcome.
> >>
> >> If you prefer these examples to be converted to litmus test format,
> >> I can respin these patches and add the tests to CodeSamples.
> >> But I need to know what names to use for the tests.
> >> Do "C-SB+o-c-o+o-c-o" and "C-WWC+o-c-o+o-c-o+o" work?
> >>
> >> Or if these changes conflict with your ongoing work, I'll back off.
> >>
> >> FWIW I've not seen the three-CPU litmus test results in "sometimes",
> >> even on PPC. 
> > 
> > Sorry, I was distracted with C++ standards-committee work, and got
> > behind on my email.  No opinion at all on them yet.
> 
> I see.
> 
> > If these two patches are either-or, I would take the one that matches
> > memory-barriers.txt.  Please advise.  ;-)
> 
> The 1st one ("advsync: Fix control-dependency no-transitivity example")
> is the catchup to memroy-barriers.txt.

As noted in my other email, applied!

> As for the 2nd one, would it be better to fix memory-barriers.txt first
> if the two-CPU example actually neesd the partial revert? 

This is the one below that changes the ">" to ">=" in the "if"
conditions, correct?  (If not please point me in the right direction.)

If so, the change would be correct in theory, but I would like to
keep the ">" because with the change to ">=" an enthusiastic
compiler could potentially figure out that the values of "x" and "y"
are never negative, and thus leave out the "if" statement completely,
resulting in the following optimized program:

	CPU 0                     CPU 1
	=======================   =======================
	r1 = READ_ONCE(x);        r2 = READ_ONCE(y);
	WRITE_ONCE(y, 1);         WRITE_ONCE(x, 1);

	assert(!(r1 == 1 && r2 == 1));

Both the compiler and many CPUs would be within their rights to
reorder either CPU's read with its write, which could cause the
assertion to trigger.

So again, let's please keep the ">".

> > This part of the file is likely to be overwritten at some point, but
> > it would be good to remove confusion in the meantime.
> > 
> > On the PPC end of things, the hardware often has stronger ordering
> > than does the architecture.  For example, Power hardware is reluctant
> > to reorder later writes wiht earlier reads, despite the fact that
> > the architecture allows this.  So it would be good to get some
> > tests that actually show reordering on PPC.
> > 
> > Your names look good, and I would welcome help in converting things
> > to litmus tests.  To that end, I have a github archive with lots
> > of litmus tests, some manually generated and some automatically
> > generated:
> > 
> > 	https://github.com/paulmckrcu/litmus
> > 
> > Which reminds me...  Do you have access to a Linux system on which
> > you can install kernel modules?
> 
> If a virtual guest machine on x86, I should be able to. Does that
> suffice?

It does!

							Thanx, Paul

>            Thanks, Akira
> 
> >                                 There is a klitmus7 that does that.
> > 
> > 							Thanx, Paul
> > 
> >>       Thanks, Akira
> >> --
> >>  advsync/memorybarriers.tex | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> >> index 894de6d..f0ca79d 100644
> >> --- a/advsync/memorybarriers.tex
> >> +++ b/advsync/memorybarriers.tex
> >> @@ -3015,8 +3015,8 @@ of~\co{x} and~\co{y} both being zero:
> >>  	\hline
> >>  	\tco{r1 = READ_ONCE(x);} &
> >>  		\tco{r2 = READ_ONCE(y);} \\
> >> -	if (r1 > 0) &
> >> -		if (r2 > 0) \\
> >> +	if (r1 >= 0) &
> >> +		if (r2 >= 0) \\
> >>  	~~~\tco{WRITE_ONCE(y, 1);} &
> >>  		~~~\tco{WRITE_ONCE(x, 1);} \\
> >>  	\multicolumn{2}{l}{~} \\
> >> -- 
> >> 2.7.4
> >>
> >>
> > 
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

