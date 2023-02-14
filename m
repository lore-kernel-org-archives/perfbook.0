Return-Path: <SRS0=OGBw=6K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akukdh0j3htdt00LB8N5BWlg3WtOIzQeZaeukohz6nE=;
        b=fD5IPjvWso3FopKEorvPwTXTkToLHdDlXvNT/ySiaaz8JXUXBazZg98B4YcuV9OFWX
         Ja/eGUhyCtJqnI4tzKO+puj4aHdb/ZoAJ+9RawWS0ssTvAu8xj+HpdKr816CDO2rOIT5
         4rg6fMHdQsHRsQQ7JYyMThmz6LC70XuCsJyFNKMviZ3SoJvei0tWYf/whXUdNOnR7IQ5
         vChjDP5LMaUerK1wmq2Ubr2C6ETnlhyS5dCvj/13AegmXnu/xrsJTyiNZRzh+YvZIaoQ
         VShO34XvEBhYn+zMQGk8ukNSvWCf9KTRdFmXyDIYmxcQ8cJ0iR+wfp30xBOFuez/VfDi
         rA9A==
Message-ID: <47bb64ed-c677-ae94-4d03-f3c4d222269a@gmail.com>
Date: Tue, 14 Feb 2023 19:05:48 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/4] cpu: Improve layout and consistency of Tables
 3.1, E.1, and E.2
Content-Language: en-US
References: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

For these tables to fit column width of 2c builds, make changes as
follows:

    - Move prefix of "Same-CPU", "In-Core", etc. to a separate
      row.
    - Add \midrule between different classes of counterpart CPUs.
    - Stop coloring alternative rows.
    - Shrink "CPUs" column width by spanning two rows.

Define \tcresizewidth{} ("tc" stands for "two column") and use it
for slightly wide tables in 2c builds.

To improve consistency among these tables:

    - Uppercase "In-Core", "Off-Core", Off-System", and "Blind CAS".

Reported-by: Leonardo Bras <leobras.c@gmail.com>
Link: [1] https://www.spinics.net/lists/perfbook/msg03827.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 143 +++++++++++++++++++++++++++++-----------------
 perfbook-lt.tex   |   6 ++
 2 files changed, 97 insertions(+), 52 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index a89c71158bf9..7ae99ed6cb7b 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -133,44 +133,62 @@ optimization.
 \subsection{Costs of Operations}
 \label{sec:cpu:Costs of Operations}
 
