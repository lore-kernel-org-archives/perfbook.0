Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M9B3Djw9wPQCl8aYc1qsh9RP7iVAY41/TEU0fv9nbho=;
 b=r+XQ3MBUUAqUZ5Rzqnz18dWocdYrXMnhQICI7s9hrcxFVZQiWiny25t3gRbO86D/ar
 I0aKo37HD1t/yt9mtgQTu56dBy3Lo8mD1+7Z6RF/HOJivNWrCFAhAud5TLd8TAryBRei
 jrA/VkRj8wNVP3qB57aK2tEIG759MVPAt/AZ7A7D3BjuKSy9Wv+WIRpeNObCdwOFq3yE
 h65bTjrTln9hMP90CDX68vEFMh+tbF9Ad3U52Zygk7UxYBeOdWeM2/k3FX3rpXF+vnVp
 w3nqrWTm6n7uKAYNCyyqQTa/YaLsyd3d0eizQWrOtAgkM2kObrH3PKrSzgQWYAg6JDqJ
 xipQ==
Subject: [PATCH 3/4] appendix/whymb: Fix layout in answers to quick quizzes
References: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7ce1c679-6b6f-97d8-cb90-89c2b5c1ac43@gmail.com>
Date: Sun, 5 Nov 2017 23:51:48 +0900
MIME-Version: 1.0
In-Reply-To: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0cd6e0e44f5cc4be1b1a71caa04e2e9321b24c94 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Nov 2017 22:19:06 +0900
Subject: [PATCH 3/4] appendix/whymb: Fix layout in answers to quick quizzes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index efd67c9..256b9af 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -377,7 +377,8 @@ levels of the system architecture.
 	to the shared bus first,
 	and that CPU ``wins''.  The other CPU must invalidate its copy of the
 	cache line and transmit an ``invalidate acknowledge'' message
-	to the other CPU. \\
+	to the other CPU.
+
 	Of course, the losing CPU can be expected to immediately issue a
 	``read invalidate'' transaction, so the winning CPU's victory will
 	be quite ephemeral.
@@ -1525,7 +1526,6 @@ assert(r1 == 0 || a == 1);
 	No changes are needed to the code in the first two columns,
 	because interrupt handlers run atomically from the perspective
 	of the interrupted code.
-
 } \QuickQuizEnd

 \QuickQuiz{}
-- 
2.7.4


