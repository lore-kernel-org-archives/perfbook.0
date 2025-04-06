Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C12C9D
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743935544; cv=none; b=JqG2ALrpx1vXFhTzTKZEOEm3gAaaWzzXH8r8iJsiWRybQC0lbHm2qMdD1PGQxCLhrNaFPMLycYgdQgpxOSWcrJTBLrcI794fq0RO8qSLOqJC98XJeaNdJJdsiSbfZ1zRixEHZx4873dQ3LqkVOBfSeu9E1rO2iCd+NAUjkZk6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743935544; c=relaxed/simple;
	bh=Vn6AYku427QNkdlMr9CRj2U/PL/syRDQAbrrKsFWc6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lE3Bq2WCy4jENO+4KR+QFnD3p+d8Rjy1phMYR4tahdSnQtfG95t19pH8VgI4fllZdZX9PMIjtdv38MaTFr7aAFSjeNaOiChiapKyywhqSVNhgAtC1+DBy1tNFR5bzXShv9s3yondNfLKK1fXphvO8mp5Zz6Wfqsf5cLPtYWqF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9iRxKf5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9iRxKf5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3016344b3a.3
        for <perfbook@vger.kernel.org>; Sun, 06 Apr 2025 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743935542; x=1744540342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pA0ZIecFTQBdrWT1LqiSNRcYg3oqDh2TVkwI04H3HY0=;
        b=F9iRxKf5moCe31W3Ed9bn+UQvUkwG8pMXP+53LK57xTZPIRoTPORoHroqFcyD97NpJ
         dZkeHaOiixM3CUf445zN5V4o+oVg/La4F/TY2CgX5+uUNkyr5nXHl2c0WD8LnaFNFuke
         7TSahhhBw42Jzo+K5VSWl42KOCUA8e15d8hlhthBBz4wf2yFVYxEzXFC0RnueSG7WPLx
         qs3gnSHcaNj+gjEbiIu+3N5/y9w2QskLbW/b80M4T70q1fiunWQJE3YGiUp+12eZX0s9
         PoOdOV0V4nzp4WQ9tfbTu5Vy8TYgRjFmZP+sjxZRRsj9FmkLP9IvrrgPOKiPqjT2pwdm
         I/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743935542; x=1744540342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pA0ZIecFTQBdrWT1LqiSNRcYg3oqDh2TVkwI04H3HY0=;
        b=XJku6sOLw9Wj/gSgPEE3DgMmNmhI7luXe8U5sY5Jlxt8f69GJeOT3Bw/gJH2Mb3snB
         2/dhmufxbCcF6AyAdbaZeU/H5gM7LvkvZz+HSHkHDEKqsI5bDVHuS/L/pNy5KwXD4LOW
         yu/8C2YSvVkchvPcb0SI6gN9xREHa3iWhNrvmjwy87ggBYZXC1WWZ/FfP9LnnQowMh/e
         /pOG1Fd8zHoGlbdN6TLnnsLuKtAco98z33/rKm7FGSQiXL/HZ75NFGNVLSLRSczuwWWE
         YDHzzWQxTSctbH+SGULKa0PIs1zupGHiqpj0JAlVgZl8aMUKsa9eo2efqAggZlPidItW
         bvcA==
X-Gm-Message-State: AOJu0YxxfLdL+Rp340rJtJZXtwyA0PNmqo2vpbxX6JfJJq8fUq/RMKvO
	xHnM5vGhPtNUD8QotbnD1o5U39ylLwM+E0kTzGpkktuHIwdhM8Yw
X-Gm-Gg: ASbGnctCS6TEh8F2nMG0YfoWwdpjBvuM0dgdTel5l5K+hhfiyljyp8XainnLwkhYmx9
	MWyPniqBlYY7Y6vN7E0Ynyh/5w4npBvNnX7gs65t+wA69N4VnnHNaK2YiNFrhm+KecrdgyinmeK
	mzZWU/Tz0HxJRZUiyN0b5kjdGtyMdvW+YnEkgNLFMKEQC2pcMGcKEWSHHOBR+FHKWL2S+tuGt2+
	FU0pIJOAfxdMXuApJRD8RQdCU17qLEYVVcgmDR//flCrbToorz+RXZNREBIh16MQ6S3vKVPjmg3
	ls8tzV2gZfFFxnfzsNMjDfndcvhvfoXVgDvi+Bm63OFvDaXRPrrBLsRfHmhK+jCrFTFGqfpvnhb
	P6OCLRl16YYsU+1QyRf5wnngTsw==
X-Google-Smtp-Source: AGHT+IFJIhHGpvHXGJmrKwickoK6INHa4Sn7dhqpQ7NqHwSiGA0Ljp3J4fP8Emc76MaVbwZ2os95ng==
X-Received: by 2002:a05:6a00:3e19:b0:739:4a93:a5db with SMTP id d2e1a72fcca58-739e4c1a4c1mr11725033b3a.22.1743935541827;
        Sun, 06 Apr 2025 03:32:21 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee781sm6458411b3a.42.2025.04.06.03.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 03:32:21 -0700 (PDT)
Message-ID: <415f0a22-e836-4e94-aa61-5028b3ea2d9c@gmail.com>
Date: Sun, 6 Apr 2025 19:32:20 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/3] cpu, SMPdesign, debugging: Add index markers
 for "thermal throttling"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/criteria.tex  | 2 +-
 cpu/overview.tex        | 2 +-
 debugging/debugging.tex | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index 17152a90..2e98174b 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -192,6 +192,6 @@ parallel program.
 }\QuickQuizEnd
 
 It is worth reiterating that contention has many guises, including
-lock contention, memory contention, cache overflow, thermal throttling,
+lock contention, memory contention, cache overflow, \IX{thermal throttling},
 and much else besides.
 This chapter looks primarily at lock and memory contention.
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 715084ed..eedf8491 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -345,7 +345,7 @@ wall-clock time consumed by that code has actually \emph{increased}.
 \ContributedBy{fig:cpu:Encounters Thermal Throttling}{Melissa Broussard, remixed}
 \end{figure}
 
-Welcome to modern thermal throttling.
+Welcome to modern \IX{thermal throttling}.
 
 If you reduced the number of clock cycles by making more effective
 use of the CPU's functional units, you will have increased the
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 832d27b2..0fcf4541 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2355,7 +2355,7 @@ to creep in, including:
 	Assuming that these sources of interference occur randomly,
 	their effect can be minimized by reducing the number of
 	iterations.
-\item	Thermal throttling can understate scalability because increasing
+\item	\IX{Thermal throttling} can understate scalability because increasing
 	CPU activity increases heat generation, and on systems without
 	adequate cooling (most of them!), this can result in the CPU
 	frequency decreasing as the number of CPUs increases.\footnote{
-- 
2.34.1


