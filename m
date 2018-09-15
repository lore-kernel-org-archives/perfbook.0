Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b72a95gUvLN5+6A8forhgU9V/07KsVKRPCYGeblZIMM=;
 b=p+3s2gWYYbxDRC1rNxbqXCPXLTtNBVrURD33T2KOgm5LmBfeuaW5U1r4rbkSvOEt1a
 PxePmavJlxBamTR9LCnPFiy4SXHPQE38zuqFOIpscZGHRGnAYovwHl03k1rMx8wK4c3a
 Qkm5JRS9rbx/mOCQ8uVPpOPpXg+KUM7M5fcmPe8nGv6hC9mtQASXg0dj3Ih1d6RNAS1P
 uqO8W9+65lbYkOL+5uzxPIWUC2IxREodSAMxh/OON75iAOSkWHXEurz0DZEey70tkV4y
 eQ2d5FHTmdCdBDEgobtDXos175k5Y3x9MtRlqiUy20ZGz7+AswC8voTgUoEO89DOCLWe
 cU4A==
Subject: [PATCH 2/2] count: Reword Quick Quiz 5.6 to adjust context
References: <2b7297a8-62d2-bcdb-0b41-e3bb1b270a6e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ce79d51e-2557-b855-d7ee-cc9f22f22958@gmail.com>
Date: Sat, 15 Sep 2018 11:14:03 +0900
MIME-Version: 1.0
In-Reply-To: <2b7297a8-62d2-bcdb-0b41-e3bb1b270a6e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: "Palik, Imre" <imrep.amz@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7bf9ee029829a53009e29ea23b287bb874bd8ee4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 14 Sep 2018 22:50:04 +0900
Subject: [PATCH 2/2] count: Reword Quick Quiz 5.6 to adjust context

count_nonatomic.c has lost the explicit "++" operator, so this is
my humble attempt to update the question.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

Does this change look reasonable to you?
I'm quite sure you will come up with something better. ;-)

    Thanks, Akira
--
 count/count.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index cfdacb5..6a48b99 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -193,7 +193,9 @@ Although approximate values do have their place in computing,
 accuracies far greater than 50\,\% are almost always necessary.

 \QuickQuiz{}
-	But doesn't the \co{++} operator produce an x86 add-to-memory
+	But doesn't a smart compiler prove
+        line~\ref{ln:count:count_nonatomic:inc-read:inc} is equivalent
+        to the \co{++} operator and produce an x86 add-to-memory
 	instruction?
 	And won't the CPU cache cause this to be atomic?
 \QuickQuizAnswer{
-- 
2.7.4


