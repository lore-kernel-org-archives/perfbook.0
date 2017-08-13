Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g0h7n7zc6KB78s5Q1RueUborSwFubhyJTZ0iPkabvS0=;
 b=myCF2dhU4z1fY1ulrMoCKscfvAGbxt1i0evisD52T2Sf/zX26kxjMPoxOwHJ+MEMIA
 MSVoUtSObUk1oSXyQfHk3dr9ilE/u1wIyC9QN5CaBwoK0NHRoGb6BnIa1t7IV396HQGp
 4+bN/laVPnTfkx9W+lXiozhevznObcBYGCPtDncMcWjxeAkb3bIzs/My8LEnICD71r21
 uAIxBItj/uqWY2apUXs0cx6OiFMzZsBClnNY16BJubCcjLR3O7P+UVDCbeVRj2iAI2nr
 YPaeqCQPQ+06aiKFJpY47NtR5+YyZQFFMnEpBlW9n8aRS2ddU1xUcsX/H/QDhRByPG1U
 /iOA==
Subject: [PATCH 4/5] styleguide: Add example of options to \num{} command
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <26ad89e6-0704-5cc4-4f53-8c00c76d37e4@gmail.com>
Date: Sun, 13 Aug 2017 12:32:27 +0900
MIME-Version: 1.0
In-Reply-To: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5a9c793796655ca1be1505d544604cd059fd4a48 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 Aug 2017 18:30:34 +0900
Subject: [PATCH 4/5] styleguide: Add example of options to \num{} command

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 46 ++++++++++++++++++++++++++++++++++++--
 perfbook.tex                       |  1 +
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index c90bbe7..0ab9e68 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -242,8 +242,8 @@ in math mode by default.\footnote{
   See \url{https://tex.stackexchange.com/questions/119248/}
   for the historical reason.}

-\subsubsection{Digit Spacing}
-\label{sec:app:styleguide:Digit Spacing}
+\subsubsection{Digit Grouping}
+\label{sec:app:styleguide:Digit Grouping}

 Quote from NIST check list:\footnote{
   \#16 in \url{http://physics.nist.gov/cuu/Units/checklist.html}.
@@ -266,6 +266,48 @@ Quote from NIST check list:\footnote{
 In \LaTeX\ coding, it is cumbersome to place thin spaces as are recommended
 in NIST guide. The \verb|\num{}| command provided by the ``siunitx''
 package would be of help for us to follow this rule.
+It would also help us overcome different conventions.
+We can select a specific digit-grouping style as
+a default in preamble, or specify an option to each \verb|\num{}|
+command as is shown in
+Table~\ref{tab:app:styleguide:Digit-Grouping Style}.
+
+\newcommand{\NumDigitGrpA}{12 345}
+\newcommand{\NumDigitGrpB}{12.345}
+\newcommand{\NumDigitGrp}{1 234 567.89}
+\begin{table}[htbp]
+\small\centering
+\begin{tabular}{lrrr}\toprule
+  Style & \multicolumn{3}{c}{Outputs of \co{\\num\{\}}} \\
+  \midrule
+  NIST/SI (English) & \num{\NumDigitGrpA} & \num{\NumDigitGrpB} & \num{\NumDigitGrp} \\
+  SI (French) & \num[locale=FR]{\NumDigitGrpA} &
+    \num[locale=FR]{\NumDigitGrpB} & \num[locale=FR]{\NumDigitGrp} \\
+  English & \num[group-separator={,},group-digits=integer]{\NumDigitGrpA} &
+    \num[group-separator={,},group-digits=integer]{\NumDigitGrpB} &
+      \num[group-separator={,},group-digits=integer]{\NumDigitGrp} \\
+  French & \num[locale=FR]{\NumDigitGrpA} &
+    \num[locale=FR]{\NumDigitGrpB} & \num[locale=FR]{\NumDigitGrp} \\
+  Other Europe & \num[group-separator={.},output-decimal-marker={,},group-digits=integer]{\NumDigitGrpA} &
+    \num[group-separator={.},output-decimal-marker={,},group-digits=integer]{\NumDigitGrpB} &
+      \num[group-separator={.},output-decimal-marker={,},group-digits=integer]{\NumDigitGrp} \\
+\bottomrule
+\end{tabular}
+\caption{Digit-Grouping Style}
+\label{tab:app:styleguide:Digit-Grouping Style}
+\end{table}
+
+As are evident in
+Table~\ref{tab:app:styleguide:Digit-Grouping Style},
+periods and commas used as other than decimal markers are confusing
+and should be avoided, especially in documents expecting global
+audiences.
+
+By marking up constant decimal values by \verb|\num{}| commands,
+the \LaTeX\ source would be exempted from any particular conventions.
+
+Because of its open-source policy, this approach should give
+more ``portability'' to perfbook.

 \section{\LaTeX\ Conventions}
 \label{sec:app:styleguide:LaTeX Conventions}
diff --git a/perfbook.tex b/perfbook.tex
index f8421ca..9f1644d 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -53,6 +53,7 @@
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}
 \usepackage{braket} % for \ket{} macro in QC section
+\usepackage{siunitx} % for \num{} macro

 % custom packages

-- 
2.7.4


