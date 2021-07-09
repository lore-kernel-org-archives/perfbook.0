Return-Path: <SRS0=BSzW=MB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xCtDxh1kWjJKm7ZMVjZLQ3Yuz0yjPmWxJNldtR5tUco=;
        b=PDANga41rXMVOdj+qgfa7jHDnfGuxwTh8zPHw+Dd+QWIxnAcnw4/KodT4CHlmBeaLc
         ZcvcprPmdG7DMezHa7mudp9O6g28kkGV7T64luVtnwgn18N/HTuQy9CIgFJxMD0KAvMt
         ndfRIo/GFQGkjfCs2hc57t6Z0aWAmbInX68ZO2SqC9sswJw11v3A9gL6vTDuHHofBST/
         TwI0zbTU0zKWSWrvHmnFI7hhC6p/j8hhbdeDFunEisKyZb19paXgDigM8991QQQQj1g9
         B8ZrXymeyNXP0OkRIv5NeFOBrMNuHHC1+ole8zPTfKE5zdr1UQB1ftVEck0iaZG1jnhP
         ShDA==
Subject: Re: [PATCH -perfbook 0/6] Break and capitalize after colon, take two
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
 <20210708161914.GK4397@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <57592029-b572-7407-d229-b276fd8be0f5@gmail.com>
Date: Fri, 9 Jul 2021 09:01:02 +0900
MIME-Version: 1.0
In-Reply-To: <20210708161914.GK4397@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 8 Jul 2021 09:19:14 -0700, Paul E. McKenney wrote:
> On Thu, Jul 08, 2021 at 07:40:16PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Here are colon related tweaks though Chapter 9.
>>
>> Patches 1/6 -- 3/6 don't change sentences/clauses/phrases except
>> for capitalization.
>> Patches 4/6 -- 6/6 remove redundant looking Oxford commas in
>> two-item enumeration lists.
>> However, I'm not sure Patches 4/6 -- 6/6 are the right fixes or not.
>>
>> Please pick whichever ones you'd like.
> 
> After some thought and web searching, I took them all.  The missing
> comma in the numbered list looks a bit strange to me, but the style
> manuals don't differentiate between numbered and non-numbered lists,
> so I am willing to have things look strange to avoid yet another
> perfbook-specific composition rule.  ;-)> 
>> NOTE: There is a hunk in Patch 3/6:
>>
>>> @@ -535,9 +537,10 @@ and with increasing use of hazard pointers in other projects, demonstrates
>>>  that tolerance for such inconsistencies is more common than one might
>>>  imagine.
>>>  This is especially the case given that single-item lookups are much more
>>> -common than traversals:  After all, (1)~concurrent updates are less likely
>>> -to affect a single-item lookup than they are a full traversal, and
>>> -(2)~an isolated single-item lookup cannot detect such inconsistencies.
>>> +common than traversals:
>>> +After all, (1)~concurrent updates are less likely to affect a single-item
>>> +lookup than they are a full traversal, and (2)~an isolated single-item
>>> +lookup cannot detect such inconsistencies.
>>>  
>>>  From a more theoretical viewpoint, there are even some special cases where
>>>  RCU readers can be considered to be fully ordered with updaters, despite
>>
>> , where the inline enumerated list is not converted to the "enumerate*" list.
>> This one is lead by "After all," not by a colon, and I kept the lowercase
>> words following (1) and (2).
>>
>> This level of fluctuation is unavoidable in natural language text,
>> I suppose.
> 
> I wordsmithed this passage to get rid of the list entirely.
> I believe that it now reads better, in addition to avoiding another
> perfbook-specific special case.

There looks like a typo in the updated passage.
Please find a patch below.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
[...]

-------8<---------
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 9 Jul 2021 08:43:52 +0900
Subject: [PATCH] defer/rcufundamental: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcufundamental.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index ff3c4bc1..66f9b702 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -543,7 +543,7 @@ full-data-structure traversals.
 After all, full-data-structure traversals are much more expensive than
 single-item lookups, so developers are motivated to avoid such traversals.
 Not only are concurrent updates are less likely to affect a single-item
-lookup than they are a full traversal, but is is also the case that an
+lookup than they are a full traversal, but it is also the case that an
 isolated single-item lookup has no way of detecting such inconsistencies.
 As a result, in the common case, such inconsistencies are not just
 tolerable, they are in fact invisible.
-- 
2.17.1