-\begin{table*}
-\rowcolors{1}{}{lightgray}
+\begin{table}
+%\rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \centering\small
-\ebresizewidth{
+\tcresizewidth{
 \begin{tabular}
   {
-    l
+    ll
     S[table-format = 9.1]
     S[table-format = 9.1]
     r
   }
 	\toprule
-	Operation	   & \multicolumn{1}{r}{Cost (ns)}
+	\multicolumn{2}{l}{Operation}
+			& \multicolumn{1}{r}{Cost (ns)}
 				   & {\parbox[b]{.7in}{\raggedleft Ratio\\(cost/clock)}}
 					    & CPUs \\
 	\midrule
-	Clock period		     &   0.5 &    1.0 &			  \\
-	Same-CPU CAS		     &   7.0 &   14.6 & 0		  \\
-	Same-CPU lock		     &  15.4 &   32.3 & 0		  \\
-	In-core blind CAS	     &   7.2 &   15.2 & 224		  \\
-	In-core CAS		     &  18.0 &   37.7 & 224		  \\
-	Off-core blind CAS	     &  47.5 &   99.8 & 1--27,225--251	  \\
-	Off-core CAS		     & 101.9 &  214.0 & 1--27,225--251	  \\
-	Off-socket blind CAS	     & 148.8 &  312.5 & 28--111,252--335  \\
-	Off-socket CAS		     & 442.9 &  930.1 & 28--111,252--335  \\
-	Cross-interconnect blind CAS & 336.6 &  706.8 & 112--223,336--447 \\
-	Cross-interconnect CAS	     & 944.8 & 1984.2 & 112--223,336--447 \\
+	\multicolumn{2}{l}{Clock period}
+			   &   0.5 &    1.0 &		\\
+	\midrule
+	\multicolumn{2}{l}{Same-CPU}
+			   &       &        & 0		\\
+		& CAS      &   7.0 &   14.6 &		\\
+		& lock     &  15.4 &   32.3 &		\\
 	\midrule
-	Off-System	&	      & 	    & \\
-	Comms Fabric	&       5 000 &      10 500 & \\
-	Global Comms	& 195 000 000 & 409 500 000 & \\
+	\multicolumn{2}{l}{In-Core}
+			   &       &        & 224	\\
+		& Blind CAS&   7.2 &   15.2 &		\\
+		& CAS	   &  18.0 &   37.7 & 		\\
+        \midrule
+	\multicolumn{2}{l}{Off-Core}
+			   &       &	    & 1--27	\\
+		& Blind CAS&  47.5 &   99.8 & 225--251	\\
+		& CAS	   & 101.9 &  214.0 &		\\
+        \midrule
+	\multicolumn{2}{l}{Off-Socket}
+			   &       &        & 28--111	\\
+		& Blind CAS& 148.8 &  312.5 & 252--335	\\
+		& CAS	   & 442.9 &  930.1 &		\\
+        \midrule
+	\multicolumn{2}{l}{Cross-Interconnect}
+			   &       &        & 112--223	\\
+		& Blind CAS& 336.6 &  706.8 & 336--447	\\
+		& CAS	   & 944.8 & 1984.2 &		\\
+	\midrule
+	\multicolumn{2}{l}{Off-System}
+				&		&	      & \\
+		& Comms Fabric  &         5 000 &      10 500 & \\
+		& Global Comms  &   195 000 000 & 409 500 000 & \\
 	\bottomrule
 \end{tabular}
 }
 \caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10\,GHz}
 \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
-\end{table*}
+\end{table}
 
 The overheads of some common operations important to parallel programs are
 displayed in
@@ -311,36 +329,47 @@ thousand clock cycles.
 	\end{enumerate}
 
 \begin{table}
-\rowcolors{1}{}{lightgray}
+%\rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \centering\small
 \begin{tabular}
   {
-    l
+    ll
     S[table-format = 9.1]
     S[table-format = 9.1]
   }
 	\toprule
-	Operation		& \multicolumn{1}{r}{Cost (ns)}
+	\multicolumn{2}{l}{Operation}
+			& \multicolumn{1}{r}{Cost (ns)}
 			& {\parbox[b]{.7in}{\raggedleft Ratio\\(cost/clock)}} \\
 	\midrule
-	Clock period		&           0.4	&           1.0 \\
-	Same-CPU CAS		&          12.2	&          33.8 \\
-	Same-CPU lock		&          25.6	&          71.2 \\
-	Blind CAS		&          12.9	&          35.8 \\
-	CAS			&           7.0	&          19.4 \\
+	\multicolumn{2}{l}{Clock period}
+			&           0.4	&           1.0 \\
+        \midrule
+	\multicolumn{2}{l}{Same-CPU}
+			&		&		\\
+	& CAS		&          12.2	&          33.8 \\
+	& lock		&          25.6	&          71.2 \\
+        \midrule
+        \multicolumn{2}{l}{In-Core}
+			&		&		\\
+	& Blind CAS	&          12.9	&          35.8 \\
+	& CAS		&           7.0	&          19.4 \\
 	\midrule
-	Off-Core		&		&		\\
-	Blind CAS		&          31.2	&          86.6 \\
-	CAS			&          31.2	&          86.5 \\
+        \multicolumn{2}{l}{Off-Core}
+			&		&		\\
+	& Blind CAS	&          31.2	&          86.6 \\
+	& CAS		&          31.2	&          86.5 \\
 	\midrule
