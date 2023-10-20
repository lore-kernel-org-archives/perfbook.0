Return-Path: <SRS0=0yOs=GC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697794176; x=1698398976; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRFWgrTTAcDniHBa987aPxy/QNNHGURshTySxFMPVFc=;
        b=ET+wVwup9yjhq9fPlCK/fYLKLKTlhRraf6CksX5UGyNxWGtrKHIGAyp1hoBnDb01NX
         SmvAnAuaeD8QLfnngcdxCLjB1hcSEikJGupGcCljW7fVNrUUcCq72ATCfP2mWd2ZKyse
         CNvWEp1qHWY6D2caOqPyrDId3a1noQnfLYHpVuwayclQNFB5H0sDl4GTh+CoZS6nM1sN
         6s4NHuL8Rhh2M+4GqAMUA7GioUsQcSmErHk+LD3rnpQq+anTFAHcZg4HME4idTIXVH4h
         sq9cypUrL3LkxuaGHpgrvI0zaFQxkAzehe2PK00acbEtC+F92cm6gBuBst5CFcWRiw6C
         RAgQ==
Message-ID: <f3621f4d-17b8-4c36-8d92-f8f031fe1281@gmail.com>
Date: Fri, 20 Oct 2023 18:29:32 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Prevent inkscape from interacting with desktop
 manager
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Crashes of command-line Inkscape happens when it exits too soon
before it can be properly removed from window manager's list of
applications it is aware of.
Glib 2.75.3 has removed GSlice allocator [1], which was permissive
about UAF issues.

Question is, "why is the command-line Inkscape registered in
such a list in the first place?"

There is mention of an option named "--without-gui" in Inkscape's
wiki page on "Using the Command Line" [2]:

    The --without-gui option has been removed. Most parameters
    trigger Inkscape to run without GUI by default now. Instead
    enable GUI mode specifically using --with-gui if needed.

However, current Inkscape does *initialize* itself as a GUI
application regardless of the need of GUI.

Alternatively, Inkscape can be forced to run isolated from window/
desktop managers with bogus strings set to a couple of env variables.

After some tries and errors, these two env variables turned out
to be essential here:

    - XDG_RUNTIME_DIR
    - DBUS_SESSION_BUS_ADDRESS

Update Makefile and set bogus strings to them, which sounds a little
rough but should be better than ignoring error codes, after reverting
commits:

    - c2f9a99366b3 ("Ignore error of unstable Inkscape")
    - a01629a5f734 ("Make sure all PDF conversions are complete")

This change resolves crashes of Inkscape observed under Fedora 38,
Fedora 39 beta, Ubuntu 23.04, and openSUSE tumbleweed.

[1]: https://gitlab.gnome.org/GNOME/glib/-/issues/1079
[2]: https://wiki.inkscape.org/wiki/index.php/Using_the_Command_Line

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 3875c52b..424a166c 100644
--- a/Makefile
+++ b/Makefile
@@ -111,7 +111,6 @@ INKSCAPE := $(shell $(WHICH) inkscape 2>/dev/null)
 ifdef INKSCAPE
   INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
 endif
-IGNORE_INKSCAPE_ERROR ?= 1
 LATEXPAND := $(shell $(WHICH) latexpand 2>/dev/null)
 QPDF := $(shell $(WHICH) qpdf 2>/dev/null)
 
@@ -267,10 +266,6 @@ endif
 autodate.tex: $(LATEXSOURCES) $(BIBSOURCES) $(LST_SOURCES) \
     $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS) \
      $(GITREFSTAGS) utilities/autodate.sh
-ifneq ($(IGNORE_INKSCAPE_ERROR),0)
-	# Make sure all SVG --> PDF conversions are complete
-	$(MAKE) -j1 figs
-endif
 	sh utilities/autodate.sh
 
 perfbook_flat.tex: autodate.tex
@@ -455,6 +450,9 @@ else
   include epstopdf-rule.mk
 endif
 
+# bogus settings for preventing Inkscape from interacting with desktop manager
+ISOLATE_INKSCAPE ?= XDG_RUNTIME_DIR=na DBUS_SESSION_BUS_ADDRESS=na
+
 $(PDFTARGETS_OF_SVG): $(FIXSVGFONTS)
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
 	@echo "$< --> $(suffix $@)"
@@ -488,11 +486,7 @@ endif
 ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 else
-  ifneq ($(IGNORE_INKSCAPE_ERROR),0)
-	-@inkscape -o $@ $<i > /dev/null 2>&1
-  else
-	@inkscape -o $@ $<i > /dev/null 2>&1
-  endif
+	@$(ISOLATE_INKSCAPE) inkscape -o $@ $<i > /dev/null 2>&1
 endif
 	@rm -f $<i
 ifeq ($(chkpagegroup),on)

base-commit: 0ecdabe67aae15f616e4a6ffeda8c4f76ff385ae
-- 
2.34.1

