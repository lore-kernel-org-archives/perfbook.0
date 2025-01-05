Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A39184F
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075629; cv=none; b=bnhphlxceWi7IjwKpxZCOIkvF5aJJbZtMNGhzOQ39JjQRFSBvEGP66QJRFAKv1j0FN3lZeK7huAkoVtv1ECtQQBpJBm4AsOaQ2tBWXIiE/S/Wtr8VD2j9BKesqcAyXRtdbnpsMj1FsGoWbSDZTtRNLHwopCLYQRlGJ0Zwba27Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075629; c=relaxed/simple;
	bh=q/3l6eTlJU+3UMbD+DSJzdefRidsYDzUl9ISkWEtoDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUJlj8C4uLQ9XnwAN6yNt0UMyFkNrfJhrrh3RyOFJTIgmf9biIX0m4yMghBxOjTn+iP/6pPeNKdvmKxhmmJegnwUtlKo7e+t431z/bjMPhFtoEztJdMeG7YUxBMcyNZoND16AoKKuBwXX58BepVPs6FdyxI+JkX5SaX7eAHUDc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+uFe1Lf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+uFe1Lf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166360285dso192182725ad.1
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075627; x=1736680427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Lvwlhbh6wcM2+Uex10k8TP7fIyUiW1kH1Pb+HjE2lM=;
        b=I+uFe1Lfazp8a5j5onrM9klcWGipnyLV/JyT6tvZRFIPH/tMGfAIFGe4WpM9BDd6+Q
         hv6TiX4nzyUd/nNbFHvSKyZEcIRjMGTP1r5gbUuuZIErPnm/pBOMd4zzsnA+BY6LdLmh
         qvEWGVWUlwcpFDreyHqqAH6FhEq4J1KoHWqAn/R2uqSDFJDzxi64RyXxB5P0Akyd7a0+
         w7G2A+4RS59sD7P/TQMdBW0rCQys0lS2kGl0FCjfvLbYbCoVw3mdb4pGV7Bx1HRZeFYt
         oVS05D8DkszBQFyL43JP0dQBUr9vpAEu/5C3eoSHvh/oZiksimIe7+NmIsn+3Y6MNX2J
         GYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075627; x=1736680427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Lvwlhbh6wcM2+Uex10k8TP7fIyUiW1kH1Pb+HjE2lM=;
        b=lyi2mN4XQYO5dnuD3VI0teew2PuJUcsPOlcMiVi+G911oIl8PYQi6POJjxHP+6TghN
         owUWaukN5TcJxKkb/wVnMKyCaHn0buNEXrhO/rlortb6KEloKkvnMc3tASjGhHce6Glt
         n78Ds8WVcwSD3IYeKTgeOhn3EZtg4iPqFBc/5t27Yv1gTKK8w5uDCGl7G7B6U0hdm7Gg
         Wy5Q0L6rYHlJwd/hPcxL6Xl6Uz21uLK0eABLiIOBPxDFDrZY/438dYGpviamzRFVdRA+
         V8KUoaA4K+eK3mPaK/6hsyYoIUAks/fphW8jTg+v+9cb/6VxmVKk1GDq71sw5Rza1o1L
         FvDA==
X-Gm-Message-State: AOJu0YzWGfbgmO1mInWtMNgm8Aqwj8b5KW+5LCPl8EoXDoI+9FA/+Jhu
	k0OwtxvnYR4TTV+sMG16oVynSLPUP0txHRyTS1Q9D54uNqEncLqH
X-Gm-Gg: ASbGncu/x83Kk6CXq2G72jIKH1gVpTyJxm56kwGIm5SICG+zgGNnvfdJZuNpAG5R9Kb
	NgqgUkFUDnY8S0ZjDQoYNapPv9qxH3qNGxsO0OvNuYIv6JDyOKkwgt3gDv4dl+nxh6RugBpvrVR
	kPYL3Du7wI0fKcA2PKJrJa4o3TMsaA5sMjlM9vENUH87SQuMZahF/ZayxeT5jcD4SRSpwDAmz/N
	zU16bAG8UahxGf9dXBtmWFjrlGWkMQw/0ttwa83VDt0jWDsOxDmeHcGeuUE1n0bfawML+y8GapB
	h+8n5I9TCajtUfHmrwlkTW8=
X-Google-Smtp-Source: AGHT+IEZSupdxxoICWFc4UKnF2efPRSqYbUgKrycCsmR5kWVelaDfc9xqHSj8mO0Da3fSz7NXYqbsA==
X-Received: by 2002:a17:902:ea10:b0:215:72a7:f39f with SMTP id d9443c01a7336-219e6f108c9mr712982305ad.36.1736075627565;
        Sun, 05 Jan 2025 03:13:47 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d9468sm267186155ad.120.2025.01.05.03.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:13:47 -0800 (PST)
