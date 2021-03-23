Return-Path: <SRS0=VvRJ=IV=gmail.com=bsingharora@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dmw6nTt32HY5cEkIXD5j76WGvJm5+tyQZW86yYP1HVY=;
        b=o8xaLk3a9SWf69kw4tWRXvcjvXjdjnuGB3zLv9/cAQMXcf/Ss0uFbqRm5KVQDsg0gU
         iLAsUNo1Ugp7qIDh+9deNOF5/nthpQ3Iy9oNLiAdBXLu1YZVD6cU1qqNrw12ZtSEfmwy
         xOEMgnSo0Rs6dYmvD6sOZCbwhUoG6Oe2eFZg5u6nAPhrFtDPflh/05CsDwQVnemomJrb
         Gqz5Q5G/U/TjbUxbkGWqjKUDgG05ZopxeG70L68H4Kr8FSWhAUdYQOvrbZ0GB4EcPyPK
         3l8ayBb/osuHdxJENUh86/yWQViozdJNvuW6T0RlzcpI0pIX6Vxura8KCmU597B2bfsB
         rGeQ==
Date: Tue, 23 Mar 2021 20:38:22 +1100
From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [RFC PATCH] perfbook/papersize: ebook reader size support
Message-ID: <20210323093822.GJ77072@balbir-desktop>
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323052354.GS2696@paulmck-ThinkPad-P72>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Mar 22, 2021 at 10:23:54PM -0700, Paul E. McKenney wrote:
> On Tue, Mar 23, 2021 at 12:01:53PM +1100, Balbir Singh wrote:
...
> Very good!
> 
> But would it be possible to create a separate build target for this
> combination?  Just in case others are using 1c for normal-sized paper?
> 

Add support for ebooksize, which is roughly the size of
a kindle (4.5in, 6.3in) with margin size of 0.2in. The
recommended changes were taken from stackexchange with
links in the code. Not all tables take nicely to the
new size and warnings are produced, these warnings are about
about overfull hbox's. This size/target also enforces
single column output and increases the size of the pdf
by almost 40% in terms of number of pages. The actual size
on the disk is not all that different. The final output
though is very readable on the kindle I own.

I've been running the command via

env PERFBOOK_PAPER=ER make perfbook-er.pdf

TODOs:
1. Make tables and some figures work nicely in this mode
2. Consider scaling the font

Signed-off-by: Balbir singh <bsingharora@gmail.com>
---
 Makefile        | 10 +++++++++-
 perfbook-lt.tex | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index db20da96..37ee76aa 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex sub_qqz
 # parallel runs of divideqqz.pl.
 
 TWOCOLTARGETS := mstx msr msn msnt sf qq nq ix
-ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
+ABBREVTARGETS := lt hb a4 1c tcb msns mss er $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
 
 PDFTARGETS := perfbook.pdf $(foreach v,$(ABBREVTARGETS),perfbook-$(v).pdf)
 GENERATED_MAIN := $(filter-out perfbook-lt.tex,$(foreach v,$(ABBREVTARGETS),perfbook-$(v).tex)) perfbook.tex
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
@@ -283,6 +287,10 @@ perfbook-1c.tex: $(PERFBOOK_BASE)
 perfbook-hb.tex: perfbook-lt.tex
 	sed -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
 
+perfbook-er.tex: perfbook-lt.tex
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
2.25.1

