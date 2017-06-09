Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yKvR9I9e1xQP9U9WScSu9ukmK+MdtlC4nzIl4e8bCF4=;
 b=NMI6fBLsUZnnJTtVptjUKAtTURW+i2oviqGe4nlMIDe5YTx+SXyfIwSCOgCp8RqZ87
 6iW4CroRPeQmf7p8VWjIKgDyhIrnKJs4qyeuXVKdNMRH22UdW8tFsnH2cRsluc9JU1Hs
 WKPJ3FkMUTsQyZIa3YPKukTeQAIcu99bmvm0UkGm35wDoHI9JVj1ncrNbvr7GUF13bCc
 ZWziYiHokkRbMCbAcF9mtj6oGoKNKA++9iShCrDBytl4uL1oi0Y526P1GZzHIeiRZhzY
 /a5zgrT7umoPcKcc39wWsf8eu4YwqP2519810LBeRxGnTGSSJwkzg7lj5kdXXGdstLPs
 PjmQ==
Subject: [PATCH 5/5] CodeSamples: Makefile: Distinguish arch-independent
 targets
References: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4e3b7d05-b11f-0475-3fa0-9cb673b02e08@gmail.com>
Date: Sat, 10 Jun 2017 00:30:10 +0900
MIME-Version: 1.0
In-Reply-To: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b31141981b13d40fbbe5d20fa339d714ecba084c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 9 Jun 2017 19:18:40 +0900
Subject: [PATCH 5/5] CodeSamples: Makefile: Distinguish arch-independent targets

On hosts of unsupported architecture, generated api.h does not
contain architecture-specific definitions. This will result in
build errors.

There are quite a few code samples which can be built with such
api.h.  So, this patch distinguishes architecture-independent targets
in Makefiles and let those targets be built.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile                     |  3 ++-
 CodeSamples/SMPdesign/Makefile           | 19 ++++++++++++++-----
 CodeSamples/advsync/Makefile             | 11 +++++++++--
 CodeSamples/count/Makefile               | 11 +++++++++--
 CodeSamples/datastruct/Issaquah/Makefile | 11 +++++++++--
 CodeSamples/datastruct/hash/Makefile     | 11 +++++++++--
 CodeSamples/datastruct/log/Makefile      | 11 +++++++++--
 CodeSamples/datastruct/skiplist/Makefile | 11 +++++++++--
 CodeSamples/defer/Makefile               | 18 ++++++++++++++----
 CodeSamples/depends.mk                   | 11 -----------
 CodeSamples/intro/Makefile               | 15 ++++++++++++---
 CodeSamples/locking/Makefile             | 15 ++++++++++++---
 CodeSamples/recipes.mk                   | 10 ++++++++++
 CodeSamples/toolsoftrade/Makefile        |  1 +
 14 files changed, 119 insertions(+), 39 deletions(-)
 create mode 100644 CodeSamples/recipes.mk

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index cef6927..6b2c3c9 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -4,6 +4,7 @@ subdirs += datastruct/Issaquah datastruct/hash datastruct/log datastruct/skiplis
 .PHONY: all clean pthreads

 top := .
+include depends.mk

 all:
 	for d in $(subdirs); \
@@ -11,7 +12,7 @@ all:
 		$(MAKE) -C $$d; \
 	done

-include depends.mk
+include recipes.mk

 api.h Makefile.arch:
 ifeq ($(strip $(target)),)
diff --git a/CodeSamples/SMPdesign/Makefile b/CodeSamples/SMPdesign/Makefile
index d03575c..b1e5fc8 100644
--- a/CodeSamples/SMPdesign/Makefile
+++ b/CodeSamples/SMPdesign/Makefile
@@ -14,20 +14,29 @@
 #
 # Copyright (c) 2008 Paul E. McKenney, IBM Corporation.

-PROGS = smpalloc lockdeq lockhdeq locktdeq lockrwdeq matmul matmul_block
+ARCH_INDEPENDENT = smpalloc
+ARCH_DEPENDENT = lockdeq lockhdeq locktdeq lockrwdeq matmul matmul_block
+PROGS = $(ARCH_DEPENDENT) $(ARCH_INDEPENDENT)

