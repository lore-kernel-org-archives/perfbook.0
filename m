Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622E62139D2
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229840; cv=none; b=Hu+QhjLr5z5VXkUULkYo5ZXjTmxxrrinv1AYJBjOXY+9d1E/jzZQGOhgZ3ZTLjR3yAwk9ACNH/Oe+9w3RMvHIXVFwFXD4wZkrggSKJxRqjzOcbZ2/bwH8mDvlxfo9GvgoXBYgCsbQXb2u881d54XOSaDykzfG9gtcoH2ol2zwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229840; c=relaxed/simple;
	bh=gTuSJ61mbWFY1AnhmCHAgWghm0vkdJF56wkR0AXAXPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4dk7NLcmXad6ZUcglojXInGZDbESrIat22OavI1kQE91hcWmla+36SrOjfT/zMxHLprl5ZluSJntZlt2+JCdw8kmY0jpgGhzi4enHICf5heK029MkHGaCB1qIXnCrt1gLeKtD2OXAyfv8tecQOqcINuEcO6X8s0AJ0dfnxHTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+cMkFz/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+cMkFz/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30332dfc820so4544911a91.2
        for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229838; x=1745834638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdyGR0q9pWCat1rqCvtRBrRkma4Yn13Kmr7+N60PYnc=;
        b=Z+cMkFz/WF+vv9aViNIaGQhr0BhyEtUJMGS8ZEXIaAmLpzgfKsz3eiZ99t2iY6l6XJ
         xq50A29L7M7QymlJYAqdIGyjNBoRKtIrsjrhQNa1SY+x7sOs9xie7LfdbqpWNGvCgByG
         1f+kD9OD3I/6djgFI9gD7ZcPvHn1PmzUtAhfCLhNJW0aPWD6lI51aerV2yRRz3ugnl9D
         IiXcNfW91jnk0pnab1VF/i6kMQ6sFkDn7lY6IH9ai7m+NJfZcbQhrTNxOD0rpcox5nd4
         Rgev80Y9278UhjvhHys/USzpbLUmR2HFX//zh3geWDoZrKJt/w/Y1bOmQf63qB1mwm9o
         vPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229838; x=1745834638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdyGR0q9pWCat1rqCvtRBrRkma4Yn13Kmr7+N60PYnc=;
        b=aCK9r1KB+/i+GeU7JFgFoV6NUkOmgjp1B2/SkcHHZhKqqASwbeuNVGpWZIwb3DXpMn
         fl/tzc1R63TgXyYNa041kMmUxixQrvhuGLdOC2vK1MNwD6lpKWndgwaD1uJzWgWiD6S5
         Bc3JpTifXBFKhOG6hOQrhnUvuVR6KKqeXON4wJp7xe1BOL4ALFdhVk0iCskoTxhc5zlV
         6zOXXnJ8VomDOpvzYQlECJHgvTrwU0eTXJBqGueLRli2Ky6GvSrab0no376vY1JPlTSm
         iX78xcq/n1s7g89CwDuwBqWe57k10C0apucBLUXSAz22j9Z9x3NLyHM6AdUvluR1mogQ
         4Llg==
X-Gm-Message-State: AOJu0YxuqNargcgYrBtLa2g5EgEzASodAo3NJ091KKuu4bcLStnxoU/I
	PqPkpQ19jtmcdgeusdfCB+cCiGhZH+9zBnp1M1GO0VKLiB6zB79G
X-Gm-Gg: ASbGnct9pYy1fy/Og7n+TXxGeCZsknVBt4pq0vD2jDsZpxpwWCUaA8UcZwoe8+a8wKu
	uTZhPmbFgzag0TmdJdcvnT28wKnOxBMeiNqGTsOx6ctDAwxIi5no1V68QJeVtF36U5TvfZaXUQo
	Nu/XVfFLqE8HNNsTwOLUGPoyYZ/Ucp+QiPi6LNuU/WjANQgdC16Y2B4npfhjvWrHwYflj7pbevH
	ZA/Lsfit5CJOs3rZvh7IyRg1ZazDYDoa8KpoZRDmyuctfFujr93qSUPRSK0zqeiWwXOdmrnGuti
	9q0Mm+HZsX1c+lxrE/NGokPJGRDvHFJde/r2xk43+DighZC3bx4Bh62m7wStqHqROzlr4YpXCBC
	SzR7q6SF3uUKvsysb44KiZA==
X-Google-Smtp-Source: AGHT+IES8FlYxtU+MpHVKvikcyt9RXAP3QW/et1A6w0Hs28FNUX27HE30v4mzmkw8YL7RR/b5Yr0Kw==
X-Received: by 2002:a17:90b:2f48:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-3087bb418dfmr17970164a91.7.1745229838570;
        Mon, 21 Apr 2025 03:03:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe055fsm61686695ad.253.2025.04.21.03.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 03:03:58 -0700 (PDT)
Message-ID: <54fc239f-5574-4a24-8a4c-6105e552140a@gmail.com>
Date: Mon, 21 Apr 2025 19:03:57 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 5/5] indexsee: Add redirections for arch specific
 memory models
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
 <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
 <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 indexsee.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/indexsee.tex b/indexsee.tex
index fc2042aa..fe57094b 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -5,12 +5,15 @@
 \index{Single-copy atomic|see{Cache coherence}}
 \index{Single-variable SC|see{Cache coherence}}
 \IfIndexHier{ % effective only in two-level index
+\index{Armv7 memory model|see{Memory model, Armv7}}
+\index{Armv8 memory model|see{Memory model, Armv8}}
 \index{Address dependency|see{Dependency, address}}
 \index{Anti-heisenbug|see{Heisenbug, anti-}}
 \index{Associativity|see{Cache associativity}}
 \index{Associativity miss|see{Cache miss, associativity}}
 \index{Bounded wait free|see{Wait free, bounded}}
 \index{Bounded population-oblivious wait free|see{Wait free, bounded population-oblivious}}
+\index{C11 memory model|see{Memory model, C11}}
 \index{Cache-invalidation latency|see{Latency, cache-invalidation}}
 \index{Cache-miss latency|see{Latency, cache-miss}}
 \index{Capacity miss|see{Cache miss, capacity}}
@@ -24,11 +27,13 @@
 \index{Full memory barrier|see{Memory barrier, full}}
 \index{Fully associative cache|see{Cache, fully associative}}
 \index{Grace-period latency|see{Latency, grace-period}}
+\index{Itanium memory model|see{Memory model, Itanium}}
 \index{Linux kernel memory consistency model (LKMM)|see{Memory model, Linux kernel}}
 \index{Memory latency|see{Latency, memory}}
 \index{Memory-barrier latency|see{Latency, memory-barrier}}
 \index{Memory-barrier overhead|see{Overhead, memory-barrier}}
 \index{Message latency|see{Latency, message}}
+\index{MIPS memory model|see{Memory model, MIPS}}
 \index{Non-multi-copy atomic|see{Multi-copy atomic, non-}}
 \index{Other-multi-copy atomic|see{Multi-copy atomic, other-}}
 \index{Process consistency|see{Memory consistency, process}}
@@ -43,6 +48,7 @@
 \index{Write memory barrier|see{Memory barrier, write}}
 \index{Write miss|see{Cache miss, write}}
 \index{Write-side critical section|see{Critical section, write-side}}
+\index{x86 memory model|see{Memory model, x86}}
 }{ % effective for single-level index
 \index{Linux kernel memory consistency model (LKMM)|see{Linux kernel memory model}}
 \index{Process consistency|see{Process memory consistency}}
-- 
2.43.0


