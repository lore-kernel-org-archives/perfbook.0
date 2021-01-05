Return-Path: <SRS0=HPzZ=GI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MM8rj0y8w8VbBJZnqgZKfiQ4UlZrEDFJD9KSOUsxJc0=;
        b=EQLqiqY9mgYlkB3zhxnoCO6oV6SqYMfNokrpi4sID67K07C+6W4gyRXRC4eg1dOlTj
         KQyB3m/GxmeHx2IYzrRuc0FzvrfJXJoKjp2pTKKizSMJiIN13qWGFi3s0sH0leUFaQIl
         XZV2VkWapI6jsRczbTYyYx+Jjr0Y6AeyBpf9r39kypH8syPY8s+GhI42OAkKCOJzxan2
         YMxhrrc1dEJP2vRa/xh43zbUX/lA2qTCdlwKIzmCi3aJ9DDDiNSIhQAoCj4nYbqnk382
         sMZnzkbYkdZ+EsG2r3OI4gVzSbcGkvsFEWtVLY6WbsxQnCi74IHSOTCCJpzI47+IrOEQ
         EjPg==
Subject: Re: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
References: <6e41a126-f08e-5ad2-3667-416cea540627@gmail.com>
 <20210105145353.GC17086@paulmck-ThinkPad-P72>
 <bef949af-a733-8024-f6e7-279036bf1045@gmail.com>
 <20210105160744.GE17086@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ee30206d-0a78-608c-e1e5-1d55e8b6467f@gmail.com>
Date: Wed, 6 Jan 2021 07:36:10 +0900
MIME-Version: 1.0
In-Reply-To: <20210105160744.GE17086@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 5 Jan 2021 08:07:44 -0800, Paul E. McKenney wrote:
> On Wed, Jan 06, 2021 at 12:11:25AM +0900, Akira Yokosawa wrote:
>> On Tue, 5 Jan 2021 06:53:53 -0800, Paul E. McKenney wrote:
>>> On Tue, Jan 05, 2021 at 09:23:11AM +0900, Akira Yokosawa wrote:
>>>> >From e98f36b3a91d406c2375863dc003727bc8153f4f Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Mon, 4 Jan 2021 21:14:10 +0900
>>>> Subject: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
>>>>
>>>> Quick Quizzes in this section should be presented in "nq" builds.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>
>>> Applied and pushed, thank you!
>>>
>>> However, "make nq" is giving me framed quick quiz questions rather
>>> than the small-font indicators that were there at some time.
>>
>> Well, what you are seeing is the intention of this patch.
>>
>> As the opening sentence of this section says:
>>
>>     This section is organized as a series of Quick Quizzes that
>>     invite you to apply RCU to a number of examples ...
>>
>> , I thought the quiz parts of QQs 9.59 and 9.60 should be presented
>> inline in Section 9.5.6 rather than the small markers.
>>
>> They are similar to the QQs in the beginning of Chapter 5.
>>
>> Does this make sense?
> 
> Yes, it does, and I am good with QQs 9.59 and 9.60 being presented inline.
> But did you intend that QQ 9.34-9.38 on page 146 (PDF page 158) to also
> be displayed inline?

No, I didn't.

On my nq build, QQs 9.34-9.38 are on pages 179-181 (PDF pages 191-193)
and they are _not_ displayed inline.

Both TeX Live 2017/Debian and up-to-date TeX Live 2020 give me the same
result.

The page count difference suggests something is broken on your side.

Hmm???

        Thanks, Akira

> 
> Again, this might be the fault of my old tools:
> 
> $ pdflatex --version
> pdfTeX 3.14159265-2.6-1.40.18 (TeX Live 2017/Debian)
> kpathsea version 6.2.3
> Copyright 2017 Han The Thanh (pdfTeX) et al.
> There is NO warranty.  Redistribution of this software is
> covered by the terms of both the pdfTeX copyright and
> the Lesser GNU General Public License.
> For more information about these matters, see the file
> named COPYING and the pdfTeX source.
> Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
> Compiled with libpng 1.6.34; using libpng 1.6.34
> Compiled with zlib 1.2.11; using zlib 1.2.11
> Compiled with poppler version 0.62.0
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>                                                               This
>>> might be the fault of my tools, and I will be upgrading soon anyway.
>>> But I figured I should let you know.
>>>
>>> 							Thanx, Paul
>>>
>>>> ---
>>>>  defer/rcuexercises.tex | 16 +++++++---------
>>>>  1 file changed, 7 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
>>>> index 9438c9e5..476819a9 100644
>>>> --- a/defer/rcuexercises.tex
>>>> +++ b/defer/rcuexercises.tex
>>>> @@ -13,8 +13,7 @@ The \co{rcu_read_lock()}, \co{rcu_read_unlock()}, \co{rcu_dereference()},
>>>>  \co{rcu_assign_pointer()}, and \co{synchronize_rcu()} primitives should
>>>>  suffice for most of these exercises.
>>>>  
>>>> -\QuickQuizSeries{%
>>>> -\QuickQuizB{
>>>> +\EQuickQuiz{
>>>>  	The statistical-counter implementation shown in
>>>>  	Listing~\ref{lst:count:Per-Thread Statistical Counters}
>>>>  	(\path{count_end.c})
>>>> @@ -25,7 +24,7 @@ suffice for most of these exercises.
>>>>  	(Keep in mind that \co{read_count()}'s scalability will
>>>>  	necessarily be limited by its need to scan all threads'
>>>>  	counters.)
>>>> -}\QuickQuizAnswerB{
>>>> +}\EQuickQuizAnswer{
>>>>  	Hint: place the global variable \co{finalcount} and the
>>>>  	array \co{counterp[]} into a single RCU-protected struct.
>>>>  	At initialization time, this structure would be allocated
>>>> @@ -59,9 +58,9 @@ suffice for most of these exercises.
>>>>  	on
>>>>  	page~\pageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
>>>>  	for more details.
>>>> -}\QuickQuizEndB
>>>> -%
>>>> -\QuickQuizE{
>>>> +}\EQuickQuizEnd
>>>> +
>>>> +\EQuickQuiz{
>>>>  	Section~\ref{sec:count:Applying Exact Limit Counters}
>>>>  	showed a fanciful pair of code fragments that dealt with counting
>>>>  	I/O accesses to removable devices.
>>>> @@ -73,7 +72,7 @@ suffice for most of these exercises.
>>>>  	(Keep in mind that the performance of the common-case first
>>>>  	code fragment that does I/O accesses is much more important
>>>>  	than that of the device-removal code fragment.)
>>>> -}\QuickQuizAnswerE{
>>>> +}\EQuickQuizAnswer{
>>>>  	Hint: replace the read-acquisitions of the reader-writer lock
>>>>  	with RCU read-side critical sections, then adjust the
>>>>  	device-removal code fragment to suit.
>>>> @@ -83,5 +82,4 @@ suffice for most of these exercises.
>>>>  	on
>>>>  	Page~\pageref{sec:together:RCU and Counters for Removable I/O Devices}
>>>>  	for one solution to this problem.
>>>> -}\QuickQuizEndE
>>>> -}
>>>> +}\EQuickQuizEnd
>>>> -- 
>>>> 2.17.1
>>>>
