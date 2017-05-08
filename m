Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jvnlp1uXPi7KT8BWnXtiKP27AxZfiSiLoRKsl6Whgqw=;
 b=WhjmfXaHoDwwsR2fh4PVR0rmnBKNm9qzKvv9mzVG5oFbf5ySNeegdvI918u5HG6xL8
 P7quAFDa3wDxmiInE6mVJbblPbdkb5b61FvqgFlb33cSED/WnfWq4SpiEsSeW91ozoHG
 ztgDET50gxUUDwtf0tTIRvZvHIoTfyZ7IkXsTpumX3Kfi9J/heKHkxKP/95FGLdRLhZL
 gXuAu+izXtllejo1johpke2GSNV+diN4OpwCvIU+5j4LUb74A6zQNzUVkjxN67A6zr7x
 4Ky0+aPKFYLJAx/kLiksIK3zaZ1C2Hrfofh42tGuSK8STQEJ6RNMG/Ba9LIFUykbsQyh
 f9AQ==
Subject: Re: [Q] Heisenbug and anti-heisenbug
References: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
 <61b85306-48c8-d90d-b6a0-e56dbe1b75a3@gmail.com>
 <20170503024719.GK3956@linux.vnet.ibm.com>
 <b174742f-b2c5-d9f7-3fad-1c87efb2aeb7@gmail.com>
 <20170503145948.GP3956@linux.vnet.ibm.com>
 <1474a27c-46f5-f6af-f85e-eb65255f97a1@gmail.com>
 <20170508035015.GV3956@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e788be56-6672-39aa-0a6e-a2749bde2047@gmail.com>
