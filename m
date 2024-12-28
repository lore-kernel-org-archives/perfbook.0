Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B415CB8
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 07:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735369966; cv=none; b=L4iHuj1to1r7UiEIs6O8G7tYYlwwGIP5wqC8M1bqHeCAjs+aXW/vbZym+xhg1kJj7F/JO9P/dQX59l5mADRwci5HpBCKEjellG2RqZYYu7wChP+hNJ6bJlfaRuvARoKv9WgSzDnIPCSNoZNHZ+8pnUc14A3h01dSsiKlYspji10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735369966; c=relaxed/simple;
	bh=GKG+1TNa8NP6yd78XUkAyt3vQ0r8Ygis6tkno32kosI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=GGn7ritk7bLcBVy60qQmCmpwmPKkENQftr2Kxqi7UMtJOXTrSc1CeAbKMbQbrCWJ/Akd/lJ+MQLjOz2z8GR6+QspIq1e9MLJ3a9SrpR8aNnCnbSuidMkWzSTidDSp9YmwiQj7Eb5flyzZ7PkKPgdQFLMgRuRnIjTCGtkYfe13RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc3V8aF5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc3V8aF5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21628b3fe7dso92930845ad.3
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 23:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735369964; x=1735974764; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYvdypRAE1lQUwzbd2HkKENvgtPSoWvnMDWLg8qN6wI=;
        b=Zc3V8aF5f04RGH4mPETtQsox8KYJEw73dZzU+9kozWNUPSRFPpAC9WcA6PVNUnASDM
         yfRNFmWQH+0XPI1Ei0ABXU9xjfWTiotN/QvqkdkYRc2kGUsMJh886yKLKHrJcRd/BCkZ
         SAMCbLpRxGL+PukVC2AJqxat2Af2U8XsGozZW/p5gWoZvKGRmPxQBcTt0MNL0HYdUHLM
         EI6n6oMADkyibn8JZNF60EoOWYYXKMYG0708aVQFTG9fpLxnzx+pmpYItVtBDfmhoWDy
         /3RO3T/PkoWkB6IRTtnt0/Z87RAxZumNFd+JeHCjK0FZE/ubaDknp3mLRqj+chsug9tz
         GYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735369964; x=1735974764;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lYvdypRAE1lQUwzbd2HkKENvgtPSoWvnMDWLg8qN6wI=;
        b=OAImNsCjIGFgSzZvpLWxjB+HTJkZhmQYzYUN6cI7K9BCYaE1Qz32Sg8CJAa1wLHL0k
         PyWlZ1XTlrgZ83Bl45HbhjGp7yegH3a1ZhrzhrrChb8glJnRdYdQFvSDIw1ATLaLqFDT
         b9h1hO/adLxD7+EpyLRiT0L6igsKqdsxJlhe6WlVBEHOvmBa6/Tlw1NeKfbHtzoHSVvi
         fD9Qn+uJrf76osG8NUtu8LuV2IX2GmQd1iQNhu2tL+1mRCVv2DDsX/z7trz1enCg8q0Y
         0OK+9T1xXHShtgOxzR9w3dQuyX6zIj9drp1pP9Eg08/BT2Ma3bTbmUl6UokeEh+186rI
         gJow==
X-Gm-Message-State: AOJu0YyMLkcIcn8zMQUqBR3cEuKP4ahefWFRBR3tScSdoA6k6F+k/HZl
	Plgz0U9ZajfSaEs6cEMGxbfaq3IMTXCjG9YBJjcTppByXYg/GAiI
X-Gm-Gg: ASbGncvKmEKofUhZpNPJjdhQto6RWMVnAFfp2lbXqOTI+Ok/G0eAe0JISvCalm0Ni+/
	qBpwf4PRwQGzEVRB1tWHcpa/gw2R3G7j+hleWMxBjYQWOPSBwap2PE8zrGcqqlcNLJD3l3rbyfR
	uOsgSLIHBIR/X7rr1DJv5VOzV/M07VHhMYXUuxInyLUs7LvRPNNXgPkSjIsWFRnSGcX6kPbWy0B
	ZWTcxuYSfUGGeZxTh7yPz7kvd5FTDUZdzGxAReEWFXDD4DTiFdfyBqXzYvpxoEoPpmyszNcW+MM
	PpFo6fyWjptslzyciVZ4TUs=
