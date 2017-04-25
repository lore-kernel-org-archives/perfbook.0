Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6SKVlxZnU3QRgHre7ACeLJmVQu8CHxeW5OEA0LGFAPo=;
 b=fYJyTBAMLBnTDhucg6s030RmsCdluqekp9yvueetcQki7XUz38nq2pUrf6uM0FFsSa
 pRZ+gSlS4ybA2hl2VKZv69NriqirxUdZG0cN+Hr2CQt/BtkZRyPsj/rzhtMdqBhnS4bN
 pfqa4S8b0yzt6Jn3tiAt+FsaXviJA1nlY9Y2+O9Ahe4h7Ml6n1hqT/tn4gTYuX8rF0sR
 pnb9jQWyAc6xmdjCiLlS/oqSDcL0cQxaMIivIwYxAEc+BjLNcyKW8lju42gL7uZG2tq6
 Tw6bZh61BnfQLmZWYu+4gWGsBJWXWDupn+yQJfiYLfVilTyZ94hZWFKc0/4FSP9dVdB7
 Pb2Q==
Subject: Re: Some question about memory model(consistency)
References: <20170425130222.GA21476@master>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b95b7fe7-e8c0-465c-d9a2-7d94b15e68ab@gmail.com>
Date: Wed, 26 Apr 2017 00:19:24 +0900
MIME-Version: 1.0
In-Reply-To: <20170425130222.GA21476@master>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/04/25 21:02:22 +0800, Yubin Ruan wrote:
> Hi,
> long time no see :)

Hi Yubin,

I'm afraid this is not a direct answer to your question.
But I'll try.

> 
> This email relates to some confusion about computer system memory model.
> Recently I spent sometime reading stuff about momery model and finally I get
> to the subject of safety properties of concurrent data structure. When
> discussing concurrent data structures, three important properties are proposed:
>     1. quiescent consistency
>     2. sequential consistency
>     3. linearizability
> 
> But...hmm...I don't fully understand them. sad :(
> I know there might be someone in this lists to discuss these questions with, so
> I try to post them here. Any feedback is welcome.
> 
> Let's start with some simple concepts to make this communication valid.
> 
> 1. what exactly counts as a "Quiescence"?
> -------
> I understand the concept of quiescent consistency: An execution of a
> concurrent program is quiescently consistent if the method calls can be
> correctly arranged while still retaining the mutual order of calls
> separated by quiescence, a period of time where no method is being
> called in any thread
> 
> Basically it can be illustrated very vividedly by the following figures:
> 
>     Program order specified:
>         <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
>                               ~~~~~~~
>                           (quiescence point)
> 
>     Real execution order:
>         <--A--> <--C--> <--B-->   <--E--> <--D--> <--F-->
>                               ~~~~~~~
>                           (quiescence point)
> 
> The above model is quiescent consistent because there is no execution
> reordering across the quiescence point. But this one is not:
> 
>     Program order specified:
>         <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
>                               ~~~~~~~
>                           (quiescence point)
> 
>     Real execution order:
>         <--A--> <--B--> <--D-->   <--C--> <--E--> <--F-->
>                               ~~~~~~~
>                           (quiescence point)
> 
> This one is NOT quiescent consistent because the reordering of D and E
> across the quiescent point.
> 
> But, in real world program, how can we identify those quiescent points?
> I mean, in a program like this:
> 
>   1: q.enqueue(something)
>   2:
>   3: q.enqueue(something)
>   4:
>   5: k.enqueue(something)
>   6:
>   7: k.dequeue(something)
> 
> which is a quiescent point/period? Is it 2 or 4 or 6?

It depends on which set of API you use to enqueue and dequeue.

Have you read through Section 9.5 "Read-Copy Update" in perfbook?
Especially, Figure 9.19 "RCU QSBR: Waiting for Pre-Existing Readers"
depicts "quiescent state based reclamation (QSBR)".

Also, Section 9.5.5.9 "RCU Based on Quiescent States" explains its toy
implementation.

On thing you might be missing here is that a quiescent state is *not*
necessarily a global state but can be a state local to an object to
be updated.

Hope this could be a starting point for you.

                         Regards, Akira

> 
> I am not so a hardware guy and I don't have so much experience with memory
> model. But I am really interested in these models because I think it
> provides foundation for concurrent programming and distributed system
> building, which is what I interested in.
> 
> Any feedback is welcome :)
> 
> Thanks
> Yubin
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

