Return-Path: <SRS0=/Qh7=BH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684374656; x=1686966656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bk0G5p227vrW/ovDvKQcS9nfcyvmf9QbmJFoLb2J9U=;
        b=hDIz3kKMhJ+MQ2mGSZdbqFyuOXb76B2rmaNKqJzSE26XXB4OrUUAi3l0OnMel5dNuC
         BkVL+G9OTA10YOiSIAEpbpHz6Ei00nToZ2QuQ4MLhb5xws4apCCRaeMWORdgW9zdRpkx
         gjtM3GyABTL/+TWyHcnMolWIeRWTGGB4bmL3x94XAMDPeVOfCaJK84q9GIMhwhnARhCw
         ljWqGZo34RSX2CQlWbWDrkWKYx5hYsTXaqrtOXHQklBuzAt9Ed1GCxoQJfSYUj0l2hlc
         MUk6b9gp+2QHj0in8DJUl+fYlmf34OkXXSYGutwnnpoMtHYKjU74yJAonQfYl2rZ5QI9
         KZGQ==
Message-ID: <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
Date: Thu, 18 May 2023 10:50:51 +0900
MIME-Version: 1.0
Subject: Re: A question about QuickQuiz 5.46
References: <20230517120110.GA23586@haolee.io>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230517120110.GA23586@haolee.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
> Hi, Paul
> 
> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
> balance_count() and flush_local_count() are both located within the
> slowpath and are called sequentially. As a result, it is impossible for
> them to compete for the counterandmax thread-local variable.

Right.
And that's exactly what is mentioned in the answer to the quiz.

I guess it confused you because you didn't expect such an easy one,
no ? :-)

        Thanks, Akira

>                                                               Therefore,
> I believe that this quiz may be referring to the global variables
> globalcount and globalreserve.
> 
> Thanks,
> Hao Lee
