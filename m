Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=iNlyWdz77lyhs0J5rSu+5LQpk0KftiJFa7X7BP/IKYk=;
        b=TG+Q9qQSW1tWSgGKRJBEL1jzR7PzrO1UuMQzUppLfHkknu/k4esUrbHsSYA0NTmVnv
         4OUulovEKiNlS5AMusR/yvoRBYdEUX2Q5Yc8ZH+97yRQBoyx9TdMeac3Qll9vJi2Ny1+
         +ePBEFt/umRcx3KPUA1RZWvLrLXHKw6kUMD+SOP0ekjDw9uxnbY2tooRHEpbkIael7Tk
         asjaL/UDcd7EJ4Gp8Uszmq/C+p6UEqT6YfxZ3++kGcooQAa1hAyWTqJ42k2b7g0cH2jO
         Bm2x56sOHYPGxaTMJ/aV9uWXJQ4I3c7i4LxkMDzogLxE7J8yO7SEZvup9rFvacGPtJI+
         dNeg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Add recipe to remove obsolete intermediate files
Message-ID: <28055f52-bc17-b9b4-b81f-d286b930e096@gmail.com>
Date: Wed, 12 Dec 2018 07:46:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 271e880a74f5b8467a26f550c9abc9ed1ff8378d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Dec 2018 07:35:24 +0900
Subject: [PATCH] Makefile: Add recipe to remove obsolete intermediate files

Commit 3ab5541f7404 ("intro: Add containers and hypervisor to
"iron triangle" diagram") replaced intro/PPGrelation.fig with
intro/PPGrelation.svg.  The old intermediate file
intro/PPGrelation.eps causes duplicated targets in the Makefile.

Therefore, add a list OBSOLETE_FILES in the Makefile and remove
such files by "make clean".

Also remove PPGrelation.eps from intro/.gitignore.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile         | 3 ++-
 intro/.gitignore | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c928c80..49934df 100644
--- a/Makefile
+++ b/Makefile
@@ -12,6 +12,7 @@ LATEXSOURCES = \
 	*/*/*.tex
 
 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
+OBSOLETE_FILES = intro/PPGrelation.eps
 
 ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf
 
@@ -293,7 +294,7 @@ clean:
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
 		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
-	rm -f $(LATEXGENERATED)
+	rm -f $(LATEXGENERATED) $(OBSOLETE_FILES)
 	rm -f extraction
 	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
 
diff --git a/intro/.gitignore b/intro/.gitignore
index c29b706..cffadec 100644
--- a/intro/.gitignore
+++ b/intro/.gitignore
@@ -1,4 +1,3 @@
 FourTaskCategories.eps
 FourTaskOrder.eps
 Generality.eps
-PPGrelation.eps
-- 
2.7.4

