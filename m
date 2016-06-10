Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=a5mp6yAuIpNUXWUi6jDrCGXu0vFuKDRinfYC3wWHt4g=;
 b=emsn8SAJCwLFEUKhB4EHsAbv7dcGIjEkUb/xZ4QQbn4dYOJK3Sb1zqHKCkCGpRyFn7
 lAMEaY35vbdHvYdM+vYGkl52QCaBQMARs5Bm/pG7JRhCOWvZFaloFT0JUPRbVJHBEj7o
 SBU5ndwVTHcREzWcSqR3Yusj2LSGz6sp1NyTvhRmeC8GGbXO+zgGcSJZW3cAoOBThJjZ
 Idp9ZWTvANPAdQ9K9LThc4tTzdQH7CEXdCJqapRwgtnh3xLxQvLf6jZE9y2IbdO3gRxo
 EFmrxgsbWkgCmLivWRw47AAFdgXpybg9zlKHheytObrh7dxOe4BEK1UEdx92N96P3lvS
 RVWA==
Subject: [PATCH] Makefile: Possible fix for warning of duplicated target
References: <e1642a9c-14f1-6cfe-e4f5-7d726226a952@gmail.com>
 <20160609161719.GD3758@linux.vnet.ibm.com>
 <1b014e28-b9f0-4b0d-8c29-f0a04c0a39f5@gmail.com>
 <20160609230756.GK3758@linux.vnet.ibm.com>
 <a3c95150-6bf2-df10-ec23-5399175d5d56@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a30d1a2e-88e1-b75f-a3bb-21952c06f46a@gmail.com>
Date: Fri, 10 Jun 2016 23:46:27 +0900
MIME-Version: 1.0
In-Reply-To: <a3c95150-6bf2-df10-ec23-5399175d5d56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ad4c29bc05026135cb56f66e79585b6788c2a3aa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 10 Jun 2016 23:26:01 +0900
Subject: [PATCH] Makefile: Possible fix for warning of duplicated target

This commit fixes use of flavors of variables in Makefile.
We should use "simply expanded variables" for variables
which are referenced in definitions of other variables.

Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 446c5f8..b508e61 100644
--- a/Makefile
+++ b/Makefile
@@ -5,29 +5,29 @@ LATEXSOURCES = \
 	*/*.tex \
 	*/*/*.tex

-EPSSOURCES_FROM_TEX = \
+EPSSOURCES_FROM_TEX := \
 	SMPdesign/DiningPhilosopher5.eps \
 	SMPdesign/DiningPhilosopher5TB.eps \
 	SMPdesign/DiningPhilosopher4part-b.eps \
 	SMPdesign/DiningPhilosopher5PEM.eps

-DOTSOURCES = $(wildcard */*.dot)
+DOTSOURCES := $(wildcard */*.dot)

 EPSSOURCES_FROM_DOT := $(DOTSOURCES:%.dot=%.eps)

-EPSSOURCES_DUP = \
+EPSSOURCES_DUP := \
 	$(wildcard */*.eps) \
 	$(wildcard */*/*.eps) \
 	$(EPSSOURCES_FROM_TEX) \
 	$(EPSSOURCES_FROM_DOT)

-EPSSOURCES = $(sort $(EPSSOURCES_DUP))
+EPSSOURCES := $(sort $(EPSSOURCES_DUP))

 PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)

 BIBSOURCES = bib/*.bib

-SVGSOURCES = $(wildcard */*.svg)
+SVGSOURCES := $(wildcard */*.svg)

 PDFTARGETS_OF_SVG := $(SVGSOURCES:%.svg=%.pdf)

-- 
1.9.1


