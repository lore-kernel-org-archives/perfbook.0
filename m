Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CuElHrLzxLf2rpBzNW+uldKjC8kKVeQqJj8aFiXQv6w=;
 b=egzYjlO5ebFggjW6Pt0EG1tqu6HjQDYLGBVQUwijEiFdBqmA5HLlVWVzKnMGOLmjrj
 w1vGRXMec/HRbPiI0DfuU1lFZTOSfrKo6RafkAivdxW/LMU/AXYrf3tM2MmcRlopIM0i
 c86uoO7IktpcwZ4Bmt3Icj9zmxt05B4L9F6aipxopCLvVKuNC6sJeOaAdX81xzjBXajL
 CM2rDpQOr3xu6MQg9ufZ40ag44f3pvntiH8MumEYi4xMeV+7YNfg4SbR1UUStfVcm2IT
 WjT602OkOoCu9+1B1xG2CouPp+rqW2a+llNS4N7LKkiI+6KWj+kTYbDs3m1Kgz5wfDKl
 Sm1Q==
Subject: Re: [PATCH 0/5] memorder: Update table layout
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8da24358-1887-bb29-b1b1-e65bb7468624@gmail.com>
Date: Mon, 25 Sep 2017 07:10:39 +0900
MIME-Version: 1.0
In-Reply-To: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/09/25 07:00:53 +0900, Akira Yokosawa wrote:
>>From acefbb69d69562438d7a7568f671fc85528d5b5f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 25 Sep 2017 06:38:06 +0900
> Subject: [PATCH 0/5] memorder: Update table layout
> 
> Hi Paul,
> 
> My first thought was to update a few experimental tables to catch up
> the changes in memorder.tex.
> But these new tables are likely to change further.
> So I changed my mind and converted the 5 tables in memorder.tex using
> the new scheme of shading alternate rows. 3 of the 5 tables are already
> presented in the style guide.
> In the memorder chapter, we already converted code snippets to the
> "listing" environment. So using the new table layout in this chapter
> sounds reasonable to me.
> 
> Patch #1 updates already experimented tables and a similar one.
> Patch #2 is an attempt to apply new scheme to the remaining table.
> Patch #3 is an improvement of the table changed in Patch #2.
> Patch #4 removes experimental tables in style guide.

The order of #3 and #4 was reversed.

> Patch #5 is a separate patch to improve MoreThanOneValue and
> MoreThanOneValue-15CPU figures.
> 
> I'd like to know if the changes in Patches #2 and #3 work with you.

I mean "changes in Patches #2 and #4".

> 
>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   memorder: Convert tables to alternate-row coloring scheme
>   memorder: Convert 'Summary of Memory Ordering' table to new scheme
>   styleguide: Remove experimental tables updated in memorder chapter
>   memorder: Add multi-column headers to 'Summary of Memory Ordering'
>     table
>   memorder: Reduce color saturation of MoreThanOneValue figure
> 
>  appendix/styleguide/styleguide.tex  | 113 +---------------------
>  memorder/MoreThanOneValue-15CPU.fig |   2 +
>  memorder/MoreThanOneValue.fig       |  26 ++---
>  memorder/memorder.tex               | 183 ++++++++++++++++--------------------
>  perfbook.tex                        |   1 +
>  utilities/MoreThanOneValue-15CPU.c  |   3 +
>  6 files changed, 107 insertions(+), 221 deletions(-)
> 

