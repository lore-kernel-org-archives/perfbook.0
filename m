Return-Path: <SRS0=mW18=DA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689343661; x=1691935661;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZcqFYKn0AfWyE4jBxSqQchhYCBmjX38O57Sb+kUsqM=;
        b=Ys24viaJSYVRZhKgl05vVt3oh97utu3W1h6aPumtmnkCzwAZfcpduYXcMMiPWc5C4L
         YUu7JrUSuf4ivQEbn2ru4MQoiqGT+gH092vdI6LfNumhuhd2oWcNgDjjLnjpjXTqaZm9
         0mXzJkOu6Ms4AkgUo+PG6FhCVwWPKF0AEBggynfDDvsqb1nucnap8OYm/1w+xPmAxsKj
         PuQ3b5vCBMfxAbBSia8zoOjieOk6mWWig98bDVsRdeP98oD0hAQ7PkHa87RSg8DCul1l
         DjrhojjLheQ+WXZNgzOtcw9+mlkVX7p9slsJ/nBHBt6O1SqtMkpmDu0bzSrLvWmUG52I
         g9BA==
Message-ID: <f8a28118-e3e4-d3ef-faa6-6c874e5c463a@gmail.com>
Date: Fri, 14 Jul 2023 23:07:37 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Don't run fixfonts for pstricks figures
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

fixfonts scripts don't have any effect on EPS files generated
from pstricks + dvips.

Font in the figures should be specified in the source .tex files.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Makefile b/Makefile
index bffdd2da1f4d..f25baf27d8ad 100644
--- a/Makefile
+++ b/Makefile
@@ -414,13 +414,11 @@ perfbook-a4.tex:
 
 # Rules related to perfbook_html are removed as of May, 2016
 
-$(EPSSOURCES_FROM_TEX): $(FIXANEPSFONTS) $(FIXFONTS)
 $(EPSSOURCES_FROM_TEX): %.eps: %.tex
 	@echo "$< --> $(suffix $@)"
 	sh utilities/mpostcheck.sh
 	@latex -output-directory=$(shell dirname $<) $< > /dev/null 2>&1
 	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
-	@sh $(FIXANEPSFONTS) $@
 
 $(EPSSOURCES_FROM_DOT): $(FIXANEPSFONTS) $(FIXFONTS)
 $(EPSSOURCES_FROM_DOT): %.eps: %.dot

base-commit: b48ccb045d17f6d551ff210c74118f1769f66c63
-- 
2.25.1

