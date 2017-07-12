Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MqJLX3AwbD99iH7R0F7/VAsJ2HsLNYg+dBTEg1qZJcw=;
 b=qUv4unrr/MgsGqd65GgCYYtiDF/pHxDMa7pV9I4HTPTbhv3MhrQs6YeSRyxx47bdt+
 SUOBMT/1CmjjCpL9UQsqw2V0kBS3fzzSWgppFnZ4SWfiGYU13g8qQ50rPb6TA+mgWnqG
 2knuBgaVDxpx07d1jyVFxS666BF+AK4I7YxVDreRXLel+dLyN/Tre6aWY1AJsEb1I8qc
 LKPnZSR1PuZXZ1tDf2FPh57TOvlh75Xvnz/QcudIrEkT57jAwiO+xdiDj8uZG+mgN9/O
 E+tWI0KDCcgvZCGlS9jyXdTz+X56O9nE/TcJWtPwWRa1C5Ywrjrf1bqdJFmpkHeRu7jW
 FW4Q==
Subject: [PATCH 3/6] advsync: Fix remaining typo in exists condition
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b888a815-3644-95db-7993-0a13ae2cb275@gmail.com>
Date: Thu, 13 Jul 2017 00:10:56 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2dd610086d6a4599dab6287b8e1180bbc3f92f88 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 21:20:14 +0900
Subject: [PATCH 3/6] advsync: Fix remaining typo in exists condition

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 936b95e..10d28f0 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -613,7 +613,7 @@ loads and stores.
 22
 23 }
 24
-25 exists (1:r2=1 /\ 1:r3=0)
+25 exists (1:r2=2 /\ 1:r3=0)
 \end{verbbox}
 }
 \centering
-- 
2.7.4


