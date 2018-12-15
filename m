Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WZzIO5oF0fWlfaQOe/YlO7YIZAEl+mh5/6vZMk53VIA=;
        b=XNSpOT1YyM76m7EHt3Tl470gLO+dByeNet4pGdiKWjJdnWUOS62wi9ZtklL8wbQsAv
         VdU/I78tBSl0YYqsRZx/6FyQqxRzbbfm0SFyTba7vh8gQVdcbb64YrdB3yngjXxN/S6f
         Ji/8Zj6rEezIeJYdCMB1p8Fkc3/SFR9yztT6+GlRkSGjMyO3vdMCM4WHx1T6x7aMOLxy
         o+erylAIIA0TPMOYdnRbEINPFnEj7UNuQ8BpuTy8lVaTTS/luTbz0NTbDIX/gHz8Ft7L
         uewxt5yS1ZmPt4NtzqhcPz/Q5qyXK0tvtKQSVgiKW5GwVWSsuAoQqHwETe7X43w7lGA5
         BsLw==
Subject: Re: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
 <98448fa1-c391-fdfe-22fa-803dacd72749@gmail.com>
 <43a14ef6-0fba-7619-b385-475940f244ac@gmail.com>
 <de0e1451-8978-416f-f917-486a83c025c6@gmail.com>
 <635d551c-624c-4953-b23f-89af898ba712@gmail.com>
 <20181215193744.GY4170@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f93f136d-1cdd-dafd-ee45-6e1e88906ae9@gmail.com>