-	Off-Socket		&		&		\\
-	Blind CAS		&          92.4	&         256.7 \\
-	CAS			&          95.9	&         266.4 \\
+	\multicolumn{2}{l}{Off-Socket}
+			&		&		\\
+	& Blind CAS	&          92.4	&         256.7 \\
+	& CAS		&          95.9	&         266.4 \\
 	\midrule
-	Off-System		&		&		\\
-	Comms Fabric		&       2 600   &       7 220   \\
-	Global Comms		& 195 000 000	& 542 000 000   \\
+	\multicolumn{2}{l}{Off-System}
+			&		&		\\
+	& Comms Fabric	&       2 600   &       7 220   \\
+	& Global Comms	& 195 000 000	& 542 000 000   \\
 	\bottomrule
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel X5550 (Nehalem) System}
@@ -366,38 +395,48 @@ thousand clock cycles.
 	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	down to and including the two ``Off-core'' rows.
 
-\begin{table*}
-\rowcolors{1}{}{lightgray}
+\begin{table}
+%\rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \centering\small
+\tcresizewidth{
 \begin{tabular}
   {
-    l
+    ll
     S[table-format = 9.1]
     S[table-format = 9.1]
     r
   }
 	\toprule
-	Operation		& \multicolumn{1}{r}{Cost (ns)}
+	\multicolumn{2}{l}{Operation}
+		& \multicolumn{1}{r}{Cost (ns)}
 			& {\parbox[b]{.7in}{\raggedleft Ratio\\(cost/clock)}}
 			& CPUs \\
 	\midrule
-	Clock period		     &   0.5 &    1.0 &			  \\
-	Same-CPU CAS		     &   6.2 &   13.6 & 0		  \\
-	Same-CPU lock		     &  13.5 &   29.6 & 0		  \\
-	In-core blind CAS	     &   6.5 &   14.3 & 6		  \\
-	In-core CAS		     &  16.2 &   35.6 & 6		  \\
-	Off-core blind CAS	     &  22.2 &   48.8 & 1--5,7--11	  \\
-	Off-core CAS		     &  53.6 &  117.9 & 1--5,7--11	  \\
+	\multicolumn{2}{l}{Clock period}
+				     &   0.5 &    1.0 &			  \\
+        \midrule
+	\multicolumn{2}{l}{Same-CPU} &       &        &	0		  \\
+	& CAS			     &   6.2 &   13.6 &			  \\
+	& lock			     &  13.5 &   29.6 &			  \\
+        \midrule
+	\multicolumn{2}{l}{In-Core}  &       &        &	6		  \\
+	& Blind CAS		     &   6.5 &   14.3 &			  \\
+	& CAS			     &  16.2 &   35.6 &			  \\
+        \midrule
+	\multicolumn{2}{l}{Off-Core} &       &        &	1--5		  \\
+	& Blind CAS		     &  22.2 &   48.8 & 7--11		  \\
+	& CAS			     &  53.6 &  117.9 &			  \\
 	\midrule
-	Off-System	&	      & 	    & \\
-	Comms Fabric	&       5 000 &      11 000 & \\
-	Global Comms	& 195 000 000 & 429 000 000 & \\
+	\multicolumn{2}{l}{Off-System}&       &        &		  \\
+	& Comms Fabric		      & 5 000 & 11 000 &		  \\
+	& Global Comms		      & 195 000 000 & 429 000 000 &	  \\
 	\bottomrule
 \end{tabular}
+}
 \caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20\,GHz}
 \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20GHz}
-\end{table*}
+\end{table}
 
 	Furthermore, newer small-scale single-socket systems such
 	as the laptop on which I am typing this also have more
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 13dd88b32d94..f970212cb194 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -533,6 +533,12 @@
 \newcommand\ebFloatBarrier{}
 }
 
+\IfTwoColumn{
+\newcommand{\tcresizewidth}[1]{\resizebox{\columnwidth}{!}{#1}}
+}{
+\newcommand{\tcresizewidth}[1]{#1}
+}
+
 % Glossaries dictionary and custom settings
 \input{glsdict}
 
-- 
2.25.1


