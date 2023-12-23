Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B78F4E
	for <perfbook@vger.kernel.org>; Sat, 23 Dec 2023 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvn7pdxZ"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb85a202c2so1402708b6e.2
        for <perfbook@vger.kernel.org>; Sat, 23 Dec 2023 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703322754; x=1703927554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mjfxuNoSilCZ2UKjWgrL82YcjlM0is3nPkt1czRXvU=;
        b=Xvn7pdxZkvLM/BKXwhwI7SKcfNfvdfWvfRv8NJH/OG7ri3ONbAhoCLCTk2Px2lrSMT
         1TlUdeOmxyxZ21+jjLLy7qsBMmIciIfc4wquGnR2zvi5URQj6apF0TImbwvZGcYVOpD3
         tdtyo86zQ22zDQmozYLP8lalwQWporEwMvT0/bKyv/yg/WJE7jigRLqLm9XAuuc3WsSn
         R3+ASPwCV0H66OnmSiMQ0BEqGa/oa6yweK9e/FR6kZCvls+CuSjqM6htMFY6+p8FswQp
         C1VhG1KQuunN1R7O67c/2Nx2p2DYsjQBdnHoXn9zI/XAchexGawv9Ou0HuznGYp1jnIe
         eRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703322754; x=1703927554;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mjfxuNoSilCZ2UKjWgrL82YcjlM0is3nPkt1czRXvU=;
        b=H6xeaZK8i22ns2zIwtH+s94nEbadTvqmNrPpBwLwZFTfunBuHLReCa+s5+HONJ7ku0
         E4z9wQHJbcUWbf4zJ20Pm/h/rlUoVD/kebCHdW81eV+tUuiVxInQGXUY9MbHW45xxhpv
         12Us/ZUxdqAllMSvqS3+SRjmxozgCjBms31KLtbwjREB9KyHt4zQazioq3n/WA+/o/99
         YhCZrWscuZ6CDsswC7mtV5SqC155fzHmjYGePxXnWWkpNDX3kAkTo8nl4t1tYIzjvZzT
         FBVWM5mpKh+9VQfnWt5XfSw4RsDGJHWHAZJg3ZNypjSURNw8NIX8vUpfXDQoQcFaTQ3F
         glFA==
X-Gm-Message-State: AOJu0YyTxHqgHJJ1hFAUUP6reHsv0nP8nS9VVMpEGjLDfXvOJnL2/r1C
	PpjN0IF9piXVcgDiGEbEK1U=
X-Google-Smtp-Source: AGHT+IEpv7ra2WYYfrP28zYGXwdjyFClA6Q2ZPbBDjnhwgOHciBcGOpQwH5E6hy68pz5FT9+dXwM1Q==
X-Received: by 2002:a05:6808:22a0:b0:3bb:7388:5593 with SMTP id bo32-20020a05680822a000b003bb73885593mr3088504oib.13.1703322754398;
        Sat, 23 Dec 2023 01:12:34 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id n16-20020aa78a50000000b006cb98a269f1sm1408661pfa.125.2023.12.23.01.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Dec 2023 01:12:34 -0800 (PST)
Message-ID: <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>
Date: Sat, 23 Dec 2023 18:12:31 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: A question about QuickQuiz 5.46
To: Hao Lee <haolee.swjtu@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
 <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
Content-Language: en-US
In-Reply-To: <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

I have a comment on this old thread.

On 2023/05/21 19:42, Akira Yokosawa wrote:
> On Sun, 21 May 2023 07:54:25 +0000, Hao Lee wrote:
>> On Fri, May 19, 2023 at 10:27:48PM +0900, Akira Yokosawa wrote:
>>> On Fri, 19 May 2023 06:28:47 +0000, Hao Lee wrote:
>>>> On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
>>>>>> Hi, Paul
>>>>>>
>>>>>> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
>>>>>> balance_count() and flush_local_count() are both located within the
>>>>>> slowpath and are called sequentially. As a result, it is impossible for
>>>>>> them to compete for the counterandmax thread-local variable.
>>>>>
>>>>> Right.
>>>>> And that's exactly what is mentioned in the answer to the quiz.
>>>>>
>>>>> I guess it confused you because you didn't expect such an easy one,
>>>>> no ? :-)
>>>>
>>>> In fact I'm confused about the question description.
>>>> I believe that this quiz should focus on the concurrency of global
>>>> variables, rather than on the concurrency of the atomic variable
>>>> `counterandmax`, which is currently the main focus of the description.
>>>
>>> Hmm, sorry but I'm afraid I don't get your point ...
>>>
>>> Could you share the question you'd expect to see in place of
>>> Quick Quiz 5.46?
>>
>> Hi, I don't think this question should exist according to my
>> understanding...
>>
>> Let's approach this question from a different perspective. The answer
>> emphasizes that the gblcnt_mutex prevents concurrency problems. Let's
>> assume that neither balance_count() nor flush_local_count() is holding
>> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
>> problems? I don't think so because counterandmax is an atomic variable
>> and is always safe, even without using any locks.
> 
> I'm not sure, but you might be missing subtle wording in the quiz part
> of Quick Quiz 5.46 (quoted below):
> 
>     Given that the atomic_set() primitive does a simple store
>     to the specified atomic_t, ...
> 
> Here, "simple store" means a normal store which doesn't involve
> any atomic operations (at instruction level).
> 
> atomic_read() and atomic_set() are for accessing atomic_t variables
> without any costly atomic operations.

This was obvious up until commit cee469f9a7aa ("api: Switch x86 atomics
to gcc C11-like atomics").

Before the change, atomic_read() and atomic_set() were defined in
CodeSamples/api.h as:

    typedef struct { volatile int counter; } atomic_t;

    #define atomic_read(v)         ((v)->counter)
    #define atomic_set(v, i)       (((v)->counter) = (i))

Now, they are defined in CodeSamples/api-pthreads/api-gcc.h as:

    typedef struct { volatile int counter; } atomic_t;

    #define atomic_read(v) \
           __atomic_load_n(&(v)->counter, __ATOMIC_RELAXED)
    #define atomic_set(v, i) \
           __atomic_store_n(&(v)->counter, (i), __ATOMIC_RELAXED)

It is the C compiler's call what instructions to use for accessing
atomic variables.  Therefore, what Hao said above (quoted again for
your convenience):

>>                                                                 Let's
>> assume that neither balance_count() nor flush_local_count() is holding
>> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
>> problems? I don't think so because counterandmax is an atomic variable
>> and is always safe, even without using any locks.

is actually quite true.

Now I think QQz 5.46 needs at least some rewording.

Hao, apologies for my missing the change under CodeSamples/ at the time.

Paul, what do you think?

        Thanks, Akira

> 
> Which is why Quick Quiz 5.46 has been there for more than a decade.
> 
> Perhaps, you might be interested in Quick Quiz B.12 as well.
>  
> HTH,
>         Akira
> 
>>
>>>
>>>         Thanks, Akira
>>>
>>>>
>>>>>
>>>>>         Thanks, Akira
>>>>>
>>>>>>                                                               Therefore,
>>>>>> I believe that this quiz may be referring to the global variables
>>>>>> globalcount and globalreserve.
>>>>>>
>>>>>> Thanks,
>>>>>> Hao Lee

