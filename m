Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VfNLFhyAE3FSr7XoS0dCX6zIxMTDOEKJH+lR8CP6Aq0=;
 b=NhHxpf0oCEZgK3q0VUJtmjJpTgiXxN3Y7e0zGY4swOxPwLBDxzGXXBTJgYAzlCC8La
 WvhBcWjYNcTxN4c+iAMI8pLkwF3a4okTJfpo1QOtHYk4FxCAjsPmXqCu2WawKp21f7Sa
 n3WoSM2ORGIFUBVBghPP8909S0UrTc1Pn8LrGt67Sjw4Pp4ikCzDOiRoMT2jfECkbOZP
 DHpqoo3+uxE1cHjVd4ERHjMFXomiSUAe8E/5eNNLaCLMJN3l4CJzVYJF5tqrDdyMXRVr
 VhRV6XcfB+Mp5daKJwhJb9en9eQXFptx81m+DoKBIYgwx+z1RkZKS/XvsZbrR/dFZZpE
 +6nQ==
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
 <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
 <20170705154024.GU2393@linux.vnet.ibm.com>
 <20170705155004.GB29379@linux.vnet.ibm.com>
 <20170705173249.GA22308@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <81458845-cd7c-1cf0-cb45-d346846d14d7@gmail.com>
Date: Thu, 6 Jul 2017 07:15:24 +0900
MIME-Version: 1.0
In-Reply-To: <20170705173249.GA22308@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/05 10:32:49 -0700, Paul E. McKenney wrote:
> On Wed, Jul 05, 2017 at 08:50:04AM -0700, Paul E. McKenney wrote:
>> On Wed, Jul 05, 2017 at 08:40:24AM -0700, Paul E. McKenney wrote:
>>> On Wed, Jul 05, 2017 at 11:22:52PM +0900, Akira Yokosawa wrote:
>>>> On 2017/07/04 15:21:38 -0700, Paul E. McKenney wrote:
>>>>> On Wed, Jul 05, 2017 at 12:23:09AM +0900, Akira Yokosawa wrote:
>>>>>> >From 2845eb208a6e63493997de47293a47ef774a9d49 Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Tue, 4 Jul 2017 23:18:30 +0900
>>>>>> Subject: [PATCH] advsync: Fix store-buffering sequence table
>>>>>>
>>>>>> Row 6 of the table added in commit 2d5bf8d25a71 ("advsync: Add
>>>>>> memory-barriered store-buffering example") needs some context
>>>>>> adjustment.
>>>>>>
>>>>>> Also tweak horizontal spacing of wide tables for one-column layout.
>>>>>> Also add a few words to the footnote giving definition of
>>>>>> __atomic_thread_fence().
>>>>>>
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>
>>>>> Good catches!  Queued and pushed.  I reworded the footnote a bit, so
>>>>> please let me know if I overdid it.
>>>>
>>>> After your changes in commit 036372ac2573 ("advsync: Use gcc's C11-like
>>>> intrinsics to avoid data races"), this footnote seems verbose, doesn't it?
>>>>
>>>> But, I'm not so much a fan of the changes of your commit.
>>>> It becomes hard to see the relation of lines in litmus tests and rows
>>>> in the tables. Also, those intrinsics have fairly large overheads.
>>>
>>> They certainly are ugly, no two ways about that!  ;-)
>>>
>>>> How about using "volatile" in thread arg declaration such as the following?
>>>>
>>>> ---
>>>> C C-SB+o-o+o-o
>>>> {
>>>> }
>>>>
>>>> P0(volatile int *x0, volatile int *x1)
>>>> {
>>>> 	int r2;
>>>>
>>>> 	*x0 = 2;
>>>> 	r2 = *x1;
>>>> }
>>>>
>>>>
>>>> P1(volatile int *x0, volatile int *x1)
>>>> {
>>>> 	int r2;
>>>>
>>>> 	*x1 = 2;
>>>> 	r2 = *x0;
>>>> }
>>>>
>>>> exists (1:r2=0 /\ 0:r2=0)
>>>> ---
>>>>
>>>> If all you need is to prevent memory accesses from being optimized away,
>>>> they should suffice. But they might be unpopular among kernel community.
>>>
>>> To say nothing of their unpopularity among the C11 and C++11
>>> communities!

Ah, I kind of anticipated it...

>>>
>>>> I checked the generated C code in cross-compiling mode of litmus7, and
>>>> the volatile-ness is reflected there.
>>>
>>> And it also works just fine without the volatile -- the litmus7 tool
>>> does the translation so as to avoid destructive compiler optimizations.
>>>
>>> I am checking with the litmus7 people to see if there is any way to
>>> map identifiers.  Some of the other tools support a "-macros"
>>> command-line argument, which would allow mapping from "smp_mb()" to
>>> "__atomic_thread_fence(__ATOMIC_SEQ_CST)", but not litmus7.
>>>
>>> So I cannot go with "volatile", but let's see if I can do something
>>> better than the gcc intrinsics.
>>
>> And if the litmus7 guys don't have anything for me, I can always write a
>> script to do the conversions.  So either way, we will have kernel-style
>> notation at some point.  ;-)
> 
> And it turns out that the contents of a second "{}" in a litmus7 test
> is pulled directly into the output code, so an easy change.  ;-)

Good news!

So __atomic_thread_fence() will also be replaced with smp_mb() in
the litmus tests? That will reduce the width of the tables and eliminate
the need for the hspece adjustments in one-column layout.

                Thanks, Akira
> 
> 							Thanx, Paul
> 
> 

