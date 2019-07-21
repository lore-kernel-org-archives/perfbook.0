Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s1sQ2HmADTi6+oiw5x4acyfXDsQiPStZ0rdhd9YgPKw=;
        b=AQwfIlY8jWjHS6XYFN3weRo+PX3tPPcL6DTUIfRAyNNAMaJ6ygszFXFZeUDhbapMgM
         YPSSb5ms/71295ugm+yznV01R0fTzwWYWsNSB/xfH1fxjq436/C4TGvk02SBUkpKnDI8
         zOtrsPrCkbQswSj47UpG5MoVSPTveqIOestaUgLAD5o2iNrd8tFPydwavZBhM/a5yLhZ
         J3E50lAiigzmHVTNZ0oOZwC5SVeF1OtGmETQJB0yd9CSUeNQT5O3WqhCH5vLznUj5DKa
         nxexQAjD1te/jXaSf5cOR8ZYtMbzWrfTK4eCX/yQaX5hZJO6M36qFR0ui22TvN6pVo2Q
         pbAg==
Subject: [PATCH 3/7] toolsoftrade: Fix typo
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <512a0a15-b41e-9f6c-2310-71fc0046c801@gmail.com>
Date: Sun, 21 Jul 2019 09:07:21 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 66874f5a6cd1b758cdc442084e28289ef12aa082 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Jun 2019 23:21:02 +0900
Subject: [PATCH 3/7] toolsoftrade: Fix typo

Elad reported this typo quite a while ago [1]. Given that it hasn't
been taken care of, let's fix it.

[1]: https://www.spinics.net/lists/perfbook/msg02318.html

Reported-by: Elad Lahav <e2lahav@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9f636931..6ad5ebb6 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1550,7 +1550,7 @@ Of course, where practical, the primitives described in
 Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
 or (especially)
 Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
-should be instead be used to avoid data races, that is, to ensure
+should instead be used to avoid data races, that is, to ensure
 that if there are multiple concurrent accesses to a given
 variable, all of those accesses are loads.
 
-- 
2.17.1


