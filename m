Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sxllV7llipd4s1wL44TT3/uLCHlDHxTrOZcXWspTTjc=;
 b=TjgF9DzzpPABNVCNMDsrzLYhX3ybeaP8Vq/2pRjunDYF742IHBGBuH3dMRlT+JuNTl
 pqYlVLbTG8zCx+LBIp4CiZHmew79F/YbvBo6ropfQ7HLcaVKPBa39XbP98Cpe1CpvOGK
 Sqeir63JwmdivtS4flz5xW1VQrHG65prKoz6AI+whOZgc7iya8Dopj7zrmGhwnIj+t4w
 y69svwGL9yaVbUdU2MTAheDP+WFBgUz6wMSUHaPe5wd7TaN6u78ewaHelGhFupV7NOrO
 XnKYwM0Hw8u0bAgf/bLItsLbehKsXSb+KpUYbOnx5t8sXOC1vxVG1vxO+/jZqm1nxbLB
 XRoA==
Subject: Re: [PATCH 2/2] count_stat_eventual: Add READ_ONCE() to protect
 global shared variable stopflag
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-3-git-send-email-junchangwang@gmail.com>
 <82836fa2-dda7-8f20-a686-29b44ece3469@gmail.com>
 <CABoNC83JGhAtJQc3sEGR0VWCM72nObOJrC2RULWy+c3rd6PU-A@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <da8ca336-e5e4-88ac-7cc7-857a16f61390@gmail.com>
Date: Mon, 15 May 2017 07:57:20 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CABoNC83JGhAtJQc3sEGR0VWCM72nObOJrC2RULWy+c3rd6PU-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/14 21:28:56 +0800, Junchang Wang wrote:
> Hi Akira,
> 
> Good comments! Please see below:
> 
> On Sun, May 14, 2017 at 6:57 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
>> Hi Jason & Paul,
>>
>> So, here is a comment regarding 2/2 of this patch set.
>> I'm aware that this patch only touches slow path, but anyway...
>>
>> On 2017/05/11 23:03:42 +0800, Junchang Wang wrote:
>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>> ---
>>>  CodeSamples/count/count_stat_eventual.c | 11 ++++++-----
>>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>>> index cbde4aa..2caebfd 100644
>>> --- a/CodeSamples/count/count_stat_eventual.c
>>> +++ b/CodeSamples/count/count_stat_eventual.c
>>> @@ -40,15 +40,15 @@ void *eventual(void *arg)
>>>       int t;
>>>       unsigned long sum;
>>>
>>> -     while (stopflag < 3) {
>>> +     while (READ_ONCE(stopflag) < 3) {
>>>               sum = 0;
>>>               for_each_thread(t)
>>>                       sum += READ_ONCE(per_thread(counter, t));
>>>               WRITE_ONCE(global_count, sum);
>>>               poll(NULL, 0, 1);
>>> -             if (stopflag) {
>>> +             if (READ_ONCE(stopflag)) {
>>>                       smp_mb();
>>> -                     stopflag++;
>>> +                     WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>>
>> If I'm reading this correctly, the smp_mb() is to ensure the ordering of write
>> to global_count and write to stopflag.
> 
> Besides that, smp_mb() is to ensure the correctness of WAR of
> stopflag, because stopflag works as a shared variable to synchronize
> two threads. I know it's not necessary for x86/gcc, but as Paul has
> pointed out, other architectures/Compilers may need it :-).

Well, Section 14.2.9 says:

    3.  A series of stores to a single variable will appear to all CPUs
        to have occurred in a single order, though this order might not
        be predictable from the code, and in fact the order might vary
        from one run to another.

This means that for the value of stopflag, we don't need any memory barrier.

> 
>> This "if" branch is taken after
>> count_cleanup()'s update of stopflag is observed.  After the update,
>> only the "eventual()" thread updates stopflag. So, the READ_ONCE() within
>> the WRITE_ONCE() is not necessary.
>> To make the locality obvious, it might be better to hold the value in an auto
>> variable.
>> Here is my version of the entire eventual() function. Note that read of stopflag
>> is not necessary at the beginning of the while loop.
>>
>> void *eventual(void *arg)
>> {
>>         int t;
>>         unsigned long sum;
>>         int stopflag_l = 0;
>>
>>         while (stopflag_l < 3) {
>>                 sum = 0;
>>                 for_each_thread(t)
>>                         sum += READ_ONCE(per_thread(counter, t));
>>                 WRITE_ONCE(global_count, sum);
>>                 poll(NULL, 0, 1);
>>                 if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>>                         smp_mb();
>>                         WRITE_ONCE(stopflag, ++stopflag_l);
>>                 }
>>         }
>>         return NULL;
>> }
>>
> 
> Personally, I don't like to add too many implications in the code such
> as excessive optimizations unless we have a strong reason (performance
> gain).  Excessive optimizations may confuse compilers and other
> programmers. But again, I agree your code might be slightly better in
> performance :-)
It might be easier to see the purpose of the memory barrier in my version.
Performance wise, eventual() does not matter much.

> 
>>>               }
>>>       }
>>>       return NULL;
>>> @@ -66,8 +66,9 @@ void count_init(void)
>>>
>>>  void count_cleanup(void)
>>>  {
>>> -     stopflag = 1;
>>> -     while (stopflag < 3)
>>> +     WRITE_ONCE(stopflag, 1);
>>> +     smp_mb();
>>
>> Is this extra smp_mb() really necessary?
>> We'll loop until stopflag becomes 3 anyway, we can rely on memory coherency
>> for the updated value to propagate.
>>
> 
> It's necessary to protect RAW of stopflag on weak consistency machines :-).

Ditto.

> 
> Cheers!
> --Jason
> 
>>> +     while (READ_ONCE(stopflag) < 3)
>>>               poll(NULL, 0, 1);
>>>       smp_mb();
>>
>> This smp_mb() pairs with the smp_mb() in eventual() and ensures the value of
>> global_count to be read in read_count() is the one written preceding the
>> update of stopflag.

This barrier is necessary because we read both global_count and stopflag.
Have I made my point clear enough?

                       Thanks, Akira

>>
>> Am I reading right?
>>
>>                        Thanks, Akira
>>
>>>  }
>>>
> 

