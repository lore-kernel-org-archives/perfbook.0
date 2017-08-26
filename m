Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rFkm4VbM942HVk641e5Uqxf4sRItEM5mniLCG7T2XZM=;
 b=nP6gZ8LzbJjupG1IkXLTeveGHKmOqZizCK7KYe9AnAxFFAWCveRGhf3MDtkUEk5iMY
 /7tAFt71oD914nHtp7LB+B94drCq8UgWTe78Z7zG/cLgpUee4slwmdsRSJ6UGunaUHsh
 R5Q+MoV5OBkP4Z4+RGRC8SY8xf4O7Hw+uzk8WQQNQ/OSbQA4RRGHHD5O+2LkuVq9ses9
 Bs8ranzT/UEZJhi96eciA2Trlil6aQNdzikCVNAUOSKCfaC/w0g+8iUchObbBfkWF/Kk
 nELwRMzCBCkaynWJfm5Rc2B9KZ3/JWdJdmk30ZBOR0eyhYBrXZLi3Q0ptfyHWFItAQse
 Yimw==
Subject: Re: [PATCH] advsync: Fix litmus tests
References: <2f1687fb-136e-88e8-e678-9066be8b0448@gmail.com>
 <20170826015944.GV11320@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5484c90f-e587-2df8-4243-55ffcf2c7dcd@gmail.com>
Date: Sat, 26 Aug 2017 11:47:29 +0900
MIME-Version: 1.0
In-Reply-To: <20170826015944.GV11320@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/08/25 18:59:44 -0700, Paul E. McKenney wrote:
> On Sat, Aug 26, 2017 at 09:07:33AM +0900, Akira Yokosawa wrote:
>> >From 65f40cf041aa5506e62c25e4ab9fd63d1d34fdd7 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 26 Aug 2017 08:48:01 +0900
>> Subject: [PATCH] advsync: Fix litmus tests
>>
>> Adjust litmus-test syntax to be accepted by litmus7.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> This is my attempt to make litmus7 happy.
>> herd7 says:
>>
>> --
>> $ herd7 -conf strong.cfg C-WWC+o+o-data-o+o-addr-o.litmus 
>> Test C-WWC+o+o-data-o+o-addr-o Allowed
>> States 5
>> 1:r1=x; 2:r2=u; x=x;
>> 1:r1=x; 2:r2=x; x=a;
>> 1:r1=x; 2:r2=x; x=x;
>> 1:r1=z; 2:r2=u; x=x;
>> 1:r1=z; 2:r2=z; x=x;
>> Ok
>> Witnesses
>> Positive: 1 Negative: 4
>> Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
>> Observation C-WWC+o+o-data-o+o-addr-o Sometimes 1 4
>> Hash=262fd275af47e8ed4fba69491478bb7d
>> --
>>
>> and
>>
>> --
>> $ herd7 -conf strong.cfg C-WWC+o+o-r+o-addr-o.litmus 
>> Test C-WWC+o+o-r-o+o-addr-o Allowed
>> States 4
>> 1:r1=x; 2:r2=u; x=x;
>> 1:r1=x; 2:r2=x; x=a;
>> 1:r1=z; 2:r2=u; x=x;
>> 1:r1=z; 2:r2=z; x=x;
>> No
>> Witnesses
>> Positive: 0 Negative: 4
>> Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
>> Observation C-WWC+o+o-r-o+o-addr-o Never 0 4
>> Hash=607040ae8eb633fee308b55be24729e1
>> --
>>
>> Do these look reasonable?
> 
> They do, but I failed to push out a change, and thus had to hand-apply
> them with some adjustment.  Could you please double-check them?  For
> ease of repairing any errors, I split this into two commits.

Litmus tests as listings in memorder.tex have indentations of tabs.
For consistency, they should be 2 white spaces.

Other than that, the change looks OK to me.

    Thanks, Akira

> 
> Also, I made the memory-barriers section be its own chapter.  At some
> point I should move the litmus tests as well, but am holding off until
> we get these corrected.
> 
> 							Thanx, Paul
> 
>>      Thanks, Akira
>> --
>>  .../advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus  | 22 ++++++++++---
>>  .../advsync/herd/C-WWC+o+o-r+o-addr-o.litmus       | 24 ++++++++++----
>>  advsync/memorybarriers.tex                         | 38 +++++++++++++++-------
>>  3 files changed, 62 insertions(+), 22 deletions(-)
>>
[...]

