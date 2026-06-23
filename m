Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43663376BC1
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210168; cv=none; b=qh0A1Zpqu1ikyhw+/8mub/ElhdCHJZ0Cz8A2hE3r1skMF3IvRP/R2iYCc6UPqwibR2g+aLYRbfPvS1GFdgNJ+rpKcj1BeAe5p0nKFA0S2y4g+YhNzhGHtF9l19II26naPfNUVNQu4dQLPj99qB7SAc1EWbYsh1fjvn2B1ftK3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210168; c=relaxed/simple;
	bh=uTYdeYmWbjnmY51A8BtRTuUYsBSvzjypQWBwx0d3Uw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugyFW8yORGZYO0F6ywjcMGXcQv6L0ly3O1mHfzuwrZk9v6NUJff88dqMNs1mZXSfWYzx7VynmhzXZMSfkmnm9B1rSsdkLaducegeBJTKf5pryogOryyEQ7B77skyBQ91guLV1IxEJHbb/P+2HvdzpVBYJIIwWB+eGxQd22rWU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TP1s+EZr; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP1s+EZr"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845385adf4cso2486076b3a.0
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210166; x=1782814966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kiCr6Aqg+qAx8VvSMpTcMtqEGAkiXDj+Q1AyHZ8Yww=;
        b=TP1s+EZr+YI1Loimmrb6D3w30IG9rjYHEdwMqgTT0OUxyZFciT0aAUoOlWL9wGIB8B
         ToL7B7VOc6c98NRTy89CEHs15fYTMYA3KJsEaDHJ1ppQoagcmNjldQ+dZDNZv32Jixoe
         ydkUMy/s6ksgW6cVNheeyZC0gwSY/l+hIay58m+xCptTQ7jw5AqdT0nihrP2g/GiiMKV
         JtXIeCDaEL9mwamsz9iAceAVlTh0eQNUoMHeK/9YAosnCTzCV4dwqzqfosiIRF0NjZ4C
         JvXuyO9T7724cKkoYPTVEqTtKvvmmNOSyIgbwVVUA9j2u8ZgUH0qtI32+jkmL38K2Z+6
         iOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210166; x=1782814966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kiCr6Aqg+qAx8VvSMpTcMtqEGAkiXDj+Q1AyHZ8Yww=;
        b=jVi2mAP8GUgkiGzR8OPkY+dbMyg1TKdDSIRucck9PlyFhCYZszCL5BNjVmV8b4bldA
         9JdeaMa1t0UT/LB+hANM7OIo98BrlkGcd4kl6/ThUBO9faQtD6nWOjDpuGnVVMRvA167
         vzqzetLkDUF5puGyOxOdIzRKgKsDGZ3dsezGqhb+IgLw6yAb2zGt1x/olSgtnZveazmn
         qRZqRdYjAfXdgNXmM3tjWwaADv74lke9hSDNCoJ+RmIuWza0HkMZLBhCyt/bOUCIZrea
         1JxIWs8qD8+FsaKFEmePqFqvsKwyo3GcVKY0gBjTBUbYGpzBohhH5fiZ/lsRy7aAxgQs
         JPbA==
X-Gm-Message-State: AOJu0YzBggoNfgl3ruC2TkCovRhDVABxwzv1Mk5VtqnzPOTQPSaf/OD2
	X4jUG/W4kR31k7WLIDAIaSKsU8HIbDcb0VbAGMDn5zz0lWV9GDsssxxa
X-Gm-Gg: AfdE7clSWF743XKs7Th8PggmPJhVXGF9Uh4cqFlyMF7dDrpWTML6Cd4aN6FgyxAjEx/
	1digUiR1m6mTqkC4iCvVxfe2cofSEbdILlUS1XQaq4Hyfb7DkIM1Fye2jzNVRl+7PlhKHpPGyNS
	kheDkHubkWAs7sSvn5bVRzwLL3ZhzyhmOJ9G70IDXpxIGRBObQPctZ/GHAlUx5ezNwjiUMaDqZr
	X2NOZV8upZDBcmIr75jO744fupgVLnvCVPxXmV3/Lob022ujYDklzHmQtq7tt4r5WuePxCxtXbw
	/ZW/SRsmLJ311GpTV58DyKiJSd4J3yHNDG7EHavfhTMiQi6ED9AEwpdkREybnbF0yiTbmlxhhGd
	6h0ru2wW+GYDEdisUMeHYN5+UrDfpKE3XLjuvDMG82Q3jtNAbELiky7m11iMIrWPi/5mzbR6hn0
	Jh5ale6oXq87EWP3eouPsWqke27JoidVPZWiylIqGvoc4qe3PULb4dxgxqkg==
X-Received: by 2002:a05:6a00:993:b0:845:344f:eee9 with SMTP id d2e1a72fcca58-84597070df3mr2230113b3a.1.1782210166515;
        Tue, 23 Jun 2026 03:22:46 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ef4c09sm11674761b3a.61.2026.06.23.03.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:22:46 -0700 (PDT)
Message-ID: <43e646d1-90ec-495a-aeb8-8b4ee59f1214@gmail.com>
Date: Tue, 23 Jun 2026 19:22:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/6] Stop loading braket.sty
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It was needed for a section removed back in commit 972946a5298a
("future/QC: Remove quantum-computing section").  Comment it out.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index ba40146e..0dc05325 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -92,7 +92,7 @@
 \usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}
-\usepackage{braket} % for \ket{} macro in QC section
+%\usepackage{braket} % for \ket{} macro in QC section
 \usepackage{siunitx} % for \num{} macro and \unit{} (such as \percent)
 \sisetup{group-minimum-digits=4,group-separator={,},group-digits=integer}
 \providecommand{\unit}{\si} % for siunitx < 3.0
-- 
2.43.0


