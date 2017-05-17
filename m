Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=UpDujjIyUjqbEM1aKXItzW/l5Yk5CHoa00UR4oahmIs=;
 b=AS83RjxQrjc/1AzfmAZ/WA1+7is+sxIHzoyJYWEh1K4CUt+QgMTChgfwxc9tOm0kFW
 2jfuIR8C4yBeSufVgdhGYwlSQpftXXhTmQEN5+lRWUAu6nVIE6Hzl5+AU0DSENLFcoJ2
 ZIJJRO1xT7FWpvQaMl6rt3447M6h5kP8w5ag4gApJAVtH5d4as5hniL4REV00ojgTEEt
 F82W7MplO9SMC3NFBkNF82s8j1DRrSqLrkFZTnf0HieOhkW7ly/0bdYpIQtzBnf+uFSS
 B2Ot+TQ0NDzjIC0PuTJl7a45uFY7CkCXJTVjj0K582B6YumD4L+g3EUW4oRXzFafIi79
 SvTQ==
MIME-Version: 1.0
In-Reply-To: <20170516173331.GF3956@linux.vnet.ibm.com>
References: <1494949452-12455-1-git-send-email-junchangwang@gmail.com>
 <20170516173331.GF3956@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Wed, 17 May 2017 11:39:41 +0800
Message-ID: 
 <CABoNC82QTdg1_xDK+iJ_KeqiP=D9M07q+v4ggfvOBXQjKp4U4A@mail.gmail.com>
Subject: Re: [PATCH v2] count_stat_eventual: Remove unnecessary READ_ONCE()
 and smp_mb()
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, May 17, 2017 at 1:33 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, May 16, 2017 at 11:44:12PM +0800, Junchang Wang wrote:
>> In function eventual(), if the value of stopflag become larger than zero (the
>> ''if'' branch is taken), then only the "eventual( )" thread updates stopflag.
>> So, the READ_ONCE() within the WRITE_ONCE() is not necessary. Remove it.
>>
>> In function count_cleanup(), there is no need to run smp_mb( ) in between
>> statement writing to and statement reading from the same variable, stopflag.
>> Remove smp_mb().
>>
>> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>
> Removing the memory barrier is good.  Removing the stopflag_l local
> variable is presumably intended to remove one load instruction per pass
> through the outer loop, assuming that the stopflag_l variable is kept
> in a register.
>
> Is the performance benefit actually visible?  My guess is "no".
> If the performance is not substantial, my thought would be to keep
> the code simpler, given that this is a textbook.
>

Hi Paul,

Agree. Thanks for the note. Anyway, let's submit a new patch on
smp_mb(), which makes the code correct. For simplifying stopflag, we
can consider submitting a new patch later. How does that sound like?


Thanks,
--Jason


> And yes, there might be other performance-neutral simplifications possible,
> and I would welcome patches to that effect.
>
>                                                         Thanx, Paul
>
>> ---
>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>> index 464de30..1365168 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -40,16 +40,17 @@ void *eventual(void *arg)
>>  {
>>       int t;
>>       unsigned long sum;
>> +     int stopflag_l = 0;
>>
>> -     while (READ_ONCE(stopflag) < 3) {
>> +     while (stopflag_l < 3) {
>>               sum = 0;
>>               for_each_thread(t)
>>                       sum += READ_ONCE(per_thread(counter, t));
>>               WRITE_ONCE(global_count, sum);
>>               poll(NULL, 0, 1);
>> -             if (READ_ONCE(stopflag)) {
>> +             if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>>                       smp_mb();
>> -                     WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>> +                     WRITE_ONCE(stopflag, ++stopflag_l);
>>               }
>>       }
>>       return NULL;
>> @@ -68,7 +69,6 @@ void count_init(void)
>>  void count_cleanup(void)
>>  {
>>       WRITE_ONCE(stopflag, 1);
>> -     smp_mb();
>>       while (READ_ONCE(stopflag) < 3)
>>               poll(NULL, 0, 1);
>>       smp_mb();
>> --
>> 2.7.4
>>
>

