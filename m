Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:34685 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S932502AbbLRSVZ (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 18 Dec 2015
 13:21:25 -0500
Received: from localhost	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 18 Dec
 2015 11:21:24 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id E59461FF0049	for <perfbook@vger.kernel.org>; Fri, 18
 Dec 2015 11:09:33 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBIILNli29425754	for <perfbook@vger.kernel.org>; Fri, 18 Dec 2015 11:21:23
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBIILM3L012231	for <perfbook@vger.kernel.org>; Fri, 18 Dec 2015 11:21:22
 -0700
Date: Fri, 18 Dec 2015 10:03:46 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Approximate structure-allocation limit problem improvement
Message-ID: <20151218180346.GQ4054@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CABy3NjQQF+Kr+9MYmWVHY=b-d=NdOjTpiHMaKhuZzBECyDzOCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABy3NjQQF+Kr+9MYmWVHY=b-d=NdOjTpiHMaKhuZzBECyDzOCA@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 16, 2015 at 02:21:45PM +0100, Colin Pitrat wrote:
> Hello,
> 
> in chapter 5 (Counting), in the paragraph concerning "Approximate
> structure-allocation limit problem", it is said:
> 
> "Similarly, sub_count() can fail even when the aggregate value of the
> counter is nowhere near zero. In many cases, this is unacceptable."
> 
> In the case of the Quick Quiz 5.3 question, it's true that it's quite
> a problem if it means freeing the structure fails because the counter
> cannot be updated ! And freeing it without updating the counter means
> the counter shifts from reality.
> 
> However, the very existence of the structure is a guarantee that the
> real (total) counter value cannot be 0 or less than delta, so couldn't
> we imagine to always succeed the sub_count operation by keeping a
> global negative offset ? In the slow path, after globalize_count, if
> the global count is lower than delta then we set it to 0 and we
> increment the negative offset by what remains.
> 
> On the next slow path operation during a add_count, this negative
> offset can be removed (or reduced) by reducing the local counter of
> the thread by the same value.
> 
> This improvement over the proposed solution make it an acceptable
> answer for the quick quiz 5.3 whereas it isn't without.
> 
> What do you think ?
> Should I spend a bit of time writing a paragraph and a code sample about it ?

I must confess that I have read this message a few times, and still don't
understand what you are getting at.  Part of my trouble is that I am
not sure why you are comparing against zero -- the structure-allocation
problem only needs to compare against the limit.  But you might mean
zero after offset, or you might be talking about some related problem.

So perhaps a paragraph and sample code would help me understand the
problem you are looking at and your example solution.

							Thanx, Paul

