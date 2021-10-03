Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r0DdDF8qipSGeYzCvL1R7uHpclsMYsHmDAxb8Ij/Jjw=;
        b=cDWrt8dMI87vSU6GM1bNtyCXAOysFy9qhcQysiVfHqHlMZIhN5jqllPpF7w1tTx4BX
         aNh00jh8mI3ykUWvsKl99+5OFet0RGUlSvFHdNwOGy2fVpzp0NxdsC20WSoiTq3oR0yu
         WWLs7dvRu4VvMjBcW9OJbhMOKxsWUfNtUcohQ1YUbpQ3J6Nj0vpYVH4YZ+dpG4nXVWPW
         RRH5jzjPvOOCvAeFgaXXhd6LNQYRii/IAv33FVUFLpieLaDe10ka1wCwg3tNJtfmUxCg
         sg6daanFp5cEyQEfNAbSuENQ2V8vcarTiwEl0iFBuT4Q/dqwgvMkGn6LTgojxzBzj9tG
         g+yA==
Subject: [PATCH -perfbook 5/6] epstopdf-rule.mk: Save a 'cp' by running
 fixfonts script directly
References: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6a9da49e-c501-531e-f971-ff360cde36e9@gmail.com>
Date: Sun, 3 Oct 2021 23:57:44 +0900
MIME-Version: 1.0
In-Reply-To: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In the recipe of PDFTARGETS_OF_EPSORIG, first "cp" can be saved
by directly running FIXFONTS script.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         | 2 ++
 epstopdf-rule.mk | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d3fcffca..29c067c0 100644
--- a/Makefile
+++ b/Makefile
@@ -119,9 +119,11 @@ endef
 ifeq ($(URWPS),0)
 FIXSVGFONTS   = utilities/fixsvgfonts.sh
 FIXANEPSFONTS = utilities/fixanepsfonts.sh
+FIXFONTS      = utilities/fixfonts.sh
 else
 FIXSVGFONTS   = utilities/fixsvgfonts-urwps.sh
 FIXANEPSFONTS = utilities/fixanepsfonts-urwps.sh
+FIXFONTS      = utilities/fixfonts-urwps.sh
 endif
 ifeq ($(FREESANS),0)
   RECOMMEND_FREEFONT := 1
diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index 83d335f0..5bf4a435 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -13,8 +13,7 @@ $(PDFTARGETS_OF_EPSORIG): %.pdf: %.eps
 ifndef EPSTOPDF
 	$(error $< --> $@: epstopdf not found. Please install it)
 endif
-	@cp $< $(basename $<)__.eps
-	@sh $(FIXANEPSFONTS) $(basename $<)__.eps
+	@sh $(FIXFONTS) < $< > $(basename $<)__.eps
 	@eps2eps $(basename $<)__.eps $(basename $<)___.eps
 	@epstopdf $(GS_OPT) $(basename $<)___.eps $@
 	@rm -f $(basename $<)__.eps $(basename $<)___.eps
-- 
2.17.1


