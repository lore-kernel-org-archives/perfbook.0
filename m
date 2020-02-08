Return-Path: <SRS0=RuZN=34=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/FlEV8J0z08S9THaHSEx9HdkMDsVUE74eKSRv+YEaAQ=;
        b=O9PWuQjot3JqXqFndOT8Ye11wl9TNf9ReTYOUAaI1Yi/h1P3iSyLxT3+FBrcSR+wxV
         tfd8naPjg5F8FenJhH+/E87GKFNBsksKEwg577+Xv98FE22ZWNnP+ki0Vkcy1sLTE6bU
         u9p+rD+hh+b2U87GzDaMCJACz5dpnuLalKy70coExPOxs6CMntc61W5sKcqz4Uh8d1SA
         8KvVvBFmiE3Ms5S9w5spBCbX36GCgLwnEJbzRWLlVnB3dOXwfin3tSX3/XGLRdCOmhb4
         A3ykdEXsFOgcYcnt9sn8mldWl19BgeE09bTSdg5AzJkYlbpm6km/dIko+SxwwEXANqwp
         WA8Q==
Subject: Re: [PATCH] Permit occasional orphans
References: <8953d302-fa2b-da51-f555-52b0ef94612a@gmail.com>
 <20200207124458.GJ2935@paulmck-ThinkPad-P72>
 <89b759c0-1eb4-c0f8-840d-8a1c9f8ddefc@gmail.com>
 <20200207160344.GM2935@paulmck-ThinkPad-P72>
 <1fbecd3a-c78a-a6d8-d904-055d4945bf9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e068709c-ce4f-37f2-75a2-1dd7cb3e30da@gmail.com>
Date: Sat, 8 Feb 2020 20:49:23 +0900
MIME-Version: 1.0
In-Reply-To: <1fbecd3a-c78a-a6d8-d904-055d4945bf9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 8 Feb 2020 08:14:25 +0900, Akira Yokosawa wrote:
> On Date: Fri, 7 Feb 2020 08:03:44 -0800, Paul E. McKenney wrote:
>> On Sat, Feb 08, 2020 at 12:26:49AM +0900, Akira Yokosawa wrote:
>>> On Fri, 7 Feb 2020 04:44:58 -0800, Paul E. McKenney wrote:
>>>> On Fri, Feb 07, 2020 at 07:40:55AM +0900, Akira Yokosawa wrote:
>>>>> >From 6ad4c736867394d765a4b50aba907ef0dd8420ba Mon Sep 17 00:00:00 2001
>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>> Date: Thu, 6 Feb 2020 22:16:28 +0900
>>>>> Subject: [PATCH] Permit occasional orphans
>>>>>
>>>>> Recent update of upstream LaTeX caused excessively wide spaces between
>>>>> paragraphs in 2c layout similar to the issue mentioned in the change
>>>>> log of commit 4c6ee39761a0 ("Remove required version of 'epigraph'")
>>>>> at the beginning of Chapter 6.
>>>>>
>>>>> The root cause of the unstable behavior is the constraints imposed
>>>>> by the unfortunate combination of a fairly tall unbreakable block
>>>>> (consisting of a section heading, a section epigraph, a paragraph
>>>>> of only 3 lines), a footnote, and a floating figure.
>>>>>
>>>>> Note that the "nowidow" package requires at least 4 lines for a
>>>>> paragraph to be broken.
>>>>>
>>>>> An orphan line (first line of a paragraph at the bottom of a page/column)
>>>>> looks less ugly than a widow line (final line of a paragraph at the top
>>>>> of a page/column) does.
>>>>>
>>>>> As a band-aid patch, this commit permits an orphan at the problematic
>>>>> paragraph by the \noclub command provided by the "nowidow" package
>>>>> and avoids such ugly wide spaces.
>>>>> Another approach would be to add some words to the paragraph and
>>>>> make it 4 lines or more.
>>>>>
>>>>> By this change, TeX Live 2015/Debian (on Ubuntu Xenial) with the
>>>>> up-to-date "epigraph" can also produce the (mostly) same output.
>>>>>
>>>>> Do similar tweaks to avoid wide vertical spaces in a couple of other
>>>>> chapters.
>>>>>
>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>
>>>> Queued and pushed, thank you!
>>>>
>>>> I also expanded the paragraph preceeding your \noclub, please check to
>>>> make sure that this really fixes the problem in the other environments.
>>>
>>> Yes, now the beginning of Section 6.1 fits in the left column of
>>> the page on both the up-to-date TeX Live 2019 and TeX Live 2015/Debian
>>> with the up-to-date "epigraph".
>>
>> Very good, thank you!
>>
>>>> This also caused me to wonder about the two-page "think about it" gap
>>>> following the introduction of Dining Philosophers.  Not a problem in> electronic editions, but it looks like a print edition would have a pair
>>>> of pages with only "(Intentional blank page)" in the upper left.  Might
>>>> not be worth worrying about, though.
>>>
>>> Ah, blank pages on odd and even pages do look strange.
>>> IIUC, a pair of odd and even pages are printed on both side of a
>>> paper.
>>
>> Yes, for example, on one of the printed copies of the first edition,
>> pages 217 and 218 are on opposite sides of the same sheet of paper.
> 
> Maybe commit 67aae72180cb ("SMPdesign: Restore effect of \cleardoublepage")
> has something to do with this issue.
> 
>>
>>> If the question is on an even page, to prevent the answer from being spotted
>>> early, it should not be on the next (odd) page but on the next even page.
>>> If the question is on an odd page, the answer may be on the other side
>>> (even page) without any blank page for print edition.
>>>
>>> Is my understanding of the problem correct?
>>
>> Sounds correct to me!
>>
>>> So we need to make the added blank page(s) conditional to Edition type,
>>> don't we?
>>
>> Quite possibly, but on the other hand people do occasionally print random
>> versions of the book.  So it would be better to assume that any random
>> git commit might be printed.
> 
> So, rather than
> 
>>> If the question is on an odd page, the answer may be on the other side
>>> (even page) without any blank page for print edition.
> 
> , the rule would be:
> 
>>> If the question is on an odd page, the answer should be on a even page
>>> after 2 blank pages in between. 

I was somewhat confused. The right approach for us seems to be:

Regardless of where the question is placed, the answer should come after
a gap of a single blank page.

For print editions, this rule results in an unnecessary blank page
when the question is on an even page, which still looks acceptable.

I'm submitting a patch with your Reported-by for you to test.

        Thanks, Akira

> 
> Does this sound good?
> 
>         Thanks, Akira
> 
>>
>>> Hopefully I might be able to come up some way to do this soon enough.
>>
>> Sounds very good!  Not critically important or urgent, but it would
>> be nice to have.
>>
>> 						Thanx, Paul
>>
>>>         Thanks, Akira
>>>
>>>>
>>>> 							Thanx, Paul
>>>>
> [...]
> 
