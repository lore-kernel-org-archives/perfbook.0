Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=9X9YX0nJODHNkdU8EQdcBiAluNO4Hzzx7eu76Ksu/4w=;
 b=BvcBDLjbL7aDPMBZ0bMt3cZvyySGdWYWmKcEZDTMOSYNrWxPqNLktakNs6kzDjoCjG
 Hn/cS9R3jFEKrVm09FoMFkD7Cxv8f+u4Jc0njBEK0ziyts71/HBSEH2H+Vpsb1DJOdZL
 c/+I15WPzeth4Ol+EA5O5z7xz2gP8sganIr/CWiti3ymxif6gmw4HMzkno3pL+7HWpgE
 NmEN7nS9eVRShaLKpIf8OGy7ZCCNlGqvt0KehpDEAu83Lp7QA6bbtXswP3rxoiZgHm5G
 +uQ+ZSd60CE7de39KLVdWnesrqQ3Pd2Uo8reOCGlmoY2zKOriuCF0GWPN0UpRHpB1U/r
 wxEA==
MIME-Version: 1.0
In-Reply-To: <20170509160926.GR3956@linux.vnet.ibm.com>
References: 
 <CABoNC82ctHF6rJPRUg_R_g4kw3poik+tnX4V8K=0_UtBjKfszA@mail.gmail.com>
 <20170509160926.GR3956@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Thu, 11 May 2017 10:23:02 +0800
Message-ID: 
 <CABoNC81Ze5iNyiYdELF49+GHLGsOsO7njR36d6WKUcaOxhFq+Q@mail.gmail.com>
Subject: Re: Question on Answer to Quick Quiz 5.16 (Absolute error of summing
 up per-thread counters)
Content-Type: text/plain; charset=UTF-8
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Thanks for the reply. Please see below:

On Wed, May 10, 2017 at 12:09 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, May 09, 2017 at 11:28:37PM +0800, Junchang Wang wrote:
>> Hi list,
>>
>> I'm reading the Answer to Quick Quiz 5.16, which is different to what
>> I expected. I embedded my puzzles and my solutions. Please help
>> verify.
>>
>> >        In the worst case, the read operation completes immediately,
>> >        but is then delayed for $\Delta$ time units before returning,
>> >        in which case the worst-case error is simply $r \Delta$.
>> >
>> >        This worst-case behavior is rather unlikely, so let us instead
>> >        consider the case where the reads from each of the $N$
>> >        counters is spaced equally over the time period $\Delta$.
>> >        There will be $N+1$ intervals of duration $\frac{\Delta}{N+1}$
>> >        between the $N$ reads.
>>
>> I don't understand why the number of intervals is $N+1$. My answer is
>> $N$. I used the following figure to try to understand:
>
> If I start with a time interval, and make $N$ cuts, there will be $N+1$
> pieces.  Try it with a piece of paper or some food or something.  ;-)
>
>> In the figure, time clock increases from left to right.
>> Symbol "|" indicates the moment the reader starts reading a per-thread
>> counter, and subsequent spaces "_" indicate time slots the reader has
>> to wait to get the value of this counter, due to for example cache
>> miss. The last symbol "$" means the reader gets the value of the last
>> counter and will return accumulated sum immediately. So when we talk
>> about absolute error, we are talking about the miscounts happened in
>> between the first read ("|") and getting the value of last counter
>> ("$"). In an extreme case (not real) where the reads run super fast
>> and the first read "|" and last "$" move together, then there is no
>> miscount anymore.
>>
>> For each read operation, an interval follows. So the number of
>> intervals would be equal to the number of counters ($N$), which is
>> different to the answer in the book, $N+1$.
>>
>>   |_______|________|________|________$
>>   (Assume the system has 4 counters, and
>>   each counter takes the reader 8 time slots (space) to get the value)
>
> That isn't spaced equally.  You have a zero-length segment at the
> beginning.  This is spaced equally:
>
>     _______|_______|________|________|________$
>
> $N$ cuts, $N+1$ segments.
>

I think I fully understand right now, with your figure, and a cpu of
wonderful tea :-).

Under the covers we were using slightly different models: you spaces
the time $\Delta$ evenly with $N$ cuts; in contrast, I start the wall
clock of $\Delta$ right when the first read is issued, and as a
result, there is one segment missing in my model. I think your model
is more reasonable from user's perspective because for users, there do
exist some delay between a user calls read() function and the first
counter is really been read (e.g. penalty from Linux system call).


