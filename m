Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36448 "EHLO
 mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751221AbdGQApc (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 16
 Jul 2017 20:45:32 -0400
Received: by mail-pg0-f67.google.com with SMTP id y129so17459583pgy.3 for
 <perfbook@vger.kernel.org>; Sun, 16 Jul 2017 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XAT+Jvw01reWlCCDolCryXlnFXRkAScNwK0vgZcYS/o=;
 b=RWne5Edfnt3lYXxGqiuhkLmP0feYuQj6DkGE+auYMhrngsSckLtwIYFdXRxn6I6lMe
 QezJxFltuIgD11fysrRJ7b+/eAxPAUyna7QiJ6MCO0DWFqRNhLyeAc/UmquaWuFJvTU8
 WIe2bpVv8hn+8ObmVeCTL9DmZJ0B1wEd0e4TeXpcJCCAK5RNL3dLhAOgmwc3iz/7d/nE
 aLXnExc4HztYG6PXGqxKB7dHT3o2I4HmNqSLMPD2bnow0DctjmRBmCCPmYhEDt809ew/
 6X3nZgIe6kPm/ceclOAQaiNvlUrzZOn5gjkQu9XmYlp3RC+SHsP4gsZH1SvCJnMoTfeo
 TdIA==
Subject: Re: [PATCH] advsync: Fix two-CPU control-dependency example
References: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
 <2caf7648-6f8a-f679-2d02-b215d45d3718@gmail.com>
 <20170716234028.GN2393@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <158186a8-f58c-0d73-0b79-b8edfc94d367@gmail.com>
Date: Mon, 17 Jul 2017 09:45:26 +0900
MIME-Version: 1.0
In-Reply-To: <20170716234028.GN2393@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2017/07/16 16:40:28 -0700, Paul E. McKenney wrote:
> On Sun, Jul 16, 2017 at 11:27:58PM +0900, Akira Yokosawa wrote:
>> >From 8996357b6bd21245ef6545fca0c282fb4a31349e Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 16 Jul 2017 20:33:14 +0900
>> Subject: [PATCH] advsync: Fix two-CPU control-dependency example
>>
>> The two-CPU example always results in r1==0 && r2==0 when the
>> operator ">" is used in the "if" statement.
>> The point of this example is to use control dependency for ordering,
>> and the WRITE_ONCE() should always be executed.
>>
>> So the corresponding example in memory-barriers.txt was correct
>> before commit 5646f7acc95f in Linux kernel repository.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> So sounds like you didn't like the previous patch in this thread.
>> I tried to convert the examples to litmus test format,
>> and found out the two-CPU example results in a single outcome.
>>
>> If you prefer these examples to be converted to litmus test format,
>> I can respin these patches and add the tests to CodeSamples.
>> But I need to know what names to use for the tests.
>> Do "C-SB+o-c-o+o-c-o" and "C-WWC+o-c-o+o-c-o+o" work?
>>
>> Or if these changes conflict with your ongoing work, I'll back off.
>>
>> FWIW I've not seen the three-CPU litmus test results in "sometimes",
>> even on PPC. 
> 
> Sorry, I was distracted with C++ standards-committee work, and got
> behind on my email.  No opinion at all on them yet.

I see.

> 
> If these two patches are either-or, I would take the one that matches
> memory-barriers.txt.  Please advise.  ;-)

The 1st one ("advsync: Fix control-dependency no-transitivity example")
is the catchup to memroy-barriers.txt.

As for the 2nd one, would it be better to fix memory-barriers.txt first
if the two-CPU example actually neesd the partial revert? 

> 
> This part of the file is likely to be overwritten at some point, but
> it would be good to remove confusion in the meantime.
> 
> On the PPC end of things, the hardware often has stronger ordering
> than does the architecture.  For example, Power hardware is reluctant
> to reorder later writes wiht earlier reads, despite the fact that
> the architecture allows this.  So it would be good to get some
> tests that actually show reordering on PPC.
> 
> Your names look good, and I would welcome help in converting things
> to litmus tests.  To that end, I have a github archive with lots
> of litmus tests, some manually generated and some automatically
> generated:
> 
> 	https://github.com/paulmckrcu/litmus
> 
> Which reminds me...  Do you have access to a Linux system on which
> you can install kernel modules?

If a virtual guest machine on x86, I should be able to. Does that
suffice?

           Thanks, Akira

>                                 There is a klitmus7 that does that.
> 
> 							Thanx, Paul
> 
>>       Thanks, Akira
>> --
>>  advsync/memorybarriers.tex | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index 894de6d..f0ca79d 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -3015,8 +3015,8 @@ of~\co{x} and~\co{y} both being zero:
>>  	\hline
>>  	\tco{r1 = READ_ONCE(x);} &
>>  		\tco{r2 = READ_ONCE(y);} \\
>> -	if (r1 > 0) &
>> -		if (r2 > 0) \\
>> +	if (r1 >= 0) &
>> +		if (r2 >= 0) \\
>>  	~~~\tco{WRITE_ONCE(y, 1);} &
>>  		~~~\tco{WRITE_ONCE(x, 1);} \\
>>  	\multicolumn{2}{l}{~} \\
>> -- 
>> 2.7.4
>>
>>
> 
> 