Message-ID: <517ef7fb-570d-4938-adc1-6dc19292a663@gmail.com>
Date: Sun, 5 Jan 2025 20:13:47 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/6] CodeSamples/count: Add static to __inline__
 function declarations
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

At lower optimization levels of GCC, __inline__ functions without "static"
cause build errors like below:

    make[1]: Entering directory 'perfbook/CodeSamples/count'
    cc -g -O0 -Wall  -o count_end count_end.c -lpthread
    /usr/bin/ld: /tmp/ccxpkcHA.o: in function `perftestrun':
    perfbook/CodeSamples/count/counttorture.h:159: undefined reference to `count_cleanup'
    /usr/bin/ld: /tmp/ccxpkcHA.o: in function `main':
    perfbook/CodeSamples/count/counttorture.h:248: undefined reference to `count_init'
    collect2: error: ld returned 1 exit status
    make[1]: *** [Makefile:55: count_end] Error 1
    make[1]: Leaving directory 'git/perfbook/CodeSamples/count'

Always put "static" to those function declarations.

While here, add __inline__ to read_count() of count_stack.c.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_end.c         | 4 ++--
 CodeSamples/count/count_end_rcu.c     | 4 ++--
 CodeSamples/count/count_stack.c       | 6 +++---
 CodeSamples/count/count_stat_atomic.c | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index b6ed851c..cf6056e6 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -48,7 +48,7 @@ static inline unsigned long read_count(void)
 }
 
 #ifndef FCV_SNIPPET
-inline void count_init(void)
+static __inline__ void count_init(void)
 {
 }
 #endif /* FCV_SNIPPET */
@@ -73,7 +73,7 @@ void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
 }							//\lnlbl{unreg:e}
 //\end{snippet}
 
-inline void count_cleanup(void)
+static __inline__ void count_cleanup(void)
 {
 }
 
diff --git a/CodeSamples/count/count_end_rcu.c b/CodeSamples/count/count_end_rcu.c
index 71bd5269..104a016b 100644
--- a/CodeSamples/count/count_end_rcu.c
+++ b/CodeSamples/count/count_end_rcu.c
@@ -34,7 +34,7 @@ unsigned long __thread counter = 0;		//\lnlbl{perthread:b}
 struct countarray *countarrayp = NULL;
 DEFINE_SPINLOCK(final_mutex);			//\lnlbl{perthread:e}
 
-__inline__ void inc_count(void)			//\lnlbl{inc:b}
+static __inline__ void inc_count(void)		//\lnlbl{inc:b}
 {
 	WRITE_ONCE(counter, counter + 1);
 }						//\lnlbl{inc:e}
@@ -99,7 +99,7 @@ void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
 }							//\lnlbl{unreg:e}
 //\end{snippet}
 
-__inline__ void count_cleanup(void)
+static __inline__ void count_cleanup(void)
 {
 }
 
diff --git a/CodeSamples/count/count_stack.c b/CodeSamples/count/count_stack.c
index e10bcbbd..384310b7 100644
--- a/CodeSamples/count/count_stack.c
+++ b/CodeSamples/count/count_stack.c
@@ -27,7 +27,7 @@ unsigned long *counterp[NR_THREADS] = { NULL };
 unsigned long finalcount = 0;
 DEFINE_SPINLOCK(final_mutex);
 
-__inline__ void inc_count(void)
+static __inline__ void inc_count(void)
 {
 	WRITE_ONCE(*counter,
 		   READ_ONCE(*counter) + 1);
@@ -47,7 +47,7 @@ unsigned long read_count(void)
 	return sum;
 }
 
-__inline__ void count_init(void)
+static __inline__ void count_init(void)
 {
 }
 
@@ -71,7 +71,7 @@ void count_unregister_thread(int nthreadsexpected)
 	spin_unlock(&final_mutex);
 }
 
-__inline__ void count_cleanup(void)
+static __inline__ void count_cleanup(void)
 {
 }
 
diff --git a/CodeSamples/count/count_stat_atomic.c b/CodeSamples/count/count_stat_atomic.c
index 9d9457a4..ec57c4b0 100644
--- a/CodeSamples/count/count_stat_atomic.c
+++ b/CodeSamples/count/count_stat_atomic.c
@@ -28,7 +28,7 @@ void inc_count(void)
 	atomic_inc(&__get_thread_var(counter));
 }
 
-__inline__ unsigned long read_count(void)
+static __inline__ unsigned long read_count(void)
 {
 	int t;
 	unsigned long sum = 0;
@@ -38,11 +38,11 @@ __inline__ unsigned long read_count(void)
 	return sum;
 }
 
-__inline__ void count_init(void)
+static __inline__ void count_init(void)
 {
 }
 
-__inline__ void count_cleanup(void)
+static __inline__ void count_cleanup(void)
 {
 }
 
-- 
2.34.1


