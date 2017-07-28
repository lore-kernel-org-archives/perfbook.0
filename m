Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rkHg0mljW68FbFrYuQADu1YlVO+mRTkQzO+kc6yvPrM=;
 b=R8CMZn4sncpT5iK3oTH0XZCRumiWiFZTvnsXrWdX3jmCt+60yRYoPzl7lQFBnWoxN8
 5gnbPTXVUFJBazF54+C62G6Jd+0Dkt5gRkul1lv9RWyAGURDevRYdaeD/ZBnW+k/wkZT
 mLWxxdrpszU509pcfgWepITyKAT/51dDYGEOJZ15P+kPM2ylot7Me4k+yQXyPSU/8RaI
 RNPZ27wTRMWe65hl3iEXploxOTDPJTwKoVPWIwwOxkBFb4K+PsfpRXEevz2ZhVYu2okD
 1D40A/zljHPS9cO6nB5vVqeMlaEk4XbfB7k7CXCHI/07z1N4o29wyAzdMBkygeQXe32N
 puxg==
Subject: [PATCH 09/10] styleguide: Add example of preferred table layout using
 'booktabs'
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dab67562-3433-46af-9c4d-8f5c0a79ead1@gmail.com>
Date: Fri, 28 Jul 2017 19:05:41 +0900
MIME-Version: 1.0
In-Reply-To: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 34bcfe5d4ead90d2bec9373e5f5352c5530183c2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 21 Jul 2017 22:31:43 +0900
Subject: [PATCH 09/10] styleguide: Add example of preferred table layout using 'booktabs'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 35 ++++++++++++++++++++++++++++++++++-
 perfbook.tex                       |  1 +
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index dab6ffd..17a74d7 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -758,7 +758,40 @@ look ugly.\footnote{
 Vertical lines should be avoided and horizontal lines should be
 used sparingly, especially in tables of simple structure.

-% TODO: Add example
+For example,
+Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
+can be tweaked by the help of ``booktabs'' package as is shown in
+Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System},
+with the caption at the top.
+
+\begin{table}[htb]\RawFloats
+\renewcommand*{\arraystretch}{1.2}
+\begin{floatrow}[1]\ttabbox[]{
+\small
+\begin{tabular}{@{}lrr@{}}\toprule
+				& 	 	& Ratio \\
+	Operation		& Cost (ns) 	& (cost/clock) \\
+	\midrule
+	Clock period		&           0.6	&           1.0 \\
+	Best-case CAS		&          37.9	&          63.2 \\
+	Best-case lock		&          65.6	&         109.3 \\
+	Single cache miss	&         139.5	&         232.5 \\
+	CAS cache miss		&         306.0	&         510.0 \\
+	Comms Fabric		&       5,000\textcolor{white}{.0}
+						&       8,330\textcolor{white}{.0}
+								\\
+	Global Comms		& 195,000,000\textcolor{white}{.0}
+						& 325,000,000\textcolor{white}{.0} \\
+\bottomrule
+\end{tabular}}{
+\caption{Performance of Synchronization Mechanisms of 4-CPU 1.8\,GHz AMD Opteron 844 System}
+\label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
+}
+\end{floatrow}
+\end{table}
+
+Note that ruled lines of booktabs can not be mixed with
+vertical lines in a table.

 \subsubsection{Miscellaneous Candidates}
 \label{sec:app:styleguide:Miscellaneous Candidates}
diff --git a/perfbook.tex b/perfbook.tex
index 629ecea..16d30dd 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -82,6 +82,7 @@

 \usepackage{floatrowpf} % Use customized floatrow
 \DeclareNewFloatType{listing}{placement=htbp,name=Listing,within=chapter,fileext=lst}
+\usepackage{booktabs} % For better looking tables

 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice

-- 
2.7.4


