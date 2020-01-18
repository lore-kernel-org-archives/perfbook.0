Return-Path: <SRS0=qHCL=3H=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fnF6flL+vSKdCqdPoYQe54GGbQLF+StS926FSilDwAA=;
        b=rNisfvZ1JdZxV/AmtdNiLWAzzixLxKpquIlmf/4T2txVDzA/iiG0BX5SoFI9DrXwK3
         a3gZLqKNbzGjlf16PcekEbjbrroMhEbj/yQ/ko1uoBm/ZRMrBlV8OKlp9X67FyflZ3DF
         PHFZTbWnqnqBTSc5QjkMO24bQ/f0YuVgmmoCKXhFGqrDh4leHbhjH6Q1Hbead75VkIFj
         SStJQvuSK5btXdFwY+D4VRgXWP8RhVysNWtaGs40Cm4JrhNsw+Sfx1/obo2QTDpYtnwr
         8leCLl6Llug6X/4o0hd2tr3fXyIx2kLNu71OfJZ8oFrCJKXIr6o0YfuiT2JlHm8XTeZW
         0uFg==
Subject: Re: [PATCH 2/3] howto: Fix typo
References: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
 <7d340ee9-e333-67f5-863f-9d81fbf068db@gmail.com>
 <20200117033608.GD2935@paulmck-ThinkPad-P72>
 <8ec9dd6b-429b-a777-b453-a979c050805b@gmail.com>
 <20200118194213.GV2935@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5bc21732-1575-78bf-e0a9-63f23b0092a2@gmail.com>
Date: Sun, 19 Jan 2020 08:11:48 +0900
MIME-Version: 1.0
In-Reply-To: <20200118194213.GV2935@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 18 Jan 2020 11:42:13 -0800, Paul E. McKenney wrote:
> On Sat, Jan 18, 2020 at 07:52:29PM +0900, Akira Yokosawa wrote:
>> On Thu, 16 Jan 2020 19:36:08 -0800, Paul E. McKenney wrote:
>>> On Fri, Jan 17, 2020 at 06:59:10AM +0900, Akira Yokosawa wrote:
>>>> >From cd352d3dfd20d8fcfdddafe5547ad191cbdda37e Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Mon, 13 Jan 2020 16:18:19 +0900
>>>> Subject: [PATCH 2/3] howto: Fix typo
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>
>>> I took the other two, thank you very much!
>>>
>>> I treated this one as a bug report, again, thank you!  Please see below
>>> for the corresponding commit.  Thoughts?
>>
>> Please find inline comments below.
>>
>>>
>>> 							Thanx, Paul
>>>
>>>> ---
>>>>  howto/howto.tex | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/howto/howto.tex b/howto/howto.tex
>>>> index bbdacbf1..fe80cca8 100644
>>>> --- a/howto/howto.tex
>>>> +++ b/howto/howto.tex
>>>> @@ -23,7 +23,7 @@ Parallel programming is not as hard as some say, and we hope
>>>>  that this book makes your parallel-programming projects easier and
>>>>  more fun.
>>>>  
>>>> -In short, where parallel programming once focused on science, research,
>>>> +In short, while parallel programming once focused on science, research,
>>>>  and grand-challenge projects, it is quickly becoming an engineering
>>>>  discipline.
>>>>  We therefore examine specific parallel-programming tasks
>>>> -- 
>>>> 2.17.1
>>>
>>> ------------------------------------------------------------------------
>>>
>>> commit b094718ddbe4256e606a41c660b4d4f1836baa66
>>> Author: Paul E. McKenney <paulmck@kernel.org>
>>> Date:   Thu Jan 16 19:31:26 2020 -0800
>>>
>>>     howto: Word parallel-programming-as-engineering less obscurely
>>>     
>>>     The "where ... once ... becoming" wording might be legal English, it
>>>     is a bit obscure and less than friendly to those whose native language
>>>     is not English.  This commit therefore rewrites the offending paragraph.
>>>     
>>>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>>>
>>> diff --git a/howto/howto.tex b/howto/howto.tex
>>> index bbdacbf..8a93774 100644
>>> --- a/howto/howto.tex
>>> +++ b/howto/howto.tex
>>> @@ -23,11 +23,12 @@ Parallel programming is not as hard as some say, and we hope
>>>  that this book makes your parallel-programming projects easier and
>>>  more fun.
>>>  
>>> -In short, where parallel programming once focused on science, research,
>>> -and grand-challenge projects, it is quickly becoming an engineering
>>> -discipline.
>>> -We therefore examine specific parallel-programming tasks
>>> -and describe how to approach them.
>>> +In short, the focus of parallel programming is quickly shifting away
>>> +from science, research, and grand-challenge projects.
>>> +And this is all to the good, because it means that parallel programming
>>> +is finally becoming an engineering discipline.
>>> +Therefore, as befits an engineering discipline, this book examines
>>> +specific parallel-programming tasks and describes how to approach them.
>>>  In some surprisingly common cases, they can even be automated.
>>
>> Well, nowadays, you can try "google translate".
>> It recognizes the use of "where" as a subordinate conjunction in the
>> original paragraph.
> 
> Huh.  I didn't realize that Google Translate could recognize parts of
> speech.  That would be quite nice!  Except that I am still not seeing
> how to make it do that.  What is the trick?

