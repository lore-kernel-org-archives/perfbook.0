Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=M46kcSxGuxhnw8k1Y3yTF+LDSRu9KawdEYKSvvk4p9o=;
 b=eb6O3+jZjrebqzvYCqEzl7hFbxdxm64fadnT9peA2/vDWaEiTE0S1jGRMhlrLgRa5Y
 tbQjBUEo9D/Tk6YSxUU9FEpDwxDgbMTIDwBXeVeEvoangRGtgf3fJSrUzREt0NMGCrSb
 Fxm9y81rEz+MnmW6uA1HJiEslTuDs3pUfqHeBSdA/OjIzQfBu0vryvmJAmpfkMywPb/l
 yr08dR1Gx0G09mx+lhw9s4zwaQs9/yER5RWAlBCGwF5dvKGZhDStaqF2Bo5p4t9hVrxh
 pFMtjLJkhPy6H1gwQFpEp+LPh1H1Ll9tG63Uj56UTg0+hX8A+msW8Fe9pIifimP7YYCn
 UkdQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] CodeSamples: Cleanups and Makefile updates
Message-ID: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
Date: Sat, 10 Jun 2017 00:22:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b31141981b13d40fbbe5d20fa339d714ecba084c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 9 Jun 2017 23:59:11 +0900
Subject: [PATCH 0/5] CodeSamples: Cleanups and Makefile updates

Hi Paul,

Removal of gprof-helper.c and linux/list.h has become a fairly large
patch set.

Patch 1 is simple removal.
Patch 2 is an improvement to make the "-jN" option to propagate to
subdirectories.
Patch 3 removes linux/list.h, with refactoring of recipes.
Patch 4 adds subdirectories that can be built by "make" in the
CodeSamples/ directory.
Patch 5 improves build behavior for unsupported architectures.
You can test the behavior by overriding "arch" variable by defining
it as an environment variable, e.g.:
    $ export arch=unsupported
    $ make clean; make
After the test,
    $ unset arch
will restore the normal behavior.

Thoughts?

            Thanks, Akira
--

Akira Yokosawa (5):
  CodeSamples: Remove gprof-helper.c
  CodeSamples: Use $(MAKE) for recursive make
  CodeSamples: Makefile: Remove linux/list.h
  CodeSamples: Makefile: Add subdirectories
  CodeSamples: Makefile: Distinguish arch-independent targets

 CodeSamples/.gitignore                   |   1 -
 CodeSamples/Makefile                     | 125 +-----
 CodeSamples/SMPdesign/Makefile           |  19 +-
 CodeSamples/advsync/Makefile             |  11 +-
 CodeSamples/count/Makefile               |  11 +-
 CodeSamples/datastruct/Issaquah/Makefile |  11 +-
 CodeSamples/datastruct/hash/Makefile     |  11 +-
 CodeSamples/datastruct/log/Makefile      |  11 +-
 CodeSamples/datastruct/skiplist/Makefile |  11 +-
 CodeSamples/defer/Makefile               |  18 +-
 CodeSamples/depends.mk                   |  14 +-
 CodeSamples/gprof-helper.c               | 118 ------
 CodeSamples/intro/Makefile               |  15 +-
 CodeSamples/linux/list.h                 | 700 -------------------------------
 CodeSamples/locking/Makefile             |  15 +-
 CodeSamples/recipes.mk                   |  10 +
 CodeSamples/toolsoftrade/Makefile        |   1 +
 17 files changed, 139 insertions(+), 963 deletions(-)
 delete mode 100644 CodeSamples/gprof-helper.c
 delete mode 100644 CodeSamples/linux/list.h
 create mode 100644 CodeSamples/recipes.mk

-- 
2.7.4

