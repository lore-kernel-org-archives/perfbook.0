Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NDq7zXzDEwHPnKgX1rYw7q/5PHTrI3/upQSghEGlNkA=;
 b=JkjOHEsvQtt/8iqfpHVLsxkLKENCPNqu/h6KGIOD1AIrUpCRmu7DnM7pJHiU9ug2Zz
 1iCDXdflafUwekJEMQhjmbRn2rYEF1btXBEYb4Ddf2RYcmKDdlnPhv5fWbnBC1dZ5oB0
 Wgm6GeXeBCtXGisPRrZKeKwEL0KwYBG34Kok/tI7M1taQF0luGNbVJ+zulbFAXWH+4KC
 jEtM+ioHwQg3ByFcITNoh1efGBk7I/OxM8fLlzAC4/7gLdETOH7fvKnHLx7JB+mqJUSD
 A1M+hDeWhwF/gtr0OFqaSoXALxCSjxoSis4l60MD2E75GTSHOtq5NPi4/4QQ4Td/7W/a
 VphQ==
Subject: [PATCH 2/4] defer/seqlock: Use minipage and verbatim for one-liner in
 QQA
References: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9e550556-2e2b-2659-1d18-c9efae4a4ef2@gmail.com>
Date: Sun, 5 Nov 2017 23:50:23 +0900
MIME-Version: 1.0
In-Reply-To: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 17d998b15de3c1cd79073d5a255a06abeaee11d9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Nov 2017 18:33:03 +0900
Subject: [PATCH 2/4] defer/seqlock: Use minipage and verbatim for one-liner in QQA

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/seqlock.tex | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index e537628..421b3bd 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -214,8 +214,14 @@ in other words, that there has been no writer, and returns true if so.
 	\co{smp_load_acquire()} instead of \co{READ_ONCE()}, which
 	in turn would allow the \co{smp_mb()} on line~17 to be dropped.
 	Similarly, line~41 could use an \co{smp_store_release()}, for
-	example, as follows: \\
-	\co{smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);} \\
+	example, as follows:
+
+\begin{minipage}[c][5ex][c]{\columnwidth}\scriptsize
+\begin{verbatim}
+smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);
+\end{verbatim}
+\end{minipage}
+
 	This would allow the \co{smp_mb()} on line~40 to be dropped.
 } \QuickQuizEnd

-- 
2.7.4


