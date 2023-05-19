Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684502874; x=1687094874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zY9tEY2UOITvT6bG7pinx2UHHZPUsDTXdoDq49FuaQ=;
        b=lFvrd5MIX58ceDqUHAUupCsOXiDQO62y8PLSyqSMQvM/ZPg04aP21bmdooeE3U6ZF9
         Iwx9axqMZ9m0NS9xK5y/5nanruqmK9hC3Tmk93oAalbTZD5e5Jp4KsDQCqpgp1gr6CAv
         /bk6wJ+DxUdPcvH1wlv5hFUWy67mZrXkOjyF7C8dKRDu7yx743Hqx0cvYOViQSQyyd3X
         OFPXfEyYs4rh4AG/UEi8Mv+cEpXycibUQYTYHQuVpMeFQJUuzJDJVRPgDWLn0rX1XAkh
         3Yl52FK30CgAuYHx0Ab2n/clRDR8fArun863D8K/Em/91Mc61cQfnxC7oAJxf723pZX9
         9bFQ==
Message-ID: <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
Date: Fri, 19 May 2023 22:27:48 +0900
MIME-Version: 1.0
Subject: Re: A question about QuickQuiz 5.46
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230519062847.GA17791@haolee.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 19 May 2023 06:28:47 +0000, Hao Lee wrote:
> On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
>> Hi,
>>
>> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
>>> Hi, Paul
>>>
>>> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
>>> balance_count() and flush_local_count() are both located within the
>>> slowpath and are called sequentially. As a result, it is impossible for
>>> them to compete for the counterandmax thread-local variable.
>>
>> Right.
>> And that's exactly what is mentioned in the answer to the quiz.
>>
>> I guess it confused you because you didn't expect such an easy one,
>> no ? :-)
> 
> In fact I'm confused about the question description.
> I believe that this quiz should focus on the concurrency of global
> variables, rather than on the concurrency of the atomic variable
> `counterandmax`, which is currently the main focus of the description.

Hmm, sorry but I'm afraid I don't get your point ...

Could you share the question you'd expect to see in place of
Quick Quiz 5.46?

        Thanks, Akira

> 
>>
>>         Thanks, Akira
>>
>>>                                                               Therefore,
>>> I believe that this quiz may be referring to the global variables
>>> globalcount and globalreserve.
>>>
>>> Thanks,
>>> Hao Lee
