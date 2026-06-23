Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C333769E3
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210098; cv=none; b=qcvqLUW5rX/FPsHNzCL7nJzKZrQXL2t2lfJgOZb0IG8S5bQHXPF0z15ZenWVcratXT04vz5bSDHnoFRBOHx2Qf6+DtRkK9ALimoxBNwIl0x9nbpUnbSZ1a0VSQdF5oi7qFZ54gOQ5i4NAUjNqcz3u1/3ZLImuqP0u9bDiVo7ips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210098; c=relaxed/simple;
	bh=Qdv4DkoeqnjfVrYDYqGdKEySLsaqBeNeK3RUMpCtP1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M76vEzYRkqN4h4wK/Y1tBYc6qXQ0KM6IdP1zGwV13Rm1rDBXJ+kdCZ6T/jKr2aJJvD7SkwbCT61VzbE04FrLIxxMlzC1bR5PoUEM20DOBi7QQsfdMIM3GbQAfaiZPxevFUe5Zvy8ZcPqr2XoaWaCt/jpGd+SB2VK0gDektjYLEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBiYH+xg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBiYH+xg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8453f568e84so5158884b3a.0
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210097; x=1782814897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tx/xKTjhWj/Gy4JkfVTO35/0IaBPtV7tvNn1pFat0A=;
        b=gBiYH+xgqr4ef5u5s8W4OJSYrJ0Q9DeutS2u0g8ecc/z5qX8JztHqHz/Ub98MhPbIT
         AimXYSzoShrSZkMkkbcYuy04X5SwUue2xqxukwnVJ6himbDR0KWIUDNHHF4+iSzd7cne
         3Irbl4SKIIzgverUir14BS7MTm7VeTL8FbhgEqtx6VJn9QjNrwU0vIKA1DPW1GIX2sro
         yiuft4Unp8+UXxzCjfmyzr38+JWxwTVWngC+lRut4dt+Uh5g99inONzVt4k77xMw2HjE
         cr9hu9DeirEI+IMNI/hqHaopc5Al+/lsqHxWi4Brc7BmEnHvNeAqpy0nvSxqieqvZRyF
         +/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210097; x=1782814897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tx/xKTjhWj/Gy4JkfVTO35/0IaBPtV7tvNn1pFat0A=;
        b=omnXfnSf7bntaHc+nnUjTICtN1awDmwxUwEIHH/SE8NzKPSeNYiZZ4KOfppGQf9unL
         XMTT++Qr6eAtpkosAGQXLsdid9+IuEyh81vqVLUZnjCKRJRvLF1+pX2lpSFynjQg3yel
         7LEV2DpzUHaYeDtTZN+WwC7QUH0oGNSZqJOUPvP6Y70+uGhdEHNEK5s5UK9BO0EWJNbe
         +ZtWF9Tx1RSpQX9qSE4D74G6tUR3bj4Eb4yOjw/Qum6Ulc8DqquWFLSQ4rtPQF0Mq62J
         5jEkuSINDY7wi6byMvwhyBfEk9i95ugGcdkmOjfNZZomlTQWF7HNcmKhTFqrEqf4YzKs
         fBpw==
X-Gm-Message-State: AOJu0Yz2nP36ki2z4UxiEggRSwQPchOxRhKMvO8TEpgk8aek0K3PPKqZ
	kebCVwVIZ90pUh9o9CZZKh/FppSNPkPnjeJcSxtfGRSxflKJpZD+nbbz
X-Gm-Gg: AfdE7cnOCmH0bQwViEtFYgTfgaTBUYoR509O/l1yyKuw8Khx6yIDWLJk2+7obKtWTPI
	ml3chTe7u9PTdaCVKYb4r+OF5Eo7q1+6Hzzlvj1wfoGK1F7DBOawi1XoKKmmfN7hrJ0/76OVdST
	4LQEFL8bRNcFDY4Nk66sSBnlFV6Ss90PzF6IlThzGYXjEPoeyhECC/CfDUWWijAshbPafo0Pi8B
	u0nayZr/ewykXnE8SRh7KYQrINr//cGHzq5kxRioicFZRxn/ecMPXA8gQOwlztq/f0/VgknXxGy
	TK0Vi+YV3UGa1D7DrwT2rSMihefPwXg95F4Bf2mwnUNKty145CnN1do2m93G8k9AvGcHU94XbU1
	BmfLgNbrQ+7Q54vREv/WUENiXIchHy8ZMoL83RIPAwk7vvR9UD1rvp5ELgpkc5beAGU5lpFFLMg
	W0R8u5vqJNA/HKBY2VLGA51M1SqR6HgiJHaX8dxCzZj8V0Pfmzp5qhW7hsCg==
X-Received: by 2002:a05:6a00:2d92:b0:845:4f08:17eb with SMTP id d2e1a72fcca58-8459530157fmr2697554b3a.46.1782210096832;
        Tue, 23 Jun 2026 03:21:36 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564da67a1sm11641448b3a.27.2026.06.23.03.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:21:36 -0700 (PDT)
Message-ID: <f622667a-256d-4d9e-9b81-fb3e1d3996f7@gmail.com>
Date: Tue, 23 Jun 2026 19:21:35 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/6] runlatex.sh: Cope with missing cleveref.sty
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since commit 1bc3abddbf59 ("Stop using "cleveref" with LaTeX2e
<2024-11-01> and later"), building perfbook doesn't need cleveref.

Warning on old cleveref can be skipped now.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 9a060897..7e074c9f 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -184,14 +184,17 @@ else
 	echo "'$basename.pdf' is ready, with above warning(s) ignored."
 fi
 # cleveref version check (Ubuntu 18.04 LTS has buggy one
-if grep -q -F "packageversion{0.21.1}" `kpsewhich cleveref.sty`
-then
+CLEVEREF_STY=`kpsewhich cleveref.sty`
+if [ "$CLEVEREF_STY" != "" ] ; then
+    if grep -q -F "packageversion{0.21.1}" $CLEVEREF_STY
+    then
 	echo "############################################################"
 	echo "### Buggy version of LaTeX package 'cleveref' detected!! ###"
 	echo "### (Known issue on Ubuntu 18.04 LTS)                    ###"
 	echo "### Required TeX Live is 2019/Debian or later.           ###"
 	echo "### Consider upgrading to Ubuntu 20.04 LTS or later.     ###"
 	echo "############################################################"
+    fi
 fi
 # to avoid redundant run of bibtex and pdflatex
 touch $basename.bbl
-- 
2.43.0


