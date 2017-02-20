Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=rOqp9h/jfQd008R2jIjB+X1CeG04nWgRD1dSdISuMvw=;
 b=hxdAf8wnbLDCM5bfoo0LNh+oa18NPU4maEURnzxgt7WA+vZFOTha4vXJtimjNbXayV
 aRgjJ5uGDsuC8fh6vy+4wpFGyM9XBII9mPSA5ZBE4azKuOLMzH86GPfUxfCBJukuUBeq
 A4gLB6obx/EhOMFfQhtTvOEU2Mh5Ltjaw7+bQA5DlBfy45pFJ3recuRqMw52FkzI6hrA
 AKSZMMB6zf1Cl7vzR92GXL9pbUQkXGjCSoEYcumWU8bhA0DEgPSdz9em8bsVHKnkWQAF
 QwagUWZsTh6WfaaU80OQjv8C7DXHF/+VzzvNYPS3eGIWGcCULysjYOQARIdlshOShYTW
 gwZA==
Subject: Re: [Question] Quick Quiz B.13 help
References: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
 <20170213190034.GI30506@linux.vnet.ibm.com>
 <1c7f03c4-3c73-4e89-50a6-ad2242e57a41@gmail.com>
 <5f483446-30e0-fb3c-5814-f191e379c5e6@gmail.com>
 <20170216191308.GK30506@linux.vnet.ibm.com>
 <fb76c9db-ac69-15da-f358-3416e5cee75a@gmail.com>
 <20170219222206.GM30506@linux.vnet.ibm.com>
 <04001052-3d90-867d-a3eb-2a8b41d0d8f7@gmail.com>
 <20170220005131.GN30506@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dccf305b-feab-aaee-c5d3-018939a0bfdc@gmail.com>
