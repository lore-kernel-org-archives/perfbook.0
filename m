Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE021E990E
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411105; cv=none; b=o7lx/PglriZRBHO9fGeIBeqlfSdbbGQa9XRlWLdIKnV6lgRzU24KjqZED1DxAvu68Jsj/Bq/LW3x9PdtUMv21OeqzOqTR1gTtxa0/Uh/pQE72E2+i1UAccUIUQ3qecLmqd+Jg/QFM9tc9yhyfOD/vT1pDNyCDxMH81PHhEbOysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411105; c=relaxed/simple;
	bh=52kcsSDKGBs+10GaO/xThs8mcrjDfZL1RpTOkocTdB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ev42KhAbJXal2XoB+ofIu6dNMCRx/9FeX2Qv0+2PsaZuDe6IgrdATkptVSkHOHnxMrv1W9kVUeBtPxP4mvkI2tSGVTND0B44iMD94Y16D+tlhfqo1MegXEinjuY26D5i8KCrxWHIfNdeHlNRMmapLyW4n6+WzgJuThsnpOrdl6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL4uXdUd; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL4uXdUd"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b551350adfaso3998899a12.3
        for <perfbook@vger.kernel.org>; Mon, 13 Oct 2025 20:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760411103; x=1761015903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqmhVOJ/+3r/QvPo8rgt/VpanVQ/N+4bw1oTESqYhRA=;
        b=OL4uXdUdgT7J3AnO36n3WEmF4S5O9TE9IzCQ0/aG77R65Di4jBdBoAEgFywbfnsUKY
         vjZ/xN2Ilj+h7pNBBS/GxoWVq+TXdgadp32eP18OSaplT7Jmnx9h1eGqmxgV5fv2VPuu
         ltrC6IINQfoUZCuxtoA7QKvISay8/BJiX7kkWhmFdtkVJ+fWr7BmeR0njsKdf/RuIgPJ
         UpeJSrr1x6d23G0TlTV5IblYAN8c1dwNKJAW2AWfZJhQJgSx/shS06H5sG/qi38LcvbJ
         8haVLJ9Y2r8WbTaDUUk9Oj/sTcEd6MczQsxUE8IH3ZTyo8u8Z0nPfkQLsHkbyUZwcgsh
         E1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411103; x=1761015903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqmhVOJ/+3r/QvPo8rgt/VpanVQ/N+4bw1oTESqYhRA=;
        b=hveowW8xY+pIJePGlrHbvxU0KKCO4g/lSu5LyEVhR1l8MGdGyniL8EH64jpWu1Chde
         6aNjFxaQOBN8waziFEMMUQL1G1f/8vGpA0ow3oZmtiYtcnW/vBzF7XjwvXyQFUAq1Cg9
         HQQriDh9srtTME7NEWTWJM05eXCwrVh903EZBhFpYmS5spD+wKSWMlyNb+2avbInlSfE
         nxs1RM6E3VmgOG3i6tFPmM5CDD7KUmRJRPI9TBpYAf+phz3XFYZXVe9iZUYvBfYqOduj
         klbvEPa1wDpeRpRL5aNeMt34omrisQXadFLnxh4pXQRR9zwlS0u8OHZ2rB1OorIDsK4z
         tccA==
X-Gm-Message-State: AOJu0YzV1AuYeX4m1COdIr7DfRYZ8agZ7CKvMLGC6Z6wcH/5Swl5ODKv
	ewg2ba7paeSj+uHJUFHryFLfXdWVIfDhrNVfT2GzEBKM2v2oef1vgBDq
X-Gm-Gg: ASbGnctv5dW9V2W89/11GKeSZAyBLLrS0bx6RfZkLLqWrfBhz4ba8LDfRTc3+h1Cq8G
	S4mktr9hz40BaNcNMtWB+490l/EdDLRc9on4FhXYrmwHt+TKmHDOB4W9C9Imw4JU58Icl4Ue7hh
	SBOgNUia6SpdFBvvnMb9tIECo7h7eyeV9QZo2WUKyykWbOttk6ZP+dxvzt3D5/4DBrejQVxzqb3
	jrOy+08dgw57aKObgndtpMpdj9bxrAuZUq2EYExlEYvY2h7kRkwN725t6ntyS4lP/26wC/D12+B
	BYRgLOCRcAsGTRXkck3iI50BJxtMotXKEok+zso+WJEXi5sHIOD1yC1qewPBzBm+5gUi9HqHDL4
	w0Vu5wuTOeaf9VyE9cT2RW0ihq9QrhE7WDluueVs+RNJWyY7v8x/g2alg8W/dmHQRBQUYNhjy00
	Y0dnbJHLDZU2w=
X-Google-Smtp-Source: AGHT+IHlDSv/vUXvArig2rNMg5Sk3m4QIGsbYZPl+RL1g8bZ6bMLW+zcr9ksXgf+fwDjdK9EPyAG2A==
X-Received: by 2002:a17:902:d607:b0:269:8f2e:e38 with SMTP id d9443c01a7336-29027356528mr301567045ad.6.1760411102913;
        Mon, 13 Oct 2025 20:05:02 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f894c8sm148522495ad.122.2025.10.13.20.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:05:02 -0700 (PDT)
Message-ID: <9502b5af-8c82-44e5-af48-37dd4693a26c@gmail.com>
Date: Tue, 14 Oct 2025 12:05:00 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/5] cpu/overhead: Add "samepage=true" option to
 short VerbatimN env
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Page/column break in the middle of this snippet should better be
avoided.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overview.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpu/overview.tex b/cpu/overview.tex
index eedf8491..8a184f3c 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -255,7 +255,7 @@ as described in the next section.
 In the meantime, consider the following simple lock-based \IX{critical
 section}:
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 spin_lock(&mylock);
 a = a + 1;
 spin_unlock(&mylock);
-- 
2.43.0


