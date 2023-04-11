Return-Path: <SRS0=iPZS=AC=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681230497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLnRCpBDTZE2dNd81rITPWIWLI+A7qYfh41+8jscX9E=;
        b=ETnPvRLAML73OU88JttEUoZ9NeoBUSq99cUyxRdumn7aumhcnKzDlfLeUYgcPsX7um
         gwe5a8YOpeCTnJHCo4gmr3OtNDfE/CmuJmsH6i+BHkv4sZphQW9ixZemhI9rFfbNWiDt
         2Hok3ClzMFrROXE65jKkXV0pWh5lw5wXXEH7v2XipvKWpAgqkbc+wpLcq09iAZ6ZAoDY
         5v4CIdJ035M337W9GTyP3cT2jvyZXLwO2qy7MSF5DjzjYnzlMAB3bjlStr3Z5SO0kX47
         1xaD047mlS+HRCoXMlfaxxP9rJDX7lo13jMirVbfuuWJReCrox3ZTRaX2kSVRGSEOYHu
         G4cw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] SMPDesign: Remove duplicate item
Date: Tue, 11 Apr 2023 12:28:05 -0400
Message-Id: <20230411162805.1343469-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 SMPdesign/criteria.tex | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index d3d84506..bc4d3a77 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -145,7 +145,7 @@ parallel program.
 	The larger the gap between the number of CPUs
 	and the actual speedup, the less efficiently the
 	CPUs will be used.
-	Similarly, the greater the desired efficiency, the smaller
+	Similarly, the greater the desired efficiency, the bigger
 	the achievable speedup.
 \item	If the available synchronization primitives have
 	high overhead compared to the critical sections
@@ -157,11 +157,6 @@ parallel program.
 	using asymmetric primitives
 	(see \cref{chp:Deferred Processing}),
 	or by using a coarse-grained design such as \IXh{code}{locking}.
-\item	If the critical sections have high overhead compared
-	to the primitives guarding them, the best way
-	to improve speedup is to increase parallelism
-	by moving to reader/writer locking, \IXh{data}{locking}, asymmetric,
-	or data ownership.
 \item	If the critical sections have high overhead compared
 	to the primitives guarding them and the data structure
 	being guarded is read much more often than modified,
-- 
2.34.1