Date: Tue, 9 May 2017 00:06:29 +0900
MIME-Version: 1.0
In-Reply-To: <20170508035015.GV3956@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/07 20:50:15 -0700, Paul E. McKenney wrote:
> On Sun, May 07, 2017 at 09:23:03AM +0900, Akira Yokosawa wrote:
>> On 2017/05/03 07:59:48 -0700, Paul E. McKenney wrote:
>>> On Wed, May 03, 2017 at 05:14:57PM +0900, Akira Yokosawa wrote:
>>>> On 2017/05/02 19:47:19 -0700, Paul E. McKenney wrote:
>>>>> On Wed, May 03, 2017 at 09:23:11AM +0900, Akira Yokosawa wrote:
>>>>>> On 2017/05/03 09:09:37 +0900, Akira Yokosawa wrote:
>>>>>>> Hi Paul,
>>>>>>>
>>>>>>> While reviewing your recent update in "Hunting Heisenbugs" section,
>>>>>>> I found the analogy with particle physics didn't sit well with me.
>>>>>>>
>>>>>>> "Heisenbug" is defined as:
>>>>>>>
>>>>>>>> attempts to track down the heisenbug causes it to radically change
>>>>>>>> its symptoms or even disappear completely. 
>>>>>>>
>>>>>>> "Anti-heisenbug" is introduced as:
>>>>>>>
>>>>>>>> Fortunately, particle physics is up to the task: Why not create
>>>>>>>> an anti-heisenbug to annihilate the heisenbug?
>>>>>>>
>>>>>>> At this point, "anti-heisenbug" seems to mean a patch that fixes
>>>>>>> the heisenbug.
>>>>>>>
>>>>>>> The use of anti-something in particle physics does not go along
>>>>>>> with this usage.
>>>>>>>
>>>>>>> For example, antiproton is an antiparticle of proton.
>>>>>>> antiproton has mostly the same property as proton,
>>>>>>> with the exception of electric charge and magnetic moment.
>>>>>>> Also, an antiproton and an antielectron (positron) can compose
>>>>>>> an antihydrogen atom. Well, I'm sure you know all about this.
>>>>>>>
>>>>>>> So, if you employ this line of reasoning, an anti-heisenbug should
>>>>>>> also be a bug with something opposite in nature.
>>>>>>>
>>>>>>> If a heisenbug is a bug which vanishes when it is being tracked down,
>>>>>>> an anti-heisenbug would be a bug which only emerges when it (or 
>>>>>>> something else) is being tracked down.
>>>>>>>
>>>>>>> However, it is not obvious you can create an anti-heisenbug for
>>>>>>> a particular heisenbug so that when the two are combined, the symptoms
>>>>>>> of both bugs to "annihilate".
>>>>>>>
>>>>>>> So I'm wondering "What was Paul's intention in using the word 'annihilate'?".
>>>>>>>
>>>>>>> In Section "Add Delay", anti-heisenbug is used as:
>>>>>>>
>>>>>>>> Once you spot a bug involving a race condition, it is frequently
>>>>>>>> possible to create an anti-heisenbug by adding delay in this manner.
>>>>>>>
>>>>>>> This "anti-heisenbug" is not a bug, rather, it is a means to increase
>>>>>>> the possibility of a given heisenbug to appear. 
>>>>>>>
>>>>>>
>>>>>> Oops, I sent this prematurely.
>>>>>> But you might be able to see my point here.
>>>>>>
>>>>>> This is not an important question, so please give it a look when you have
>>>>>> done with whatever issue you are working on.
>>>>>
>>>>> I freely admit that I am taking a fair amount of "poetic license" here.  ;-)
>>>>
>>>> So, what about adding a footnote like this?
>>>
>>> That isn't bad at all!
>>>
>>> But let's take a look at several possible approaches:
>>>
>>> o	Continue using "anti-heisenbug", but remove the current definition.
>>> 	(To the extent that it could be considered to be a definition.)
>>>
>>> o	Use the following analogy:
>>>
>>> 		When you annihilate an electron and a positron, you don't
>>> 		get nothingness, you instead get an energetic photon.
>>> 		Similarly, when you annihilate a heisenbug and an
>>> 		anti-heisenbug, you don't (usually) get nothingness,
>>> 		instead, you get a (hopefully) easier-to-locate bug.
>>>
>>> o	The solution you propose below.
>>>
>>> o	Leave as is, and assume that people will get the "poetic license".
>>>
>>> o	Additional ideas here!
>>>
>>> o	Any of the above, but have a quick quiz on the definition
>>> 	instead of a footnote or an inline definition/explanation.
>>>
>>> Thoughts?
>>
>> I looked around the use of "heisenbug" and found an entry in quora:
>>
>> https://www.quora.com/Why-do-people-mix-up-the-observer-effect-and-the-uncertainty-principle
>>
>> What "heisenbug" should imply is the "observer effect", not the "uncertainty principle".
>>
>> So the definition of heisenbug given in the text is already confusing.
> 
> That may be, but I wasn't the one who defined heisenbug.  ;-)
> 
> But given that it is defined, and given that a very large number of people
> are very scared of heisenbugs, it is my job to reduce, preferably remove,
> the fear.  Less fear is needed so that they can better deal with the
> heisenbugs that they will inevitably come across.
> 
>> An example of observer effect in quantum mechanics is interference of
>> electron beam passing through double slit.
>> If you don't know which slit each electron passes, you can observe interference
>> pattern. But once you put some equipment to know which slit an individual
>> electron passes, you no longer see the interference pattern.
>>
>> This situation is much relevant to heisenbug, isn't it?
> 
> Well, it actually -might- be possible to come up with a heisenbug that
> mimicked quantum superpositioning and entanglement, but I don't know of
> one right offhand.  Actually, it -has- to be possible to generate such a
> heisenbug because we can simulate quantum systems with software.  Whether
> or not such a heisenbug would actually occur naturally, I couldn't say.
> Seems a bit unlikely, but then again, so did RCU.  ;-)

Hmm, hard to imagine...

> 
>> Heisenberg used observer effect to explain his uncertainty principle as
>> a thought experiment on the gamma-ray microscope.
>> This is the origin of the confusion. And most people are still confused.
>>
>> So I don't like to see further analogies with misleading implications, which
>> would just look odd or strange for those familiar with particle physics who
>> happens to be also interested in parallel processing.
> 
> The readers need to laugh enough, be confused enough, or whatever, in order
> to let go of their fear.

;-)

