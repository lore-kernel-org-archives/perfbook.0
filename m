Return-Path: <SRS0=xQJe=VN=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Za5R/X1rL+cXlELNh98oT7Z5Ohew/Toz0y27WbtvbbA=;
        b=oMgitOT1EJo4ChEbA2m78yMkO2aRkoIAkL3AVqUNiePyD9EekCF3tzUylBeoyVwvT1
         g+UC/km55MgTW9QT/f10DM3GZqM4dlI0KKrv6AT9AjpZPEXZoHe/xnjSrD2ouMIvrY8c
         tG/XEcnpncQOewGC5UvCNIkkgdUlOGjymj1W0R3gssGbD7wAI5ieUfcIbTHpaL2HlT3P
         yDL7ODQ+3ClzkvTAOMDQ+lsJuz95elHDNd0LPtmv8cIYe4BFhUQj/aOABhsRKlisLsyK
         lsZQM7E9i2k+oCxdZPgVJYitc1UKsmAJt2i1g5j8/Nu4oK8tY2YzvGIxEB2h93/nFLoY
         N75Q==
Date: Thu, 5 May 2022 04:37:32 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: [PATCH] whymb: convert event sequence without store forwarding to
 table
Message-ID: <20220505043732.GA24693@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, haolee.swjtu@gmail.com
List-ID: <perfbook.vger.kernel.org>

To make the process more clear, introduce a "CPU operations" column
which represents micro-operations.

Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 74 ++++++++++++++++++----------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 2140eb8a..e9c4665b 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -752,29 +752,50 @@ However, if one were foolish enough to use the very simple architecture
 shown in
 \cref{fig:app:whymb:Caches With Store Buffers},
 one would be surprised.
-Such a system could potentially see the following sequence of events:
-\begin{sequence}
-\item	CPU~0 starts executing the \co{a = 1}.
-\item	CPU~0 looks ``a'' up in the cache, and finds that it is missing.
-\item	CPU~0 therefore sends a ``read invalidate'' message in order to
-	get exclusive ownership of the cache line containing ``a''.
-\item	CPU~0 records the store to ``a'' in its store buffer.
-\item	CPU~1 receives the ``read invalidate'' message, and responds
-	by transmitting the cache line and removing that cacheline from
-	its cache.
-\item	CPU~0 starts executing the \co{b = a + 1}.
-\item	CPU~0 receives the cache line from CPU~1, which still has
-	a value of zero for ``a''.
-\item	CPU~0 loads ``a'' from its cache, finding the value zero.
-	\label{item:app:whymb:Need Store Buffer}
-\item	CPU~0 applies the entry from its store buffer to the newly
-	arrived cache line, setting the value of ``a'' in its cache
-	to one.
-\item	CPU~0 adds one to the value zero loaded for ``a'' above,
-	and stores it into the cache line containing ``b''
-	(which we will assume is already owned by CPU~0).
-\item	CPU~0 executes \co{assert(b == 2)}, which fails.
-\end{sequence}
+Such a system could potentially see the sequence of events in
+\Cref{tab:app:whymb:Load without store forwarding}.
+
+Row~1 shows the initial state, where CPU~0 has \co{b} in its cache and CPU~1
+has \co{a} in its cache, both variables having a value of zero.
+Row~2-5 store 1 to variable \co{a} and Row~6-9 calculate \co{b}. Row~10
+does an assertion which is failed.
+
+\begin{table*}
+\rowcolors{6}{}{lightgray}
+\renewcommand*{\arraystretch}{1.1}
+\small
+\centering\OneColumnHSpace{-0.1in}
+\ebresizewidth{
+\begin{tabular}{llllllll}
+	\toprule
+	& \multicolumn{4}{c}{CPU 0} &  & \multicolumn{2}{c}{CPU 1} \\
+	\cmidrule(l){2-5} \cmidrule(l){7-8}
+	& Instruction & CPU operations & Store Buffer & Cache &  &
+		CPU operations & Cache \\
+	\cmidrule{1-1} \cmidrule(l){2-5} \cmidrule(l){7-8}
+	1 & (Initial state) &  &  & \tco{b==0} &  & (Initial state)
+		& \tco{a==0} \\
+	2 & \tco{a = 1;} & read and invalidate \tco{a} &  & \tco{b==0}
+		&  &  & \tco{a==0} \\
+	3 &  & record \tco{a} to StoreBuffer & \tco{a==1} & \tco{b==0}
+		&  &  & \tco{a==0} \\
+	4 &  & wait & \tco{a==1} & \tco{b==0} &  &
+		remove \tco{a} and response &  \\
+	5 &  & install response to cacheline & \tco{a==1} & \tco{a==0;b==0}
+		&  &  &  \\
+	6 & \tco{b = a + 1;} & load \tco{a==0} from cacheline & \tco{a==1}
+		& \tco{a==0;b==0}
+		&  &  &  \\
+	7 &  & apply StoreBuffer &  & \tco{a==1;b==0} &  &  &  \\
+	8 &  & calculate \tco{a+1} &  & \tco{a==1;b==0} &  &  &  \\
+	9 &  & store \tco{b} &  & \tco{a==1;b==1} &  &  &  \\
+	10 & \tco{assert(b == 2);} & (failed) &  &  &  &  & \\
+	\bottomrule
+\end{tabular}
+}
+\caption{Load without store forwarding}
+\label{tab:app:whymb:Load without store forwarding}
+\end{table*}
 
 The problem is that we have two copies of ``a'', one in the cache and
 the other in the store buffer.
@@ -797,10 +818,9 @@ subsequent loads, without having to pass through the cache.
 \label{fig:app:whymb:Caches With Store Forwarding}
 \end{figure}
 
-With store forwarding in place, item~\ref{item:app:whymb:Need Store Buffer}
-in the above sequence would have found the correct value of 1 for ``a'' in
-the store buffer, so that the final value of ``b'' would have been 2,
-as one would hope.
+With store forwarding in place, Row~7 in the above sequence would have found
+the correct value of 1 for ``a'' in the store buffer, so that the final value
+of ``b'' would have been 2, as one would hope.
 
 \subsection{Store Buffers and Memory Barriers}
 \label{sec:app:whymb:Store Buffers and Memory Barriers}
-- 
2.21.0

