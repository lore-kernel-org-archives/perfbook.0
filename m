Return-Path: <SRS0=s+nB=56=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHtb6fAc2gLi2ZUl3YbwW8kpHIxZnb3hW8IysVq3E6g=;
        b=YW9JF8e7Gw0kr/wUoD0cCqW6Cl+XtF3JXGrWc6f5WKNs5z4oroYjFGxD2bPgzukRhK
         z4YYsN1a+Qc1M1karymuxMnn5fGMhjwAKnv8DL4Qv39VFUjqxfBnuDDTpjzcWi2gX3rJ
         NvuaD9LY63Ua/QVPZBNR/un7IzZpBRMgdulM8lOJ8AFzXAOEWRr50TfsaZfYqJ6cxnZJ
         4J/FKUPM5BmeA9g0KjmTZVl1GXVUGtAJ/H3JjXVjwxLzflmpTVltwOVzS1AQl09gzyCR
         g3CPByVMEOabotY4/4oayZ7SMgV/l3AoyGCoIKwC9/XobTtfqIzqes8tsmmpQeiV3NE3
         +DkQ==
Message-ID: <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
Date: Thu, 2 Feb 2023 10:49:15 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
References: <20230201201529.901316-1-leobras.c@gmail.com>
 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,

On Wed, 1 Feb 2023 14:13:02 -0800, Paul E. McKenney wrote:
> On Wed, Feb 01, 2023 at 05:15:29PM -0300, Leonardo Bras wrote:
>> Having this file merged on the main repository will trigger the Gitlab-CI
>> on the mirror: https://gitlab.com/linux-kernel/perfbook/ after each push.
>>
>> The way it works:
>> - Compile-test CodeSamples
>> - IF pass, build PDFs: regular, 1c, eb
>>
>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> Queued and pushed, thank you!  Let's see how github (as oppoed to your
> gitlab) reacts to this.  ;-)

I happen to have a perfbook repo at gitlab where CI is not set up.
When I pushed this change, I got a mail from gitlab saying:

>  Subject: perfbook | Failed pipeline for gitlab-ci | 55c81b9b
>
>  Pipeline #764856510 has failed!

I don't think it is reasonable for Paul's repo to have gitlab
specific settings like this.

Paul, can you please revert this?

        Thanks, Akira

> 
> 							Thanx, Paul

