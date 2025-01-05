Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA414A617
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075715; cv=none; b=knksYJt5eHVo9GbwOLFogty/mPmfrg8O+1Vtrcx9rdBcILW0gizI7z7qz0yR4ir6dY1QMsEN01N21SgBwVbccpQYoN8iMPCv6/CV0+xI0+Sxu5HEYehmOq+dcHl8XfsFmd9Z0S6RmJKWmqbLq09zDn+Ko9wcG5A6c1LHxoqMoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075715; c=relaxed/simple;
	bh=ly9fSS1kB8ipjQGtSc0YBdW0R35aCZX7UAiZQG3BUEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imSI3t0FM/rbW4X9G90+2nRUnVIaRslKLI+VwMYJ8v+RAvpwSQ55NHEhkTkPLbrBObpWINOXqzgnr9VoNNkQrlumQpi9JPQ5Vmeh4Mj5ujjjvGGFtLpZNARujNz4QVTk6Q0v3fQMICim3b49MYW0RFK1Bnj7bAP57ZyPcEmJKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P70qKZDW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P70qKZDW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso15129864a91.3
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075713; x=1736680513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/WTfcqKThXmSSAQcywtBi9ezpjAlPa6SZWjF6fXsFNI=;
        b=P70qKZDWy+QhPwY08Uxqgrsp8gbBXbpkNWt1jIuGs2FWdlO3Uhpb9mvuqRNU/UMuiv
         SrsESNcW3/zJtPo8B7MM0z+31we73eFDU0cxvkinWtox2NJm3EpRsNs9VxT4UpD5MUXM
         SZzfgnEII0OGUISO7w6IrYGORPS5bXtMQJOq6qDLYRh2a1kSV3hTxwp5dVCowbt9QpV2
         NXpoQB49ybo0b1WFjUyDSW/b9LHqw/M1gmzfPXGH6pHmT9PqKEyeEpgRqeEvi/PVNuCk
         i0b3xE5Fe68OtXZ3vjDUqJ0r4xM2jSdz7LukF5y4THYoIw//CcVtS/tLVSMFsnWmFRcJ
         vaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075713; x=1736680513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WTfcqKThXmSSAQcywtBi9ezpjAlPa6SZWjF6fXsFNI=;
        b=wkbrCLhlJzYGnFiHkrsKqc3KoZ6DjGnfPevD/zbElv3CKVA9gDDBO+bTIeuVnfpStm
         fIdQxgTE5ODNEWVzKt7VMXwdErDIDyV73XChKZOm64Rdz0CJyenlQxm+7iBvzBOzg1Z+
         QaFmVrexgjaBI4vrDRx6a5F6i1E63AfgzXReBJnHCQ187edVSHRusi+xHQdvyEQbwdWA
         JEd8kvvK0iHimDIaTNybD68ZhS+R+pBa5S6O8FJIffNT7mfbe/v4MM4K9zVTPVjSrAQv
         7bXuYgMYW72y+fTMskHOV4wQ3D47WylT45/+yH25IE/560oBXsF8003FbxUgWkCSge3x
         qzRw==
X-Gm-Message-State: AOJu0YwU7jvklniHyd2slH6q2jgYLf5Y/CznJSA4UVhf/9sCH6OJIlcg
	uNtei2NWju0IyqAwxYGwj/5VrxPovqtM/tibHQKN3gJySNn9oTBu
X-Gm-Gg: ASbGncuofqAmsXodK6xeCvfKsgpRLrEfiFdtaFWGLZa/BjaHb85rKUOlGCPkQEmYMkM
	LPn8+A6u9SThbOcqY4H3m3B2sMoTaR3spfKS15MdmPzWvbgRCpwBIqnSaUkHLU8TTWp3I3yeUfQ
	ZRmsIKlnWgvctZqMrtaPLxUq/DPNb5JQR1kkRx4JYVooU3xemu3DgRKjMcGQfc1ETBhbtVEcPG7
	J/mRFXiRauG+Ff7MrDjDTS1FG0lTzrdDeqr0d6CNSuO+oGs8r+eBcrm9MOOX0t6kOvegYDYyKtJ
	FTnnKOPaW0tCyXxwLJnzFlA=
X-Google-Smtp-Source: AGHT+IEtlRO3th0mjxirvxiJ6wVlBdJEi1BI0ygkezm7SsqIq/Qp+rZShsQo17n9mZeOSpPwvw97yA==
X-Received: by 2002:a17:90b:1f92:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2f5063a45f6mr15418686a91.28.1736075712893;
        Sun, 05 Jan 2025 03:15:12 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f454f58087sm32998212a91.11.2025.01.05.03.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:15:12 -0800 (PST)
Message-ID: <b9733477-e415-4aad-a893-3a8704d30d27@gmail.com>
Date: Sun, 5 Jan 2025 20:15:12 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/6] CodeSamples: Add #ifndef SUBOBJ to
 api-pthreads.h
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When multiple object (.o) files, who include api.h, are linked together
into an executable, you might see build errors at lower optimization
levels like this:

    make[1]: Entering directory 'perfbook/CodeSamples/defer'
    ...
    cc -g -O0 -Wall -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
    /usr/bin/ld: /tmp/xxx.o:perfbook/CodeSamples/defer/../api.h:278:
      multiple definition of `__thread_id_map';
      /tmp/xxx.o:perfbook/CodeSamples/defer/../api.h:278: first defined here
    /usr/bin/ld: /tmp/xxx.o:perfbook/CodeSamples/defer/../api.h:279:
      multiple definition of `__thread_id_map_mutex';
      /tmp/xxx.o:perfbook/CodeSamples/defer/../api.h:279: first defined here
    ...
    collect2: error: ld returned 1 exit status
    make[1]: *** [Makefile:132: route_hazptr] Error 1

