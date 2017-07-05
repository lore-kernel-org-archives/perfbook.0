Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vcQzMLvffNrnNPKZ0N+rd9uaGDRIJPUICBQYx8uVDGo=;
 b=VWo1hgA6ju1KB6GYtNzrBnrGWlNITNDLx0C3QPiGFkTr/ab2521AV7imFu/Rc6ytFX
 D+Ux2Kxa5ZM/P4ZX/TPc53eeIQcpIH+/0yhpP8zbfRJvvnZkGuUU5KcLNlRurGct0Z+u
 oikGU3eQPrOVDjZ0DfzYU4kdbcyXIe1yh9YO0VepLubd1tGiPJnG297BLNejRFrHGghB
 vx8sd5vHhds3ZPHPZZTxGFESvKozx2brPuXgjOxZobN8XqK/WbiYHGGkoNxpritMxpYS
 ZB2mzqmFW4RxXmvkzGRdD0qAlYsCYu2NIH7+0/9ZRQ7lwBpeqrzblqkFjmHmh7qS5pOo
 9ihQ==
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
 <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
 <20170705154024.GU2393@linux.vnet.ibm.com>
 <20170705155004.GB29379@linux.vnet.ibm.com>
 <20170705173249.GA22308@linux.vnet.ibm.com>
 <81458845-cd7c-1cf0-cb45-d346846d14d7@gmail.com>
 <20170705223218.GH2393@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <030d74ba-e816-cde6-5c31-a0cf25a3b320@gmail.com>
Date: Thu, 6 Jul 2017 07:40:45 +0900
MIME-Version: 1.0
In-Reply-To: <20170705223218.GH2393@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/06 7:32, Paul E. McKenney wrote:
> On Thu, Jul 06, 2017 at 07:15:24AM +0900, Akira Yokosawa wrote:
>> On 2017/07/05 10:32:49 -0700, Paul E. McKenney wrote:
> 
> [ . . . ]
> 
>>>>> So I cannot go with "volatile", but let's see if I can do something
>>>>> better than the gcc intrinsics.
>>>>
>>>> And if the litmus7 guys don't have anything for me, I can always write a
>>>> script to do the conversions.  So either way, we will have kernel-style
>>>> notation at some point.  ;-)
>>>
>>> And it turns out that the contents of a second "{}" in a litmus7 test
>>> is pulled directly into the output code, so an easy change.  ;-)
>>
>> Good news!
>>
>> So __atomic_thread_fence() will also be replaced with smp_mb() in
>> the litmus tests? That will reduce the width of the tables and eliminate
>> the need for the hspece adjustments in one-column layout.
> 
> Oops, I forgot to push!  Done now.
> 
> And yes, there is now smp_mb() in the litmus tests and the tables.

I'll take a look later.
As I mentioned earlier, __atomic_load_n() and __atomic_store_n() seem
to have fairly large overheads (on x86). You might want to see the changes
in the resulting statistics and reflect them in the text.

          Thanks, Akira

> 
> 							Thanx, Paul
> 
> 