> 
>> All we need is to *somehow* make (the symptom of) a given heisenbug be
>> reliably reproduced. And those "somehow"s are the theme of this section.
> 
> That is true!
> 
>> So, I'd suggest 1) fixing the definition of heisenbug, 2) departing from
>> the analogy of particle physics. One problem is what name to use instead of
>> anti-heisenbug. If you use "anti-" as in "antibiotics", anti-heisenbug
>> is not necessarily confusing.
> 
> I am not at all optimistic about being able to fix the definition
> of heisenbug.  It has been in use for far too long.

And most people are likely to have heard of the uncertainty principle. 

> 
>> Or you might be able to come up with a better analogy by looking into studies
>> in quantum measurement such as "weak measurement". This field is related to
>> quantum computing you are planning to include into perfbook.
>>
>> See e.g. http://iopscience.iop.org/article/10.1088/0031-8949/91/7/073001/meta
>>
>> This is a review paper written from experimenters' POV, and should be easier
>> to read than theoretical papers cited therein, I suppose.
> 
> But if we have to educate the typical reader about weak measurement, we
> have already lost.

Point taken.

>                     We will lose them, and they will retain their
> crippling fear of heisenbugs.
> 
> How about something like the following patch?

Fair enough.

And "heisen-ness" sounds funny enough.

If you want to add,

Acked-by: Akira Yokosawa <akiyks@gmail.com>

                                 Thanks, Akira

> 
> 							Thanx, Paul
> 
> ----------------------------------------------------------------------
> 
> commit 50d1f21f54540ff6ec38cc44715c213c3e16f2fe
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sun May 7 20:46:19 2017 -0700
> 
>     debugging: Add footnote stating that "heisenbug" is a misnomer
>     
>     https://www.quora.com/Why-do-people-mix-up-the-observer-effect-and-the-uncertainty-principle
>     http://iopscience.iop.org/article/10.1088/0031-8949/91/7/073001/meta
>     
>     But the word is well entrenched in common usage in parallel programming.
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index e621ebdb540b..c41057f35c31 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1370,23 +1370,30 @@ The next section discusses counter-intuitive ways of improving this situation.
>  
>  This line of thought also helps explain heisenbugs:
>  adding tracing and assertions can easily reduce the probability
> -of a bug appearing.
> -And this is why extremely lightweight tracing and assertion mechanism are
> +of a bug appearing, which
> +is why extremely lightweight tracing and assertion mechanism are
>  so critically important.
>  
> -The name ``heisenbug'' stems from the Heisenberg Uncertainty Principle
> -from quantum physics, which states that it is impossible to exactly
> -quantify a given particle's position and velocity at any given point
> -in time~\cite{WeinerHeisenberg1927Uncertain}.
> +The term ``heisenbug'' was inspired by the Heisenberg Uncertainty
> +Principle from quantum physics, which states that it is impossible to
> +exactly quantify a given particle's position and velocity at any given
> +point in time~\cite{WeinerHeisenberg1927Uncertain}.
>  Any attempt to more accurately measure that particle's position will
>  result in increased uncertainty of its velocity.
> -A similar effect occurs for heisenbugs: attempts to track down the heisenbug
> -causes it to radically change its symptoms or even disappear completely.
> +A roughly similar effect occurs for heisenbugs: attempts to track down
> +the heisenbug causes it to radically change its symptoms or even disappear
> +completely.\footnote{
> +	The term ``heisenbug'' is a misnomer, as most heisenbugs are
> +	fully explained by the \emph{observer effect} from classical
> +	physics.
> +	Nevertheless, the name ``heisenbug'' has stuck.}
>  
>  If the field of physics inspired the name of this problem, it is only
> -logical that we should look to the field of physics for the solution.
> +logical that the field of physics should inspire the solution.
>  Fortunately, particle physics is up to the task:
>  Why not create an anti-heisenbug to annihilate the heisenbug?
> +Or, perhaps more accurately, to annihilate the heisen-ness of
> +the heisenbug?
>  
>  This section describes a number of ways to do just that:
>  
> 
> 

