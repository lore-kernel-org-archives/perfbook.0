Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1952594A6
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 02:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735439399; cv=none; b=WZMMDe8Mx/HkKNE8JoQrlzeLiY5GQNItZ/PpjumoJHcYrtAimfDUWX0vL8bb07OohIjmWxfJHPja9K2qNhA/nCh2A7fV3FNUc2L3P9ThXrzcAWXfX/QHtfpGmHmOJvJcDEi4OCt7emp6rRPty8aesNzsSyZr3xJQqMyw/WyWsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735439399; c=relaxed/simple;
	bh=IGrJNP9K92hcTxsSj8U29G/QHGCWHfT8Vyn3McyUXTk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=sJtoS5XNadyAVapUhyex09lWsA46ibECB8WZckl1Sfz8cY4EM+YpSymMk4e+qbNz6zbOuH0bUuZ6HQJ+wtooogxgPlyNL9WGxFijlt0cDurDo4+IS6Pwdmct2mYBjF+SntVwDpzFJyTI018SqiM/hnKrFyxfhJH666KG4dQxJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBYXJBYg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBYXJBYg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso149821495ad.2
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735439396; x=1736044196; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GgxkNkK0aUgtvYFP+hGa4gtGDDW7HCsd7lps53J41+E=;
        b=KBYXJBYgxCBh+SDkhh+FyMKKKH606lviyBhW2OaRGoqzq1XGiWbBl2NWa6rRK+/WKm
         QeOCP+8rtoUTVc+YRAtfwUU/R1hHo0zMRxSAurc5x64vmaBHJoqzG71C2NIdp2tT9Tnh
         /7f+ptG6kaSk62OkHwZIZZ2CoJseakVoWTmT5z8piig7dUM/gj7yuoyjKfMomh8CAsZL
         paZhxB3uIFvA4VnuEAhgpKhK2vQWmZczbiQwDDlzsw+DKMI8+91uzX2qoD3SpOu2VCBv
         VgponGNtvLFaNeTlrXBNI6RxIb9gtmeOvfUTKupyhM427uwwkxbLZHMDVKMuAgTyoKq3
         yz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735439396; x=1736044196;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgxkNkK0aUgtvYFP+hGa4gtGDDW7HCsd7lps53J41+E=;
        b=XbgL7wNvSHrYlKgCPb6nzimF2/bwGN6uLUV801Nww34SE9SuwwXN0IFa+CNMqMFIrr
         KnYbTTQ6Br4I9k9OdTE26h5Q7+NG/QS08NZ7VycHGOh7FFfQZH46HEUFiyPB8qJZ6gyf
         Pq9SDiA7Y5zhAVmK07MDcFG1XVGqcRQ/3hM3gKpH9/J26x7uqwByBETKyy4lnm1oY0OY
         TIprRP5XgbQoogR7A50GmT4STDI6f/3mwaA/8vq3Sa1SpNeok5PSdqekYFNsq6UbDMtr
         H6KyXXEuLYu9NyhfXLXN4/hR9HYlbi22pH0T05/+Nn3uCFf7rDwcso/pfDtVFbIyQWQB
         pdLg==
X-Gm-Message-State: AOJu0YxUYqae+WJxuMGQjoWa6ROErtJ2kylnmDCkvQsIGd5ang1xknsI
	4rTjlP5N68eoIBbpa7H0Mup4QUWI7PyPDWbG4arQaXoiWk6MPR2aCpW4JA==
X-Gm-Gg: ASbGncsmKvxUDEhQP2/oAHQSjabRFGR+9nJJGH4VIu7JcvEiah8zaOfUg7EZs9wlbgc
	GReR93zkp2slaQS40J/a1XCfm4PRNyvnwiMK0jeWPx2H/xxrpP0y/HCMKu7FKmhNXQpCT17HgCD
	aSHe4jSeKv+H9vKJMB2k9nb2dJB2sbHJpPtPO0MGhjoM/ai4DvqStOwywU0RjItAwbtibhOLeVO
	llTblcNbTi+EnPIliWRo3wj69Sl0HEdkbNOg9238FTmSMsW2nIiLn8x6rVS2wlAH94kw5RtLf1v
	tbRhS2hOrPqIOoKEmkNouIPL0PI=
X-Google-Smtp-Source: AGHT+IHX1DuDEEU6hmvzU3cshFnV55ucG984eGZRFTiE4UlT2KLT1tHBGRXOezD1ODHfd12PTQIf0g==
X-Received: by 2002:a17:903:24e:b0:216:1cfa:2bda with SMTP id d9443c01a7336-219e6f25fbamr459352245ad.43.1735439396237;
        Sat, 28 Dec 2024 18:29:56 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972251sm156667495ad.96.2024.12.28.18.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 18:29:55 -0800 (PST)
Message-ID: <50dd7b4054a31ea2fe7f8cf61cb285162bea8107.camel@gmail.com>
Subject: [PATCH v4] CodeSamples: Fix liburcu-signal support deprecation
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: perfbook@vger.kernel.org
Cc: leobras.c@gmail.com, Akira Yokosawa <akiyks@gmail.com>,
 paulmck@kernel.org
