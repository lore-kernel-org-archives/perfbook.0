Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=obFJ4WxZbI0+Fou9zo7fGxR5SvzsvO0NSCLm27hlPaI=;
 b=NSvd3evSRlDYVg7ygGxQPG4tF9HCjHjpKI76JA+QToGG4E7aqd5ilIJbFYeXm25Kfw
 3cMhFRuTskuZUf64MJOa8jFXOC3EVRarhHLRQPiLbgS94AhoLo+b4FPodRaydR5w6Niq
 blUhAbuzPKa9gTNGdHA0huerh/fV7lBH5Z+ysmX7axxktj2tOZ1YJYnK7fxnhA0gRox8
 rTpiCnO8loijc3afsS/udsemoBJ1e3GdubQGQ3KsXXtc6Eyi2tvrMJ/rOnW4OFqYFp7D
 pY7IMi+ZCKJdmklTDm7tEF0wuXZuuXr93JKyArUQxr2fTbSk8C0WwNAGVYQBBrFwk9ig
 1Dkw==
Subject: Test result on Ubuntu 16.04 (was Re: [PATCH] Improve messages
 regarding font installation)
References: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
 <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
 <20160519194651.GV3528@linux.vnet.ibm.com>
 <27cce515-fa2c-f32e-fb35-ae0439a11207@gmail.com>
 <7c8fa167-70f1-9d01-d3db-2c2de2b6161f@gmail.com>
 <20160520041308.GB3528@linux.vnet.ibm.com>
 <169da448-5839-5b48-555f-19ef2d358722@gmail.com>
 <96472949-eb2b-a3d8-59ed-25150c83ffba@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3d57be07-dd15-9553-4b50-343246948fbd@gmail.com>
Date: Sat, 21 May 2016 19:22:04 +0900
MIME-Version: 1.0
In-Reply-To: <96472949-eb2b-a3d8-59ed-25150c83ffba@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/21 8:43 +0900, Akira Yokosawa wrote:
> On 2016/05/20 21:00 +0900, Akira Yokosawa wrote:
[snip]
>>
>> It seems cairo version you are using is 1.10.2.
>> The version I'm using is 1.13.1.
>>
>> As a band-aid fix, I'll send a patch in reply to this message.
>> Please note that there may be conflict with the previous patch
>> ("Improve messages regarding font installation").
>>
> 
> Hi, Paul.
> 
> I've made a better patch series relative to current master.
> I tested on both Ubuntu 12.04 and Ubuntu 14.04.
> I don't have Ubuntu 16.04 yet, but I'm going to test on it.

Hi, Paul,
I tested the patch on Ubuntu 16.04.
It works fine there.

FYI, there is a minor problem in eps2pdf.sh with a2ping spitting
a lot of messages
"GPL Ghostscript 9.18: Unrecoverable error, exit code 1".

Luckily for us, the resulting PDF looks fine to me.
Googling the above message hits a lot of pages.
But I can't figure out a workaround yet.

                                               Thanks, Akira

> I'll send a pull request later.
> (Yes, I'm using "git rebase -i")
> 
>                                                   Thanks, Akira
> 
[snip]

