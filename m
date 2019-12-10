Return-Path: <SRS0=jHua=2A=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E7ji8agsfd89H9lyZ1nQV4d5g72udGFW36rldyZBJzU=;
        b=ML35z/jR4U6bOtBwKoAifQUPXpDm4YG7P9mxxlV3BoNbgH0f78Arczl1jz2WanvUul
         s3d5vj7UOvKvB/FHbqkhr3FXK3emipeaVARIjTL46pcbfzYQIDfKwXc7yEEGaw+X5t+a
         u6FFuotfxFSt/3o8ux6tRZrjUZYpiLRh9h3dZqs/iHz14p+e6zSqwNVV3OhRGZ3GYtqB
         fMK4gbMKR+kYrHys5MInkKN95OBsnhqoF6ZHfw1qTdDsEJV17X44Amt+R3cftU3MEJi1
         vY38p0eMVsgidxtHML38Z34AH13HYvEsTR2EFcJce651UTArWZvLZKaEExWsd9Ye50Zt
         q9OA==
Subject: Re: [PATCH 0/2] Minor updates
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
 <20191207164308.GP2889@paulmck-ThinkPad-P72>
 <881ccdd8-1d59-649e-38d1-b65601262f0d@gmail.com>
 <20191208011550.GT2889@paulmck-ThinkPad-P72>
 <8023af83-480f-00ab-7d96-7c975fd039c8@gmail.com>
 <20191208181120.GX2889@paulmck-ThinkPad-P72>
 <0e38b00c-7b23-ad0f-8fa2-e3089cecf13f@gmail.com>
 <20191209180635.GK2889@paulmck-ThinkPad-P72>
 <f7f2beda-2e5f-fcfa-21c6-108cb03a5932@gmail.com>
 <20191210000812.GP2889@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <01c004d3-11ec-9ec7-3056-921d97c5f9cf@gmail.com>