Date: Sat, 28 Dec 2024 23:29:52 -0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
deprecating[2] support for liburcu-signal:

%%%
   * Deprecation of liburcu-signal

Users can migrate to liburcu-memb with a kernel implementing the
membarrier(2) system call to have similar read-side performance without
requiring use of a reserved signal, and with improved grace period
performance.
%%%

So, in order to avoid breaking builds with liburcu >=3D0.15 while keeping
support for older systems without sys_membarrier(), check for the existance
of liburcu-signal before adding it to the build command.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 CodeSamples/datastruct/Issaquah/Makefile  |  5 ++--
 CodeSamples/datastruct/existence/Makefile | 34 ++++++++++++-----------
 CodeSamples/datastruct/hash/Makefile      |  7 +++--
 CodeSamples/datastruct/skiplist/Makefile  |  5 ++--
 CodeSamples/defer/Makefile                |  7 +++--
 5 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastr=
uct/Issaquah/Makefile
index c3b724d7..6a51ff90 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -26,29 +26,30 @@ include $(top)/depends.mk
 ifeq ($(strip $(target)),)
 all:
 	@echo "### None in datastruct/Issaquah/ can be built on arch: '$(arch)'."
 else
 all: $(PROGS)
 endif
=20
 include $(top)/recipes.mk
=20
 GCC_ARGS +=3D -fcommon
+LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
=20
 # NOTE:  For decent scalability on update-side tests as of early 2015,
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
 #	 need the following additional arguments to cc:
 #		-I/home/paulmck/jemalloc/include
 #		-L/home/paulmck/jemalloc/lib
 #		-Wl,--rpath,/home/paulmck/jemalloc/lib
 #		-DUSE_JEMALLOC
 #	 Verify by using the nm command and searching output for malloc.
=20
 existence_test: existence.c existence_test.c
-	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -=
lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -=
lurcu $(LURCU_SIG)
=20
 treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h=
 treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
-	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/ra=
ndom.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/ra=
ndom.c -lpthread -lurcu $(LURCU_SIG)
=20
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/datast=
ruct/existence/Makefile
index 19891c0f..ac1fb198 100644
--- a/CodeSamples/datastruct/existence/Makefile
+++ b/CodeSamples/datastruct/existence/Makefile
@@ -22,62 +22,64 @@ PROGS =3D existence_test \
 	existence_3hash_uperf \
 	existence_3skiplist_test \
 	existence_3skiplist_uperf \
 	kaleidoscope_test \
 	kaleidoscope_3hash_test \
 	kaleidoscope_3skiplist_test \
 	kaleidoscope_skiphash_test \
 	procon_test
 LIB =3D ../../lib
=20
+LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
+
 all: $(PROGS)
=20
 # NOTE:  For decent scalability on update-side tests as of early 2015,
 #	 use something like jemalloc() instead of glibc malloc().
 #	 If you install jemalloc at /home/paulmck/jemalloc, you will
 #	 need the following additional arguments to cc:
 #		-I/home/paulmck/jemalloc/include
 #		-L/home/paulmck/jemalloc/lib
 #		-Wl,--rpath,/home/paulmck/jemalloc/lib
 #		-DUSE_JEMALLOC
 #	 Verify by using the nm command and searching output for malloc.
 #
 #	So it is quite a bit easier to just use the default locations.  ;-)
=20
 existence_test: existence.h existence_test.c procon.h
-	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu=
-signal
+	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu $(LURC=
U_SIG)
=20
 existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3hash=
_test.c procon.h
-	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -=
lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -=
lurcu $(LURCU_SIG)
=20
 existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3has=
h_uperf.c procon.h
-	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash=
_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
-	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmallo=
c -lpthread -lurcu -lurcu-signal
+	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash=
_uperf.c -ltcmalloc -lpthread -lurcu $(LURCU_SIG)
+	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmallo=
c -lpthread -lurcu $(LURCU_SIG)
=20
 existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h existen=
