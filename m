Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9f7if3WChltT8yutksSzQncA7lUUl7Bmu8txaMZaSPo=;
 b=t6DhHum9QQAQ9NIzeelTzDQI/Y1/DOgpW6Up/Hy/jh3encdEIH8Bq581qj5G/SQvVz
 S/smX5+cSTjxd7vM2yfK0ce48F793yp9fTivQcgwI1059EeB5GDWhebcv8l+40+H7l3y
 n5uq1zoR4lXP1do/oC15N1LDd7HoIHz0oRKsAIizvrYvRgN9V8dJUjoz9cXjwnRGAmOG
 f//t0G623EaAR2Wm5NwYZ6GH54zY4wUDt27h9JLHHksDPOqxK0oVWWQXninJGB7PhdQx
 ijozDiHbus66aGbIaI8bvYzquXjbyyZ7jmI5HzKmGany5bHwHSSKa7P4PZ3hcnx/IfkZ
 Oqew==
Subject: Re: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross
 compiling
References: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
 <61f6fcf3-480c-8ba4-a4b2-4af17546b53f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <488587ce-a895-3079-0578-ff31f128f7ea@gmail.com>
Date: Sat, 11 Nov 2017 08:56:01 +0900
MIME-Version: 1.0
In-Reply-To: <61f6fcf3-480c-8ba4-a4b2-4af17546b53f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/11 08:41:54 +0900, Akira Yokosawa wrote:
>>From 6ecff66f2b5f95e914d90e29b6d0a2eb4d8901cc Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 11 Nov 2017 08:25:34 +0900
> Subject: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross compiling
> 
> Also fix corresponding code snippet.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus | 2 --

By the way Paul, didn't you have a plan to mention these "C-2+2W" litmus tests
somewhere in the memorder chapter?

    Thanks, Akira

>  CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus  | 2 +-
>  memorder/memorder.tex                                   | 2 +-
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 

[...]

