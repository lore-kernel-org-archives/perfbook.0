Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KNiJdAopX2jMTvCeruKoy09ONyPsw3ZdwbKa3kL8wlw=;
        b=tasExTM2coeTdejCeiTRZpVOgwrF55s6O8Vi5AFiw26K6mjBsQKHYBLDz1W3XNH9Hp
         e7lYs+qAqCC4/+vTkSPweKmb+GEBebO3i0kWasWYh//dIIJ8wWIURJGRIvFr5hgg051q
         epcbwkxRVK3kL7X+dLY5C8QbEaI9FNhguNov2ciTOgDd+3RZz1aSMSt9ZHtjlJSALZlG
         SnQNFQM4sMG4xu49mxVq9QyOt3sey6Q4cCPkJzEP1lLM9u1o67EapWm8qFl4xyt9Uq3t
         9SNaHab1BfH5d0ZGXoGNIrky60QmZ9ykYPyzomAjcQqz8RHu5flTNWZiEg4cw1bsIuam
         dEXQ==
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e53fb4ac-c733-cf11-88ee-9dd7bb918a71@gmail.com>
Date: Thu, 25 Oct 2018 07:29:59 +0900
MIME-Version: 1.0
In-Reply-To: <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, Paul McKenney <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/25 07:05:04 +0900, Akira Yokosawa wrote:
> On 2018/10/24 23:53:29 +0800, Junchang Wang wrote:
>> Hi Akira and Paul,
>>
>> I checked the code today and the implementation of cmpxchg() looks
>> very suspicious to me; Current  cmpxchg() first executes function
>> __atomic_compare_exchange_n, and then checks whether the value stored
>> in field __actual (old) has been changed to decide if the CAS
>> instruction has been successfully performed. However, I saw the *weak*
>> field is set, which, as far as I know, means
>> __atomic_compare_exchange_n could fail even if the value of *ptr is
>> equal to __actual (old). Unfortunately, current cmpxchg will treat
>> this case as a success because the value of __actual(old) does not
>> change.
> 
> Thanks for looking into this!
> 
> I also suspected the use of "weak" semantics of
> __atomic_compare_exchange_n(), but did not quite understand what
> "spurious fail" actually means. Your theory sounds plausible to me.
> 
> I've suggested in a private email to Paul to modify the 4th argument
> to false(0) as a workaround, which would prevent such "spurious fail".
> 
> Both approaches looks good to me. I'd defer to Paul on the choice.
> 
>         Thanks, Akira
> 
>>
>> This bug happens in both Power8 and ARMv8. It seems it affects
>> architectures that use LL/SC to emulate CAS. Following patch helps
>> solve this issue on my testbeds. Please take a look. Any thoughts?
>>
>> ---
>>  CodeSamples/api-pthreads/api-gcc.h | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/CodeSamples/api-pthreads/api-gcc.h
>> b/CodeSamples/api-pthreads/api-gcc.h
>> index 1dd26ca..38a16c0 100644
>> --- a/CodeSamples/api-pthreads/api-gcc.h
>> +++ b/CodeSamples/api-pthreads/api-gcc.h
>> @@ -166,11 +166,9 @@ struct __xchg_dummy {
>>
>>  #define cmpxchg(ptr, o, n) \
>>  ({ \
>> -       typeof(*ptr) _____actual = (o); \
>> -       \
>> -       (void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>> -                                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
>> -       _____actual; \
>> +       typeof(*ptr) old = (o); \
>> +       (__atomic_compare_exchange_n(ptr, (void *)&old, (n), 1,
>> __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))? \
>> +                               (o) : (n); \

BTW, returning (n) in the fail case would be problematic when "(o) == (n)"
in the first place, wouldn't it?

        Thanks, Akira

>>  })
>>
>>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
>>
> 