Date: Mon, 20 Feb 2017 10:56:57 +0900
MIME-Version: 1.0
In-Reply-To: <20170220005131.GN30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/02/19 16:51:31 -0800, Paul E. McKenney wrote:
> On Mon, Feb 20, 2017 at 08:47:46AM +0900, Akira Yokosawa wrote:
>> On 2017/02/19 14:22:06 -0800, Paul E. McKenney wrote:
>>> On Fri, Feb 17, 2017 at 07:47:05AM +0900, Akira Yokosawa wrote:
>>>> On 2017/02/16 11:13:08 -0800, Paul E. McKenney wrote:
>>>>> On Wed, Feb 15, 2017 at 12:36:52AM +0900, Akira Yokosawa wrote:
>>>>>> On 2017/02/14 18:53:52 +0800, Yubin Ruan wrote:
>>>>>>> On 2017/2/14 3:00, Paul E. McKenney wrote:
>>>>>>>> On Mon, Feb 13, 2017 at 09:41:46PM +0800, Yubin Ruan wrote:
>>>>>>>>> Quick quiz B.13:
>>>>>>>>>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
>>>>>>>>> interrupt handler, and that the CPU 2's line 9 is running at process
>>>>>>>>> level. What changes, if any, are required to enable the code to work
>>>>>>>>> correctly, in other words, to prevent the assertion from firing?
>>>>>>>>>
>>>>>>>>> I can not come up with any practical material for this quiz, because
>>>>>>>>> I don't really know the implication of "in an interrupt handler",
>>>>>>>>> and "running in process level".
>>>>>>>>>
>>>>>>>>> The answer hints that one would need to ensure that the load of "e"
>>>>>>>>> precedes that of "a" and hint the Linux kernel implementation
>>>>>>>>> "barrier()". But how is that exactly? I am going to invest some time
>>>>>>>>> into the Linux kernel implementation. But I would really appreciate
>>>>>>>>> some hints about this, as I don't have so much kernel development
>>>>>>>>> experience before.
>>>>>>>>
>>>>>>>> I suggest reading an operating-system textbook.  The ones I have are quite
>>>>>>>> old, but here they are anyway in bibtex format.  There are probably newer
>>>>>>>> editions of some of them.  The short answer on interrupts is that they
>>>>>>>> force process-level processing to pause while the "interrupt handler"
>>>>>>>                                           ~~~~~
>>>>>>>                                           until ?
>>>>>>>> completes.
>>>>>>>>
>>>>>>>>                             Thanx, Paul
>>>>>>>>
>>>>>>>
>>>>>>> Actually I have taken a operating system course and know about interrupt handler. Maybe I don't understand the concepts well. I don't really get your point here. If you have time, maybe you can provide me more information, otherwise I would just have to investigate more on this myself. Thanks.
>>>>>>
>>>>>> Hi Paul,
>>>>>>
>>>>>> Prompted by Yubin's question, I looked into the Quick Quiz.
>>>>>> And I have a theory what you wanted to say.
>>>>>>
>>>>>> First of all, the "assert()" has a line number of 9, but the execution
>>>>>> order of lines 3-5 and the assertion on CPU 2 does not matter in
>>>>>> Table B.4, doesn't it?
>>>>>>
>>>>>> Your point here looks like that lines 3-5 for CPU 2 can interrupt
>>>>>> the assert().
>>>>>
>>>>> Yes.
>>>>>
>>>>>> If this is the case, whether lines 3-5 for CPU 1 are in an interrupt
>>>>>> handler or not does not matter, I suppose.
>>>>>
>>>>> True, up to a point.  If CPU 1's lines 3-5 are in an interrupt handler,
>>>>> then the assert()'s condition only needs a compiler directive such
>>>>> as barrier() to keep things straight.  If these are separate CPUs,
>>>>> then real memory barriers are required.
>>>>>
>>>>>> And the first sentence of Answer of the Quick Quiz should read:
>>>>>>
>>>>>>     The assertion will need to be written so that the load of ``e''
>>>>>>     is assured to precede that of ``a''.
>>>>>
>>>>> This doesn't change the meaning, but I take it that it is easier to
>>>>> read.  But how about the following?
>>>>>
>>>>> 	The assertion must ensure that the load of ``e'' precedes that of
>>>>> 	``a''.
>>>>>
>>>>>> The second sentence mentions the barrier() primitive. It is effective
>>>>>> because interrupts should see the sequence of instructions in order
>>>>>> even if they are executed out-of-order. 
>>>>>>
>>>>>> Am I missing something?
>>>>>
>>>>> And I should also call out that in the context of the quick quiz,
>>>>> there is only one CPU.  How about the following?
>>>>
>>>> Hmm, I thought there were still three CPUs involved in the quick quiz...
>>>> If all the code runs on the same CPU, we don't need memory barriers,
>>>> do we?
>>>>
>>>> I thought what matter is (as said in the previous mail) lines 3-5 of
>>>> CPU 2 can interrupt the assertion. Codes in columns 1 and 2 can still
>>>> run on CPU 0 and 1 respectively.
>>>>
>>>>>
>>>>> 	Quick Quiz B.13:
>>>>> 	Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
>>>>> 	interrupt handler, and that the CPU 2’s line 9 runs at process
>>>>> 	level. In other words, the code in all three columns of the
>>>>> 	table runs on the same CPU, but the first two columns run in an
>>>>> 	interrupt handler, and the third column runs at process level,
>>>>> 	so that the code in third column can be interrupted by the code
>>>>> 	in the first two columns. What changes, if any, are required to
>>>>> 	enable the code to work correctly, in other words, to prevent
>>>>> 	the assertion from firing?
>>>>>
>>>>> 	Answer:
>>>>> 	The assertion must ensure that the load of “e” precedes that
>>>>> 	of “a”. In the Linux kernel, the barrier() primitive may be
>>>>> 	used to accomplish this in much the same way that the memory
>>>>> 	barrier was used in the assertions in the previous examples,
>>>>> 	for example, as follows:
>>>>>
>>>>> 		while (b == 0) ;
>>>>> 		smp_mb();
>>>>> 		d = 1;
>>>>> 		r1 = e;
>>>>> 		barrier();
>>>>> 		assert(r1 == 0 || a == 1);
>>>>>
>>>>> 	No changes are needed to the code in the first two columns,
>>>>> 	because interrupt handlers run atomically from the perspective
>>>>> 	of the interrupted code.
>>>>>
>>>>
>>>> Here is my version of the quiz and answer:
>>>>
>>>> 	Quick Quiz B.13:
>>>> 	Suppose that lines 3-5 for CPU 2 in Table B.4 are in an
>>>> 	interrupt handler, and that the CPU 2’s line 9 runs at process
>>>> 	level. In other words, lines 3-5 for CPU 2 can interrupt the
>>>> 	assertion of line 9. What changes, if any, are required to
>>>> 	enable the code to work correctly, in other words, to prevent
>>>> 	the assertion from firing?
>>>
>>> Given the discussion earlier in this thread, I believe that we do need
>>> to explicitly state that all of the code is running on a single CPU.
>>
>> Well, I'm afraid I still can't see your point.
>> Maybe I'm missing something important.
>> Let me ask a few questions regarding your version of the Quiz
>>
>>>>> 	Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
>>>>> 	interrupt handler, and that the CPU 2’s line 9 runs at process
>>>>> 	level.
>>
>> In this part, you are saying lines 3-5 for CPUs 1 and 2 are in an
>> interrupt handler.
>>
>>>>>             In other words, the code in all three columns of the
>>>>> 	table runs on the same CPU, but the first two columns run in an
>>>>> 	interrupt handler, and the third column runs at process level,
>>
>> In this part, you are saying code for CPUs 0 and 1 runs in an interrupt
>> handler, and lines 3-5 for CPU 2 as well as the assertion runs at process
>> level.
> 
> The code in the CPUs 0 and 1 columns of the table not only runs in an
> interrupt handler, it also runs on CPU 2.
>

