Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E692F5A39
	for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975665; cv=none; b=OEk6AuSSA5mI0VeGaCrYXYZKkIkCaaMobYpmlLrNDEi8ATNata0JNz41arQzEfImFtVeJVxMVXEAdlyAZ+mZBwwLaH1EghztGyJlu/oliEc0sW8uBbKEu3mSxPNmJRNLmkylMkB5zzGc27/lBw3BBM6WzTost0SrPdRbjQg183I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975665; c=relaxed/simple;
	bh=97pgOQAm3YvzcyK8Hmwhb1L3UG+CpRf96b3BiyDSI/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9HnauyRqFvBMn42o4S7WRWlM2XooRFFXxUuI1zi2vH6roSNgChN8wDCW9GYQvOeZDICrEnXMb/lqO4pYSrdUCUQZc2drQZi/R6F/IMF1e9r8LAWMaonCUUqMkXP7g1wDpOwUnB0pKUwgVDnocjgJpqtuGSN0m1lUX8HKjI7+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpSH2tRI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpSH2tRI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29555b384acso50069325ad.1
        for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763975663; x=1764580463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qe1HAWWdkdtrlYyU092HXacWhSHjtcD0FUTRrMY7TYU=;
        b=WpSH2tRIKX5eLfDEcZuKW/JpbdFe47f+Oj260gy67nUvewelzphh5VusfO7C/AeEyu
         vO80k5/OARVjEjeM5YDBkY96D571Mksxri1F/6hEWEkrEhVs7dhKD2/JjnKry7aDxApw
         CX8rPftt2XKXR6XrHVfITRN1b7a4T21MCLZutNvn6ytavG6mC6g6RcMlBmXjYC3spILB
         D2zCO8zY++mqYg+fmCrEoflg8l4Rt3KnRCChzu+kZDSPiXxzq6+O/0ux+2Jkd89htpBf
         yqwP1kjcjofhTZf2ksW1HXk6pSL6bvvG5TZ8mFcLt7DOMj4J2QAquQo5M9VW4OA/yd0e
         XOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975663; x=1764580463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe1HAWWdkdtrlYyU092HXacWhSHjtcD0FUTRrMY7TYU=;
        b=nvuWe6gheG7V7snPj6MjCjHzGQ6rZ6KLtXHTTIlvoqxSSjcWix2pErYT6VSmLBosfx
         sTJr20AEjvSapTnrrKOOo/Yb3Cpzwf7iUIWdwBk09UgScKE21nGG+N7h6TQO4bDEhmm+
         hEJDmhp29oowybJYr/3OUBmR7xt8/xvOmH4nM4wenlPb77T+tmfYefEJmFYsgVu8Z4//
         NEmYF2RSrdr4+GWFLbSLiCWYd12GFDFB6LLgeVgNlffn3otvHxVi4ACNseD57vj/J1M1
         U9M6SYyACRZW6VQ8dA3eI6i2LVf9U4cAiGAcsbnQ/KgoYeL6OrXtG1ShH8eZscAUmrkv
         Q7rw==
X-Gm-Message-State: AOJu0YymsYCoXHLOQAGsRgtGCuoJgJ+3oDGhq2ujq4/fp8g+jFFyDNhk
	hf3u+woQny04ejxGY0Rm6k8UWV2Y2sejzxQfvbyVpgaMZntOi9vaddixOx4uug==
X-Gm-Gg: ASbGncvcpHGU21GW35DhKvvigHOQqiswDHWRy+9ncnpZSIcjHSqGTAPSUycMF3ne8/x
	THg7xw3TSBkEXt1/KDPaBzLYtJPDRbAsRWlftlOasCJfZ8uSAZH4TyXvFcETKVP/CgxtyQSsrvU
	3pj5jYvPmfMHAF8SOS6srFNR79EYI8irskRiUHEJpAGkYa8uTVfse1+nhNc3bEW4kRmoeeWURk6
	JoWQ0tjOoLGzRGsIQMI4XBEGqW23mnkkgLspyH6d8T3v/2s1ADYJR8u2E/GM5ZEJVqFEmmX0SmM
	uwe6g7cngfHQZxcMxSGbUWwAwkgWjkCV0ejguz4RfEUIAQhsA2T45ezyccxx/idxCNfB+J/9lvR
	navvVFVcqI53SrV1zk3G6KNQaRImFCaIIvNdNf6t6U852dcmpZ7OCqgDmvwBsOmj3sFHm6KYQbw
	o6z2CMWW3faTn2M/B3db1qleiSFCYWvRmnJ96JaQk099XPLc3lSiwGNTnf
X-Google-Smtp-Source: AGHT+IFcs/nOXXmEsVLY+Teb0hSSsw9Zc7dwkRNMDF5P4tF6zmEKhduC1TGBpo1q+YY0BlhWVGofvA==
X-Received: by 2002:a17:902:ef08:b0:298:60d5:d272 with SMTP id d9443c01a7336-29b6c3e42c8mr122292225ad.17.1763975663063;
        Mon, 24 Nov 2025 01:14:23 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274752sm128980565ad.75.2025.11.24.01.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:14:22 -0800 (PST)
