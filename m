Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5To9KgfgXymywuaUKAKqSn5ELM+s46YCdgwEhM2g+7I=;
        b=gVZ2qtsi8Ngq3qQFNnr+os9ip8BCjV2LKrdILNQKevxb18nCp66op2wef8B23xWq49
         qV9zihFNnXWcpCx/vC8WVR8vWNgoPHzpjJqP0p17jlpaxL4ohkcyCkSx3USeyrSb4+vK
         Gycy5be5fpf0CcqmiLIPncn+V3CepUf389NwZ647JT7Tdxaskg3B24LFgvqQ4Obt8b4u
         j047+wvkxU7Oy/dNlhs0DIhXn46/082e73JAuy1nqg+JuCyqgoM1n/A8e+8XHUyR7RFf
         lahyWVjciVsssuBX7vF+KkX21UAouSSAnmJh0sUy0yUWCGCvewuj/b0BN0g+vmMeiEYZ
         8SCA==
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7d05648a-e61d-f90b-ee04-df04179e6721@gmail.com>
Date: Thu, 25 Oct 2018 21:23:54 +0900
MIME-Version: 1.0
In-Reply-To: <20181025094516.GO4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/25 02:45:16 -0700, Paul E. McKenney wrote:
> On Thu, Oct 25, 2018 at 10:11:18AM +0800, Junchang Wang wrote:
>> Hi Akira,
>>
>> Thanks for the mail. My understanding is that PPC uses LL/SC to
>> emulate CAS by using a tiny loop. Unfortunately, the LL/SC loop itself
>> could fail (due to, for example, context switches) even if *ptr equals
>> to old. In such a case, a CAS instruction in actually should return a
>> success. I think this is what the term "spurious fail" describes. Here
>> is a reference:
>> http://liblfds.org/mediawiki/index.php?title=Article:CAS_and_LL/SC_Implementation_Details_by_Processor_family
> 
> First, thank you both for your work on this!  And yes, my cmpxchg() code
> is clearly quite broken.
> 
>> It seems that __atomic_compare_exchange_n() provides option "weak" for
>> performance. I tested these two solutions and got the following
>> results:
>>
>>                            1      4      8     16     32    64
>> my patch (ns)     35    34    37    73    142  281
>> strong (ns)          39    39    41    79    158  313
> 
> So strong is a bit slower, correct?

Emitted code of strong has an extra conditional branch instruction for
retry loop.

Diff of disassembled code of atomic_cmpxchg (current master vs. strong):

@@ -23,14 +23,15 @@
 ac 04 00 7c 	hwsync
 28 40 40 7d 	lwarx   r10,0,r8
 00 30 8a 7f 	cmpw    cr7,r10,r6
-0c 00 9e 40 	bne     cr7,bc4 <atomic_cmpxchg+0x6c>
+10 00 9e 40 	bne     cr7,bc8 <atomic_cmpxchg+0x70>
 2d 41 e0 7c 	stwcx.  r7,0,r8
 00 00 80 4f 	mcrf    cr7,cr0
+ec ff 9e 40 	bne     cr7,bb0 <atomic_cmpxchg+0x58>  <--- extra branch
 2c 01 00 4c 	isync
 26 10 10 7d 	mfocrf  r8,1
 fe ff 08 55 	rlwinm  r8,r8,31,31,31
 00 00 88 2f 	cmpwi   cr7,r8,0
-08 00 9e 40 	bne     cr7,bdc <atomic_cmpxchg+0x84>
+08 00 9e 40 	bne     cr7,be0 <atomic_cmpxchg+0x88>
 00 00 49 91 	stw     r10,0(r9)
 34 00 3f 81 	lwz     r9,52(r31)
 b4 07 29 7d 	extsw   r9,r9
[...]

> 
>> I tested the performance of count_lim_atomic by varying the number of
>> updaters (./count_lim_atomic N uperf) on a 8-core PPC server. The
>> first row in the table is the result when my patch is used, and the
>> second row is the result when the 4th argument of the function is set
>> to false(0). It seems performance improves slightly if option "weak"
>> is used. However, there is no performance boost as we expected. So
>> your solution sounds good if safety is one major concern because
>> option "weak" seems risky to me :-)
>>
>> Another interesting observation is that the performance of LL/SC-based
>> CAS instruction deteriorates dramatically when the number of working
>> threads exceeds the number of CPU cores.
> 
> If weak is faster, would it make sense to return (~o), that is,
> the bitwise complement of the expected arguement, when the weak
> __atomic_compare_exchange_n() fails?  This would get the improved
> performance (if I understand your results above) while correctly handling
> the strange (but possible) case where o==n.
> 
> Does that make sense, or am I missing something?

Sounds reasonable to me.

        Thanks, Akira
>
> 							Thanx, Paul
> 
>> Thanks,
>> --Junchang
>>
>>
>> On Thu, Oct 25, 2018 at 6:05 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>>>
>>> On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
>>>> Hi Akira and Paul,
>>>>
>>>> I checked the code today and the implementation of cmpxchg() looks
>>>> very suspicious to me; Current  cmpxchg() first executes function
>>>> __atomic_compare_exchange_n, and then checks whether the value stored
>>>> in field __actual (old) has been changed to decide if the CAS
>>>> instruction has been successfully performed. However, I saw the *weak*
>>>> field is set, which, as far as I know, means
>>>> __atomic_compare_exchange_n could fail even if the value of *ptr is
>>>> equal to __actual (old). Unfortunately, current cmpxchg will treat
>>>> this case as a success because the value of __actual(old) does not
>>>> change.
>>>
>>> Thanks for looking into this!
>>>
>>> I also suspected the use of "weak" semantics of
>>> __atomic_compare_exchange_n(), but did not quite understand what
>>> "spurious fail" actually means. Your theory sounds plausible to me.
>>>
>>> I've suggested in a private email to Paul to modify the 4th argument
>>> to false(0) as a workaround, which would prevent such "spurious fail".
>>>
>>> Both approaches looks good to me. I'd defer to Paul on the choice.
>>>
>>>         Thanks, Akira
>>>
>>>>
>>>> This bug happens in both Power8 and ARMv8. It seems it affects
>>>> architectures that use LL/SC to emulate CAS. Following patch helps
>>>> solve this issue on my testbeds. Please take a look. Any thoughts?
>>>>
>>>> ---
>>>>  CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/CodeSamples/api-pthreads/api-gcc.h
>>>> b/CodeSamples/api-pthreads/api-gcc.h
>>>> index 1dd26ca..38a16c0 100644
>>>> --- a/CodeSamples/api-pthreads/api-gcc.h
>>>> +++ b/CodeSamples/api-pthreads/api-gcc.h
>>>> @@ -166,11 +166,9 @@ struct __xchg_dummy {
>>>>
>>>>  #define cmpxchg(ptr, o, n) \
>>>>  ({ \
>>>> -       typeof(*ptr) _____actual = (o); \
>>>> -       \
>>>> -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>>>> -                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
>>>> -       _____actual; \
>>>> +       typeof(*ptr) old = (o); \
>>>> +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
>>>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>>>> +                               (o) : (n); \
>>>>  })
>>>>
>>>>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
>>>>
>>>
>>
> 

