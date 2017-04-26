Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=v81Rcv4/8O7YRfhsNiCWNnHDA4KkgccHwsAgXB+pAT8=;
 b=auSEYekNVhCyqGe3zTc87SMm07uokRKaMuRe+SMqbEnL9NfFJ4VU3R1e8Fk6HXI3kz
 k2/u/OTC+HqI5ZK/8wkoIgXm5L/ysfikFNNA/aVlHugiWgnb/R9ffmtpsCHkzSj04Cnj
 ngQOQ/bxF9E/NCdLW3ePK1haF21fbslyI6RjEtzydBnM22N8kBeasRkxHkxPqZIK/xTt
 rUdmyaZkSiaooT/CmobUpisdtmkewCJ4Ltn14lEN9BhnM7QpB0pO9NTzGvIc80DgrjzW
 OYSVY2JIS/VpD23bOEts9tP0wa297RzNwMvXiNXdR/4G85Kd5VHUbXpXi7DulFkPzcWW
 XqeA==
Subject: Re: Some question about memory model(consistency)
References: <20170425130222.GA21476@master>
 <b95b7fe7-e8c0-465c-d9a2-7d94b15e68ab@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <0cfad406-340d-7c92-095e-f9d2eaa9f167@gmail.com>
Date: Wed, 26 Apr 2017 11:49:33 +0800
MIME-Version: 1.0
In-Reply-To: <b95b7fe7-e8c0-465c-d9a2-7d94b15e68ab@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

On 2017=E5=B9=B404=E6=9C=8825=E6=97=A5 23:19, Akira Yokosawa wrote:
> On 2017/04/25 21:02:22 +0800, Yubin Ruan wrote:
>> Hi,
>> long time no see :)
>
> Hi Yubin,
>
> I'm afraid this is not a direct answer to your question.
> But I'll try.
>
>>
>> This email relates to some confusion about computer system memory mode=
l.
>> Recently I spent sometime reading stuff about momery model and finally=
 I get
>> to the subject of safety properties of concurrent data structure. When
>> discussing concurrent data structures, three important properties are =
proposed:
>>     1. quiescent consistency
>>     2. sequential consistency
>>     3. linearizability
>>
>> But...hmm...I don't fully understand them. sad :(
>> I know there might be someone in this lists to discuss these questions=
 with, so
>> I try to post them here. Any feedback is welcome.
>>
>> Let's start with some simple concepts to make this communication valid=
.
>>
>> 1. what exactly counts as a "Quiescence"?
>> -------
>> I understand the concept of quiescent consistency: An execution of a
>> concurrent program is quiescently consistent if the method calls can b=
e
>> correctly arranged while still retaining the mutual order of calls
>> separated by quiescence, a period of time where no method is being
>> called in any thread
>>
>> Basically it can be illustrated very vividedly by the following figure=
s:
>>
>>     Program order specified:
>>         <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
>>                               ~~~~~~~
>>                           (quiescence point)
>>
>>     Real execution order:
>>         <--A--> <--C--> <--B-->   <--E--> <--D--> <--F-->
>>                               ~~~~~~~
>>                           (quiescence point)
>>
>> The above model is quiescent consistent because there is no execution
>> reordering across the quiescence point. But this one is not:
>>
>>     Program order specified:
>>         <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
>>                               ~~~~~~~
>>                           (quiescence point)
>>
>>     Real execution order:
>>         <--A--> <--B--> <--D-->   <--C--> <--E--> <--F-->
>>                               ~~~~~~~
>>                           (quiescence point)
>>
>> This one is NOT quiescent consistent because the reordering of D and E
>> across the quiescent point.
>>
>> But, in real world program, how can we identify those quiescent points=
?
>> I mean, in a program like this:
>>
>>   1: q.enqueue(something)
>>   2:
>>   3: q.enqueue(something)
>>   4:
>>   5: k.enqueue(something)
>>   6:
>>   7: k.dequeue(something)
>>
>> which is a quiescent point/period? Is it 2 or 4 or 6?
>
> It depends on which set of API you use to enqueue and dequeue.
>
> Have you read through Section 9.5 "Read-Copy Update" in perfbook?
> Especially, Figure 9.19 "RCU QSBR: Waiting for Pre-Existing Readers"
> depicts "quiescent state based reclamation (QSBR)".
>
> Also, Section 9.5.5.9 "RCU Based on Quiescent States" explains its toy
> implementation.
>
> On thing you might be missing here is that a quiescent state is *not*
> necessarily a global state but can be a state local to an object to
> be updated.
>
> Hope this could be a starting point for you.

Thanks for replying.

I think I mix these concepts with real world implementation. From what I
have read so far, these properties are only constraints that may or may
*not* be respected by CPUs and compilers. CPUs/compilers are free to
reorder instructions for optimization reasons, thus violating those
consistency constraints. But in real world implementation, we have
special techniques that we can use to "implement" those consistency
constraints(e.g memory barriers, locks, etc).

Back to the question above, those quiescent point/period can be defined
by ourselves, as long as we can carry out some implementations that
respect the consistency constraints we want.

Hmm...maybe that is the so-called "consequence of knowing too much"...
And I'd better go read more :)

Thanks,
Yubin

>>
>> I am not so a hardware guy and I don't have so much experience with me=
mory
>> model. But I am really interested in these models because I think it
>> provides foundation for concurrent programming and distributed system
>> building, which is what I interested in.
>>
>> Any feedback is welcome :)
>>
>> Thanks
>> Yubin
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>

