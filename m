Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GDjPTW5B4Kn2PEiPYTlaQ5jbjj12X8SS+fKLvkHkYrg=;
        b=AE6zalX6al33h2jB/xTeDj7QoPEMuI8qCt7hICuTi73bQ9fQ2DUJwdNVSdUTNJVz3Q
         V4lsos344VfHKh/oU6UwoWtH3riApE2Wd4DhRX4LNFO+4TcUoVNZl3FdFK1TBKqMSKCY
         s/GGbAVOQbTi+mKi9vLvmUhJ2KTa2LPoiJ5ZWx09LEu0Wm/7RgCyapC1PHvVntPUQIDx
         NMFB9+g4kX7cew5bOsBm9mQhj2Jm8AlBi5/1GDZ1LFokAYULGM8g7xGf6m65BmMfFK8j
         ucGmeOoenIaD68dABsKFe7+CAD10V5Zw+57WLhYAdIFAa2TPZwguDn4QTIeA4C4D7T4+
         vZdw==
Subject: [PATCH 3/3] formal/spinhint: Place footnote inside floating table
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
 <20190207091757.GE4240@linux.ibm.com>
 <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <42cae56d-1e9f-e001-8b76-ebb4a9cdb1e8@gmail.com>
Date: Tue, 12 Feb 2019 00:13:25 +0900
MIME-Version: 1.0
In-Reply-To: <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 05dd848e5c6610278ed6975bcb3cab256b9136d4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 11 Feb 2019 10:43:57 +0900
Subject: [PATCH 3/3] formal/spinhint: Place footnote inside floating table

It turns out the "savenotes" environment tried in commit
5df9ce3b9449 ("formal/spinhint: Put footnote on header in table")
is not robust enough. Depending on the layout, text of a footnote
can appear at the bottom of a page ahead of (or behind) the page
where the floating table itself is typeset.

Putting such footnotes inside a floating table by the help of the
"threeparttable" package looks like an orthodox way recommended
in the LaTeX community [1].

[1]: https://texfaq.org/FAQ-footintab

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 14 ++++++++------
 perfbook.tex        |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index deddbbc..cee1c59 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -852,12 +852,12 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 ./pan [-mN]
 \end{VerbatimU}
 
-\begin{savenotes}
 \begin{table}
+\centering
+\begin{threeparttable}
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.2}
 \footnotesize
-\centering
 \begin{tabular}{S[table-format = 1.0]S[table-format = 1.0]S[table-format = 9.0]
 		S[table-format = 6.0]S[table-format = 5.1]}
 	\toprule
@@ -865,9 +865,7 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 	    \multicolumn{1}{r}{readers} &
 		\multicolumn{1}{r}{\# states} &
 		    \multicolumn{1}{r}{depth} &
-			\multicolumn{1}{r}{memory (MB)\footnote{
-				Obtained with the compiler flag \co{-DCOLLAPSE}
-				specified.}} \\
+			\multicolumn{1}{r}{memory (MB)\tnote{a}} \\
 	\midrule
 	1 & 1 &         376 &      95 &    128.7 \\
 	1 & 2 &       6 177 &     218 &    128.9 \\
@@ -879,10 +877,14 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 	3 & 2 & 186 202 860 & 328 014 & 10 483.7 \\
 	\bottomrule
 \end{tabular}
+\begin{tablenotes}
+	\item [a] Obtained with the compiler flag \co{-DCOLLAPSE}
+		specified.
+\end{tablenotes}
+\end{threeparttable}
 \caption{Memory Usage of QRCU Model}
 \label{tab:advsync:Memory Usage of QRCU Model}
 \end{table}
-\end{savenotes}
 
 The resulting output shows that this model passes all of the cases
 shown in
diff --git a/perfbook.tex b/perfbook.tex
index c740619..9caeee8 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -52,7 +52,7 @@
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
 \usepackage{tabularx}
 \usepackage[hyphens]{url}
-\usepackage{footnote}
+\usepackage{threeparttable}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-- 
2.7.4