So, you mean something like the following? (the Quick Quiz is getting longer...)

	Quick Quiz B.13:
	Suppose that code for CPUs 0 and 1 and lines 3-5 for CPU 2 in 
	Table B.4 are also in interrupt handlers and can be executed
	on CPU 2, and all the code in the Table still runs at process
	level on respective CPUs.
	In other words, the code in all three columns of the table can
	run on the same CPU (CPU 2). In this case the code in the third
	column can be interrupted by the code in the first two columns
	and lines 3-5 for CPU 2.
	What changes, if any, are required to enable the code to work
	correctly, in other words, to prevent the assertion from firing?

Looks somewhat redundant, but wordsmith can wait.
I used plural form of "interrupt handlers" because if all of them are in
a single interrupt handler, their execution order in the handler is
defined by the instruction order in the handler, and possible variation
of ordering is reduced.

And it should be regarded as a bad design pattern to use four polling
loops within an interrupt handler...

I might still be seeing some different picture from yours.

>> I'm confused...
>>
>> And again, I want to know what I said previously is correct or not:
>>
>>>> If all the code runs on the same CPU, we don't need memory barriers,
>>>> do we?
> 
> No memory-barrier instructions, correct, give or take Itanium and
> SPARC RMO.  Compiler directives (such as barrier() from the Linux
> kernel) are still needed.

So, Itanium and SPARC RMO does require memory-barriers in such a case. Whew.

Anyway, I get that three CPUs are still involved in this Quick Quiz
and we need memory barriers.

                                  Thanks, Akira

> 
>> Am I missing something?
>>
>> BTW, it seems you have not pushed your update.
> 
> You are right!  I just now pushed it.
> 
> 							Thanx, Paul
> 
>>                                     Thanks, Akira
>>
>>>
>>>> 	Answer:
>>>> 	The assertion must ensure that the load of “e” precedes that
>>>> 	of “a”. In the Linux kernel, the barrier() primitive may be
>>>> 	used to accomplish this in much the same way that the memory
>>>> 	barrier was used in the previous examples, for example,
>>>> 	the assertion can be modified as follows:
>>>>
>>>> 		r1 = e;
>>>> 		barrier();
>>>> 		assert(r1 == 0 || a == 1);
>>>
>>> I did do something very much like this with your Reported-by:
>>>
>>> 	Answer:
>>> 	The assertion must ensure that the load of “e” precedes that
>>> 	of “a”. In the Linux kernel, the barrier() primitive may
>>> 	be used to accomplish this in much the same way that the memory
>>> 	barrier was used in the assertions in the previous examples. For
>>> 	example, the assertion can be modified as follows:
>>>
>>> 		r1 = e;
>>> 		barrier();
>>> 		assert(r1 == 0 || a == 1);
>>>
>>> 	No changes are needed to the code in the first two columns,
>>> 	because interrupt handlers run atomically from the perspective
>>> 	of the interrupted code.
>>>
>>> 							Thanx, Paul
>>>
>>>> Thoughts?
>>>>
>>>>                                               Thanks, Akira
>>>>
>>>>> 							Thanx, Paul
>>>>>
>>>>>>
>>>>>>>
>>>>>>> regards,
>>>>>>> Yubin Ruan
>>>>>>>
>>>>>>>> ------------------------------------------------------------------------
>>>>>>>>
>>>>>>>> @book{CorbetRubiniKroahHartman
>>>>>>>> ,author="Jonathan Corbet and Alessandro Rubini and Greg Kroah-Hartman"
>>>>>>>> ,title="Linux Device Drivers"
>>>>>>>> ,publisher="O'Reilly Media, Inc."
>>>>>>>> ,year="2005"
>>>>>>>> ,edition="Third"
>>>>>>>> }
>>>>>>>>
>>>>>>>> @book{Silberschatz98a
>>>>>>>> ,author="Abraham Silberschatz and Peter Baer Galvin"
>>>>>>>> ,title="Operating System Concepts"
>>>>>>>> ,publisher="Addison-Wesley"
>>>>>>>> ,year="1998"
>>>>>>>> ,edition="Fifth"
>>>>>>>> }
>>>>>>>>
>>>>>>>> @book{Vahalia96
>>>>>>>> ,author="Uresh Vahalia"
>>>>>>>> ,title="{UNIX} Internals: The New Frontiers"
>>>>>>>> ,publisher="Prentice Hall"
>>>>>>>> ,year="1996"
>>>>>>>> }
>>>>>>>>
>>>>>>>
>>>>>>> -- 
>>>>>>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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

