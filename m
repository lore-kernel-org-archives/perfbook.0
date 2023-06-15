Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822587; x=1689414587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8j7bPY96ePJaQvZ22rDKRH8B8yBSuTBgH6JECZMqE8Y=;
        b=U8Ivf4+ZCAk9YFmzlbky5f7fFXn52G9koMZVMobcpJXONew0A36gtexhcilU/Tq4lT
         d3fzKn3MUG0Iw3s3UvwxKPpL1GAAycU6Z3tC7LGMz5T11JCYVCcA9NogVSOoCcuHD8Kj
         YJkCJbnWFi2I4LVB+pLa7Xj5EJRCUYr8sOXBPPXEKIgq+YMbz01eJ2VfymbLL2EituZ9
         HMCjFzqT3liVDTEVmp+Hv074eqNyhVWmrkNPUVALaspsyz9kHEOqxBu+o8pNrCrU8xRP
         qLyODkj1P5syUvzY053VVww4gmInk44HgP9R7HQS1exsvflLcLqjXeHxSc5+EhHPiQDu
         hW7w==
Message-ID: <3b706eaf-4a91-9989-ad2f-38db7510edb5@gmail.com>
Date: Thu, 15 Jun 2023 18:49:45 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/6] Makefile: Add 'DejaVu Sans' to nice-to-have
 fonts
Content-Language: en-US
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Under RHEL and Fedora, it is possible to install "DejaVu Sans Mono"
alone.  Add check of "DejaVu Sans" font in Makefile and print info
on a nice-to-have font in case it is missing.

Update FAQ-BUILD.txt accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt |  1 +
 Makefile      | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 024f98bd4555..7c584c2444fe 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -186,6 +186,7 @@
 		There are SVG figures which use other font families
 		listed below:
 
+		  - DejaVu Sans
 		  - DejaVu Sans Mono
 		  - FreeMono
 		  - Liberation Sans
diff --git a/Makefile b/Makefile
index e44b370d58d0..6a389089e38c 100644
--- a/Makefile
+++ b/Makefile
@@ -125,6 +125,7 @@ COURIERS := $(findstring couriers,$(FONTPACKAGES))
 NEWTXSF := $(findstring newtxsf,$(FONTPACKAGES))
 INCONSOLATA := $(findstring inconsolata,$(FONTPACKAGES))
 FREESANS := $(shell fc-list | grep FreeSans | wc -l)
+DEJAVUSANS := $(shell fc-list | grep "DejaVu Sans" | grep -v "DejaVu Sans Mono" | wc -l)
 DEJAVUMONO := $(shell fc-list | grep "DejaVu Sans Mono" | wc -l)
 LIBERATIONSANS := $(shell fc-list | grep "Liberation Sans" | wc -l)
 LIBERATINOMONO := $(shell fc-list | grep "Liberation Mono" | wc -l)
@@ -149,10 +150,15 @@ ifeq ($(FREESANS),0)
 else
   RECOMMEND_FREEFONT := 0
 endif
+ifeq ($(DEJAVUSANS),0)
+  RECOMMEND_DEJAVUSANS := 1
+else
+  RECOMMEND_DEJAVUSANS := 0
+endif
 ifeq ($(DEJAVUMONO),0)
-  RECOMMEND_DEJAVU := 1
+  RECOMMEND_DEJAVUMONO := 1
 else
-  RECOMMEND_DEJAVU := 0
+  RECOMMEND_DEJAVUMONO := 0
 endif
 ifeq ($(LIBERATIONSANS),0)
   RECOMMEND_LIBERATIONSANS := 1
@@ -461,7 +467,10 @@ endif
 ifeq ($(RECOMMEND_FREEFONT),1)
 	$(info Nice-to-have font family 'FreeMono' not found. See #9 in FAQ-BUILD.txt)
 endif
-ifeq ($(RECOMMEND_DEJAVU),1)
+ifeq ($(RECOMMEND_DEJAVUSANS),1)
+	$(info Nice-to-have font family 'DejaVu Sans' not found. See #9 in FAQ-BUILD.txt)
+endif
+ifeq ($(RECOMMEND_DEJAVUMONO),1)
 	$(info Nice-to-have font family 'DejaVu Sans Mono' not found. See #9 in FAQ-BUILD.txt)
 endif
 ifeq ($(RECOMMEND_LIBERATIONSANS),1)
-- 
2.25.1


