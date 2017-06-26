Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NYr6aDyGlNSM6BuYj0QBJLHcxhlbU+NQzv3Owo+RV9w=;
 b=Fiza0JfF77q+C8fUeB2eqf6OAKW4Vif0ZDadYnTFxZdTo9elz0fACte/X9GtADzZIL
 G1v+CAV1ez6/rr+KRwtfW1DPwvMLS4hHQGByeefxwnmW/nX/cI+2uhQ43k1F6tzjzrzd
 j1AGE/Ywbm0g3yuQMSU42uXKYcg6xnIHbNR4nMnT1y6H9jnAr3nWdnvGTkmUToZvRxCf
 bZc4XjVRTG7OgDul9rz4YrgCC9H+AMCx54bATWlbLHUMDVqeTn82aSo3H5DP1q4JDgbH
 8njX5MGU7wSARs4K92igg9MXcZF4kaaxpTZf19kBm84A9GdWjSNzjSXJfa5eVIiyyxrR
 eSHg==
Subject: Re: [PATCH 0/5] Add white spaces before unit symbols
References: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
 <20170625032423.GY3721@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8265875f-eec0-1068-45c9-bd424308c691@gmail.com>
Date: Tue, 27 Jun 2017 00:12:05 +0900
MIME-Version: 1.0
In-Reply-To: <20170625032423.GY3721@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/06/24 20:24:23 -0700, Paul E. McKenney wrote:
> On Sun, Jun 25, 2017 at 08:59:32AM +0900, Akira Yokosawa wrote:
>> >From 27d084e3bffbcd26a56d56859145f449750fc7b1 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 25 Jun 2017 08:53:02 +0900
>> Subject: [PATCH 0/5] Add white spaces before unit symbols
>>
>> Hi Paul,
>>
>> This is a patch series to do the same tweaks as I did in QC section.
>> As NIST style guide covers only the SI units, I split the patches
>> for SI units and non-SI units.
>>
>> Patches 1 and 2 are for SI unit symbols.
>> Patch 3 improves the look of the "rt-regimes" figure.
>> Patches 4 and 5 are for non-SI unit symbols. I'm not sure if you like
>> these changes involving KB, MB, and GB symbols.
>>
>> Strictly speaking, if you really want to stick to the NIST guide, they
>> should be replaced with KiB, MiB, and GiB when they represent
>> powers of 2. But I think in perfbook, there is no worry of confusion.
>> So I stopped short of doing those changes.
>>
>> Please apply as far as you like.
> 
> Applied and pushed, thank you!
> 
> Would you be willing to add a style guide, perhaps in
> appendix/questions?  That could be quite helpful to people
> wishing contribute -- including me.  ;-)

Let me see what I can do. Maybe as a new chapter in appendix/styleguide.
(appendix/questions is supposed to contain SMP related topics.)

It may also contain cheat sheet for LaTeX tricks.

           Thanks, Akira

> 
> 						Thanx, Paul
> 
>>          Thanks, Akira
>> -- 
>> Akira Yokosawa (5):
>>   treewide: Add narrow spaces before SI unit symbols
>>   treewide: Add whitespace before SI unit symbols in figures
>>   Substitute 'greek mu' for 'u' in microsecond symbol
>>   treewide: Add narrow spaces before non-SI unit symbols
>>   cartoons: Add whitespace before 'MB'
>>
>>  SMPdesign/SMPdesign.tex              |  2 +-
>>  SMPdesign/beyond.tex                 |  4 +--
>>  advsync/memorybarriers.tex           | 14 ++++----
>>  appendix/questions/after.tex         |  2 +-
>>  appendix/toyrcu/toyrcu.tex           |  2 +-
>>  cartoons/r-2014-Old-man-and-Brat.svg |  2 +-
>>  count/count.tex                      |  2 +-
>>  cpu/SystemArch.fig                   |  2 +-
>>  cpu/hwfreelunch.tex                  |  4 +--
>>  cpu/overheads.tex                    |  8 ++---
>>  cpu/overview.tex                     |  6 ++--
>>  cpu/swdesign.tex                     |  2 +-
>>  datastruct/datastruct.tex            |  2 +-
>>  debugging/debugging.tex              |  2 +-
>>  defer/rcuusage.tex                   |  4 +--
>>  defer/refcnt.tex                     |  2 +-
>>  formal/dyntickrcu.tex                |  4 +--
>>  formal/spinhint.tex                  |  6 ++--
>>  glossary.tex                         |  2 +-
>>  intro/intro.tex                      |  6 ++--
>>  rt/rt-regimes.svg                    | 66 ++++++++++++++++++------------------
>>  rt/rt.tex                            |  4 +--
>>  22 files changed, 74 insertions(+), 74 deletions(-)
>>
>> -- 
>> 2.7.4
>>
>>
>>
> 
> 

