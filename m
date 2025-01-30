Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8D1ADFE0
	for <perfbook@vger.kernel.org>; Thu, 30 Jan 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232905; cv=none; b=PPJukdXMBOMKoavGGUm+oxAScFWHHaW5WddSyHJE8Sn3ps7V8xvzrjOnaR+NPF+JtYhXuuo2f3mTlE5GbXUyktRjy6mp79s2PlLfvVsii/HZM2JEqT4JyJyP2kqwOIhL67PzeSw9S6SVuG1g7WPHzR64TbG+XQrJd2XGdFJ+rt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232905; c=relaxed/simple;
	bh=N7+bhK0Vv/ipz//xzSimE7vrovkw1CK+upsSNWTKeAw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=EoKRzC+U6IvVeg6BUHLIpDxmkdjxPZ16sgX2wHFHcPPLbvg5UJ1oW0LxBjNCF1ehKCDBo7ZVo1v9WBEUI4v+xRlOWK90M/XHFP09HWjawO15XLYupqy++X9mYclur1Pg66iAHqjbFkPZdND2+45qD1GSsIg/7ICCKZlJQaOSvWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJpXyvdY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJpXyvdY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216281bc30fso13989055ad.0
        for <perfbook@vger.kernel.org>; Thu, 30 Jan 2025 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738232904; x=1738837704; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h656tcH1GiRFkHw3+0e9m4O1eU46u7mqgYlaV9O/e0k=;
        b=fJpXyvdYugmYHCfJZuZaJ/YNLSgxBstuqfVzWiTMWFYU3s0id5Zq7GjqqlB+rd24YT
         mWqix8Vmnprq8rxOCd0PJ/ipJG1agc0Xex4uKCTmxSygCKIVr0bsq7KnAmbhfFukWxmB
         AHUiJ0rwflJEBuXyg2i2Gw3D2569DqItbDSUyq1NeBoiKbLcr+H6PBQEy8Iv+N2BlnMu
         ZNrbePHhc6de5PlctatDOr2gnJVrtZCqu4RtgzImay/qxzXjO3nmxMSxVfpTnJJgLJAn
         AAF9R5R0wJ/nKi1FA1PkW2btu4AdH/zZnyKPqOp4QSkpelb6GoRMZoriMu13Ucx9rT0S
         mKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738232904; x=1738837704;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h656tcH1GiRFkHw3+0e9m4O1eU46u7mqgYlaV9O/e0k=;
        b=RUUdx+R/zG6v/9arYbD7I6OjkeGi8Ir6R1BVGBdDqm8Psw+FgPhqEurc46mJcWdFNY
         gIR2J0KLIk40KWPn787zXUdKW0atyduD9VFU+WGEBrFCCVNQZZcgHHQowTYkU6BTngZp
         5gqXWBxaYdeWxIUQOXSouyV36BfRDvRdrRSKNNio+zLhwPvBCD+ZB48lAy96g7+hMbO4
         nEsOLU+Z2ClwvCiRNz6p79m2Xiidhz/n3VeOQq9QpxNyDnwBBBrL0tttCVRWHn8eIvT7
         qXY1xgeCPzKU7jfni0c/sZLWDmWzv1ZDuAjtyWUWiDZbro0PeFKVnPsWcS3/P+Zrhcfw
         /tAg==
X-Gm-Message-State: AOJu0Yz0dGyLsbUOPNz9cZHCqLdEARUI+890y071PKOlz27T6u7bkdfx
	ZhvTVEU9YNSyE1FZ4vyHT6vJEqfZIG0wwNg9B+y9xfSbn7lmLSDM
X-Gm-Gg: ASbGncvQrodOdafgjKyCjrIQpXRL620esTCX1KuX0KtWHUlQtZP4tx2b01Hyx9LUclW
	laxrfIiVNNffuvJZyVn5AWJywAx34lGfSAVwFLynxzqEw3YJ6+ipNfvvwtZqOwx9panYaUmRF2b
	Fzmkc87K0xro46Yrq0SxcrrFnF5awxnAtovP1t2quwtOMTirKjUCbDdueddhwdvzyLSt1nqNUY9
	B3H5TKjSfeDBLFWluxFIqZCtekQLmOKHqQRXRJyofAz+6bDJFgSefy7mwlhTB85fJGdnsqIHCZU
	VzISTb6c6lcwSI3uilYsw6GGtAnelkIfiFnIRBIhJPVT1m82w/gMcO/bJnnCEw==
X-Google-Smtp-Source: AGHT+IHYnDsWeQqSYPsXBITsq+C3KB/QTCs39Rg5orVxARgVRbvQeLbpGitSFu2k42zYVompgHRhDg==
X-Received: by 2002:a05:6a00:10d1:b0:72a:8b8f:a0f1 with SMTP id d2e1a72fcca58-72fd0c9460cmr9393725b3a.20.1738232903686;
        Thu, 30 Jan 2025 02:28:23 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe64292b2sm1128728b3a.62.2025.01.30.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:28:23 -0800 (PST)
Message-ID: <9ade7bc8-2937-4117-9fb5-f52d8a44d75a@gmail.com>
Date: Thu, 30 Jan 2025 19:28:16 +0900
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
Subject: [PATCH -perfbook] CodeSamples/formal: Update rcu-test.dat for v6.13
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index e984fa8a..acb29ae2 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -100,3 +100,4 @@ v6.8  22018 12071 34089 35.4
 ""    22579 12085 34664 34.9
 ""    22676 12095 34771 34.8
 v6.12 22834 12313 35147 35.0
+""    22961 12414 35375 35.1

base-commit: ff5ebfc467117f34c4d4066d83b7883b151da63b
-- 
2.34.1

