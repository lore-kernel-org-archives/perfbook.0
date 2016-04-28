Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=jrd5qzjqmKznf5FFh6da3FhE9rAA1Cv3HgtMBrip2iQ=;
 b=QtaU3ycrUZbmG9NVOG4tZhDOGv69PzD4a5v0Szvh51fkfSBJNhXE8912BIWkS81ZwA
 B5RLmi2UjNwLxSOV4Gztc63yHoHa34/IUO8bwvXTzVGFErhFwj7kYbEgFdmHXCHbdkp3
 TYwXYLUmBnSBXx52EVY5G+h1nTNp3xuPDfbyAkxSWugrGXRAvRhs2DkClrSxQvK21CJ+
 //UL6b2jGvesxCO9RsOxGH+UzCkYcYB3GM+mkroYWpA89Q5RIMwdlo6+dwlg8ttbonur
 jGsPxZBh9LjclCFgL8shU65HzM51LXNoUoLssDMFy7G7QJd+HYiBozXSQTFBy1CmW3Qe
 Gb7Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Tweak table appearance
Message-ID: <7e2672ff-90ab-7c4f-ac3a-7dd9d977dd1e@gmail.com>
Date: Thu, 28 Apr 2016 21:53:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 365395c463751c9ed1bb187f4df4758995fc5e73 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Thu, 28 Apr 2016 21:35:43 +0900
Subject: [PATCH] advsync: Tweak table appearance

