Return-Path: <SRS0=xSyG=IU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QVV6lYGbf4ATqjGpuj7j14Ozkwyqo7l6bg1GzQDYMco=;
        b=T4Fmeepbj0VWDr84KkECrhH+yj08OQKL5ygKnvsDku1THJ8n/bUZNn98rxyoRRz7kk
         x9ypspOqRYVIYwQw9PGpXNRyi8TrjASvLy2UY0bx6StRISFMRX2ZQVAts8rGKKIItTst
         7i8t4HeV4Q8UU3/voAqSL/0pmFSKap7NCLPfq7V0NaXk7Nw7ddLElgfbtCN2H2JKrNZE
         sUVEBCHcM2MVCTTxy1RelY+K4+PxD2LXBUzBmh3MJuR956O06VjZPicy3QiUty8eR5Pd
         DSu4z+S+V6QdoQybLM4I1AAUhGYmbxCnm18wgCuWl6FFoAiwg7xfe2cwTB6Y29Pqvg1E
         qAxA==
Subject: Re: [PATCH 3/3 -perfbook] debugging: Fix typo
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
 <bafeaad6-181b-e4cf-a2ef-588ea8268f02@gmail.com>
 <c623b30d-a732-1728-eceb-93501a49aa15@gmail.com>
 <20210320192323.GC2696@paulmck-ThinkPad-P72>
 <ef7aaa7b-52b4-8e83-0447-2d9a11338d80@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4b315531-c22a-1d57-ec29-470dc8c31b81@gmail.com>
Date: Mon, 22 Mar 2021 14:50:38 +0900
MIME-Version: 1.0
In-Reply-To: <ef7aaa7b-52b4-8e83-0447-2d9a11338d80@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 21 Mar 2021 10:03:49 +0900, Akira Yokosawa wrote:
> On Sat, 20 Mar 2021 12:23:23 -0700, Paul E. McKenney wrote:
>> On Sun, Mar 21, 2021 at 12:50:43AM +0900, Akira Yokosawa wrote:
>>> On Sun, 21 Mar 2021 00:24:46 +0900, Akira Yokosawa wrote:
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> ---
>>>>  debugging/debugging.tex | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
>>>> index fd52d9e7..3f697f58 100644
>>>> --- a/debugging/debugging.tex
>>>> +++ b/debugging/debugging.tex
>>>> @@ -755,7 +755,7 @@ access to data.
>>>>  The Kernel Concurrency Sanitizer (KCSAN)~\cite{JonathanCorbet2019KCSAN}
>>>>  uses existing markings such as \co{READ_ONCE()} and \co{WRITE_ONCE()}
>>>>  to determine which concurrent accesses deserve warning messages.
>>>> -KCSAN has a significant false-positive rate, especially in from the
>>>> +KCSAN has a significant false-positive rate, especially from the
>>>>  viewpoint of developers thinking in terms of C as assembly language
>>>>  with additional syntax.
>>>>  KCSAN therefore provides a \co{data_race()} construct to forgive
>>>>
>>>
>>> Paul,
>>>
>>> I caught this one while searching the usage of "data race" in perfbook.
>>> I thought "data race" also deserves an entry in Glossaries, especially
>>> because our use of "data race" is heavily related to compiler
>>> optimizations and somewhat stricter than the common definition
>>> found on the web.
>>>
>>> The first of data race in Section 4.2.2 (just before QQ4.8) does
>>> not (explicitly) talk about optimizations.
>>>
>>> Would it be possible for you to come up with some concise definition
>>> of data race which will fit as an entry in the Glossaries?
>>
>> How about like the following?
> 
> Looks good to me!

It looked good, but I've found that there is no mention of "marked access"
in the whole text (except for Glossaries) in perfbook at the moment.

"Marked access", "unmarked load", and so on are used in
ordering.txt to be added to LKMM documentation.
They are going to appear in perfbook, I suppose.

How about adding "Plain Access" to the Glossaries as well
and amend the definition of "Data Race" using "plain access".

        Thanks, Akira

> 
> Note on the index entry:
> 
> My experiment on the way to annotate index entries can manage automatic
> capitalization of only the first letter in indexed words/terms.
> So you won't need to take care of them.
> 
> And I'll get rid of direct uses of \index{} macro.
> 
> Will start rebasing those experiment soon after the release of
> second edition.
> 
>         Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
>> ------------------------------------------------------------------------
[...]
