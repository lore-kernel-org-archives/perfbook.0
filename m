Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=tN1xRu7Dlh31wDhZyhqOQRzklb0n72ZGyTCSrLq7NVo=;
 b=T70QvbUE+UxAZS++XrPCNc6hrHt8y4/BwKnwoGQgbyiWQ5Ustk7zxMROuDQlmoHkmi
 QF1WMMaGectZszd0J5UyUojE4UsxUYOavlgaFLlSeXXXKRI9ImLqafPeZ+mZngYPYRHp
 WmMRxtnvYO1dON4I6Qv6RclpndwP/q6GuyMBcJv0ZfjKWtXTCl2UGgJ+OEevTQPnwWyd
 RmfpywyFl+uX3UsQgMPP0dhUQdNgN3JJ/am/CzVusSUTf0o/FS9d7sq4ofy/23FN38Yg
 lyB3L/DJcSf8yND/vZq2s2tMn//AOJ06yZOboqcZoOUcY5OjyTeh2zssKzcIFkTRzbHS
 gKoQ==
MIME-Version: 1.0
In-Reply-To: <07cd658e-d71b-496e-5583-e204ae1c3ebf@gmail.com>
References: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
 <07cd658e-d71b-496e-5583-e204ae1c3ebf@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 9 May 2017 23:21:33 +0800
Message-ID: 
 <CABoNC81561Cdif7=LnT0z3xdkM++Ldznnd5uGNzMuyVv_XU56g@mail.gmail.com>
Subject: Re: [PATCH] Update Answer to Quick Quiz 5.27
Content-Type: text/plain; charset=UTF-8
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

That's the major point. Fair enough :-)


Thanks,
--Jason


On Tue, May 9, 2017 at 10:56 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> On 2017/05/09 16:48:12 +0800, Junchang Wang wrote:
>> Oops. Forgot the summary in previous email. Resend the patch.
>>
>>
>> The Answer to Quick Quiz 5.27 is a bit hard to follow. Rewrite it.
>>
>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> ---
>>  count/count.tex | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/count/count.tex b/count/count.tex
>> index cc47554..6dfc7a6 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -1258,13 +1258,13 @@ machine.
>>       fast and scalable while allowing readers to also enjoy
>>       reasonable performance and scalability?
>>  \QuickQuizAnswer{
>> -     One approach would be to maintain a global approximation
>> -     to the value.
>> -     Readers would increment their per-thread variable, but when it
>> -     reached some predefined limit, atomically add it to a global
>> -     variable, then zero their per-thread variable.
>> -     This would permit a tradeoff between average increment overhead
>> -     and accuracy of the value read out.
>> +     One approach would be to add a global variable maintaining a
>> +     approximation to the exact value. An updater would increment its
>> +     per-thread variable, and when its value reaches predefined limit,
>> +     atomically add the value to the global variable, then zero its
>> +     per-thread variable. Readers simply return the value of global variable,
>> +     enjoying reasonable performance.  This would permit a tradeoff between
>> +     average increment overhead and accuracy of the value read out.
>>
>>       The reader is encouraged to think up and try out other approaches,
>>       for example, using a combining tree.
>>
>
> Hi Junchang,
>
> What confused you seems to be a simple typo.
> Isn't the following one-liner sufficient for you?
>
>                 Thanks, Akira
>
> --8<---->8--
> From 725b32938e0cbc245e5a528fd475951bb8be1de5 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 9 May 2017 23:39:57 +0900
> Subject: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27
>
> Reported-by: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  count/count.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/count/count.tex b/count/count.tex
> index cc47554..096b53d 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -1260,7 +1260,7 @@ machine.
>  \QuickQuizAnswer{
>         One approach would be to maintain a global approximation
>         to the value.
> -       Readers would increment their per-thread variable, but when it
> +       Updaters would increment their per-thread variable, but when it
>         reached some predefined limit, atomically add it to a global
>         variable, then zero their per-thread variable.
>         This would permit a tradeoff between average increment overhead
> --
> 2.7.4
>
>

