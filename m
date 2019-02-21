Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tXnbOgypQONTr5knUZfBDFNCN8vLLD0/UkSed7WDjI4=;
        b=EcTHF5yR7Te1/D8s1hSg6BnO051Th889YQjNjMI3SxE32GOM+kMccudqZwLbAP+0na
         HK6Px4zu6zGODhhSS/XxnsEuDNATOcWXMKgafCb1Th9F7rTG91BMJBRkGT/ODwCQVnUZ
         oXk99IFZloAsARtXKSvr7DJsTqnVr72ZNdyiaw7eI/l+rBkJzV6jgkgmwoJ8LUxN6+8o
         CTAcwRhlpQ/PFln8koncIeKFwOQ5qAKUToQsRIjpSC/35slForelP20OB3axjKmeSSs2
         MHy7R7s+O/HK2fShg5yuO+/IFRAdT5BOlQkUDU1Pd30xYYMP2T7Hf+ACWNLU/h0ycGXW
         6U9g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer/rcuapi: Tweak Table 9.3 with nimbusmononarrow font
Message-ID: <9fa82034-79e2-be24-1a2a-4e6232ce7009@gmail.com>
Date: Fri, 22 Feb 2019 00:38:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3f0a889f86203934737055e129d574cc1232a8b1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 21 Feb 2019 23:36:24 +0900
Subject: [PATCH] defer/rcuapi: Tweak Table 9.3 with nimbusmononarrow font

"nimbusmononarrow" font (used in the experimental target "msn")
is slightly narrower than "lmtt". Table 9.3 hardly fits in
a page with the lmtt font. nimbusmononarrow gives us some room
for a possible new API with longer name.

This change affects targets msnt, 1csf, msr, and msn.
Those targets can be built on TeX Live 2015/Debian or later.

As for the other targets, specifying width of every column
makes "tabularx" unnecessary. Plain "tabular" suffices. 

Once everyone (especially our editor) upgrades his/her LaTeX
installation, all the target will be able to use the same font
in this table.

For bold face characters in the table header, use \pmb{} instead
of {\bf ...}, as lmtt's bold face is not bold enough and
nimbusmononarrow lacks bold face font.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         | 16 ++++++++++------
 defer/rcuapi.tex | 29 +++++++++++++++++++----------
 perfbook.tex     | 15 +++++++++++----
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 7a6d156..4547256 100644
--- a/Makefile
+++ b/Makefile
@@ -168,23 +168,27 @@ perfbook-mstx.tex: perfbook.tex
 	sed -e 's/%msfontstub/\\renewcommand*\\ttdefault{txtt}/' < $< > $@
 
 perfbook-msr.tex: perfbook.tex
-	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{nimbusmono}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{nimbusmono}/' \
+	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msn.tex: perfbook.tex
 	sed -e 's/%msfontstub/\\usepackage{nimbusmononarrow}/' \
-	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' < $< > $@
+	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' \
+	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msnt.tex: perfbook.tex
-	sed -e 's/%msfontstub/\\usepackage[zerostyle=a]{newtxtt}/' < $< > $@
-	@echo "## This target requires font package newtxtt. ##"
-	@echo "## If build fails, try target 'mstx' instead. ##"
+	sed -e 's/%msfontstub/\\usepackage[zerostyle=a]{newtxtt}/' \
+	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' < $< > $@
+	@echo "## This target requires font packages newtxtt and nimbus15. ##"
+	@echo "## If build fails, try target 'mstx' instead.               ##"
 
 perfbook-1csf.tex: perfbook-1c.tex
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
+	    -e 's/{nimbusavail}{false}/{nimbusavail}{true}/' \
 	    -e 's/%msfontstub/\\usepackage[var0]{inconsolata}[2013\/07\/17]/' < $< > $@
