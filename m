Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=l3IvzmMM6g3v9GO5oNv8Wu5NkoIsmZy7uSSABPY3jzI=;
 b=BE/IdxkmN28TR+fzIO/kzXnBV1qJDa11CZewe8wvAwLGahwdCZA22sn/bPob7KUI6I
 5Jbet18YYtsWFq3w1I5u4h9S/bkw7rR8xXa8607l0YhBbrPxic074xEcBgJqMwgBa4ov
 3EO6B1OozddLkxWTkeDYaHySyhwp2ODM32/oG8l3UVBy2u6K9ZEo1JRQRgLLLQOJN0FR
 uSYUzFLXYrO+wSE/Y2fP3a06NoOVYka+URkd97eXjfk/lizKWw+27uQYe9WIA6hk1vE6
 BI9Mra9vWHOxmPnpK5TPb7MUp2TqKqwV04hKIrVAh4S5H52Wy4UEp5/PK5bg2DifQXsY
 cn3A==
Subject: Re: [PATCH 0/4] Add target for "Latin Modern Typewriter" font
References: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
 <20170313011203.GV30506@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1f9afad1-2c95-2d81-aa43-810355eed544@gmail.com>
Date: Mon, 20 Mar 2017 01:14:59 +0900
MIME-Version: 1.0
In-Reply-To: <20170313011203.GV30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/03/12 18:12:03 -0700, Paul E. McKenney wrote:
> On Mon, Mar 13, 2017 at 12:36:56AM +0900, Akira Yokosawa wrote:
>> >From 2f6614cdf5e1b0f7da9a5c05833dbc4a251eaa9c Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 13 Mar 2017 00:10:31 +0900
>> Subject: [PATCH 0/4] Add target for "Latin Modern Typewriter" font
>>
>> So, this is a patch set to add yet another target for alternative monospace font.
>> While preparing this set, I found a (not serious) bug in runlatex.sh.
>> In fixing it, I refactored the script so that redundant code can be removed.
>>
>> Latin Modern Typewriter font is based on "cmtt" (Computer Modern Typewrite) font.
>> I see that some of your articles cited in Bibliography use it as monospace font,
>> and they look quite good. cmtt is said to be not suited to Times Roman font
>> because of its short x-height, but as we are using scaled courier font,
>> it should not be a big deal.
>>
>> Please try the target "mslm" and let me know what you think.
> 
> I do like the better display of error messages -- especially now with
> the list of undefined references being printed, much nicer than editing
> perfbook.log and searching for them!
> 
> I very like the more narrow fixed-width font.  I -think- I like the mslm
> variant even better, but let's see what others think.

As I've using mslm for a week, I think it is nicer than mstx or msnt
in verbatim code snippets.
Howerver, when mixed used with Times Roman (clone) font in the main text,
I prefer the look of newtxtt font because of it is slightly thicker, and
it has mostly the same degree of serif as Times Roman.

One idea is to use cmtt (or lmtt) for code snippet, and use newtxtt (or
txtt as a fallback on older LaTeX environment). I'll try this direction
and prepare an RFC patch for you to try.

If it looks good for you, we might want to modify font selection for default
targets 2c, 1c and hb. Otherwise, we can expect few feedback if any.
When we do the change, current defaults' behaviors should be provided in
alternative targets for people to compare.

                                 Thanks, Akira

> 
> 							Thanx, Paul
> 
>>                                 Thanks, Akira
>> -- 
>> Akira Yokosawa (4):
>>   runlatex.sh: Refactor by defining functions
>>   runlatex.sh: Fix typo in grep pattern
>>   runlatex.sh: Add more lines of grep output around warning/error log
>>   Add target 'mslm' for 'Latin Modern Typewriter' font
>>
>>  Makefile                   | 11 ++++--
>>  perfbook.tex               |  3 +-
>>  utilities/runfirstlatex.sh |  3 +-
>>  utilities/runlatex.sh      | 87 +++++++++++++++++++++-------------------------
>>  4 files changed, 52 insertions(+), 52 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 
> 

