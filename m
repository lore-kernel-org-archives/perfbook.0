Return-Path: <SRS0=ifrB=LG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IPyHKcdjFbLO0Po9mpEVoW3LRyWpSgTt8WdNrnx6ARY=;
        b=XXzlFNzEzmFpaelfwfyrBXIDpMqJcQ/yzHnoDGI9vPL1m28v5or/1xx95oeqb2coJc
         SQjkRG6SDsvRAs4Ct/8twxf/KCnCT0lVuq2O38qCfP2NamXWNyUYxKu8unhx+Rxu8Lro
         1clsxUAEA5K1XqmlW+ViP93TNn7vS8LZONaRL5YQRvykeR1PwdQ9qYgIEIdQfJh9Pj7j
         5RDalwGa1LbRHb0DQL7jJUW3FZLP4aykBSEJHR2cadz2dG+ccmrc/c0MmKSS+fWyHEbO
         zjzMwpo5rm8ph6HVyLdIaufgOCOCKCgwmEnEqhupFmVvtVnsFywdhBAwU38Qqo8E1p2t
         mpsQ==
Subject: Re: [GIT PULL -perfbook] Add checks with regard to punctuation marks
References: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
 <20210609192347.GJ4397@paulmck-ThinkPad-P17-Gen-1>
 <a213855a-3357-0217-0973-cc76b11d40ad@gmail.com>
 <20210610212617.GW4397@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b94fd29f-66a5-b4c8-cca5-6f81a75f20a7@gmail.com>
Date: Sat, 12 Jun 2021 15:11:49 +0900
MIME-Version: 1.0
In-Reply-To: <20210610212617.GW4397@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 10 Jun 2021 14:26:17 -0700, Paul E. McKenney wrote:
> On Thu, Jun 10, 2021 at 10:28:35AM +0900, Akira Yokosawa wrote:
>> On Wed, 9 Jun 2021 12:23:47 -0700, Paul E. McKenney wrote:
>>> On Wed, Jun 09, 2021 at 11:59:42AM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> It took a while for me to sort out the spacing width after punctuation
>>>> marks.
>>>
>>> Thank you very much for doing all of this!
>>>
>> [...]
>>>> All the offending patterns in LaTeX sources have fixed.
>>>>
>>>> Finally "make" will run both periodcheck and cleverefcheck.
>>>
>>> Very good!!!
>>>
>>>> As for colons, I'm not sure what is your preference with regard
>>>> to capitalization of the next words and the spacing width after
>>>> them, so no check is done at the moment.
>>>>  
>>>> If you have some preference, I can update the scripts to enforce
>>>> it.
>>>
>>> In this case, I prefer the simple British approach to that of my
>>> homeland, so please unconditionally capitalize after a colon.
>>>
>>> (Instead of the American approach of doing so only if the word following
>>> the colon begins a complete sentence, which is not something I want to
>>> be checking manually, let alone via a script!)
>>
>> Please find a tentative patch below showing you how the changes would
>> look like.
>>
>> Does this look reasonable to you?
>>
>> A couple of notes:
>>
>> o In epigraph of Alice in Wonderland, I see trailing "\\"s
>>   can indicate the rule to put ":"s at the end of lines is
>>   knowingly broken.  I can add a rule to ignore any violations
>>   on a line who has trailing "\\" (even in a comment area).
> 
> Could the "\\"s could be moved to the beginning of the next line?

Please see comment below.

> 
>> o One of the hunks in cpu/hwfreelunch.tex
>>
>>> @@ -167,8 +167,8 @@ That said, they may be necessary steps on the path to the late Jim Gray's
>>>  \label{sec:cpu:Novel Materials and Processes}
>>>  
>>>  Stephen Hawking is said to have claimed that semiconductor manufacturers
>>> -have but two fundamental problems: (1) the finite speed of light and
>>> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
>>> +have but two fundamental problems:\@ (1)~the finite speed of light and
> 
> Now that you mention it, would it work to just put a linebreak after the
> ":"?

OK.

> 
>>> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.
>>>  It is possible that semiconductor manufacturers are approaching these
>>>  limits, but there are nevertheless a few avenues of research and
>>> development focused on working around these fundamental limits.
>>
>> keeps lower-case words after (1) and (2) as they are just short
>> phrases.
> 
> But it would be fine to capitalize those two instances of "the" and
> probably simpler all around.
> 
>> And the space after the colon is normal-width.
>> Do you like capital words and double spacing?
> 
> I am not worried about spacing unless it is a monospace font, but
> other than comments in code, we should have few if any instances of
> end-of-sentence punctuation set in monospace fonts.

As far as input lines break after colons, and the following words
are capitalized, the spacing will become always wider.

