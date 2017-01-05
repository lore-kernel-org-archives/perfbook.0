Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ERygHKLS75xsRN7STGZ1C6lv/riHtzMkeqQ5Dj9T2qs=;
 b=XCbnlgrbfPIFSavkG6UWl6atPcj4E4pDe+L2w65lHvLHWNzB5sCPyQiHUNCUc33uph
 elYtDafe1JvH/RbwT0y+aD8/tM3BNvlIE2seKSTuVcCFPfWuEXvKvnhl/cn/LgHgZdUe
 2+z+QMka+bszMYYA3rFOqwkM6BRGt3xHniWZoepZ76BHFMqqhz38yEcK2E5CwMxGusti
 YnqgBI0GKeSsaMha2qSKBNxZ0jmlE1qXnIsu2PYH9ASJEnb4ax9ko6YrGWTTYs/Qxchp
 F3QOJ+64AM6Dy++iuw3Mf7IJMXjXxgnIWpTkuLvBnPpESnSaXzBfDFF8eGoLmVw3ZTN/
 bH1Q==
Subject: [PATCH 2/5] Makefile: Add target 'help'
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7025540d-c1f5-5841-2dec-08b596015a89@gmail.com>
Date: Thu, 5 Jan 2017 09:34:33 +0900
MIME-Version: 1.0
In-Reply-To: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d159316cc7c866dff5e014b6a466846809884788 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 5 Jan 2017 08:50:00 +0900
Subject: [PATCH 2/5] Makefile: Add target 'help'

Add a target for explanation of targets with various layout and font options.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 997a4cf..a7b10cf 100644
--- a/Makefile
+++ b/Makefile
@@ -60,7 +60,7 @@ else
 	targ = $(default)
 endif

-.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mss perfbook-mss.pdf mssmsg
+.PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mss perfbook-mss.pdf mssmsg help
 all: $(targ)

 2c: perfbook.pdf
@@ -168,6 +168,25 @@ ifndef INKSCAPE
 endif
 	@inkscape --export-pdf=$@ $<

+help:
+	@echo "Official targets:"
+	@echo "  Full,              Abbr."
+	@echo "  perfbook.pdf,      2c:   (defalut) 2-column layout"
+	@echo "  perfbook-1c.pdf,   1c:   1-column layout"
+	@echo "  perfbook-hb.pdf,   hb:   For hardcover books (2-column)"
+	@echo
+	@echo "Experimental targets:"
+	@echo "  Full,              Abbr."
+	@echo "  perfbook-msr.pdf,  msr:  2c with regular thickness courier clone"
+	@echo "  perfbook-msn.pdf,  msn:  2c with narrow courier clone"
+	@echo "  perfbook-mstx.pdf, mstx: 2c with txtt as monospace"
+	@echo "  perfbook-msnt.pdf, msnt: 2c with newtxtt as monospace (non-slashed 0)"
+	@echo "  perfbook-1csf.pdf, 1csf: 1c with sans serif font"
+	@echo "  perfbook-msns.pdf, msns: 2c with non-scaled courier"
+	@echo "  \"msr\" and \"msn\" require \"numbus15\"."
+	@echo "  \"msnt\" requires \"newtxtt\"."
+	@echo "  \"1csf\" requires recent version (>=1.3i) of \"mathastext\"."
+
 clean:
 	find . -name '*.aux' -o -name '*.blg' \
 		-o -name '*.dvi' -o -name '*.log' \
-- 
2.7.4


