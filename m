Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=5VUuPowfQcAhaZ8TpMXNryfaZdXcugZb8C94+E1bQ9s=;
 b=Zx/NCJPodfv3guKuAHkzKi5mz0B8BYk5/wblx4rxJYj813LABm018e5n3b+/NgXTsC
 IQwM/MGhoWuzl0RP/A2Kew5xwcS1frWMAa0Hd5LkEn5Oukg/b8egCUClzxlpVY3g3nPJ
 Mhg+jVbu4wjc/2sivnMY66J3i4uDP+nObcZuvWCD6+ZGnzNqKxGt6QwleJiJZvQbFaWz
 cC3grln8CLR2TO6EdSIvjeYL6PG38hQKl0VRzWu8rKNofeAdUcTSQYwL9GCv0NSIJ6Lw
 2MaIZyl7IzhtMzRb2rrXKidhLzHZJKD1ACDoe3tBXTQk8X/bmzcA0iD5OiknJ434Owz+
 LGEg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Question of usage of per_thread()
Message-ID: <71206929-11cd-73bc-560e-f982c7e86cf8@gmail.com>
Date: Sun, 16 Sep 2018 17:37:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Every time I review code under CodeSamples/,
I find myself confused where to use READ_ONCE/WRITE_ONCEs.

I'm looking at Listing 5.3 of current master.

There are two cases which lack READ_ONCE/WRITE_ONCE to access potentially
shared variables, namely on line 5 (__get_thread_var(counter)++;) and
on line 14 (sum += per_thread(counter, t);).

Line 5 looks like a good candidate to be optimized out when inlined.
But the performance result indicates "gcc -O3" keeps it inside the loop.

Is this because the definition of __get_thread_var() contains
a call to smp_thread_id() and complicated enough not to be optimized
out?

As for line 14, as per_thread() was derived from per_cpu() of kernel
API, I looked for call sites of per_cpu() in the kernel source tree.

There are very few cases where READ_ONCE/WRITE_ONCE is used along
with per_cpu(). There are two READ_ONCEs with per_cpu() in
kernel/rcu/srcutree.c, whose author is none other than you.
Are those READ_ONCEs necessary?

I don't grasp the actual definition of per_cpu() macro.
Definition of per_thread() macro under CodeSamples/api-pthreads/
does not look so complicated, but contains array indexing,
which might be good enough to prevent optimization in the loop.

I'm not sure, but my gut feeling is that READ_ONCE/WRITE_ONCE
is necessary to access an unannotated variable. If we need
volatility for sure, we could modify the definition of annotating
macros/functions.

Can you enlighten me?

        Thanks, Akira

