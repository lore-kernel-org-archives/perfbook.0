Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36311 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751246AbdBXBBc (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 23
 Feb 2017 20:01:32 -0500
Received: by mail-pg0-f66.google.com with SMTP id z128so927063pgb.3 for
 <perfbook@vger.kernel.org>; Thu, 23 Feb 2017 17:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ki84AiuT5xp2L/2zce+uk3Ih9qN3x2aXJCUSHim27RI=;
 b=H+hD7ijBPsN351QqP5SLsILwxvHq0COttZBTl/2z8nDxnYFgEuw/G0obh0U0DZhsKI
 6Z/gJFNOqABKv/mg59t8qdk4W0IHJ7ROkz/j6XM3WTTmzmTN9sqovrPchDVtaPD7XzVn
 1pvi0Gab/ZzlWtDID7dNsnW7/K1bHJE9UUQ/Y87C5FVA88ceJZBcS9cNn4fyNR6z5Jzv
 xc5N0fkNlASh4QdZAkj7jqG6HLiu5SmrZZO8NhYP7kbUTQJVq4bTkDbOBf4OCOE90XJ2
 PhKgJ1sMwn9U3wg+ykquWCUrJ12UyId/PWpt0Z8Bp0CFKnlaLzhC9qflhpzga/LKSKHh
 8EgQ==
Subject: Re: [Question] Quick Quiz 5.17 and cache coherency
References: <18a02fa0-38f3-fa87-6d68-567b3e812e04@gmail.com>
 <eaeecd61-099f-4c2f-f80a-9d27e28467f8@gmail.com>
 <f4b8eeee-4c00-d725-de23-3e278980949d@gmail.com>
 <fda72075-2bca-b0e7-8a6c-3db2d15eeadb@gmail.com>
 <ac6c52c4-38d1-a2dd-76a8-67398f921793@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <28ab1950-222d-3d09-c12e-ffb34dcc8abd@gmail.com>
Date: Fri, 24 Feb 2017 09:01:23 +0800
MIME-Version: 1.0
In-Reply-To: <ac6c52c4-38d1-a2dd-76a8-67398f921793@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On 02/24/2017 06:16 AM, Akira Yokosawa wrote:
> On 2017/02/24 01:02:21 +0800, Yubin Ruan wrote:
>> On 02/23/2017 10:33 PM, Akira Yokosawa wrote:
>>> On 2017/02/23 22:44:41 +0900, Akira Yokosawa wrote:
>>>> On 2017/02/22 21:22:48 +0800, Yubin Ruan wrote:
>>>>> Hi,
>>>>> I am reading chapter 5 and got confused by the answer to Quick Quiz
>>>>> 5.17. So this is an Array-Based Per-thread Eventually Consistent Counter
>>>>> scheme:
>>>>>
>>>>> 1  DEFINE_PER_THREAD(unsigned long, counter);
>>>>> 2  unsigned long global_count;
>>>>> 3  int stopflag;
>>>>> 4
>>>>> 5  void inc_count(void)
>>>>> 6  {
>>>>> 7      ACCESS_ONCE(__get_thread_var(counter))++;
>>>>> 8  }
>>>>> 9
>>>>> 10 unsigned long read_count(void)
>>>>> 11 {
>>>>> 12     return ACCESS_ONCE(global_count);
>>>>> 13 }
>>>>> 14
>>>>> 15 void *eventual(void *arg)
>>>>> 16 {
>>>>> 17     int t;
>>>>> 18     int sum;
>>>>> 19     while (stopflag < 3) {
>>>>> 20         sum = 0;
>>>>> 21         for_each_thread(t)
>>>>> 22             sum += ACCESS_ONCE(per_thread(counter, t));
>>>>> 23         ACCESS_ONCE(global_count) = sum;
>>>>> 24         poll(NULL, 0, 1);
>>>>> 25         if (stopflag) {
>>>>> 26             smp_mb();
>>>>> 27             stopflag++;
>>>>> 28         }
>>>>> 29     }
>>>>> 30     return NULL;
>>>>> 31 }
>>>>> 32
>>>>> 33 void count_init(void)
>>>>> 34 {
>>>>> 35     thread_id_t tid;
>>>>> 36     if (pthread_create(&tid, NULL, eventual, NULL)) {
>>>>> 37         perror("count_init:pthread_create");
>>>>> 38         exit(-1);
>>>>> 39     }
>>>>> 40 }
>>>>> 41
>>>>> 42 void count_cleanup(void)
>>>>> 43 {
>>>>> 44     stopflag = 1;
>>>>> 45     while (stopflag < 3)
>>>>> 46         poll(NULL, 0, 1);
>>>>> 47     smp_mb();
>>>>> 48 }
>>>>>
>>>>>
>>>>> I understand the code. In Quick Quiz 5.17, the question is:
>>>>>
>>>>>     Why _doesn't_ the `inc_count()' in the code above need to use atomic
>>>>>     instructions? After all, we now have multiple threads accessing the
>>>>>     per-thread counters!
>>>>>
>>>>> I think I know the answer to this question: now that you use per-thread
>>>>> variable, you don't need atomic instructions. The scenarios where you
>>>>> need atomic instructions are some places like this:
>>>>>
>>>>> 1 long counter = 0;
>>>>> 2 void inc_count(void)
>>>>> 3 {
>>>>> 4    counter++;  //need atomic instruction
>>>>> 5 }
>>>>> 6
>>>>> 7 long read_count(void)
>>>>> 8 {
>>>>> 9    return counter;
>>>>> 10}
>>>>>
>>>>>
>>>>> But, the answer provided in the book is:
>>>>>
>>>>> <------------------- Answer Begin ---------------------->
>>>>>     Because one of the two threads only reads, and because
>>>>> the variable is aligned and machine-sized, non-atomic instructions
>>>>> suffice. 
>>>>
>>>> Well, I think this sentence explains everything necessary. 
>>>> Since the per-thread counters are also read-accessed from eventual() thread,
>>>> the the increment of the count should look "atomic" from eventual().
>>>> If the variable is *not* machine-sized or unaligned, the increment
>>>> access might need multiple read / write accesses and it would be not
>>>> "atomic" from other thread's point of view.
>>>
>>> This was somewhat confusing. Let me try again.
>>>
>>> Since the per-thread counters are also read-accessed from eventual() thread,
>>> the write access of the increment of the count should look "atomic" from eventual().
>>> If the variable is *not* machine-sized nor aligned, the write of the modified value
>>> might need multiple read / write accesses and they would not be 'atomic" from
>>> other threads' points of view.
>>>
>>> Incrementing a counter is a Read-Modify-Write access. In per-thread counter,
>>> it is not necessary to make the whole RMW access atomic. Only the write of the
>>> incremented value needs to look "atomic".
>>>
>>> By the way, an "unsigned long" variable is machine-sized and aligned on
>>> most compiler-platform combination, but there might be exceptions I suppose.
>>>
>>
>> Thanks for your information!
>>
>>>>
>>>> As as side note, you can see the changes made in this Quick Quiz and Answer
>>>> in the git history.  Actually, the original version (dated 2011-01-01,
>>>> git tag:v2011.01.02a) of the Quiz said:
>>>>
>>>> 	Why does inc_count() in
>>>> 	Figure 5.? (whatever figure number at that time)
>>>> 	need to use atomic instructions?
>>>>
>>>> This was the opposite of the current version.
>>>>
>>>>>          That said, the ACCESS_ONCE() macro is used to prevent
>>>>> compiler optimizations that might otherwise prevent the counter
>>>>> updates from becoming visible to eventual() [Cor12].
>>>>>
>>>>>     An older version of this algorithm did in fact use atomic
>>>>> instructions, kudos to Ersoy Bayramoglu for pointing
>>>>> out that they are in fact unnecessary. That said, atomic
>>>>>                                       ~~~~~~~~~~~~~~~~~
>>>>> instructions would be needed in cases where the per-thread
>>>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> counter variables were smaller than the global global_count.
>>>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>> I suppose Paul added this sentence to explain the case where
>>>> per-thread counter is shorter than machine-size.
>>
>> So, you mean, what he intended to say is something like:
>>
>>     would be needed in cases where the per-thread counter
>>     variables where smaller than machine size
>> ?
> 
> Let's see what Paul want to say. (By the way, this message seems private and
> I kept this reply private.)

