Return-Path: <SRS0=UOrz=2Z=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=sVMRyAjjnARCDIcFd0VcxeZ7HjQd2cqjM+pwABPhz6w=;
        b=HwLza0H2k72lWU6mS9iGxy19W81vZDZ3sk4D4uqhO366yeORXYx2NMI3Z7YUVkMbWx
         WKsVTO5feyoWG/sfVJA0DBnhqYS7qbRoZ3AGFwq7tg41P4p/1UGE4IBJoBj/pONtohDr
         yCLM+MufAIxgYTLuJIUZo4Io35yRc2xenB+2rt3u48usXcbArUvMpSjvlCcq9rhURYfr
         Ph51BQWuO+jdxrcqYt06fLppNKA3/dH9Ooc2VlkJ5jxj14chz2AqCT5WLXEYSC6J+VoQ
         PDfcPcdnhlypGLIe2kHzhd156JwH4c6098WUu++h/YMqmKJ4xKw5WF/IJCo6ssSaht0R
         pTWQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFT PATCH] utilities/toarxiv.sh: Get rid of borders around
 hyperlinks
Message-ID: <70c586e6-a76d-f107-43be-e2f1ee1fa1c9@gmail.com>
Date: Sun, 5 Jan 2020 00:40:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1edf6fb9b98cd74d37a3580f2b482d4d9c0197ad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 4 Jan 2020 20:15:27 +0900
Subject: [RFT PATCH] utilities/toarxiv.sh: Get rid of borders around hyperlinks

Based on a Q&A on StackExchange [1], putting "nohypertex" in
00README.XXX looks like the cause of all those ugly borders.

To override the default behavior of arxiv's hyperref,
add a boolean "toarxiv" in perfbook.tex and set it "true" in
toarxiv.sh so that the workaround code added in the preamble
shall be enabled.

[1]: https://tex.stackexchange.com/questions/30243/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I looked at v2019.12.22a on https://arxiv.org/abs/1701.00854 and found that
some pages in the PDF almost impossible to read because of frequent borders
around hyperlinks.

I'm not sure this change in toarxiv.sh and perfbook.tex actually works on
arxiv.org, but can you try building there and see whether it works or not?

        Thanks, Akira
-- 
 perfbook.tex         | 14 +++++++++++++-
 utilities/toarxiv.sh |  4 ++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 0fae78fb..db334ae4 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -110,10 +110,12 @@
 \newboolean{nimbusavail}
 \setboolean{nimbusavail}{false}
 \newcommand{\IfNimbusAvail}[2]{\ifthenelse{\boolean{nimbusavail}}{#1}{#2}}
-
 \newboolean{colorlinks}
 \setboolean{colorlinks}{false}
 \newcommand{\IfColorLinks}[2]{\ifthenelse{\boolean{colorlinks}}{#1}{#2}}
+\newboolean{toarxiv}
+\setboolean{toarxiv}{false}
+\newcommand{\IfToArxiv}[2]{\ifthenelse{\boolean{toarxiv}}{#1}{#2}}
 
 \IfTwoColumn{}{
 \setboolean{colorlinks}{true}
@@ -123,6 +125,16 @@
 \hypersetup{colorlinks=true,allcolors=MediumBlue}
 }{}
 
+\IfToArxiv{
+\hypersetup{
+    colorlinks=true,
+    linkcolor=black,
+    citecolor=black,
+    filecolor=black,
+    urlcolor=black,
+}
+}{}
+
 \IfNimbusAvail{
 \usepackage{nimbusmononarrow}
 }{}
diff --git a/utilities/toarxiv.sh b/utilities/toarxiv.sh
index 29bce4ea..5e1c6388 100644
--- a/utilities/toarxiv.sh
+++ b/utilities/toarxiv.sh
@@ -79,6 +79,6 @@ rm ${destdir}/SMPdesign/DiningPhilosopher5TB.tex
 
 # The following changes work around arxiv.org limitations
 sed	-e '/usepackage{footnotebackref}/d' \
-	-e 's/\[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]/[bookmarks=false]/' \
+	-e 's/{toarxiv}{false}/{toarxiv}{true}/' \
 	< perfbook.tex > ${destdir}/perfbook.tex
-echo "nohypertex" > ${destdir}/00README.XXX
+# echo "nohypertex" > ${destdir}/00README.XXX
-- 
2.24.1