Date: Sun, 16 Dec 2018 08:42:56 +0900
MIME-Version: 1.0
In-Reply-To: <20181215193744.GY4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/12/15 11:37:44 -0800, Paul E. McKenney wrote:
> On Sun, Dec 16, 2018 at 12:10:18AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> There is something I want to make sure.
>> Please see inline comment below.
>>
>> On 2018/12/14 00:33:15 +0900, Akira Yokosawa wrote:
>>> On 2018/12/13 00:01:33 +0800, Junchang Wang wrote:
>>>> On 12/11/18 11:42 PM, Akira Yokosawa wrote:
>>>>> From 7e7c3a20d08831cd64b77a4e8d8f693b4725ef89 Mon Sep 17 00:00:00 2001
>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>> Date: Tue, 11 Dec 2018 21:37:11 +0900
>>>>> Subject: [PATCH 3/4] CodeSamples: Fix definition of cmpxchg() in api-gcc.h
>>>>>
>>>>> Do the same change as CodeSamples/formal/litmus/api.h.
>>>>>
>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>> ---
>>>>>  CodeSamples/api-pthreads/api-gcc.h | 5 +++--
>>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
>>>>> index 3afe340..b66f4b9 100644
>>>>> --- a/CodeSamples/api-pthreads/api-gcc.h
>>>>> +++ b/CodeSamples/api-pthreads/api-gcc.h
>>>>> @@ -168,8 +168,9 @@ struct __xchg_dummy {
>>>>>  ({ \
>>>>>  	typeof(*ptr) _____actual = (o); \
>>>>>  	\
>>>>> -	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>>>>> -			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
>>>>> +	__atomic_compare_exchange_n((ptr), (void *)&_____actual, (n), 0, \
>>>>> +			__ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
>>>>> +	_____actual; \
>>>>>  })
>>>>>  
>>>>
>>>> Hi Akira,
>>>>
>>>> Another reason that the performance of cmpxchg is catching up with cmpxchg_weak is that __ATOMIC_SEQ_CST is replaced by __ATOMIC_RELAXED in this patch. The use of __ATOMIC_RELAXED means if the CAS primitive fails, the relaxed semantic is used, rather than sequential consistent. Following are some experiment results:
>>>>
>>>> # If __ATOMIC_RELAXED is used for both cmpxchg and cmpxchg_weak
>>>>
>>>> ./count_lim_atomic 64 uperf
>>>> ns/update: 290
>>>>
>>>> ./count_lim_atomic_weak 64 uperf
>>>> ns/update: 301
>>>>
>>>>
>>>> # and then if __ATOMIC_SEQ_CST is used for both cmpxchg and cmpxchg_weak
>>>>
>>>> ./count_lim_atomic 64 uperf
>>>> ns/update: 316
>>>>
>>>> ./count_lim_atomic_weak 64 uperf
>>>> ns/update: 302
>>>>
>>>> ./count_lim_atomic 120 uperf
>>>> ns/update: 630
>>>>
>>>> ./count_lim_atomic_weak 120 uperf
>>>> ns/update: 568
>>>>
>>>> The results show that if we want to ensure sequential consistency when the CAS primitive fails, cmpxchg_weak performs better than cmpxchg. It seems that the (type of variation, failure_memorder) pair affects performance. I know that PPC uses LL/SC to simulate CAS. But what's the relationship between a simulated CAS and the memory order. This is interesting because as far as I know, PPC and ARM are using LL/SC to simulate atomic primitives such as CAS and FAA. So FAA might have the same behavior.
>>>>
>>>> In actually, I'm not very clear about the meaning of different types of failure memory orders. For example, when should we use __ATOMIC_RELAXED, rather than __ATOMIC_SEQ_CST, if a CAS fails? What happen if __ATOMIC_RELAXED is used for x86? The one I'm look at is https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html . Do you know some resources about this? I can look into this tomorrow. Thanks.
>>>
>>> Hi Junchang,
>>>
>>> In Linux-kernel speak, Documentation/core-api/atomic.rst says:
>>>
>>> --------------------------------------------------------------------------
>>> atomic_xchg must provide explicit memory barriers around the operation. ::
>>>
>>> 	int atomic_cmpxchg(atomic_t *v, int old, int new);
>>>
>>> This performs an atomic compare exchange operation on the atomic value v,
>>> with the given old and new values. Like all atomic_xxx operations,
>>> atomic_cmpxchg will only satisfy its atomicity semantics as long as all
>>> other accesses of \*v are performed through atomic_xxx operations.
>>>
>>> atomic_cmpxchg must provide explicit memory barriers around the operation,
>>> although if the comparison fails then no memory ordering guarantees are
>>> required.
>>>
>>> [snip]
>>>
>>> The routines xchg() and cmpxchg() must provide the same exact
>>> memory-barrier semantics as the atomic and bit operations returning
>>> values.
>>> --------------------------------------------------------------------------
>>>
>>> The 2nd __ATOMIC_RELAXED to __atomic_compare_exchange_n() matches this
>>> lack of requirement.
>>>
>>> On x86_64, __atomic_compare_exchange_n() is translated to the same code
>>> in both cases  (with the help of litmus7's cross compiling):
>>>
>>> #START _litmus_P1
>>> 	xorl	%eax, %eax
>>> 	movl	$0, 4(%rsp)
>>> 	lock cmpxchgl	%r10d, (%rdx)
>>> 	je	.L36
>>> 	movl	%eax, 4(%rsp)
>>> .L36:
>>> 	movl	4(%rsp), %eax
>>>
>>> There is no difference between the code with __ATOMIC_RELAXED and
>>> the code with __ATOMIC_SEQ_CST as the 2nd parameter. As you can see,
>>> there is no memory barrier instruction emitted.
>>>
>>> On PPC, there is a difference. With __ATOMIC_RELAXED as 2nd parameter,
>>> the code looks like:
>>>
>>> #START _litmus_P1
>>>         sync
>>> .L34:
>>>         lwarx 7,0,9
>>>         cmpwi 0,7,0
>>>         bne 0,.L35
>>>         stwcx. 5,0,9
>>>         bne 0,.L34
>>>         isync
>>> .L35:
>>>
>>> , OTOH with __ATOMIC_SEQ_CST as 2nd argument:
>>>
>>> #START _litmus_P1
>>>         sync
>>> .L34:
>>>         lwarx 7,0,9
>>>         cmpwi 0,7,0
>>>         bne 0,.L35
>>>         stwcx. 5,0,9
>>>         bne 0,.L34
>>> .L35:
>>>         isync
>>>
>>
>> In this asm code snippets, the barrier instruction at the end of
>> cmpxchg() is "isync".
>>
>> In arch/powerpc/include/asm/synch.h of Linux kernel source tree,
>> both PPC_ATOMIC_ENTRY_BARRIER and PPC_ATOMIC_EXIT_BARRIER are
>> defined as '"\n" stringify_in_c(sync) "\n"', which will result
>> in "sync".
>>
>> IIUC, "isync" of PowerPC is not good enough for __ATOMIC_SEQ_CST,
>> is it?
> 
> By itself, no, but in combination with the "sync" instruction at
> the beginning, combined with the ordering of other __ATOMIC_SEQ_CST
> operations, it actually is sufficient.  For more information, please
> see:
> 
> http://open-std.org/jtc1/sc22/wg21/docs/papers/2008/n2745.html
> 
> And this is an update that is mostly irrelevant on modern hardware:
> 
> http://www.rdrop.com/users/paulmck/scalability/paper/N2745r.2011.03.04a.html
> 
> Note also that an lwsync instruction can be substituted for each isync,
> which can sometimes provide better performance.

Now I'm wondering why PPC_ATOMIC_EXIT_BARRIER is defined as
'"\n" stringify_in_c(sync) "\n"' rather than
'"\n" stringify_in_c(isync) "\n"' (or '"\n" stringify_in_c(LWSYNC) "\n"')
in arch/powerpc/include/asm/synch.h.

???

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>> See the difference of position of label .L35.
>>> (Note that we are talking about strong version of cmpxchg().)
>>>
>>> Does the above example make sense to you?
>>>
>>>         Thanks, Akira
>>>
>>>>
>>>>
>>>> --Junchang
>>>>
>>>>
>>>>
>>>>>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
>>>>>
>>>
>>
> 

