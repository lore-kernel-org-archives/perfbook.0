Return-Path: <SRS0=kTQ9=6F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIiINXvoMtKGo0qRw76MFfrXmqH/s3W2xQH5gGvCSS8=;
        b=icaIPMCMNhyQSKgYlLBaIsGzaGcvQ5YAbCIRzOW9QYp+vY3qpUXrPZJXNlInRTCgum
         jeNA7iDXwO+Fa7U18fsyy3wqAkUvx9hlGZKeToxhzqLUZUZPQMSQgwnPRKm0uxqLbUxe
         PVNr+k0w+UWl0PKcBe9gNRLkKVyVqo64h2vpXx1dTLgGI4KHspmztpFsimm87kidC34Y
         D/ON6Pz1fU229mTSVD29xcB0yhiZq/CPzciZCgeDQb3qAyMir9aZ1G5M5w4Cnl3hXF8r
         V+SziDUo7DBoPPP3Eir8tfol2bOho/BlCFfIuL3ExgMNmh8Ch4Alz6/9Y4aTH5F8piqU
         20yA==
Message-ID: <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
Date: Thu, 9 Feb 2023 20:13:41 +0900
MIME-Version: 1.0
Subject: Re: Question about Table E.1
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
 <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
 <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 9 Feb 2023 08:49:46 +0900, Akira Yokosawa wrote:
> On Wed, 8 Feb 2023 14:15:22 -0800, Paul E. McKenney wrote:
>> My surprise caused me to beat on it, and it was persistent.
> 
> I see.  So the "outlier" was the microarchitecture of that
> X5550 (Nehalem), I guess.
> I'd love to reproduce the behavior if at all possible.
> 
>>
>> But I cannot find the raw data, either, so maybe I should delete that
>> table.  Though I really do like the fact that it is surprising, based
>> on a hope that it convinces readers to expect the unexpected.
> 
> That episode would be a good Quick Quiz if the Answer to QQz
> could have a nested QQz inside it.
> Unfortunately that is not possible...

On second thought, it should be possible to put a QQz next to QQz 3.7
citing Table E.1 in the Quiz part.

Let me try and produce a PoC patch.

        Thanks, Akira

> 
>         Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
>>>>         Thanks, Akira
>>>>
>>>>>
>>>>> Strange, but whatever the reason, true!  ;-)
>>>>>
>>>>> 							Thanx, Paul
