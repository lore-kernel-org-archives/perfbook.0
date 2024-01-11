Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B73AC10
	for <perfbook@vger.kernel.org>; Thu, 11 Jan 2024 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9/vNqi2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so4057971b3a.1
        for <perfbook@vger.kernel.org>; Thu, 11 Jan 2024 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704981746; x=1705586546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/RKgVVEEYT77+odZWrfMQiYRjmCMGGYz76dRwp48yE=;
        b=M9/vNqi2jbx1qa0bTY64y2rgw7Z6HCSIPB2q4Pc4puhfq0WiVGWZZ6c/qFKyHTT3eS
         BdQerpAcJjOyXr0sM45ZaO/2WH0zCpvwol51vC2cMjh3+pU4mc6zbF+aeEmgfGWPOTzV
         5EYcXZdIpFPdSLNa2XpDMmEL5HmuqWyY4rGS38+jpxqvpoR4jvQNeyKbYFy/HPKXaMbR
         SzZJtNIPHT7+QLhf5UyKO6zLMwCjLdTJPsVJ5+8RgxFesB94qg6wvsrJ538wqg7JEoar
         t58tXFd5vvII2c14o4RZgrVyJBfQQ8SiG5FP1q1dew1t1djjYUTTWntHV2d/s4JBndjJ
         hyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981746; x=1705586546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/RKgVVEEYT77+odZWrfMQiYRjmCMGGYz76dRwp48yE=;
        b=d7JGXC3fzUSR61e8NW1NHxn+kN5PacOI+A9zqX/JalTUBQ1fvxiyC+qxVZe7+Wn2Y6
         1hMAw2ney1P+MmowHzXmwR3iH7S9xpNgUdsKWo6UzI9CSVfXDwhMcv0qHQtgz6XhGlOa
         xXl90TIZ6OULjMPEF+czP5lda0Fh4CZEzaVsThjFLqyR06tCIfO7gGZY6hDu/1YTcRcM
         H7H2WeWQNCttQWy0cUGoYWjUb5hxrLSz76EVIJ+2ercq7IV21UTmP57lyL20UtrdhvWq
         ulNHSbFKltxYJL1SIo8jfZM09OQDvSZCfep3V0DqaFhfwzWAZFxtG9v51AQTy/u8uGoL
         dXeQ==
X-Gm-Message-State: AOJu0Ywn0lR3oOIj6CfZ6S+hXvtXqZFKYiND/1diQH7MQoM8DVo3g5XK
	cnscXs1kTxMZCeCblu0t4PI=
X-Google-Smtp-Source: AGHT+IE47XNR52HpVzSwBCcwZHnA0R5E00y/STzjPzPuEmSe9fJFkAtfXT4lopSV13q+tgSt/tMcew==
X-Received: by 2002:a05:6a20:84a7:b0:199:f7f2:e0a9 with SMTP id u39-20020a056a2084a700b00199f7f2e0a9mr976439pzd.53.1704981746496;
        Thu, 11 Jan 2024 06:02:26 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id g16-20020a62e310000000b006d9a6039745sm1181627pfh.40.2024.01.11.06.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 06:02:26 -0800 (PST)
Message-ID: <554b2470-8d25-4fbd-9863-b3cdbce1e447@gmail.com>
Date: Thu, 11 Jan 2024 23:02:19 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: A question about QuickQuiz 5.46
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Hao Lee <haolee.swjtu@gmail.com>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
 <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
 <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>
 <ad92d88c-b48d-4a51-8640-4ad13e1271b7@paulmck-laptop>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ad92d88c-b48d-4a51-8640-4ad13e1271b7@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, 30 Dec 2023 15:57:34 -0800, Paul E. McKenney wrote:
