Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sUmcyhp2qRF4RpASvBYsyo2ipx7eZczz6v3NYW3RGpc=;
        b=mcviVvXBpM3td/RtTf1HnlpH8ENLp9ivtHRQex2icw3cL0xDarRfwXo0Hw7RkFsaX9
         LW+PwnWsqmkKc259SPuJ8ajiBSXHHLl35Rar5iDly8CDhfWCVnIb503mA70C8YvVdBcG
         oXOrX9a7Fu3Et5n2u9lqGDHRWC8B5JozmrSNVWJLKRzn9zZGrqUdD7vXWxPykTEYpcRi
         GNtVYHHGGkDcMQNpN++oUJ0/9fFCQdWFiNM03VEb1Yf6zdxANVt36+7HWHkwtqHMrlqf
         XDq/387WXcZT5mowwU1QRCtiMRddJPN6zv8etPgCaLYF16oA/PikYoGx2E7N3jMnXDgn
         XpuA==
Subject: [PATCH 4/6] count: Promote code snippet in Quiz part of QQZ to
 listing
References: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ab930f3d-19f2-2811-010e-f0aa7d83c16c@gmail.com>
Date: Sun, 12 Jan 2020 13:10:46 +0900
MIME-Version: 1.0
In-Reply-To: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 04c6c10ec7d6f9b215141bee0ec7f8001891bcf1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Jan 2020 13:48:01 +0900
Subject: [PATCH 4/6] count: Promote code snippet in Quiz part of QQZ to listing

Current scheme of QQZ can't handle a snippet at the end of a Quiz
part due to the implied break-ability in front of the ending "square
mark".
QQZ 5.29 suffers from such a symptom.

Promote the snippet to a proper listing and rephrase the Quiz
and Answer part accordingly.

Also add WRITE_ONCE() and adjust indent in the snippet for
consistency with the right snippet.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 7cd8eceb..28a6602b 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1398,24 +1398,29 @@ This is the \co{add_counter()} fastpath, and it does no atomic operations,
 references only per-thread variables, and should not incur any cache misses.
 \end{lineref}
 
+\begin{listing}[tbp]
+\begin{VerbatimL}[firstnumber=3]
+	if (counter + delta <= countermax) {
+		WRITE_ONCE(counter, counter + delta);
+		return 1;
+	}
+\end{VerbatimL}
+\caption{Intuitive Fastpath}
+\label{lst:count:Intuitive Fastpath}
+\end{listing}
+
 \QuickQuiz{}
 	What is with the strange form of the condition on
 	line~\ref{ln:count:count_lim:add_sub_read:add:checklocal} of
 	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
-	Why not the following more intuitive form of the fastpath?
-
-\begin{VerbatimN}[firstnumber=3]
-if (counter + delta <= countermax) {
-	counter += delta;
-	return 1;
-}
-\end{VerbatimN}
-\vspace{-9pt}
+	Why not the more intuitive form of the fastpath shown in
+	\cref{lst:count:Intuitive Fastpath}?
 \QuickQuizAnswer{
 	Two words.
 	``Integer overflow.''
 
-	Try the above formulation with \co{counter} equal to 10 and
+	Try the formulation in \cref{lst:count:Intuitive Fastpath}
+	with \co{counter} equal to~10 and
 	\co{delta} equal to \co{ULONG_MAX}.
 	Then try it again with the code shown in
 	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
-- 
2.17.1


