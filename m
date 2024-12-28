Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB437A936
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735349425; cv=none; b=U7EQE+gDqd/PJA35vcLFoEaDMY6hhl/IYi5Cv+5pC+fxbHukwFgtDtOpf7AUsgaQYX30ZY9v4DlXKUkqPEq5z4+OvVli1lFhQWI2cMHL3D2CbfPg77UNw0DRUhm57aDuIlCcjVtcBiOoj6dgMOkuuvF3GP0TtMQWiSbsios/YNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735349425; c=relaxed/simple;
	bh=Fm6t7LKQ4XUAg5oeRaEIQPspFpzcuGJ0UHxpKEszlJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOo7BQZDM0MpL/fsUXqSEyr7uNvHxp0xHwMHjmZuC6mXfbYRlHNi0L6KfPhZjDX6gecUdGsIQJQy1J3HXoaV0bS8kzNfIOfWGzddDAmmRVc1A+d21VlHc9FjLBuDCiDsq0DeL6wyBrQBlYJIH5Y55aMZ3+kymBhg4P9IIUEG89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YKW2ahFW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YKW2ahFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735349421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TEQCR7iaCcu5bKqlzgjyLgW17Lai7Vf3xaw3T50hKEg=;
	b=YKW2ahFWsVFBNdcLNzx4CGVKsy8LqHFMtJXSTRI5V1eWyFlZftuvcpa37pG2MsIe7SJYO+
	0qVrBAn21TftVOrlBR6o6lr2JCQvEde2KtFiPiw4TDm0d9ldHZBviEr+Js4c1KoRy2MzhW
	Kq6G2e9NO339IUTFtZhDpXoEW+8qFZY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-9QXhUOQxOnakca5fObVPpA-1; Fri, 27 Dec 2024 20:30:20 -0500
X-MC-Unique: 9QXhUOQxOnakca5fObVPpA-1
X-Mimecast-MFC-AGG-ID: 9QXhUOQxOnakca5fObVPpA
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216430a88b0so101448525ad.0
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 17:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735349419; x=1735954219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEQCR7iaCcu5bKqlzgjyLgW17Lai7Vf3xaw3T50hKEg=;
        b=MH/6iQXeC5Ysno0zzJr4D1soIF2jO5HuT3yg2Mm2CBfwlw3U+yM6J1Q54H+lljOjhq
         c1aYlHylujKX6GQiMNVTRBMo3UOTToFruX8JmEK5PQAyyJA/flT65Fztuv2zzI2JEes6
         3hjLzDex9lirHUH+qe02AcAETKYjc/Z38WgEyYJsu2hB1nWHHTIRttQGm+mRRKRmoQha
         dr8F9NqjBN3SNj8ZiGIQMfGFk6s/e11CC0Sfcdi39GgOIOz0CG1nCXDNZgs+ApifzZl2
         NQV37/b5nqu5Eeq1RMWxvKP0j88aDQg0TP8IGpNuELL8qAlRSacs9rkzSwzAHpNdLpxL
         Kj7g==
X-Gm-Message-State: AOJu0Yz1u1eJXjRYpWgmsF/AgWkUQIhPV+HwFA84jOh0W2gG3cMmMglz
	5m6YkRCPU0jRKPVIx5VvAyDwbyaJ2WqIAF5tVjN3bxDH+wAe2O+/huoqByVA8V8niILtAa4gSqP
	vfj24PzivAt1hWkjfuxEIreRDUctGzkotOAgd+l53yJLHHB2+WdIXRtzIclHw83ahUKyMrm0GRh
	Z9ECwMwOWGzU2/ImhboHSgOSg+Nniv00uOKFDu/JI6Vwo=
X-Gm-Gg: ASbGncs91QpMxRuaTazAYmOuRAH8KIXtUJeDXn9LWb7O+5g/8ZuWxuBpUUE6QPrs+MD
	b8HF3i4AKCBvgQkRxNJZaz3KO+lzzWkDV1HeHRYa95ojuTKugKjuCcEqP3qIsRh2zB42RY6YC9y
	nKe4Q7Qa7fBnQ9Oepmb1XTNHdkGYA8q4vUv2SfTr1BcZEeGrr+PnL3FD6xAentB9GM+uEfm7JLw
	bTb38LaaexWl1Edq6Po4xkTyg5PA8JUHo3ZLWosPq7wxYydev+zt3mMJpupkAeNXJJL+Ss=
X-Received: by 2002:a17:902:d48c:b0:216:5b8b:232c with SMTP id d9443c01a7336-219e6f284efmr381043635ad.54.1735349418539;
        Fri, 27 Dec 2024 17:30:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJIKcbstlfkiY3DoCX4Oh5HD6K17qoD5t5sHnfBHAI7LRDmqitjWU1e02Mh/d6yHu3rLq68Q==
X-Received: by 2002:a17:902:d48c:b0:216:5b8b:232c with SMTP id d9443c01a7336-219e6f284efmr381043315ad.54.1735349418009;
        Fri, 27 Dec 2024 17:30:18 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0238bsm141202005ad.251.2024.12.27.17.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 17:30:17 -0800 (PST)
From: Leonardo Bras <lsoaresp@redhat.com>
X-Google-Original-From: Leonardo Bras <leobras.c@gmail.com>
To: perfbook@vger.kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>,
	paulmck@kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2] CodeSamples: Remove support for liburcu-signal
Date: Fri, 27 Dec 2024 22:29:53 -0300
Message-ID: <20241228012954.13874-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
deprecating[2] support for liburcu-signal:

%%%
   * Deprecation of liburcu-signal

Users can migrate to liburcu-memb with a kernel implementing the
membarrier(2) system call to have similar read-side performance without
requiring use of a reserved signal, and with improved grace period
performance.
%%%

Also, from liburcu.org:

%%%
Usage of liburcu
1. #include <urcu.h>
2. Link the application with -lurcu

This is the preferred version of the library, in terms of grace-period
detection speed, read-side speed and flexibility. Dynamically detects
kernel support for sys_membarrier(). Falls back on urcu-mb scheme if
support is not present, which has slower read-side.
%%%

Which tl;dr means for any system running a current version of liburcu,
liburcu-signal should not be needed to build/run the CodeSamples.

Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it on
linking stage.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

[1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799
[2] https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.html

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

