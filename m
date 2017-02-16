Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=iOM7wWLf3VY/rk8MNEcDKAH1mam28ZZRU40j9WK+kPo=;
 b=lraOnDChpEVoOu9jtUc2UaktauRyHWzeFwhnLQTAx6+K616ETavgwu2H4piRMWdI3J
 6Jt8WSDdEso3YKmVwzUimmVHS3LHUB25ra5/+z+nu/a8PrPugi9g8iYWSQJjZIyAO4P3
 YrbYCwVtIUcEKPD+YjtzOCVrorVwVYyVYYXU7uQ8VGMBM2jSvpiHWr7kpm8cdfEnsTbu
 mErqe8PUP8Pk3YBSgp+/a0LFJiiMdyfxo6PZri1Emv+U+xO7m5qTOS4AAP9F1lbztwUR
 aCyf+EfPtPGu90x8bAQcsfsmh1DwRdQEI3Dd6cDUXSnV7LNXx/q0DyiMpKfKGJ2cFnkZ
 gDmg==
Subject: Re: [Question] Quick Quiz B.13 help
References: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
 <20170213190034.GI30506@linux.vnet.ibm.com>
 <1c7f03c4-3c73-4e89-50a6-ad2242e57a41@gmail.com>
 <5f483446-30e0-fb3c-5814-f191e379c5e6@gmail.com>
 <20170216191308.GK30506@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fb76c9db-ac69-15da-f358-3416e5cee75a@gmail.com>
Date: Fri, 17 Feb 2017 07:47:05 +0900
MIME-Version: 1.0
In-Reply-To: <20170216191308.GK30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/02/16 11:13:08 -0800, Paul E. McKenney wrote:
> On Wed, Feb 15, 2017 at 12:36:52AM +0900, Akira Yokosawa wrote:
>> On 2017/02/14 18:53:52 +0800, Yubin Ruan wrote:
>>> On 2017/2/14 3:00, Paul E. McKenney wrote:
>>>> On Mon, Feb 13, 2017 at 09:41:46PM +0800, Yubin Ruan wrote:
>>>>> Quick quiz B.13:
>>>>>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
>>>>> interrupt handler, and that the CPU 2's line 9 is running at process
>>>>> level. What changes, if any, are required to enable the code to work
>>>>> correctly, in other words, to prevent the assertion from firing?
>>>>>
>>>>> I can not come up with any practical material for this quiz, because
>>>>> I don't really know the implication of "in an interrupt handler",
>>>>> and "running in process level".
>>>>>
>>>>> The answer hints that one would need to ensure that the load of "e"
>>>>> precedes that of "a" and hint the Linux kernel implementation
>>>>> "barrier()". But how is that exactly? I am going to invest some time
>>>>> into the Linux kernel implementation. But I would really appreciate
>>>>> some hints about this, as I don't have so much kernel development
>>>>> experience before.
>>>>
>>>> I suggest reading an operating-system textbook.  The ones I have are quite
>>>> old, but here they are anyway in bibtex format.  There are probably newer
>>>> editions of some of them.  The short answer on interrupts is that they
>>>> force process-level processing to pause while the "interrupt handler"
>>>                                           ~~~~~
>>>                                           until ?
>>>> completes.
>>>>
>>>>                             Thanx, Paul
>>>>
>>>
>>> Actually I have taken a operating system course and know about interrupt handler. Maybe I don't understand the concepts well. I don't really get your point here. If you have time, maybe you can provide me more information, otherwise I would just have to investigate more on this myself. Thanks.
>>
>> Hi Paul,
>>
>> Prompted by Yubin's question, I looked into the Quick Quiz.
>> And I have a theory what you wanted to say.
>>
>> First of all, the "assert()" has a line number of 9, but the execution
>> order of lines 3-5 and the assertion on CPU 2 does not matter in
>> Table B.4, doesn't it?
>>
>> Your point here looks like that lines 3-5 for CPU 2 can interrupt
>> the assert().
> 
> Yes.
> 
>> If this is the case, whether lines 3-5 for CPU 1 are in an interrupt
>> handler or not does not matter, I suppose.
> 
> True, up to a point.  If CPU 1's lines 3-5 are in an interrupt handler,
> then the assert()'s condition only needs a compiler directive such
> as barrier() to keep things straight.  If these are separate CPUs,
> then real memory barriers are required.
> 
>> And the first sentence of Answer of the Quick Quiz should read:
>>
>>     The assertion will need to be written so that the load of ``e''
>>     is assured to precede that of ``a''.
> 
> This doesn't change the meaning, but I take it that it is easier to
> read.  But how about the following?
> 
> 	The assertion must ensure that the load of ``e'' precedes that of
> 	``a''.
> 
>> The second sentence mentions the barrier() primitive. It is effective
>> because interrupts should see the sequence of instructions in order
>> even if they are executed out-of-order. 
>>
>> Am I missing something?
> 
> And I should also call out that in the context of the quick quiz,
> there is only one CPU.  How about the following?

