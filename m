Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7MoUNz1oLGJyQwaM99F4FJ08h2KwxPt0qfdIBM2bfP8=;
 b=rvtvR3Nm03jF4pDjZzIaoEpnqaz/bAm5toRqdzgiuA/OtMapH0mWA2XAbF//Sa7auN
 BY8bw2CYIFvTc/clIDqTfUiD36JqlTS1TSjLXQ0xAojITtOQJYiR4pnzrQGz5XwEVufS
 Zx3sojODvGL+rcx9+kAzQjEFhe67tLDTH492uOBJIi9JRjp8tXjMPvJpk9X3nvqnfhbB
 g6V58kQHsL/cPkUW2rUMt3q/IiYOWYMS17NCvRr6nbtE0Oi8sc/x3x9kOO+CzEn0OZIi
 AU4ljhv+busnJOG+Pr1aEhhImvrisdqUNiC+xXQHDa1n86S51Mv9UZg/M9FHZ+CTtVPt
 vzHA==
Subject: Re: [PATCH] advsync/rt: Remove epigraph under section
References: <458f0875-24ae-d62b-6448-152affe8fb7c@gmail.com>
 <20171021171459.GM3521@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a3fafdfc-4791-e648-204c-e879717a929a@gmail.com>
Date: Sun, 22 Oct 2017 09:20:45 +0900
MIME-Version: 1.0
In-Reply-To: <20171021171459.GM3521@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/21 10:14:59 -0700, Paul E. McKenney wrote:
> On Sat, Oct 21, 2017 at 08:27:57PM +0900, Akira Yokosawa wrote:
>> >From 7ec65f19bf8b1d8a6389e684955d672658ac1010 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 21 Oct 2017 20:20:27 +0900
>> Subject: [PATCH] advsync/rt: Remove epigraph under section
>>
>> Also modify label (chp -> sec).
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Heh!  It overprinted and I didn't notice!  
> 
> Good catch on both counts, applied, thank you.

The epigraph can be restored under the section heading by using
the \epigraph command instead.

I'm sending a patch to do so. Please give it a try.

          Thanks, Akira

> 
> 							Thanx, Paul
> 
[...]

