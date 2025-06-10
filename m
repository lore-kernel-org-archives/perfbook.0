Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4C27FD67
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552188; cv=none; b=XtWK8k3DOpI1UxCZV/TxsVKuq2Qtn5xdC0prCr2OEafVky6+/r8/KM4Ga+3lpLXbbsHBsKY7BP3NN230CCJ8fB8TTjIHTCryGPayZCDc184dwlaChowgsKg7tCECtlywXNUfa4azRwEpPmLOdP0CLRSEPuE/Qlvgfd9RRRy/0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552188; c=relaxed/simple;
	bh=Ebgkw4knWNb/sxqIND3G4olPxl0PguisuNvijcmgXkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfAvDxnsv6xb+WQjy0ZsmMIppiW55s4Z2KCz/vHKLFqqHfr2mKQXf3j3VMPL/xLLPc7QphNPt8gx/GlgmP5++bmTSyVLlZl8Bq/kduSCEoHyihbIQ5BUW1iSSNLNhcl4t9DZPDo4Cp2wfU9ScmZ05zp4i4cvS2JqdehnL40CR+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgaaCSuK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgaaCSuK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fba9f962so4476074b3a.0
        for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552186; x=1750156986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57662UsNEvRijSWOF8IRqWojGI3z0yd3GC/LRQpr3Go=;
        b=UgaaCSuKE3UEVm+fkaMj9ze+eb3twCefP/Ys1Yq1v/yAIjRC2RKLjIhgy81GLPuNF1
         F6lgWd2PTLkp5ChWk5cfDnOao3siiYUCUDwyGXrRM+aAN9E/h93Lnqco8MDxngqQcBwD
         EpvlDv7tfcfvhoqHmXBlL6tqmThYuo6y3Kg2aVGV64+dN5yNM8vjKQE9+9keK2AC7tJW
         yEeKxjN8lybRBKYW3hiDQ85zOBzhTLV8LyjEcSXwbhRxdUyBCz7g0OIsjfuxLts0b7d/
         1g7dQaIpHlPfq8euKrSB9H3VYS5YeEEb9dAylbbu7rGgYLb8DDjn68uRHuHiUz0FxMN1
         25yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552186; x=1750156986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57662UsNEvRijSWOF8IRqWojGI3z0yd3GC/LRQpr3Go=;
        b=xMRavoMG4X10uAuxcZQmJnPhW/w+0eHTjgM4N2kjl3wjbwq9lM4InRqjchCi7pkFmg
         iccd93DhRAx7soLocA6WWPysVIsd4Mm4WXY8Kw2u3dVc/8bQ34FL5qo20ysUk8+BuIoJ
         yApXzU9AID7GWAc3+5pcx2v7hfwCX2JULtr12pqw3a94d6BwVwKThp8HcD6awO/794rM
         QFP2fBN6Z01eJhBvWNwwVO6ddt+iD15y4ThaJkFIaXNldu1HoIRTBtAFmuVmXrx1TzkL
         OHz5sgSXZ3NLI9S+TA4SKapasIckwri3BZCSloUniDzNoViM32g7503tYWm5KjB8EKhN
         1mtg==
X-Gm-Message-State: AOJu0YyuKpk/VZrz5ITFy21ysI2HKGWfpBSoyVeGBWGlU3B8/5q7J1BQ
	YXEOeQ8oMWjAx/ABZTSwwNWJCZae1+x3GCpnOzRc/d0jE+dRWucxMx4bnnJzMw==
X-Gm-Gg: ASbGncvuIlYXudZvTLya/Ka4RIPiGhJX8Bmnek5SsemjtZ7xySI1s/xV/VvH6VBxaih
	kQ6CJA8VCub9d1Iaif/7/0V0pNnqAGHaslAZ6j5wD7a2aU1aSHZJAMKdaHmTVpckL0MjCOXsu1t
	oT3jNenotlKaltg5IplFCjJqH5CMznMvKobzphqKZwH6gMzBPBeRSXsJsMZfw2aOP3gIVBFk5FQ
	iSizdYLAa7UdPdK71UBe60Xr5aG2oUmUnUvStxf0joI5TrxmjoGgbFv+YfEw2frFef5pSY0Tb+v
	EffkGsjABr7Oi1Nv8i9gatGCWK9ZO+nuRYsTLFzasxNpBchPml45QdDwNkNYnLHRoLxz1zDYb+G
	MRHAsct9KufXkVmxSzCUXF4JF6oz84XCJ
X-Google-Smtp-Source: AGHT+IH168+TCrvS7SRDHg/ru9/yoIrSc3PHjNyKG2AnXyjO6XPckzMDRCpKZvS2BDeEhQ4hWt9hmQ==
X-Received: by 2002:a05:6a00:c88:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-7485ea7097emr3802153b3a.8.1749552185878;
        Tue, 10 Jun 2025 03:43:05 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c061esm7161340b3a.117.2025.06.10.03.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:43:05 -0700 (PDT)
Message-ID: <3abfe662-887f-451c-9e7a-3450b7d815f7@gmail.com>
Date: Tue, 10 Jun 2025 19:43:03 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/5] toolsoftrade, count: Adjust shrink ratio of
 tall code snippets for -eb builds
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These two code snippets have become shorter than earlier.
Adjust their shrink ratio so that they can enjoy ebook's page size.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex               | 2 +-
 toolsoftrade/toolsoftrade.tex | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 754c4dd7..46b20e86 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -997,7 +997,7 @@ converge on the true value---hence this approach qualifies as
 eventually consistent.
 
 \begin{listing}
-\ebresizeverb{.9}{\input{CodeSamples/count/count_stat_eventual@whole.fcv}}
+\ebresizeverb{1.0}{\input{CodeSamples/count/count_stat_eventual@whole.fcv}}
 \caption{Array-Based Per-Thread Eventually Consistent Counters}
 \label{lst:count:Array-Based Per-Thread Eventually Consistent Counters}
 \end{listing}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 097c18d6..616a21e3 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -479,7 +479,7 @@ lock~\cite{Hoare74}.
 }\QuickQuizEnd
 
 \begin{listing}
-\ebresizeverb{.85}{
+\ebresizeverb{.91}{
 \input{CodeSamples/toolsoftrade/lock@reader_writer.fcv}
 }
 \caption{Demonstration of Exclusive Locks}
-- 
2.43.0


