Return-Path: <SRS0=97xf=2R=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NlbfGlTMCUE7ngznrBLQqrENsfplnZTdxo1H8WD6ebE=;
        b=orjNH0f33W6ncHEJqlF05xWFcTtj4VWSQwjaFC32UFeXCRLeR1etguRMU9eFT6jhxh
         kl3RG9LRbEoVBbBLxeeVZcAD9WqB5P/1DgbH/YabLuESx0irdvD+Sbx3+5CcS5kBzvtL
         tfu48Y67nHm4j8RyXp8+UjU2+Xe8Vo29o/PS6oRU/zk/F9KzBrW2HGrdqiTB4EiYmoAh
         K34kkoZHTM+1OS72V8f5hbGFhOaBfWQrc/lrPDCeS29dD0XACawO2QRSp4cQbY1UZ8oY
         net3R/lm6sozgiOOpqojKZHuI4tVzCDbfVP7MCRw5xT3uPV2724wgP8h94V43E6YtYbv
         BfgA==
Message-ID: <c94f3757-5e8a-aeee-d836-eeccf6ae6d50@gmail.com>
Date: Sun, 16 Oct 2022 08:41:32 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] locking: Warn about state preservation when releasing and
 re-acquiring locks
References: <20220929121112.373983-1-e2lahav@gmail.com>
 <20221006125822.GT4196@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FXkbWPU4naA+DHQGbLk+n-7me+xR8fZ0Xc9d5phMkrPyw@mail.gmail.com>
 <20221006180659.GZ4196@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-CA
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20221006180659.GZ4196@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

>>> Also, longer term, would you be willing to add code that makes a
>>> simple but dangerous change in order to better illustrate the problem?
I sent a patch, but I'm actually not too thrilled with it.

The original code was using nd->children[i], which I believe forces a 
compliant compiler to re-read nd->children, avoiding the problem. I was 
unable to get GCC 8.3 to cache nd->children, even when making the 
iterator and the callback take a pointer to a const node. With the new 
version, which uses an explicit iterator, the compiler does store 
nd->children in a register that is not reloaded across the loop.

The example I propose can thus fall under the category of "don't do 
that". On the other hand, this is just supposed to be a small, 
self-contained illustration of the danger.

What do you think?

--Elad
