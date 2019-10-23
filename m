Return-Path: <SRS0=Pw6/=YQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qoGfl+NTFCr0YYs2j5TmO32eWqv05pSpa9CDeXVSwfk=;
        b=tOcKbdQqVyxAHVwgmkBEBhk0ynKz84S43YWiEZiT+y09mrS15PPMhXQEvSFXQrfk6/
         Ox5m/Rkg13fr1zGGORel7rBpEl4zSTDGaUSg8QzUwAfOEGzyVVDL2mgNoKk+y7P3JTZa
         cTt+ppSOGkaO7ox2Zec87ZA8b7cgRDSqvP6pj6kYLWxfYD6ea9au6Bl7eLCdq48xQauh
         3+0Uk9cHRhihvgr5TWnd7DSCAq5BJHs4oddDR8fl7x/Vre/lXs/HhQB7gyhKO2FL3+TX
         In+tA+d9l+Uvnl7ZWdsQzpOfm64E4z4klx9LLXknfvkcm8ecjnLnXdK4sRiDpZ7+Cz0S
         KHlQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer/rcuintro: Substitute smp_store_release() for
 WRITE_ONCE()
Message-ID: <f1c9dec1-89c6-841e-ddbd-6d4b500413cf@gmail.com>
Date: Thu, 24 Oct 2019 00:29:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6845d0f978a81ef17d0011bebb500087f39f9a45 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 24 Oct 2019 00:19:13 +0900
Subject: [PATCH] defer/rcuintro: Substitute smp_store_release() for WRITE_ONCE()

This change corresponds to the update of Figure 9.7 by commit
6bc87460e2ad ("defer/rcuintro: Fix colors, fonts, and primitives
in Figures 9.6 and 9.7").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index dc750326..6702153a 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -295,7 +295,7 @@ Again, this same constraint is imposed on reader threads dereferencing
 they are done using the pointed-to data item.
 Returning to the second row of
 Figure~\ref{fig:defer:Deletion With Concurrent Readers},
-where the updater has just completed executing the \co{WRITE_ONCE()},
+where the updater has just completed executing the \co{smp_store_release()},
 imagine that CPU~0 executes a context switch.
 Because readers are not permitted to block while traversing the linked
 list, we are guaranteed that all prior readers that might have been running on
-- 
2.17.1

