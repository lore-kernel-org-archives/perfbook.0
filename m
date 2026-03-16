Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947F1C862D
	for <perfbook@vger.kernel.org>; Mon, 16 Mar 2026 02:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627275; cv=none; b=n1r2n8Bq3TB6/CX91iOUskj9Q3mFlBC5J7vG90nG1FOuWpgVBOIWKbLR5ycdS2iAzJnNsWKeyr12a4usTuFocdFndhXrvK+pekSz++KbxkZUGXHjyk02NnpUZQlIKJLGiKF7RC33tRzw1entof/I+qK8Q9xmxQS+bHlyil2Nx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627275; c=relaxed/simple;
	bh=FKyp7cxdCsDsE0R/MV6Nk5B0SsO6cGMgEEDO54wTf0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ea/Dz+67JSgw/LXwWh0xxP9uUgdqDW2gC1GxWDA8jy6V/mmuGkdLzBp/UWXarXuHL0KF2ebEyZs7M5JbM4W5lrPnNtzyrWryD+N4X6XLnjIYkypuKyiQHsUMGFDTuVw9MfwxksWoZyksoQMbsQF2Rmp2gg0mM3enJ4FUKcQb1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miBRzmV4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miBRzmV4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48529c325f0so28466715e9.0
        for <perfbook@vger.kernel.org>; Sun, 15 Mar 2026 19:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773627273; x=1774232073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+A69rU06q5fbTUSf4s7n1JJLT91AY1nMIi5OIx1kjE=;
        b=miBRzmV4luQCj6/cVFsQVmdqBLwp36pPTPQ3Knap4JGmM0QEEejOTWPIXcvfPWlMsi
         H2w/0PaTcpgMRjRTwWxNYZ4rfUwLkO4WFpbWbRHEIJEOqSwm5DS6M95qQszeTNl+Ll6o
         tSfFT1hKVcz/aqbRZyHbDu7tVDfUSE5MyFIjSnhSeiEBMwTwQFY54X/0wHkkk2mPWgN4
         jxq/uZ0zH36wu6eqptzjbJU45UgXYuD13uD9MvZ3YxNipzXt+XUcsCtn5ruiuUzQuSN1
         X24zPKBXuShTPvGuyJfxjUMSE6lKCZciIGVjrpYKhjFVTfxZe9WFObhSHvfMPPIozJM3
         NGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627273; x=1774232073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+A69rU06q5fbTUSf4s7n1JJLT91AY1nMIi5OIx1kjE=;
        b=JyRickNsDY+0xww4Sj0Zo16YL4yI8jchszuTsaP0KBG8yd9XSUERAW4uyjYw6XzlVu
         TGfM6wNRWaGmHDzYilImpL+zPz2SPiXuglQLREjs3rLOxoMrRvYOxW7RHiWfbh8fKM7z
         Fjkt3yzlh0cuAGj5LQ8aQNnvgy5RRfKqjd97tWKRFQsJCobC+nHak02UqFYzl2WM+wpv
         SUjeMiOGSQI0mUMOZNBYPyWvkIPJxKvo0sIFPTM7li1Kaa379U7fiOFuY6Z9aIWffzLn
         Hmp4Nde9QGrYOI8j1cszFUMGQiD5Ghml75AETggbcffIKe9RbJtWJubZkC5LqRkzC7zC
         y+xg==
X-Forwarded-Encrypted: i=1; AJvYcCVlugMZXzZ290gwkVE5WWUHOok/U0b7qsZYKCUP8vRswHHbN/F2G7FKYwR3tyy6ksb0v0W4/fagAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCABVL2yrTAW5aklQm1Vl3F59YX98wGAPrW0pkzCDLWE9xKx9D
	LqYZ+gXrjCcFvrr2zQXKzinnoREizbhNCtCZs69HGbcWslv8dJQ/vMJMUx8wuWnJ
X-Gm-Gg: ATEYQzx72pbGxksq+tJMUsx0JrZsucMxVW8M0PCONdq7qxqxLOHYwhWYmm8HgWWEvQi
	Gxk3XbVX3IA3JhxirCIC7VvHuFZe+CquGWIT18UzbMmuK0SN8TXCafL+398OP2UdBnr8FaTFiIx
	iiEIpu/xn5po+bpsvc4UV7RGkVABh6mRawl/tMZeI5hmiNBCG+fmYz5JGKM3GTL8HWr+VEM8pCv
	Z4dEt06PwA7ZxpQ6Z3qMHDt2rOHwfWrdwGSvgWxLY/oTqtRE2WBEmtK5grdroy73tFvC13iaYRj
	8kdMLvUtLY6FtkcJA9wkwG876FiI5lvFxIyWejRANLyXX0GBVcQy3AKQWRvHqU5AnkgDBTffG3x
	KA2uCwtWrd06yEOYWt3ftzWfWRqCrG9Z567vEDmutSQkPCmmlqq/9+jhsLgYyvK6mA8uhaLsCNa
	AW8RmFeh4uRR+b6QyKU4jTXLZOxf23GxhV8p4=
X-Received: by 2002:a05:600c:3b25:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-485567029b6mr195488785e9.23.1773627272364;
        Sun, 15 Mar 2026 19:14:32 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:1b2a:fa01:9944:6a8c:dc37:eba5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fe27sm408881535e9.9.2026.03.15.19.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:14:31 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	perfbook@vger.kernel.org
Subject: [RFC PATCH 1/1] SMPdesign: Fix a typo
Date: Sun, 15 Mar 2026 23:14:24 -0300
Message-ID: <20260316021424.39111-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

philophers -> philosophers

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
Re-reading, found a typo accidentally. :)

 SMPdesign/SMPdesign.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 246182c2..0d94ec3a 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -19,21 +19,21 @@ The word ``design'' is very important:
 You should partition first, batch second, weaken third, and code fourth.
 Changing this order often leads to poor performance and scalability
 along with great frustration.\footnote{
 	That other great dodge around the Laws of Physics, read-only
 	replication, is covered in \cref{chp:Deferred Processing}.}
 
 This chapter will also look at some specific problems, including:
 
 \begin{enumerate}
 \item	Constraints on the classic Dining Philosophers problem requiring
-	that all the philophers be able to dine concurrently.
+	that all the philosophers be able to dine concurrently.
 \label{sec:SMPdesign:Problems Dining Philosophers}
 \item	Lock-based double-ended queue implementations that provide
 	concurrency between operations on both ends of a given queue
 	when there are many elements in the queue, but still work
 	correctly when the queue contains only a few elements.
 	(Or, for that matter, no elements.)
 \label{sec:SMPdesign:Problems Double-Ended Queue}
 \item	Summarizing the rough quality of a concurrent algorithm with only
 	a few numbers.
 \label{sec:SMPdesign:Problems Quality Assessment}
-- 
2.53.0

