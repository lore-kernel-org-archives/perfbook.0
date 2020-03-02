Return-Path: <SRS0=Xnsi=4T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EBTc3Dhs8VjXsOir3ujDkNiqpamxb6Kr5Pf5206uLxw=;
        b=TZk+bBy7ke4vTgsM8NOuI+9OkbIMN1V2K9LmWh2kLF4+AgxqFcSxl1rZBvy0/o/SFi
         LAvwgztCfMgXvkieXwPuFr5dSIok3Vr+pV2Z3dm53/ZwBFD26bdWt16cmNQN86Ydctv8
         bzP+NtGHk/A93wZ1acVawZu2N+AwXUpbK3P6amEIg3Iqd/xOYCvFIH/LZLjNIFCD7RPd
         K0ipsKVTvqRC4CtO3BAXyXxHvA1dc1RkO0b15p+lmZzVjgjb38qyAdf2ftIjx6GgLXYC
         LVlwp+nqSr7tuU4YGvPIwek7fdiX899OwRi3kj814JVFNECFYWbviWMkEF9pRlupQw1r
         njPw==
Subject: Re: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz
 heading
References: <90c17ed1-2a89-d270-c7ca-3668ef52d3dd@gmail.com>
 <20200301175132.GS2935@paulmck-ThinkPad-P72>
 <386c8d0e-7b5e-ffa1-398e-4a81a6e769ac@gmail.com>
 <20200301230924.GB2935@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c7b7b8d5-8bbd-08ba-6358-9bfd63879097@gmail.com>
Date: Tue, 3 Mar 2020 00:10:41 +0900
MIME-Version: 1.0
In-Reply-To: <20200301230924.GB2935@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 1 Mar 2020 15:09:24 -0800, Paul E. McKenney wrote:
> On Mon, Mar 02, 2020 at 07:43:40AM +0900, Akira Yokosawa wrote:
>> On Sun, 1 Mar 2020 09:51:32 -0800, Paul E. McKenney wrote:
>>> On Mon, Mar 02, 2020 at 12:02:01AM +0900, Akira Yokosawa wrote:
>>>> >From 2c4fd06827d075a04c157d150cf036db1615f268 Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Sun, 1 Mar 2020 21:47:45 +0900
>>>> Subject: [PATCH] qqz.sty: Permit column/page break in front of Quick Quiz heading
>>>>
>>>> It turned out that the definition of \QuickQuiz needs an explicit
>>>> hint (\goodbreak) for LaTeX to be able to break column/page in front
>>>> of it.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>
>>> Nice!
>>>
>>> Does it make sense to also add \goodbreak at the end of a Quick Quiz,
>>> perhaps as follows?  Doing so gets QQ2.11 all on one page in the
>>> two-column version.
>>>
>>> Does it also make sense to encourage page breaks at the beginnings of
>>> Quick Quizzes in the answer chapter?
>>>
>>> In other words, should I fold the diff below into your diff, or would
>>> doing so break something?
>>
>> 2nd hunk causes the headings of Sections E.3, E.5, E.10, E.13, E.17,
>> and E.20 to be at the bottom.  So please just apply the first hunk.
>> Also, the title and the change log need some adjustment.
> 
> Good point, and done!  Queued and pushed.
> 
> I suspect that an appropriate "\if" statement would repair the second
> hunk, but on the other hand, having quick quizzes broken across lines
> in the answer section isn't as jarring as in the main body of the text.

My guess is that the \par command in the beginning of \QuickQ implies
breakable point and the extra \goodbreak confused the TeX engine.

What you want is to keep an Answer to a Quick Quiz to be in the same
column/page as much as possible?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>> ------------------------------------------------------------------------
>>>
>>> diff --git a/qqz.sty b/qqz.sty
>>> index 4dd411f..8bd80d9 100644
>>> --- a/qqz.sty
>>> +++ b/qqz.sty
>>> @@ -39,7 +39,7 @@
>>>  	\refstepcounter{quickquizctrE}%
>>>  	\hyperref[QQA.\thechapter.\thequickquizctr]{\rule{7pt}{7pt}}%
>>>  	\label{QQE.\thechapter.\thequickquizctrE}}
>>> -\newcommand{\QuickQuizEnd}{}
>>> +\newcommand{\QuickQuizEnd}{\goodbreak}
>>>  
>>>  % To create a macro referencing the previously defined quick quiz:
>>>  %	\QuickQuizLabel{\QQname}
>>> @@ -80,7 +80,7 @@
>>>  \newcommand{\QuickQ}[1]{
>>>  	\par
>>>  	\refstepcounter{quickquizctrC}%
>>> -	\noindent
>>> +	\goodbreak\noindent
>>>  	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
>>>  
>>>  \newcommand{\QuickA}[1]{%
>>>
