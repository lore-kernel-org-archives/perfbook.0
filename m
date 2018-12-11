Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=W+JsdAs+mDr+Rit1G7w7DnTe5CpV1SfoHUpybP+XbPM=;
        b=BYyNBPz8ytina6opNT9+Y6B0BpZ0MY0r7X3VkSmxhSQjOBBqqTYicOBsMCo+jlypGD
         x222ZsWp+nFJJN7JWG1tMFCWjiPY/Clt4H/oUp/HcXsV+DXWhtzZrpSbzlKkwKLV4NLt
         DlNh5bQ0g3hy8p0I+3rjQRpFMXG0Mo0CIHP+qT/+zxK26VKBfnDHcB9nqrnKkCqPlzf7
         rAYiLvW9N3yrHkW8nLZd0wO3fPC3QwKT7K+JMTIp+tEEsV2UpsYXBWapOdWLw3QVNFET
         ws7vdm59b1fAZB+8YCyQ6zDMqj6xEea05gcO1xH0yOxwt6EzeOCbePqL41r7oIFJJ2/t
         rkwQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] Update definition of cmpxchg() under CodeSamples
Message-ID: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
Date: Wed, 12 Dec 2018 00:39:38 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH 0/4] Update definition of cmpxchg() under CodeSamples

Hi Paul and Junchang,

Based on the earlier correspondence, I prepared a patch set to update
the definition of cmpxchg().

Patch #1 adds a simple litmus test of cmpxchg().
Patch #2 fix cmpxchg() in .../litmus/api.h by specifying strong
__atomic_compare_exchange_n)\(). Results of litmus tests are presented
in the commit log.
Patch #3 fix cmpxchg() in .../api-gcc.h in the same manner as patch #2.
Patch #4 is not intended to be applied to master, but provides a weak
variant of cmpxchg() and count_lim_atomic_weak.c.

I did some experiments on PPC (10 runs each).

count_lim_atomic 1 uperf, ns/update (as of v2018.12.08a):
56.6572
56.4972
56.5504
56.4972
56.6305
56.5238
56.6038
56.5238
56.5504
56.5238

count_lim_atomic 1 uperf, ns/update (as of Patch #4):
38.3264
38.1073
38.2287
38.2287
38.2653
38.3142
38.1194
38.1801
38.4986
38.2531

count_lim_atomic_weak 1 uperf, ns/update (as of Patch #4):
47.3186
47.3747
47.4121
47.5248
47.3934
47.3373
47.3186
47.4121
47.6002
47.3186

So count_lim_atomic (strong semantics) is around 9ns/update
faster than count_lim_atomic_weak, and is around 18ns/update
faster than count_lim_atomic of v2018.12.08a.

This contradicts Junchang's view. The difference looks like
due to removal of ternary operation in cmpxchg().

Or I might be missing something.

Junchang, can you please experiment on PPC and ARM?

        Thanks, Akira
--
Akira Yokosawa (4):
  CodeSamples: Add C-cmpxchg.litmus
  CodeSamples/formal/litmus/api.h: Fix definition of cmpxchg()
  CodeSamples: Fix definition of cmpxchg() in api-gcc.h
  [EXP] CodeSamples: Add weak variant of cmpxchg() as cmpxchg_weak()

 CodeSamples/api-pthreads/api-gcc.h         |  19 ++-
 CodeSamples/count/Makefile                 |   4 +
 CodeSamples/count/count_lim_atomic_weak.c  | 226 +++++++++++++++++++++++++++++
 CodeSamples/formal/litmus/C-cmpxchg.litmus |  24 +++
 CodeSamples/formal/litmus/api.h            |   2 +-
 5 files changed, 272 insertions(+), 3 deletions(-)
 create mode 100644 CodeSamples/count/count_lim_atomic_weak.c
 create mode 100644 CodeSamples/formal/litmus/C-cmpxchg.litmus

-- 
2.7.4

