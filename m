Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Bs1QszUufkUjnTb0+difG7CE4SPzU9COTUj7x5JVo7A=;
 b=LZQInQXErb4U3vAm2hoq3mHe/A5MoGiXhDNpagQi7ABNn6b9oAY7/xWdrEr5uZ21n+
 j0SPRXGw9FNJXCinBPIRJ23XTLOWBuBPGmPVrvhV5OXHWyoEBXuUzAL9KhEUIK+WTWh2
 0grLASWeLOY7/ZzGPYd7zNPtAYNPYVQSTNI4mBybPxfUncpU5XSLfoaF2I7YutUqyArX
 jq835EcNn/aKkX6AtVEljup11+MEe8b5KkRjAgvzP+jcyPrceW9ZafCV2tF9k1sDwyn6
 D7jI5hEO1jM0U3WKKj8/blXfivhIu+EGpV+d0UuTq+HEw9s/PFJJV9923fbYrJRZBOS2
 psQg==
Subject: [PATCH 2/2] Enable 'inlinelinks' option of alphapf.bst for 1c layout
References: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b075f22-b247-fe66-f202-e849e39c5f72@gmail.com>
Date: Wed, 28 Dec 2016 00:30:50 +0900
MIME-Version: 1.0
In-Reply-To: <f75680a3-5af7-4c3f-eeb1-f6e13d739f87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3f4f73d738b77422bd074322f3ac67f644a8d580 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 28 Dec 2016 00:06:04 +0900
Subject: [PATCH 2/2] Enable 'inlinelinks' option of alphapf.bst for 1c layout

The "hyperref" package has an issue when a link crosses a page
or column boundary in two column layout.

See:
  http://tex.stackexchange.com/questions/1522/
  http://tex.stackexchange.com/questions/249579/

To avoid this issue, this commit enables "inlinelinks" option only
for one column layout.
For two column layout, original alpha style is selected for the
moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 alphapf.bst           | 2 +-
 appendix/appendix.tex | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/alphapf.bst b/alphapf.bst
index 498e0ee..6a9ec4d 100644
--- a/alphapf.bst
+++ b/alphapf.bst
@@ -69,7 +69,7 @@ FUNCTION {init.urlbst.variables}
   #1 'adddoiresolver :=     % 0=no DOI resolver; 1=include it
   #1 'addpubmedresolver :=     % 0=no PUBMED resolver; 1=include it
   #2 'hrefform :=           % 0=no crossrefs; 1=hypertex xrefs; 2=hyperref refs
-  #0 'inlinelinks :=        % 0=URLs explicit; 1=URLs attached to titles
+  #1 'inlinelinks :=        % 0=URLs explicit; 1=URLs attached to titles

   % String constants, which you _might_ want to tweak.
   "URL: " 'urlintro := % prefix before URL; typically "Available from:" or "URL":
diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index 53abf2b..e94fd28 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -5,6 +5,10 @@
 \include{appendix/whymb/whymemorybarriers}
 \QuickQuizAnswers
 \input{glossary.tex}
-\bibliographystyle{alphapf} % use alpha style customized by urlbst with --inlinelinks option
+\IfTwoColumn{
+\bibliographystyle{alpha}   % Use genuine alpha style
+}{
+\bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
+}
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy}
 \include{appendix/ack/ack}
-- 
2.7.4


