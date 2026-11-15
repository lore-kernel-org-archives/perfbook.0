Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776509;
	b=s86eAJoOp/taeP1QdzPz5/R7aBCcJP7aYBGOwrkGeaV9enKGOG/8D0D2/lIQXZcFol2V
	 BA6C1QvWB5Dg2Ta4C/72a592C04aowwHGlcGt9H7e6eyOvlUcswQrVap1OXm0dhHyapO5
	 Cr2yPLAfbOklSRoq6EvpmCQJ6C5yrdrHp4QXqtwQuVZzQtgF6q190/eoXFLGmuQf2HvZC
	 YZeh4hVvv5HEh4JQHELHPYWNfbj2seT43pMHJExveKJBq90/jkOTKAH3L90VHrPv3IqvD
	 EAIQa2DEratfLMyuRU49u7jSm91wsw1iYtiKcwe1sxZTmKkau/+3P5OaKejM3Pe3+4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/jfPITZthy/vz4OYXlijELv/lNbsV7yug/KyDcZtQm4=;
	b=ikofWdx18lzCj0lB5cn1V9yeZHcsIkchlpF7aX0jE7AMuGRQhYMivTObXN6fMymnjQtT
	 6+Dt3FU9l0juutGZlRu8SXrKlIPloVShlM/YP9fF06wFWLq5zhJl55zkzSZ+qdvnIgUIm
	 q5PvR28xmTUSDQO9slLG4vtgBZsIRAgwrFPfiUZD6ftxjxb2L3QSJTYLtfsLggC/VucXD
	 4DgNn1n1jCpShJdr/XaHE1dO/YK7yJeIAKhtVmHmlGAJjj7qLO9yJZGtXm6UTfZv734gY
	 YGxCc1HYBAiqcOIVzr53pyNK4xu5rq0XW3SAOP9fCAFC80o9bu0zX1BnD73/cMnjVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA04606A31F
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA04606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so4323928eec.0
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776507; x=1795381307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jfPITZthy/vz4OYXlijELv/lNbsV7yug/KyDcZtQm4=;
        b=NgjJKkdsmYNgMQKefq8YCdhXzZtq79r1rTdH15wJpUzTkbtyzDmLmlUe4cGHhY6G+A
         ygm+UFbGK0+ewAOTL8fNkAMU2vv1iIy5etXB2/hLOajthAaM66i3cBe6S8ClmKeuwHk4
         W6agPmAwmPcNtnu1k749CovXIqrgmt3Q1XzFZ4dALhLpmbBPx4TivAldlMdM6oHxclro
         Y+uckFsYZiB/R3Z285k+7siGwgdcTnPkKHl+0MqvBqiFbYf9XA7pBXH8sylC3ghO8NCo
         A+zBe/MZyUqTxrcsytd0qxmeJdtUYPRb3Vn3GI4njv8r5jF1BalNCxaYs9ZtwCSQXdJi
         5HdQ==
X-Gm-Message-State: APuU4Z+nUkJAC1NID+bf8vXSBXfK36iBff8ZbRfQcfuqhLOd50muRBai
	XZYxJyUr278hBcJkxjTGagV/BS0a8yEreXySSuzmRKHKtLLiJYslUhYKiuQhEdUh0EghbK5g
X-Gm-Gg: AYBFou1sXYVJetMwbPxsmkbFKXhCPWTNK14TjJGdHFQuoIM6HpA7FkgvujYyrNwZn4H
	r6Vd6vHGdp6dZ7FrsBpx2JFNysGUjWUuYKjhI2sJz/bNXzuEjJ4ClSrPwyQYBtWKxcXVa2tyLOH
	MHKXZBJaERmu0FSojjDCWEyOI0NdLiu8Y72V1G7zo7vQTPOuqd8ydKxGe25nZItjCVb0k3/yUpB
	hZVY9BaIEWYy48BItUMmIl51IuZfH4g3J3x4rJQWeasITEw6ZfK5+V7jM5YOXxeQqfXnOHKv0HL
	+PAZ83jMxNACwtA3gY+JJTD7ziy7B9kBysVvy4g98266IjWFIRfL0FGnue5D5esxKjACh5vaK2C
	5o+3HUV06jFgTB6WG9lOiqvXBlouQj7Li0yvZyYk8MAP5oiy92YImhTkFc8wFCmZdcMLL4ntaa2
	5SWOyDMyu7kTCCCbxKE6BZJYJTerII/w8e2Qt2K4nzvsEM5K6WfmdRSD9mV1/eQOvFOXlAer5xK
	4X5GE9MAev7/piGLK17GgevYoB+Lkijol/V2dtNDoW7lZidRSNmP1zjAIwtMX4P58mVl/K0iJZ3
	E7i4kPdpLUssMDJX4wDG+1E9a4ph4XLIs/ZASo/I83976y7xESw/76e0P5KA4PkvD03HOmnM8y6
	bcbP1uG+yz8CWZLhcWlIohwqs4fFhodcEakXAA8PZL0IPDYnTIRLD9D479XxH/cMDYNYy8Tpat3
	LOLk4raGJHMFGRxbkDhPXHjKchwRuALqF/zwvG+nI=
