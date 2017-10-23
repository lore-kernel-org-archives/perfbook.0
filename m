Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GOBI4U36ql1kdndFXG61U5cwYKk5sHrI++KJndk8wyA=;
 b=MkSbflWAyZYUAbrGUi6h7E9mmoGUCRfDYXKO1oFU3ZDBvdHO9gMSSXIrHn73RIf6Az
 FDu0dLhq2CfT4AAxCgjXBN7unabyjogWAv3nT8IGZLIe5kJQpVJ8AR/nknGwEHhL/xxZ
 wmbSAUpWs35GoGVKhTVrc3si1S2jkwtTPowwbGd8pVHIzqRldeR1vEYF7cYXRitaMYpy
 o0DBEua3Yc7x8PoDBDJvg2KdhMNSBjkAhxBV7JXJlD4mMaNrpsePbNVIxh40wybjmOge
 bqfj0yLfFh1mcmn0x0aDxCRNaeVcBxF/kdDlZ4PYDNnPuATjLCF/mAt5Oudp1HqIYNss
 hPwQ==
Subject: [PATCH 1/3] whymb: Update table layout
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
Date: Tue, 24 Oct 2017 00:27:59 +0900
MIME-Version: 1.0
In-Reply-To: <20171023022430.GJ3659@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0bec999ee614a8c92d42876957b1072329b62829 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 23 Oct 2017 23:13:26 +0900
Subject: [PATCH 1/3] whymb: Update table layout

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index b52c2e5..422948e 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -565,29 +565,25 @@ Finally, CPU~1 reads the cache line at address~8, which uses a
 \begin{table*}
 \small
 \centering
-\begin{tabular}{r|c|l||c|c|c|c||c|c}
-	& & & \multicolumn{4}{c||}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
-	\cline{4-7}
+\renewcommand*{\arraystretch}{1.2}
+\rowcolors{6}{}{lightgray}
+\begin{tabular}{rclcccccc}
+	\toprule
+	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
+	\cmidrule(lr){4-7} \cmidrule(l){8-9}
 	Sequence \# & CPU \# & Operation & 0 & 1 & 2 & 3 & 0 & 8 \\
-	\hline
+	\cmidrule(r){1-3} \cmidrule(lr){4-7} \cmidrule(l){8-9}
 %	Seq CPU Operation	------------- CPU -------------   - Memory -
 %				   0	   1	   2	   3	    0   8
-	\hline
 	0 &   & Initial State	& $-$/I & $-$/I & $-$/I & $-$/I   & V & V \\
-	\hline
 	1 & 0 & Load		& 0/S &   $-$/I & $-$/I & $-$/I   & V & V \\
-	\hline
 	2 & 3 & Load		& 0/S &   $-$/I & $-$/I & 0/S     & V & V \\
-	\hline
 	3 & 0 & Invalidation	& 8/S &   $-$/I & $-$/I & 0/S     & V & V \\
-	\hline
 	4 & 2 & RMW		& 8/S &   $-$/I & 0/E &   $-$/I   & V & V \\
-	\hline
 	5 & 2 & Store		& 8/S &   $-$/I & 0/M &   $-$/I   & I & V \\
-	\hline
 	6 & 1 & Atomic Inc	& 8/S &   0/M &   $-$/I & $-$/I   & I & V \\
-	\hline
 	7 & 1 & Writeback	& 8/S &   8/S &   $-$/I & $-$/I   & V & V \\
+	\bottomrule
 \end{tabular}
 \caption{Cache Coherence Example}
 \label{tab:app:whymb:Cache Coherence Example}
-- 
2.7.4