-	@echo "## This target requires math font package newtxsf. ##"
+	@echo "## This target requires math font packages newtxsf and nimbus15. ##"
 
 # Rules related to perfbook_html are removed as of May, 2016
 
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index a98b5e8..644a937 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -758,16 +758,25 @@ Section~\ref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
 \caption{RCU-Protected List APIs}
 \label{tab:defer:RCU-Protected List APIs}
 \footnotesize
-\begin{tabularx}{8.4in}{>{\raggedright\arraybackslash}X
-    >{\raggedright\arraybackslash}X
-    >{\raggedright\arraybackslash}X
-    >{\raggedright\arraybackslash}p{1.7in}}
+\newlength{\cwa}\newlength{\cwb}\newlength{\cwc}\newlength{\cwd}
+\IfNimbusAvail{
+  \renewcommand{\ttdefault}{NimbusMonoN}
+  \setlength{\cwa}{1.9in}\setlength{\cwb}{2.1in}
+  \setlength{\cwc}{1.8in}\setlength{\cwd}{1.6in}
+}{
+  \setlength{\cwa}{1.95in}\setlength{\cwb}{2.15in}
+  \setlength{\cwc}{1.9in}\setlength{\cwd}{1.7in}
+}
+\begin{tabular}{>{\raggedright\arraybackslash}p{\cwa}
+    >{\raggedright\arraybackslash}p{\cwb}
+    >{\raggedright\arraybackslash}p{\cwc}
+    >{\raggedright\arraybackslash}p{\cwd}}
 \toprule
-{\bf \tco{list}}: Circular doubly linked list &
-    {\bf \tco{hlist}}: Linear doubly linked list &
-	{\bf \tco{hlist_nulls}}: Linear doubly linked list with marked
-	NULL pointer, with up to 31 bits of marking &
-	    {\bf \tco{hlist_bl}}: Linear doubly linked list with bit locking \\
+\pmb{\tco{list}}: Circular doubly linked list &
+    \pmb{\tco{hlist}}: Linear doubly linked list &
+	\pmb{\tco{hlist_nulls}}: Linear doubly linked list with marked
+	NULL pointer, with up to 31~bits of marking &
+	    \pmb{\tco{hlist_bl}}: Linear doubly linked list with bit locking \\
 \midrule
 \multicolumn{4}{l}{{\bf Initialization}} \\
 &
@@ -832,7 +841,7 @@ Section~\ref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
 	&
 	    \\
 \bottomrule
-\end{tabularx}
+\end{tabular}
 \end{sidewaystable*}
 
 The first pair of categories operate on Linux
diff --git a/perfbook.tex b/perfbook.tex
index edf18d5..f79e7b0 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -9,8 +9,6 @@
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage[defaultsups]{newtxtext} % use nice, standard fonts for roman
 \usepackage{textcomp} % use symbols in TS1 encoding
-\renewcommand*\ttdefault{lmtt}
-%msfontstub
 
 % Improves the text layout
 \usepackage{microtype}
@@ -91,6 +89,15 @@
 \newboolean{tblcptop}
 \setboolean{tblcptop}{true}
 \newcommand{\IfTblCpTop}[2]{\ifthenelse{\boolean{tblcptop}}{#1}{#2}}
+\newboolean{nimbusavail}
+\setboolean{nimbusavail}{false}
+\newcommand{\IfNimbusAvail}[2]{\ifthenelse{\boolean{nimbusavail}}{#1}{#2}}
+
+\IfNimbusAvail{
+\usepackage{nimbusmononarrow}
+}{}
+\renewcommand*\ttdefault{lmtt}
+%msfontstub
 
 \newcommand{\OneColumnHSpace}[1]{\IfTwoColumn{}{\hspace*{#1}}}
 
@@ -127,8 +134,8 @@
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{table}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{lmtt}}
-\AtBeginEnvironment{tabularx}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{table*}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{sidewaystable*}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{listing}{\renewcommand{\ttdefault}{lmtt}}
 \fvset{fontfamily=lmtt}
-- 
2.7.4

