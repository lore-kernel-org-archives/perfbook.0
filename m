Return-Path: <SRS0=ReyI=FK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695722657; x=1696327457; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9ck6LI83TXbNsv2Fyzl0Bo6xPKrxzMYf1kTPE48iO8=;
        b=VaibVmMbWoaUi4j5Ft/gO4YBPWj1Yf2PbgbDK3e/8ukIkkaNnkRfEWY/gGZVVf5+94
         NnmxfXu7v80K7chLz0cyy0FqK2Ya6jwvq/15qdubn14i8laFAuiV2frLrshahAhEeOo5
         WUN7B9QJ/2EaXPTrCVb58wEySBnQAWFS9sJzWDU8TUXxWbmlLYf7i2wuR/3W8V3MPBbf
         cqIa5cyrTH0hwA7L7oA1jElf1Z1LboF4MQUywJwRDSURihHiXPb2BLSv4pe1pE99rZ6/
         ORirBm+szpcbLTtHnq9HkvVKGEn3aia1z9uVrtinVnsyDHo74uWdjCxYU6m3NV+IVzt9
         1zUw==
Message-ID: <5615921f-7c33-bcbe-f076-9ed1cbe900ee@gmail.com>
Date: Tue, 26 Sep 2023 19:04:12 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 2/4] memorder: Add index markers for
 'address/control/data dependency', take 2
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
 <a78a4604-cd3f-1adc-320d-2dbedf1f169b@gmail.com>
 <5a2ed909-84c9-4f2d-b598-d0b7442d92f0@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5a2ed909-84c9-4f2d-b598-d0b7442d92f0@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

On 2023/09/23 17:23, Paul E. McKenney wrote:
> On Fri, Sep 22, 2023 at 10:55:44PM +0900, Akira Yokosawa wrote:
[...]
>>  
>> -The low overheads of the address and data dependencies discussed in
>> +The low overheads of the \IXalth{address}{address}{dependency}
> 
> This looks strange given the different parameters to the \IXalth above
> and the \IXalth below, but it gets the right thing to the right place
> in the index, so I queued and pushed all four.
> 
[...]
>> +and \IXalth{data dependencies}{data}{dependency} discussed in

Let me explain what's happening here.

Original sentence looked like this:

    The low overheads of the address and data dependencies discussed in

Here, if "address dependencies" were there, I could have said:

    \IXalth{address dependencies}{address}{dependency}

Instead, I put an index marker of "Dependency, address" on the lonely
"address", therefore it became:

    \IXalth{address}{address}{dependency}

\IXalth{}{}{} prints any string in #1 with an index marker of
"#3, #2" put on it.

Macros of \IX*alt* are powerful and can do whatever you'd like.

> Thank you!!!  And yes, I am now generating a set of glossary entries.  ;-)

Thank you.  I like those cautionary remarks.

        Thanks, Akira

> 
> 							Thanx, Paul



