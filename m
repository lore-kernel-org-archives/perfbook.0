Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D1382
	for <perfbook@vger.kernel.org>; Sun, 30 Jun 2024 00:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719707428; cv=none; b=RAUToQtoJGBYiT/Ajyn3v4LXM60/2iJwtD1J7qKUEX2V/0HMPHCT9i91a8Ma7qUeA+o3tF/8jX3fsl+9NlBVcjxf/pSa+eHgq0oNNSGhUrCr0sj+9oLUKVsxQBN3ReUuUeJsBCyM2AESeo4CXuAi1LT5kluAIeLiro9cF9dysgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719707428; c=relaxed/simple;
	bh=D6U3H3WjupanR3/znopaXBN9GZTVhae9y7ripBot9bc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=BlLBhIMC2xLMtN+yIY7vhokqm+E3fuL1s5Blsp1CgtGHq61L0k5i8jbHOrYeUExnOBxEV+5pJiiu3Malh7eLzv4myT+cYl+Sw9J9ovNOhPDkoe0UUBK0YE6+/JMpAlfBS3ba/3wbKAI9FIDUGD0LB/KmribrNaSntepdWPefmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqa6nsmT; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqa6nsmT"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3738690172eso9294285ab.1
        for <perfbook@vger.kernel.org>; Sat, 29 Jun 2024 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719707425; x=1720312225; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGwExOZzm+kfuaE/Ub23Zwehts/jnso9ytI1CIEz3Ho=;
        b=Sqa6nsmTf+bUqrmLX4/uu9mnkSWpNGyJRzkAuMNJJ86+eoVs6zvSWuDGpGHaEw2xfn
         El+PaCb0hMVCSPShZw0q/iNUXEkKJ3bkEYG0sdzlGEQ+sEDg20aM0MOGDrS46GUEbltf
         2AChrv7gXaEspH8nuGn8LijodxHvTWnHaWLqzns3sQtakYkuWv9uypswxnSe0OdxYcqo
         lp80DNW14yBbbcVRtoZHX8eNeigtLMrVpS7TMhQVhX3ylOG+goPU7+M1Rd5mvH63ycbr
         5Eyqype5Yba9z3UW9LvE8C7+mWkWVG0z7duFCqrAoIPhKFEt4MPQgt3yTLB6dHYfAowd
         u0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719707425; x=1720312225;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uGwExOZzm+kfuaE/Ub23Zwehts/jnso9ytI1CIEz3Ho=;
        b=uNRL0Iyh74koeyms1AV2/B3zXBJR/nfDNw7ppbUMAMT5Dxj8163VuIpObDE+3qetsJ
         osyXQxixhjd7iqF2a6xPxfgJELwp07+6xlbyDierdKy2fL/mLNThTlPwjmexQyWkwAoa
         e3kKuTSfFrjQyAuRG/qR/vM2k6SlZjBzje7OZR7oJOFC4h+klKg1gzHCGvixbSMMub2c
         KFoOz5OVB6pceeOLkib+BHXw2UnaTOEIWsBYFucQ6FRTgSTh2Lc7XYWxPpMYvOYqhQjA
         h3E6Of0o5veIU4SM3Z+ANalIjBM8Ep0OE7CuFHYNDG672c2BjxkTuJeb2deewBemtSCI
         yAOw==
X-Gm-Message-State: AOJu0Yw4HW8+n20+IlBlcMy009mNw1iyY7d8UikMz2eX/kz0QtDVjmWD
	jlgwZWtNIjW0E49vOP2pjEfRscDcLSo6zf3orE9TIn28bQdsDtH2
X-Google-Smtp-Source: AGHT+IEN3jxyynVtTFpW+D/UaN3e409dWqLQDyW1fOFfyE0LNzOXqEriaSG8S+YLZTGJrO1DDZPzag==
X-Received: by 2002:a92:c246:0:b0:379:40e0:b0b8 with SMTP id e9e14a558f8ab-37cd2bed7b7mr25702025ab.20.1719707424764;
        Sat, 29 Jun 2024 17:30:24 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d96cbsm37735525ad.119.2024.06.29.17.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 17:30:24 -0700 (PDT)
Message-ID: <66ea8c7a-27ca-4335-8b77-11ebb1ef6c87@gmail.com>
Date: Sun, 30 Jun 2024 09:30:23 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Revert "Work around conflict between arydshln and
 array v2.6"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This reverts commit c1fdb7c375c71bd580d8b914c0fc76e8fa8f62c9.

The issue is now taken care of by latex-firstaid 1.1f (not a usual
.sty file, but a collection of hotfix patches to be loaded during
latex format generation) released June 26, 2024 [1].

Revert the rollback of array.

Link: https://ctan.org/pkg/latex-firstaid # [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 21713a91..0fa51425 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -9,9 +9,6 @@
 % within a page. See: https://tex.stackexchange.com/questions/183149/
 \ifdefined\pdfsuppresswarningpagegroup \pdfsuppresswarningpagegroup=1 \fi
 
-% Work around conflict between arydshln and array since array v2.6c
-\RequirePackage{array}[=2024-05-01] % One month before the release date of v2.6c
-
 % standard packages
 
 % A more pleasant font

base-commit: c47b401fb4c031592552e56020aa2c6ddc2dc8d9
-- 
2.34.1

