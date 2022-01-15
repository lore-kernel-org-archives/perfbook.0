Return-Path: <SRS0=QDyR=R7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+wksIXgUHVwATE1Wh1adpGASwoICMGciiSUzj5h6L2w=;
        b=EtPYbHMzFFweO+liq0EQXnVlOkvwGl6DyylO9BI8NTDB6sFKqzlhu5fzWSRlc1e7Se
         lQWP2is9G6oyCN/63LYWY3q6DXQOIqggNOwfu+fWvRRqLHnVupbnMaIO9838YG/PyTQr
         bsepdxAQWYZIlCo5wESXtgVJXzjoHCK1pRnyLKRhmaXB54SE/ZrTop+H+5U0q8Og8QG1
         myLkN5s7lNbtMOWajEmTzbPJ1KGJNOJOLfoZxp1oZfCpctCbxArhE3Mc5zhnIGbdwVn7
         lR+0BH3IwoNCqeA/nULuNUU0loO6iuO5q15/2ONLJ3R97FBJYVC2gtpU2h1NMK+3Ze08
         Leaw==
Subject: Re: [PATCH RESEND -perfbook 00/10] Index and acronym updates
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
 <20220106161945.GK4202@paulmck-ThinkPad-P17-Gen-1>
 <20220108050704.GA909013@paulmck-ThinkPad-P17-Gen-1>
 <21fde8e3-13d5-28d5-2666-679cae9ae9cb@gmail.com>
 <20220114134728.GT947480@paulmck-ThinkPad-P17-Gen-1>
 <fbff40a8-2d6f-3852-7fc9-ea5054c84f68@gmail.com>
 <20220114214151.GA947480@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f2cc67a7-d70d-35eb-9f64-3e7de2d4548e@gmail.com>
