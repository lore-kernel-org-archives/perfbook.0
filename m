Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SkwGIUSzkmJfUM2uuUz1MH0/nXz4y06Jl2kO27ltWaI=;
 b=D7GR3sTBcquwDDazcI7bZnQo+s6Td1xKNqANB0Qc4BjqpqmLhbneCkQDjJmKGGFcwR
 cUv3whnC7063s+lXQ/EOcfhSK1juBQ34VpLRHnstbLIR4qsL4uw7MYGf/yErwWrySdTx
 B+qLjNoy/M4xnWD4zhLlllYxw6Au5qEJ5qej9h2yvl2OD5AwPSdZ0QWYsR37wZ3yZFZx
 /ESe3sbTJ+7QE9jkwkcq1ZDLrFiocP/ONjk5jIKpgrrAU4XFl1QgzBj3S8GMfRf1pgLY
 8niCeyjmd/a16dZg11ZBSS/wfUYkGqO22LlpOdvtj/mVwz7AVXa81UeKjk5PDXhnpm6A
 Lskg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [Q] Heisenbug and anti-heisenbug
References: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
 <61b85306-48c8-d90d-b6a0-e56dbe1b75a3@gmail.com>
 <20170503024719.GK3956@linux.vnet.ibm.com>
 <b174742f-b2c5-d9f7-3fad-1c87efb2aeb7@gmail.com>
 <20170503145948.GP3956@linux.vnet.ibm.com>
Message-ID: <1474a27c-46f5-f6af-f85e-eb65255f97a1@gmail.com>
Date: Sun, 7 May 2017 09:23:03 +0900
MIME-Version: 1.0
In-Reply-To: <20170503145948.GP3956@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/03 07:59:48 -0700, Paul E. McKenney wrote:
> On Wed, May 03, 2017 at 05:14:57PM +0900, Akira Yokosawa wrote:
>> On 2017/05/02 19:47:19 -0700, Paul E. McKenney wrote:
>>> On Wed, May 03, 2017 at 09:23:11AM +0900, Akira Yokosawa wrote:
>>>> On 2017/05/03 09:09:37 +0900, Akira Yokosawa wrote:
>>>>> Hi Paul,
>>>>>
>>>>> While reviewing your recent update in "Hunting Heisenbugs" section,
>>>>> I found the analogy with particle physics didn't sit well with me.
>>>>>
>>>>> "Heisenbug" is defined as:
>>>>>
>>>>>> attempts to track down the heisenbug causes it to radically change
>>>>>> its symptoms or even disappear completely. 
>>>>>
>>>>> "Anti-heisenbug" is introduced as:
>>>>>
>>>>>> Fortunately, particle physics is up to the task: Why not create
>>>>>> an anti-heisenbug to annihilate the heisenbug?
>>>>>
>>>>> At this point, "anti-heisenbug" seems to mean a patch that fixes
>>>>> the heisenbug.
>>>>>
>>>>> The use of anti-something in particle physics does not go along
>>>>> with this usage.
>>>>>
>>>>> For example, antiproton is an antiparticle of proton.
>>>>> antiproton has mostly the same property as proton,
>>>>> with the exception of electric charge and magnetic moment.
>>>>> Also, an antiproton and an antielectron (positron) can compose
>>>>> an antihydrogen atom. Well, I'm sure you know all about this.
>>>>>
>>>>> So, if you employ this line of reasoning, an anti-heisenbug should
>>>>> also be a bug with something opposite in nature.
>>>>>
>>>>> If a heisenbug is a bug which vanishes when it is being tracked down,
>>>>> an anti-heisenbug would be a bug which only emerges when it (or 
>>>>> something else) is being tracked down.
>>>>>
>>>>> However, it is not obvious you can create an anti-heisenbug for
>>>>> a particular heisenbug so that when the two are combined, the symptoms
>>>>> of both bugs to "annihilate".
>>>>>
>>>>> So I'm wondering "What was Paul's intention in using the word 'annihilate'?".
>>>>>
>>>>> In Section "Add Delay", anti-heisenbug is used as:
>>>>>
>>>>>> Once you spot a bug involving a race condition, it is frequently
>>>>>> possible to create an anti-heisenbug by adding delay in this manner.
>>>>>
>>>>> This "anti-heisenbug" is not a bug, rather, it is a means to increase
>>>>> the possibility of a given heisenbug to appear. 
>>>>>
>>>>
>>>> Oops, I sent this prematurely.
>>>> But you might be able to see my point here.
>>>>
>>>> This is not an important question, so please give it a look when you have
>>>> done with whatever issue you are working on.
>>>
>>> I freely admit that I am taking a fair amount of "poetic license" here.  ;-)
>>
>> So, what about adding a footnote like this?
> 
> That isn't bad at all!
> 
> But let's take a look at several possible approaches:
> 
> o	Continue using "anti-heisenbug", but remove the current definition.
> 	(To the extent that it could be considered to be a definition.)
> 
> o	Use the following analogy:
> 
> 		When you annihilate an electron and a positron, you don't
> 		get nothingness, you instead get an energetic photon.
> 		Similarly, when you annihilate a heisenbug and an
> 		anti-heisenbug, you don't (usually) get nothingness,
> 		instead, you get a (hopefully) easier-to-locate bug.
> 
> o	The solution you propose below.
> 
> o	Leave as is, and assume that people will get the "poetic license".
> 
> o	Additional ideas here!
> 
> o	Any of the above, but have a quick quiz on the definition
> 	instead of a footnote or an inline definition/explanation.
> 
> Thoughts?

