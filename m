Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PhghAGJ5OzlSASr64r8zgSkTTl+S2QdgDRNJDpRboSM=;
        b=YjFvIEADEpcFCTdcFpkRcCFhRRmdu0RSufBONGxazvngQlDKQUz9zBa9opoz7LK45F
         nLfMqDUFNDkdW66eFKxXvGFfyWJ+iX1EoHrf9B2xnMt4/yc05catVCZmOvRS9CdI2Grs
         VWVY0OR0LqDK5QTcsT/C+qwyHtuFgmvPHjhw3JlGOXEmgsZYTP9YisraAus1ewQyxJIx
         Nb4bKMSe+hBD5fxGf/8bK+pCdgbOcfDiFXzS/FIb2nO7mT/BY+khyMUzOLOPaQn8ESFm
         /b0d71Y/c+zPIWxLoCReiy9MXSkVBWEmL3kXmut+MRNLrLXbAnLM5YwYJEFAoCzMqleZ
         j2dA==
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com>
 <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
 <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
Date: Fri, 26 Oct 2018 07:04:01 +0900
MIME-Version: 1.0
In-Reply-To: <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/26 0:17, Akira Yokosawa wrote:
> On 2018/10/25 23:09, Junchang Wang wrote:
>> On Thu, Oct 25, 2018 at 5:45 PM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>>>
>>> On Thu, Oct 25, 2018 at 10:11:18AM +0800, Junchang Wang wrote:
>>>> Hi Akira,
>>>>
>>>> Thanks for the mail. My understanding is that PPC uses LL/SC to
>>>> emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop itself
>>>> could fail (due to, for example, context switches) even if *ptr equals
>>>> to old. In such a case, a CAS instruction in actually should return a
>>>> success. I think this is what the term "spurious fail" describes. Here
>>>> is a reference:
>>>> http://liblfds.org/mediawiki/index.php?title=Article:CAS_and_LL/SC_Implementation_Details_by_Processor_family
>>>
>>> First, thank you both for your work on this!  And yes, my cmpxchg() code
>>> is clearly quite broken.
>>>
>>>> It seems that __atomic_compare_exchange_n() provides option "weak" for
>>>> performance. I tested these two solutions and got the following
>>>> results:
>>>>
>>>>                            1      4      8     16     32    64
>>>> my patch (ns)     35    34    37    73    142  281
>>>> strong (ns)          39    39    41    79    158  313
>>>
>>> So strong is a bit slower, correct?
>>>
>>>> I tested the performance of count_lim_atomic by varying the number of
>>>> updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
>>>> first row in the table is the result when my patch is used, and the
>>>> second row is the result when the 4th argument of the function is set
>>>> to false(0). It seems performance improves slightly if option "weak"
>>>> is used. However, there is no performance boost as we expected. So
>>>> your solution sounds good if safety is one major concern because
>>>> option "weak" seems risky to me :-)
>>>>
>>>> Another interesting observation is that the performance of LL/SC-based
>>>> CAS instruction deteriorates dramatically when the number of working
>>>> threads exceeds the number of CPU cores.
>>>
>>> If weak is faster, would it make sense to return (~o), that is,
>>> the bitwise complement of the expected arguement, when the weak
>>> __atomic_compare_exchange_n() fails?  This would get the improved
>>> performance (if I understand your results above) while correctly handling
>>> the strange (but possible) case where o==n.
>>>
>>> Does that make sense, or am I missing something?
>>
>> Hi Paul and Akira,
>>
>> Yes, the weak version is faster. The solution looks good. But when I
>> tried to use the following patch
>>
>> #define cmpxchg(ptr, o, n) \
>> ({ \
>>         typeof(*ptr) old = (o); \
>>         (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
> 
> You need a "\" at the end of the line above. (If it was not unintentionally
> wrapped.)
> 
> If it was wrapped by your mailer, which is troublesome in sending patches,
> please refer to:
> 
> https://www.kernel.org/doc/html/latest/process/email-clients.html.
> 
>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>>                                 (o) : (~o); \
>> })
>>
>> gcc complains of my use of complement symbol
>>
>> ../api.h:769:12: error: wrong type argument to bit-complement
>>      (o) : (~o); \
>>               ^
>>
>> Any suggestions?
> 
> I don't see such error if I add the "\" mentioned above.
> Or do you use some strict error checking option of GCC?

