Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3FV1B275q0HcHoEIf2sYxrErZH609VrvShz7n6txPiI=;
 b=EloqfMJveZb+jJI2rYwDSHUxVHu9+U3SEUpjl3zdNp4c3gHFFw+TGya199e7NIdhhG
 5iUnbULmBCMYBPBdWXrqzEDElIsQIaBOxHeMpokuq+HelKJ+xvcZOPrXJcFI92TphTvQ
 oBO2z5/Mm8c1UiXEE7EqmOawhSbeTLEuvcgVQqbnQua9w0WLJKb8aWBioId81708Ar7e
 18QWwnstWpaTT6arPhfZoVbS16xbc5xtHJ+lYZPu+51Tq9IczXzeMG48M0bLCP8zTDse
 EBX5N7sh8qAnWxyY0+mJ1kqDTbYZ7p5qQbpl+mNJH0YfJhWDfVVI4fIVn0k7/9ZaAz9x
 zfzA==
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
 <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
 <20170705154024.GU2393@linux.vnet.ibm.com>
 <20170705155004.GB29379@linux.vnet.ibm.com>
 <20170705173249.GA22308@linux.vnet.ibm.com>
 <81458845-cd7c-1cf0-cb45-d346846d14d7@gmail.com>
 <20170705223218.GH2393@linux.vnet.ibm.com>
 <030d74ba-e816-cde6-5c31-a0cf25a3b320@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f1f201bd-0108-f328-b606-b1d95b4998b9@gmail.com>
Date: Thu, 6 Jul 2017 21:09:05 +0900
MIME-Version: 1.0
In-Reply-To: <030d74ba-e816-cde6-5c31-a0cf25a3b320@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/06 7:40 +0900, Akira Yokosawa wrote:
> On 2017/07/06 7:32, Paul E. McKenney wrote:
>> On Thu, Jul 06, 2017 at 07:15:24AM +0900, Akira Yokosawa wrote:
>>> On 2017/07/05 10:32:49 -0700, Paul E. McKenney wrote:
>>
>> [ . . . ]
>>
>>>>>> So I cannot go with "volatile", but let's see if I can do something
>>>>>> better than the gcc intrinsics.
>>>>>
>>>>> And if the litmus7 guys don't have anything for me, I can always write a
>>>>> script to do the conversions.  So either way, we will have kernel-style
>>>>> notation at some point.  ;-)
>>>>
>>>> And it turns out that the contents of a second "{}" in a litmus7 test
>>>> is pulled directly into the output code, so an easy change.  ;-)
>>>
>>> Good news!
>>>
>>> So __atomic_thread_fence() will also be replaced with smp_mb() in
>>> the litmus tests? That will reduce the width of the tables and eliminate
>>> the need for the hspece adjustments in one-column layout.
>>
>> Oops, I forgot to push!  Done now.
>>
>> And yes, there is now smp_mb() in the litmus tests and the tables.
> 
> I'll take a look later.
> As I mentioned earlier, __atomic_load_n() and __atomic_store_n() seem
> to have fairly large overheads (on x86). You might want to see the changes
> in the resulting statistics and reflect them in the text.

Hi Paul,

The definition of READ_ONCE() and WRITE_ONCE() given in the updated litmus
tests is inconsistent with kernel API. They are accepting pointers such
as x0 and x1.

In the article at LWN (https://lwn.net/Articles/720550/), litmus tests use the
same definition as kernel API. They take the value expression such as *x0 and *x1.

My preference is to accept pointers as arguments as is the way in C functions,
but the kernel community have chosen otherwise. We should be consist here.

So the definition should be:

---
#define READ_ONCE(x) __atomic_load_n(&(x), __ATOMIC_RELAXED)
#define WRITE_ONCE(x, v) __atomic_store_n(&(x), (v), __ATOMIC_RELAXED)
#define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
---

Or am I misreading?

                Thanks, akira

> 
>           Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
>>
> 
> 

