Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SaSDj3jScuje8rYofDZlsKhLnmm9ZpM3h8G2dLnwPro=;
        b=KcMo9OMZ4Q1YZ8FKPN5lmgY3kmzt+hqltPgOXmAQWQUCmrC730D7GNjXZeXZJ3jZBU
         dkSMtOiwfdmbgodicw2IczS55DZIKqIOZKOIVjgZr0pOiy1O3N3fHL976M4cbVxaqfGF
         43W63a8RCP1/pjnLoISDIy77AWiGVE75vT5NI2bm3lRfII5c9Pyd8m0BghthArczEICT
         ZcA92t1bJvwVPWbTeqTSowc0hV8OGgn6q5fDsY0Ge4mMhUSpo02zqoYg45LPtEnyL960
         bFEz6MDGPMcHNx0t72x4nkBJckyVLhYi//wAr4up38cQGIB20gP4f//jCvKfJXwv5Sbw
         BNGg==
Subject: [PATCH 3/4] Change monospace font of snippets for targets 'mss',
 'msns', and 'msn'
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <20b087bd-af9e-96bd-91e2-25f8cd2d1600@gmail.com>
Date: Wed, 13 Feb 2019 00:37:05 +0900
MIME-Version: 1.0
In-Reply-To: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f696c13873b1458800d56f0151885e49abf5d5ec Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Feb 2019 21:06:28 +0900
Subject: [PATCH 3/4] Change monospace font of snippets for targets 'mss', 'msns', and 'msn'

Now that code snippets assume "lmtt" (Latin Modern Typewriter)
font to decide where to fold long lines, "mss" and "msns" targets
have frequent overfulls of snippets in 2c layout.
Remove on-the-fly sed script keeping \ttdefault unchanged for
snippets in these two targets.

"msn" target's monospace font "nimbusmononarrow" (Narrow Courier
Clone) is narrower than "lmtt". This font can be a good candidate
for code snippets in the future. To allow us to see how it looks
like, add the on-the-fly sed script to "msn" instead.

Note: "nimbusmonoarrow" is not available on TeX Live 2013/Debian.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index c15678b..7a6d156 100644
--- a/Makefile
+++ b/Makefile
@@ -159,12 +159,10 @@ perfbook-hb.tex: perfbook.tex
 	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < $< > $@
 
 perfbook-msns.tex: perfbook.tex
-	sed -e 's/%msfontstub/\\usepackage{courier}/' \
-	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage{courier}/' < $< > $@
 
 perfbook-mss.tex: perfbook.tex
-	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{couriers}/' \
-	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage[scaled=.94]{couriers}/' < $< > $@
 
 perfbook-mstx.tex: perfbook.tex
 	sed -e 's/%msfontstub/\\renewcommand*\\ttdefault{txtt}/' < $< > $@
@@ -174,7 +172,8 @@ perfbook-msr.tex: perfbook.tex
 	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msn.tex: perfbook.tex
-	sed -e 's/%msfontstub/\\usepackage{nimbusmononarrow}/' < $< > $@
+	sed -e 's/%msfontstub/\\usepackage{nimbusmononarrow}/' \
+	    -e 's/{lmttforcode}{true}/{lmttforcode}{false}/' < $< > $@
 	@echo "## This target requires font package nimbus15. ##"
 
 perfbook-msnt.tex: perfbook.tex
@@ -291,7 +290,7 @@ help:
 	@echo "  \"msn\" doesn't cover bold face for monospace."
 	@echo "  \"1csf\" requires \"newtxsf\"."
 	@echo
-	@echo "All targets except for \"msns\" and \"mss\" use \"Latin Modern Typewriter\" font"
+	@echo "All targets except for \"msn\" use \"Latin Modern Typewriter\" font"
 	@echo "for code snippets."
 
 clean:
-- 
2.7.4


