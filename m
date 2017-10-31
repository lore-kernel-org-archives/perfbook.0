Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=abWmXbN3oB4mfMslhYZBWWzO/fmt8xRO5iKRphb3lus=;
 b=SN+qMJvm3Wy/TQBKWz5epaVNUtUixN7wB4tLneef6gdfmshfDWLVh8Zu3SXL/tUobP
 JyP0D5qJocv9ZA2uYLRCRBu9OShYqxiEpprRQvzRlGNH0gvS/AFqL7vvIlurY+Q6klAS
 Cs4dQVFoZP76gb7ODAmvW2ny1+V1jHdfZHmwgJRNaeKkDCwWD9CgHy+cPTQ5olIWCNjB
 aVL6dlT4aN+N0Qz9RciB6+NY4iYQQ0h0soAv+a4fuHrqy/m5pmEX18BDqRSqb/1X4D8l
 ym0yr2+Fv29y8LK86BMwM9jiio41KNiapwAzc8JFTfh8Wp9FAA0Rwxq/dFqvzbRKdcge
 UK/w==
Subject: Re: Is WRITE_ONCE() enough to prevent invention of stores?
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
 <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
 <20170917215508.GD3521@linux.vnet.ibm.com>
 <fb1ab164-36a7-1ed7-4eea-5668f5ada155@gmail.com>
 <20171030181423.GA3659@linux.vnet.ibm.com>
 <28b4b464-d8d3-6000-e30d-eb99291d5d7d@gmail.com>
 <20171031162718.GK3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b97b08a-243c-9d0a-2349-a6a2b949dc01@gmail.com>
Date: Wed, 1 Nov 2017 07:25:29 +0900
MIME-Version: 1.0
In-Reply-To: <20171031162718.GK3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/01 1:27, Paul E. McKenney wrote:
> On Wed, Nov 01, 2017 at 12:36:13AM +0900, Akira Yokosawa wrote:
>> On 2017/10/30 11:14:23 -0700, Paul E. McKenney wrote:
>>> On Mon, Sep 18, 2017 at 07:51:29AM +0900, Akira Yokosawa wrote:
>>>> On 2017/09/17 14:55:08 -0700, Paul E. McKenney wrote:
>>>>> On Sun, Sep 17, 2017 at 08:04:21PM +0900, Akira Yokosawa wrote:
>>>>>> On 2017/09/16 18:07:30 -0700, Paul E. McKenney wrote:
>>>>>>> On Sat, Sep 16, 2017 at 08:01:45PM +0900, Akira Yokosawa wrote:
> 
> [ . . . ]
> 
>>>>>> Adding this example in the text might be too verbose.
>>>>>> Would a Quick Quiz be reasonable?
>>>>>
>>>>> Might be good in the section on protecting memory references, and putting
>>>>> it into a quick quiz or two makes a lot of sense.
>>>>
>>>> It's up to you where to put it.
>>>>
>>>> And I now realize using READ_ONCE() and WRITE_ONCE() is quite tricky.
>>>> Missing one might not cause a problem today, but a smarter compiler
>>>> can expose the bug in the future...
>>>>
>>>> This is scary.
>>>
>>> Section 15.3.1 is supposed to cover READ_ONCE() and WRITE_ONCE().
>>> There is one final paragraph added just now, but if you get a chance,
>>> please let me know what you think.
>>
>> It looks OK to me. Some minor nitpicks.
>>
>> * On exact exceptions and exact interrupts:
>>
>> IIRC, I've heard from you that there is an exceptional architecture
>> which requires explicit memory barriers in exception/interrupt handlers.
>> Was it Itanium?
> 
> For interrupts from kernel code, it is sometimes the case that the
> kernel needs other CPUs to see the accesses in the code before the
> interrupt handler, the code within the interrupt handler, and the code
> after the interrupt handler to have happened in order.  In that case,
> the interrupt entry/exit code might well need full memory barriers.
> 
> There are other ways to organize this that do not require interrupt
> entry/exit memory barriers, for example, the convention could be that
> locking be used.

Makes sense.

And I was somewhat confused here.
By "exact exceptions and exact interrupts", you are talking about
_instruction stream_ reordering.
Now I recall that my question at the time was "Do interrupts/
exceptions behave as memory barriers?".
So they are distinct point of view. If an architecture didn't
provide "exact exceptions and exact interrupts", it should be
quite tricky to return from exceptions/interrupts.

Thanks for the clarification.

> 
>> * On the final paragraph of Section 15.3.1:
>>
>> "Nevertheless" appears twice in this paragraph. You might want to
>> reword one of them.
> 
> Good point, how about the following?
> 
> 	Nevertheless, it is quite possible to overdo use of READ_ONCE()
> 	and WRITE_ONCE(). For example, if you have prevented a given
> 	variable from changing (perhaps by holding the lock guarding
> 	all updates to that variable), there is no point in using
> 	READ_ONCE(). Similarly, if you have prevented any other CPUs or
> 	threads from reading a given variable (perhaps because you are
> 	initializing that variable before any other CPU or thread has
> 	access to it), there is no point in using WRITE_ONCE(). However,
> 	my experience is that developers need to use things like
> 	READ_ONCE() and WRITE_ONCE() more often than they think that
> 	they do, the overhead of unnecessary uses is quite low, and the
> 	penalty for failing to use them when needed is quite high.

The clause added to the last sentence makes the point more obvious.
This looks more than enough.

      Thanks, Akira

> 
> 							Thanx, Paul
> 
>>> And if you are scared, you might actually have a good understanding
>>> of the true situation.  ;-)
>>
>> Whew!!!
>>
>>      Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>          Thanks, Akira
>>>>
>>>>>
>>>>> 							Thanx, Paul
>>>>>
>>>>>>         Thanks, Akira
>>>>>>
>>>>>>>
>>>>>>> 							Thanx, Paul
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 

