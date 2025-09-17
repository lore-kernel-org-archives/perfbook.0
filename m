Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849D2DAFA5
	for <perfbook@vger.kernel.org>; Wed, 17 Sep 2025 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758108512; cv=none; b=Sz4EnO515MgVpYK1+ax1MpTpvPtwSTyqDWHGQa9wLPtYXTbNJj+9g8wQGQLpBwBEZ6gS8sCShN7WV5melFgZJLl7np8jGdwx30eB7GiCY0ceYkn3dzPkg//NMR9Fk6QIktIe1iki1p6cHUNS3JJQ3Gc2RyJMUqeIsBucVVpjVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758108512; c=relaxed/simple;
	bh=CzmVJK2h458DblD4LqOI25a8nXTtIM2OsXAKOlqNb6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGeBt7NmfNdSvW4eoCwjzsnlKVt6YgqWZL57HTynY/JpbbMJiS19VS9pEKxSQ+bqaRCRB6osfQg73RzSI/q9+Yyg4SqKC6Sg+bXg0CvdF31LgVcBIYD6gKOk7CyRPmSSzMnIJUBW+DKiW4EhULug18cO66U6jVhBUgVIoq0PMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKUFBXEW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKUFBXEW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b54dc768f11so1686158a12.0
        for <perfbook@vger.kernel.org>; Wed, 17 Sep 2025 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758108510; x=1758713310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ab2v7R0LgnzP4Ux0EpT/Qjnx1oRJ3CNz25GuKUm+LAM=;
        b=ZKUFBXEWJa6WoD29vNZecZAYr0UM2AChhScAjm0Hoj+tZNs8zcaTWXkFGauCgREj1R
         intn3tXCJYwllozhjlzHxk90ULR8quxCwLYliW/0zZPjjx8yb8NE6Ex6x3ko+v+O0k3f
         +yGX7TV1MVs1wGjXApmc4J9094UDjvbNCNkmSHjsXU6qWJDGLXE5Z7eoc5pVA0HonpqL
         v8ubfsrbN8TsRjOQxZwHk3SD9ELmNxK1C6OJiIxhvfjwvIZpZsNwtLqHMDAFGjIyhNIj
         0HIbmBgsbt3nm2YWTkCc5xauZ+ijkJwwOLSxAbFCLRJ1GO4S0TAvY4d9Mj5XLb1zKSN6
         mvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758108510; x=1758713310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab2v7R0LgnzP4Ux0EpT/Qjnx1oRJ3CNz25GuKUm+LAM=;
        b=pmf+NMatEYeFiSpdmEvVd+UKHG8Cgw4hJ6aUPC+GelouIi8KnWGF3u0I05dz5snJzI
         SmOwG65sWwbf3pn7k5vdmV8z625FdW/DWIvy9EVA0yo5j78xHes8Ya7oWZV2thPaOada
         vuFkkr1XboMhrSLLZytJxIdD1tukj9p8UcRSZ1zXXRQQM7UCySoNRMP2D6U8/JLnjBop
         PIsZpHYB/JMVVbHfNDn4b+w8QtfnE7pgOrqOceHc4jtjOupo3j+mSfk1MmfKV+TKAM5b
         qv9wInmbm6LlSz8nV/w3Ycpy6EkwQyhwyMj4FWFMhiuCpu85jmWioOKYMubwTuzOyVLk
         2Mkw==
X-Gm-Message-State: AOJu0Yzs3Euc76PXMnf8Ydz78/7WDrn4m8i5ul1Zn+hxdbOT+Irn0SZp
	Lax0fM5l8l3xq6rgL0MMOvSvxl4kYZx2ZbdxCF1ziUw3fL8lN8ukdIFD
