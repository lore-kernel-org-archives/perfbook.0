Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCEC224D6
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUD8L+FY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6dac225bf42so827018b3a.0
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448053; x=1705052853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFljEa0mUm0Gg4T0yvHZ8ZsrT7giCZb+Xl2jWN1PVF0=;
        b=JUD8L+FYeWrC60H2POgC7FdrziO1TgJ+TDILJpbyiVYTJ2R28cw9WWXkl2KGB12dnq
         h65Pb/oRiCBVov+VnGK0NcrNic+V9KQlQN47oIHs0rGptkI7rr4HNj66NTjrspI1iTC8
         bR2oc6sdftZQiOVIO5koW+fybcOxG9wMSwgxKtHFZyWZ7WA0sCyMqiYgfLAFu/5l1sxQ
         GwuuxX1KN5cxDbJKsMlyWmRoMpyxZtPjVqImVRhyUcz2gaQ5p5s4qHMeM/JDI8H1xay8
         T49axFA8ggtNJJpdboOeznslwDAcMAF3pxxynY2oOtDTR7aNga9D6m7S+6mQ8lm/2zXD
         K65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448053; x=1705052853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFljEa0mUm0Gg4T0yvHZ8ZsrT7giCZb+Xl2jWN1PVF0=;
        b=czrO4tRDl1rJXtsd5+vdA3g1FlgIN3qAaT2ooe8yYNFonwc/NHe4rpnBPPetpmG0Tu
         i+dWiUYhZbgMhAPBuXblnN3kp2UIU2UHc3z14RCRIXv7xrIlvl9hf9jMBNVEIc8aNsXc
         458brer1X5oZRgzM8ZZ5iQjbzMwjeq5NpjwWnmLNbLOQHwMS8as0abwFRGymwh+m+Vm1
         JLEOYYmjmm5bi/JfG9aColedmjyVE39KjIdr/rcp9vjE/HcY/yhZCQchdy4SVs6c0iSN
         PAUrie6l7R8LfqWA2Pyi3OHt9fM3QScFgqeAZzDeNEj6sXesWRZvA1Jcv+1Pb9Ma+5iH
         d53g==
X-Gm-Message-State: AOJu0YzzAtjhP0ys2c0ARrhgP/7tqGjNZex2llTQRt89rxogYX8+Vm5x
	7A4M3opwwaN7G/G7SytUlUM=
X-Google-Smtp-Source: AGHT+IFGbLEw3QkhPovCPvaKZ/0nfvwuqv0qpxTPcHspfWgaPRd0EaaUmikGw/HWJgBY84/eRnLbqg==
X-Received: by 2002:a05:6a00:9386:b0:6d9:9996:deb3 with SMTP id ka6-20020a056a00938600b006d99996deb3mr1758505pfb.0.1704448052930;
        Fri, 05 Jan 2024 01:47:32 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id y14-20020aa79e0e000000b006da04f1b884sm1006098pfq.105.2024.01.05.01.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:47:32 -0800 (PST)
Message-ID: <3a4ea85d-643f-4fab-92db-09605ed06138@gmail.com>
Date: Fri, 5 Jan 2024 18:47:31 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook 0/8] Use rsvg-convert for SVG --> PDF conversion
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject: [PATCH -perfbook 1/8] Makefile: Add rules to use rsvg-convert for SVG --> PDF conversion

Recently, Inkscape has had a number of stability issues in both of
its GUI- and CLI- modes.  We have experienced crashes of CLI-mode
Inkscape caused by a change in glib, which can been resolved
by an update in the GTK3 library now released in GTK 3.24.39.
Commit f307e19f2be0 ("Prevent inkscape from interacting with desktop
manager") was an ugly hack for mitigating such crashes.

There is an alternative converter called rsvg-convert.
It is a light-weight CLI-only converter.

Up until Ubuntu 20.04 LTS, rsvg-convert's coverage of SVG features
was not good enough for some of the figures in perfbook drawn by
using Inkscape.

rsvg-convert has improved since, and version 2.52.5, which is the
version on Ubuntu 22.04 LTS, and later versions do fairly good jobs
in this respect.

So let's use rsvg-convert when it is available.

For Ubuntu and Debian, rsvg-convert belongs to the librsvg2-bin
package.  For Fedora, it is provided in the librsvg2-tools package.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 424a166c..f869862c 100644
--- a/Makefile
+++ b/Makefile
@@ -103,6 +103,8 @@ PDFTARGETS_OF_EPSOTHER := $(filter-out $(PDFTARGETS_OF_EPSORIG) $(PDFTARGETS_OF_
 BIBSOURCES := bib/*.bib alphapf.bst
 
 # required commands
+SED ?= sed
+
 LATEX_CMD := $(shell $(WHICH) $(LATEX) 2>/dev/null)
 DOT := $(shell $(WHICH) dot 2>/dev/null)
 FIG2EPS := $(shell $(WHICH) fig2eps 2>/dev/null)
@@ -111,6 +113,13 @@ INKSCAPE := $(shell $(WHICH) inkscape 2>/dev/null)
 ifdef INKSCAPE
   INKSCAPE_ONE := $(shell inkscape --version 2>/dev/null | grep -c "Inkscape 1")
 endif
+# rsvg-convert is preferred to inkscape in SVG --> PDF conversion
+RSVG_CONVERT := $(shell $(WHICH) rsvg-convert 2>/dev/null)
+ifdef RSVG_CONVERT
+  SVG_PDF_CONVERTER = (rsvg-convert)
+else
+  SVG_PDF_CONVERTER = (inkscape)
+endif
 LATEXPAND := $(shell $(WHICH) latexpand 2>/dev/null)
 QPDF := $(shell $(WHICH) qpdf 2>/dev/null)
 
@@ -455,12 +464,14 @@ ISOLATE_INKSCAPE ?= XDG_RUNTIME_DIR=na DBUS_SESSION_BUS_ADDRESS=na
 
 $(PDFTARGETS_OF_SVG): $(FIXSVGFONTS)
 $(PDFTARGETS_OF_SVG): %.pdf: %.svg
-	@echo "$< --> $(suffix $@)"
+	@echo "$< --> $(suffix $@) $(SVG_PDF_CONVERTER)"
 ifeq ($(STEELFONT),0)
 	$(error "Steel City Comic" font not found. See #1 in FAQ.txt)
 endif
-ifndef INKSCAPE
-	$(error $< --> $@ inkscape not found. Please install it)
+ifndef RSVG_CONVERT
+  ifndef INKSCAPE
+	$(error $< --> $@ inkscape nor rsvg-convert not found. Please install either one)
+  endif
 endif
 ifeq ($(STEELFONTID),0)
 	@sh $(FIXSVGFONTS) < $< | sed -e 's/Steel City Comic/Test/g' > $<i
@@ -483,10 +494,14 @@ ifeq ($(RECOMMEND_LIBERATIONMONO),1)
 	$(info Nice-to-have font family 'Liberation Mono' not found. See #9 in FAQ-BUILD.txt)
 endif
 
-ifeq ($(INKSCAPE_ONE),0)
-	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
+ifdef RSVG_CONVERT
+	@cat $<i | rsvg-convert --format=pdf > $@
 else
+  ifeq ($(INKSCAPE_ONE),0)
+	@inkscape --export-pdf=$@ $<i > /dev/null 2>&1
+  else
 	@$(ISOLATE_INKSCAPE) inkscape -o $@ $<i > /dev/null 2>&1
+  endif
 endif
 	@rm -f $<i
 ifeq ($(chkpagegroup),on)
-- 
2.34.1

