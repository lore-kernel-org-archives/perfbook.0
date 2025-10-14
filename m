Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D743074A4
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760410839; cv=none; b=XWPvnkOCrAnjXQLmuKx7PQXXQUMD7D+mP3BbaBXtOmNKPJ+rvGwYTGCoE/GOQEX4nQ6WF/BBEhkS3O278u8n1BrLz2lMbQHPCMHJDK/Rb2YAZj3zxwuF+tCpW+BjafvIq7BfN5dcBWOmHQjgnT/VbhZPGC93yDomx5YXRLZ7j2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760410839; c=relaxed/simple;
	bh=lrHB9gy9ZXPguy8CjSt0acOvNbvZ5wjMGjfVwwt+mN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+0YIJJzKoDL3VpI1IiUfGHUYPSclzDyf2d63R24Egv44aGZSCbqi8H/mY9iLtVxNeZ1NnyShwGJREL8QzBEsvYcHRI4J5RH6hYlq0ULEQ3wpPuyCul/ZzSWiBNkqRCjJjlrFZ37PdmvuSDSvYImMcDhOfxuacRYLBsbf8D1bes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW+JEye6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW+JEye6"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so2872648a12.1
        for <perfbook@vger.kernel.org>; Mon, 13 Oct 2025 20:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760410838; x=1761015638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZ2WJLxYAMYPuHmrmWlqQ50AoWfEJR/zg34iApINDFU=;
        b=KW+JEye6niv3yivWFCBSkvw5zRFdt7ytUTQW3YvOcUyXeiTDEXi5bg/RPeD5v//cUU
         t/U315HiPe2CfbcDx6KmoD1/uLZhbskwap6fylqbGhfA+J8HAGmDqufR7Gki4yaLGxow
         RDIZ5WW0IUQqBjFeceYIedVvCfwMOUXDYzpHNYTbZhIrtDNGcbVXatracIDC5z5f2uRU
         ArvcD0Wu2nNB+hqxpnIQ5enrIotuuMb2WHpJO1/69Elhgxo2uRqgdS/lMcSFKvBiW2O2
         R4T6ctctl/B1KN+6ap5QnzR78sS6SXV8MEhrYPS/y5HQBd3BAjADxuPAbl9tftlF7rzh
         nfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760410838; x=1761015638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ2WJLxYAMYPuHmrmWlqQ50AoWfEJR/zg34iApINDFU=;
        b=TFOEznhkYnr9rFo9PdDu/lbZ3OvWapaPxFJM2lJPT4SpODWUTdioEWc9vJ2YyHQpG4
         +X9aRxVtWJFPrwj9Y/IS8Pta6U8luAfNA3UPOdEEyaZwUk/LjR/LfwfxjP9DDMaYGxd3
         5T57dTGZpRDl4gz5jrEQfS9KhSDKJEW3shx03rZOlipoXKYEQhFKR76CeQB+9C/rVMsQ
         ymL8TtkpW3xVBF6F2ILge+iLMDcyKZwibGFa1QTCRGRUJaBU3FUPbCjLrSF+caX6/CQ8
         VUSYzRqg55gU8VBqNE+L9eY8m6nmZOm6zJ58DSoUm2icoH/D/HyNooPxz7L2HDjUx3HB
         1LGg==
X-Gm-Message-State: AOJu0YyjhUsa9mhW5ai95QcBL9WfAAl2n6VZcvc/2kFvUCFgRhjXw93G
	3Ehz/hl/HG/v2AOKkeVjTeVKM33ufhaUwVFyuejiuqTx/9o+3SksF4Qz
X-Gm-Gg: ASbGnctr5bdTAkQqjAgOYAgueafPNmJCvJgUsQjwvDT8YTefn28Icdn0GqWOUgkIPYt
	ZoTodAFY/XvqTxC10yPhgIuLX0J36qj6Gic22/oIJ2UDSwurZksd/sntKcygFBli7giy7Nk0Qwi
	xFAtDC/OSEU4UOluC+zBfzj+gT+pb2bkTYNOM86rsHGsNHwP1UilCDJQ/11C2UBmCtqOHLVA+hX
	TvwNkiWHbo9B3//OPHVrz51dxQ2VuncVCTsfA07qjEBr9mTmLnHdN1RTW5lOrvJFHOMGF2C+oya
	89Hs4pDX692yIQpR+ZOFBydWJFf1Uoj51EAFs4JDGuG0WCaQ2yz1fSf4xv6IEF2Gct+HB8J639N
	bqjlHbKdBDHHkHyglA0lbPR/c85aKcmtA36GURh41J31omujGSZ6RAb7LaHZPfVkXzbW14bdYHV
	UCyB/Q6fgSF0W6wCqiVwJvmg==
X-Google-Smtp-Source: AGHT+IEFBPwc9XrtI8vmZhWWAhWZWkTHMBS080CDjR09fqbX2pstPgpLGhjtfTWfKBKP3sYBvstM0Q==
X-Received: by 2002:a17:903:3807:b0:269:8d16:42d1 with SMTP id d9443c01a7336-290272e1e24mr264004685ad.50.1760410837492;
        Mon, 13 Oct 2025 20:00:37 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362fasm148295625ad.97.2025.10.13.20.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:00:37 -0700 (PDT)
Message-ID: <cbd7c82b-8c60-4068-b6d8-ef3017da4e26@gmail.com>
Date: Tue, 14 Oct 2025 12:00:35 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/5] intro: Use "VerbatimU" env for non-float code
 snippet
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Let's use our custom environment for this sort of snippet.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index 7def3d9b..fc0f97e2 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -1200,13 +1200,11 @@ adapting systems to run on multi-core systems.
 For example, consider the following hash-table API that might be used
 in sequential code:
 
-\begin{quote}
-\begin{verbatim}
+\begin{VerbatimU}
 int hash_add(struct htab *htp);
 int hash_del(int key);
 struct htab *hash_lookup(int key);
-\end{verbatim}
-\end{quote}
+\end{VerbatimU}
 
 Here, \co{hash_add()} and \co{hash_del()} both return the exact number
 of elements in the hash table after the operation completes, or -1
-- 
2.43.0