> 
>>         Thanks, Akira
>>
>> -----------8<-----------
>> Subject: [PATCH] howto, intro, cpu: Capitalize words after colon
>>
>> And make colons at the end of input lines.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  cpu/cpu.tex         |  5 +++--
>>  cpu/hwfreelunch.tex | 17 ++++++++++-------
>>  cpu/overheads.tex   |  5 +++--
>>  cpu/overview.tex    |  8 +++++---
>>  howto/howto.tex     |  8 ++++----
>>  intro/intro.tex     | 28 ++++++++++++++--------------
>>  6 files changed, 39 insertions(+), 32 deletions(-)
>>

[...]

>> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
>> index 92f04f16..01d3dddd 100644
>> --- a/cpu/hwfreelunch.tex
>> +++ b/cpu/hwfreelunch.tex
>> @@ -167,8 +167,8 @@ That said, they may be necessary steps on the path to the late Jim Gray's
>>  \label{sec:cpu:Novel Materials and Processes}
>>  
>>  Stephen Hawking is said to have claimed that semiconductor manufacturers
>> -have but two fundamental problems: (1) the finite speed of light and
>> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
>> +have but two fundamental problems:\@ (1)~the finite speed of light and
>> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.
> 
> This would be just fine:
> 
> 	Stephen Hawking is said to have claimed that semiconductor
> 	manufacturers have but two fundamental problems:
> 	(1) The finite speed of light and
> 	(2) the atomic nature of matter~\cite{BryanGardiner2007}.
> 

OK, I'll stick with this convention.

>>  It is possible that semiconductor manufacturers are approaching these
>>  limits, but there are nevertheless a few avenues of research and
>>  development focused on working around these fundamental limits.
[...]
>>  In both cases, the relevant latencies can be thought of as a cost of
>> diff --git a/howto/howto.tex b/howto/howto.tex
>> index 0f0ba293..54447c4e 100644
>> --- a/howto/howto.tex
>> +++ b/howto/howto.tex
>> @@ -50,7 +50,7 @@ that it has brought to us!
>>  	  Alice: Which way should I go? \\
>>  	  Cat: That depends on where you are going. \\
>>  	  Alice: I don't know. \\
>> -	  Cat: Then it doesn't matter which way you go.}
>> +	  Cat: Then it doesn't matter which way you go.} % \\
>>  	 {\emph{Lewis Carroll, Alice in Wonderland}}
> 
> Would this work?
> 
> 	  Alice: Which way should I go? \\
> 	  \\ Cat: That depends on where you are going.
> 	  \\ Alice: I don't know.
> 	  \\ Cat: Then it doesn't matter which way you go.}
> 	 {\emph{Lewis Carroll, Alice in Wonderland}}
> 

Unfortunately, this is rejected by \epigraph{} macro due to
the empty line caused by the successive "\\ \\" in the first and
second lines.  The error message I see is:

    ! LaTeX Error: There's no line here to end.

    See the LaTeX manual or LaTeX Companion for explanation.
    Type  H <return>  for immediate help.
     ...                                              
                                                  
    l.59 	 {\emph{Lewis Carroll, Alice in Wonderland}}
                                                  
    ? 
    ! Emergency stop.

Also, using "\\" as an exception hint might cause unexpected
false negatives.

So, I'll put line breaks after colons in this epigraph.
 
>>  This book is a handbook of widely applicable and heavily
>> @@ -359,7 +359,7 @@ Fortunately, there are many alternatives available to you:
>>  	thorough and accessible introduction with a good set of
>>  	examples.
>>  \item	If you are interested in C++11, you might like
>> -	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action: Practical
>> +	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action:\@ Practical
>>  	Multithreading''~\cite{AnthonyWilliams2012,AnthonyWilliams2019}.
> 
> A line break after the colon in the title would be just fine.

OK.

> 
>>  \item	If you are interested in C++, but in a Windows environment,
>>  	you might try \ppl{Herb}{Sutter}'s ``Effective Concurrency''

>> @@ -939,9 +939,9 @@ available hardware and restore performance and scalabilty.
>>  Although partitioning can greatly improve performance and scalability,
>>  it can also increase complexity.
>>  For example, partitioning can complicate handling of global
>> -errors and events: A parallel
>> -program may need to carry out non-trivial synchronization in order
>> -to safely process such global events.
>> +errors and events:
>> +A parallel program may need to carry out non-trivial synchronization
>> +in order to safely process such global events.
> 
> Looks good!

I'm sending a v2 of the patch soon as a reply to this message.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>  More generally, each partition requires some sort of communication:
>>  After all, if
>>  a given thread did not communicate at all, it would have no effect and
>> -- 
>> 2.17.1
>>
>>
