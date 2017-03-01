Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Ma1B2uOYmDB8LB18xbCuhvvcxIhjBIvbc/SUrU2D55E=;
 b=Vn77mljMWzsaUGl57i46Ih1mXnd1wTYD4MaVylDTkww+Em2n38sugPCBPFFjv5YkKS
 Zp+OJiVngAqcv7Azb/BbmWimw0IzJ7M5jHo7KkyPMAMVkM6GYwsBFj6QTeHxMvyPKi7T
 3/g/sVZo05pDJiGnqC7Jz0FhEaOV86vobD1DUrdzGf7rQ36LRtbzSn62TL7wh9j7pLY2
 fNPVu/8GKRWVbRNNhExpnnwScAu/KthADjXuvaQCZP+BgGNAjGbwroSRqsS4vcCRVZ/J
 0geNhcMMORSmUN6yKtAmWBvCz5X7FTG0Ts/VFbIQ/mW1YjOCL0e52ZY8pmhYYxhOsUjE
 x2+g==
Subject: [PATCH 2/2] appendix: Draw hyperlink border in bibliography for 1c
 layout
References: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fd1e2b63-a3d5-a9a6-18ff-1418bc6e548d@gmail.com>
Date: Thu, 2 Mar 2017 07:13:21 +0900
MIME-Version: 1.0
In-Reply-To: <b42f2dde-a53b-99dd-ee36-f8d417460695@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f7c3656241243faf11d23bf17fea9da765c260f3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 2 Mar 2017 00:03:34 +0900
Subject: [PATCH 2/2] appendix: Draw hyperlink border in bibliography for 1c layout

Reflecting recent addition of URLs and DOIs in bibliography,
"pdfborder" would be helpful to find embedded links.

As an experiment, this commit enables it for 1c layout.
The color of the border is tuned to "light blue" to be nice for
reader's eyes.

Note: This commit involves indent changes. diff is easier to see
by ignoring white space changes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/appendix.tex | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index 6385bc2..e17c5e1 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -6,13 +6,17 @@
 \QuickQuizAnswers
 \input{glossary.tex}
 \IfTwoColumn{
-\onecolumn\begin{adjustwidth*}{.8in}{.7in}
-%\bibliographystyle{alpha}   % Use genuine alpha style (In case of build failure, use this instead)
-\bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+  \onecolumn\begin{adjustwidth*}{.8in}{.7in}
+  %\bibliographystyle{alpha}   % Use genuine alpha style (In case of build failure, use this instead)
+  \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }{
-\bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+  \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
 }
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy}
 \IfTwoColumn{
-\end{adjustwidth*}\twocolumn}{}
+  \end{adjustwidth*}\twocolumn
+}{
+  \hypersetup{pdfborder=0 0 0}
+}
 \include{appendix/ack/ack}
-- 
2.7.4