Hmm, I thought there were still three CPUs involved in the quick quiz...
If all the code runs on the same CPU, we don't need memory barriers,
do we?

I thought what matter is (as said in the previous mail) lines 3-5 of
CPU 2 can interrupt the assertion. Codes in columns 1 and 2 can still
run on CPU 0 and 1 respectively.

> 
> 	Quick Quiz B.13:
> 	Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
> 	interrupt handler, and that the CPU 2’s line 9 runs at process
> 	level. In other words, the code in all three columns of the
> 	table runs on the same CPU, but the first two columns run in an
> 	interrupt handler, and the third column runs at process level,
> 	so that the code in third column can be interrupted by the code
> 	in the first two columns. What changes, if any, are required to
> 	enable the code to work correctly, in other words, to prevent
> 	the assertion from firing?
> 
> 	Answer:
> 	The assertion must ensure that the load of “e” precedes that
> 	of “a”. In the Linux kernel, the barrier() primitive may be
> 	used to accomplish this in much the same way that the memory
> 	barrier was used in the assertions in the previous examples,
> 	for example, as follows:
> 
> 		while (b == 0) ;
> 		smp_mb();
> 		d = 1;
> 		r1 = e;
> 		barrier();
> 		assert(r1 == 0 || a == 1);
> 
> 	No changes are needed to the code in the first two columns,
> 	because interrupt handlers run atomically from the perspective
> 	of the interrupted code.
>

Here is my version of the quiz and answer:

	Quick Quiz B.13:
	Suppose that lines 3-5 for CPU 2 in Table B.4 are in an
	interrupt handler, and that the CPU 2’s line 9 runs at process
	level. In other words, lines 3-5 for CPU 2 can interrupt the
	assertion of line 9. What changes, if any, are required to
	enable the code to work correctly, in other words, to prevent
	the assertion from firing?

	Answer:
	The assertion must ensure that the load of “e” precedes that
	of “a”. In the Linux kernel, the barrier() primitive may be
	used to accomplish this in much the same way that the memory
	barrier was used in the previous examples, for example,
	the assertion can be modified as follows:

		r1 = e;
		barrier();
		assert(r1 == 0 || a == 1);

Thoughts?

                                              Thanks, Akira

> 							Thanx, Paul
> 
>>
>>>
>>> regards,
>>> Yubin Ruan
>>>
>>>> ------------------------------------------------------------------------
>>>>
>>>> @book{CorbetRubiniKroahHartman
>>>> ,author="Jonathan Corbet and Alessandro Rubini and Greg Kroah-Hartman"
>>>> ,title="Linux Device Drivers"
>>>> ,publisher="O'Reilly Media, Inc."
>>>> ,year="2005"
>>>> ,edition="Third"
>>>> }
>>>>
>>>> @book{Silberschatz98a
>>>> ,author="Abraham Silberschatz and Peter Baer Galvin"
>>>> ,title="Operating System Concepts"
>>>> ,publisher="Addison-Wesley"
>>>> ,year="1998"
>>>> ,edition="Fifth"
>>>> }
>>>>
>>>> @book{Vahalia96
>>>> ,author="Uresh Vahalia"
>>>> ,title="{UNIX} Internals: The New Frontiers"
>>>> ,publisher="Prentice Hall"
>>>> ,year="1996"
>>>> }
>>>>
>>>
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
> 
> 

