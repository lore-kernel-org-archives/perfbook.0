Return-Path: <SRS0=HGIU=NX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2STzd4xyBow1je9fEYA5s1sJoYdkSIs4o2r5jQVZ/Ts=;
        b=lkU81AZphwWzoc5z9GUdBDwTREZLG4Iz5cKrkE6pS3cudrzut4oK9K1JlR1fs27m/X
         zhTJldxhWzpvB90iYj4KIGBJwLQs2q7M/jQP2I3MHSTIvUlFPcQQ/wd7XoLpzgn60GjP
         Y5Ai2sq/TkPJzEPhwD6DruT3//5qab9b2oP0fexiz185PaX/SurH5fPew10/Z6+zRzt2
         WfcPQ+D27/80N276bS4SfwcEF5YVMjQpvphTRg5VvAzDA1AfYaAB1s85ZTaXvuo8gCkt
         jLaHKeNl+sxuRnnAXg+zeF7JVU1XtKp/0HSqe57VYnuwE0yACIAMU0DJC8YvgYrqDhAO
         dgZw==
Subject: Re: [PATCH -perfbook] formal: Update rcu-test data in Figure 12.4 (as
 of v5.14)
References: <b82a3623-72cf-c6ad-fe86-2cdb3e388d1e@gmail.com>
 <20210831192109.GE4156@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d1989b85-a5e4-2c8f-2160-58e05f8c2fb5@gmail.com>
Date: Wed, 1 Sep 2021 22:00:59 +0900
MIME-Version: 1.0
In-Reply-To: <20210831192109.GE4156@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 31 Aug 2021 12:21:09 -0700, Paul E. McKenney wrote:
> On Tue, Aug 31, 2021 at 08:50:37AM +0900, Akira Yokosawa wrote:
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> Looks like the trend since v5.12 is continuing.
> 
> Queued and pushed, thank you!!!
> 
> I followed up with a commit describing the big-animal RCU changes
> in v5.13 and v5.14.  Thoughts?

Looks good to me!

However, your changes in together/applyrcu need some tweaks.
I'm sending them soon.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>>  formal/RCU-test-ratio.eps | 1448 +++++++++++++++++++------------------
>>  formal/data/rcu-test.dat  |    2 +
>>  2 files changed, 754 insertions(+), 696 deletions(-)
>>
[...]

