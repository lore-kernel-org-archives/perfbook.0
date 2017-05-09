Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PmCqEYW/2eFeomd2SUiDeNILuAKKEMQcnGYeyauKdLI=;
 b=Ekji0BMfHeO6CsM8iruZJZwCakCFteljTIqNoTZVWkjthXGvVXLYYbUXISVZumLaHN
 L69XrggrjjjaHrt3vEMxXTI3ObsvRWsArun+NIGsTGk1gKU1vnufJgswuhQHyoXG+qh9
 m8TsSDGsqYhNVl5JiFWxKlSYDVixtJCXXAVqLJgFZCntoXq68UwfKzim16JjcLU7qKwh
 Sm0rUpN7TmnUhxTfV/7VWL1I5tDzJeE0S4uDVsqV5A+UgbI3hNsQBKOW2EcSPVCCFWgg
 LhUDO3tuD3em7MWwvOb392cHyLIW1FkX2ySplfSRM7x+qbzgu8Ajc4SrXHSUc65ohU0b
 3FEA==
Subject: Re: [PATCH] Update Answer to Quick Quiz 5.27
References: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
 <07cd658e-d71b-496e-5583-e204ae1c3ebf@gmail.com>
 <CABoNC81561Cdif7=LnT0z3xdkM++Ldznnd5uGNzMuyVv_XU56g@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <838da0fb-e7c9-8a0d-a0a9-52bff6095702@gmail.com>
Date: Wed, 10 May 2017 07:38:25 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CABoNC81561Cdif7=LnT0z3xdkM++Ldznnd5uGNzMuyVv_XU56g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/09 23:21:33 +0800, Junchang Wang wrote:
> Hi Akira,
> 
> That's the major point. Fair enough :-)
> 

So, are you OK with me submitting the patch with your Acked-by?

                      Thanks, Akira
> 
> Thanks,
> --Jason
> 
> 
> On Tue, May 9, 2017 at 10:56 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
>> On 2017/05/09 16:48:12 +0800, Junchang Wang wrote:
>>> Oops. Forgot the summary in previous email. Resend the patch.
>>>
>>>
>>> The Answer to Quick Quiz 5.27 is a bit hard to follow. Rewrite it.
>>>
>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>> ---
>>>  count/count.tex | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/count/count.tex b/count/count.tex
>>> index cc47554..6dfc7a6 100644
>>> --- a/count/count.tex
>>> +++ b/count/count.tex
>>> @@ -1258,13 +1258,13 @@ machine.
>>>       fast and scalable while allowing readers to also enjoy
>>>       reasonable performance and scalability?
>>>  \QuickQuizAnswer{
>>> -     One approach would be to maintain a global approximation
>>> -     to the value.
>>> -     Readers would increment their per-thread variable, but when it
>>> -     reached some predefined limit, atomically add it to a global
>>> -     variable, then zero their per-thread variable.
>>> -     This would permit a tradeoff between average increment overhead
>>> -     and accuracy of the value read out.
>>> +     One approach would be to add a global variable maintaining a
>>> +     approximation to the exact value. An updater would increment its
>>> +     per-thread variable, and when its value reaches predefined limit,
>>> +     atomically add the value to the global variable, then zero its
>>> +     per-thread variable. Readers simply return the value of global variable,
>>> +     enjoying reasonable performance.  This would permit a tradeoff between
>>> +     average increment overhead and accuracy of the value read out.
>>>
>>>       The reader is encouraged to think up and try out other approaches,
>>>       for example, using a combining tree.
>>>
>>
>> Hi Junchang,
>>
>> What confused you seems to be a simple typo.
>> Isn't the following one-liner sufficient for you?
>>
>>                 Thanks, Akira
>>
>> --8<---->8--
>> From 725b32938e0cbc245e5a528fd475951bb8be1de5 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 9 May 2017 23:39:57 +0900
>> Subject: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27
>>
>> Reported-by: Junchang Wang <junchangwang@gmail.com>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  count/count.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/count/count.tex b/count/count.tex
>> index cc47554..096b53d 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -1260,7 +1260,7 @@ machine.
>>  \QuickQuizAnswer{
>>         One approach would be to maintain a global approximation
>>         to the value.
>> -       Readers would increment their per-thread variable, but when it
>> +       Updaters would increment their per-thread variable, but when it
>>         reached some predefined limit, atomically add it to a global
>>         variable, then zero their per-thread variable.
>>         This would permit a tradeoff between average increment overhead
>> --
>> 2.7.4
>>
>>
> 

