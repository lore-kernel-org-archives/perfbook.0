Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YvCXtgBX8dOrCsOwiGCaqWwIh+bDE0vlNodl2oEn/3I=;
 b=iVqQP2rDH0thMFEyAr+UXW8Ob1F4t0d5K5Ma0y9J1zGn1nEj9TX64djhfsTRN+Mv99
 AX15nTI8pZc4Z5xGHnYXhbZExePQ973GGaO3KapZxKme5d6DDDgtrDQulKmf8QWUtDR8
 7vHgtesGObqUV/pOwZEobNDOTRaUaena+8qdbUYw1nhim74cUfO2uKdjMDKnXK1J67ki
 xauB+ljd316Ezdfnw8ldO+8STYfl/E7lUXfqrYuefPHorMZ6qsFnKyAKOmaTarGCKBZ/
 wI/u0+ypCSUdcwjzkHzQtE032LzQ+Gwdynm2mgXlC9LpYkUAUR8jqqCefP1saOO9Xv/p
 oFqQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] glossary: Fix a typo: hardwire -> hardware
Date: Tue, 17 Jan 2017 01:09:06 +0900
Message-Id: <20170116160906.22579-2-sj38.park@gmail.com>
In-Reply-To: <20170116160906.22579-1-sj38.park@gmail.com>
References: <20170116160906.22579-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index 4dde152979f0..8fdd9af72295 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -403,7 +403,7 @@
 	classic transactions in that they do not offer
 	durability.
 	Transactional memory may be implemented either in hardware
-	(hardwire transactional memory, or HTM), in software (software
+	(hardware transactional memory, or HTM), in software (software
 	transactional memory, or STM), or in a combination of hardware
 	and software (``unbounded'' transactional memory, or UTM).
 \item[Unteachable:]
-- 
2.10.0

