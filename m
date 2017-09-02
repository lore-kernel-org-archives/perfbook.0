Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iogQbNUY+8U5HsZrCobmfHJckQ7cti2sIqVo5JH/A/E=;
 b=PGONgZIkPmDCNHfyyDTeA9Ejkkq1JrySASRYBFP2EAmjAKV2XBymRNKkRPHOVNFDK1
 Vb5mm3Gp3PLCGDiDua57WF8fBahNqS889IpwD6cu8jmFh1uxqzfMuRLyZbnNo2HYaZIU
 blrKbiaz2+If/icN+tRpZLdbQWURS8vtYJuG2rpboNgwgR34D8wXu58U1LFUtpZaYhiD
 OQhGSqnoZ6NXoRAL1fPjbgsWZg3iJyZvPwFWrfRtL0LQxBUVyqyIxS6iALrZyX06ERgp
 B6mNj5vYjioG/K6dEojBIuNMiRFPO5dkDxTCfYeU3MQuqJG2OxIL6qEvAM7fgtIDfNdx
 pNnQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] memorder: Add missed closing parenthesis
Date: Sat,  2 Sep 2017 11:49:37 +0900
Message-Id: <20170902024937.4227-2-sj38.park@gmail.com>
In-Reply-To: <20170902024937.4227-1-sj38.park@gmail.com>
References: <20170902024937.4227-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A closing parenthesis is missed.  This commit adds it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5e7176e..b3b657b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -596,7 +596,7 @@ are at most two threads involved.
 	ordering for any accesses preceding or following both.
 	No ordering need be provided for accesses between the
 	\co{smp_mb__before_atomic()} (or, similarly, the
-	\co{smp_mb__after_atomic()} and the atomic RMW operation, as
+	\co{smp_mb__after_atomic()}) and the atomic RMW operation, as
 	indicated by the ``a'' entries on the \co{smp_mb__before_atomic()}
 	and \co{smp_mb__after_atomic()} rows of the table.

-- 
2.10.0

