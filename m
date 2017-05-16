Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=oZnHY2AvlqgH7TcHaKTYqS8UQ2vLw1Cu0Mx7BrJYlfI=;
 b=U4/Nls4XKhubdCN7k2Sej4Pv3Oe2uyifyUB+hxENyZND6bglmi4/0S7TgmPzXo2SNJ
 +v5lGrngbmJRUHfX7Zsz1dJK70R1Wf8aIoFeTxEUlHr228cYLLg+2dyqiD3yipVVFlu3
 Fk3VeIOqsvGTC4q9prokc0zSjooCXtAwong4YpKZHTwyP46ZrCzmhAKv0Wu8C0DS/bK+
 Dn0UblcuGvxhW8P9SlmYrIyKiWH3IklzW07v26ei/me912saBLASPHmrxmBqHCoBh/QX
 AedDROIp5E6mNYUZk8rxg3WOu2iKcebrn+C2lAK2iScpDcUMqo8xFHThrrEEhPZdRkGs
 PRdA==
MIME-Version: 1.0
In-Reply-To: <da8ca336-e5e4-88ac-7cc7-857a16f61390@gmail.com>
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-3-git-send-email-junchangwang@gmail.com>
 <82836fa2-dda7-8f20-a686-29b44ece3469@gmail.com>
 <CABoNC83JGhAtJQc3sEGR0VWCM72nObOJrC2RULWy+c3rd6PU-A@mail.gmail.com>
 <da8ca336-e5e4-88ac-7cc7-857a16f61390@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 16 May 2017 21:14:55 +0800
Message-ID: 
 <CABoNC8180xYW6ujNtmVtit=8-rROeD2yY=o+qGfBPB_tYMGNsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] count_stat_eventual: Add READ_ONCE() to protect
 global shared variable stopflag
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks a lot for the comments. Please see below:

On Mon, May 15, 2017 at 6:57 AM, Akira Yokosawa <akiyks@gmail.com> wrote:
> On 2017/05/14 21:28:56 +0800, Junchang Wang wrote:
>> Hi Akira,
>>
>> Good comments! Please see below:
>>
>> On Sun, May 14, 2017 at 6:57 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
>>> Hi Jason & Paul,
>>>
>>> So, here is a comment regarding 2/2 of this patch set.
>>> I'm aware that this patch only touches slow path, but anyway...
>>>
>>> On 2017/05/11 23:03:42 +0800, Junchang Wang wrote:
>>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>>> ---
>>>>  CodeSamples/count/count_stat_eventual.c | 11 ++++++-----
>>>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>>>> index cbde4aa..2caebfd 100644
>>>> --- a/CodeSamples/count/count_stat_eventual.c
>>>> +++ b/CodeSamples/count/count_stat_eventual.c
>>>> @@ -40,15 +40,15 @@ void *eventual(void *arg)
>>>>       int t;
>>>>       unsigned long sum;
>>>>
>>>> -     while (stopflag < 3) {
>>>> +     while (READ_ONCE(stopflag) < 3) {
>>>>               sum = 0;
>>>>               for_each_thread(t)
>>>>                       sum += READ_ONCE(per_thread(counter, t));
>>>>               WRITE_ONCE(global_count, sum);
>>>>               poll(NULL, 0, 1);
>>>> -             if (stopflag) {
>>>> +             if (READ_ONCE(stopflag)) {
>>>>                       smp_mb();
>>>> -                     stopflag++;
>>>> +                     WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>>>
>>> If I'm reading this correctly, the smp_mb() is to ensure the ordering of write
>>> to global_count and write to stopflag.
>>
>> Besides that, smp_mb() is to ensure the correctness of WAR of
>> stopflag, because stopflag works as a shared variable to synchronize
>> two threads. I know it's not necessary for x86/gcc, but as Paul has
>> pointed out, other architectures/Compilers may need it :-).
>
> Well, Section 14.2.9 says:
>
>     3.  A series of stores to a single variable will appear to all CPUs
>         to have occurred in a single order, though this order might not
>         be predictable from the code, and in fact the order might vary
>         from one run to another.
>
> This means that for the value of stopflag, we don't need any memory barrier.
>

You are right. I Need another cup of tea :-)

>>
>>> This "if" branch is taken after
>>> count_cleanup()'s update of stopflag is observed.  After the update,
>>> only the "eventual()" thread updates stopflag. So, the READ_ONCE() within
>>> the WRITE_ONCE() is not necessary.
>>> To make the locality obvious, it might be better to hold the value in an auto
>>> variable.
>>> Here is my version of the entire eventual() function. Note that read of stopflag
>>> is not necessary at the beginning of the while loop.
>>>
>>> void *eventual(void *arg)
>>> {
>>>         int t;
>>>         unsigned long sum;
>>>         int stopflag_l = 0;
>>>
>>>         while (stopflag_l < 3) {
>>>                 sum = 0;
>>>                 for_each_thread(t)
>>>                         sum += READ_ONCE(per_thread(counter, t));
>>>                 WRITE_ONCE(global_count, sum);
>>>                 poll(NULL, 0, 1);
>>>                 if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>>>                         smp_mb();
>>>                         WRITE_ONCE(stopflag, ++stopflag_l);
>>>                 }
>>>         }
>>>         return NULL;
>>> }
>>>
>>
>> Personally, I don't like to add too many implications in the code such
>> as excessive optimizations unless we have a strong reason (performance
>> gain).  Excessive optimizations may confuse compilers and other
>> programmers. But again, I agree your code might be slightly better in
>> performance :-)
> It might be easier to see the purpose of the memory barrier in my version.
> Performance wise, eventual() does not matter much.
>

Sounds reasonable. Your version is easier to get the idea of why
READ_ONCE is here.

>>
>>>>               }
>>>>       }
>>>>       return NULL;
>>>> @@ -66,8 +66,9 @@ void count_init(void)
>>>>
>>>>  void count_cleanup(void)
>>>>  {
>>>> -     stopflag = 1;
>>>> -     while (stopflag < 3)
>>>> +     WRITE_ONCE(stopflag, 1);
>>>> +     smp_mb();
>>>
>>> Is this extra smp_mb() really necessary?
>>> We'll loop until stopflag becomes 3 anyway, we can rely on memory coherency
>>> for the updated value to propagate.
>>>
>>
>> It's necessary to protect RAW of stopflag on weak consistency machines :-).
>
> Ditto.
>

Agree after search. Will submit a new patch to remove the unnecessary
smp_mb() soon. Thanks a lot!

>>
>> Cheers!
>> --Jason
>>
>>>> +     while (READ_ONCE(stopflag) < 3)
>>>>               poll(NULL, 0, 1);
>>>>       smp_mb();
>>>
>>> This smp_mb() pairs with the smp_mb() in eventual() and ensures the value of
>>> global_count to be read in read_count() is the one written preceding the
>>> update of stopflag.
>
> This barrier is necessary because we read both global_count and stopflag.
> Have I made my point clear enough?
>

Agree!

Thanks,
--Jason

>                        Thanks, Akira
>
>>>
>>> Am I reading right?
>>>
>>>                        Thanks, Akira
>>>
>>>>  }
>>>>
>>
>

