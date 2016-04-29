Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nRvXmPw1JkXzlw/0vByKa0wmT2Ie6oDXmSuX86K5Nig=;
 b=njp+V6C4GtpmxJ/BkT2xqjZ2d6p+4t4iUJ4R8y+g9MWc0KOI5JTq74IIZ0S2/DiGm3
 VEUJEvMHFU6sWUnD8dMwnZj0SNY6fxMuHZbgIrNtpD4nkjQsRGj+BYoVXpuNNitaFjiX
 IMkesrBzDmp8dmBnjIw+KgLhoQcymDZL9PgF9KZvDz2rK2QRSAz1NKb1Shv/dNiMxMSi
 ieJjIPprlWK4hWmmpLrDb7DJ2vl4vSyku2CPCo1CUk+u/EXRuz7fTjGWWbHFgmQS46Ax
 UL9Lh1pzEINxAzRhyuk02tSCHxH/A+h5zO1dyTYVyzQyeZCVDmSQejY11FadAAlL7mDQ
 TkSg==
Subject: Re: Some questions
References: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
 <20160427165357.GD4967@linux.vnet.ibm.com>
 <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
 <20160427225022.GK4967@linux.vnet.ibm.com>
 <b8f3c36c-3e3b-ebb4-11b3-2abed5ca2083@gmail.com>
 <20160427232807.GL4967@linux.vnet.ibm.com>
 <428ce2d3-6d21-a97f-ce60-4b0635a7cbd6@gmail.com>
 <20160428162827.GJ4609@linux.vnet.ibm.com>
 <4cbb1be0-8d65-2f37-716f-f90723ab4cd7@gmail.com>
 <bce4d958-0333-6611-7e81-5461ecebaebd@gmail.com>
 <20160429171525.GA3686@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <225137b1-6cf3-7884-a508-66baec1519be@gmail.com>
Date: Sat, 30 Apr 2016 07:06:39 +0900
MIME-Version: 1.0
In-Reply-To: <20160429171525.GA3686@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/30 2:15, Paul E. McKenney wrote:
> On Sat, Apr 30, 2016 at 01:00:29AM +0900, Akira Yokosawa wrote:
>> On 2016/04/29 8:05, Akira Yokosawa wrote:
>>> On 2016/04/29 1:28, Paul E. McKenney wrote:
>>>> On Fri, Apr 29, 2016 at 12:39:09AM +0900, Akira Yokosawa wrote:
>>>>> On 2016/04/27 16:28:07 -0700, Paul E. McKenney wrote:
>>>>>> On Thu, Apr 28, 2016 at 08:01:31AM +0900, Akira Yokosawa wrote:
>>>>>>> On 2016/04/27 15:50:22 -0700, Paul E. McKenney wrote:
>>>>>>>> On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
>>>>>>>>> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
>>>>> [snip.
>>>>>>>>>> Please see attached for what it looks like to me.
>>>>>>>>>
>>>>>>>>> Well, this is identical to the one I built.
>>>>>>>>> So, do you intend to explicitly put numbers which show up fairly long time, and
>>>>>>>>> leave other cells blank even below changes of values denoted by (n) in italics?
>>>>>>>>
>>>>>>>> The blank cells represent cache misses.  The CPU is waiting for a read
>>>>>>>> to complete during that time.  A non-blank cell corresponds to a CPU
>>>>>>>> actually completing a read.
>>>>>>>
>>>>>>> Oh, I see. But this should be explained in the text, I think.
>>>>>>
>>>>>> Good point!  I also added several other possibilities, including
>>>>>> interrupts and preemption.
>>>>>>
>>>>>
>>>>> So, I have a few questions regarding to the added explanation of blank cells.
>>>>>
>>>>> According to the text, trace data used to create the table are said to be 
>>>>> obtained by a program that contains the code fragment shown in Figure 14.4.
>>>>> The loop in the code fragment will exit once it sees state.variable != mycpu.
>>>>> That means the actual program you used has an outer loop to record the
>>>>> changes of state.valuable for each cpu in the system, I suppose.
>>>>> Am I guessing right?
>>>>
>>>> IIRC, the program just stuffed timestamps and values into a set of per-CPU
>>>> big arrays, then printed them out.  A script took these values as input,
>>>> and compacted identical state.
>>>>
>>>>> If I am, (n)'s in the table denoting modification of variables must be
>>>>> entries in the trace data which were output from the outer loop, I think.
>>>>
>>>> The (n)'s mark changes in value for a given CPU.
>>>>
>>>>> However, in the table, there are a number of cases where (n)'s are followed
>>>>> by blanks just below itself. Does this mean fetched state.variables stay in
>>>>> the cache very briefly, but are (almost immediately) invalidated by a cache
>>>>> coherence mechanism? I can see interrupts and preemption would also cause the
>>>>> trace output to be suspended for a while.
>>>>
>>>> It marks places where a given CPU saw a value momentarily.  As you say,
>>>> this could be due to cache invalidation, interrupts, preemption, etc.
>>>>
>>>>> I'm not sure I have made out what the table means thus far, but am I seeing
>>>>> something close enough to what you intend the table to represent?
>>>>
>>>> The main point is that different CPUs can disagree on the value of a given
>>>> variable at a given point in time.  The following diagram shows that
>>>> this disagreement is nevertheless bounded, in that all CPUs must agree
>>>> on the ordering of values for that variable.
>>>
>>> Yes, of course that's the main point.
>>> I should have asked in a different way.
>>>
>>> There should be the same kind of situations in Figure 14.5.
>>> But you didn't depict them in the figure.
>>>
>>> Why did you put the blank cells in the table in the first place?
>>>
>>> I'm a little bit distracted by those blank cells, and began questioning
>>> about them.
>>>
>>> Isn't it enough to just do the same way in Table 14.2 as in Figure 14.5?
>>>
>>> Or, could the blank cell situation be explained in the form of an answer
>>> of a quick quiz?  It would be much easier for me to grasp the main point
>>> of this section "Variables Can Have More Than One Value" while reading the
>>> body of the text.
>>>
>>> Thoughts?
>>>
>>>                                                    Thanks, Akira
>>>
>>>>
>>>> 							Thanx, Paul
>>>>
>>>>
>>>
>>
>> So I drew 2 figures based on Table 14.2.
>> No, I didn't actually drew them but wrote a rough program to generate .fig
>> format files from the value changes of each CPU extracted from Table 14.2.
>> I ignored the blank cells in the table just as in Figure 4.5.
>> Appended is a tar ball of two files.
>> out.fig is the overall diagram, and out-2.fig is a zoomed in view of
>> the beginning part.
>> I think they can provide a fairly interesting view of what's going on.
>>
>> Please give a look at them.
> 
> Not bad, actually!
> 
> The solid black areas need to be hatched or grey, otherwise it is a bit
> hard on printers.  The colored areas look OK to me, though that does
> not necessarily count for much.  ;-)

I'll see what I can.

> 
> Would you like to send a patch replacing the table with these diagrams
> and updating the text appropriately?

I'd love to!
And may I remove the explanation of the "white cell situation" for now?
Or do you want to keep those info in another set of diagrams which would
depict the unresponsive periods in some way (translucent hatch or something)
so that you could refer to them in a quick quiz you might come up with
some day? 

                                                  Thanks, Akira
> 
> 						Thanx, Paul
> 
> 

