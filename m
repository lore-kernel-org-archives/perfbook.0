Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=t1fdVfW55Oc4v6qIqot04OqCh7hK6Z5DP+c7Hpi7Kcw=;
 b=lHqkivc5YsEpc4Uh6n241ekXUZXlhbG5jnF6296wfyXyr7ioVh4PwmIEoJ6YvKWetN
 p5aMG5XTLSG4n2hZzxB2r8l7f/tyCjblDOafiz+OQIblyr5HnEzNRFn/+Y9+iSoyU3+6
 7DSwYcI3rHGiiXfhZ4vnAbOamBZVTGBcylG6Fj7Iac8fuzUmJ4+GjvLlFpbgEXHFim1R
 Huwm7frhNEQFOvnxT/Dx1It5+z/4a3+2jBqDN4kKUCX7spIFmet6QM35/H6ybZ/824a3
 3fC1TDUgQw/ogjKRmDMtgmGYlhCVzR4yHwBAl42/o4+ITrhQMWiTzOggpHzr7F3fAv2d
 WFgw==
Subject: Re: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
References: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
 <20161227205345.GO3742@linux.vnet.ibm.com>
 <111de212-9aeb-95b8-4e72-9edef7cff417@gmail.com>
 <20161229035603.GB3742@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6b64461f-0351-2b58-efb8-79d7a09f0edf@gmail.com>
Date: Sat, 31 Dec 2016 00:33:13 +0900
MIME-Version: 1.0
In-Reply-To: <20161229035603.GB3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/28 19:56:03 -0800, Paul E. McKenney wrote:
> On Wed, Dec 28, 2016 at 07:07:28AM +0900, Akira Yokosawa wrote:
>> On 2016/12/27 12:53:45 -0800, Paul E. McKenney wrote:
>>> On Wed, Dec 28, 2016 at 12:25:48AM +0900, Akira Yokosawa wrote:
>>>> >From 3f4f73d738b77422bd074322f3ac67f644a8d580 Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Wed, 28 Dec 2016 00:10:28 +0900
>>>> Subject: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
>>>>
>>>> Hi Paul,
>>>>
>>>> On 2016/12/26 16:39:52 -0800, Paul E. McKenney wrote:
>>>>> On Mon, Dec 26, 2016 at 11:52:40PM +0900, Akira Yokosawa wrote:
>>>> [snip]
>>>>>> One idea is to use alphapf.bst only for 1c with inlinelinks enabled. 
>>>>>>
>>>>>> Thoughts?
>>>>>
>>>>> I am good with enabling alphaph.bst inlinelinks only for 1c!
>>>>
>>>> So, this patch set does the change.
>>>> For 2c, we reverted to the original alpha bibliography style for the
>>>> moment.
>>>> And I'll keep polishing the band-aid script to shorten the href-ed part
>>>> in titles. You might want to try it for 2c when you do a release.
>>>
>>> Applied and pushed, thank you!
>>>
>>> Speaking of releases, for whatever it is worth, I expect to do one
>>> in a few days.
>>
>> Every 6 month!
>>
>> At the current state of ongoing bibliography update, I don't think
>> it makes much difference if you try inlinelinks for 2c.
>> Or, will you apply the "bib-append-dio" series this time?
>> Then it might be worthwhile. You can replace the released .pdf with
>> inlinelinks enabled after the fact.
>>
>> I have readied other branches of url updates of .bib files, but I thought
>> I should wait and send their pull request after the doi updates are applied.
>> If you are willing to apply the other (lot of) updates for the next release,
>> I can send the pull requests soon. But it is not urgent.
>>
>> By the way, I want the "courier scaled" font to be default monospace
>> font for 2c and 1c builds. Have you tried the "mss" target lately?
>> If you are ok with it, I'll prepare a patch to do so.
> 
> It does build, but what am I looking for?  Does it allow me to remove
> the bogus "~" characters in some of the tables containing \co{}?

JFYI, those bogus "~" characters have nothing to do with the choice of
monospace font.
It is the \co{} command (or the \lstinline command it uses) that confuses
tabular environment's column width estimation. When a \co{} contains "_"
characters, it seems that the tabular environment sometimes treats them
as if they prefixed subscripts and estimates the width shorter than the
string to be actuary typeset.

I did some search, but could not find anyone else reporting the issue...

Most of \co{}s within tables are used because they don't require escaping of
LaTeX delimiters such as "_". For this purpose, the \co{} command is
overkill. I'll define another command to be used inside tables.

A few of them are used for automatic line breaks provided by lstinline.
They seem to need protection of parbox or minipage around them on case by
case bases.

I'll see proper ways to present those tables. But some of them may take
a while.

                                                 Thanks, Akira
> 
> 							Thanx, Paul
> 
>>                                                  Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>                                                   Thanks, Akira
>>>> --
>>>> Akira Yokosawa (2):
>>>>   Makefile: Fix .bbl dependency
>>>>   Enable 'inlinelinks' option of alphapf.bst for 1c layout
>>>>
>>>>  Makefile              | 4 ++--
>>>>  alphapf.bst           | 2 +-
>>>>  appendix/appendix.tex | 6 +++++-
>>>>  3 files changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>>
>>
> 
> 

