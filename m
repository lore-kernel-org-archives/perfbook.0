Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+JrYaUudjPlfmaYwpIK0tEd4TwECVhHNUwKUvOXnbWs=;
        b=KHnffZLmHBkKrdfLBBsAuYj1m4YgiQgR3wHpTEewanY3siiBMRR7RejX9A4AYlvjv1
         SmCOnZWSYoX72O9spLB6BODqcZeFzEd7lQmQ65V/Q/u0sfllGhgoiJ0sWkstYxBRFW5R
         M693SLt2oZ0M3KONhTTf5chLa4BE1C6atuVwuRNeVXfAQV7YDpjcWaw1nhx40iSturUV
         5ucaFgsbH0NwlHS+T1THfDECkLMysYM516WE5piAmjD39lB/PMN/Vj0SgfbD9lw22AKY
         1PGExE196iag2L+t7ZNY3xJodSCwleHDvh5ErNYpKljfrhaZBAkMZpHP2PJ2UfFXSX8q
         r/Kw==
Subject: [PATCH -perfbook 4/5] styleguide: Adjust float size and add a
 floatbarrier for ebook-size build
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1a81efe3-d5ca-a5e0-19e7-2fa5d2783cff@gmail.com>
Date: Thu, 25 Mar 2021 19:58:21 +0900
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 66dc9163..05fc57aa 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1219,6 +1219,7 @@ which controls the behavior of \co{\\toprule}.
 \label{sec:app:styleguide:Improvement Candidates}
 
 \begin{figure*}[tbh]\centering
+\ebresizewidth{
 \begin{minipage}[t][][t]{2.1in}
 \resizebox{2.1in}{!}{\includegraphics{cartoons/1kHz}}
 \caption{Timer Wheel at 1\,kHz}
@@ -1230,6 +1231,7 @@ which controls the behavior of \co{\\toprule}.
 \caption{Timer Wheel at 100\,kHz}
 \label{fig:app:styleguide:Timer Wheel at 100kHz}
 \end{minipage}
+}
 \end{figure*}
 
 \begin{listing*}[tbh]%
@@ -1477,6 +1479,7 @@ is a sequence diagram drawn as a table.
 % This is why the 3rd row has the background color of <even-row color>.
 %
 % \cline of plain LaTeX also interfares the row count.
+\ebresizewidth{
 \begin{tabular}{rclcccccc}
 	\toprule
 	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
@@ -1495,6 +1498,7 @@ is a sequence diagram drawn as a table.
 	7 & 1 & Writeback	& 8/S &   8/S &   $-$/I & $-$/I   & V & V \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Cache Coherence Example}
 \label{tab:app:styleguide:Cache Coherence Example}
 \end{table*}
@@ -1524,6 +1528,7 @@ chosen for simplicity.
 \renewcommand*{\arraystretch}{1.1}
 \footnotesize
 \centering
+\ebresizewidth{
 \begin{tabular}{lll}
 \toprule
 	Primitives &
@@ -1585,6 +1590,7 @@ chosen for simplicity.
 			Memory barrier \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
 \end{table*}
@@ -1594,6 +1600,7 @@ chosen for simplicity.
 \rowcolors{3}{lightgray}{}
 \footnotesize
 \centering
+\ebresizewidth{
 \begin{tabular}{lllp{1.2in}}\toprule
 Category &
 	Primitives &
@@ -1663,6 +1670,7 @@ Pointer update &
 			Memory barrier \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 \end{table*}
@@ -1677,6 +1685,7 @@ is also a sequence diagram drawn as a tabular object.
 \renewcommand*{\arraystretch}{1.1}
 \small
 \centering\OneColumnHSpace{-0.1in}
+\ebresizewidth{
 \begin{tabular}{rllllll}
 	\toprule
 	& \multicolumn{3}{c}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
@@ -1696,10 +1705,13 @@ is also a sequence diagram drawn as a tabular object.
 		(Finish store) & & \tco{x1==2} \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Memory Misordering: Store-Buffering Sequence of Events}
 \label{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
 \end{table*}
 
+\ebFloatBarrier
+
 \Cref{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
 shows another version of
 \cref{tab:app:styleguide:Refrigeration Power Consumption}
-- 
2.17.1