Message-ID: <7079499e-959b-4fbe-b9e0-b8a1b532843d@gmail.com>
Date: Mon, 24 Nov 2025 18:14:21 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/3] CodeSamples/.../herd: Declare non-int reg
 variables in init block
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There are missing declarations of local variables listed in the
"locations" or "exists" clause.

They can cause warnings from gcc that look like:

.../litmus0xx.c: In function 'code0':
.../litmus0xx.c:458:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  458 |   *out_0_r1 = (int)r1;
      |               ^

Declare such local variables in the init blocks.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../herd/C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus   | 3 +++
 .../C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus  | 3 +++
 CodeSamples/formal/herd/C-double-check-cas-2.litmus           | 2 ++
 CodeSamples/formal/herd/C-double-check-rcu-2.litmus           | 2 ++
 CodeSamples/formal/herd/C-double-check-rcu-3.litmus           | 3 +++
 CodeSamples/formal/herd/C-double-check-rcu-4.litmus           | 4 ++++
 6 files changed, 17 insertions(+)

diff --git a/CodeSamples/formal/herd/C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus
index d074d6c1..58887051 100644
--- a/CodeSamples/formal/herd/C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus
@@ -6,6 +6,9 @@ C C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul
 	int b;
 	int c;
 	int *p=a;
+	int *0:r1;			(* \fcvexclude *)
+	int *1:r1;			(* \fcvexclude *)
+	int *2:r1;			(* \fcvexclude *)
 }
 
 P0(int *a, int *b, int *c, int **p)
diff --git a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
index 86ea5553..37c7cb0f 100644
--- a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
@@ -6,6 +6,9 @@ C C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul
 	int b;
 	int c;
 	int *p=a;			(* \lnlbl[init:p] *)
+	int *0:r1;			(* \fcvexclude *)
+	int *1:r1;			(* \fcvexclude *)
+	int *2:r1;			(* \fcvexclude *)
 }
 
 P0(int *a, int *b, int *c, int **p)
diff --git a/CodeSamples/formal/herd/C-double-check-cas-2.litmus b/CodeSamples/formal/herd/C-double-check-cas-2.litmus
index 4c2dc523..2296fe3d 100644
--- a/CodeSamples/formal/herd/C-double-check-cas-2.litmus
+++ b/CodeSamples/formal/herd/C-double-check-cas-2.litmus
@@ -5,6 +5,8 @@ C C-double-check-cas-2
 	int a;
 	int b;
 	int *p=0;
+	int *0:r1;			(* \fcvexclude *)
+	int *1:r1;			(* \fcvexclude *)
 }
 
 P0(int *a, int *b, int **p)
diff --git a/CodeSamples/formal/herd/C-double-check-rcu-2.litmus b/CodeSamples/formal/herd/C-double-check-rcu-2.litmus
index ff7a1dd3..a108d318 100644
--- a/CodeSamples/formal/herd/C-double-check-rcu-2.litmus
+++ b/CodeSamples/formal/herd/C-double-check-rcu-2.litmus
@@ -5,6 +5,8 @@ C C-double-check-rcu-2
 	int a;
 	int b;
 	int *p=0;
+	int *0:r1;			(* \fcvexclude *)
+	int *1:r1;			(* \fcvexclude *)
 }
 
 P0(int *a, int *b, int **p)
diff --git a/CodeSamples/formal/herd/C-double-check-rcu-3.litmus b/CodeSamples/formal/herd/C-double-check-rcu-3.litmus
index c5d5f9e4..6bff1f82 100644
--- a/CodeSamples/formal/herd/C-double-check-rcu-3.litmus
+++ b/CodeSamples/formal/herd/C-double-check-rcu-3.litmus
@@ -6,6 +6,9 @@ C C-double-check-rcu-3
 	int b;
 	int c;
 	int *p=0;
+	int *0:r1;			(* \fcvexclude *)
+	int *1:r1;			(* \fcvexclude *)
+	int *2:r1;			(* \fcvexclude *)
 }
 
 P0(int *a, int *b, int *c, int **p)
diff --git a/CodeSamples/formal/herd/C-double-check-rcu-4.litmus b/CodeSamples/formal/herd/C-double-check-rcu-4.litmus
index 02f34366..e81d5850 100644
--- a/CodeSamples/formal/herd/C-double-check-rcu-4.litmus
+++ b/CodeSamples/formal/herd/C-double-check-rcu-4.litmus
@@ -7,6 +7,10 @@ C C-double-check-rcu-4
 	int c;
 	int d;
 	int *p=0;
+	int *0:r1;			(* \fcvexclude *)
+	int *1:r1;			(* \fcvexclude *)
+	int *2:r1;			(* \fcvexclude *)
+	int *3:r1;			(* \fcvexclude *)
 }
 
 P0(int *a, int *b, int *c, int *d, int **p)
-- 
2.43.0


