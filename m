Return-Path: <SRS0=p/V2=F3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697207896; x=1697812696; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zKFS0Z1IREF2HU00d7YxLJ6GkZEZlcliGTgljDb0oc=;
        b=N7RJw3OHtQseqMN8AKNtwp+9FkNJ8LsjoW+LRFKkNM5e72aDGxXFIK6hAg8m/fY2Oj
         wUJw49bbNnRy5/qA4DwAujdepj1bSvqjuDhJzRSg3yOJXgL+QIn9SkGRcFI7VJ/gX/cr
         5/PcPyTd5vCLsvDrcs6IrnRtSSQu7h3MTQ5EjIsMOrStwvpF79SzCLBc4ILy8DVhU6tI
         79yD7RetOZ0eAgFELrIr4qb2XxAyy1cdmBBarY1ExQvwk5XLJbiC3//1q6SrETVPrlfB
         YFiyr8VVS/k0sRABfC1C58xYPBE89m1I2FH7XomxXnkF3i8vJDqXnpJJ1uZSQnwtC9fE
         0+9w==
Message-ID: <c401ecc6-a63e-42c4-8d2d-9f777c03e33e@gmail.com>
Date: Fri, 13 Oct 2023 23:38:12 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/3] Ignore error of unstable Inkscape
Content-Language: en-US
References: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Recently, conversions of SVG --> PDF are hit by unstability of
command-line runs of Inkscape under the GNOME session/window manager.

There is an issue ticket at the upstream Inkscape repository [1].

It was closed after a bugfix in glib2, but Fedora 38 has not
received the fix.  Furthermore, pre-release Fedora 39, as well as
openSUSE tumbleweed, still has the very similar symptoms.

As a matter of fact, the conversion is properly finished most
of the time when the Inkscape error happened.

So let's add a make variable IGNORE_INKSCAPE_ERROR and ignore error
code from Inkscape when it is enabled.  It is enabled by default.

[1] Issue #4177 "glib2 2.76.0 breaks Command Line export" at
    https://gitlab.com/inkscape/inkscape/-/issues/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index f25baf27d8ad..18639b60cece 100644
--- a/Makefile
+++ b/Makefile
@@ -109,6 +109,7 @@ INKSCAPE := $(shell $(WHICH) inkscape 2>/dev/null)
 ifdef INKSCAPE
   INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
 endif
+IGNORE_INKSCAPE_ERROR ?= 1
 LATEXPAND := $(shell $(WHICH) latexpand 2>/dev/null)
 QPDF := $(shell $(WHICH) qpdf 2>/dev/null)
 
@@ -481,7 +482,11 @@ endif
 ifeq ($(INKSCAPE_ONE),0)
 	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
 else
+  ifneq ($(IGNORE_INKSCAPE_ERROR),0)
+	-@inkscape -o $@ $<i > /dev/null 2>&1
+  else
 	@inkscape -o $@ $<i > /dev/null 2>&1
+  endif
 endif
 	@rm -f $<i
 ifeq ($(chkpagegroup),on)
-- 
2.25.1


