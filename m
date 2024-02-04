Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42623747
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065113; cv=none; b=bVPHNjEy243RHYuNMranKVYf1nQ91KvC58rQ3Wabsyojjlaoj1sbBTR1vl00FXXEBv97FmKIwbS1n9Ntrzoe8zHNq24oGx4dcssQaPdhlXEVZlznc3pVPrxoIxDk0SwzZIMa0VUUtPshrZKfqXN338GA+ieSy7bNVQOLltRYXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065113; c=relaxed/simple;
	bh=5VAWpZBRd71C130IElhZYWBh9+BFeoLXxkxQzL5OFYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cGzgkCqkLrm9GcI6tEeRKShpXDWtOt5BcYVK76ODz2Kq4pt0EAqcJ53s6bI4W16CTrmtFgYav4rsiKfc0Gqzk0mnK0qBENmspJ5SieQk1B5w1Z/WnfuOKtgJaN8lFDxsepeHbs2s/f3sy7HxeeiKnvxT+JLr4h+b+EE8oI/8Cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaOJv15+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaOJv15+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso3215101a12.2
        for <perfbook@vger.kernel.org>; Sun, 04 Feb 2024 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707065111; x=1707669911; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adWexIEYGq/TpDvIFQHfgZsyT+3p/AWgPnOMg+F1qhw=;
        b=DaOJv15+Gy0ARry6UNXXjoMWyuqGoKGC5CeWhRa6xx4KMn7lFlcjEnT1lV9IQdJ6gh
         mPuZMLCo5KOShHyYR9qSl2UanQC8LqJPOSaQ9rBHJdhkaR7AO6nWjc6k8TBVvmSNa7jN
         gbXykMaIoqV35G1h96yUsHNfdNqxPSCUMyHvwg3d4w8e3jweTV/T1YoxgmwgM2d60pgS
         fDCOZPhfNqpAzPfHnBkHd4NiP42+rA8Zr7MnUHnFOH2haRtjqj+0X/GlDTBeUTrjUUZZ
         dNe7L9kqVxwrHc+J7KG/+IruXAz7LmxbpPhe6iIh7d/fmi0x+7jT/NQR8h4n2yJ+V76T
         fVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707065111; x=1707669911;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adWexIEYGq/TpDvIFQHfgZsyT+3p/AWgPnOMg+F1qhw=;
        b=L0/IU1oav8QnstfjlM2icEaf8bCtOWXUi9+mPvqzb3yCFST8Ipd+6w83tj1OBx5EmH
         Ia6cgGvk1R43e0u2BFZPwOZrJR58mIrPu1CDkbEpsVxDJZm1udKrift9hxway+DLqR/P
         VJ2EsDYY1c512Nnc3hp6NHj3PE3N93k1oOYFBu47qmLvyH7tIvIgSP2Dlrz6e+DLGURR
         VJXIhYWtU6kvrrBT9iDW0Zw/LrqL0GgdNwUjQ5cLBOcMZPwgwo4Gx7QH8S2zMCXHHUYm
         RSqNWSZLjQWKhEFEZwjSRGNhxW6ifjZ2r5y6hWDeRazxNI6vJ+mw7aVeRZc8QarpXvKQ
         HYpg==
X-Gm-Message-State: AOJu0YykvCAiWEdMJdvw3k5ykm3ZRwhu8vky19GAKlw7uzDEMRyihwOH
	zT8eIzk7wAakP90HicKWzi8PEk+2X2r/EHXASUPLOtsa6oD0JcSp
X-Google-Smtp-Source: AGHT+IEu4vDr/heiRL6xtqMoVgjtnevywNRU9Co+0uRu7Fr3S6gdjAh/awa11QLAM5cA8pVhQs7t5g==
X-Received: by 2002:a05:6a20:ce48:b0:19e:4e80:27f0 with SMTP id id8-20020a056a20ce4800b0019e4e8027f0mr9144673pzb.37.1707065111138;
        Sun, 04 Feb 2024 08:45:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNWxbMDBCahNUKo8xNh1plVxgCyxXlgodF19qs2x/SxeDlxQ32Q6eyw4zx4gLx9Z/P46KWgpUU9tIWVTq8wwksHos4e47Ntcc=
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id y2-20020a63fa02000000b005d880b41598sm5350014pgh.94.2024.02.04.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 08:45:10 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 2/4] appendix/whymb: Use \co{} for code
Date: Sun,  4 Feb 2024 08:45:00 -0800
Message-Id: <20240204164502.15124-3-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204164502.15124-1-sj38.park@gmail.com>
References: <20240204164502.15124-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

Some sentences in whymemorybarriers.tex is not using \co{} for code.
Use it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 1ca93f18..5cc7911b 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -823,7 +823,7 @@ void bar(void)
 }
 \end{VerbatimN}
 
-Suppose CPU~0 executes foo() and CPU~1 executes bar().
+Suppose CPU~0 executes \co{foo()} and CPU~1 executes \co{bar()}.
 Suppose further that the cache line containing \qco{a} resides only in CPU~1's
 cache, and that the cache line containing \qco{b} is owned by CPU~0.
 Then the sequence of operations might be as follows:
-- 
2.17.1

