Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=u+HXpeU8c9fDhJHpBFUUMC/fXpPhlZ3VIi+wcodQtIg=;
 b=IM41YZIduGgbpNzvVxaMHUg9VR/Xopp/fPRkzFOi+tGbF3ErbyGPbV2f1dAaSCX+/w
 f3Fjy5w8e0ZXcFYMy4HrgQE7uQ2yVoodUpI31Zz2ZXhoYNr5urTuo5bDOhe/F6UJgQx1
 SUiTKm+wYyrX8gSP1WC2SQGGSgs7EksYZtbVBxdD06oOx7SfItJv+IbPZ2ejame8bD1l
 1OPcEF9ish7M0OfN61dXJ2+SNeqtx4qZIjek2bP+zHX7hKUz4s4k/L6igixbcvEAe9q3
 Dn3Fyn4kmkPBF+83bo7taQCB/e0CYCdxk2H7u5RZhLDQbiq0c+c6fCyn9mxtQQLfLqvX
 JOkg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] CodeSamples: Add arm64 support
Message-ID: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
Date: Wed, 12 Jul 2017 00:30:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1908602500df34619ec496c787546d5584d01221 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 00:01:30 +0900
Subject: [PATCH 0/2] CodeSamples: Add arm64 support

Hi Paul,

So, this patch set adds arm64 support for CodeSamples.

Patch 1 is a followup of the previous patch set. I missed the dependency
to the custom header file.
Patch 2 is the addition of arm64 support. It is based on arm support files.
I appended an "ish" operand to "dmb" in the definition of smp_mp().
Looks like the same change is necessary in arch-arm/arch-arm.h, but this
patch doesn't touch it.
Also, I rewrote the definition of get_timestamp() by using clock_gettime()
instead of gettimeofday(). For arm64 host, we can expect clock_gettime()
is supported.
In Makefile.arch, I chose the flags -mcpu=native and -mtune=native, since
this Makefile is intended for native build.
This is compile tested on an ARMv8 host. I didn't have enough time to
run all the programs. I tested a few under count/ and defer/ sub-directories.

        Thanks. Akira
--
Akira Yokosawa (2):
  advsync: Add dependency to $(CUSTOM_HEADER)
  CodeSamples: Add arm64 support

 CodeSamples/advsync/herd/Makefile    |  2 +-
 CodeSamples/arch-arm64/Makefile.arch |  2 ++
 CodeSamples/arch-arm64/arch-arm64.h  | 61 ++++++++++++++++++++++++++++++++++++
 CodeSamples/depends.mk               |  5 +++
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 CodeSamples/arch-arm64/Makefile.arch
 create mode 100644 CodeSamples/arch-arm64/arch-arm64.h

-- 
2.7.4

