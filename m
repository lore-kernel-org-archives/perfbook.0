Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3LjGMNFgC+JImzThK0Ot7RSeWXUWzxIZN6zdHO0n6W0=;
 b=BJsNtAnCEKs1UB3vcZPo8jT1vSjmP9u5qA8USmuR9HW+D1ab7H4qMggqG8yBPiEIh1
 1fjQF1xKySHPX8Sv01rzPXMDrk76YGcRdFAe2Nvb3XFAA56FcSnncEg71VcczHKpBLSF
 6hu8/s5+yUFcSd7BnyYwxNCaM2dfyWXZ1gF7fWrocUf8hjmMx8RocLKoWVSfrP6NxCwL
 dbHDsgqoNnjX4R3jvOjTRzgJDGWd96feknSPMefszBWckhrmrkU/z5UfYD1FLkuTJfRF
 fDvCviMOVMqcOvbi+1hWTlTVT+vXeIpRCHbfUrTm9SKrxmbAJwQHlWrM3FT8adUWNZEq
 MaXQ==
Subject: [RFC PATCH 1/4] CodeSamples: Add rule to generate Makefile.arch and
 api.h
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <14adfa18-9518-e56a-ae40-81fbd06c0fb7@gmail.com>
Date: Tue, 30 May 2017 07:14:57 +0900
MIME-Version: 1.0
In-Reply-To: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b4845ac3b17aaade7258528fa114def5f6554242 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 May 2017 09:29:44 +0900
Subject: [RFC PATCH 1/4] CodeSamples: Add rule to generate Makefile.arch and api.h

To generate suitable Makefile.arch and api.h for host arch,
describe the dependency in depends.mk and include it in Makefiles.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile                     | 18 +++++++++++++
 CodeSamples/SMPdesign/Makefile           |  3 +++
 CodeSamples/advsync/Makefile             |  3 +++
 CodeSamples/count/Makefile               |  3 +++
 CodeSamples/datastruct/Issaquah/Makefile |  3 +++
 CodeSamples/datastruct/hash/Makefile     |  3 +++
 CodeSamples/datastruct/log/Makefile      |  3 +++
 CodeSamples/datastruct/skiplist/Makefile |  3 +++
 CodeSamples/defer/Makefile               |  3 +++
 CodeSamples/depends.mk                   | 43 ++++++++++++++++++++++++++++++++
 CodeSamples/intro/Makefile               |  3 +++
 CodeSamples/locking/Makefile             |  3 +++
 CodeSamples/toolsoftrade/Makefile        |  3 +++
 13 files changed, 94 insertions(+)
 create mode 100644 CodeSamples/depends.mk

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index f5461e9..4168220 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -1,3 +1,7 @@
+.PHONY: all clean pthreads pthreads-x86 pthreads-ppc64 pthreads-arm
+
+top := .
+
 all:
 	(cd SMPdesign; make)
 	(cd advsync; make)
@@ -6,6 +10,17 @@ all:
 	(cd intro; make)
 	(cd toolsoftrade; make)

+include depends.mk
+
+api.h Makefile.arch:
+ifeq ($(strip $(target)),)
+	make pthreads
+	$(warning "Could not figure out which target to use (arch:$(arch)).\
+		   Used 'make pthreads' in CodeSamples/Makefile.")
+else
+	make pthreads-$(target)
+endif
+
 pthreads:
 	echo "#ifndef __PERFBOOK_API_H__" > api.h
 	echo "#define __PERFBOOK_API_H__" >> api.h
@@ -125,3 +140,6 @@ pthreads-arm:
 	echo "#endif /* #ifndef __PERFBOOK_API_H__ */" >> api.h
 	echo "# MECHANICALLY GENERATED, DO NOT EDIT!!!" > Makefile.arch
 	cat arch-arm/Makefile.arch >> Makefile.arch
+
+clean:
+	rm -f Makefile.arch api.h
diff --git a/CodeSamples/SMPdesign/Makefile b/CodeSamples/SMPdesign/Makefile
index ae0cdd7..d03575c 100644
--- a/CodeSamples/SMPdesign/Makefile
+++ b/CodeSamples/SMPdesign/Makefile
@@ -25,6 +25,9 @@ include ../Makefile.arch
 # http://www.ibm.com/developerworks/wikis/display/hpccentral/Tuning+options+to+consider+with+gcc#Tuningoptionstoconsiderwithgcc-mcpuandmtune
 # GCC_ARGS=-g -O3 -m64 -mcpu=power5 -mtune=power5

+top := ..
+include $(top)/depends.mk
+
 smpalloc: smpalloc.c ../api.h
 	cc $(GCC_ARGS) -g -o smpalloc -DTEST smpalloc.c -lpthread

diff --git a/CodeSamples/advsync/Makefile b/CodeSamples/advsync/Makefile
index b02ca37..bb4c8fc 100644
--- a/CodeSamples/advsync/Makefile
+++ b/CodeSamples/advsync/Makefile
@@ -20,6 +20,9 @@ PROGS =	q singleq wfenqueue

 all: $(PROGS)

+top := ..
+include $(top)/depends.mk
+
 q: q.c q.h queuetorture.h ../api.h
 	cc $(GCC_ARGS) -o q -DTEST q.c -lpthread

diff --git a/CodeSamples/count/Makefile b/CodeSamples/count/Makefile
index 05fcf04..d3fbb83 100644
--- a/CodeSamples/count/Makefile
+++ b/CodeSamples/count/Makefile
@@ -35,6 +35,9 @@ RCU_SRCS = ../defer/rcu_nest32.h ../defer/rcu_nest32.c

 all: $(PROGS)

