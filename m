Return-Path: <SRS0=caq+=35=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o8z6dJO64K+ick2f/3J7XW4Zero/TOPx4mOCcJmSL4Y=;
        b=J7/6k4B5kFwDW2gBfiYinKUkf730QsZfO4GAoK0h9w39s0QXaVqkRj0EYYk3E3mT50
         AdVWi5GPvp3XON8IlW0mQ8wBgaIljWGJC97CAPGOjQsuzrfxd1BoXzCGnt0KQnpnx9Xu
         rtRL1JsH+EVmV7GFrurEBagHebfa8SCS3BNXTVtHkHQHoCrITGlPjj1tToQcgpqgOrTS
         8z9mJPCtOGRSru+F2Et0PbXzemxRyf9lqVJj3RMooPG5YWzoTCzhFayPHY0NRGhpr752
         ZbwjxZZj2LxaTmbhNhOtIq6zg0U18dJAk+l7qdycdx6SvBhQdFtyeh4LzP4YG5cMmL6S
         l8xg==
Subject: Re: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
References: <74a6c257-cf2a-315d-202a-a109c874e843@gmail.com>
 <20200208130358.GR2935@paulmck-ThinkPad-P72>
 <2e7e0662-d12d-2d54-c504-e68e5fee5ade@gmail.com>
 <20200208151843.GS2935@paulmck-ThinkPad-P72>
 <195bc818-fefe-af7d-b7c4-e9d3146471df@gmail.com>
 <20200208175618.GT2935@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5fa5c95f-168b-a3ef-c39a-0cc63ecf18a2@gmail.com>
Date: Sun, 9 Feb 2020 13:02:22 +0900
MIME-Version: 1.0
In-Reply-To: <20200208175618.GT2935@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 8 Feb 2020 09:56:18 -0800, Paul E. McKenney wrote:
> On Sun, Feb 09, 2020 at 12:46:33AM +0900, Akira Yokosawa wrote:
>> On Sat, 8 Feb 2020 07:18:43 -0800, Paul E. McKenney wrote:
>>> On Sat, Feb 08, 2020 at 11:44:13PM +0900, Akira Yokosawa wrote:
>>>> On Sat, 8 Feb 2020 05:03:58 -0800, Paul E. McKenney wrote:
>>>>> On Sat, Feb 08, 2020 at 09:03:10PM +0900, Akira Yokosawa wrote:
>>>>>> >From 66df1c9aaaefb2ef5ccfd0c23837b33218a24f30 Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Sat, 8 Feb 2020 08:29:08 +0900
>>>>>> Subject: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
>>>>>>
>>>>>> In the introduction of Dining Philosophers, there is two-page
>>>>>> "think about it" gap before presenting an answer.
>>>>>>
>>>>>> Let's see what we need for print editions.
>>>>>>
>>>>>> When the question is on an odd page, the answer can be on the next page
>>>>>> (the other side of the question's page).
>>>>>> When the question is on an even page, the answer should be on the
>>>>>> next even page to prevent it from being spotted too early.
>>>>>>
>>>>>> For electronic editions, there needs to be a gap of at least one
>>>>>> page regardless of the question's position.
>>>>>>
>>>>>> As \cleardoublepage changes its behavior depending on whether it is
>>>>>> on an odd page (one blank page) or on an even page (nothing), it
>>>>>> can not cover the requirement for electronic editions.
>>>>>>
>>>>>> For our purpose, the sequence of \clearpage, "((Intentional blank page)",
>>>>>> and another \clearpage should suffice.
>>>>>>
>>>>>> Reported-by: Paul E. McKenney <paulmck@kernel.org>
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>
>>>>> I have queued this, thank you!
>>>>>
>>>>> It works as desired with the current setup because the discussion and the
>>>>> reveal both end up on even pages.  You can check this using the "evince"
>>>>> PDF viewer by putting it into two-page mode (apologies for not saying
>>>>> so earlier, but I just now remembered myself).
>>>>>
>>>>> Wasting the single page isn't a disaster, as you say, but could the
>>>>> trick shown here avoid even that?
>>>>>
>>>>> https://tex.stackexchange.com/questions/6143/if-then-else-for-odd-page-even-page
>>>>>
>>>>> I tried this (but leaving out the recommended \strictpagecheck, which
>>>>> might mean that there could be errors when this occurs near the beginning
>>>>> of a page?) and it seems to handle both cases.  Please see below for a
>>>>> patchlet on top of your patch.
>>>>
>>>> I've not tested it yet, but I think this trick should be enabled only
>>>> for print editions.
>>>> I'm wondering what is the right option to distinguish print editions
>>>> from electronic editions.
>>>>
>>>> One way would be to update autodate.sh and define a boolean as true
>>>> in autodate.tex when you have a tag of "Edition.nP".
>>>>
>>>> Does this sound reasonable to you?
>>>
>>> It would, except that people really do print non-print editions and
>>> sometimes they print releases or even random points in the git history.
>>> So I do not believe that we should distinguish.
>>
>> For e-readers, this trick would present Figure 6.4 just next to the
>> question in contiguous display mode if the question lands on an even page,
>> which is not ideal for first-time readers.
>>
>> So I don't like to enable this trick all the time.
>>
>> Or, how about enabling it for 2c layouts only, which most people would
>> choose to print out.
>>
>> Another completely different approach would be to put the answer part
>> and Figure 6.4 into an Answer to a Quick Quiz.
>> Then we wouldn't need to play with \clearpage commands.
>>
>> Thoughts?
> 
> You know, this might well be the best approach, the additional quick
> quizzes notwithstanding.  Let me give it some thought, maybe I should
> just have a list of answers.

Looking forward to seeing how it goes!

> 
>>> But if there is ever a reliable way to produce an ereader format, then
>>> agreed, we would want to distinguish.  Or if we could figure out that
>>> the reader was reading it on a smartphone.
>>>
>>> Or am I missing a trick here?
>>
>> It sounds like we are talking about something different, aren't we? ;-)
> 
> Which can sometimes be quite productive.  Sometimes.  ;-)

