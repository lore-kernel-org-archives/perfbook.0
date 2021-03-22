Return-Path: <SRS0=xSyG=IU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cOTBhQ8m4hMHCzPcAgUbwzxtcKn+IokL+Z7+cThLeDA=;
        b=O4V25EyV+lYMgQKaGxYdDA26h1RfOACKPBYKZHXT6QCTXR9OF+LR59wO7ISwOQJDQv
         kB3MTp8eVQr8NUKPdsu+/AoxWRd57F1mKaHhPLLLvMU9AYkPOFMHlVszsrN58RnHMRxB
         /0qmjf33G6wCpgzhx0EMlBPxfha1o+HOphhi81uxUOhKqJBuGx2u64xQwS/Vvfw2t4Te
         6/2nvjLBtVGTMnuLfFiJMrwm/RtkT05CbfLXIZcGqYtAcVRcac5ofklUW2w1GM2fifZd
         7wN94suNKT6ra505FoO8hFL3cy8tQIAW7NqxPPmzmG65KQgtSa3qKnEDs/12b5phPFaf
         edrQ==
Subject: Re: [PATCH 3/3 -perfbook] debugging: Fix typo
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
 <bafeaad6-181b-e4cf-a2ef-588ea8268f02@gmail.com>
 <c623b30d-a732-1728-eceb-93501a49aa15@gmail.com>
 <20210320192323.GC2696@paulmck-ThinkPad-P72>
 <ef7aaa7b-52b4-8e83-0447-2d9a11338d80@gmail.com>
 <4b315531-c22a-1d57-ec29-470dc8c31b81@gmail.com>
 <20210322151514.GK2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1af27229-4e99-bc88-50c3-e184d077e148@gmail.com>
Date: Tue, 23 Mar 2021 07:49:50 +0900
MIME-Version: 1.0
In-Reply-To: <20210322151514.GK2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 22 Mar 2021 08:15:14 -0700, Paul E. McKenney wrote:
> On Mon, Mar 22, 2021 at 02:50:38PM +0900, Akira Yokosawa wrote:
>> On Sun, 21 Mar 2021 10:03:49 +0900, Akira Yokosawa wrote:
>>> On Sat, 20 Mar 2021 12:23:23 -0700, Paul E. McKenney wrote:
>>>> On Sun, Mar 21, 2021 at 12:50:43AM +0900, Akira Yokosawa wrote:
>>>>> On Sun, 21 Mar 2021 00:24:46 +0900, Akira Yokosawa wrote:
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>> ---
>>>>>>  debugging/debugging.tex | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
>>>>>> index fd52d9e7..3f697f58 100644
>>>>>> --- a/debugging/debugging.tex
>>>>>> +++ b/debugging/debugging.tex
>>>>>> @@ -755,7 +755,7 @@ access to data.
>>>>>>  The Kernel Concurrency Sanitizer (KCSAN)~\cite{JonathanCorbet2019KCSAN}
>>>>>>  uses existing markings such as \co{READ_ONCE()} and \co{WRITE_ONCE()}
>>>>>>  to determine which concurrent accesses deserve warning messages.
>>>>>> -KCSAN has a significant false-positive rate, especially in from the
>>>>>> +KCSAN has a significant false-positive rate, especially from the
>>>>>>  viewpoint of developers thinking in terms of C as assembly language
>>>>>>  with additional syntax.
>>>>>>  KCSAN therefore provides a \co{data_race()} construct to forgive
>>>>>>
>>>>>
>>>>> Paul,
>>>>>
>>>>> I caught this one while searching the usage of "data race" in perfbook.
>>>>> I thought "data race" also deserves an entry in Glossaries, especially
>>>>> because our use of "data race" is heavily related to compiler
>>>>> optimizations and somewhat stricter than the common definition
>>>>> found on the web.
>>>>>
>>>>> The first of data race in Section 4.2.2 (just before QQ4.8) does
>>>>> not (explicitly) talk about optimizations.
>>>>>
>>>>> Would it be possible for you to come up with some concise definition
>>>>> of data race which will fit as an entry in the Glossaries?
>>>>
>>>> How about like the following?
>>>
>>> Looks good to me!
>>
>> It looked good, but I've found that there is no mention of "marked access"
>> in the whole text (except for Glossaries) in perfbook at the moment.
>>
>> "Marked access", "unmarked load", and so on are used in
>> ordering.txt to be added to LKMM documentation.
>> They are going to appear in perfbook, I suppose.
>>
>> How about adding "Plain Access" to the Glossaries as well
>> and amend the definition of "Data Race" using "plain access".
> 
> Good point!  Like this?

Thank you!

However, this patch conflicts with the removal of \index{} in glossary.tex
on my WIP branch.
Do you mind if I cherry pick it & rebase on the WIP branch, and
send you a pull request containing it later (maybe in a week or so)?

        Thanks, Akira

> 
> 						Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit b91c52cd1a93777ba91300d739e498bae9c49aea
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Mon Mar 22 08:13:24 2021 -0700
> 
>     Glossary: Add an entry for "Plain Access"
>     
>     The book uses "plain access", so it deserves a glossary entry.
>     And of course "marked access" is its antonym, more or less.
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/glossary.tex b/glossary.tex
> index e6aa612..bbef382 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -174,11 +174,11 @@
>  	A race condition in which several CPUs or threads access
>  	a variable concurrently, and in which at least one of those
>  	accesses is a store and at least one of those accesses
> -	is unmarked.
> +	is a plain access.
>  	It is important to note that while the presence of data races
>  	often indicates the presence of bugs, the absence of data races
>  	in no way implies the absence of bugs.
> -	(See ``Marked access''.)
> +	(See ``Plain access''.)
>  \item[Deadlock Free:]\index{Deadlock free}
>  	A forward-progress guarantee in which, in the absence of
>  	failures, at least one thread makes progress within a finite
> @@ -301,9 +301,9 @@
>  	macro, such as \co{READ_ONCE()}, \co{WRITE_ONCE()},
>  	\co{atomic_inc()}, and so on, in order to protect that access
>  	from compiler and/or hardware optimizations.
> -	In contrast, an unmarked access simply mentions the name of
> +	In contrast, a plain access simply mentions the name of
>  	the object being accessed, so that in the following, line~2
> -	is the unmarked equivalent of line~1:
> +	is the plain-access equivalent of line~1:
>  	\begin{VerbatimN}
>  	WRITE_ONCE(a, READ_ONCE(b) + READ_ONCE(c));
>  	a = b + c;
> @@ -393,6 +393,10 @@
>  	In the 1960s through the early 1980s, pipelined CPUs were the
>  	province of supercomputers, but started appearing in microprocessors
>  	(such as the 80486) in the late 1980s.
> +\item[Plain Access:]\index{Plain access}
> +	A source-code memory access that simply mentions the name of
> +	the object being accessed.
> +	(See ``Marked access''.)
>  \item[Process Consistency:]\index{Process consistency}
>  	A memory-consistency model in which each CPU's stores appear to
>  	occur in program order, but in which different CPUs might see
> 