+top := ..
+include $(top)/depends.mk
+
 count_atomic: count_atomic.c ../api.h counttorture.h
 	cc $(GCC_ARGS) $(CFLAGS) -o count_atomic count_atomic.c -lpthread

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index 013738c..bb3d6a3 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -21,6 +21,9 @@ LIB = ../../lib

 all: $(PROGS)

+top := ../..
+include $(top)/depends.mk
+
 # NOTE:  For decent scalability on update-side tests as of early 2015,
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index a87bdbb..85dfa5d 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -20,6 +20,9 @@ PROGS =	hash_bkt hash_bkt_hazptr hash_bkt_rcu hash_global hash_resize

 all: $(PROGS)

+top := ../..
+include $(top)/depends.mk
+
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c -lpthread

diff --git a/CodeSamples/datastruct/log/Makefile b/CodeSamples/datastruct/log/Makefile
index f225c92..cd2c571 100644
--- a/CodeSamples/datastruct/log/Makefile
+++ b/CodeSamples/datastruct/log/Makefile
@@ -21,6 +21,9 @@ LIB = ../../lib

 all: $(PROGS)

+top := ../..
+include $(top)/depends.mk
+
 log_glock: log_glock.c ../../api.h logtorture.h log.h
 	cc $(GCC_ARGS) -DTEST_LOG -I $(LIB) -g -o log_glock log_glock.c $(LIB)/random.c -lpthread

diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
index 7289979..ab6f524 100644
--- a/CodeSamples/datastruct/skiplist/Makefile
+++ b/CodeSamples/datastruct/skiplist/Makefile
@@ -21,6 +21,9 @@ LIB = ../../lib

 all: $(PROGS)

+top := ../..
+include $(top)/depends.mk
+
 skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
 	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal

diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 35db164..5e0f1e7 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -46,6 +46,9 @@ PROGS =	bug_rcu_dp \

 all: $(PROGS)

+top := ..
+include $(top)/depends.mk
+
 # Note that bug_srcu_a is disabled until completed.
 bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
 	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
new file mode 100644
index 0000000..409eeee
--- /dev/null
+++ b/CodeSamples/depends.mk
@@ -0,0 +1,43 @@
+ifeq ($(strip $(arch)),)
+arch := $(shell uname -m)
+endif
+
+ifeq ($(arch),i686)
+target := x86
+else ifeq ($(arch),x86_64)
+target := x86
+else ifeq ($(arch),ppc64)
+target := ppc64
+else ifneq (,$(findstring arm,$(arch)))
+target := arm
+else
+target :=
+endif
+
+api_depend_common := $(top)/linux/common.h \
+	$(top)/api-pthreads/api-pthreads.h \
+	$(top)/linux/list.h
+ifeq ($(target),x86)
+api_depend := $(top)/arch-x86/arch-x86.h
+arch_depend := $(top)/arch-x86/Makefile.arch
+else ifeq ($(target),ppc64)
+api_depend := $(top)/arch-ppc64/arch-ppc64.h
+arch_depend := $(top)/arch-ppc64/Makefile.arch
+else ifeq ($(target),arm)
+api_depend := $(top)/arch-arm/arch-arm.h
+arch_depend := $(top)/arch-arm/Makefile.arch
+else
+api_depend :=
+arch_depend :=
+endif
+
+ifneq ($(top),.)
+$(top)/api.h: $(api_depend) $(api_depend_common)
+	make -C $(top) api.h
+
+$(top)/Makefile.arch: $(arch_depend)
+	make -C $(top) Makefile.arch
+else
+$(top)/api.h: $(api_depend) $(api_depend_common)
+$(top)/Makefile.arch: $(arch_depend)
+endif
diff --git a/CodeSamples/intro/Makefile b/CodeSamples/intro/Makefile
index e323834..ba2f257 100644
--- a/CodeSamples/intro/Makefile
+++ b/CodeSamples/intro/Makefile
@@ -2,6 +2,9 @@ PROGS = initrace initraceperf lockinc nakedinc perthreadinc threadcreate

 all: $(PROGS)

+top := ..
+include $(top)/depends.mk
+
 initrace: initrace.c ../api.h
 	cc -g -Wall -o initrace initrace.c -lpthread

diff --git a/CodeSamples/locking/Makefile b/CodeSamples/locking/Makefile
index 15cf8f1..5862448 100644
--- a/CodeSamples/locking/Makefile
+++ b/CodeSamples/locking/Makefile
@@ -2,6 +2,9 @@ PROGS = locked_list xchglock

 all: $(PROGS)

+top := ..
+include $(top)/depends.mk
+
 locked_list: locked_list.c ../api.h
 	cc -g -Wall -o locked_list locked_list.c

diff --git a/CodeSamples/toolsoftrade/Makefile b/CodeSamples/toolsoftrade/Makefile
index 4b7f219..b6216e8 100644
--- a/CodeSamples/toolsoftrade/Makefile
+++ b/CodeSamples/toolsoftrade/Makefile
@@ -26,6 +26,9 @@ PROGS =	forkjoin \

 all: $(PROGS)

+top := ..
+include $(top)/depends.mk
+
 forkjoin: forkjoin.c ../api.h
 	cc $(GCC_ARGS) -o forkjoin forkjoin.c

-- 
2.7.4


