Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XKM++X1+6un+acyVh5UegEFf9MJOU9yDf2iphdZF65Q=;
 b=pgpHrwkLvQjHmr1BeYbWsaKvjJSNEGx/to2ELwmL11N0de95ZuCCqVtowBCfSNZwyu
 b7uSXEd1z6/Ac+1fekVqaMIsqFo0Kb4OwxPMoYWqO/qavVKzRKmUmAdZNg3ZRfK7iyFq
 FYzeprjzVFgKrQPqZkEo5cEo3167sjAtf8notjwznmw1at4hDasF8aU6bZOtjAdYDyI2
 obKhrsO7Ly5Fox+nhXIRL6dZZYdkcn2/29mN4iqP++feue2TuOWqKmyBtvYhxyRKQGsu
 NhrMI2bb52jPRYCnjcojvJiP1CmvOS5MV8yY+3i4T80Jak+leK0yT9UItRH9ib8mdrdW
 QFTQ==
Subject: Re: [PATCH] styleguide: Reflect recent conversion of code snippets to
 listing
References: <976bbd70-e58c-7b10-1339-87167b5f79ae@gmail.com>
 <20171019235915.GF3521@linux.vnet.ibm.com>
 <253df301-c11e-ca4d-9187-81aef7ee641c@gmail.com>
 <20171020235524.GJ3521@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6a1c4042-39ce-3f0d-fd15-fbf513898eaf@gmail.com>
Date: Sat, 21 Oct 2017 09:05:26 +0900
MIME-Version: 1.0
In-Reply-To: <20171020235524.GJ3521@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/20 16:55:24 -0700, Paul E. McKenney wrote:
> On Sat, Oct 21, 2017 at 01:31:51AM +0900, Akira Yokosawa wrote:
>> On 2017/10/19 16:59:15 -0700, Paul E. McKenney wrote:
>>> On Fri, Oct 20, 2017 at 07:46:16AM +0900, Akira Yokosawa wrote:
>>>> >From cf16d20dff9bf4cf2832c1fdd1fe00b39c4836fd Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Fri, 20 Oct 2017 07:16:48 +0900
>>>> Subject: [PATCH] styleguide: Reflect recent conversion of code snippets to listing
>>>>
>>>> Also use a different approach to reduce skips of table captions.
>>>> By setting a smaller value to \abovecaptionskip, captions of tables
>>>> and figures can be made closer to the body regardless of their
>>>> positions and avoid ambiguity of them to look like captions
>>>> to other nearby tables/figures.
>>>>
>>>> In the experimental tables, a negative value is still set
>>>> to \abovetopsep to further reduce the skips.
>>>>
>>>> As options of \captionsetup{} related to vertical spacing are
>>>> ignored in captions controlled by the "float" package, remove them.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>
>>> Applied and pushed, thank you!
>>
>> So, looks like you are almost ready for the upcoming release.
>> I'm preparing a patch to add a make target to move table captions to the top
>> throughout perfbook.
>> Would you like to see such a patch before the upcoming release?
> 
> That would be very good!

It should be ready in a few days.

> 
>> And I have a reminder for you.
>>
>> You might want to update the "Roadmap" section in Chapter 1 to mention
>> new Chapter 15. Style Guide can be ignored for the moment.
> 
> Good catch, you know me too well!  ;-)
> 
> I am also merging the "rt" chapter into the "advsync" chapter, but I
> do not believe that there are any tables there, so that should not
> conflict with your work.

The change will involve only Makefile, perfbook.tex, and styleguide.tex.
So there won't be any conflict.

And I'm sending a couple of nitpick patches in a few minutes.

        Thanks, Akira 

> 
> 							Thanx, Paul
> 
>> Thoughts?
>>
>>      Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>> [...]
>>
> 
> 

