Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07943A1CFE
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567878; cv=none; b=RHNcHwCRbTHdaF4tAPKoY0ncLPhNZwlLWSO1NJH44ewHe2WkkaOGNsNShfyr+YgNgm57Pujwpy0loPgBb9PmSjb6Gn+HX9yQMR+gAXIwH35njRbkvKmSHrKvB9E3rrDz1gP3SiqE5ClstH5leoO5xLRDqjCYZjkZnE1fbPthUJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567878; c=relaxed/simple;
	bh=SIwO0YDqetWmK4rx5WCe+7knksKbWpK8o3iwrCzuDOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYZvoyzy5s2+x8x9bQbzhU+WEg31dSZcKBFpw2m/iHxe+J1VQGK/VP5AACvKbISt5jssVGfn0RPZXxdKjTYbPuLaDnWnbTb8CSdrsueWcbCjrvuSfF07+kk6F/I4wXeAv2z0+Ffcti05iqh1m+kqyyenBgOxSw1mgZEyf3uTIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBjiPmd8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBjiPmd8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf36a6905cso3478055ad.3
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567877; x=1781172677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSQYzPY1N5U6gR93ezU0JmRwelpKYdxF/OTXXvuIc5c=;
        b=nBjiPmd8NB1XSvAT6PDcj71YeVX+pEeRf5TTXD930QYSBfPylzDVqB7g3++uaWVD12
         jCo/OtBta3hjMCRhoXNp6UPmtMAf4pG0hDIknppheao5kKAJaSIahyArwj9fnAKDkkOy
         2Im0z9iV7W64ldvjZow1hTFL7XMFu1RhXOrzfhwAlojurVm3UUuMaHvlBdiyX4J/aLyj
         w9WDKtpZo/DYyf5DKAVeTWJdMEu+XSzo8Bajm2Y5IF3t/kYnirAmRUI3qmi1LR5ARoTa
         jQNPz8ZZ13cNqghmfnz7AKi1gq0nvtj4stzh/Xjnf8t42TgBWujxNxpFtjf4cyGotpmB
         6KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567877; x=1781172677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSQYzPY1N5U6gR93ezU0JmRwelpKYdxF/OTXXvuIc5c=;
        b=iX6DQwGfwKlVGCUw70/+XF8+V9X/xQAFduNKfmLwBzqQH9OGF9r3wAlFeOCNZ+cKx6
         /9BwiKsQq6HBVbh1Oct0njUGtJAACnx0W0XTFYGN8PHlTRvlhwfaGMS5qpXMrjrYqw+S
         FjW80ewy5yNk8wmT2TjGp/USDN6vYPPxNwTyqKjJ48bi6ilJ54PkAR4jkRrPpCDm3nz6
         gFQQrVUtrsYxMs5hXtUA5VrPCm35ytZLhk6FqJ1M00SPjlJ1ehmf6pgBS5FJZBs/zqvE
         QQ58uSZsKHJNkWW3esWPBLT/hrtjDag6qK3QuVYVodsaLM3cmguq0AIQUJ3fBKh/VNny
         Ogfg==
X-Gm-Message-State: AOJu0YwQL901O9rYR++b0iMmq/V1P3ZbLAZL9xIosVIhGHOGpB1ICRKM
	qt+xPybixyofV/vAogfsiZBRFUvHFrc2BUbA9gcV7agXNW9NEBlQJfpg
X-Gm-Gg: Acq92OFTI5yfUw+CpzCALAbTSAiqUkHNHRpVoex2fviIrNDBkuHJh7DS4d6oS4dql5P
	tTOVprgMKBV2Ql7vsU1MQLrjfAUA9q8fj0Al7mLHGkV4YjFHyrAmZjJZc/D3boa+1GwFYFTqbll
	9cZw+s7Tun+W79Jsh/esA+I03TZMkAyBGXBFT5DAq6Dx40Nlg45K2ckwnGdXaZO+BVT549DHt7z
	Pq3Q5v1xEH5MWYYCziJvCVWJ4CRE4HpeuwkzQZpnqUPHvsJlzp7LGmSYWtfdfVBvGlQ30Rlly2i
	F0FffxELiQkxYVmV9EC3K4Bq+PGyq4jaNKrSFaCxoTQAukDfZqjxODauwWUetEg+IomrATXkXN0
	vxJQSb2Ug5449XyhPtrr9gpEDeoVPf1XxrFwHDk2PXi3oPRjcd2AqHaS9vktmCCOtYmDnx2iW2I
	neTEcE9+f+VgBYQR91J+DELF8fkatLUghPB8xPh8uhEqtsY26OK2vcCH/R051xNzmnDGXBCAgmN
	UBJBODQkQec4iV/bQ==
X-Received: by 2002:a17:903:2ec5:b0:2c0:aef8:23dd with SMTP id d9443c01a7336-2c163fa89aemr80958985ad.22.1780567877067;
        Thu, 04 Jun 2026 03:11:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm52644805ad.50.2026.06.04.03.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:11:16 -0700 (PDT)
Message-ID: <0a885c74-8ecd-48ef-96e9-e262895f949a@gmail.com>
Date: Thu, 4 Jun 2026 19:11:15 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/6] memorder: Fix typo ("`" --> " ")
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 309d3be1..d0775c36 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -5571,7 +5571,7 @@ API to the C++ standard~\cite{DavidGoldblatt2022asymmetricFences}.
 It is quite beneficial to verify code in terms of a higher-level primitive
 instead of in terms of the low-level memory accesses used in a particular
 implementation of that primitive.
-First, this allows code using`those primitives to be
+First, this allows code using those primitives to be
 verified against an abstract representation of those primitives,
 thus making that code less vulnerable to implementation changes.
 Second, partitioning the verification at API boundaries results in
-- 
2.43.0