The table added in commit 8de1474e3282 ("Add larger multiple-
value-write scenario") seems to be a little bit different
in its appearance from the author's intention.
This commit tries to reproduce what was presumably intended.

Note: I might have completely missed the point. Please apply this
only after checking if it matches your intention.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 advsync/memorybarriers.tex | 110 ++++++++++++++++++++++-----------------------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 538907d..4732172 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -372,119 +372,119 @@ Again, CPU~0 coordinates the test, so does not record any values.
 \begin{table*}[htbp]
 \scriptsize
 \centering
-\begin{tabular}{r||r|r|r|r|r|r|r|r|r|r|r|r|r|r|r}
+\begin{tabular}{r||c|c|c|c|c|c|c|c|c|c|c|c|c|c|c}
      & \multicolumn{15}{c}{CPU's Observed Values} \\
      \cline{2-16}
 Time & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 & 14 & 15 \\
 \hline
 \hline
-12  & \emph(1) &  &  &  &  &  &  &  &  &  &  &  &  &  &  \\
+12  & \emph{(1)} &  &  &  &  &  &  &  &  &  &  &  &  &  &  \\
 \hline
-12  & ~ &  &  &  &  &  &  &  &  &  &  &  & \emph(13) &  &  \\
+12  & ~ &  &  &  &  &  &  &  &  &  &  &  & \emph{(13)} &  &  \\
 \hline
-13  & ~ &  &  &  &  &  &  &  &  &  &  & \emph(12) & ~ &  &  \\
+13  & ~ &  &  &  &  &  &  &  &  &  &  & \emph{(12)} & ~ &  &  \\
 \hline
-13  & ~ &  &  &  &  &  &  &  &  &  &  & 12 & ~ & \emph(14) &  \\
+13  & ~ &  &  &  &  &  &  &  &  &  &  & 12 & ~ & \emph{(14)} &  \\
 \hline
-15  & ~ &  &  & \emph(4) &  &  &  &  &  &  &  & 12 & ~ & ~ &  \\
+15  & ~ &  &  & \emph{(4)} &  &  &  &  &  &  &  & 12 & ~ & ~ &  \\
 \hline
-15  & ~ &  &  & ~ &  &  &  & \emph(8) &  &  &  & 12 & ~ & ~ &  \\
+15  & ~ &  &  & ~ &  &  &  & \emph{(8)} &  &  &  & 12 & ~ & ~ &  \\
 \hline
-15  & ~ &  &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & \emph(15) \\
+15  & ~ &  &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & \emph{(15)} \\
 \hline
-16  & ~ & \emph(2) &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
+16  & ~ & \emph{(2)} &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
 \hline
-16  & ~ & ~ &  & ~ & \emph(5) &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
+16  & ~ & ~ &  & ~ & \emph{(5)} &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
 \hline
-17  & ~ & ~ & \emph(3) & ~ & ~ &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
+17  & ~ & ~ & \emph{(3)} & ~ & ~ &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
 \hline
-17  & ~ & ~ & 3 & ~ & ~ & \emph(6) &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
+17  & ~ & ~ & 3 & ~ & ~ & \emph{(6)} &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
 \hline
-17  & ~ & ~ & 3 & ~ & ~ & ~ &  & ~ & \emph(9) &  &  & 12 & ~ & ~ & 15 \\
+17  & ~ & ~ & 3 & ~ & ~ & ~ &  & ~ & \emph{(9)} &  &  & 12 & ~ & ~ & 15 \\
 \hline
-18  & ~ & ~ & 3 & ~ & ~ & ~ & \emph(7) & ~ & 9 &  &  & 12 & ~ & ~ & 15 \\
+18  & ~ & ~ & 3 & ~ & ~ & ~ & \emph{(7)} & ~ & 9 &  &  & 12 & ~ & ~ & 15 \\
 \hline
-20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & \emph(11) & 12 & ~ & ~ & 15 \\
+20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & \emph{(11)} & 12 & ~ & ~ & 15 \\
 \hline
-20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & ~ & 12 & ~ & \emph(15) & 15 \\
+20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & ~ & 12 & ~ & \emph{(15)} & 15 \\
 \hline
-21  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & \emph(10) & ~ & 12 & ~ & 15 & 15 \\
+21  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & \emph{(10)} & ~ & 12 & ~ & 15 & 15 \\
 \hline
-25  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & \emph(9) & 9 & 10 & ~ & 12 & ~ & 15 & 15 \\
+25  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & \emph{(9)} & 9 & 10 & ~ & 12 & ~ & 15 & 15 \\
 \hline
-57  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & ~ & 12 & \emph(12) & 15 & ~ \\
+57  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & ~ & 12 & \emph{(12)} & 15 & ~ \\
 \hline
-78  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & \emph(10) & 12 & 12 & 15 & ~ \\
+78  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & \emph{(10)} & 12 & 12 & 15 & ~ \\
 \hline
-90  & \emph(6) & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+90  & \emph{(6)} & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-147  & \emph(4) & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+147  & \emph{(4)} & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-172  & ~ & ~ & ~ & ~ & ~ & ~ & \emph(2) & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+172  & ~ & ~ & ~ & ~ & ~ & ~ & \emph{(2)} & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-173  & ~ & ~ & ~ & ~ & ~ & \emph(2) & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+173  & ~ & ~ & ~ & ~ & ~ & \emph{(2)} & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-212  & ~ & ~ & ~ & \emph(10) & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+212  & ~ & ~ & ~ & \emph{(10)} & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-214  & ~ & ~ & ~ & 10 & \emph(10) & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+214  & ~ & ~ & ~ & 10 & \emph{(10)} & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-225  & \emph(10) & ~ & ~ & 10 & 10 & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
+225  & \emph{(10)} & ~ & ~ & 10 & 10 & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
 \hline
-294  & ~ & ~ & ~ & \emph(15) & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
+294  & ~ & ~ & ~ & \emph{(15)} & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
 \hline
-297  & ~ & ~ & ~ & 15 & \emph(15) & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
+297  & ~ & ~ & ~ & 15 & \emph{(15)} & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
 \hline
-308  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & \emph(15) & ~ & 12 & 12 & 15 & ~ \\
+308  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & \emph{(15)} & ~ & 12 & 12 & 15 & ~ \\
 \hline
-309  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & \emph(15) & 12 & 12 & 15 & ~ \\
+309  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & \emph{(15)} & 12 & 12 & 15 & ~ \\
 \hline
-311  & \emph(15) & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
+311  & \emph{(15)} & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
 \hline
-333  & ~ & ~ & ~ & 15 & 15 & \emph(15) & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
+333  & ~ & ~ & ~ & 15 & 15 & \emph{(15)} & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
 \hline
-334  & ~ & ~ & ~ & 15 & 15 & 15 & \emph(15) & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
+334  & ~ & ~ & ~ & 15 & 15 & 15 & \emph{(15)} & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
 \hline
-379  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & \emph(12) & ~ \\
+379  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & \emph{(12)} & ~ \\
 \hline
-381  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & \emph(12) \\
+381  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & \emph{(12)} \\
 \hline
-391  & ~ & ~ & ~ & \emph(12) & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
+391  & ~ & ~ & ~ & \emph{(12)} & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
 \hline
-393  & ~ & ~ & ~ & 12 & \emph(12) & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
+393  & ~ & ~ & ~ & 12 & \emph{(12)} & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
 \hline
-397  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & \emph(12) & ~ & 12 & 12 & 12 & 12 \\
+397  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & \emph{(12)} & ~ & 12 & 12 & 12 & 12 \\
 \hline
-399  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & 12 & \emph(12) & 12 & 12 & 12 & 12 \\
+399  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & 12 & \emph{(12)} & 12 & 12 & 12 & 12 \\
 \hline
-441  & ~ & \emph(3) & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
+441  & ~ & \emph{(3)} & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
 \hline
-442  & \emph(3) & 3 & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
+442  & \emph{(3)} & 3 & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
 \hline
-472  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & \emph(9) & ~ & ~ & ~ & ~ & ~ \\
+472  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & \emph{(9)} & ~ & ~ & ~ & ~ & ~ \\
 \hline
-473  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 9 & \emph(9) & ~ & ~ & ~ & ~ \\
+473  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 9 & \emph{(9)} & ~ & ~ & ~ & ~ \\
 \hline
-475  & ~ & ~ & ~ & \emph(9) & ~ & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+475  & ~ & ~ & ~ & \emph{(9)} & ~ & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-476  & ~ & ~ & ~ & 9 & \emph(9) & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+476  & ~ & ~ & ~ & 9 & \emph{(9)} & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-499  & ~ & ~ & ~ & 9 & 9 & ~ & \emph(9) & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+499  & ~ & ~ & ~ & 9 & 9 & ~ & \emph{(9)} & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-500  & ~ & ~ & ~ & 9 & 9 & \emph(9) & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+500  & ~ & ~ & ~ & 9 & 9 & \emph{(9)} & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-510  & ~ & \emph(9) & ~ & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+510  & ~ & \emph{(9)} & ~ & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-511  & ~ & 9 & \emph(9) & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+511  & ~ & 9 & \emph{(9)} & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-515  & \emph(9) & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
+515  & \emph{(9)} & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
 \hline
-523  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & \emph(9) & ~ & ~ \\
+523  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & \emph{(9)} & ~ & ~ \\
 \hline
-525  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph(9) & 9 & ~ & ~ \\
+525  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph{(9)} & 9 & ~ & ~ \\
 \hline
-528  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph(9) & ~ \\
+528  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph{(9)} & ~ \\
 \hline
-529  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph(9) \\
+529  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph{(9)} \\
 \end{tabular}
 \caption{A Variable With More Simultaneous Values}
 \label{tab:advsync:A Variable With More Simultaneous Values}
-- 
1.9.1