When you select English -> Japanese, it is translated most of the time
as the same as

    In short, although parallel programming once focused on science,
    research, and grand-challenge projects, it is quickly becoming
    an engineering discipline.

"Most of the time" is due to the variation of translation for their
machine learning purposes.

English -> Spanish translation simply maps "where" to "donde".
"Donde" does not mean "although" in Spanish, I guess.

Translation between European languages tends to be better than
that involving Japanese (especially regarding the delicate choice of
particles such as "ha" and "ga"), but not in this case.

> 
> Or was the trick for you to translate it into Japanese and used your
> knowledge of Japanese and Google Translate's mapping of words and phrases
> to identify the part of speech?
> 
>> I don't know why such a use case of "where" is not on my dictionary...
> 
> I have a printed copy of The Shorter Oxford English Dictionary (the
> larger version was more than ten dictionary-sized volumes back in
> the mid-1970s), and it says in definition B4:
> 
> 	Introducing a clause as obj. of the verb or preposition, or
> 	as a predicate: orig., a case in which, a person to whom
> 	(now only spec. as the object of love or marriage): now,
> 	the respect or particular in which.
> 
> So my use is a bit old-fashioned, which might be why it is not in
> your dictionary.  But I have the hair color to match old fashioned,
> so maybe it was OK while it lasted.  ;-)

In https://en.wiktionary.org/wiki/where#English,
1st entry in Conjunction reads:

    1. While on the contrary; although; whereas.

It has a few quotations which match the pattern in question.

> 
>> And saying "shifting away from" could be misleading because "science,
>> research, and grand-challenge projects" are still driving parallel
>> programming.
> 
> Excellent point, thank you!  I certainly should not unnecessarily alienate
> people in those fields.
> 
>> So maybe it might be better to revert this change, or to rephrase some more.
> 
> How about the following instead?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 64cf378960689deef3d23359eaddea9a21ee683d
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Thu Jan 16 19:31:26 2020 -0800
> 
>     howto: Word parallel-programming-as-engineering less obscurely
>     
>     The "where ... once ... becoming" wording might be legal English, it
>     is a bit obscure and less than friendly to those whose native language
>     is not English.  This commit therefore rewrites the offending paragraph.
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index bbdacbf..9d73269 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -23,11 +23,12 @@ Parallel programming is not as hard as some say, and we hope
>  that this book makes your parallel-programming projects easier and
>  more fun.
>  
> -In short, where parallel programming once focused on science, research,
> -and grand-challenge projects, it is quickly becoming an engineering
> -discipline.
> -We therefore examine specific parallel-programming tasks
> -and describe how to approach them.
> +In short, parallel programming is no longer focused solely on science,
> +research, and grand-challenge projects.
> +And this is all to the good, because it means that parallel programming
> +is finally becoming an engineering discipline.
> +Therefore, as befits an engineering discipline, this book examines
> +specific parallel-programming tasks and describes how to approach them.

Looks good to me!

        Thanks, Akira

>  In some surprisingly common cases, they can even be automated.
>  
>  This book is written in the hope that presenting the engineering
> 
