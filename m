Return-Path: <SRS0=ZcyU=BK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684665783; x=1687257783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LbP0lsGZFbRDxA90y/o0kPTWkktj56qH1vps8dG/20U=;
        b=GqR1BiJtj2eSM8Le2148ftnjdtevUcpyHabGpQxl5bAKY1HefPJcseyKi4FpZGYAwm
         Xlx8KG9B88LxxBSmayBl6JAvBdUtP1bFeMfcmjkn5jU/ZL3qPNv0wHZxtF2bFgP8rA/j
         w5gwt8yyOLXm3NCCimJofdeWkfQizvMLwowHMn4fFXrzAMw41bWWzvW5v5HwCF2sjad/
         e0pa6zoGtWjYMqM1MmmsqkER3xdKnj8uV7QBCX9+gel7wwD5HBN5fJ6U/LeM+x71M4/8
         TPpn3bdJ3m17J3vzpJqjbrLOl9Bix+HssBk9/Gat3m8bGu8o/c7YjCeDAoUFHKtQLPl2
         Sxfg==
Message-ID: <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
Date: Sun, 21 May 2023 19:42:58 +0900
MIME-Version: 1.0
Subject: Re: A question about QuickQuiz 5.46
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230521075425.GA13425@haolee.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 21 May 2023 07:54:25 +0000, Hao Lee wrote:
> On Fri, May 19, 2023 at 10:27:48PM +0900, Akira Yokosawa wrote:
>> On Fri, 19 May 2023 06:28:47 +0000, Hao Lee wrote:
>>> On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
>>>> Hi,
>>>>
>>>> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
>>>>> Hi, Paul
>>>>>
>>>>> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
>>>>> balance_count() and flush_local_count() are both located within the
>>>>> slowpath and are called sequentially. As a result, it is impossible for
>>>>> them to compete for the counterandmax thread-local variable.
>>>>
>>>> Right.
>>>> And that's exactly what is mentioned in the answer to the quiz.
>>>>
>>>> I guess it confused you because you didn't expect such an easy one,
>>>> no ? :-)
>>>
>>> In fact I'm confused about the question description.
>>> I believe that this quiz should focus on the concurrency of global
>>> variables, rather than on the concurrency of the atomic variable
>>> `counterandmax`, which is currently the main focus of the description.
>>
>> Hmm, sorry but I'm afraid I don't get your point ...
>>
>> Could you share the question you'd expect to see in place of
>> Quick Quiz 5.46?
> 
> Hi, I don't think this question should exist according to my
> understanding...
> 
> Let's approach this question from a different perspective. The answer
> emphasizes that the gblcnt_mutex prevents concurrency problems. Let's
> assume that neither balance_count() nor flush_local_count() is holding
> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
> problems? I don't think so because counterandmax is an atomic variable
> and is always safe, even without using any locks.

I'm not sure, but you might be missing subtle wording in the quiz part
of Quick Quiz 5.46 (quoted below):

    Given that the atomic_set() primitive does a simple store
    to the specified atomic_t, ...

Here, "simple store" means a normal store which doesn't involve
any atomic operations (at instruction level).

atomic_read() and atomic_set() are for accessing atomic_t variables
without any costly atomic operations.

Which is why Quick Quiz 5.46 has been there for more than a decade.

Perhaps, you might be interested in Quick Quiz B.12 as well.
 
HTH,
        Akira

> 
>>
>>         Thanks, Akira
>>
>>>
>>>>
>>>>         Thanks, Akira
>>>>
>>>>>                                                               Therefore,
>>>>> I believe that this quiz may be referring to the global variables
>>>>> globalcount and globalreserve.
>>>>>
>>>>> Thanks,
>>>>> Hao Lee
