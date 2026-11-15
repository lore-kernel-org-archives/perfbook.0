Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776506;
	b=wwUKOq40d/Mc0hIBwcceHkn9Qu6BKhcHd4cQrWo4HEqkAnGPTiTy6X2wVPMRgxQI2lD1
	 WH1mSlCpqDEwfv785cx/coYAudgUd20E5ahAFGckoS/GRfAicEAQFRJIRHiq6PCb8SkX/
	 hoPm/Pg2K2lub7pSupUuq8qc/DP/JLx5sjoermn+HfSq8trqD4iRbv7f/ZPDqvmMDEjeQ
	 fy9h1UvtCsIxVTp0MgrFPBtS5XWfukBhBZByOomcetoAqG/EBtABdHaJ1QDFs5Mn6om/m
	 Hd43YwdvDrDp9hzKSyVY7GVdEGerwJLJlH1SxnLGCGDPSObaMEEzRSI713dMo9U+ZRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776506;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1bccGKbKXTtcVVcSl3xVa0pzdbSyc+r9IqVxn6mTewM=;
	b=raQhsex6nhvKWCw25L+tpGU4KObfDXv+Qd5BzTvB2JATW7gi/nHsYqG4dgZAVyfhLZCj
	 5WvZxCjM9UF1B0IoVmsCwU3uTCP31CMCzDKE8zrDEa+AFtjWh3MHNZ6wXW80aCy8HIH78
	 ipIOy6wi6eRPZEHOItzTAbzNcr4Y3oidsF3tn3wuvWcEmTWkJIjqYMMs2YjjhXZGP5DLW
	 m6Cxl6aciQeJHf+yQAmyvvJV5v7Q2ZydrAhK66aZ/3AiOJ/UmovBQP9rq0TRL2F+fhZIJ
	 jgjWTpixYaDgC6fMHUsZ8xmiP3UXlLb3zdS9rr20ik3/p9ovmGSyLAEcJdv7l3Q1Jdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64193606A329
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64193606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so4105855eec.0
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776505; x=1795381305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bccGKbKXTtcVVcSl3xVa0pzdbSyc+r9IqVxn6mTewM=;
        b=sSBV3kB5SJ+6wOsyd8RdQ7Dp3/azH4itl+jCuaAhPQ7xZnhyHRJe5ax7R04O+ZsqeN
         I6nOp7mfBBehDYTzBC1ys3bdMHqpB1AMXi3gFGzipWUoMCTBpR0y4Ckps7etVuYLsUb5
         gG7QLKLBOBnXrk3WUm61meTr6cxTVGqL9c7uqrZfzFwbSeJrd5IGkwK6IILNcd6bwkEt
         x900etLZf+5wvMBq25P5jI1KPBD0Qo5CyyQ16mOcom7AlQdyplW3AxQqytB9hG49c92k
         3rCEnhAuLuNc0KTdxsHfvw/GnFOZ3H4BpykWC4+azLYVqh/+/aNq5wArIGB52SBL5ln0
         QqaA==
X-Gm-Message-State: APuU4Z8DNg1aAQTgEt3TXm0Rs1iv+QMvmTY5YYvjNqweyf3yhj/wAqQS
	UgIskIh+WiWFvYP60IbYbRvZqBep6Pc/N91jWOeSff3325FabmITGLWeGLVU5rLL+RE9UQIF
