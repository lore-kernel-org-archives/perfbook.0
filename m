Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=Gm3VULmWIsvqEN17//h3mYbzUgobG/gu8R85Swx1588=;
 b=FSG74YOpm0ICMpKj6VMnGH2TgqcOC2HKC8tNO2V1BiKG7fIqOAnovb92xJ3bL+Mu7T
 Sgi092/OOMrE+wKkTdcKchtm7GM/trI/4pZkNhoxAJweb543+VHm9X4qHV9Drgcr39sD
 LmRtunkI6QdS2eidHxJLdxvLYjjow1xVIEM3G/vNP163tyjh+9k/larVr2/+Bz1ncP/u
 rvePv+TYcAw4BRjNdK67COfAfgXiJxtO5P1pVpiiUcQR/30M0sXoPRjRvjpTFRB/oAV6
 PfMP/v91Qf36f5G2wDPPwQeLEKd50YQLdkylc/0ik29sgISBB8yY2iq+Vt82U2CUxlKJ
 WA9w==
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
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bce4d958-0333-6611-7e81-5461ecebaebd@gmail.com>
Date: Sat, 30 Apr 2016 01:00:29 +0900
MIME-Version: 1.0
In-Reply-To: <4cbb1be0-8d65-2f37-716f-f90723ab4cd7@gmail.com>
Content-Type: multipart/mixed; boundary="------------95C2453BBEA86AEA13D57CAD"
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This is a multi-part message in MIME format.
--------------95C2453BBEA86AEA13D57CAD
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 2016/04/29 8:05, Akira Yokosawa wrote:
> On 2016/04/29 1:28, Paul E. McKenney wrote:
>> On Fri, Apr 29, 2016 at 12:39:09AM +0900, Akira Yokosawa wrote:
>>> On 2016/04/27 16:28:07 -0700, Paul E. McKenney wrote:
>>>> On Thu, Apr 28, 2016 at 08:01:31AM +0900, Akira Yokosawa wrote:
>>>>> On 2016/04/27 15:50:22 -0700, Paul E. McKenney wrote:
>>>>>> On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
>>>>>>> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
>>> [snip.
>>>>>>>> Please see attached for what it looks like to me.
>>>>>>>
>>>>>>> Well, this is identical to the one I built.
>>>>>>> So, do you intend to explicitly put numbers which show up fairly long time, and
>>>>>>> leave other cells blank even below changes of values denoted by (n) in italics?
>>>>>>
>>>>>> The blank cells represent cache misses.  The CPU is waiting for a read
>>>>>> to complete during that time.  A non-blank cell corresponds to a CPU
>>>>>> actually completing a read.
>>>>>
>>>>> Oh, I see. But this should be explained in the text, I think.
>>>>
>>>> Good point!  I also added several other possibilities, including
>>>> interrupts and preemption.
>>>>
>>>
>>> So, I have a few questions regarding to the added explanation of blank cells.
>>>
>>> According to the text, trace data used to create the table are said to be 
>>> obtained by a program that contains the code fragment shown in Figure 14.4.
>>> The loop in the code fragment will exit once it sees state.variable != mycpu.
>>> That means the actual program you used has an outer loop to record the
>>> changes of state.valuable for each cpu in the system, I suppose.
>>> Am I guessing right?
>>
>> IIRC, the program just stuffed timestamps and values into a set of per-CPU
>> big arrays, then printed them out.  A script took these values as input,
>> and compacted identical state.
>>
>>> If I am, (n)'s in the table denoting modification of variables must be
>>> entries in the trace data which were output from the outer loop, I think.
>>
>> The (n)'s mark changes in value for a given CPU.
>>
>>> However, in the table, there are a number of cases where (n)'s are followed
>>> by blanks just below itself. Does this mean fetched state.variables stay in
>>> the cache very briefly, but are (almost immediately) invalidated by a cache
>>> coherence mechanism? I can see interrupts and preemption would also cause the
>>> trace output to be suspended for a while.
>>
>> It marks places where a given CPU saw a value momentarily.  As you say,
>> this could be due to cache invalidation, interrupts, preemption, etc.
>>
>>> I'm not sure I have made out what the table means thus far, but am I seeing
>>> something close enough to what you intend the table to represent?
>>
>> The main point is that different CPUs can disagree on the value of a given
>> variable at a given point in time.  The following diagram shows that
>> this disagreement is nevertheless bounded, in that all CPUs must agree
>> on the ordering of values for that variable.
> 
> Yes, of course that's the main point.
> I should have asked in a different way.
> 
> There should be the same kind of situations in Figure 14.5.
> But you didn't depict them in the figure.
> 
> Why did you put the blank cells in the table in the first place?
> 
> I'm a little bit distracted by those blank cells, and began questioning
> about them.
> 
> Isn't it enough to just do the same way in Table 14.2 as in Figure 14.5?
> 
> Or, could the blank cell situation be explained in the form of an answer
> of a quick quiz?  It would be much easier for me to grasp the main point
> of this section "Variables Can Have More Than One Value" while reading the
> body of the text.
> 
> Thoughts?
> 
>                                                    Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
>>
> 

So I drew 2 figures based on Table 14.2.
No, I didn't actually drew them but wrote a rough program to generate .fig
format files from the value changes of each CPU extracted from Table 14.2.
I ignored the blank cells in the table just as in Figure 4.5.
Appended is a tar ball of two files.
out.fig is the overall diagram, and out-2.fig is a zoomed in view of
the beginning part.
I think they can provide a fairly interesting view of what's going on.

Please give a look at them.

                                                    Thanks, Akira

--------------95C2453BBEA86AEA13D57CAD
Content-Type: application/gzip;
 name="fig.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fig.tar.gz"

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
--------------95C2453BBEA86AEA13D57CAD--

