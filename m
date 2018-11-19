Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OWBjxjI3FcuRynckI9zFOVpKvrE45DD1+EVt3ZOm5Mg=;
        b=PYMcr7miikypdtWi4PX6RwFfP8BPkDin+1WMZTn18Kr2jxm/mSHrLU2St1qsZxkhqL
         BfpeScDncVaSE66H2Sk3V/GocnKiivONHkxJ3qelHyBepWUowQyQ0fF1HfpZi5NrANvV
         oPYSqDyCSfYOYvpYO+X/cbXLzUeEju8RoNeyR71SyJxrUffuyeGVr5XZUL8Udx3dx1t8
         Bgdv5XvpkK9T00NtNuVmJHREa21v5L5hAnSc1HnuDhMcmEwIbCd8swZDaYrJ6ryUyuh+
         C7Ct7PkXOK1s5zh0x2EM0JpTUza9gk6a6jf1slKyeeJ/36KGpMxmAvKetXzzor1iF7FG
         MoAg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] locking: Update code snippets
Message-ID: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
Date: Tue, 20 Nov 2018 00:15:49 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0d7e7b86bf743ee1646b705f246bc50e38d23803 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 20 Nov 2018 00:03:43 +0900
Subject: [PATCH 0/3] locking: Update code snippets

Hi Paul,

This is another set of patches to apply new code-snippet scheme in
Chapter 7.

Patch #1 does the simple substitutions.

Patch #2 replaces remaining ACCESS_ONCE()s in Chapter 7 and
CodeSamples/locking. It also adds a couple of READ_ONCE() and
WRITE_ONCE() in xchglock.c.

Patch #3 fixes the use of "figure" referencing code snippets.

        Thanks, Akira
--
Akira Yokosawa (3):
  locking: Employ new snippet scheme
  locking: Get rid of ACCESS_ONCE()
  locking: Fix reference to code snippet by "figure"

 CodeSamples/locking/locked_list.c |  29 ++-
 CodeSamples/locking/xchglock.c    |  32 +--
 locking/locking-existence.tex     | 108 ++++-----
 locking/locking.tex               | 473 +++++++++++++++++---------------------
 4 files changed, 299 insertions(+), 343 deletions(-)

-- 
2.7.4