X-Gm-Gg: ASbGnctOYgD9llorOiPs18oJf0ai6ozZVMi4A8dSLb6U2gxqGGg6wkhwjxVURBGrzuN
	6iRpz5Rhb1l+q+xQwIXf4ds4rM3kK9c7fIq6v+15xXujizCNCegmKG+3saE8AF4s6pRzRFKI7Nf
	FvSRmxA/4IlNSVlKS4M/NX2c97D4DnhC+tfW78udnGDqKiRiFBLsVNNLPE9dRHWAoHUJKTaogzD
	gt8ut+z2rEJ+iMU/BTizqnwNdeYNBtlrFaBjS2RL4SKywH2YLloSZQtpB8m0fbaAkMK0QliXWIW
	WRnv+54UFJ3ALpE0nR7Gptg7IUzvg61m6ewk37mwl8YEoSnBEuGUOpa6kKyu5S7u4aUMOEU+dws
	2S6hZyJ9AE4b8gSCU8yatGJiTfMmsSPcB2hk88s9QASABsyQZRxa9h7cjRqoJxprt0U/F
X-Google-Smtp-Source: AGHT+IFlqGLmvneug7YSTcbQgXF1XP/ReRMZYfhTXJ6edZNWfNwGlS3QU7PB+cY6QNcDMLITIE0uyw==
X-Received: by 2002:a17:903:1988:b0:25c:8745:4a58 with SMTP id d9443c01a7336-268118b9393mr18432325ad.3.1758108509805;
        Wed, 17 Sep 2025 04:28:29 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3303ffe611csm1129085a91.9.2025.09.17.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 04:28:29 -0700 (PDT)
Message-ID: <4884acc4-63b4-4b6f-b0bf-c236c193e2ae@gmail.com>
Date: Wed, 17 Sep 2025 20:28:28 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] advsync: Add narrow space in front of percent
 sign
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <4e1e5582-219b-4021-ab7c-efd8d34a20d3@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <4e1e5582-219b-4021-ab7c-efd8d34a20d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject: [PATCH -perfbook 2/2] advsync: Add narrow space in front of percent sign

For consistency, as described in Appendix D.2.1.4.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I think it would be helpful to have a macro for this pattern,
say, \pct, which can be used instead, such as:

+	latency $T$, then a 50\pct\ idle system will have latency $2 T$, a
+	10\pct\ idle (90\pct\ utilized) system will have latency $10 T$, a 1\pct\
+	idle system (99\pct\ utilized) will have latency $100 T$, and so on.

Or, make it a macro \pct{} that can be used as:

+	latency $T$, then a \pct{50}\ idle system will have latency $2 T$, a
+       \pct{10}\ idle (\pct{90}\ utilized) system will have latency $10 T$, a \pct{1}\
+	idle system (\pct{99}\ utilized) will have latency $100 T$, and so on.

, or similar.

In case you are wondering, the trailing "\" in "50\pct\" or "\pct{50}\"
is needed to have a (normal width) space after it in the resulting document.
This is the same as those custom macros such as \Power{}, \ARM{}, etc.

Do you have any preference between 50\pct\ and \pct{50}\ ?

        Thanks, Akira
--
 advsync/advsync.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 7342e323..31731f61 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -458,11 +458,11 @@ largely orthogonal to those that form the basis of real-time programming:
 	As a rough rule of thumb, latency increases as the reciprocal
 	of the idle time.
 	In other words, if a nearly idle system has
-	latency $T$, then a 50\% idle system will have latency $2 T$, a
-	10\% idle (90\% utilized) system will have latency $10 T$, a 1\%
-	idle system (99\% utilized) will have latency $100 T$, and so on.
+	latency $T$, then a 50\,\% idle system will have latency $2 T$, a
+	10\,\% idle (90\,\% utilized) system will have latency $10 T$, a 1\,\%
+	idle system (99\,\% utilized) will have latency $100 T$, and so on.
 	This situation means that many latency-sensitive systems will
-	actively limit load, for example, to 50\%.
+	actively limit load, for example, to 50\,\%.
 \item	In the not-uncommon case where a given computed result is nice
 	to have rather than critically important, use of timeouts can
 	cause a blocking operation to have non-blocking properties that
-- 
2.43.0