Date: Tue, 10 Dec 2019 21:32:26 +0900
MIME-Version: 1.0
In-Reply-To: <20191210000812.GP2889@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/12/10 9:08, Paul E. McKenney wrote:
> On Tue, Dec 10, 2019 at 07:11:10AM +0900, Akira Yokosawa wrote:
>> On 2019/12/10 3:06, Paul E. McKenney wrote:
>>> On Mon, Dec 09, 2019 at 09:50:56PM +0900, Akira Yokosawa wrote:
>>>> On Sun, 8 Dec 2019 10:11:20 -0800, Paul E. McKenney wrote:
>>>>> On Mon, Dec 09, 2019 at 12:54:46AM +0900, Akira Yokosawa wrote:
>>>>>> On Sat, 7 Dec 2019 17:15:50 -0800, Paul E. McKenney wrote:
>>>>>>> On Sun, Dec 08, 2019 at 08:41:45AM +0900, Akira Yokosawa wrote:
>>>>>>>> On Sat, 7 Dec 2019 08:43:08 -0800, Paul E. McKenney wrote:
>>>>>>>>> On Sat, Dec 07, 2019 at 01:05:17PM +0900, Akira Yokosawa wrote:
>>>>>>>>>> Hi Paul,
>>>>>>>>>>
>>>>>>>>>> This patch set fixes minor issues I noticed while reading your
>>>>>>>>>> recent updates.
>>>>>>>>>
>>>>>>>>> Queued and pushed, along with a fix to another of my typos, thank
>>>>>>>>> you very much!
>>>>>>>>>
>>>>>>>>>> Apart from the changes, I'd like you to mention in the answer to
>>>>>>>>>> Quick Quiz 9.43 that modern Intel CPUs don't execute x86_64
>>>>>>>>>> instructions directly, but decode them into uOPs (via MOP) and
>>>>>>>>>> keep them in a uOP cache [1].
>>>>>>>>>> So the execution cycle is not necessarily corresponds to instruction
>>>>>>>>>> count, but heavily depends on the behavior of the microarch, which
>>>>>>>>>> is not predictable without actually running the code. 
>>>>>>>>>>
>>>>>>>>>> [1]: https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(server)
>>>>>>>>>
>>>>>>>>> My thought is that I should review the "Hardware and it Habits" chapter,
>>>>>>>>> add this information if it is not already present, and then make the
>>>>>>>>> answer to this Quick Quiz refer back to that.  Does that seem reasonable?
>>>>>>>>
>>>>>>>> Yes, it sounds quite reasonable!
>>>>>>>>
>>>>>>>> (Skimming through the chapter...)
>>>>>>>>
>>>>>>>> So Section 3.1.1 lightly touches pipelining. Section 3.2 mostly discusses
>>>>>>>> memory sub-systems.
>>>>>>>>
>>>>>>>> Modern Intel architectures can be thought of as superscalar RISC
>>>>>>>> processors which emulate x86 ISA. The transformation of x86 instructions
>>>>>>>> into uOPs can be thought of as another layer of optimization
>>>>>>>> (sometimes "de-optimization" from compiler writer's POV) ;-).
>>>>>>>>
>>>>>>>> But deep-diving this topic would cost you another chapter/appendix.
>>>>>>>> I'm not sure if it's worthwhile for perfbook.
>>>>>>>> Maybe it would suffice to lightly touch the difficulty of
>>>>>>>> predicting execution cycles of particular instruction streams
>>>>>>>> on modern microprocessors (not limited to Intel's), and put
>>>>>>>> a few citations of textbooks/reference manuals.
>>>>>>>
>>>>>>> What I did was to add a rough diagram and a paragraph or two of
>>>>>>> explanation to Section 3.1.1, then add a reference to that section
>>>>>>> in the Quick Quiz.
>>>>>>
>>>>>> I'd like to see a couple of more keywords to be mentioned here other
>>>>>> than "pipeline".  "Super-scalar" is present in Glossary, but
>>>>>> "Superscalar" looks much common these days. Appended below is
>>>>>> a tentative patch I made to show you my idea. Please feel free
>>>>>> to edit as you'd like before applying it.
>>>>>>
>>>>>> Another point I'd like to suggest.
>>>>>> Figure 9.23 and the following figures still show the result on
>>>>>> a 16 CPU system. Looks like it is difficult to make plots of 448-thread
>>>>>> system corresponding to them. Can you add info on the HW system
>>>>>> where those 16 CPU results were obtained in the beginning of
>>>>>> Section 9.5.4.2?
>>>>>>
>>>>>>         Thanks, Akira
>>>>>>
>>>>>> -------------8<-------------------
>>>>>> >From 7e5c17a2e816a23bb12aa23f18ed96d5e820fc3a Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Mon, 9 Dec 2019 00:23:59 +0900
>>>>>> Subject: [TENTATIVE PATCH] cpu/overview: Mention approaches other than 'pipelining'
>>>>>>
>>>>>> Also remove "-" from "Super-scaler" in Glossary.
>>>>>>
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>
>>>>> Good points, thank you!
>>>>>
>>>>> Applied with a few inevitable edits.  ;-)
>>>>
>>>> Quite a few edits!  Thank you.
>>>>
>>>> Let me reiterate my earlier suggestion:
>>>>
>>>>>> Another point I'd like to suggest.
>>>>>> Figure 9.23 and the following figures still show the result on
>>>>>> a 16 CPU system. Looks like it is difficult to make plots of 448-thread
>>>>>> system corresponding to them. Can you add info on the HW system
>>>>>> where those 16 CPU results were obtained in the beginning of
>>>>>> Section 9.5.4.2?
>>>>
>>>> Can you look into this as well?
>>>
>>> There are a few build issues, but the main problem has been that I have
>>> needed to use that system to verify Linux-kernel fixes.  The intent
>>> is to regenerate most and maybe all of the results on the large system
>>> over time.
>>
>> I said "difficult" because of the counterintuitive variation of
>> cycles you've encountered by the additional "lea" instruction.
>> You will need to eliminate such variations to evaluate the cost
>> of RCU, I suppose.
>> Looks like Intel processors are sensitive to alignment of branch targets.
>> (I think you know the matter better than me, but I could not help.)
>> For example: https://stackoverflow.com/questions/18113995/
> 
> It does indeed get complicated.  ;-)
> 
> Another experiment on the todo list is to move the rcu_head structure to
> the end, which should eliminate that extra lea instruction.  I am planning
> to introduce that to the answer to the more-than-ideal quick quiz.

That sounds like quite reasonable.

> 
>>> But I added the system's info in the meantime.  ;-)
>>
>> Which generation of Intel x86 system was it?
> 
> I don't know, as that was before I got smart and started capturing
> /proc/cpuinfo.  It was quite old, probably produced in 2010 or so.
> Maybe even earlier.

(Digging up the git history...)
Yes, this plot has existed ever since the first commit of perfbook.
And I won't blame you if you don't remember exactly what type of
machine you ran the performance tests on. x86 in 2008 means it was
pre-Nehalem, wasn't it?

There remains a table of data obtained on Nehalem in 2009,
which was added in commit 38fd945ff401 ("Fill out CPU chapter,
including adding Nehalem data.").

> 
> Which is another good reason to rerun those results, but I don't see
> this as blocking the release.

Agreed.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
[...]