I looked around the use of "heisenbug" and found an entry in quora:

https://www.quora.com/Why-do-people-mix-up-the-observer-effect-and-the-uncertainty-principle

What "heisenbug" should imply is the "observer effect", not the "uncertainty principle".

So the definition of heisenbug given in the text is already confusing.

An example of observer effect in quantum mechanics is interference of
electron beam passing through double slit.
If you don't know which slit each electron passes, you can observe interference
pattern. But once you put some equipment to know which slit an individual
electron passes, you no longer see the interference pattern.

This situation is much relevant to heisenbug, isn't it?

Heisenberg used observer effect to explain his uncertainty principle as
a thought experiment on the gamma-ray microscope.
This is the origin of the confusion. And most people are still confused.

So I don't like to see further analogies with misleading implications, which
would just look odd or strange for those familiar with particle physics who
happens to be also interested in parallel processing.

All we need is to *somehow* make (the symptom of) a given heisenbug be
reliably reproduced. And those "somehow"s are the theme of this section.

So, I'd suggest 1) fixing the definition of heisenbug, 2) departing from
the analogy of particle physics. One problem is what name to use instead of
anti-heisenbug. If you use "anti-" as in "antibiotics", anti-heisenbug
is not necessarily confusing.

Or you might be able to come up with a better analogy by looking into studies
in quantum measurement such as "weak measurement". This field is related to
quantum computing you are planning to include into perfbook.

See e.g. http://iopscience.iop.org/article/10.1088/0031-8949/91/7/073001/meta

This is a review paper written from experimenters' POV, and should be easier
to read than theoretical papers cited therein, I suppose.

                              Thanks, Akira

> 							Thanx, Paul
> 
>>                         Thanks, Akira
>>
>> --8<-->8--
>> >From cdf227d76d6ec3b40f2dfd6f1a55aba7a1e1bb49 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 3 May 2017 16:40:15 +0900
>> Subject: [PATCH] debugging: Add footnote on the use of 'anti-heisenbug'
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  debugging/debugging.tex | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
>> index e621ebd..146c696 100644
>> --- a/debugging/debugging.tex
>> +++ b/debugging/debugging.tex
>> @@ -1386,7 +1386,11 @@ causes it to radically change its symptoms or even disappear completely.
>>  If the field of physics inspired the name of this problem, it is only
>>  logical that we should look to the field of physics for the solution.
>>  Fortunately, particle physics is up to the task:
>> -Why not create an anti-heisenbug to annihilate the heisenbug?
>> +Why not create an anti-heisenbug\footnote{
>> +	Here, we'll use ``anti-heisenbug'' to denote whatever means
>> +	which would help us track down a given heisenbug, rather than
>> +	its counterpart in a scrict sense of particle physics.}
>> +to annihilate the heisenbug?
>>
>>  This section describes a number of ways to do just that:
>>
>> -- 
>> 2.7.4
>>
>>
> 
> 

