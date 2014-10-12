Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e32.co.us.ibm.com ([32.97.110.150]:35659 "EHLO
 e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751032AbaJLNKc (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 12 Oct 2014
 09:10:32 -0400
Received: from /spool/local	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 12 Oct
 2014 07:10:32 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id 3AC2419D803E	for <perfbook@vger.kernel.org>; Sun, 12
 Oct 2014 06:59:14 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com
 [9.17.195.245])	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id s9CD8Lvl8192412	for <perfbook@vger.kernel.org>; Sun, 12 Oct
 2014 15:08:21 +0200
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 s9CDF97Y020416	for <perfbook@vger.kernel.org>; Sun, 12 Oct 2014 07:15:09
 -0600
Date: Sun, 12 Oct 2014 06:10:28 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Typos in perfbook section 5.6 and table 9.7
Message-ID: <20141012131028.GI4880@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAGfuzXRMegrY3xdfmr7nDE=DQ1O64GdNZvrxoq6JyEFfz6Eynw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAGfuzXRMegrY3xdfmr7nDE=DQ1O64GdNZvrxoq6JyEFfz6Eynw@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Motohiro Kanda <kanda.motohiro@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 09, 2014 at 10:47:56PM +0900, Motohiro Kanda wrote:
> Hi,
> 
> I enjoy the book so much and am making a Japanese translation here.
> https://sites.google.com/site/kandamotohiro/perfbook

Very good!  I have added this translation to the FAQ.

> I think I have found 2 typos in perfbook. Latest git repo also has these bugs.
> 
> 5.6 Parallel Counting Discussion
> on page 82, in file count.tex says,
> 
> "The per-thread
> variable implementation (count_stat.c) is significantly faster on updates than
> the array-based implementation (count_end.c), but is slower at reads"
> 
> But it should read
> 
> per-thread variable implementation(count_end.c)
> and
> array-based implementation (count_stat.c)
> 
> And according to table 5.1,
> array-based implementation has 408 ns vs.
> per-thread variable implementation has 389 ns.
> 
> so, per-thread variable implementation is a little faster, not slower
> at 1 core read.

Good catch!  This sentence now reads as follows:

	The per-thread-variable implementation (count_end.c)
	is significantly faster on updates than the array-based
	implementation (count_stat.c), but is slower at reads on large
	numbers of cores, and suffers severe lock contention when there
	are many parallel readers.

> Table 9.7  Which Deferred Technique to Choose?
> on page 228 in file whichtochoose.tex says,
> 
> Sequence Locks has "Y" on Updates and Readers Progress Concurrently
> 
> But it should be N because on page 229, it says
> 
> sequence locking does not permit updates and readers to make forward
> progress concurrently

And reference counting, hazard pointers, and RCU should all say "Y".

I have made these changes with your Reported-by.

							Thanx, Paul

> --
> Kanda Motohiro
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

