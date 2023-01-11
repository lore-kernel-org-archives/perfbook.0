Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjAKQJ2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 11 Jan 2023 11:09:28 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2B920E
        for <perfbook@vger.kernel.org>; Wed, 11 Jan 2023 08:09:27 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id fy8so37941306ejc.13
        for <perfbook@vger.kernel.org>; Wed, 11 Jan 2023 08:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0iRda971wY3riJfrTDXCEriNfsjd/UcN6kPpISFQ5OY=;
        b=RDBCjFKf3n+yeT8N5Rm3it1UC9Z+KGSl5ays4OiUr+QOdNy5HFePV6b+BWd58kSOLw
         Xp3lZZMm/h9fIXRgwK4krm9hoQErRMab0hWVG9OrnmB5mhm0555c/P0ihRTm2aCy6ktq
         dX3XCuvAxRJ9yb78LBbJuVCgcYr6rQHUE8WsBg47p8NDmyssAKPp0xdnRHtj2vl83K6H
         0L77ZSchwRZ4igzuCGEf/nJGzNdjOXbT3ifzB8aWjr3D/8HyL5AP3+33yr1y/2yw7VLm
         BkEAar0Od2sxxk+C5CqWqbRUlFOtrAuQ3vpjE0h78A5jKUh6otjm5ktjDOWiLFdUcqNS
         AdYQ==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 11 Jan 2023 11:09:14 -0500
Message-ID: <CAJbg=FX8rBFRqO-3bhE863OepcdShoyGg0tVeedVR2=tfjwcDQ@mail.gmail.com>
Subject: Ordering and conditionals
Content-Type: text/plain; charset="UTF-8"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello all,

Here's an interesting (hopefully!) question I came across. Consider
the following code:

int a = 0;
int b = 0;

void
writer()
{
    a = 1;
    write_barrier();
    b = 2;
}

int
reader1()
{
    for (;;) {
        if (b == 2) {
            return a;
        }

        yield();
    }
}

int
reader2()
{
    while (b == 2) {
        yield();
    }

    return a;
}

The barrier issued by the writer ensures that if any reader observes b
== 2 then it must also observe a == 1. However, that is only true if
both the compiler and the processor agree that a is loaded after b.

Consider the two reader functions. These are pretty much the same from
C's point of view, but while the dependency between b and a is clear
in the first case it is less so in the second. I can see a compiler
loading a before the loop in reader2(), but less so in the case of
reader1(). Perhaps that's just the way I interpret the code and a
compiler would treat these as exactly the same.

Let's assume then that you change the code to do something like return
READ_ONCE(a) in both cases, as the book recommends. Does it change
anything for the compiler? Does it change anything for the processor,
which can reorder the reads? Anecdotally, it seems that a read barrier
helps with reader2(), but I would not expect it to be needed for
reader1().

Thoughts?

--Elad
