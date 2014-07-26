Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:41611 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752074AbaGZQvk (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 26 Jul 2014
 12:51:40 -0400
Received: from /spool/local	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 26 Jul
 2014 10:51:40 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id E2F1D19D8026	for <perfbook@vger.kernel.org>; Sat, 26
 Jul 2014 10:51:25 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com
 [9.17.195.245])	by b03cxnp07029.gho.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0)
 with ESMTP id s6QElqr666912358	for <perfbook@vger.kernel.org>; Sat, 26 Jul
 2014 16:47:52 +0200
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 s6QGtkGi002332	for <perfbook@vger.kernel.org>; Sat, 26 Jul 2014 10:55:46
 -0600
Date: Sat, 26 Jul 2014 09:51:33 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Error report: perfbook Section 11.6.3.2
Message-ID: <20140726165133.GM11241@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAOArY3XAD986MWLXcnG3VsYk40jyRgK8N+aWHniOnNJUTbmy9w@mail.gmail.com>
 <20140722155730.GA11241@linux.vnet.ibm.com>
 <CAOArY3UOo6mk=y5yQi+mqvRfrduJodYOE0tL3ioyAx4qx-Lfww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOArY3UOo6mk=y5yQi+mqvRfrduJodYOE0tL3ioyAx4qx-Lfww@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Isaac To <isaac.to@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 26, 2014 at 04:47:51PM +0800, Isaac To wrote:
> On Tue, Jul 22, 2014 at 11:57 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> >> The probability being calculated needs to be specified like "the
> >> probability of this happening *in case* the fix has no effect".  That "the
> >> fix has no effect" needs to be a *prerequisite*, and cannot itself be the
> >> probability to be computed.  The complement, i.e., 1 - 1.2e-8, is "the
> >> confidence level that the probability of failing is less than the
> >> original".  I'd suggest using the "confidence level" wording here, but
> >> explain what it is earlier in the book to tell the less mathematically apt
> >> readers understand the wordings.
> >
> > Good catch!
> >
> > How about if I reworded that paragraph as follows?
> >
> >         Suppose that a given test fails about once every hour, but after a
> >         bug fix, a 24-hour test run fails only twice.  Assuming that the
> >         failure leading to the bug is a random occurrence, and further
> >         assuming that the alleged fix actually had no effect on this
> >         particular bug, what is the probability that the small number
> >         of failures in the second run was due to random chance? This
> >         probability may be calculated by summing Equation 11.26 as
> >         follows:
> 
> I think if you already say "assuming that the failure ... is a random
> occurrence", then "was due to random chance" is redundant.  Perhaps
> "What is the probability of the small number of failures, assuming
> that the alleged fix actually has no effect on the test failure?"
> suffices.  On the other hand, that would not be very consistent with
> other parts of the book that uses the "confidence level" terminology.
> And the term is not defined elsewhere either.

OK, I now say the following, which removes the redundancy but links to
the concept of confidence:

	Suppose that a given test fails about once every hour, but after
	a bug fix, a 24-hour test run fails only twice.  Assuming that
	the failure leading to the bug is a random occurrence, what
	is the probability that the small number of failures in the
	second run was due to random chance?  In other words, how
	confident should we be that the fix actually had some effect
	on the bug?  This probability may be calculated by summing
	Equation 11.26 as follows:

> > I am shying away from explaining "confidence level" because I haven't
> > yet come up with a compact and accurate way of doing so.  However, I am
> > taking this email as encouragement to keep trying.  ;-)
> 
> Yes that is hard.  Actually I like the confidence level wording more,
> not only because it is more compact, but also because the wording
> clearly explain why the probability calculated is noteworthy.  On the
> other hand, I think the book is more on programming rather than
> mathematics, so I won't complain if the book does not try to teach
> fancy statistical ideas if that is not needed in the main theme.

Well, I do say this earlier on:

	These tools are extremely helpful, but please note that reading
	this section not a substitute for taking a good set of statistics
	classes.

And in case you were wondering about the derivation of the Poisson CDF,
that will be moving to an appendix shortly, and will probably be dropped
entirely to make room for more relevant things.  What can I say?  I was
too proud of suddenly realizing how to derive it from scratch.  ;-)

							Thanx, Paul