X-Google-Smtp-Source: AGHT+IGiTdT58BdhYVAgBZrSVI7KI02bJyzVAZz0mkCFLGHM/1nYTniguZ0WL8LjM6WfgkiQuWJYfg==
X-Received: by 2002:a17:903:11c3:b0:215:4757:9ef3 with SMTP id d9443c01a7336-219e6e85b1amr405318545ad.9.1735369963922;
        Fri, 27 Dec 2024 23:12:43 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdf0dsm145640095ad.157.2024.12.27.23.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 23:12:43 -0800 (PST)
Message-ID: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
Date: Sat, 28 Dec 2024 16:12:40 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Leonardo Bras <leobras.c@gmail.com>

liburcu 0.15.0 deprecated urcu-signal as a library.
This causes build errors in gitlab-CI [1]:

    /usr/sbin/ld: cannot find -lurcu-signal: No such file or directory
    collect2: error: ld returned 1 exit status

Work around them by adding command lines w/o "-lurcu-signal" as
fallbacks in relevant Makefile recipes.

Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
[akiyks: rewrite changelog, restore compatibility with liburcu <0.15.0]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

Admittedly, this is one of the least elegant workaround for ArchLinux
and soon-to-be upgraded other rolling distros, but still looks straight
forward to me.

Can you live with this?

This is tested against Ubuntu 20.04 LTS (liburcu 0.11.1),
Ubuntu 24.04 LTS (liburcu 0.14.0), Fedora 41 (liburcu 0.14.1),
and ArchLinux (liburcu 0.15.0).

        Thanks, Akira
--
 CodeSamples/datastruct/Issaquah/Makefile  |  6 +++--
 CodeSamples/datastruct/existence/Makefile | 30 +++++++++++++++--------
 CodeSamples/datastruct/hash/Makefile      |  9 ++++---
 CodeSamples/datastruct/skiplist/Makefile  |  6 +++--
 CodeSamples/defer/Makefile                |  9 ++++---
 5 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index c3b724d7..75fd840b 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -45,10 +45,12 @@ GCC_ARGS += -fcommon
 #	 Verify by using the nm command and searching output for malloc.
 
 existence_test: existence.c existence_test.c
-	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu
 
 treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
-	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/datastruct/existence/Makefile
index 19891c0f..568e7c2d 100644
--- a/CodeSamples/datastruct/existence/Makefile
+++ b/CodeSamples/datastruct/existence/Makefile
@@ -44,39 +44,49 @@ all: $(PROGS)
 #	So it is quite a bit easier to just use the default locations.  ;-)
 
 existence_test: existence.h existence_test.c procon.h
-	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
 
 existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3hash_test.c procon.h
-	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu
 
 existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3hash_uperf.c procon.h
 	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
-	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
 
 existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h existence_3skiplist_test.c procon.h
-	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
 	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
 
 existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existence_3skiplist_uperf.c procon.h
 	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
-	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
 
 kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
-	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu
 
 kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleidoscope_3hash_test.c procon.h
-	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu
 
 kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_3skiplist_test.c procon.h
-	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
 	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
 
 kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_skiphash_test.c procon.h
-	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
 	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
 
 procon_test: procon.h procon_test.c
-	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
+	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal || \
+	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
 	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
 
 clean:
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index a56255a2..a558dfee 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -44,7 +44,8 @@ hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
 
 hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu
 
 hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr.c $(LIB)/random.c -lpthread
@@ -53,10 +54,12 @@ hash_global: hash_global.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -lpthread
 
 hash_resize: hash_resize.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu
 
 hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu
 
 hash_unsync: hash_unsync.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c -lpthread
diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
index 3a555691..8cf9d47a 100644
--- a/CodeSamples/datastruct/skiplist/Makefile
+++ b/CodeSamples/datastruct/skiplist/Makefile
@@ -33,10 +33,12 @@ endif
 include $(top)/recipes.mk
 
 skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
-	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu
 
 skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.h
-	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 3cf3e5a5..b4af17db 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -80,7 +80,8 @@ hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
 	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
 
 ptxroute: ptxroute.c ../api.h
-	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
 
 rcu: rcu.c rcu.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
@@ -131,7 +132,8 @@ route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/r
 	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
 
 route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
-	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu
 
 route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c -lpthread  -lurcu-qsbr
@@ -149,7 +151,8 @@ seqlocktorture: seqlocktorture.c seqlock.h ../api.h
 	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
 
 singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
-	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal || \
+	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu
 
 clean:
 	rm -f $(PROGS)

base-commit: 4c0afec5a7081227adc768fb8d3fb35aa1981d55
-- 
2.34.1

