Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33048 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751990AbcL2ENZ (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 28
 Dec 2016 23:13:25 -0500
Received: by mail-pg0-f66.google.com with SMTP id g1so17628881pgn.0 for
 <perfbook@vger.kernel.org>; Wed, 28 Dec 2016 20:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:references:cc:to:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=wvfRLxP7OQETyTGC8mlwwnFMeKpkQIqwHc8HB458qAk=;
 b=J0gcMNk7Y8vs80AyFAA534RGHT3ukjWOKvWYSsG3q5/iF9WLr+wZeuxvHDfoEnDswU
 bL0XiLMTq2ZZa3tHzMPhXTjWymklnZZZw0nFYJdd9WNNR54flVIpct3G9Qves26pf1rq
 zmAm2JfNhayoP9+CpSsP5tZ6NOjPaIyQsb5LXQHKHcbAi920IFJw0xbNGp5uDYwfCkfD
 6ic6h1AeKtHsEwaCpcxxXUz4Rlp9uBrd9yen23m8eq8YyGzdHxLhWN0ofSMciocOWBmB
 K9F6tmGWk5J5MGiU/OnqmDZGv3lrZRlYklxGpw4Ak/QMnhReD4h6opLIu/Dw/GjZHn9N
 Kibg==
Subject: Re: [PATCH 0/2] Enable inlinelinks of alphapf.bst for 1c
References: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
 <20161227205345.GO3742@linux.vnet.ibm.com>
 <111de212-9aeb-95b8-4e72-9edef7cff417@gmail.com>
 <20161229035603.GB3742@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <edb4cc06-76f8-361c-c579-f0cb480c007d@gmail.com>
Date: Thu, 29 Dec 2016 13:13:24 +0900
MIME-Version: 1.0
In-Reply-To: <20161229035603.GB3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

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

Well, that may be possible, but for now, I want you to see if the
reduced height of the monospace font in the text is acceptable for you.

The direct effect of the change is that we can revert 2 commits
which manually specified smaller font sizes for code sample figures.

See commits bc0fd9d40035 ("after: Tweak font size of Figure A.2") and
c7c5e8a1829e ("formal/dyntickrcu: Adjust font size of sample code").

Undoing tweaks in Tables can be looked at once we switch the default font.

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