Yeah, sometimes.

In the meantime, I'm submitting a couple of updates regarding to
epigraph.sty.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>         Thanks, Akira
>>>>
>>>>>
>>>>> If this really works, could you please fold it into your patch with any
>>>>> needed adjustments?  If it is broken in some way, well, I do have your
>>>>> existing patch which does represent a much-appreciated improvement!
>>>>>
>>>>> 							Thanx, Paul
>>>>>
>>>>> ------------------------------------------------------------------------
>>>>>
>>>>> diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
>>>>> index 4ceaefe..82de2b9 100644
>>>>> --- a/SMPdesign/partexercises.tex
>>>>> +++ b/SMPdesign/partexercises.tex
>>>>> @@ -84,6 +84,8 @@ there will be five forks available to four philosophers.
>>>>>  At least one of these four will have two forks, and will thus be able
>>>>>  to eat.
>>>>>  
>>>>> +\clearpage  //  Comment out to see the other option.  And move it around.
>>>>> +
>>>>>  This general technique of numbering resources and acquiring them in
>>>>>  numerical order is heavily used as a deadlock-prevention technique.
>>>>>  However, it is easy to imagine a sequence of events that will result
>>>>> @@ -107,8 +109,12 @@ philosophers to eat concurrently.
>>>>>  Please think about ways of partitioning the Dining Philosophers Problem
>>>>>  before reading further.
>>>>>  
>>>>> +\checkoddpage
>>>>> +\ifoddpage
>>>>> +\else
>>>>>  \clearpage
>>>>>  (Intentional blank page)
>>>>> +\fi
>>>>>  \clearpage
>>>>>  
>>>>>  \begin{figure}[tb]
>>>>>
