Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FF1A2C05
	for <perfbook@vger.kernel.org>; Wed,  8 May 2024 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181531; cv=none; b=A8U4SN8cCtmrRHm5lLl6/0esus4+JlJn5YCj1AWA/NlfPdLwG/z50vUgNv6DhJuvc0dRvhxtnXut1/QjnRl6nw+fgT5b27iHPASRADef7YMDojYGgLyi4czkn//+cYJNMK/8BRpeGc1Ua/O4DKFZQGRy11ng1W8xZ6uFLHabZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181531; c=relaxed/simple;
	bh=RBWjmhBYAvcV1bATeVBOSz/xq789SSLsxF8Zp3ZOqZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppWr3A2i7qPzNnMlmyq0IdSzzDTGZJAYnRKqwvLNXMFqCqwvM6qHTXKYIDu+5c8OqVRtgsD8+7EPgO9W2k+Nya5chYcxuRHpsZc1eJRtxIh+/hp8J3P/YFAtDxX1Z5w9U4rUJkD3XAu/k9sOSUpm76fIx0OUEQUE2/bUEv23UDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0erEUVR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0erEUVR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso8407085ad.3
        for <perfbook@vger.kernel.org>; Wed, 08 May 2024 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715181530; x=1715786330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqgD796gWjm19h1EOwBFR1PmJG/+i0WCMBAK3f4e4Ts=;
        b=K0erEUVRmq1zzp40mITYLON6kPN1qjbDUNxxk5xtLdkhLpHoeTWYkQzcRAb+eli8qn
         dJY3QDCD4+BJjPo7pTzzJihHrw5rVOds2wR+EcRmZ+SXve5AXEOMcLXVa4klRwoFMisX
         8oiF0bu21wgaTleQ8F70QGY8APPYslSZoaDUr+K77laWKHpTBsKnVHb2oHVGUN1XQmpH
         9w1ZG8MHwLaI+kR/dqcNIyJIlNoPkejrPGislGoWwWHKFlyf2jXImM0B9ABduWAlMZvi
         6AfVQfEQzItBWhUJa2BKDpTM6w/OLUQ14AEGIwVKPcr72WLrgPuYBFaCtLpp8FqAGbU5
         2kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715181530; x=1715786330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqgD796gWjm19h1EOwBFR1PmJG/+i0WCMBAK3f4e4Ts=;
        b=TMSETN5BDQpdOqOhlWtWjcQqS6btU8LZnNNdmWoQo6MiCYLTW4VP2w7XziS6Yul2v9
         awIi81fF/OWVhp8vV39S+znV5hiN/HA+Pw/vo2gH3YmAGqHpkDoRTS/7FmUYxnCkd6C0
         RhhLUlYZWTQIKo23EcCXyxAx2NQsdxJ8VJ4qlvVwr8l1uWzkD2Ms7VLBY/Is1OBQ876e
         CJXts4S3aS6MSCz0tZmrBUB2TvTbbXTUkf0E19Hg0TyC95lZWx7W1bRHJC53aD4YTHj7
         EctvFLhAupQNVwMuMnxruJ/w+HiY+6R3WuRmP+WRazHebYc/u3ae3BiBBM2V8b6mtMOw
         bP4w==
X-Gm-Message-State: AOJu0Yw9qY4sJnOLHKyjUbo5mxt0ABaGkgRedw7xQX967f0KcwGy5YEW
	FkOiyLJsUKx4bWf/9NvCEcGqdbuyGiXyNvAZAVJ6r5/sgxximnckSWHgrg==
X-Google-Smtp-Source: AGHT+IHm5Sh6+CeRgKAitlFIWFQCWaqPP5OMvW6PuLKMUHc2Xkxesp8fRWgfi4kkqo5mQ/fm1wqB1Q==
X-Received: by 2002:a17:903:98e:b0:1ea:26bf:5989 with SMTP id d9443c01a7336-1eeb0195400mr40170945ad.1.1715181529853;
        Wed, 08 May 2024 08:18:49 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b001ed8886e794sm8494261plb.165.2024.05.08.08.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 08:18:49 -0700 (PDT)
Message-ID: <7c8a128e-b49c-41ff-be52-d05706cc878b@gmail.com>
Date: Thu, 9 May 2024 00:18:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] defer: Use \tco{} in inline enum list
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bc5fc6da-1f06-43b3-b065-3292652d78f8@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bc5fc6da-1f06-43b3-b065-3292652d78f8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using \co{} in list environments such as enumerate* can confuse
LeTeX engines in width estimation due to possible line breaks
therein.

It causes an overlap of "," over the closing ")" of "read_seqretry()"
in the answer to QQz 9.14.

Use \tco{} to avoid such undesired results.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/seqlock.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 5be8ae56..3ed2f483 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -141,7 +141,7 @@ will pass to a later call to \co{read_seqretry()}.
 	\begin{enumerate*}[(1)]
 	\item	This added check is a relatively expensive conditional branch,
 	\item	It cannot be substituted for the later check done by
-		\co{read_seqretry()}, which must happen after the
+		\tco{read_seqretry()}, which must happen after the
 		critical section completes, and
 	\item	Sequence locking is intended for read-mostly workloads,
 		which means that this extra check would slow down the
-- 
2.34.1