> On Sat, Dec 23, 2023 at 06:12:31PM +0900, Akira Yokosawa wrote:
>> Hi all,
>>
>> I have a comment on this old thread.
>>
>> On 2023/05/21 19:42, Akira Yokosawa wrote:
>>> On Sun, 21 May 2023 07:54:25 +0000, Hao Lee wrote:
>>>> On Fri, May 19, 2023 at 10:27:48PM +0900, Akira Yokosawa wrote:
>>>>> On Fri, 19 May 2023 06:28:47 +0000, Hao Lee wrote:
>>>>>> On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
>>>>>>>> Hi, Paul
>>>>>>>>
>>>>>>>> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
>>>>>>>> balance_count() and flush_local_count() are both located within the
>>>>>>>> slowpath and are called sequentially. As a result, it is impossible for
>>>>>>>> them to compete for the counterandmax thread-local variable.
>>>>>>>
>>>>>>> Right.
>>>>>>> And that's exactly what is mentioned in the answer to the quiz.
>>>>>>>
>>>>>>> I guess it confused you because you didn't expect such an easy one,
>>>>>>> no ? :-)
>>>>>>
>>>>>> In fact I'm confused about the question description.
>>>>>> I believe that this quiz should focus on the concurrency of global
>>>>>> variables, rather than on the concurrency of the atomic variable
>>>>>> `counterandmax`, which is currently the main focus of the description.
>>>>>
>>>>> Hmm, sorry but I'm afraid I don't get your point ...
>>>>>
>>>>> Could you share the question you'd expect to see in place of
>>>>> Quick Quiz 5.46?
>>>>
>>>> Hi, I don't think this question should exist according to my
>>>> understanding...
>>>>
>>>> Let's approach this question from a different perspective. The answer
>>>> emphasizes that the gblcnt_mutex prevents concurrency problems. Let's
>>>> assume that neither balance_count() nor flush_local_count() is holding
>>>> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
>>>> problems? I don't think so because counterandmax is an atomic variable
>>>> and is always safe, even without using any locks.
>>>
>>> I'm not sure, but you might be missing subtle wording in the quiz part
>>> of Quick Quiz 5.46 (quoted below):
>>>
>>>     Given that the atomic_set() primitive does a simple store
>>>     to the specified atomic_t, ...
>>>
>>> Here, "simple store" means a normal store which doesn't involve
>>> any atomic operations (at instruction level).
>>>
>>> atomic_read() and atomic_set() are for accessing atomic_t variables
>>> without any costly atomic operations.
>>
>> This was obvious up until commit cee469f9a7aa ("api: Switch x86 atomics
>> to gcc C11-like atomics").
>>
>> Before the change, atomic_read() and atomic_set() were defined in
>> CodeSamples/api.h as:
>>
>>     typedef struct { volatile int counter; } atomic_t;
>>
>>     #define atomic_read(v)         ((v)->counter)
>>     #define atomic_set(v, i)       (((v)->counter) = (i))
>>
>> Now, they are defined in CodeSamples/api-pthreads/api-gcc.h as:
>>
>>     typedef struct { volatile int counter; } atomic_t;
>>
>>     #define atomic_read(v) \
>>            __atomic_load_n(&(v)->counter, __ATOMIC_RELAXED)
>>     #define atomic_set(v, i) \
>>            __atomic_store_n(&(v)->counter, (i), __ATOMIC_RELAXED)
>>
>> It is the C compiler's call what instructions to use for accessing
>> atomic variables.  Therefore, what Hao said above (quoted again for
>> your convenience):
>>
>>>>                                                                 Let's
>>>> assume that neither balance_count() nor flush_local_count() is holding
>>>> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
>>>> problems? I don't think so because counterandmax is an atomic variable
>>>> and is always safe, even without using any locks.
>>
>> is actually quite true.
>>
>> Now I think QQz 5.46 needs at least some rewording.
>>
>> Hao, apologies for my missing the change under CodeSamples/ at the time.
>>
>> Paul, what do you think?
> 
> Let's see...
> 
> Hao Lee initially suggested that the focus be on the global nonatomics,
> which could work.  A related question might be "Why does counterandmax
> need to be atomic?"  Another approach would be to focus on wrong settings
> for counterandmax based on concurrent invocation.  And there are a number
> of other possible confusions that might be caused by this code.
> 
> So would either of you like to propose a specific change?

I'm sending a patch set as replies.
1/2 is a trivial fix of coding style.
2/2 is an RFC updating the QQ.

diff stat looks like this:

-------
Akira Yokosawa (2):
  count_lim_atomic: Enclose complex loop with {}
  count: Update QQ 5.46

 CodeSamples/count/count_lim_atomic.c |  5 ++--
 count/count.tex                      | 36 +++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 8 deletions(-)


base-commit: 4ca36874306b39ed5bfce5a50e289f966f485334
-- 
2.34.1

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> Which is why Quick Quiz 5.46 has been there for more than a decade.
>>>
>>> Perhaps, you might be interested in Quick Quiz B.12 as well.
>>>  
>>> HTH,
>>>         Akira
>>>
>>>>
>>>>>
>>>>>         Thanks, Akira
>>>>>
>>>>>>
>>>>>>>
>>>>>>>         Thanks, Akira
>>>>>>>
>>>>>>>>                                                               Therefore,
>>>>>>>> I believe that this quiz may be referring to the global variables
>>>>>>>> globalcount and globalreserve.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Hao Lee
>>
