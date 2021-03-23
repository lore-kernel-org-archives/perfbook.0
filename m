Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhCWBB7 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 22 Mar 2021 21:01:59 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C357C061574
        for <perfbook@vger.kernel.org>; Mon, 22 Mar 2021 18:01:59 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id x26so12507951pfn.0
        for <perfbook@vger.kernel.org>; Mon, 22 Mar 2021 18:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=ajPfyfgN9QM3FxAoaE+uSOh2GOvBtbxwylr10hCIZps=;
        b=X88RNl5FMUbggj5EAkQ+ROoTSBjwwjn2x9QRD8mRDUlq4lV/V7TWwY4nn4xPAjNuut
         WamP5d4W0Y1f3LgoePHixITq1uierixMeCx0iS4f4Ihw/vya9+Lv4r2t3VnL/XyyWrqb
         rf+ntwBCiKOF5FI+iMQRrm+i1GQVOHeJCAnOzUGSaLgiDCNcquQdaKNmhW3d7JpRSrpu
         oOzN+M4zZm2swazHGiPS/sPTDkEnC58hWUlMYJma/6BQaCUoF9slI1INh+v59EbDR3F9
         k7p1MNbgUrspdADqOt9U9bHbcEAJm/gzqj+toiERU3XYbskhTWGiiLHVsq/9vqaItrQ8
         4r/Q==
Received: from localhost (121-45-173-48.tpgi.com.au. [121.45.173.48])
        by smtp.gmail.com with ESMTPSA id r1sm548426pjo.26.2021.03.22.18.01.56
        for <perfbook@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 18:01:56 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:01:53 +1100
From: Balbir Singh <bsingharora@gmail.com>
Subject: [RFC PATCH] perfbook/papersize: ebook reader size support
Message-ID: <20210323010153.GH77072@balbir-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org


Add support for ebooksize, which is roughly the size of
a kindle (4.5in, 6.3in) with margin size of 0.2in. The
recommended changes were taken from stackexchange with
links in the code. Not all tables take nicely to the
new nice and warnings are produced, which causes warnings
about overfull hbox's to be generated. This mode enforces
single column output and increases the size of the pdf
by almost 40% in terms of number of pages. The final output
though is very readable on the kindle I own.

I've been running the command via

env PERFBOOK_PAPER=ER make perfbook-1c.pdf

and love the output so far.

Signed-off-by: Balbir singh <bsingharora@gmail.com>
---
 Makefile        |  7 +++++++
 perfbook-lt.tex | 13 ++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index db20da96..3732ba18 100644
--- a/Makefile
+++ b/Makefile
@@ -178,10 +178,14 @@ ifeq ($(PERFBOOK_PAPER),A4)
 else
 ifeq ($(PERFBOOK_PAPER),HB)
 	PERFBOOK_BASE = perfbook-hb.tex
+else
+ifeq ($(PERFBOOK_PAPER),ER)
+	PERFBOOK_BASE = perfbook-er.tex
 else
 	PERFBOOK_BASE = perfbook-lt.tex
 endif
 endif
+endif
 
 .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help help-official help-full
 all: $(targ)
@@ -283,6 +287,9 @@ perfbook-1c.tex: $(PERFBOOK_BASE)
 perfbook-hb.tex: perfbook-lt.tex
 	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
 
+perfbook-er.tex: perfbook-lt.tex
+	sed -e 's/setboolean{ebooksize}{false}/setboolean{ebooksize}{true}/' < $< > $@
+
 perfbook-msns.tex: $(PERFBOOK_BASE)
 	sed -e 's/%msfontstub/\\usepackage{courier}/' < $< > $@
 
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index e76d4d7b..a884011a 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -116,6 +116,9 @@
 \newboolean{hardcover}
 \setboolean{hardcover}{false}
 \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
+\newboolean{ebooksize}
+\setboolean{ebooksize}{false}
+\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
 \newboolean{afourpaper}
 \setboolean{afourpaper}{false}
 \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
@@ -320,6 +323,14 @@
       \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}      
 }}}{ % One Column
   \setlength{\twocolumnwidth}{3.125in}
+  \IfEbookSize {
+    % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
+    \usepackage[papersize={4.5in,6.3in},margin=0.2in,onecolumn]{geometry}
+    \sloppy
+    %\pagestyle{empty}
+    %\usepackage[scaled]{helvet}
+    %\renewcommand{\familydefault}{\sfdefault}
+  }{
   \IfHardCover{
     \usepackage[papersize={8.25in,10.75in},body={4.75in,8.25in},onecolumn]{geometry}
   }{
@@ -327,7 +338,7 @@
     \usepackage[a4paper,body={4.75in,8.25in},onecolumn]{geometry}
     }{
     \usepackage[letterpaper,body={4.75in,8.25in},onecolumn]{geometry}
-  }}
+  }}}
   \geometry{hcentering=true} % horizontal centering for 1c layouts
 }
 \IfAfourPaper{
-- 
2.25.1

