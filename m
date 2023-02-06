Return-Path: <SRS0=8Upf=6C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6UUHvMC0WlYOEpyT/C4RhmtnXojoX3xKlDiHDvYgEg=;
        b=is52MhOL6wuwtTZdbUgJP3QQrH9Z/eERnakWzis8T665LKG0Ja7tGI9+rEWecbMmK3
         p3/JHjOXp64R67vWGMswohxRzR03hUMj2az0Ec4L/cHTo18yli1DiTDwDpB9j3icDeA2
         JJHJ5KZHK1HTgglaF0Hl81tppesMkow8C85GElB7VpYpoNcFXjLaKf+Vtw+y19WhCYdd
         yUJGYEcODhcFYBKoFpswX0Ap/PC6hgty5kf9ygCg7idgOVUd35lsrO5MzTgIkMqONta1
         A0jc/PwveJU08MoH/fv5qIZaRuo/E1RBE2b0M9ICdYECdz4qoQZud8QSiKK+BkRZ85tr
         +/hg==
Message-ID: <34b60e3b-b9e3-f645-8fb1-9a3743314166@gmail.com>
Date: Mon, 6 Feb 2023 17:47:37 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] gitlab-ci.yml: Add Liberation font families for PDF
 build
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There are a couple of SVG files that use the "Liberation Sans" and
"Liberation Mono" font families, namely defer/multver.svg (Figure 9.15)
and memorder/Alpha.svg (Figure 15.17), among others.
When those font families are not found, Inkscape falls back to
whatever available ones with similar properties.

This dependency is not explicitly mentioned in FAQ-BUILD.txt,
because they are installed as dependencies of required packages
listed for Ubuntu and Fedora.

As for Arch Linux, "ttf-liberation" should cover them.

In Makefile, add check of these font families and advises on missing
nice-to-have font packages.

Expand the answer to #9 in FAQ-BUILD.txt and explain these nice-to-
have fonts for SVG figures.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>
---
 FAQ-BUILD.txt           | 26 +++++++++++++++++++++++++-
 Makefile                | 24 ++++++++++++++++++++++--
 utilities/gitlab-ci.yml |  2 +-
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 1ea9d92c90b0..a4d9d86d6ada 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -122,7 +122,7 @@
 	"nimbus15", "newtxtt", etc.; or an old version of font package
 	"newtx".  How can I install or update them?
 
-	A.	First of all, building perfbook requires TeX Live 2017/Debian
+	A-1.	First of all, building perfbook requires TeX Live 2017/Debian
 		(Ubuntu Bionic) or later. If you are told you don't have
 		"glossaries-extra" package, you need to upgrade your TeX
 		installation.
@@ -179,6 +179,30 @@
 		On upstream TeX Live (assuming user mode installation):
 			tlmgr install newtx
 
+	A-2.	Figures drawn using Inkscape and added in the SVG format
+		need fonts accessible via the fontconfig scheme.
+		The "Steel City Comic" font mentioned in #1 of FAQ.txt
+		is one of such fonts and is mandatory.
+		There are SVG figures which use other font families
+		listed below:
+
+		  - DejaVu Sans Mono
+		  - FreeMono
+		  - Liberation Sans
+		  - Liberation Mono
+
+		These are treated as "nice-to-have" fonts and even if
+		some of them are missing, conversion of those figures into
+		PDF can go on using fallback fonts.
+		You will see info-level messages from make runs:
+
+		  Nice-to-have font family 'DejaVu Sans Mono' not found.
+
+		in .svg --> .pdf conversions if that happens.
+
+		As for Ubuntu and Fedora, packages listed in #5 should cover
+		all the font families needed.
+
 10.	Building perfbook fails with a warning of buggy cleveref or
 	version mismatch of epigraph.
 	What can I do?
diff --git a/Makefile b/Makefile
index abcd7e2ce1cc..98c7c91b4be7 100644
--- a/Makefile
+++ b/Makefile
@@ -125,6 +125,8 @@ NEWTXSF := $(findstring newtxsf,$(FONTPACKAGES))
 INCONSOLATA := $(findstring inconsolata,$(FONTPACKAGES))
 FREESANS := $(shell fc-list | grep FreeSans | wc -l)
 DEJAVUMONO := $(shell fc-list | grep "DejaVu Sans Mono" | wc -l)
+LIBERATIONSANS := $(shell fc-list | grep "Liberation Sans" | wc -l)
+LIBERATINOMONO := $(shell fc-list | grep "Liberation Mono" | wc -l)
 
 # for line break in error text
 define n
@@ -151,6 +153,17 @@ ifeq ($(DEJAVUMONO),0)
 else
   RECOMMEND_DEJAVU := 0
 endif
+ifeq ($(LIBERATIONSANS),0)
+  RECOMMEND_LIBERATIONSANS := 1
+else
+  RECOMMEND_LIBERATIONSANS := 0
+endif
+ifeq ($(LIBERATIONMONO),0)
+  RECOMMEND_LIBERATIONMONO := 1
+else
+  RECOMMEND_LIBERATIONMONO := 0
+endif
+
 
 STEELFONTID := $(shell fc-list | grep -i steel | grep -c Steel)
 
@@ -456,11 +469,18 @@ else
 	@sh $(FIXSVGFONTS) < $< > $<i
 endif
 ifeq ($(RECOMMEND_FREEFONT),1)
-	$(info Nice-to-have font package 'gnu-freefont' not found. See #9 in FAQ-BUILD.txt)
+	$(info Nice-to-have font family 'FreeMono' not found. See #9 in FAQ-BUILD.txt)
 endif
 ifeq ($(RECOMMEND_DEJAVU),1)
-	$(info Nice-to-have font package 'dejavu' not found. See #9 in FAQ-BUILD.txt)
+	$(info Nice-to-have font family 'DejaVu Sans Mono' not found. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(RECOMMEND_LIBERATIONSANS),1)
+	$(info Nice-to-have font family 'Liberation Sans' not found. See #9 in FAQ-BUILD.txt)
 endif
+ifeq ($(RECOMMEND_LIBERATIONMONO),1)
+	$(info Nice-to-have font family 'Liberation Mono' not found. See #9 in FAQ-BUILD.txt)
+endif
+
 ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 else
diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index 675793cc0ebd..9545029ee34c 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -18,7 +18,7 @@ generate_pdfs:
     stage: build
 
     before_script:
-        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
+        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
         - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
         - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
         - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1

base-commit: 9217963cbb7046616a6ad21813f88a3d0423cbbe
-- 
2.25.1

