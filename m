Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=awaL1hIQbpqCEVEMMo1QJP5db4LACGv4+mKDcXW1LiA=;
        b=BlSFbqWb1/TxrOu6d3NKYBWlFJVoVPZT6F5dn9vAgc5JXY+3TraI6B9M8nSq2NmX8u
         OiM8LF6MuHcHn0oNpgB3iTHx+aWqXlxu6M7fJdto/jeq39dDGZgRHzrJGZfiKKKwKKJa
         R3Et9gv65IXALeWpE8AhSnOHWbqPa0wTk6QQ1QXaPRLX0dqeUXeW87mTkEFVk2zo+ZPt
         8fkw2nX2M00MNZRDu4oSrRB5x8fjBQwhT8GvjoZAvkFJ+wgyu9n843ojCRWi9JPm00H5
         owgNHxmrITmZCPWo7wnozBfOkAiWZNIcSXmVjc2xqMbmxXG9YhPkZNZ1hADb2EitSHEU
         jeTg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] CodeSamples/Makefile: Add conditional for liburcu on Ubuntu
 Bionic
Message-ID: <2bdaa0c0-3a0a-83a7-ee1b-2747bae2cb03@gmail.com>
Date: Wed, 3 Oct 2018 23:52:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 91e27d8066e353966b4c35de15f70e278fbcb8ce Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 3 Oct 2018 23:29:29 +0900
Subject: [PATCH] CodeSamples/Makefile: Add conditional for liburcu on Ubuntu Bionic

On Ubuntu Bionic, header files of liburcu-dev are installed under
an arch dependent directory such as /usr/include/x86_64-linux-gnu/.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile   | 4 +++-
 CodeSamples/depends.mk | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 036fc66..3a96f5c 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -39,7 +39,9 @@ endif
 	echo "" >> api.h
 	cat api-pthreads/api-gcc.h >> api.h
 	echo "" >> api.h
-	if test -f /usr/include/urcu-call-rcu.h -o -f /usr/local/include/urcu-call-rcu.h ; \
+	if test -f /usr/include/urcu-call-rcu.h -o \
+		-f /usr/local/include/urcu-call-rcu.h -o \
+		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h ; \
 	then \
 		echo "#define _LGPL_SOURCE" >> api.h; \
 		echo "#include <urcu/rculist.h>" >> api.h; \
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index 77a76bf..31a8daf 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -4,18 +4,25 @@ endif
 
 ifeq ($(arch),i686)
 target := x86
+subdir_ub := i386-linux-gnu
 else ifeq ($(arch),x86_64)
 target := x86
+subdir_ub := x86_64-linux-gnu
 else ifeq ($(arch),ppc64)
 target := ppc64
+subdir_ub :=
 else ifeq ($(arch),ppc64le)
 target := ppc64
+subdir_ub := powerpc64le-linux-gnu
 else ifeq ($(arch),aarch64)
 target := arm64
+subdir_ub := aarch64-linux-gnu
 else ifneq (,$(findstring arm,$(arch)))
 target := arm
+subdir_ub := arm-linux-gnueabihf
 else
 target :=
+subdir_ub :=
 endif
 
 api_depend_common := $(top)/linux/common.h \
-- 
2.7.4

