Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CBE13F42F
	for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735340115; cv=none; b=dcPNCKbZ/XJgE6lgi7CYok6m7rolik9j/HrfDeskuteIWW9L4/pHEFKYcWHJgplwwZVaSnyyAzAT4EHr/xjBJaduYpOrqj/i8AxD/c4pWJqVRIiFa8YFnm7/PfNJ+3x8zs/9g8T5p6KgIRKNLuNVw0pwc7/MqHtjSjTF3k1nghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735340115; c=relaxed/simple;
	bh=7CH+NEePP2kixmgS9b624BB4tXhsAwW9bWy1+J8GLYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ib0kyOViYfpoLU3VnUaVzAm4ulVs0C1AurqAQvqmDDaHFigOzNuUJ8ZMXo8U9SoP4CxGFJE2YYOtIXNNoOXuInXt76d+bIEjdZgzqwdo1e79CUaYCSw9yK5HXDadwRXkk5UsVUudt5WWzVi+Nss71bHOI7X7RZ1S9pdlDLPj0B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=edILexw3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="edILexw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735340112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e4wvoKBUISF7rBgH1FCqpuLaajpwm8n+GNs3hP3ZfLs=;
	b=edILexw3QiFzHV6JPsdpAyMYCislg3PqscMVKL4xXqxZtZ8kil0hpQGhPwklmQRj9Iv14b
	s9j25dFMvHkweBaEak4eLTbJ37UrvhPTv8bwMXjuXgN4SXHEfN3REglvHuVYEDIoh3x05z
	IqnoXP3W9a/DIgJjDkA6I7JF5ja3zhM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-qt8GVTrENP-X-_yhKrrkQA-1; Fri, 27 Dec 2024 17:55:10 -0500
X-MC-Unique: qt8GVTrENP-X-_yhKrrkQA-1
X-Mimecast-MFC-AGG-ID: qt8GVTrENP-X-_yhKrrkQA
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21650d4612eso146421745ad.2
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 14:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735340109; x=1735944909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4wvoKBUISF7rBgH1FCqpuLaajpwm8n+GNs3hP3ZfLs=;
        b=bZBFRaTCV3ARmc68DFn+CO48E1C8fZGpefVvopFDJSHIYezBBqfyEDS7/q9m4rNAjN
         pBO+VYzJybZ0LvpN5w2EJiGejINof8rnw3p5qoJJQb0wJomtJynQc4bmKhhu/sx7FLbG
         HEpi/INlajsHGqc3RzP/T1wc0B7kP/WaEppsu40W53QpbKke6E+t/BuLsIYRJjs7bUk7
         AolBGYOXHBr9GUnkS54T/pCMSt2ECNSDpCziEuAjlVlYOy4LS0NMjo+qAXuUKzFVKNdA
         pFYKrp6PcdvVkynwSw+wrCKetVpweotSJqy2fZOfStemuUGOxzLla3RHlsLZZ9JQao1u
         0P3A==
X-Gm-Message-State: AOJu0YxwwblGsLNeYfxO4CpnD+5xM7uOYjaclTHKEv+nyvUh4Cx4VZYi
	23XK/gC5sfy4Dup3jOEkFPz8DiifwVe4Qv3mVkrT2DSX/cN0WWgSAPV+u8pufvomzTsj/21P6QN
	/oufUcHcK2SeiMDkQ/8d3uEKGPq6H69EgSyeODgraPkLNkkOScmbWU2DujX2IpX11Fg+lxSv2Vw
	QdL5Q0Ayr90LYKqVF9hjkfNiQllR0YKled9r7YhU4awgM=
X-Gm-Gg: ASbGncuTHLeUS+1Rt3OMkJRjBYxZv0GGu79QLKdImAGCZlG8Oyq1N//e8B+wv3Z1zBj
	SRMVkca2G02jxwz28TJ9E2tmk6dYIbq46F4Qt+RbEp/d3nE4/Mu0WaHn/eW5WUlLpi41IydeOd7
	BdBS/RjWuZs+iiiMj953jwb9PwKv2GK0Bg3KW5OYVCe/uChKTYkCUEVWiCcfBhem885bA2WjhQU
	SrKg4vnkoXmoxfVBjBzKrWN116P7jYcX3G/hu7wBgEVtg9V1lquH5loKvhhSxNqV8OU0LI=
X-Received: by 2002:a17:903:120d:b0:216:3bd6:fc24 with SMTP id d9443c01a7336-219e6ea1973mr404322735ad.21.1735340109319;
        Fri, 27 Dec 2024 14:55:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX3BSVOCGvBvqGOUsYMUew5YaTSOhwdrX/oADBzgv8RBcb7uDIvRPnFVXPyKdQ5o7wpiNNsA==
X-Received: by 2002:a17:903:120d:b0:216:3bd6:fc24 with SMTP id d9443c01a7336-219e6ea1973mr404322465ad.21.1735340108788;
        Fri, 27 Dec 2024 14:55:08 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d4474sm140863325ad.142.2024.12.27.14.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 14:55:08 -0800 (PST)
From: Leonardo Bras <lsoaresp@redhat.com>
X-Google-Original-From: Leonardo Bras <leobras.c@gmail.com>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH] CodeSamples: Remove support for liburcu-signal
Date: Fri, 27 Dec 2024 19:52:34 -0300
Message-ID: <20241227225435.8119-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gitlab-CI is failing[1] on building CodeSamples due to ArchLinux
deprecating support for liburcu-signal.

