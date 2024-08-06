Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80990A59
	for <perfbook@vger.kernel.org>; Tue,  6 Aug 2024 04:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722917625; cv=none; b=P4WM5dWjSh199Fd1DIxn1knsDMhx8kgqlZvi7AQjsCp8NvqJUehC+EdkjseB4+HP889iwC6HrNsNPbd7FrP+itV+OMAKQqImUILHPHYeI7xEFasRWO2cRi5N84hSQYJwu06KpfXofcsPH0qEHuzmZmr7+w1sGc3MT9no8xPQ8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722917625; c=relaxed/simple;
	bh=I5iRpJGfs2ooeFeaNeRamAMwlHzG2owQfk9rkHEvJng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkS/fmpQZFIphgLOUQLc4G3OR41aAKXVs/DiIb3KEU/33qFQIqrJlmxy2Tg2JHQWAWf6QfCGWWZfcDFuZNtQnwF6WJy/xHlUCnXbMj1Kv4xBraGfcot2D7a21Uk/JYf3AbKm/CxQYyAs4hUXp8jcNJaoanN26h+WqGTlHQnn0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB4T4ACp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB4T4ACp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70eaf5874ddso110692b3a.3
        for <perfbook@vger.kernel.org>; Mon, 05 Aug 2024 21:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722917624; x=1723522424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8oeGccL00C7kzErVKWAKIj34oQk+bCuDXHkjz1k3b8=;
        b=fB4T4ACpFIfua0ugFugt+HxvR7aWshMziQx6vfOToVxXjHH+S7Jj08Tt3GChkQWz57
         2V4xqvly5nhkjaoFUcysyoRm7+nzhJ4hOSUa0ZV16rMvW8ZNLql8xMgztUYDEy5G+9LM
         /U4hB9Xc2ZT1U/nuE+AqGy0WGAWszGIyrmvJCjiq/DVqnsMmaSIqb4KJl0U0OgLUNUHo
         UqBL2e7yTb4t/NHaUOGdRC19Qk9XXohuRSqY9BcG2qwWvoaQRiksPSRuOgXxUNeV4O28
         LzUoImujZKr6V2ki/8qqGk0sDzMlu7X/Ctq7yCXokcMfzxVCxZGIlOdAju7kAErzMVVD
         n7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722917624; x=1723522424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8oeGccL00C7kzErVKWAKIj34oQk+bCuDXHkjz1k3b8=;
        b=HVn41V2UqmNtBgzxlPr5Wzt/X/fYaBpGcePZAEappVBlbm3spfMliVeaS8mH0BhHQS
         bQzXvBC2ayZlQYTVHsgssowcQJof5wUkHiUMGVLXd1jxBbKje6PCXKe+aBvaFQSO/oz8
         H4aCprqBS/lAhEcSn/7R8tdJnlil/L0jqXzlKrC3nH/Mv53AVQXV2VN4S6e6meTA/tja
         2Mk98qyRRiYC6UDcbobpkb4u/IGCS4DNjayEb1cxvaONhaK7ToFjaQZFqkj7AtO2cfSS
         bmqAlm4x1PsvEeYm2Lf2J4aR+KvYovqTWkvNunirZaX9uch2kn2pV18BHGF5wk+UPU0+
         QX3w==
X-Gm-Message-State: AOJu0Yxcc3Lrpth+JZZT+lA/uMap92/nf3RLDIEke7V8Aqw2RV9cMus/
	XvzAE+Sm0Ur0gGxzw+Y5hFBKATnF4kiMprV5Zy9GBMFGWPm8yU5H
X-Google-Smtp-Source: AGHT+IG48RH9YrwOic0xIY9BDUnjyHQ9mL8VZE+1bHApFDSP1A2/NZ6POxBXh3JEp4cNvW+oui6yVg==
X-Received: by 2002:a05:6a20:3a97:b0:1c6:b0cc:c448 with SMTP id adf61e73a8af0-1c6b0ccc59bmr5969183637.43.1722917623688;
        Mon, 05 Aug 2024 21:13:43 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c36sm11426497a91.49.2024.08.05.21.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 21:13:43 -0700 (PDT)
Message-ID: <95c419bc-9689-4621-a569-45fdf0395014@gmail.com>
Date: Tue, 6 Aug 2024 13:13:43 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] whymb: Fix staccato of "loads" and typos of "incuring"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <f7f4e7b0-9843-42d3-b79f-3d18404140cc@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f7f4e7b0-9843-42d3-b79f-3d18404140cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 01c6a703..57800c10 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -611,7 +611,7 @@ are up to date (``V'') or not (``I'').
 Initially, the CPU cache lines in which the data would reside are
 in the ``invalid'' state, and the data is valid in memory, as shown
 in step~0.
-In step~1, CPU~0 loads the data at address~0, incuring a cache miss,
+In step~1, CPU~0 loads the data at address~0, incurring a cache miss,
 loading the value into its cache, and transitioning that cache line to
 the ``shared'' state.
 The contents of memory at address~0 remain valid.
@@ -664,7 +664,7 @@ However, because its cache holds that data in the ``modified'' state,
 CPU~2 can immediately execute that atomic increment without any change
 to cache or memory state.
 
-In step~8.1, CPU~1 loads loads the data at address~0, incuring a cache
+In step~8.1, CPU~1 loads the data at address~0, incurring a cache
 miss.
 Because the data from address~8 is modified in its cache, it must
 first flush that data to memory, transitioning its cache line to
-- 
2.34.1


