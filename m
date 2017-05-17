Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nbabn7RNic/ykoUDo6AAjefbNo+qL4UGLsXd+ly54xw=;
 b=p2B37g0tYBRXZn6bUfSMppJWplR4votBzVRRuKVb7QOas61HzkiwIIdLXoccFHs7R1
 kkHxV9ELVu3WD0ZadWiDQj2uW2R8gP9EOTZmRS6K4xMQiRNFqoWEFQDBP9MwYAnn0V/p
 FSabcrY3486Mi+MUCe8lgFBqUsnWm2RrwDdTK3qYwvbfv8Dc3u/UgGEQ3DLOCB5yjhaJ
 di34xyWbO/TJBkidLRdaJ+PSG1q2pKtVo4lhlW84hc9U5v9JMdxXq2F0QiFVq+CJ8lB8
 N8XzOz6wKNPfL3jOyOQ3w4dlvDU06qIJQTCY6ETUyAWZmA+cdXMGykZx2sXX4V7Yug4p
 ABwQ==
Subject: Re: [PATCH v2] count_stat_eventual: Remove unnecessary READ_ONCE()
 and smp_mb()
References: <1494949452-12455-1-git-send-email-junchangwang@gmail.com>
 <20170516173331.GF3956@linux.vnet.ibm.com>
 <CABoNC82QTdg1_xDK+iJ_KeqiP=D9M07q+v4ggfvOBXQjKp4U4A@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b2058a50-3932-a9e2-69ad-f59fbfb7eb66@gmail.com>
Date: Thu, 18 May 2017 07:44:10 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CABoNC82QTdg1_xDK+iJ_KeqiP=D9M07q+v4ggfvOBXQjKp4U4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/05/17 11:39:41 +0800, Junchang Wang wrote:
> On Wed, May 17, 2017 at 1:33 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
>> On Tue, May 16, 2017 at 11:44:12PM +0800, Junchang Wang wrote:
>>> In function eventual(), if the value of stopflag become larger than zero (the
>>> ''if'' branch is taken), then only the "eventual( )" thread updates stopflag.
>>> So, the READ_ONCE() within the WRITE_ONCE() is not necessary. Remove it.
>>>
>>> In function count_cleanup(), there is no need to run smp_mb( ) in between
>>> statement writing to and statement reading from the same variable, stopflag.
>>> Remove smp_mb().
>>>
>>> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>
>> Removing the memory barrier is good.  Removing the stopflag_l local
>> variable is presumably intended to remove one load instruction per pass
>> through the outer loop, assuming that the stopflag_l variable is kept
>> in a register.
>>
>> Is the performance benefit actually visible?  My guess is "no".
>> If the performance is not substantial, my thought would be to keep
>> the code simpler, given that this is a textbook.
>>
> 
> Hi Paul,
> 
> Agree. Thanks for the note. Anyway, let's submit a new patch on
> smp_mb(), which makes the code correct. For simplifying stopflag, we
> can consider submitting a new patch later. How does that sound like?

Hi Jason & Paul,

For a material in Chapter 5, I agree that removing excess READ_ONCE()
is not necessary.

Such optimizations could be discussed somewhere (maybe a Quick Quiz)
in Chapter 14, but I'm not sure. 

So, the revised patch just removing a smp_mb() looks good to me.

                Thanks, Akira.

> 
> 
> Thanks,
> --Jason
> 
> 
>> And yes, there might be other performance-neutral simplifications possible,
>> and I would welcome patches to that effect.
>>
>>                                                         Thanx, Paul
>>
>>> ---
>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>>> index 464de30..1365168 100644
>>> --- a/CodeSamples/count/count_stat_eventual.c
>>> +++ b/CodeSamples/count/count_stat_eventual.c
>>> @@ -40,16 +40,17 @@ void *eventual(void *arg)
>>>  {
>>>       int t;
>>>       unsigned long sum;
>>> +     int stopflag_l = 0;
>>>
>>> -     while (READ_ONCE(stopflag) < 3) {
>>> +     while (stopflag_l < 3) {
>>>               sum = 0;
>>>               for_each_thread(t)
>>>                       sum += READ_ONCE(per_thread(counter, t));
>>>               WRITE_ONCE(global_count, sum);
>>>               poll(NULL, 0, 1);
>>> -             if (READ_ONCE(stopflag)) {
>>> +             if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>>>                       smp_mb();
>>> -                     WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>>> +                     WRITE_ONCE(stopflag, ++stopflag_l);
>>>               }
>>>       }
>>>       return NULL;
>>> @@ -68,7 +69,6 @@ void count_init(void)
>>>  void count_cleanup(void)
>>>  {
>>>       WRITE_ONCE(stopflag, 1);
>>> -     smp_mb();
>>>       while (READ_ONCE(stopflag) < 3)
>>>               poll(NULL, 0, 1);
>>>       smp_mb();
>>> --
>>> 2.7.4
>>>
>>
> 