Currently liburcu-signal is not needed anymore, since upstream liburcu
already include all needed symbols/functions to build CodeSamples.

Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it on
linking stage.

[1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 CodeSamples/datastruct/Issaquah/Makefile  |  4 +--
 CodeSamples/datastruct/existence/Makefile | 32 +++++++++++------------
 CodeSamples/datastruct/hash/Makefile      |  6 ++---
 CodeSamples/datastruct/skiplist/Makefile  |  4 +--
 CodeSamples/defer/Makefile                |  6 ++---
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index c3b724d7..187d10a7 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -38,17 +38,17 @@ GCC_ARGS += -fcommon
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
 #	 need the following additional arguments to cc:
 #		-I/home/paulmck/jemalloc/include
 #		-L/home/paulmck/jemalloc/lib
 #		-Wl,--rpath,/home/paulmck/jemalloc/lib
 #		-DUSE_JEMALLOC
 #	 Verify by using the nm command and searching output for malloc.
 
 existence_test: existence.c existence_test.c
-	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu
 
 treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
-	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/datastruct/existence/Makefile
index 19891c0f..027d54fb 100644
--- a/CodeSamples/datastruct/existence/Makefile
+++ b/CodeSamples/datastruct/existence/Makefile
@@ -37,47 +37,47 @@ all: $(PROGS)
 #	 need the following additional arguments to cc:
 #		-I/home/paulmck/jemalloc/include
 #		-L/home/paulmck/jemalloc/lib
 #		-Wl,--rpath,/home/paulmck/jemalloc/lib
 #		-DUSE_JEMALLOC
 #	 Verify by using the nm command and searching output for malloc.
 #
 #	So it is quite a bit easier to just use the default locations.  ;-)
 
 existence_test: existence.h existence_test.c procon.h
-	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
 
 existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3hash_test.c procon.h
-	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu
 
 existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3hash_uperf.c procon.h
-	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
-	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
+	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
+	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
 
 existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h existence_3skiplist_test.c procon.h
-	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
+	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
 
 existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existence_3skiplist_uperf.c procon.h
-	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
-	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
+	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
 
 kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
-	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu
 
 kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleidoscope_3hash_test.c procon.h
-	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu
 
 kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_3skiplist_test.c procon.h
-	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
+	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
 
 kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_skiphash_test.c procon.h
-	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
+	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
 
 procon_test: procon.h procon_test.c
-	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
+	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
+	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index a56255a2..7d47485a 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -37,29 +37,29 @@ GCC_ARGS += -fcommon
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpthread
 
 hash_bkt_ref: hash_bkt_ref.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_ref hash_bkt_ref.c $(LIB)/random.c -lpthread
 
 hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
 
 hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu
 
 hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr.c $(LIB)/random.c -lpthread
 
 hash_global: hash_global.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -lpthread
 
 hash_resize: hash_resize.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu
 
 hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu
 
 hash_unsync: hash_unsync.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c -lpthread
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
index 3a555691..931c8c1c 100644
--- a/CodeSamples/datastruct/skiplist/Makefile
+++ b/CodeSamples/datastruct/skiplist/Makefile
@@ -26,17 +26,17 @@ include $(top)/depends.mk
 ifeq ($(strip $(target)),)
 all:
 	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch)'."
 else
 all: $(PROGS)
 endif
 
 include $(top)/recipes.mk
 
 skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
-	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu
 
 skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.h
-	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 3cf3e5a5..8454a9ed 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -73,21 +73,21 @@ bug_rcu_dp: bug_rcu_dp.c ../api.h
 gettimestamp: gettimestamp.c ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o gettimestamp -DTEST gettimestamp.c -lpthread
 
 gettimestampmp: gettimestampmp.c ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o gettimestampmp -DTEST gettimestampmp.c -lpthread
 
 hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
 	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
 
 ptxroute: ptxroute.c ../api.h
-	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
 
 rcu: rcu.c rcu.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
 
 rcu64: rcu64.c rcu64.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu64 -DTEST rcu64.c -lpthread
 
 rcu64_atomicgp: rcu64_atomicgp.c rcu64_atomicgp.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu64_atomicgp -DTEST rcu64_atomicgp.c -lpthread
 
@@ -124,32 +124,32 @@ rcu_rcpls: rcu_rcpls.c rcu_rcpls.h ../api.h rcutorture.h
 rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu_sig -DTEST rcu_sig.c -lpthread
 
 rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
 
 route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
 
 route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
-	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu
 
 route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c -lpthread  -lurcu-qsbr
 
 route_refcnt: route_refcnt.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_refcnt route_refcnt.c ../lib/random.c -lpthread
 
 route_seq: route_seq.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_seq route_seq.c ../lib/random.c -lpthread
 
 route_seqlock: route_seqlock.c ../api.h seqlock.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_seqlock route_seqlock.c ../lib/random.c -lpthread
 
 seqlocktorture: seqlocktorture.c seqlock.h ../api.h
 	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
 
 singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
-	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu
 
 clean:
 	rm -f $(PROGS)
-- 
2.47.1

