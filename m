Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=SpPFAF3ASYqNlNXCE/pDoJ3+/A+lKRrlR0hR3eFbNEA=;
 b=s3L2n7CeMEeZzn9z2t2reGkW23tbcx2egvNWOJVtTaZ+vjjerOyykNZ/yv2bL6vNrX
 U+51kEnnJWRngJdyp4/2OdvzWIE52GOKr1S+CROAS6J8aCqM9G3vPTVpX4PCWteheDnu
 uxwsqgEvsBS15LT/3vWpBDdipI18GrTxIZ8g+fuVNIy4XTKlyh5qFF88amJj9JF00G8W
 B2arUcCtxN/JY7v8vFdvHbNous5htZIJKRw6HISOSgJxS4CBJTKMNUZ+CkR56BWUMEwu
 IPlIRyRceBTI8xSBbxttfuP+HXhHU2J2a6rCYoGKAUWfkOQPhy+7+tP6p0Pej4NSEO+X
 3dOw==
Subject: Re: Some questions
References: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
 <20160427165357.GD4967@linux.vnet.ibm.com>
 <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
 <20160427225022.GK4967@linux.vnet.ibm.com>
 <b8f3c36c-3e3b-ebb4-11b3-2abed5ca2083@gmail.com>
 <20160427232807.GL4967@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <428ce2d3-6d21-a97f-ce60-4b0635a7cbd6@gmail.com>
Date: Fri, 29 Apr 2016 00:39:09 +0900
MIME-Version: 1.0
In-Reply-To: <20160427232807.GL4967@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/27 16:28:07 -0700, Paul E. McKenney wrote:
> On Thu, Apr 28, 2016 at 08:01:31AM +0900, Akira Yokosawa wrote:
>> On 2016/04/27 15:50:22 -0700, Paul E. McKenney wrote:
>>> On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
>>>> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
[snip.
>>>>> Please see attached for what it looks like to me.
>>>>
>>>> Well, this is identical to the one I built.
>>>> So, do you intend to explicitly put numbers which show up fairly long time, and
>>>> leave other cells blank even below changes of values denoted by (n) in italics?
>>>
>>> The blank cells represent cache misses.  The CPU is waiting for a read
>>> to complete during that time.  A non-blank cell corresponds to a CPU
>>> actually completing a read.
>>
>> Oh, I see. But this should be explained in the text, I think.
> 
> Good point!  I also added several other possibilities, including
> interrupts and preemption.
> 

So, I have a few questions regarding to the added explanation of blank cells.

According to the text, trace data used to create the table are said to be 
obtained by a program that contains the code fragment shown in Figure 14.4.
The loop in the code fragment will exit once it sees state.variable != mycpu.
That means the actual program you used has an outer loop to record the
changes of state.valuable for each cpu in the system, I suppose.
Am I guessing right?

If I am, (n)'s in the table denoting modification of variables must be
entries in the trace data which were output from the outer loop, I think.

However, in the table, there are a number of cases where (n)'s are followed
by blanks just below itself. Does this mean fetched state.variables stay in
the cache very briefly, but are (almost immediately) invalidated by a cache
coherence mechanism? I can see interrupts and preemption would also cause the
trace output to be suspended for a while.

I'm not sure I have made out what the table means thus far, but am I seeing
something close enough to what you intend the table to represent?

                                                     Thanks, Akira

