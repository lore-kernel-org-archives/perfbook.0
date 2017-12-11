Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37916 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750707AbdLKSKe (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 11 Dec 2017 13:10:34 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vBBI8eZs136830
 for <perfbook@vger.kernel.org>; Mon, 11 Dec 2017 13:10:34 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2esv4haxsr-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 11 Dec 2017 13:10:33 -0500
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 11 Dec
 2017 13:10:33 -0500
Date: Mon, 11 Dec 2017 10:10:33 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: ask for help to implement a high performance sliding window
Reply-To: paulmck@linux.vnet.ibm.com
References: <51fd70b2.1a26.16033b658e1.Coremail.apprentice89@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51fd70b2.1a26.16033b658e1.Coremail.apprentice89@126.com>
Message-Id: <20171211181033.GW7829@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: LoopJump <apprentice89@126.com>
Cc: perfbook@vger.kernel.org

Hello, LoopJump,

Glad you like the book!  Adding perfbook@vger.kernel.org on CC in case
someone there has some good ideas.

First, I do feel the need to ask if you have actually benchmarked the
system and seen maximum computation to be a problem, perhaps on a profile.
After all, there is little payoff in optimizing portions of the system
that are not bottlenecks!

Second, let me make sure that I understand the problem:

1.	Your system receives sequence numbers on incoming packets.

2.	Each packets is processed, after which the corresponding sequence
	number should be included in a global "max" computation.

3.	If the whole thing isn't protected by a global lock, we know
	that the thread reading out the maximum value will get a snapshot
	that immediately becomes stale.  The reason for this instant
	staleness is that some other thread might immediately complete
	processing for another packet, and that packet's sequence number
	might update the maximum.

4.	I am assuming that the sequence number is large enough that
	overflow is not a problem.  If overflow is possible, things
	become quite interesting when a given packet's processing takes
	a very long time.

5.	I am assuming that packets are processed very quickly.	If this
	assumption is incorrect and packets take (say) ten milliseconds
	to process, then you should be able to use pretty much any method
	of updating the maximum.  But if packet processing was that slow,
	you probably wouldn't be asking me this question.

Third, some thoughts on implementing this efficiently.

By #3 above, we know that the thread reading out the maximum can have
a stale value.  Just how much staleness can be tolerated?

If (say) a millisecond of staleness is OK, one approach is to have each
thread maintain the maximum sequence number that it has encountered
thus far.  Maintaining this per-thread value should be extremely
efficient.  Then a separate thread (or function or whatever) can run
every millisecond, taking the maximum of the per-thread maxima.

Alternatively, each thread can periodically update the global maximum
based on that thread's local state.

Either way, the point is to update the global maximum less frequently
and thus have less problem with cache misses associated with such updates.

							Thanx, Paul

On Fri, Dec 08, 2017 at 09:21:16AM +0800, LoopJump wrote:
> Hi Paul,
> 
> I am a database kernel developer, I really love your book about parallel programming.
> 
> Now I encounter a question about a high performance sliding window in a multi threads program.
> 
> In my question, incoming request has a consecutive sequence(integer), these requests will be pushed into a thread pool(16 threads), what I want is to track the max_consecutive_sequence that has been processed.
> 
> I tried to use a bitmap (a bit for one sequence or replace a bit with 64bytes item to avoid false sharing) to mark each sequence. Everytime a request is processed, it check if it can advance the max_consecutive_sequence and determine how many sequence it can advance. 
> 
> I do not know if there is a better way to implement such a sliding window.
> 
> Thanks a lot for your help. 
> 
> 
> 
> LoopJump