+include ../Makefile.arch
+
+top := ..
+include $(top)/depends.mk
+
+ifeq ($(strip $(target)),)
+all: $(ARCH_INDEPENDENT)
+	@echo "### $(ARCH_DEPENDENT) in SMPdesign/ can't be built on arch: '$(arch)'."
+else
 all: $(PROGS)
+endif

-include ../Makefile.arch
+include $(top)/recipes.mk

 # GCC_ARGS=-g -O3

 # http://www.ibm.com/developerworks/wikis/display/hpccentral/Tuning+options+to+consider+with+gcc#Tuningoptionstoconsiderwithgcc-mcpuandmtune
 # GCC_ARGS=-g -O3 -m64 -mcpu=power5 -mtune=power5

-top := ..
-include $(top)/depends.mk
-
 smpalloc: smpalloc.c ../api.h
 	cc $(GCC_ARGS) -g -o smpalloc -DTEST smpalloc.c -lpthread

diff --git a/CodeSamples/advsync/Makefile b/CodeSamples/advsync/Makefile
index bb4c8fc..f2e0db3 100644
--- a/CodeSamples/advsync/Makefile
+++ b/CodeSamples/advsync/Makefile
@@ -18,11 +18,18 @@ include ../Makefile.arch

 PROGS =	q singleq wfenqueue

-all: $(PROGS)
-
 top := ..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all:
+	@echo "### None in advsync/ can be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 q: q.c q.h queuetorture.h ../api.h
 	cc $(GCC_ARGS) -o q -DTEST q.c -lpthread

diff --git a/CodeSamples/count/Makefile b/CodeSamples/count/Makefile
index d3fbb83..eacdb57 100644
--- a/CodeSamples/count/Makefile
+++ b/CodeSamples/count/Makefile
@@ -33,11 +33,18 @@ PROGS =	count_atomic \

 RCU_SRCS = ../defer/rcu_nest32.h ../defer/rcu_nest32.c

-all: $(PROGS)
-
 top := ..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all:
+	@echo "### None in count/ can be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 count_atomic: count_atomic.c ../api.h counttorture.h
 	cc $(GCC_ARGS) $(CFLAGS) -o count_atomic count_atomic.c -lpthread

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index bb3d6a3..b5b63e1 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -19,11 +19,18 @@ include ../../Makefile.arch
 PROGS = existence_test treetorture
 LIB = ../../lib

-all: $(PROGS)
-
 top := ../..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all:
+	@echo "### None in datastruct/Issaquah/ can be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 # NOTE:  For decent scalability on update-side tests as of early 2015,
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index 85dfa5d..d75936f 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -18,11 +18,18 @@ include ../../Makefile.arch

 PROGS =	hash_bkt hash_bkt_hazptr hash_bkt_rcu hash_global hash_resize

-all: $(PROGS)
-
 top := ../..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all:
+	@echo "### None in datastruct/hash/ can be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c -lpthread

diff --git a/CodeSamples/datastruct/log/Makefile b/CodeSamples/datastruct/log/Makefile
index cd2c571..b45a162 100644
--- a/CodeSamples/datastruct/log/Makefile
+++ b/CodeSamples/datastruct/log/Makefile
@@ -19,11 +19,18 @@ include ../../Makefile.arch
 PROGS =	log_glock
 LIB = ../../lib

-all: $(PROGS)
-
 top := ../..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all:
+	@echo "### None in datastruct/log/ can be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 log_glock: log_glock.c ../../api.h logtorture.h log.h
 	cc $(GCC_ARGS) -DTEST_LOG -I $(LIB) -g -o log_glock log_glock.c $(LIB)/random.c -lpthread

diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
index ab6f524..9044b9c 100644
--- a/CodeSamples/datastruct/skiplist/Makefile
+++ b/CodeSamples/datastruct/skiplist/Makefile
@@ -19,11 +19,18 @@ include ../../Makefile.arch
 PROGS =	skiplist skiplist_glock
 LIB = ../../lib

-all: $(PROGS)
-
 top := ../..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all:
+	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
 	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal

diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 5e0f1e7..5a08c1f 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -16,11 +16,12 @@

 include ../Makefile.arch

-PROGS =	bug_rcu_dp \
-	gettimestamp \
+ARCH_INDEPENDENT = bug_rcu_dp \
+	ptxroute
+
+ARCH_DEPENDENT = gettimestamp \
 	gettimestampmp \
 	hazptr \
