Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4GL6ebC19Hu+KIbBTWa4FeOWY5861M1SCm1uo9pxRTA=;
 b=vqzlegkOwe9Er3DwCPqcumoomeU4Cg/SR/aKiGc8UK/yyVp7I/2P2O/s2MWQzbWjxD
 eNtI7d4t7B+7ST/QM5p7WfhoYf8mhFmwOMswSjae/J2iXLMlciK8ladzg6xVmSQgZESv
 7YhkE6Z2m5tM2+aZEDeP3RIRE0Iq3WdnFLG3gH93b/B7OiHLokG4Zr5tu8J1ZRE0vgDw
 quUxliSY1Py58zJmG+rU8Bcv35sZkfhm4Th6oWJdJgANrNwZQ7Qwizt5+1nrgcqDQ3//
 rDilftJeIrWZYl/6E0UuD29t+A7LyhbvZL4PPADPjMeU6ZB/Wq9Y9pNqupQ2X3buUlRI
 JUMA==
Subject: Re: Some questions
References: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
 <20160427165357.GD4967@linux.vnet.ibm.com>
 <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
 <20160427225022.GK4967@linux.vnet.ibm.com>
 <b8f3c36c-3e3b-ebb4-11b3-2abed5ca2083@gmail.com>
 <20160427232807.GL4967@linux.vnet.ibm.com>
 <428ce2d3-6d21-a97f-ce60-4b0635a7cbd6@gmail.com>
 <20160428162827.GJ4609@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4cbb1be0-8d65-2f37-716f-f90723ab4cd7@gmail.com>
Date: Fri, 29 Apr 2016 08:05:43 +0900
MIME-Version: 1.0
In-Reply-To: <20160428162827.GJ4609@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/29 1:28, Paul E. McKenney wrote:
> On Fri, Apr 29, 2016 at 12:39:09AM +0900, Akira Yokosawa wrote:
>> On 2016/04/27 16:28:07 -0700, Paul E. McKenney wrote:
>>> On Thu, Apr 28, 2016 at 08:01:31AM +0900, Akira Yokosawa wrote:
>>>> On 2016/04/27 15:50:22 -0700, Paul E. McKenney wrote:
>>>>> On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
>>>>>> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
>> [snip.
>>>>>>> Please see attached for what it looks like to me.
>>>>>>
>>>>>> Well, this is identical to the one I built.
>>>>>> So, do you intend to explicitly put numbers which show up fairly long time, and
>>>>>> leave other cells blank even below changes of values denoted by (n) in italics?
>>>>>
>>>>> The blank cells represent cache misses.  The CPU is waiting for a read
>>>>> to complete during that time.  A non-blank cell corresponds to a CPU
>>>>> actually completing a read.
>>>>
>>>> Oh, I see. But this should be explained in the text, I think.
>>>
>>> Good point!  I also added several other possibilities, including
>>> interrupts and preemption.
>>>
>>
>> So, I have a few questions regarding to the added explanation of blank cells.
>>
>> According to the text, trace data used to create the table are said to be 
>> obtained by a program that contains the code fragment shown in Figure 14.4.
>> The loop in the code fragment will exit once it sees state.variable != mycpu.
>> That means the actual program you used has an outer loop to record the
>> changes of state.valuable for each cpu in the system, I suppose.
>> Am I guessing right?
> 
> IIRC, the program just stuffed timestamps and values into a set of per-CPU
> big arrays, then printed them out.  A script took these values as input,
> and compacted identical state.
> 
>> If I am, (n)'s in the table denoting modification of variables must be
>> entries in the trace data which were output from the outer loop, I think.
> 
> The (n)'s mark changes in value for a given CPU.
> 
>> However, in the table, there are a number of cases where (n)'s are followed
>> by blanks just below itself. Does this mean fetched state.variables stay in
>> the cache very briefly, but are (almost immediately) invalidated by a cache
>> coherence mechanism? I can see interrupts and preemption would also cause the
>> trace output to be suspended for a while.
> 
> It marks places where a given CPU saw a value momentarily.  As you say,
> this could be due to cache invalidation, interrupts, preemption, etc.
> 
>> I'm not sure I have made out what the table means thus far, but am I seeing
>> something close enough to what you intend the table to represent?
> 
> The main point is that different CPUs can disagree on the value of a given
> variable at a given point in time.  The following diagram shows that
> this disagreement is nevertheless bounded, in that all CPUs must agree
> on the ordering of values for that variable.

Yes, of course that's the main point.
I should have asked in a different way.

There should be the same kind of situations in Figure 14.5.
But you didn't depict them in the figure.

Why did you put the blank cells in the table in the first place?

I'm a little bit distracted by those blank cells, and began questioning
about them.

Isn't it enough to just do the same way in Table 14.2 as in Figure 14.5?

Or, could the blank cell situation be explained in the form of an answer
of a quick quiz?  It would be much easier for me to grasp the main point
of this section "Variables Can Have More Than One Value" while reading the
body of the text.

Thoughts?

                                                   Thanks, Akira

> 
> 							Thanx, Paul
> 
> 