This is due exported symbols of:

    o __thread_id_map[]
    o __thread_id_map_mutex
    o thread_id_key
    o smp_processor_id

defined in api.h.

Avoid such duplicates by guarding their declarations by
"#ifndef SUBOBJ" and put external reference in their #else cases.

Take care of HP in hazptr.h similarly.

In Makefiles, add recipes for building objects who don't have their own
main() with the -DSUBOBJ flag appended.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/api-pthreads/api-pthreads.h  | 14 ++++++++++++++
 CodeSamples/datastruct/Issaquah/Makefile | 14 ++++++++++----
 CodeSamples/datastruct/hash/Makefile     |  7 +++++--
 CodeSamples/defer/Makefile               |  7 +++++--
 CodeSamples/defer/hazptr.h               |  6 +++++-
 5 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index 3e21fdb9..8edbad4e 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -159,8 +159,14 @@ typedef pthread_t thread_id_t;
 
 #define __THREAD_ID_MAP_EMPTY 0
 #define __THREAD_ID_MAP_WAITING 1
+
+#ifndef SUBOBJ
 thread_id_t __thread_id_map[NR_THREADS];
 spinlock_t __thread_id_map_mutex;
+#else
+extern thread_id_t __thread_id_map[NR_THREADS];
+extern spinlock_t __thread_id_map_mutex;
+#endif
 
 #define for_each_thread(t) \
 	for (t = 0; t < NR_THREADS; t++)
@@ -175,7 +181,11 @@ spinlock_t __thread_id_map_mutex;
 		if ((((tid) = __thread_id_map[t]) != __THREAD_ID_MAP_EMPTY) && \
 		    ((tid) != __THREAD_ID_MAP_WAITING))
 
+#ifndef SUBOBJ
 pthread_key_t thread_id_key;
+#else
+extern pthread_key_t thread_id_key;
+#endif
 
 static __inline__ int num_online_threads(void)
 {
@@ -368,7 +378,11 @@ static __inline__ long long get_microseconds(void)
 	} __per_cpu_##name[NR_CPUS]
 #define DECLARE_PER_CPU(type, name) extern DEFINE_PER_CPU(type, name)
 
+#ifndef SUBOBJ
 DEFINE_PER_THREAD(int, smp_processor_id);
+#else
+DECLARE_PER_THREAD(int, smp_processor_id);
+#endif
 
 static __inline__ int smp_processor_id(void)
 {
diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index 6a51ff90..ca379b3e 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -45,11 +45,17 @@ LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
 #		-DUSE_JEMALLOC
 #	 Verify by using the nm command and searching output for malloc.
 
-existence_test: existence.c existence_test.c
-	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu $(LURCU_SIG)
+existence_sub.o: existence.c existence.h ../../api.h
+	cc $(GCC_ARGS) -o existence_sub.o -c -DSUBOBJ existence.c
 
-treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
-	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
+existence_test: existence_sub.o existence_test.c ../../api.h
+	cc $(GCC_ARGS) -o existence_test existence_sub.o existence_test.c -lpthread -lurcu $(LURCU_SIG)
+
+spinlockmult_sub.o: spinlockmult.c spinlockmult.h ../../api.h
+	cc $(GCC_ARGS) -o spinlockmult_sub.o -c -DSUBOBJ spinlockmult.c
+
+treetorture: tree.c existence_sub.o spinlockmult_sub.o $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
+	cc $(GCC_ARGS) -o treetorture tree.c existence_sub.o spinlockmult_sub.o $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index 7f244e09..5f3d740c 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -47,8 +47,11 @@ hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
 hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
 
-hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h hashtorture.h
-	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr.c $(LIB)/random.c -lpthread
+../../defer/hazptr_sub.o: ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h
+	$(MAKE) -C ../../defer hazptr_sub.o
+
+hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr_sub.o ../../api.h hashtorture.h
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr_sub.o $(LIB)/random.c -lpthread
 
 hash_global: hash_global.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -lpthread
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index abfbe202..0cb77122 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -128,8 +128,11 @@ rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
 rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
 	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
 
-route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/random.c routetorture.h
-	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
+hazptr_sub.o: hazptr.c hazptr.h ../api.h
+	cc $(GCC_ARGS) -o hazptr_sub.o -c -DSUBOBJ hazptr.c
+
+route_hazptr: route_hazptr.c hazptr_sub.o ../api.h ../lib/random.h ../lib/random.c routetorture.h
+	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr_sub.o ../lib/random.c -lpthread
 
 route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
 	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu $(LURCU_SIG)
diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
index e061303d..bdeb5c15 100644
--- a/CodeSamples/defer/hazptr.h
+++ b/CodeSamples/defer/hazptr.h
@@ -52,8 +52,12 @@ typedef struct hazard_pointer_s {
 } hazard_pointer;
 
 /* Must be dynamically initialized to be an array of size H. */
+#ifndef SUBOBJ
 hazard_pointer *HP;
- 
+#else
+extern hazard_pointer *HP;
+#endif
+
 void hazptr_init(void);
 void hazptr_thread_exit(void);
 void hazptr_scan();
-- 
2.34.1


