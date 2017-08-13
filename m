Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DzDAyhbihlefVBxzXe5TxklDS6HDmKs/5nwxNoWdGCw=;
 b=G4NoznMz6PpObzOB2snm/vTvBJM4E7f9lQmCJz/zWeKI42wgw8t+FUIcWNRu06L3pE
 MQ635ap+0yfy+WcfqMtmwp0CEWU5m84wpmVHHaYDSfXQwLaWysCQ68iY3j3aK02u9Tu9
 9P12hpT8/uctYq/uNwpL8ff28XPKEh84MIk0kW6bpnfJPR1vrFjguUomxB25lXyuWswo
 6tdgxxhtmNC068vu60HSizBKIbIZfc3winU4fO9HSPW90BNzr0nygKudPJMpu6lj8w4i
 BJtm60t/+VrAXAMcONywP5rIFdZDz/Sq3yV2QWpd04lJsNwOSTAMP5QKXHKV8QnqSrDS
 LMhA==
Subject: [PATCH 1/5] styleguide: Add examples of alternative table layout
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <45eed575-58f0-b583-f8a7-e0167655eb1b@gmail.com>
Date: Sun, 13 Aug 2017 12:29:06 +0900
MIME-Version: 1.0
In-Reply-To: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f6016bad16a5f46896aba335168d9e95e375e861 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 9 Aug 2017 19:48:03 +0900
Subject: [PATCH 1/5] styleguide: Add examples of alternative table layout

Add examples using:
  1) ruled lines of "booktabs" package,
  2) color alternate rows using "table" option of xcolor.

Also add footnote on "arydshln" package's conflict with
tabulary package.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 86 +++++++++++++++++++++++++++++++++++++-
 perfbook.tex                       |  3 +-
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 829a9c2..6b41897 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -808,7 +808,91 @@ look ugly.\footnote{
 Vertical lines should be avoided and horizontal lines should be
 used sparingly, especially in tables of simple structure.

-% TODO: Add example
+For example,
+Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
+can be tweaked by the help of ``booktabs'' package as is shown in
+Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System},
+with the caption at the top.
+
+\floatstyle{plaintop}
+\restylefloat{table}
+\captionsetup[table]{position=top,hangindent=30pt}
+\renewcommand*{\abovetopsep}{-7pt}
+
+\begin{table}[htb]
+\renewcommand*{\arraystretch}{1.2}\centering\small
+\begin{tabular}{@{}lrr@{}}\toprule
+
+	Operation		& Cost (ns) 	& \parbox[b]{.7in}{\raggedleft Ratio\par (cost/clock)} \\
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
+\end{tabular}
+\caption{Performance of Synchronization Mechanisms of 4-CPU 1.8\,GHz AMD Opteron 844 System}
+\label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
+\end{table}
+
+Note that ruled lines of booktabs can not be mixed with
+vertical lines in a table.\footnote{
+  There is another package named ``arydshln'' which provides dashed lines
+  to be used in tables.
+  Unfortunately, it conflicts with the tabulary package and prevents us
+  from experimenting it for the moment.
+}
+
+Another option is to color rows alternately by using the feature of xcolor
+package. For example,
+Table~\ref{tab:future:Refrigeration Power Consumption}
+can be tweaked as shown in
+Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}.
+\definecolor{lightgray}{gray}{0.9}
+
+\begin{table}[htbp]
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}\centering\small
+\begin{tabular}{lrrr}\toprule
+Situation
+	& $T$ (K)
+		& $C_P$	& \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+\midrule
+Dry Ice
+	& $195$
+		& $1.990$
+			& 0.5 \\
+Liquid N$_2$
+	& $77$
+		& $0.356$
+			& 2.8 \\
+Liquid H$_2$
+	& $20$
+		& $0.073$
+			& 13.7 \\
+Liquid He
+	& $4$
+		& $0.0138$
+			& 72.3 \\
+IBM~Q	& $0.015$
+		& $0.000051$
+			& 19,500.0 \\
+\bottomrule
+\end{tabular}
+\caption{Refrigeration Power Consumption}
+\label{tab:app:styleguide:Refrigeration Power Consumption}
+\end{table}
+
+\floatstyle{plain}
+\restylefloat{table}
+\captionsetup[table]{position=bottom,hangindent=0pt}
+\renewcommand*{\abovetopsep}{0pt}

 \subsubsection{Miscellaneous Candidates}
 \label{sec:app:styleguide:Miscellaneous Candidates}
diff --git a/perfbook.tex b/perfbook.tex
index 8f166ec..23146ad 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -33,7 +33,7 @@
 \setlist[description]{style=unboxed}
 %\usepackage{enumerate}
 \usepackage{ifthen}
-\usepackage{xcolor}
+\usepackage[table]{xcolor}
 \usepackage[shortcuts]{extdash}
 \usepackage{changepage}
 \usepackage{listings}
@@ -89,6 +89,7 @@
 \newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}

 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice
+\usepackage{booktabs}

 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
-- 
2.7.4