X-Received: by 2002:a05:7300:d402:b0:357:ee3a:267a with SMTP id 5a478bee46e88-37963565cb0mr8789716eec.2.1794776507344;
        Sun, 15 Nov 2026 13:01:47 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:46 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 6/7] FAQ-BUILD.txt: Document HTML and EPUB build targets
Date: Sun, 15 Nov 2026 22:01:37 +0100
Message-ID: <20261115210138.229034-7-ferenc@fejes.dev>
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

Add FAQ #15 describing the epub, epub-endnotes, and html build targets,
their TeX Live, Pandoc, and Poppler prerequisites, e-reader settings for
KOReader and Foliate, and known limitations.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 FAQ-BUILD.txt | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 6845db14..20673dec 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -370,3 +370,48 @@
 		Code samples under CodeSamples/ were originally written for
 		Linux and a QNX compat layer was added in 2022.  Compat layers
 		for other OSes are more than welcome!
+
+15.	How can I build a reflowable EPUB for my e-reader?
+
+	A.	Typing "make epub" will build "perfbook.epub", a chapter-split
+		EPUB3 derived from the ebook-size variant via lwarp and pandoc.
+		Typing "make html" stops after the lwarp HTML output (no pandoc
+		needed), leaving perfbook-epub_html.html, perfbook-epub-*.html,
+		and perfbook-epub-images/ ready to open in a browser.
+
+		In addition to #5 above, prerequisites are pandoc, poppler-utils
+		(pdftocairo, pdftotext, pdfseparate), unzip, zip, lwarp/lwarpmk
+		(>= 0.921, in texlive-latex-extra on Debian/Ubuntu, texlive-meta
+		on Arch, texlive-collection-latexextra on Fedora), and ifptex.sty
+		(texlive-lang-japanese on Debian/Ubuntu, texlive-langjapanese on
+		Arch).  docker/Dockerfile includes all of these.
+
+		Intermediates go to epub-tmp/, epub-figs/, perfbook-epub-images/,
+		and perfbook-epub_html.*.  "make epub-clean" (or "make html-clean",
+		also run by "make clean") removes them; "make neatfreak" also
+		removes "perfbook.epub" and "perfbook-endnotes.epub".
+
+		Footnotes and Quick Quiz answers are EPUB 3 popup footnotes
+		(epub:type="noteref"/"footnote").  Readers without popup
+		support, or that typeset footnotes at the bottom of the page,
+		can use "make epub-endnotes" instead.  It builds
+		"perfbook-endnotes.epub", where footnotes are plain linked
+		notes at the end of each chapter and Quick Quiz answers are
+		ordinary text in the answers appendix, as in the PDF.
+
+		KOReader shows the popup footnotes when "Show footnotes in popup"
+		is on (Settings > Taps and gestures > Links).  Its default
+		"In-page EPUB footnotes" style tweak (Style tweaks > In-page
+		footnotes) puts footnote text at the bottom of the page instead;
+		turn it off and turn on "Hide non-linear fragments" (Navigation
+		menu) to keep the text out of the page flow.  Quick Quiz answers
+		are never placed in-page.
+
+		Foliate 3.3 (WebKitGTK 2.54) leaves blank space where a scroll
+		box continues on the next page, so listings and tables wrap
+		long lines rather than scroll horizontally.
+
+		Known limitations: page-number indexes are omitted (the acronym
+		list is kept), math is rendered as SVG images, and SVG cartoons
+		fall back to the reader's font.  pdftocairo may dump git-ignored
+		core files on exit while still writing valid SVGs.
-- 
2.55.0

