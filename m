Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:57320 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750754AbbHQGW1 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 17 Aug 2015
 02:22:27 -0400
Received: from /spool/local	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 17 Aug
 2015 00:22:26 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 6C2BD3E4003E	for <perfbook@vger.kernel.org>; Mon, 17
 Aug 2015 00:22:23 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com
 [9.17.195.170])	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id t7H6MNNw42139712	for <perfbook@vger.kernel.org>; Sun, 16 Aug
 2015 23:22:23 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t7H6MMGp025238	for <perfbook@vger.kernel.org>; Mon, 17 Aug 2015 00:22:23
 -0600
Date: Sun, 16 Aug 2015 23:22:19 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] CodeSample: rwdeq
Message-ID: <20150817062219.GA2380@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
 <20150813164300.GB3895@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150813164300.GB3895@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Dominik Dingel <dominik.dingel@gmail.com>
Cc: perfbook@vger.kernel.org, Dominik Dingel <dingel@linux.vnet.ibm.com>

On Thu, Aug 13, 2015 at 09:43:01AM -0700, Paul E. McKenney wrote:
> On Wed, Aug 12, 2015 at 09:55:22AM +0200, Dominik Dingel wrote:
> > From: Dominik Dingel <dingel@linux.vnet.ibm.com>
> > 
> > Hi all,
> > 
> > here is a somehow naive implementation of a reader/writer lock based approch
> > for the parallel deq problem.
> > 
> > The next step would be to use it as an introduction example in the text, as due
> > its way of implementation (taking always a read lock, working always with an
> > atomic counter) it is a less efficient way of doing things, compared with the
> > tandem approch. Then the benefits of partitioning might be even more obvious.
> > 
> > Thanks
> > 	Dominik
> 
> Queued, thank you, Dominik!
> 
> A quick unscientific run leads me to believe that this is slightly faster
> than the hashed implementation (not bad!), but about twice as slow as
> the tandem version.  Of course, considerable variation is to be expected
> based on workload.

And, as discussed earlier, here the commit adding a Quick Quiz referring
to your algorithm.  Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

    Add Quick Quiz for Dominik Dingel's solution
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index a44c285ce134..5d46e70028aa 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -683,6 +683,15 @@ Michael~\cite{DBLP:conf/europar/Michael03}.\footnote{
 	Instead, the common compare-and-swap (e.g., x86 cmpxchg)
 	suffices.}

+\QuickQuiz{}
+	Why are there not one but two solutions to the double-ended queue
+	problem?
+\QuickQuizAnswer{
+	There are actually at least three.
+	The third, by Dominik Dingel, makes interesting use of
+	reader-writer locking, and may be found in \co{lockrwdeq.c}.
+} \QuickQuizEnd
+
 In fact, as noted by Dice et al.~\cite{DavidDice:2010:SCA:HTM:deque},
 an unsynchronized single-threaded double-ended queue significantly
 outperforms any of the parallel implementations they studied.
diff --git a/qqz.tex b/qqz.tex
index 57cdc43f63d1..cfd0356854b7 100644
--- a/qqz.tex
+++ b/qqz.tex
@@ -2561,6 +2561,14 @@ ret = ~ret & tmp;
 	it is worthwhile) is left as an exercise for the reader.

 \QuickQ{}
+	Why are there not one but two solutions to the double-ended queue
+	problem?
+\QuickA{}
+	There are actually at least three.
+	The third, by Dominik Dingel, makes interesting use of
+	reader-writer locking, and may be found in \co{lockrwdeq.c}.
+
+\QuickQ{}
 	The tandem double-ended queue runs about twice as fast as
 	the hashed double-ended queue, even when I increase the
 	size of the hash table to an insanely large number.

