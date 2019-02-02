Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9KB0NByrlJiF3FpAJroztDWawSX1FrEPZqCyBpF18NM=;
        b=BXLH3Dsr7uJfDhvdSQyja9q9CyfVrbuoDnR5lR/J6iAyU4sqhoGxEK0Ld7uoz+tb+I
         FRjaJpQkU4X5jyUO5VnoN2KCbk1zDIzcBKzKIAuvPv+9G9r3cCAHdhKPJzHGys7VGqSO
         06EkVsehPAEvR0mvdpnpDkf/2cXe/S2T2SZW7QQq7V64Ti5JQy0ncadmw9YOudgYHblS
         pWwGHPsBnawvYQVErCMc3mkzeSEDwlLid+aR6QWuyX8KquA3ConZcahGVD5++X4qAo+5
         lArhxiixV4L+uMLrIju0qa//GHTd44Ee3QjQuI2p0lTF2LuieQcAJoEZ6xiUuF6sXlAE
         tbsw==
Subject: [PATCH 5/6] formal/spinhint: Put footnote on header in table
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2319e154-fe35-40a2-cb28-e9ea6d348da5@gmail.com>
Date: Sun, 3 Feb 2019 00:14:45 +0900
MIME-Version: 1.0
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5db712d3f30c38dc5e2dbc6bf0ad68dd0b24870b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 31 Jan 2019 00:14:56 +0900
Subject: [PATCH 5/6] formal/spinhint: Put footnote on header in table

The "savenotes" environment provided by the "footnote" package
allows us to put a footnote in a table whose text is placed at
the bottom of the page.

Also wordsmith the footnote's text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 10 ++++++----
 perfbook.tex        |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 9c56b00..a13374a 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -842,6 +842,7 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 ./pan [-mN]
 \end{VerbatimU}
 
+\begin{savenotes}
 \begin{table}
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.2}
@@ -853,7 +854,9 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 	\multicolumn{1}{r}{updaters} &
 	    \multicolumn{1}{r}{readers} &
 		\multicolumn{1}{r}{\# states} &
-		    \multicolumn{1}{r}{MB} \\
+		    \multicolumn{1}{r}{MB\footnote{
+			Obtained with the compiler flag \co{-DCOLLAPSE}
+			specified.}} \\
 	\midrule
 	1 & 1 &         376 &    128.7 \\
 	1 & 2 &       6 177 &    128.9 \\
@@ -868,12 +871,11 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 \caption{Memory Usage of QRCU Model}
 \label{tab:advsync:Memory Usage of QRCU Model}
 \end{table}
+\end{savenotes}
 
 The resulting output shows that this model passes all of the cases
 shown in
-Table~\ref{tab:advsync:Memory Usage of QRCU Model}.\footnote{
-	Figures in the table are obtained with the \co{-DCOLLAPSE}
-	compiler flag specified.}
+Table~\ref{tab:advsync:Memory Usage of QRCU Model}.
 Now, it would be nice to run the case with three readers and three
 updaters, however, simple extrapolation indicates that this will
 require on the order of a terabyte of memory best case.
diff --git a/perfbook.tex b/perfbook.tex
index 2eb4cd8..c740619 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -52,6 +52,7 @@
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
 \usepackage{tabularx}
 \usepackage[hyphens]{url}
+\usepackage{footnote}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-- 
2.7.4


