Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YoDnqGlC92NOOSkKRqZKuF6MHShnw5MmJcXYqF5Z2Uw=;
        b=BE/G1/FT8VqEK0KmHGJzNBl6YIRJo0SbezrO8KNe9hgVYRJnsFAzPBFmtZIranJpni
         0gAp43Ea6plCBuKZIuYgkDrk9tcI+XxEAX/GnWnDPqVOoxOQmG7x0mGtXM/y8YyyUfXV
         s7zYW/YT1ByIJ+HzG/KIQ+BZzqsyhtKwayGdX2F4FPeL/cy25E86R+lMw4bdqYSHBbKC
         bbx69seavT7AVuMZqgLhrQ9+XwHPdip1SZcJP4ypbVEBN0AT2B9Q/clm/dequv8JA8Pn
         +q97L9MkftpBrBON8CISRN9QEtLNz7GrUNuev0+xWqpmbNPGZ9TCSXzDV6hVqeZtRg61
         tnUg==
Subject: Re: [PATCH] Create .mailmap to fix unreachable email address
References: <154feeee-a7b3-17bd-6b26-6ff1778e8b42@gmail.com>
 <20190806162544.GP28441@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <abf690a9-f52f-2e06-563c-d79edfc424da@gmail.com>
Date: Wed, 7 Aug 2019 07:21:43 +0900
MIME-Version: 1.0
In-Reply-To: <20190806162544.GP28441@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 6 Aug 2019 09:25:44 -0700, Paul E. McKenney wrote:
> On Wed, Aug 07, 2019 at 12:45:34AM +0900, Akira Yokosawa wrote:
>> >From 327971006462cbab7b5007717d7536b0e3947eb4 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 7 Aug 2019 00:15:12 +0900
>> Subject: [PATCH] Create .mailmap to fix unreachable email address
>>
>> There are some commits with typo in my gmail address.
>> Although they can not be fixed after the fact, "git shortlog -se"
>> and "git show --use-mailmap" respect entries in .mailmap.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Good point, queued and pushed, thank you!
> 
> While in the area, I added commit to allow for my recent email address
> change and some early git misconfiguration.  ;-)

The email address on the front page also needs update, doesn't it? ;-)

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>> Hi Paul,
>>
>> Inspired by discussion in another thread, I looked up the usage of
>> .mailmap in Git repository. It can be used to partially rescue typos
>> in email configs such as those made in the early days of my contributions.
>>
>> This will prevent the unreachable address from being displayed by
>> "git shortlog -se" and the like.
>>
>>         Thanks, Akira
>> -- 
>>  .mailmap | 1 +
>>  1 file changed, 1 insertion(+)
>>  create mode 100644 .mailmap
>>
>> diff --git a/.mailmap b/.mailmap
>> new file mode 100644
>> index 00000000..c5d1cd3e
>> --- /dev/null
>> +++ b/.mailmap
>> @@ -0,0 +1 @@
>> +<akiyks@gmail.com> <akiysw@gmail.com>
>> -- 
>> 2.17.1
>>

