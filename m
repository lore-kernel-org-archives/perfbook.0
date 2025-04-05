Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034D1B4251
	for <perfbook@vger.kernel.org>; Sat,  5 Apr 2025 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743843620; cv=none; b=H8EhHPY7kV+NunYspr3K1HPavHahzNr1zfXYL/lbub5z4A9JCwKGAf0kA0wPCfT6LQhuzVvdx+pY56YN5c/mvbXTX/5dlH2blqvAN+eiNj0TlKoZqMJO8fXcrrGCc7ckQnIxjMO/P8qXeT5UMldRkrwzhW9UbthD88kmIuA/1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743843620; c=relaxed/simple;
	bh=nLMvwroc+1j6StWvinNeMOEGgZf8FGazqhON9goLeSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfQ1fwEgZ+NQAIdt8YO5OmulQYZ3ZTbgy+mObEyeoal8HrPTOPqDefPvtAZR/nmoHh1/aWo5d+Yijs46TrVXtYMrYMy8Nf+abq/Kca72HOttXaL5pP2FmTnFqU2HL7qGgHef/zBeCXU4p9G2qG/ozaxymCfr8IvzX29y/l/UdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4Ip2OA1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4Ip2OA1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2241053582dso37495955ad.1
        for <perfbook@vger.kernel.org>; Sat, 05 Apr 2025 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743843617; x=1744448417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwdFehujRcpG1OQCUo0k7LbBkM/HolI/wpOXF5bPMLU=;
        b=b4Ip2OA12zQ4Mt/3xKr3gO3u+HE+yS8n4UFBz2jIpT7dTcrLQt85dgWb3HGsjd4PbV
         qLCbK9dCpnhR0P/FcdRT+yXEqUjTBBwEj4UkwBPss7JzWcy9MGuXJE3IhmkjlfY7A1Dw
         Jd01o2xxZVL9QNzzvBMwMW1Nb9Kk8RnYkdfdbcFE4dd+DHM1aLqKq1TkW0JDsdOo0oi3
         akj2KImtK3Hqb8LgaMLHFZBCLROCPAwwCb+ZQNPA2+n0sjcUzXymzjcEFnHKPD9H4OmI
         CQXQvCr94sJne9YJhSQ82it6pOJ5xhv1Gph+ND4a5A5xeGA695a3uxcq+q712nWIfged
         mPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743843617; x=1744448417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwdFehujRcpG1OQCUo0k7LbBkM/HolI/wpOXF5bPMLU=;
        b=bZ44khXOQfrpLEPc/cpIGaBKP9hkX9apbfpwgXjcPqxElTkLGSVMXFZmrsKpC+tLHB
         DT//fbdfrV8XO2dVTEjTgukp8rh1cdD1uVnFRHOqEq1CgVH8hd0bkx7dyVJ5ot+/63mh
         BWSRKxgPLKzzucHpGs0TN/WFeAs7G4jU1AE04rMEEqRClJPg7h8j6ycOYxfz6zdy9Hmm
         M35Ib143WpMMxdlh29oR2Vch7v32t2yfDXiqGmyNAVdja+75rgZVoAw4+zVOpC5CLZIF
         4Q99lQ8rBXXL4+D92zTurz1TUnNy7OYUN2BpxKzNxiGJlz4aOOnt/rPlm0lsPbl6YNeh
         MFsA==
X-Gm-Message-State: AOJu0Yy2s3ww1QRPKRUgRDveq0bxLsaNQxbB6s0pSis2tVpP5Esd1vKu
	KWlcA6pnEc9Y7dpeYZIvRpxL3XSdSUyjpSoPmOn3Dp5M15a1Idfw
X-Gm-Gg: ASbGncvHT7PnHI0/mZ096hh+3hbMIgf6IFRgzAMfWIx1bDqO1NuGC5QeUkiSAXUAtsR
	pv3Qi3KyQZcnlXtb/XnaSJAXPnbCVcd1Be8M57HF228bGYx+bosjtPGMHDDLamF1Blm25R6VvDJ
	dCYjpJtK9ipFm8boqHkI2jjP8yav9wvNf+scxwHfiSBxkJz7mMXCY9m5HW2MD9k3q1ZCXpf/xca
	QVD5zYK2neYUaJzpQuCtUPvC7e3DEVlpQCtuQEImdKA8o+0kCHj+MetrBVZGDC7E1MGTS7CuDAU
	PHRreMJjUcBpbEO8AAbn6qP9P7Fs8HoAIqhrQGZUqRI2BjuQTNAeXt/xt4kMVuw3fz4f5RvSGF4
	IoS/1hEhx3TXEFnY=
X-Google-Smtp-Source: AGHT+IEucjCv/ZxcaXd5GyJA2ecZbdJ6av5SouFnAQqExJ+55PXEaTcBHMsxfjnsHjSn8cF9Ar5BmA==
X-Received: by 2002:a17:902:e542:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22a8a05491dmr86855055ad.14.1743843617083;
        Sat, 05 Apr 2025 02:00:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877275fsm45447815ad.221.2025.04.05.02.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 02:00:16 -0700 (PDT)
Message-ID: <fc0f16c3-cc63-4f36-a08c-29c056938f02@gmail.com>
Date: Sat, 5 Apr 2025 18:00:14 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] formal: Mention code move of kvfree_rcu()
 happened in Linux v6.14
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <775f9284-0768-4510-a5a5-1b46f4369e93@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <775f9284-0768-4510-a5a5-1b46f4369e93@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Decrease of LoC in v6.14 wants some comment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib       | 9 +++++++++
 formal/formal.tex | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 9ec242e6..3ba2b11e 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -3539,3 +3539,12 @@ series = {SPAA '20}
  day="27",
  note="\url{https://bitbashing.io/gc-for-systems-programmers.html}",
 }
+
+@unpublished{20241212180208.274813-1-urezki,
+ Author="Uladzislau Rezki",
+ Title="{[PATCH v2 0/5] Move kvfree\_rcu() into SLAB (v2)}",
+ year="2024",
+ month="December",
+ day="12",
+ note="\url{https://lore.kernel.org/20241212180208.274813-1-urezki@gmail.com/}",
+}
diff --git a/formal/formal.tex b/formal/formal.tex
index 4348aacb..9a3b20dc 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -375,6 +375,8 @@ which was successful in locating a number of race conditions.\footnote{
 	pairs of vCPUs
 	(\url{https://paulmck.livejournal.com/62071.html}).}
 Linux kernel v5.17 removed the \co{RCU_FAST_NO_HZ} Kconfig option.
+Linux kernel v6.14 moved \co{kvfree_rcu()} into SLAB (in
+\path{mm/slab_common.c})~\cite{20241212180208.274813-1-urezki}.
 Numerous other changes may be found in the Linux kernel's \co{git} archives.
 % rcutorture
 % v2.6.15: First torture test
-- 
2.34.1