Date: Sat, 15 Jan 2022 10:45:29 +0900
MIME-Version: 1.0
In-Reply-To: <20220114214151.GA947480@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 14 Jan 2022 13:41:51 -0800,
Paul E. McKenney wrote:
> On Fri, Jan 14, 2022 at 11:13:37PM +0900, Akira Yokosawa wrote:
>> On Fri, 14 Jan 2022 05:47:28 -0800,
>> Paul E. McKenney wrote:
>>> On Fri, Jan 14, 2022 at 07:11:51PM +0900, Akira Yokosawa wrote:
>>>> On Fri, 7 Jan 2022 21:07:04 -0800,
>>>> Paul E. McKenney wrote:
>>>>> On Thu, Jan 06, 2022 at 08:19:45AM -0800, Paul E. McKenney wrote:
>>>>>> On Thu, Jan 06, 2022 at 04:29:25PM +0900, Akira Yokosawa wrote:
>>>>>>> Hi Paul,
>>>>>>>
>>>>>>> This is another round of *never-ending* indexing updates.
>>>>>>
>>>>>> Maintaining indexes is non-trivial, no two ways about it!
>>>>>>
>>>>>> So special thanks for this series!
>>>>>>
>>>>>> At some point, for the index entries with lots of references, it may
>>>>>> be necesary to flag the most important references.  I sometimes see
>>>>>> such entries italicized or marked with "ff", though I freely confess
>>>>>> that I have no idea what the rationale for "ff" might be.
>>>>>
>>>>> And I did find this.  The "ff" stands for "folios following", where
>>>>> "folio" is used in the sense of "page".  So "368 ff" means "page 368
>>>>> and some number of subsequent pages."
>>>>>
>>>>> I have spent most of my life fooled into thinking that "ff" indicated
>>>>> the most significant page for a given index item.  But there is some
>>>>> connection, at least assuming that a longer discussion of a given term
>>>>> is a more significant discussion of that term.  ;-)
>>>>
>>>> So, prompted by your comment, I'm experimenting change of page number
>>>> styles referenced in index.
>>>>
>>>> You can see a WIP tree at:
>>>>
>>>> --------
>>>> The following changes since commit 6eca56ccde0839f4ea81c5f02ddbe4c7c97e225f:
>>>>
>>>>   Fix a typo in Bibliography (2022-01-12 09:48:13 -0800)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/akiyks/perfbook.git tags/WIP-index-page-style-2022.01.14
>>>>
>>>> for you to fetch changes up to cc9e388aee6cd72ed757fa0ec193b8e35f2bbaff:
>>>>
>>>>   index: Retouch prenote layout (2022-01-14 17:41:30 +0900)
>>>>
>>>> ----------------------------------------------------------------
>>>> Akira Yokosawa (6):
>>>>       Initial indexformat support
>>>>       locking, defer: POC of bold face page number in index
>>>>       defer: POC of hierarchical index with modifier part's case preserved
>>>>       index: Add prenotes of legends in Index pages
>>>>       index, glossary: Add underline for pages in Glossary
>>>>       index: Retouch prenote layout
>>>>
>>>>  defer/rcu.tex                  |   2 +-
>>>>  defer/rcufundamental.tex       |   2 +-
>>>>  defer/rcuintro.tex             |   2 +-
>>>>  glossary.tex                   | 176 ++++++++++++++++++++---------------------
>>>>  glsdict.tex                    |  10 ++-
>>>>  locking/locking.tex            |   4 +-
>>>>  perfbook-lt.tex                |  67 +++++++++++++++-
>>>>  utilities/adjustindexformat.pl |  20 +++++
>>>>  utilities/runlatex.sh          |   2 +
>>>>  9 files changed, 189 insertions(+), 96 deletions(-)
>>>>  create mode 100755 utilities/adjustindexformat.pl
>>>> --------
>>>>
>>>> This is not yet ready for pull.  I need to expand change logs
>>>> at least.
>>>>
>>>> If we were using plain \index{} macro for tagging terms, you could
>>>> say:
>>>>
>>>>     \index{some word|textit}
>>>>
>>>> to italicize its page number.
>>>> However, \IX{some word|textit} does not work.
>>>>
>>>> So I need to define a number of macros:
>>>>
>>>>   \IXB{}, \IXBh{}{}, ... -> Bold, for that "ff" case
>>>>   \IXG{}, \IXGh{}{}. ... -> Underline, for definitions in Glossary
>>>>
>>>> , and to use one of them where you want to emphasize.
>>>>
>>>> The "B" in \IXB came from "Bold", but actual style of emphasis can
>>>> be changed easily by redefining the \BF{} command.
>>>> \IXF{} might be a better name.  (Macro names embedded in .tex
>>>> files need to be stable.)
>>>
>>> I will play with this later today, Pacific Time, but in the meantime I
>>> just wanted to say that having the most significant page number in an
>>> index list be bold works just fine.  If we have bold, there is no need
>>> for italics!
>>
>> OK!   ;-)
>>
>> In case you encounter build errors while switching between
>> WIP- and master branches, "make clean" should help you.
> 
> I cheated and just cloned your repository separately.  ;-)
> 
>> Intermediate index-related files generated on a different branch
>> might be incompatible.
> 
> So underlined is the glossary and bold is a primary reference.
> 
> Looks quite reasonable to me, thank you!

Glad to know you like it! 

> 
> One other option for the glossary is to just give the page-number
> range in the note at the beginning of the glossary.  However, the
> underlining does seem more convenient for the reader.

The underlining was to show you that two or more emphasis style
is possible if necessary.  But I agree it is convenient.
Also, it makes terms without glossary entries more obvious.
You might find a term you'd like to add into glossary.

> 
> Should that note be shortened?
> 
> 	*Bold*: Major reference.
> 	_Underline_: Definition.
> 
> Given that there are examples of both on the first page, there should
> not be too much confusion.  (Famous last words...)

Yes, that should be enough.
I tend to be verbose composing in English...

Will respin and expand changelogs of other commits.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>> Furthermore, I have not figured out the way to make those
>>>> macros generate proper-format index entries in .idx file.
>>>> This is mostly because I'm not good at low-level TeX programming.
>>>>
>>>> So I added adjustindexformat.pl so that it can be amended before
>>>> fed into "makeindex".
>>>>
>>>> I'd like you to have a look at the changes and resulting looks of
>>>> Index pages.
>>>>
>>>> Any feedback is welcome!
>>>>
>>>>         Thanks, Akira
>>>>
>>>>>
>>>>> 							Thanx, Paul
>>>>>
