Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:53710 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1754176AbaGVP5e (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 22 Jul 2014
 11:57:34 -0400
Received: from /spool/local	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 22 Jul
 2014 09:57:33 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 9A4263E4003E	for <perfbook@vger.kernel.org>; Tue, 22
 Jul 2014 09:57:31 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com
 [9.17.195.245])	by b03cxnp08026.gho.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0)
 with ESMTP id s6MFuHpb52625504	for <perfbook@vger.kernel.org>; Tue, 22 Jul
 2014 17:56:17 +0200
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 s6MG1dru010492	for <perfbook@vger.kernel.org>; Tue, 22 Jul 2014 10:01:40
 -0600
Date: Tue, 22 Jul 2014 08:57:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Error report: perfbook Section 11.6.3.2
Message-ID: <20140722155730.GA11241@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAOArY3XAD986MWLXcnG3VsYk40jyRgK8N+aWHniOnNJUTbmy9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOArY3XAD986MWLXcnG3VsYk40jyRgK8N+aWHniOnNJUTbmy9w@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Isaac To <isaac.to@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 21, 2014 at 04:24:26PM +0800, Isaac To wrote:
> Hi,
> 
> Thanks a lot for the free book, it is very useful!

Glad you like it!

> I'd like to point out an error I see in Section 11.6.3.2, after Quick Quiz
> 11.10.  It says the following:
> 
>   Suppose that a given test fails about once every hour, but after a bug fix,
>   a 24-hour test run fails only twice. What is the probability of this being
>   due to random chance, in other words, what is the probability that the fix
>   had no statistical effect?
> 
> In other parts of the book, care has been taken to say something like
> "confidence level" to make the probability statements correct.  Not here.
> 
> The only thing that we know about the probability of failing after the
> experiment is that "the probability of the test failing now is not zero".
> To know the "probability of this being due to random chance", or
> "probability that the fix had no effect", requires the knowledge of the
> behaviour of the bug itself (or, at least, the prior probability that the
> perhaps buggy system has a certain behaviour), and it is not specified in
> the question.  E.g., in an extreme world that the test can only fail at a
> rate of once every hour or never at all, we must admit that we are very
> very lucky during this particular test.
> 
> The probability being calculated needs to be specified like "the
> probability of this happening *in case* the fix has no effect".  That "the
> fix has no effect" needs to be a *prerequisite*, and cannot itself be the
> probability to be computed.  The complement, i.e., 1 - 1.2e-8, is "the
> confidence level that the probability of failing is less than the
> original".  I'd suggest using the "confidence level" wording here, but
> explain what it is earlier in the book to tell the less mathematically apt
> readers understand the wordings.

Good catch!

How about if I reworded that paragraph as follows?

	Suppose that a given test fails about once every hour, but after a
	bug fix, a 24-hour test run fails only twice.  Assuming that the
	failure leading to the bug is a random occurrence, and further
	assuming that the alleged fix actually had no effect on this
	particular bug, what is the probability that the small number
	of failures in the second run was due to random chance? This
	probability may be calculated by summing Equation 11.26 as
	follows:

I am shying away from explaining "confidence level" because I haven't
yet come up with a compact and accurate way of doing so.  However, I am
taking this email as encouragement to keep trying.  ;-)

							Thanx, Paul

PS.  Congratulations!  You are the first to use the new mailing list
     to report a bug in this book.  ;-)