sorry I just forgot to `Cc'.

> 
>> But, after all, there is only one thread doing the writing, which mean
>> that we don't need any atomic instruction even the variable `counter' is
>> not properly aligned. right?
> 
> The point is that "counter" is per-thread and is in an array.
> "counter" for another thread is placed next to it in an unaligned way.
> 
> Suppose an architecture which can only do machine-sized, aligned memory accesses.
> A write to an unaligned variable will need the following 4 memory accesses:
> 
>   1.  Read memory including lower part of the variable
>   2.  Read memory including higher part of the variable
>       (Replace the updated part on registers without affecting outside of
>        the variable)
>   3.  Write memory including lower part of the variable
>   4.  Write memory including higher part of the variable
> 
> Can you imagine what happens if another thread also does a write to a neighboring
> counter in a racy timing?
> 
>                               Thanks, Akira
> 

well I didn't expect that. thank you.

regards,
Yubin Ruan

>>
>> regards,
>> Yubin Ruan
>>
>>>>
>>>> I'm sure Paul will give some comment once he recalls the circumstances ;-)
>>>
>>> Now added explicit CC: Paul.
>>>
>>>>
>>>>                                     Thanks, Akira
>>>>
>>>>> However, note that on a 32-bit system, the per-thread counter
>>>>> variables might need to be limited to 32 bits in order to sum
>>>>> them accurately, but with a 64-bit global_count variable to avoid
>>>>> overflow. In this case, it is necessary to zero the per-thread
>>>>> counter variables periodically in order to avoid overflow. It is
>>>>> extremely important to note that this zeroing cannot be delayed too long
>>>>> or overflow of the smaller per-thread variables will result. This
>>>>> approach therefore imposes real-time requirements on the underlying
>>>>> system, and in turn must be used with extreme care.
>>>>>
>>>>>     In contrast, if all variables are the same size, overflow
>>>>> of any variable is harmless because the eventual sum will
>>>>> be modulo the word size.
>>>>> <------------------------ End -------------------------->
>>>>>
>>>>> Although more complicated than I think, I totally fine with this answer,
>>>>> except the sentence with ~~~ under it. Why is that? Why do we need
>>>>> atomic instructions when counter variables were smaller than the global
>>>>> `global_count' ? Also, the second sentence of the question seems to hint
>>>>> about cache coherency, but I cannot see the point :(
>>>>>
>>>>> regards,
>>>>> Yubin Ruan
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>
>>
>> .
>>