Ah, I see that the error in compiling CodeSamples/advsync/q.c.

The call site is:

struct el *q_pop(struct queue *q)
{
	struct el *p;
	struct el *pnext;

	for (;;) {
		do {
			p = q->head;
			pnext = p->next;
			if (pnext == NULL)
				return NULL;
		} while (cmpxchg(&q->head, p, pnext) != p);
		if (p != &q->dummy)
			return p;
		q_push(&q->dummy, q);
		if (q->head == &q->dummy)
			return NULL;
	}
}

In this case, p and pnext are pointers, hence the error.
returning (o)+1 instead should be OK in this case.

But now, "count_lim_atomic 3 hog" says:

    FAIL: only reached -1829 rather than 0

on x86_64. Hmm. No such error is observed on POWER8.
Hmm...

The strong version works both on x86_64 and POWER8.

        Thanks, Akira

> 
>         Thanks, Akira
> 
>>
>> Thanks,
>> --Junchang
>>
>>
>>>
>>>                                                         Thanx, Paul
>>>
>>>> Thanks,
>>>> --Junchang
>>>>
>>>>
>>>> On Thu, Oct 25, 2018 at 6:05 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>>>>>
>>>>> On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
>>>>>> Hi Akira and Paul,
>>>>>>
>>>>>> I checked the code today and the implementation of cmpxchg() looks
>>>>>> very suspicious to me; Current  cmpxchg() first executes function
>>>>>> __atomic_compare_exchange_n, and then checks whether the value stored
>>>>>> in field __actual (old) has been changed to decide if the CAS
>>>>>> instruction has been successfully performed. However, I saw the *weak*
>>>>>> field is set, which, as far as I know, means
>>>>>> __atomic_compare_exchange_n could fail even if the value of *ptr is
>>>>>> equal to __actual (old). Unfortunately, current cmpxchg will treat
>>>>>> this case as a success because the value of __actual(old) does not
>>>>>> change.
>>>>>
>>>>> Thanks for looking into this!
>>>>>
>>>>> I also suspected the use of "weak" semantics of
>>>>> __atomic_compare_exchange_n(), but did not quite understand what
>>>>> "spurious fail" actually means. Your theory sounds plausible to me.
>>>>>
>>>>> I've suggested in a private email to Paul to modify the 4th argument
>>>>> to false(0) as a workaround, which would prevent such "spurious fail".
>>>>>
>>>>> Both approaches looks good to me. I'd defer to Paul on the choice.
>>>>>
>>>>>         Thanks, Akira
>>>>>
>>>>>>
>>>>>> This bug happens in both Power8 and ARMv8. It seems it affects
>>>>>> architectures that use LL/SC to emulate CAS. Following patch helps
>>>>>> solve this issue on my testbeds. Please take a look. Any thoughts?
>>>>>>
>>>>>> ---
>>>>>>  CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
>>>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/CodeSamples/api-pthreads/api-gcc.h
>>>>>> b/CodeSamples/api-pthreads/api-gcc.h
>>>>>> index 1dd26ca..38a16c0 100644
>>>>>> --- a/CodeSamples/api-pthreads/api-gcc.h
>>>>>> +++ b/CodeSamples/api-pthreads/api-gcc.h
>>>>>> @@ -166,11 +166,9 @@ struct __xchg_dummy {
>>>>>>
>>>>>>  #define cmpxchg(ptr, o, n) \
>>>>>>  ({ \
>>>>>> -       typeof(*ptr) _____actual = (o); \
>>>>>> -       \
>>>>>> -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>>>>>> -                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
>>>>>> -       _____actual; \
>>>>>> +       typeof(*ptr) old = (o); \
>>>>>> +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
>>>>>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>>>>>> +                               (o) : (n); \
>>>>>>  })
>>>>>>
>>>>>>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
>>>>>>
>>>>>
>>>>
>>>
> 

