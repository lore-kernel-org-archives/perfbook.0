Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbjAKWUZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 11 Jan 2023 17:20:25 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AF1BB8
        for <perfbook@vger.kernel.org>; Wed, 11 Jan 2023 14:20:24 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id o13so13764655pjg.2
        for <perfbook@vger.kernel.org>; Wed, 11 Jan 2023 14:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjGHSHB4rdOJgniF9CQScgCJXHc/Y4oYo5HvsO9rWCA=;
        b=iRSbhyiT2Cy5qT20s31Hp3jQChi0zIWsBS5JXggQRzjVCKN6lUmnID7/EX+qDZs7Af
         ZACDgxdgFUsJwZNuoZZ7es32DaB1bxLKtWmEtML6LFlVKMbpFJQJ6d57Cc17a9+0Dg1t
         q26PMfW65nWvh7yrESkjewpsFfJQ3WD6kf+4mblWyqQ9gSG+MxEwfMfmWy0eBJAiyjEl
         wJqhzV3W4hoBoRQHu7sGXPuI8kZxb5LtkFs9f1kmjxNv0YXdd9HVWL5L8dzVH7ToO9ID
         4tJVqDgF46k4pZfKhsKLuu+MPsYLYQLb/J6i23/L8m7ZLSI0ZRMf+jrTv9sPA5/zM/56
         0P3g==
Message-ID: <fd3c9cc6-12d4-6d02-0e32-9e6c20deb342@gmail.com>
Date: Thu, 12 Jan 2023 07:20:19 +0900
MIME-Version: 1.0
Subject: Re: Ordering and conditionals
References: <CAJbg=FX8rBFRqO-3bhE863OepcdShoyGg0tVeedVR2=tfjwcDQ@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAJbg=FX8rBFRqO-3bhE863OepcdShoyGg0tVeedVR2=tfjwcDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

Hi Elad,

On Wed, 11 Jan 2023 11:09:14 -0500, Elad Lahav wrote:
> Hello all,
> 
> Here's an interesting (hopefully!) question I came across. Consider
> the following code:
> 
> int a = 0;
> int b = 0;
> 
> void
> writer()
> {
>     a = 1;
>     write_barrier();
>     b = 2;
> }
> 
> int
> reader1()
> {
>     for (;;) {
>         if (b == 2) {
>             return a;
>         }
> 
>         yield();
>     }
> }
> 
> int
> reader2()
> {
>     while (b == 2) {
>         yield();
>     }
> 
>     return a;
> }
> 
> The barrier issued by the writer ensures that if any reader observes b
> == 2 then it must also observe a == 1. However, that is only true if
> both the compiler and the processor agree that a is loaded after b.
> 
> Consider the two reader functions. These are pretty much the same from
> C's point of view, but while the dependency between b and a is clear
> in the first case it is less so in the second. I can see a compiler
> loading a before the loop in reader2(), but less so in the case of
> reader1(). Perhaps that's just the way I interpret the code and a
> compiler would treat these as exactly the same.
> 
> Let's assume then that you change the code to do something like return
> READ_ONCE(a) in both cases, as the book recommends. Does it change
> anything for the compiler? Does it change anything for the processor,
> which can reorder the reads? Anecdotally, it seems that a read barrier
> helps with reader2(), but I would not expect it to be needed for
> reader1().
> 
> Thoughts?

I think Section 15.2.5 "Control Dependencies" can answer your question.

TLDR, control dependencies are good for load-to-store ordering.
You are talking about load-to-load ordering and control dependencies
don't suffice.

        Thanks, Akira

> 
> --Elad
