Return-Path: <SRS0=xjF9=AV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682824348; x=1685416348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlE1WjlyBzX2AaZwin5CLVd/Yw4UvWueTXfwjjUSZPg=;
        b=X3g6IcZF3dMiXdihzSRS31SzliwFwMSh+dIZ3fLBIcUaYvpi8edR5WssBlKc312WYR
         Vlrrxs+Mc6Fnnoo4c49rtKkELrIrJHzO5YOFT0HltllOebTYCLgtQspuribtSCFLl9ap
         6C4bujhL2me6bnAnzWQMCSbwhrH671Gkdx0ahy0ZSmRtZGdWxBC2orqDB3BNlnh48RPA
         ISnNj65MXtC2iN1aQDDklzuNeQuYT8QPHddv2MNjs4aGjbYoNmsB8BM1twGIydSKQri2
         rfkUUsUY785Ba0gvfx5aQumAuPl8aV0qY86EHFSlX3pP/HAs9rNEw70dQTGEIvUCfCU2
         sA+g==
Message-ID: <29852e1a-fd80-1525-fbe2-b8578c0259f8@gmail.com>
Date: Sun, 30 Apr 2023 12:12:24 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
References: <20230429233812.18478-1-sj@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230429233812.18478-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, paulmck@kernel.org, "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 29 Apr 2023 16:38:12 -0700, SeongJae Park wrote:
> Hi Akira,
> 
> On Sun, 30 Apr 2023 07:20:48 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> 
>> Hi,
>>
>> On Sat, 29 Apr 2023 10:02:25 -0700, SeongJae Park wrote:
>>> From: SeongJae Park <sj38.park@gmail.com>
>>>
>>> Some sentences in refcnt.tex is using only quote for some code words.
>>> Use \tco{} instead, as it is intended to be used for the case.
>>
>> \tco{} doesn't put quotes around it.
>> Didn't you mean \qco{} ?
> 
> You're correct, I was out of my mind.  I also mistakenly used an email account
> that different from what I signed patches off.  I will send a new spin
> tomorrow.

Looks like Paul has already pulled and pushed this (commit 0e96cb8283ca).

Can you send a fix on top ?

        Thanks, Akira

> 
> 
> Thanks,
> SJ
> 
>>
>>         Thanks, Akira
>>
>>>
>>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>>> ---
>>>  together/refcnt.tex | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/together/refcnt.tex b/together/refcnt.tex
>>> index 56caed67..4abe1c60 100644
>>> --- a/together/refcnt.tex
>>> +++ b/together/refcnt.tex
>>> @@ -467,15 +467,15 @@ as shown below.
>>>  
>>>  \QuickQuiz{
>>>  	Why can't the check for a zero reference count be
>>> -	made in a simple ``if'' statement with an atomic
>>> -	increment in its ``then'' clause?
>>> +	made in a simple \tco{if} statement with an atomic
>>> +	increment in its \tco{then} clause?
>>>  }\QuickQuizAnswer{
>>> -	Suppose that the ``if'' condition completed, finding
>>> +	Suppose that the \tco{if} condition completed, finding
>>>  	the reference counter value equal to one.
>>>  	Suppose that a release operation executes, decrementing
>>>  	the reference counter to zero and therefore starting
>>>  	cleanup operations.
>>> -	But now the ``then'' clause can increment the counter
>>> +	But now the \tco{then} clause can increment the counter
>>>  	back to a value of one, allowing the object to be
>>>  	used after it has been cleaned up.
>>>  
