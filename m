Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46506 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754123AbdEIQJa (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 9 May 2017 12:09:30 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v49FnTi9087084
 for <perfbook@vger.kernel.org>; Tue, 9 May 2017 12:09:30 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2ab02jccay-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 09 May 2017 12:09:29 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 9 May 2017
 12:09:28 -0400
Date: Tue, 9 May 2017 09:09:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Question on Answer to Quick Quiz 5.16 (Absolute error of summing
 up per-thread counters)
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CABoNC82ctHF6rJPRUg_R_g4kw3poik+tnX4V8K=0_UtBjKfszA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABoNC82ctHF6rJPRUg_R_g4kw3poik+tnX4V8K=0_UtBjKfszA@mail.gmail.com>
Message-Id: <20170509160926.GR3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 09, 2017 at 11:28:37PM +0800, Junchang Wang wrote:
> Hi list,
> 
> I'm reading the Answer to Quick Quiz 5.16, which is different to what
> I expected. I embedded my puzzles and my solutions. Please help
> verify.
> 
> >        In the worst case, the read operation completes immediately,
> >        but is then delayed for $\Delta$ time units before returning,
> >        in which case the worst-case error is simply $r \Delta$.
> >
> >        This worst-case behavior is rather unlikely, so let us instead
> >        consider the case where the reads from each of the $N$
> >        counters is spaced equally over the time period $\Delta$.
> >        There will be $N+1$ intervals of duration $\frac{\Delta}{N+1}$
> >        between the $N$ reads.
> 
> I don't understand why the number of intervals is $N+1$. My answer is
> $N$. I used the following figure to try to understand:

If I start with a time interval, and make $N$ cuts, there will be $N+1$
pieces.  Try it with a piece of paper or some food or something.  ;-)

> In the figure, time clock increases from left to right.
> Symbol "|" indicates the moment the reader starts reading a per-thread
> counter, and subsequent spaces "_" indicate time slots the reader has
> to wait to get the value of this counter, due to for example cache
> miss. The last symbol "$" means the reader gets the value of the last
> counter and will return accumulated sum immediately. So when we talk
> about absolute error, we are talking about the miscounts happened in
> between the first read ("|") and getting the value of last counter
> ("$"). In an extreme case (not real) where the reads run super fast
> and the first read "|" and last "$" move together, then there is no
> miscount anymore.
> 
> For each read operation, an interval follows. So the number of
> intervals would be equal to the number of counters ($N$), which is
> different to the answer in the book, $N+1$.
> 
>   |_______|________|________|________$
>   (Assume the system has 4 counters, and
>   each counter takes the reader 8 time slots (space) to get the value)

That isn't spaced equally.  You have a zero-length segment at the
beginning.  This is spaced equally:

    _______|_______|________|________|________$

$N$ cuts, $N+1$ segments.

> >        It is important to remember that error continues accumulating
> >        as the caller executes code making use of the count returned
> >        by the read operation.
> >        For example, if the caller spends time $t$ executing some
> >        computation based on the result of the returned count, the
> >        worst-case error will have increased to $r \left(\Delta + t\right)$.
> >
> >        The expected error will have similarly increased to:
> >
> >        \begin{equation}
> >                r \left( \frac{\Delta}{2} + t \right)
> >        \end{equation}
> 
> It's hard for me to understand this part. Use my example figure again:
> 
>   |_______|________|________|________$ _ _ _ t _ _ _
>   (Assume the system has 4 counters, and
>   each counter takes the reader 8 time slots (space) to get the value)
> 
> The only difference compared to previous figure is the time slots of
> $t$ appeared at the tail.
> "The caller spends time $t$ executing some computation based on the
> result of the returned count"
> In other words, the reader returned at time slot "$", the same as the
> previous figure, so does the absolute error. So the error would be
> constant, no matter how long $t$ is.

Try it with my equally spaced version and see if that helps.

> >        All that aside, in most uses of statistical counters, the
> >        error in the value returned by \co{read_count()} is
> >        irrelevant.
> >        This irrelevance is due to the fact that the time required
> >        for \co{read_count()} to execute is normally extremely
> >        small compared to the time interval between successive
> >        calls to \co{read_count()}.
> 
> Can we use word "negligible" to replace "irrelevant"? :-) I think the
> accuracy is not the stuff we don't want; it is something we have to
> tradeoff against.

Yes, but you will have to very carefully choose the corresponding changes
to the second sentence, due to peculiarities of the English language.
But give it a try and let's see what you come up with.  Always happy
to take improvements.

> BTW, I'm still concerning about the absolute error may become too
> large to be acceptable. For example, for some networks, packets arrive
> for each 100 nanoseconds. In this scenario, counting error will happen
> all the time.

Suppose a system takes 500 nanoseconds for each remote cache miss.
Then on an N-CPU system, it will take N/2 microseconds to add up the
overall counter value.  The absolute error will then be 5*N, or 5120
on a rather large 1024-CPU system.  But if the counter readout is done
every five seconds, this error of 5120 will be out of a 5,000,000 packet
delta over that five-second interval, which should not be a problem.

But yes, you should check to see that any errors are acceptably small.

> The arguments in the book are convincing and I understand we can
> ignore the counting error because it is in small ratio. I just curious
> about are there any solutions or efforts to tackle this problem?

The book describes some potential hardware solutions, which are starting
to appear -- though they have their disadvantages as well.  There is
a trick incorporating a distributed reader-writer lock, though most
networking people these days would be very upset if you suggested that
network packet reception be blocked to allow exact counter readout.  ;-)

However, this trick works fine in many other cases.

							Thanx, Paul