ce_3skiplist_test.c procon.h
-	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/r=
andom.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $=
(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/r=
andom.c -lpthread -lurcu $(LURCU_SIG)
+	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $=
(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
=20
 existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existence_=
3skiplist_uperf.c procon.h
-	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3=
skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
-	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -=
ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3=
skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
+	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -=
ltcmalloc $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
=20
 kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
-	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu =
-lurcu-signal
+	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu =
$(LURCU_SIG)
=20
 kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleidosc=
ope_3hash_test.c procon.h
-	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpth=
read -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpth=
read -lurcu $(LURCU_SIG)
=20
 kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h k=
aleidoscope_3skiplist_test.c procon.h
-	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_te=
st.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(=
LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
+	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_te=
st.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
=20
 kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h ka=
leidoscope_skiphash_test.c procon.h
-	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test=
.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LI=
B)/random.c -lpthread -lurcu $(LURCU_SIG)
+	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test=
.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
=20
 procon_test: procon.h procon_test.c
-	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
-	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-sig=
nal
+	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu $(LURCU_SIG)
+	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu $(LURCU_SI=
G)
=20
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/=
hash/Makefile
index a56255a2..7f244e09 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -26,40 +26,41 @@ include $(top)/depends.mk
 ifeq ($(strip $(target)),)
 all:
 	@echo "### None in datastruct/hash/ can be built on arch: '$(arch)'."
 else
 all: $(PROGS)
 endif
=20
 include $(top)/recipes.mk
=20
 GCC_ARGS +=3D -fcommon
+LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
=20
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpthre=
ad
=20
 hash_bkt_ref: hash_bkt_ref.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_ref hash_bkt_ref.c $(LIB)/random.c=
 -lpthread
=20
 hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bkt_=
rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
=20
 hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c=
 -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c=
 -lpthread -lurcu $(LURCU_SIG)
=20
 hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr=
.h ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../def=
er/hazptr.c $(LIB)/random.c -lpthread
=20
 hash_global: hash_global.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -=
lpthread
=20
 hash_resize: hash_resize.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -=
lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -=
lpthread -lurcu $(LURCU_SIG)
=20
 hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random=
.c -lpthread -lurcu $(LURCU_SIG)
=20
 hash_unsync: hash_unsync.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c -=
lpthread
=20
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastr=
uct/skiplist/Makefile
index 3a555691..eda1af11 100644
--- a/CodeSamples/datastruct/skiplist/Makefile
+++ b/CodeSamples/datastruct/skiplist/Makefile
@@ -24,19 +24,20 @@ top :=3D ../..
 include $(top)/depends.mk
=20
 ifeq ($(strip $(target)),)
 all:
 	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch)'."
 else
 all: $(PROGS)
 endif
=20
 include $(top)/recipes.mk
+LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal  2>/dev/null)
=20
 skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
-	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)=
/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)=
/random.c -lpthread -lurcu $(LURCU_SIG)
=20
 skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.h
-	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_gl=
ock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_gl=
ock.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
=20
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 3cf3e5a5..abfbe202 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -55,39 +55,40 @@ include $(top)/depends.mk
 ifeq ($(strip $(target)),)
 all: $(ARCH_INDEPENDENT)
 	@echo "### $(ARCH_DEPENDENT) in defer/ can't be built on arch: '$(arch)'.=
"
 else
 all: $(PROGS)
 endif
=20
 include $(top)/recipes.mk
=20
 GCC_ARGS +=3D -fcommon
+LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
=20
 # Note that bug_srcu_a is disabled until completed.
 bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
 	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread
=20
 bug_rcu_dp: bug_rcu_dp.c ../api.h
 	cc $(GCC_ARGS) -o bug_rcu_dp -DTEST bug_rcu_dp.c -lurcu -lpthread
=20
 gettimestamp: gettimestamp.c ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o gettimestamp -DTEST gettimestamp.c -lpthread
=20
 gettimestampmp: gettimestampmp.c ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o gettimestampmp -DTEST gettimestampmp.c -lpthread
=20
 hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
 	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
=20
 ptxroute: ptxroute.c ../api.h
-	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu $(LURCU_SIG)
=20
 rcu: rcu.c rcu.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
=20
 rcu64: rcu64.c rcu64.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu64 -DTEST rcu64.c -lpthread
=20
 rcu64_atomicgp: rcu64_atomicgp.c rcu64_atomicgp.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu64_atomicgp -DTEST rcu64_atomicgp.c -lpthread
=20
@@ -124,32 +125,32 @@ rcu_rcpls: rcu_rcpls.c rcu_rcpls.h ../api.h rcutortur=
e.h
 rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu_sig -DTEST rcu_sig.c -lpthread
=20
 rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
=20
 route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ..=
/lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -l=
pthread
=20
 route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetortu=
re.h
-	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu=
 -lurcu-signal
+	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu=
 $(LURCU_SIG)
=20
 route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c route=
torture.h
 	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c -l=
pthread  -lurcu-qsbr
=20
 route_refcnt: route_refcnt.c ../api.h ../lib/random.h ../lib/random.c rout=
etorture.h
 	cc $(GCC_ARGS) -o route_refcnt route_refcnt.c ../lib/random.c -lpthread
=20
 route_seq: route_seq.c ../api.h ../lib/random.h ../lib/random.c routetortu=
re.h
 	cc $(GCC_ARGS) -o route_seq route_seq.c ../lib/random.c -lpthread
=20
 route_seqlock: route_seqlock.c ../api.h seqlock.h ../lib/random.h ../lib/r=
andom.c routetorture.h
 	cc $(GCC_ARGS) -o route_seqlock route_seqlock.c ../lib/random.c -lpthread
=20
 seqlocktorture: seqlocktorture.c seqlock.h ../api.h
 	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
=20
 singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
-	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthrea=
d  -lurcu -lurcu-signal
+	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthrea=
d  -lurcu $(LURCU_SIG)
=20
 clean:
 	rm -f $(PROGS)

