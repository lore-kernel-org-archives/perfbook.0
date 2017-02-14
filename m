Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=P+KcB+iJJ8/09j2sws6d/sCbGPbZ0aWFnaLcTAUHeIk=;
 b=cGb146Nc/z3M2ZTXNewtDvUoSnfde5O1l7P4ABxzLWGxxFwWaijSETsjUDLCMgKO2z
 +s4jYmTbvvOcZzSPKFl6muI0vqydwBup8/alEprIoJnS1mWOPSfjKh/rx1Np8HzEUHBk
 LM291p3y7GCdOlU0lxAZF/+BwxHP875MFXxYQKF6Kr2DxkXv0Fi+t1alC+iN/yCq26sM
 8r/Im1OFCay7TKJRDrHEd7PoWtK9OsuQzNwtTQYcC46FaLGvc9M+Z7eUcS1zCUcbB0Jo
 8aWRsgJDwvV1xjHtXEc7xjhmxlb7/IFVpPHaKFiqSMGW/tblNEHgpNlpPJl5WxSS5f5z
 LAqQ==
Subject: Re: [Question] Quick Quiz B.13 help
References: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
 <20170213190034.GI30506@linux.vnet.ibm.com>
 <1c7f03c4-3c73-4e89-50a6-ad2242e57a41@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5f483446-30e0-fb3c-5814-f191e379c5e6@gmail.com>
Date: Wed, 15 Feb 2017 00:36:52 +0900
MIME-Version: 1.0
In-Reply-To: <1c7f03c4-3c73-4e89-50a6-ad2242e57a41@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/02/14 18:53:52 +0800, Yubin Ruan wrote:
> On 2017/2/14 3:00, Paul E. McKenney wrote:
>> On Mon, Feb 13, 2017 at 09:41:46PM +0800, Yubin Ruan wrote:
>>> Quick quiz B.13:
>>>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
>>> interrupt handler, and that the CPU 2's line 9 is running at process
>>> level. What changes, if any, are required to enable the code to work
>>> correctly, in other words, to prevent the assertion from firing?
>>>
>>> I can not come up with any practical material for this quiz, because
>>> I don't really know the implication of "in an interrupt handler",
>>> and "running in process level".
>>>
>>> The answer hints that one would need to ensure that the load of "e"
>>> precedes that of "a" and hint the Linux kernel implementation
>>> "barrier()". But how is that exactly? I am going to invest some time
>>> into the Linux kernel implementation. But I would really appreciate
>>> some hints about this, as I don't have so much kernel development
>>> experience before.
>>
>> I suggest reading an operating-system textbook.  The ones I have are quite
>> old, but here they are anyway in bibtex format.  There are probably newer
>> editions of some of them.  The short answer on interrupts is that they
>> force process-level processing to pause while the "interrupt handler"
>                                           ~~~~~
>                                           until ?
>> completes.
>>
>>                             Thanx, Paul
>>
> 
> Actually I have taken a operating system course and know about interrupt handler. Maybe I don't understand the concepts well. I don't really get your point here. If you have time, maybe you can provide me more information, otherwise I would just have to investigate more on this myself. Thanks.

Hi Paul,

Prompted by Yubin's question, I looked into the Quick Quiz.
And I have a theory what you wanted to say.

First of all, the "assert()" has a line number of 9, but the execution
order of lines 3-5 and the assertion on CPU 2 does not matter in
Table B.4, doesn't it?

Your point here looks like that lines 3-5 for CPU 2 can interrupt
the assert().

If this is the case, whether lines 3-5 for CPU 1 are in an interrupt
handler or not does not matter, I suppose.

And the first sentence of Answer of the Quick Quiz should read:

    The assertion will need to be written so that the load of ``e''
    is assured to precede that of ``a''.

The second sentence mentions the barrier() primitive. It is effective
because interrupts should see the sequence of instructions in order
even if they are executed out-of-order. 

Am I missing something?
                                          Thanks, Akira

> 
> regards,
> Yubin Ruan
> 
>> ------------------------------------------------------------------------
>>
>> @book{CorbetRubiniKroahHartman
>> ,author="Jonathan Corbet and Alessandro Rubini and Greg Kroah-Hartman"
>> ,title="Linux Device Drivers"
>> ,publisher="O'Reilly Media, Inc."
>> ,year="2005"
>> ,edition="Third"
>> }
>>
>> @book{Silberschatz98a
>> ,author="Abraham Silberschatz and Peter Baer Galvin"
>> ,title="Operating System Concepts"
>> ,publisher="Addison-Wesley"
>> ,year="1998"
>> ,edition="Fifth"
>> }
>>
>> @book{Vahalia96
>> ,author="Uresh Vahalia"
>> ,title="{UNIX} Internals: The New Frontiers"
>> ,publisher="Prentice Hall"
>> ,year="1996"
>> }
>>
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

