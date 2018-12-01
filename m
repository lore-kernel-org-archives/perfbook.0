Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=xX2em2BCEzy2/hloVT4FtnxMgPYX1705/LUyRB99MDg=;
        b=QDvg4aIjEHfv1yIBbNpoFTqwm4mwlZoIOxhYAZ0vYYNGVrt3jQSRwizzL/ZRo9iCk2
         5E59yCYAkIsWN8yj7P5HeteKMCObSGRGsUKJxIZfuGL9vDumPucz6+dwQm4ra2QKUybz
         aXDIujWi/d0UQVmb0YS69hNPRZdj9ogfLouiHFtCTg9QEk0aXCLR9ZviwnbvC7S2Dk/G
         qv/OmhooezQYNRNi61liBHb/vHpPtdlor9Z60V7edeS2Gb69UbHT52gHgQKUKOmKJhHz
         dIIhwkUc6+2S7x7Y0KWk2IWtvpEpWAK6DMiCc5Bda7hYy4eZU4mkTilC+OXULMRhkk+7
         IUVQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: lockless_dereference() in perfbook
Message-ID: <04a39364-9f34-16e6-fb01-4ac85a50fb6f@gmail.com>
Date: Sat, 1 Dec 2018 16:48:03 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

As LKMM dropped lockless_dereference() when it was merged in v4.17,
CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus fails to
be evaluated by "make run-herd7" under CodeSamples/formal/herd.

lockless_dereference() is still covered by CodeSamples/formal/litmus/api.h
and klitmus7, so the test can be evaluated by litmus7 and "klitmus7 at the
moment.

In commit 48ec12dac0c3 ("memorder: Update based on v4.15 Linux kernel
de-Alpha-ication"), you added a footnote in Section 15.2.3 saying:

    Note that lockless_dereference() is not needed on v4.15 and later,
    and therefore is not available in these later Linux kernels.

There remain several lockless_dereference()s in perfbook without any
updates.

In the Answer to Quick Quiz 15.15, lockless_dereference() is mentioned
several times.

Quick Quiz 15.17 says:

    Why doesn't line 18 of Listing 15.12 need a lockless_dereference()?

Leading paragraph of Section 15.3.2.1 says:

    The load that heads your dependency chain must use proper ordering,
    for example, lockless_dereference(), rcu_dereference(), or a READ_ONCE()
    followed by smp_read_barrier_depends().

In the middle of Section 15.5, there is a sentence:

    Note also that a dependency leading to a load must be headed by a
    lockless_dereference() or an rcu_dereference(): READ_ONCE() is not
    sufficient.

Could you look into them?

One problem in regard to litmus tests might be that there is no means
to indicate plain accesses with no memory barrier in current LKMM.
At the moment, C-MP+o-wmb-o+o-addr-o.litmus behaves identically as
C-MP+o-wmb-o+ld-addr-o.litmus would do.

        Thanks, Akira

