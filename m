Return-Path: <SRS0=ZtP0=NL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x921XApoO1Sgw9cawEBXwoOWqWnSv16hr6AIVSPqB7w=;
        b=kq3ZQ97s4YnhBaUuUG909M5fHF/R9+r0o6hySILitiQDxyevVXz7W7fPJJ/oKxkEu9
         mrHnUi7VlRkIUKBvYitNw6MNJlaFDAefNPAu7rWiSw41QeBzXTE8T+zWvCo1I47IsTyv
         QdX0VQ8/WXDE5+tc6WTQQ50PADFHSFHloBLAYrSGjfbulmOUHdSyXvBsN8FfVCM5optG
         0q9Cqr7xwaxI5dVeEiS5P2pP6cOrUkSGLcCnrBAcym0Mqilk9WSrpJOWi5JllW+fsNok
         4bPSCckBJLZrPo3SIwVVrFKub71KNaKUrFvDlY5A8OOnN8F4XT8tW9YSYJKusWVyqGWS
         opsQ==
Subject: Re: [PATCH-perfbook] Fix a little grammar mistake
References: <1629359518-3861-1-git-send-email-zhouzhouyi@gmail.com>
 <031ce7cf-750e-7a2d-f2ba-5e7b661df2c2@gmail.com>
 <20210819172940.GD4126399@paulmck-ThinkPad-P17-Gen-1>
 <6751500e-62ed-3bcb-fe9f-290a826ed8da@gmail.com>
 <20210820025428.GG4126399@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cfd450e3-4b0e-c97a-6591-a9e6a326ce05@gmail.com>
Date: Fri, 20 Aug 2021 19:43:03 +0900
MIME-Version: 1.0
In-Reply-To: <20210820025428.GG4126399@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com
List-ID: <perfbook.vger.kernel.org>

On Thu, 19 Aug 2021 19:54:28 -0700, Paul E. McKenney wrote:
> On Fri, Aug 20, 2021 at 08:43:13AM +0900, Akira Yokosawa wrote:
>> On Thu, 19 Aug 2021 10:29:40 -0700, Paul E. McKenney wrote:
>>> On Thu, Aug 19, 2021 at 07:54:30PM +0900, Akira Yokosawa wrote:
[...]
>>>> Three uses of "than" in a sentence might be confusing, though.
>>>>
>>>> Paul might have an idea of a less-confusing sentence.
>>>
>>> Three "than"s in one sentence is a bit excessive, now that you guys
>>> mention it.
>>>
>>> How about this?
>>>
>>> 	In practice, there are a lot more 28-CPU systems than there are
>>> 	448-CPU systems.
>>>
>>> I do not believe that the "more than"s are really adding much here.
>>
>> Well, the question part reads:
>>
>>> The dangers of extrapolating from 28 CPUs to 448 CPUs was made quite
>>> clear in Section 10.2.3. But why should extrapolating up from 448 CPUs be
>>> any safer?
>>
>> So, the point is "extrapolating up from 448 CPUs".
>> Hence you used "more than"s in the answer, didn't you?
> 
> Right you are, and thank you for checking this!
> 
> There are several possibilities:
> 
> 	In practice, there are a lot more systems with in excess of
> 	28~CPUs than there are systems with in excess of 448 CPUs.
> 
> Or:
> 
> 	In practice, there are only a very few systems with more than
> 	448 CPUs, while there is a huge number having more than 28 CPUs.
> 
> Or perhaps rework the full answer:
> 
> 	In theory, it isn't any safer, and a useful exercise would be
> 	to run these programs on larger systems.
> 	In practice, there are only a very few systems with more than
> 	448 CPUs, in contrast to the huge number having more than 28 CPUs.
> 	This means that although it is dangerous to extrapolate beyond
> 	448 CPUs, there is very little need to do so.
> 	In addition, other testing has shown that RCU read-side primitives
> 	offer consistent performance and scalability up to at least 1024 CPUs.
> 
> Thoughts?

The fully reworked answer looks much clearer for me.

Besides, I'd like to suggest some changes around QQ 10.9.

As there is no mention of extrapolation before this QQ in this section,
the question of "But why should extrapolating up from 448 CPUs be any
safer?" looks kind of abrupt.
A plain yes/no question would be smoother. 

Also, the transition of discussion on Figure 10.12 (update performance)
to that on Figure 10.11 (lookup performance) in the preceding paragraphs
is not evident and I got lost for a while when I reread this section.

How about the following change?

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index adb102d4..9e386e99 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -941,6 +941,7 @@ pointers.
 Of course, all three of these implementations beat global locking.
 
 It is quite possible that the differences in lookup performance
+(\cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates})
 are affected by the differences in update rates.
 One way to check this is to artificially throttle the update rates of
 per-bucket locking and hazard pointers to match that of RCU\@.
@@ -958,7 +959,7 @@ not recommended for production use.
 	The dangers of extrapolating from 28 CPUs to 448 CPUs was
 	made quite clear in
 	\cref{sec:datastruct:Hash-Table Performance}.
-	But why should extrapolating up from 448 CPUs be any safer?
+	Would extrapolating up from 448 CPUs be any safer?
 }\QuickQuizAnswer{
 	In theory, it isn't any safer, and a useful exercise would be
 	to run these programs on larger systems.
-- 

        Thanks, Akira
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> Thoughts?
>>>
>>> 							Thanx, Paul
>>>
>>>>         Thanks, Akira 
>>>>
>>>>> +	are systems with more than 448 CPUs.
>>>>>  	In addition, other testing has shown that RCU read-side primitives
>>>>>  	offer consistent performance and scalability up to at least 1024 CPUs.
>>>>>  }\QuickQuizEnd
>>>>>
