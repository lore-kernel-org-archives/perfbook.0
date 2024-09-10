Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69141DFF8
	for <perfbook@vger.kernel.org>; Tue, 10 Sep 2024 00:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725928299; cv=none; b=DmWPQgf8SyBo3XU35YJ3EIKJiUTCovBcWcV7vylWKa7C+uqiNDroSCt1ThQ2NuFHhi8xylFPzjbjjJJsFX5727HtPafs85wFfy1G6Y+S/Ovc3nvRMK49WwvWYfWviQ9NOxC6oZ3ePwdt1r/+eiRGyV9/sB4uu20QIgX1AUu/4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725928299; c=relaxed/simple;
	bh=iPV/TwzJC0/pvwO/AF2cNjsTCDssKsYiqESIe9ym5hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFdck9WVvC6avgBOviWimIF9ZhykSpO+sSiGynKXaP0lpe8psd+wNS9k+WMy2NrINQmZy9qwG1cOcxb3Es5F0YRa2LBwrPs8K8EABxSEyclAP5AYehW8uqcnegGsTp0URn/3vCoeIjBSU8OXdieKEsX0tEots5ELFi5ehpQ2uM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bT3yzZJ2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bT3yzZJ2"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso3471728a12.1
        for <perfbook@vger.kernel.org>; Mon, 09 Sep 2024 17:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725928297; x=1726533097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=puASjAXNV9weg5NK6QqKsTD+JgA5sOCvLFE4PaHKhP0=;
        b=bT3yzZJ2OeV+DTriJFhvBEyvW8AhP4kM4wz4hD8SeruSrYdXz/QLw5iejaAOcDmhgv
         3EHFn+JvzntVF7HVa9V5EOMrrVYOWDJbr1sDgGn6ryTSbgjKwkTNyOX4Q506wNNHbh5p
         ClLOp2Sbn9OT0VUTMQ3Az6a2avqqqfFMFBCO6cUEitWzApz/obsO/q3I2TYEgzGVyWd6
         tPeKNa0urugDKWfD2kyA7WTozsDMcmg5WGrp0FgmIf0Eq68LOyd3Ixgu/Lh1Ryl2mhzO
         QVE5mHqEPTnGST9EfLamAY9USSyH0mbMyX2OICBarQ8XPNbR1EKLW4aS7Cknk3lR8ZPs
         Y33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725928297; x=1726533097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puASjAXNV9weg5NK6QqKsTD+JgA5sOCvLFE4PaHKhP0=;
        b=M0cpogYF1kUdNP+zWXTUmB3Q1UeyXQYDyu/OANYQtc2FbTHNt83WNaN9WdhWlAaMBg
         Tc6yFovzTyrR7oUAT5nsCPLRDmcLmx71zOQzjj6ol8XyDOJZAdNIGD2qkvpMdayI7YPz
         i9Ej9pieIay+W/nuShZurKazYnEgCEJkni0fZJDAi/t1ylkEBy5YQ/a6Sab4doib8xlU
         0nybFhCtugNN9e7vV3BCTBQtJP0cNGxyqWbXpE/uo922zX2CZAKSNKWslIb6Vlo0GW17
         39nyE1tp+pTLsBsAYRhxe/hYW95yVFY8wfJYfpdmKwsUtGRWo2Ie4e8Zw87G/EmXsnLU
         JrOg==
X-Gm-Message-State: AOJu0Yyv0MA7AJVg1wPzD3J38Zcr7Ac2AYhkPCeC7c+EYfPj3cr0AZcp
	1j/H///MYcimrv2KqdwL4GmN7deDDq+i7bfoxk0P0JA+OWYyMO26axBfqg==
X-Google-Smtp-Source: AGHT+IGqDcMP2ekEIdcTTI9jdGMBA80WnFIpzxRSh4eAyGKi04a8hNGMBLtWJe5eq60G7e9YKfBkEA==
X-Received: by 2002:a05:6a21:3a4a:b0:1cf:2949:2864 with SMTP id adf61e73a8af0-1cf29492985mr10130083637.5.1725928296988;
        Mon, 09 Sep 2024 17:31:36 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe37cbsm299014b3a.74.2024.09.09.17.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 17:31:36 -0700 (PDT)
Message-ID: <ce16ce00-dfc6-4bf1-b7e4-f0a6934d32e3@gmail.com>
Date: Tue, 10 Sep 2024 09:31:34 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] glossary: Fix warning from "make punctcheck"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <be9a8fe7-b63d-4035-a72d-accc88e69309@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <be9a8fe7-b63d-4035-a72d-accc88e69309@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

"make checkpunct" says:
Hint: Break at end of sentence or mark mid-sentece punct as such (xxx.\@).
./glossary.tex:158:	overlapping categories, for example, read misses vs. write misses

Fix it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index 1811c5cb..a7bc20cb 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -155,7 +155,7 @@
 	in other CPUs' caches (``write'' miss).
 	\end{enumerate*}
 	Note that cache misses can be split into multiple partially
-	overlapping categories, for example, read misses vs. write misses
+	overlapping categories, for example, read misses vs.\@ write misses
 	as opposed to the above categorization.
 \item[\IXGalth{Capacity Miss}{capacity}{cache miss}:]
 	A cache miss incurred because the corresponding CPU has recently
-- 
2.34.1