X-Gm-Gg: AYBFou2szF4+oDFM23HRs9r2q6mSJ/Q2aAMEJYNA+QkhV3S9IMyWPOjK/yj5M2ZWUYI
	bumELbQpg5Tn4JNl5oMB1xeVaPnT91nlLKs+Y3WLjFQ0TSjB0usptcSjYmfLA/50kEA9OMd/28y
	6EqtDNBX+nlsDitgxojYYplmjbNv7/CmvuK0kO/MHSYsBCZrPd1ozcCItih+f2cnWCSmWRmGtQw
	v6ldTbDJFvKMve/9enU//UNIJfmBFvNHL2t9zi7DKuKjqtAvfiKGD+mvC92NNqRuaqc23NJzJn2
	MyuXTC7W0wi00m/hcLgqarHjzVjUy1PuqsL7Xqq3pPum2fHPSWm01jyIhqg2BMj9uhJ33kjWbmK
	KINUyNGpgHzJB2sHdxDkiSOcrhA5dz/otKejY/YxK4uwd00eLF4vyqV4hIW0K+3emB6a5Y0d/QZ
	WmXjyOjjDoLQIR8/6WE6jTM0LwRPEUsZFTAu5DdBfVh9AkcnOOEv1SgufWmwak6c/qDJJk/y9o+
	VQZFPGKle1fiR37gKMXPL/7AwUxyqTG/zcNnrzaDuSCyK1p38/ZfMIu/v77wJ5P0kKF+Wn7tqdv
	AsY7nm8hBK0fLZdj2RG3KDD7tGOMF4UpQWB1PKVL4Y8d5YdWeWs69lW8pxHyFLmvEhRDR724pBK
	MG1ToZvW98UpOkp7iyRXcswyBCxv/MmLm5WaBuu7XTR1H36Dh1kFEa84CiIWwDbGzdT0A4M2J6u
	Dzu946fg95/ViYvqKHa/tcS2YFDtjdav11OGtFRxw=
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr7475005eec.10.1794776505271;
        Sun, 15 Nov 2026 13:01:45 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:44 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 4/7] Makefile, .gitignore: Add epub and html build targets
Date: Sun, 15 Nov 2026 22:01:35 +0100
Message-ID: <20261115210138.229034-5-ferenc@fejes.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115210138.229034-1-ferenc@fejes.dev>
References: <20261115210138.229034-1-ferenc@fejes.dev>
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire make epub, make html, and make epub-clean into Makefile, staging
converted and flowRoot-sanitized SVG figures under epub-figs/ so make -j
builds them in parallel before invoking runlwarp.sh.  Ignore lwarp and
EPUB build artifacts in .gitignore.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 .gitignore | 14 ++++++++++++
 Makefile   | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index ce93394f..6624a175 100644
--- a/.gitignore
+++ b/.gitignore
@@ -25,6 +25,20 @@
 *.pdfp
 *.pdfq
 *.synctex*
+*.epub
+*.sidetoc
+*.lwarpmkconf
+lwarpmk.conf
+comment_*.cut
+lwarp*.css
+sample_project.css
+lwarp.ist
+*.xdy
+core
+core.*
+/perfbook-epub-images/
+/epub-tmp/
+/epub-figs/
 perfbook_flat.tex
 qqz*.tex
 sub_qqz
