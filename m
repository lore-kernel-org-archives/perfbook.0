Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=RQe4H6bujg3FqRSic6HpWVE/A4iM4IQXsI6LSU7x/cc=;
 b=CmolWyWPvyD9+fMg8jKVMFeqP1KjbXGOAHQsmyVP24zMIjyD9bYQ/1CwNHEWthk1vl
 KxpMv+6qrxhxTxBw90dyjosNhhrUXQQF4aIib1XoQv7gOmt/CPrFHQDFaJrhbkcl84x+
 ciRcnGGW50TfVskQphXdrMPLnA9qwPRAC0TN96YtrutOTzb9dTaVnajjDjHKN/z5pyuR
 lTsHMw4bd3Y+jEwoS8+91Frr7BTCTAjg7bR498y0ULNPGdLCkd2kqXIOAOsh+aL4niLF
 CwnFk1wcnbf/h4a3cXSl8NulVV7/XbZ55WycUJBMWyOb5XMsYLZmgYVplPfWVM/MHWM3
 z0ww==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH 0/4] CodeSamples: Cleanups and fixes
Message-ID: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Date: Tue, 30 May 2017 07:13:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fd5fb9afb6b99b15370a9823b42fa2a92342b92a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 30 May 2017 06:52:40 +0900
Subject: [RFC PATCH 0/4] CodeSamples: Cleanups and fixes

Hi Paul,

While I was looking around CodeSamples, I encountered several
warnings in build and an infinite loop in one of sample codes.
Also, I found that CodeSamples/api.h and CodeSamples/Makefile.arch
can be removed from repository if their recipe are properly
written in Makefiles.

Patch 1 adds rules to generate Makefile.arch and api.h that
suit the architecture of you host. As I don't have ppc64 or
arm host environment, I tested it only on x86_32 and x86_64.
I'd like to know if it works on ppc64 and arm.

Patch 2 removes the redundant files.

Patch 3 and 4 are fixes of warnings and infinite loops.

Thoughts?

                 Thanks, Akira
-- 
Akira Yokosawa (4):
  CodeSamples: Add rule to generate Makefile.arch and api.h
  CodeSamples: Remove generated files from repository
  CodeSamples: Use 'intptr_t' to be compatible with 'void *'
  CodeSamples/defer: Add compiler barriers in gettimestampmp.c

 CodeSamples/.gitignore                         |   4 +-
 CodeSamples/Makefile                           |  18 +
 CodeSamples/Makefile.arch                      |   6 -
 CodeSamples/SMPdesign/Makefile                 |   3 +
 CodeSamples/SMPdesign/matmul.c                 |  13 +-
 CodeSamples/SMPdesign/smpalloc.c               |  11 +-
 CodeSamples/advsync/Makefile                   |   3 +
 CodeSamples/api.h                              | 808 -------------------------
 CodeSamples/count/Makefile                     |   3 +
 CodeSamples/datastruct/Issaquah/Makefile       |   3 +
 CodeSamples/datastruct/Issaquah/existence_test | Bin 26359 -> 0 bytes
 CodeSamples/datastruct/hash/Makefile           |   3 +
 CodeSamples/datastruct/log/Makefile            |   3 +
 CodeSamples/datastruct/skiplist/Makefile       |   3 +
 CodeSamples/defer/Makefile                     |   3 +
 CodeSamples/defer/gettimestampmp.c             |   5 +-
 CodeSamples/depends.mk                         |  43 ++
 CodeSamples/intro/Makefile                     |   3 +
 CodeSamples/intro/threadcreate.c               |   7 +-
 CodeSamples/locking/Makefile                   |   3 +
 CodeSamples/toolsoftrade/Makefile              |   3 +
 21 files changed, 117 insertions(+), 831 deletions(-)
 delete mode 100644 CodeSamples/Makefile.arch
 delete mode 100644 CodeSamples/api.h
 delete mode 100755 CodeSamples/datastruct/Issaquah/existence_test
 create mode 100644 CodeSamples/depends.mk

-- 
2.7.4

