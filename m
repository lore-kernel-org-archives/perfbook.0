Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34939 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932595AbdBPTNV (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 16
 Feb 2017 14:13:21 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1GJ97I2126016
 for <perfbook@vger.kernel.org>; Thu, 16 Feb 2017 14:13:11 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28n7mgcj54-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 16 Feb 2017 14:13:10 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 16 Feb
 2017 12:13:10 -0700
Date: Thu, 16 Feb 2017 11:13:08 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Question] Quick Quiz B.13 help
Reply-To: paulmck@linux.vnet.ibm.com
References: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
 <20170213190034.GI30506@linux.vnet.ibm.com>
 <1c7f03c4-3c73-4e89-50a6-ad2242e57a41@gmail.com>
 <5f483446-30e0-fb3c-5814-f191e379c5e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f483446-30e0-fb3c-5814-f191e379c5e6@gmail.com>
Message-Id: <20170216191308.GK30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org

On Wed, Feb 15, 2017 at 12:36:52AM +0900, Akira Yokosawa wrote:
> On 2017/02/14 18:53:52 +0800, Yubin Ruan wrote:
> > On 2017/2/14 3:00, Paul E. McKenney wrote:
> >> On Mon, Feb 13, 2017 at 09:41:46PM +0800, Yubin Ruan wrote:
> >>> Quick quiz B.13:
> >>>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
> >>> interrupt handler, and that the CPU 2's line 9 is running at process
> >>> level. What changes, if any, are required to enable the code to work
> >>> correctly, in other words, to prevent the assertion from firing?
> >>>
> >>> I can not come up with any practical material for this quiz, because
> >>> I don't really know the implication of "in an interrupt handler",
> >>> and "running in process level".
> >>>
> >>> The answer hints that one would need to ensure that the load of "e"
> >>> precedes that of "a" and hint the Linux kernel implementation
> >>> "barrier()". But how is that exactly? I am going to invest some time
> >>> into the Linux kernel implementation. But I would really appreciate
> >>> some hints about this, as I don't have so much kernel development
> >>> experience before.
> >>
> >> I suggest reading an operating-system textbook.  The ones I have are quite
> >> old, but here they are anyway in bibtex format.  There are probably newer
> >> editions of some of them.  The short answer on interrupts is that they
> >> force process-level processing to pause while the "interrupt handler"
> >                                           ~~~~~
> >                                           until ?
> >> completes.
> >>
> >>                             Thanx, Paul
> >>
> > 
> > Actually I have taken a operating system course and know about interrupt handler. Maybe I don't understand the concepts well. I don't really get your point here. If you have time, maybe you can provide me more information, otherwise I would just have to investigate more on this myself. Thanks.
> 
> Hi Paul,
> 
> Prompted by Yubin's question, I looked into the Quick Quiz.
> And I have a theory what you wanted to say.
> 
> First of all, the "assert()" has a line number of 9, but the execution
> order of lines 3-5 and the assertion on CPU 2 does not matter in
> Table B.4, doesn't it?
> 
> Your point here looks like that lines 3-5 for CPU 2 can interrupt
> the assert().

Yes.

> If this is the case, whether lines 3-5 for CPU 1 are in an interrupt
> handler or not does not matter, I suppose.

True, up to a point.  If CPU 1's lines 3-5 are in an interrupt handler,
then the assert()'s condition only needs a compiler directive such
as barrier() to keep things straight.  If these are separate CPUs,
then real memory barriers are required.

> And the first sentence of Answer of the Quick Quiz should read:
> 
>     The assertion will need to be written so that the load of ``e''
>     is assured to precede that of ``a''.

This doesn't change the meaning, but I take it that it is easier to
read.  But how about the following?

	The assertion must ensure that the load of ``e'' precedes that of
	``a''.

> The second sentence mentions the barrier() primitive. It is effective
> because interrupts should see the sequence of instructions in order
> even if they are executed out-of-order. 
> 
> Am I missing something?

And I should also call out that in the context of the quick quiz,
there is only one CPU.  How about the following?

	Quick Quiz B.13:
	Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
	interrupt handler, and that the CPU 2’s line 9 runs at process
	level. In other words, the code in all three columns of the
	table runs on the same CPU, but the first two columns run in an
	interrupt handler, and the third column runs at process level,
	so that the code in third column can be interrupted by the code
	in the first two columns. What changes, if any, are required to
	enable the code to work correctly, in other words, to prevent
	the assertion from firing?

	Answer:
	The assertion must ensure that the load of “e” precedes that
	of “a”. In the Linux kernel, the barrier() primitive may be
	used to accomplish this in much the same way that the memory
	barrier was used in the assertions in the previous examples,
	for example, as follows:

		while (b == 0) ;
		smp_mb();
		d = 1;
		r1 = e;
		barrier();
		assert(r1 == 0 || a == 1);

	No changes are needed to the code in the first two columns,
	because interrupt handlers run atomically from the perspective
	of the interrupted code.

							Thanx, Paul

> 
> > 
> > regards,
> > Yubin Ruan
> > 
> >> ------------------------------------------------------------------------
> >>
> >> @book{CorbetRubiniKroahHartman
> >> ,author="Jonathan Corbet and Alessandro Rubini and Greg Kroah-Hartman"
> >> ,title="Linux Device Drivers"
> >> ,publisher="O'Reilly Media, Inc."
> >> ,year="2005"
> >> ,edition="Third"
> >> }
> >>
> >> @book{Silberschatz98a
> >> ,author="Abraham Silberschatz and Peter Baer Galvin"
> >> ,title="Operating System Concepts"
> >> ,publisher="Addison-Wesley"
> >> ,year="1998"
> >> ,edition="Fifth"
> >> }
> >>
> >> @book{Vahalia96
> >> ,author="Uresh Vahalia"
> >> ,title="{UNIX} Internals: The New Frontiers"
> >> ,publisher="Prentice Hall"
> >> ,year="1996"
> >> }
> >>
> > 
> > -- 
> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 