-	ptxroute \
 	rcu \
 	rcu64 \
 	rcu64_atomicgp \
@@ -44,11 +45,20 @@ PROGS =	bug_rcu_dp \
 	route_seqlock \
 	seqlocktorture \

-all: $(PROGS)
+PROGS = $(ARCH_DEPENDENT) $(ARCH_INDEPENDENT)

 top := ..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all: $(ARCH_INDEPENDENT)
+	@echo "### $(ARCH_DEPENDENT) in defer/ can't be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 # Note that bug_srcu_a is disabled until completed.
 bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
 	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index 81f8bec..8eb45b4 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -31,14 +31,3 @@ else
 api_depend :=
 arch_depend :=
 endif
-
-ifneq ($(top),.)
-$(top)/api.h: $(api_depend) $(api_depend_common)
-	$(MAKE) -C $(top) api.h
-
-$(top)/Makefile.arch: $(arch_depend)
-	$(MAKE) -C $(top) Makefile.arch
-else
-$(top)/api.h: $(api_depend) $(api_depend_common)
-$(top)/Makefile.arch: $(arch_depend)
-endif
diff --git a/CodeSamples/intro/Makefile b/CodeSamples/intro/Makefile
index ba2f257..c7be0cb 100644
--- a/CodeSamples/intro/Makefile
+++ b/CodeSamples/intro/Makefile
@@ -1,10 +1,19 @@
-PROGS = initrace initraceperf lockinc nakedinc perthreadinc threadcreate
-
-all: $(PROGS)
+ARCH_INDEPENDENT = initraceperf lockinc nakedinc perthreadinc threadcreate
+ARCH_DEPENDENT = initrace
+PROGS = $(ARCH_DEPENDENT) $(ARCH_INDEPENDENT)

 top := ..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all: $(ARCH_INDEPENDENT)
+	@echo "### $(ARCH_DEPENDENT) in intro/ can't be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 initrace: initrace.c ../api.h
 	cc -g -Wall -o initrace initrace.c -lpthread

diff --git a/CodeSamples/locking/Makefile b/CodeSamples/locking/Makefile
index 5862448..3663a7d 100644
--- a/CodeSamples/locking/Makefile
+++ b/CodeSamples/locking/Makefile
@@ -1,10 +1,19 @@
-PROGS = locked_list xchglock
-
-all: $(PROGS)
+ARCH_INDEPENDENT = locked_list
+ARCH_DEPENDENT = xchglock
+PROGS = $(ARCH_INDEPENDENT) $(ARCH_DEPENDENT)

 top := ..
 include $(top)/depends.mk

+ifeq ($(strip $(target)),)
+all: $(ARCH_INDEPENDENT)
+	@echo "### $(ARCH_DEPENDENT) in locking/ can't be built on arch: '$(arch)'."
+else
+all: $(PROGS)
+endif
+
+include $(top)/recipes.mk
+
 locked_list: locked_list.c ../api.h
 	cc -g -Wall -o locked_list locked_list.c

diff --git a/CodeSamples/recipes.mk b/CodeSamples/recipes.mk
new file mode 100644
index 0000000..afeaf2f
--- /dev/null
+++ b/CodeSamples/recipes.mk
@@ -0,0 +1,10 @@
+ifneq ($(top),.)
+$(top)/api.h: $(api_depend) $(api_depend_common)
+	$(MAKE) -C $(top) api.h
+
+$(top)/Makefile.arch: $(arch_depend)
+	$(MAKE) -C $(top) Makefile.arch
+else
+$(top)/api.h: $(api_depend) $(api_depend_common)
+$(top)/Makefile.arch: $(arch_depend)
+endif
diff --git a/CodeSamples/toolsoftrade/Makefile b/CodeSamples/toolsoftrade/Makefile
index b6216e8..d23ff21 100644
--- a/CodeSamples/toolsoftrade/Makefile
+++ b/CodeSamples/toolsoftrade/Makefile
@@ -28,6 +28,7 @@ all: $(PROGS)

 top := ..
 include $(top)/depends.mk
+include $(top)/recipes.mk

 forkjoin: forkjoin.c ../api.h
 	cc $(GCC_ARGS) -o forkjoin forkjoin.c
-- 
2.7.4


