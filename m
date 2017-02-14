Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:references:to:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=E54GKOFf7Z+tJJBuaA6Zic1b9QRBIxxEYDCe/VgTp9I=;
 b=SrB/+KK2kzPuVC73xrFoinuq16h3Scu6FYcOuMgeWhqeuDde5Uub25owjTiwCYbdPx
 Mdq2xFxc55qX9KtPbp2SLhBLp09e/JjkIOojfVWtcj17Z5ucbOXGUdDHX01jGLSeB0wG
 k/Xb6G6dEcHSwtsLJsM1clfkFqp/JDXG/od98nurlB9IaRwjNQIT/DKukNWJaG+lyQeC
 Gd0vIZCNhUHEadU/pJT3dqOnpd9LK9uBJq9FgSX1GxgaqQu0uZx2KjqmC21kzynfhlJZ
 yAGF3pNEUjXihr/SMFvZoKJWkvrfAvTpqtNgJRPaBndbf1swINHrUMvr4dBpCrKtR9H7
 6MGw==
Subject: Re: [Question] Quick Quiz B.13 help
References: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
 <20170213190034.GI30506@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <1c7f03c4-3c73-4e89-50a6-ad2242e57a41@gmail.com>
Date: Tue, 14 Feb 2017 18:53:52 +0800
MIME-Version: 1.0
In-Reply-To: <20170213190034.GI30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/2/14 3:00, Paul E. McKenney wrote:
> On Mon, Feb 13, 2017 at 09:41:46PM +0800, Yubin Ruan wrote:
>> Quick quiz B.13:
>>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
>> interrupt handler, and that the CPU 2's line 9 is running at process
>> level. What changes, if any, are required to enable the code to work
>> correctly, in other words, to prevent the assertion from firing?
>>
>> I can not come up with any practical material for this quiz, because
>> I don't really know the implication of "in an interrupt handler",
>> and "running in process level".
>>
>> The answer hints that one would need to ensure that the load of "e"
>> precedes that of "a" and hint the Linux kernel implementation
>> "barrier()". But how is that exactly? I am going to invest some time
>> into the Linux kernel implementation. But I would really appreciate
>> some hints about this, as I don't have so much kernel development
>> experience before.
>
> I suggest reading an operating-system textbook.  The ones I have are quite
> old, but here they are anyway in bibtex format.  There are probably newer
> editions of some of them.  The short answer on interrupts is that they
> force process-level processing to pause while the "interrupt handler"
                                           ~~~~~
                                           until ?
> completes.
>
> 							Thanx, Paul
>

Actually I have taken a operating system course and know about interrupt 
handler. Maybe I don't understand the concepts well. I don't really get 
your point here. If you have time, maybe you can provide me more 
information, otherwise I would just have to investigate more on this 
myself. Thanks.

regards,
Yubin Ruan

> ------------------------------------------------------------------------
>
> @book{CorbetRubiniKroahHartman
> ,author="Jonathan Corbet and Alessandro Rubini and Greg Kroah-Hartman"
> ,title="Linux Device Drivers"
> ,publisher="O'Reilly Media, Inc."
> ,year="2005"
> ,edition="Third"
> }
>
> @book{Silberschatz98a
> ,author="Abraham Silberschatz and Peter Baer Galvin"
> ,title="Operating System Concepts"
> ,publisher="Addison-Wesley"
> ,year="1998"
> ,edition="Fifth"
> }
>
> @book{Vahalia96
> ,author="Uresh Vahalia"
> ,title="{UNIX} Internals: The New Frontiers"
> ,publisher="Prentice Hall"
> ,year="1996"
> }
>

