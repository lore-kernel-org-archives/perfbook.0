Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oUeImhJWDph2hAMaUkLVxXzqouhBlR3j14D/JZPBpFY=;
 b=rHIQkA5eNYqTdds7TRpLz2Qi1NlcYmge/BxMrk64023GpM8Eed4yOTOfdgW5KCml3Y
 SNm+TDJZ8XGgXZK7HUugXImniGwIAj6V0E8gsQWmIlXDIgjg5mJYIYX5Qv72bQ4s84i2
 DgQRqERgBClohgwMZI0ogq14OmxRfTzA6GWr0JV6w7Lsu6VEpebUq8vQM/GwNOER9sZV
 gw7LTZCYhDj4BlsXFM6rwCd37IH6eDk7vlD8wtO1PhQ584CaovdLRpWzaZ66GuVDrFtc
 CLMbAwgpZlvl/88W0Zxe92R1/vzZ1VRatTfJd56k1jrPl/4ZWp50hwTAW18yMYvEZlZQ
 B+/A==
Subject: Re: [PATCH] styleguide: Reflect recent conversion of code snippets to
 listing
References: <976bbd70-e58c-7b10-1339-87167b5f79ae@gmail.com>
 <20171019235915.GF3521@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <253df301-c11e-ca4d-9187-81aef7ee641c@gmail.com>
Date: Sat, 21 Oct 2017 01:31:51 +0900
MIME-Version: 1.0
In-Reply-To: <20171019235915.GF3521@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/19 16:59:15 -0700, Paul E. McKenney wrote:
> On Fri, Oct 20, 2017 at 07:46:16AM +0900, Akira Yokosawa wrote:
>> >From cf16d20dff9bf4cf2832c1fdd1fe00b39c4836fd Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Fri, 20 Oct 2017 07:16:48 +0900
>> Subject: [PATCH] styleguide: Reflect recent conversion of code snippets to listing
>>
>> Also use a different approach to reduce skips of table captions.
>> By setting a smaller value to \abovecaptionskip, captions of tables
>> and figures can be made closer to the body regardless of their
>> positions and avoid ambiguity of them to look like captions
>> to other nearby tables/figures.
>>
>> In the experimental tables, a negative value is still set
>> to \abovetopsep to further reduce the skips.
>>
>> As options of \captionsetup{} related to vertical spacing are
>> ignored in captions controlled by the "float" package, remove them.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Applied and pushed, thank you!

So, looks like you are almost ready for the upcoming release.
I'm preparing a patch to add a make target to move table captions to the top
throughout perfbook.
Would you like to see such a patch before the upcoming release?

And I have a reminder for you.

You might want to update the "Roadmap" section in Chapter 1 to mention
new Chapter 15. Style Guide can be ignored for the moment.

Thoughts?

     Thanks, Akira

> 
> 							Thanx, Paul
> 
[...]