>> >        It is important to remember that error continues accumulating
>> >        as the caller executes code making use of the count returned
>> >        by the read operation.
>> >        For example, if the caller spends time $t$ executing some
>> >        computation based on the result of the returned count, the
>> >        worst-case error will have increased to $r \left(\Delta + t\right)$.
>> >
>> >        The expected error will have similarly increased to:
>> >
>> >        \begin{equation}
>> >                r \left( \frac{\Delta}{2} + t \right)
>> >        \end{equation}
>>
>> It's hard for me to understand this part. Use my example figure again:
>>
>>   |_______|________|________|________$ _ _ _ t _ _ _
>>   (Assume the system has 4 counters, and
>>   each counter takes the reader 8 time slots (space) to get the value)
>>
>> The only difference compared to previous figure is the time slots of
>> $t$ appeared at the tail.
>> "The caller spends time $t$ executing some computation based on the
>> result of the returned count"
>> In other words, the reader returned at time slot "$", the same as the
>> previous figure, so does the absolute error. So the error would be
>> constant, no matter how long $t$ is.
>
> Try it with my equally spaced version and see if that helps.
>

Agree. Thank for clarification.

>> >        All that aside, in most uses of statistical counters, the
>> >        error in the value returned by \co{read_count()} is
>> >        irrelevant.
>> >        This irrelevance is due to the fact that the time required
>> >        for \co{read_count()} to execute is normally extremely
>> >        small compared to the time interval between successive
>> >        calls to \co{read_count()}.
>>
>> Can we use word "negligible" to replace "irrelevant"? :-) I think the
>> accuracy is not the stuff we don't want; it is something we have to
>> tradeoff against.
>
> Yes, but you will have to very carefully choose the corresponding changes
> to the second sentence, due to peculiarities of the English language.
> But give it a try and let's see what you come up with.  Always happy
> to take improvements.

How about the following. Please let me know if it looks OK.

All that aside, in most uses of statistical counters, the error in the
value returned by read_count() is negligible. This error can be
ignored because the time required for read_count() to execute is
normally extremely small compared to the time interval between
successive calls to read_count(). For these uses, scalability and
performance are typically first priority and a slight counting error
which is acceptable is something we are willing to tradeoff against.

>
>> BTW, I'm still concerning about the absolute error may become too
>> large to be acceptable. For example, for some networks, packets arrive
>> for each 100 nanoseconds. In this scenario, counting error will happen
>> all the time.
>
> Suppose a system takes 500 nanoseconds for each remote cache miss.
> Then on an N-CPU system, it will take N/2 microseconds to add up the
> overall counter value.  The absolute error will then be 5*N, or 5120
> on a rather large 1024-CPU system.  But if the counter readout is done
> every five seconds, this error of 5120 will be out of a 5,000,000 packet
> delta over that five-second interval, which should not be a problem.
>
> But yes, you should check to see that any errors are acceptably small.

Thanks for the example.  I think I fully understand this now. How
about we add the example to Quick Quiz 5.2 (Network-packet counting
problem), which should be helpful. Please let me know.

Suppose a system has a network link where packets arrive for each 100
nanoseconds,
and the system takes 500 nanoseconds for each remote cache miss.
Then on an N-CPU system, it will take N/2 microseconds to add up the
overall counter value. The absolute error will then be 5*N, or 5120
on a rather large 1024-CPU system.  But if the counter readout is done
every five seconds, this error of 5120 will be out of a 5,000,000 packet
delta over that five-second interval, which should not be a problem.


>
>> The arguments in the book are convincing and I understand we can
>> ignore the counting error because it is in small ratio. I just curious
>> about are there any solutions or efforts to tackle this problem?
>
> The book describes some potential hardware solutions, which are starting
> to appear -- though they have their disadvantages as well.  There is
> a trick incorporating a distributed reader-writer lock, though most
> networking people these days would be very upset if you suggested that
> network packet reception be blocked to allow exact counter readout.  ;-)
>

Understand. Every real system has disadvantages, otherwise, they look
odd :-). I checked some drivers in Linux kernel (e.g. ixgbe from
Intel) and they are using exactly the same per-thread counters
strategy we are discussing to collect counters of multiple queues
(from MSI-X). This is an interesting problem because basically the
data structure should support super fast write but can provide
relatively show read operations. Happy discussion!

Could you please direct me to some hardware solutions you mentioned.
And I can help with the hardware solution draft you mentioned, if you
think that's OK. Can't wait to see how hardware people are handling
this.


Thanks,
--Jason

> However, this trick works fine in many other cases.
>
>                                                         Thanx, Paul
>

