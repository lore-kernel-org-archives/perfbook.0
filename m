Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g6ksUcfOOjxRdiaFdcsMwcPznsGHHZ3Pqgxl4FCOKUA=;
        b=BzsAZnvaZZZjgFQy6KCKXauMBzPLExMUuf7rwtJw75zmSirYako2ovpLCV8YVhJgaX
         OvgMmjSpWY7V1NLbkGKz2C+VyWFOt5qF/zZrO+1J1OIBEpNmkUGF474SRtTk8hwdAXxs
         RDfeS5mRkhIz/4uGEIi2QGHbPUfeTjUnOIRlts/+QOtfSllRGrwqETgFmx6k/zin3+Bv
         oH3gGZsE36ffWqgHpAV9hB0Dqk/qVFxi9olwrOi1QkGXrxz4qpHvO8KTKOC66ZSCgW1l
         a+iD351J5nWeCgRDiL+ct/gCZYiSXPyUEKPjGmGNI+ms14NMLwj3+s8Ca+d6E9UypLR1
         WttQ==
Subject: [PATCH -perfbook 1/5] perfbook/papersize: ebook reader size support
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a259ca25-cb15-781f-dcdf-b1c6eef7a2c7@gmail.com>
Date: Thu, 25 Mar 2021 19:52:25 +0900
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: Balbir Singh <bsingharora@gmail.com>

Add support for ebooksize, which is roughly the size of
a kindle (4.5in, 6.3in) with margin size of 0.2in. The
recommended changes were taken from stackexchange with
links in the code. Not all tables take nicely to the
new size and warnings are produced, these warnings are
about overfull hbox's. This size/target also enforces
single column output and increases the size of the pdf
by almost 40% in terms of number of pages. The actual size
on the disk is not all that different. The final output
though is very readable on the kindle I own.

PDF of ebooksize can be built by either:

    make perfbook-eb.pdf

or

    env PERFBOOK_PAPER=EB make perfbook.pdf

TODOs:
1. Make tables and some figures work nicely in this mode
2. Consider scaling the font

Signed-off-by: Balbir singh <bsingharora@gmail.com>
[akiyks: changed target & env name to "eb" and "EB", massage commit log]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile        | 10 +++++++++-
 perfbook-lt.tex | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index db20da96..415bcef3 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex sub_qqz
 # parallel runs of divideqqz.pl.
 
 TWOCOLTARGETS := mstx msr msn msnt sf qq nq ix
-ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
+ABBREVTARGETS := lt hb a4 1c tcb msns mss eb $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
 
 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)
 GENERATED_MAIN := $(filter-out perfbook-lt.tex,$(foreach v,$(ABBREVTARGETS),perfbook-$(v).tex)) perfbook.tex
@@ -178,10 +178,14 @@ ifeq ($(PERFBOOK_PAPER),A4)
 else
 ifeq ($(PERFBOOK_PAPER),HB)
 	PERFBOOK_BASE = perfbook-hb.tex
+else
+ifeq ($(PERFBOOK_PAPER),EB)
+	PERFBOOK_BASE = perfbook-eb.tex
 else
 	PERFBOOK_BASE = perfbook-lt.tex
 endif
 endif
+endif
 
 .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help help-official help-full
 all: $(targ)
@@ -283,6 +287,10 @@ perfbook-1c.tex: $(PERFBOOK_BASE)
 perfbook-hb.tex: perfbook-lt.tex
 	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
 
+perfbook-eb.tex: perfbook-lt.tex
+	sed -e 's/setboolean{ebooksize}{false}/setboolean{ebooksize}{true}/' < $< > $@
+	sed -i 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' $@
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
2.17.1


