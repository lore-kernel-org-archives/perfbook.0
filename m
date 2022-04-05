Return-Path: <SRS0=HRQO=UP=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=S3m6jlo62vnxhtfVXRC8rBeE+OxIjqJzF0WDkXtnjdo=;
        b=BNSiUqS/vDKX0MZU8fI2kEhTb2Faq6jWPeccZj7p3nGLxNudtYuRw0TxiVvjz9NfHp
         GebFskjh7qpyP/o9aMPhCCIjd62dlbMyGJ2hqRAwOhLngSqVh7HeYwTQJveJctpGOnI6
         80Fvk6TGBA/hU/7YR1D/zsIgZLnsqEsLdnf3iJOrwiFBVxNoEP9Qsibavgk4YJbbLXhT
         dAGMEHatIvJashMG61LL4e5pVpmVz7hqk2CnTZGWzG2WUP506oamz3Drj2FwyMC8kWVe
         kN54LfBvvQpOk9ArP2EygY1DrMVjiScC0auCAp8gWvgQ4SMow2POuwrI8TaDsBw88CyD
         XCkA==
MIME-Version: 1.0
From: Hao Lee <haolee.swjtu@gmail.com>
Date: Tue, 5 Apr 2022 21:52:23 +0800
Message-ID: <CA+PpKPmTsMMP6n3hYEqNxav_qQcyFPmff0GwYCauyuHY7GDM3w@mail.gmail.com>
Subject: Does perfbook need some prior knowledge?
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi, Paul

I'm currently reading perfbook, but I often get stuck in some concepts
which are not explained. Does this book need some prior knowledge?
Or all these concepts are explained later and I just need to keep
reading patiently?

For example, on page 67 in v2021.12.22a:

    For example, a write memory barrier (Linux kernel smp_wmb()) would
    order the store, but not the load. This situation might suggest use
    of smp_store_release() over smp_wmb().

Unfortunately, although I have some knowledge about Linux kernel, I'm not
familiar with the concepts such as store_release, smp_wmb, etc. I don't
know if I should keep reading this book until all these concepts are
explained or stop reading the book and learn some prior knowledge.

Thanks,
Hao Lee
