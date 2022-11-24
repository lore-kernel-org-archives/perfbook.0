Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316321;
	bh=olMHSjqNoZ/FXBWgrVUZHiXY+mscezTuvH3KudVxLog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lma3Fvqgag0CJJm4LS73HPEo5RzHAO4Xv1MKgPN1NeEh9yxVUaUfYwowqMVoXuxZT
	 oeFuXMednILBwVEMTyN6XSGNjObuM+57X69T+mYDAtZdsqmbvSmp5/LVfohveOv9/6
	 GnFW9ok69pqJS1dNu0zvOOwk87sdFMfYHaGoDDopMD3rRwZ2H0CbKNsIVEAtANett4
	 1oOtuH5ZKfWKIq8Nz8nCtZ6Uueu3BJ6CpTBe5DZ+X1Uc49Fft7lv8hRDOWt9EHMzTa
	 GIIvYRkZJp3QaqofJskfJhwSzqs575a/zhAgbYyZBT2PcPvZeLJ6m8EG3ZI4D04Awz
	 shCn15m0wbDSQ==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 12/13] defer/whichtochoose: Fix a wrongly positioned unbreakable space
Date: Thu, 24 Nov 2022 10:58:02 -0800
Message-Id: <20221124185803.8150-14-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

There is a sentence mistakenly positioning an unbreakable space in the
middle of sentence.  Fix it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/whichtochoose.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 489299a7..846c1ea1 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -347,7 +347,7 @@ in that order, and the following series of events:
 
 \begin{enumerate}
 \item	A reader acquires a reference to object~B.
-\item	An updater removes~object B, but refrains from freeing it because
+\item	An updater removes object~B, but refrains from freeing it because
 	the reader holds a reference.
 	The list now contains objects~A, C, and~D, and
 	object~B's \co{->next} pointer is set to \co{HAZPTR_POISON}.
-- 
2.17.1