diff --git a/Makefile b/Makefile
index b4f34c51..cf1282d1 100644
--- a/Makefile
+++ b/Makefile
@@ -53,7 +53,7 @@ FIGSOURCES := $(wildcard */*.fig) $(wildcard */*/*.fig)
 
 EPSSOURCES_FROM_FIG := $(FIGSOURCES:%.fig=%.eps)
 
-SVGSOURCES_ALL := $(wildcard */*.svg)
+SVGSOURCES_ALL := $(filter-out perfbook-epub-images/%,$(wildcard */*.svg))
 SVG_EMERGENCY := $(wildcard */*.svg*.svg)
 SVG_GENERATED := CodeSamples/formal/data/RCU-test-ratio.svg
 SVGSOURCES := $(filter-out $(SVG_EMERGENCY) $(SVG_GENERATED),$(SVGSOURCES_ALL)) $(SVG_GENERATED)
@@ -252,8 +252,9 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: qq perfbook-qq.pdf qqmsg
 .PHONY: help help-official help-full help-semiofficial help-paper help-draft
 .PHONY: help-experimental help-prefixed
+.PHONY: epub epub-clean html html-clean
 .PHONY: paper-clean periodcheck punctcheck punctcheck-auto
-.PHONY: cleanfigs cleanfigs-eps cleanfigs-svg figs precheck
+.PHONY: cleanfigs cleanfigs-eps cleanfigs-svg cleanfigs-epub figs precheck
 
 all: punctcheck-auto
 
@@ -652,9 +653,63 @@ help-experimental:
 	@echo "  - \"sf\" requires \"newtxsf\"."
 	@echo "  - All the targets except for \"msn\" use \"Latin Modern Typewriter\" font"
 	@echo "    for code snippets."
+	@echo
+	@echo "Reflowable EPUB (experimental, lwarp + pandoc; see FAQ-BUILD.txt #15):"
+	@echo "  perfbook.epub,     epub: chapter-split EPUB3 from the ebook-size variant"
+	@echo "  perfbook-epub_html.html, html: lwarp HTML only, no EPUB packaging"
+
+PDFTOCAIRO := $(shell $(WHICH) pdftocairo 2>/dev/null)
+EPUB_SVGS := $(addprefix epub-figs/,$(EPSSOURCES:%.eps=%.svg))
+EPUB_SVG_CROP := epub-figs/CodeSamples/formal/data/RCU-test-ratio-crop.svg
+EPUB_SVG_CLEAN := intro/PPGrelation.svg defer/RCUListDeleteClassic.svg \
+	memorder/RCU2G2R.svg formal/cbmc.svg formal/nidhugg.svg
+EPUB_SVG_STAGED := $(addprefix epub-figs/,$(EPUB_SVG_CLEAN))
+
+$(EPUB_SVG_STAGED): epub-figs/%.svg: %.svg
+	@echo "$< --> $@ (sanitize flowRoot)"
+	@mkdir -p $(dir $@)
+	@perl -0777 -pe 's{<flowRoot\b.*?</flowRoot>}{}gs' $< > $@
+
+$(EPUB_SVGS): epub-figs/%.svg: %.pdf
+	@echo "$< --> $@ (pdftocairo)"
+ifndef PDFTOCAIRO
+	$(error pdftocairo (poppler-utils) not found. Please install it)
+endif
+	@mkdir -p $(dir $@)
+	@pdftocairo -svg $< $@
+
+$(EPUB_SVG_CROP): CodeSamples/formal/data/RCU-test-ratio.svg
+	@echo "$< --> $@ (copy, uncropped)"
+	@mkdir -p $(dir $@)
+	@cp $< $@
+
+epub: perfbook.epub
+html: perfbook-epub_html.html
+
+perfbook-epub.tex: perfbook-eb.tex
+	echo '\input{reflow.ltx}\input{perfbook-eb}' > $@
+
+perfbook.epub perfbook-epub_html.html: perfbook-epub.tex $(LATEXGENERATED) $(BIBSOURCES) \
+    $(EPUB_SVGS) $(EPUB_SVG_CROP) $(EPUB_SVG_STAGED) reflow.ltx utilities/runlwarp.sh \
+    utilities/epub-fixhtml.pl utilities/epub.css
+perfbook.epub:
+	LATEX=$(LATEX) sh utilities/runlwarp.sh perfbook-epub
+perfbook-epub_html.html:
+	LATEX=$(LATEX) sh utilities/runlwarp.sh perfbook-epub html
+
+cleanfigs-epub:
+	rm -rf epub-figs
+
+html-clean: epub-clean
+epub-clean:
+	rm -rf epub-tmp perfbook-epub-images perfbook-epub-images.txt \
+		lwarpmk.conf perfbook-epub.lwarpmkconf perfbook-epub*.html \
+		perfbook-epub.tex perfbook-epub_html.* epub-tmp-*.log comment_*.cut \
+		lwarp*.css sample_project.css lwarp.ist lwarp.xdy *.xdy core core.*
 
 help-full: help-official help-paper help-semiofficial help-draft help-prefixed help-experimental
 
+clean: epub-clean
 clean:
 	find . -name '*.aux' -o -name '*.blg' \
 		-o -name '*.dvi' -o -name '*.log' \
@@ -677,6 +732,7 @@ paper-clean:
 distclean: clean
 	sh utilities/cleanpdf.sh
 	rm -f $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_FIG)
+	rm -rf epub-figs
 	find . -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 
 touchsvg:
@@ -687,6 +743,7 @@ ls-unused:
 
 neatfreak: distclean
 	find . -name '*.pdf' | xargs rm -f
+	rm -f perfbook.epub
 
 cleanfigs-eps:
 	rm -f $(EPSSOURCES_FROM_TEX) $(EPSSOURCES_FROM_DOT) $(EPSSOURCES_FROM_FIG)
@@ -695,7 +752,7 @@ cleanfigs-eps:
 cleanfigs-svg:
 	rm -f $(PDFTARGETS_OF_SVG) $(SVG_EMERGENCY) $(SVG_GENERATED) $(PDFTARGETS_OF_SVG_CROP)
 
-cleanfigs: cleanfigs-eps cleanfigs-svg
+cleanfigs: cleanfigs-eps cleanfigs-svg cleanfigs-epub
 
 figs: $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(PDFTARGETS_OF_SVG_CROP)
 
-- 
2.55.0

