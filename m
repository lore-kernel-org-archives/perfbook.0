Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/66kobnywhv4wGvZo9crvKJeEI/PRON5P9tUqhrTDN0=;
        b=bCPwXq0bnJqOB3aT1PJ4Gz5gXgk11oG4FKVH70wCsM2FWByqXSSa7yTb9QksVjhDP+
         sUW7TPP6Xj9WzUkzb70N4UzsYBCtuDZpqm3DnrOD8ERtyNDVZNF/07HpLyY+a4yShkwa
         AXdKQeQ4uh5gixorCY/1DzHh7XrRZ81iO8kSwNIpUP4qtAIjVYwrf8qW6ifwpJfcXLUq
         X/I6NMyh7Teg9QufhM3pJZ08VYx6dqphtGtlUh47DpXt02tcG1t7ZCFKXF/l6iVoTy1C
         9JtdZrFPJMbqM6lUwRsdgKuJxJUy3ItuquaS3F86ReaQ7Cv+nzRXxpryAevRQrIl12ec
         14GA==
Message-ID: <7b03756f-f35f-d2e0-0b09-90917df98e3c@gmail.com>
Date: Mon, 11 Apr 2022 16:53:10 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/7] Makefile: Ignore temporary .eps files
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Recipes in epstopdf-rule.mk and a2ping-rule.mk use *__.eps and
*__.pdf as temporary files for fixing fonts and cropping.

Those files are removed afterwards in normal builds, but if you
interrupt "make", they can escape from removals.

They may cause a build error in subsequent "make", which might not
be resolved by "make clean" but needs "make neatfreak".

Add variable EPSSOURCES_TMP in Makefile and filter them out from
EPSSOURCES.

Add a pattern in .gitignore for them as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore |  1 +
 Makefile   | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3711e0c6..1604a4d8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,6 +17,7 @@
 *.swo
 *_backup.svg
 *.epsi
+*__.eps
 *.svgi
 *.fcv
 *.ltms
diff --git a/Makefile b/Makefile
index e09ba32d..a605487a 100644
--- a/Makefile
+++ b/Makefile
@@ -67,13 +67,20 @@ EPSSOURCES_DUP := \
 	$(EPSSOURCES_FROM_DOT) \
 	$(EPSSOURCES_FROM_FIG)
 
+EPSSOURCES_TMP := \
+	$(wildcard */*__.eps) \
+	$(wildcard */*/*__.eps) \
+	$(wildcard */*/*/*__.eps) \
+	$(wildcard */*/*/*/*__.eps) \
+	$(wildcard */*/*/*/*/*__.eps) \
+
 EPSSOURCES_OLD := \
 	$(wildcard CodeSamples/*/*/OLD-*/*.eps) \
 	$(wildcard CodeSamples/*/*/OLD-*/*/*.eps) \
 	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps) \
 	$(wildcard CodeSamples/*/*/*/OLD-*/*/*.eps)
 
-EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD),$(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP))))
+EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD),$(filter-out $(OBSOLETE_FILES) $(EPSSOURCES_TMP),$(EPSSOURCES_DUP))))
 
 PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
 
@@ -564,7 +571,7 @@ clean:
 	rm -f perfbook*.glg perfbook*.glo perfbook*.gls perfbook*.glsdefs
 	rm -f CodeSamples/snippets.d
 	rm -f *.synctex*
-	@rm -f $(OBSOLETE_FILES)
+	@rm -f $(OBSOLETE_FILES) $(EPSSOURCES_TMP)
 
 paper-clean:
 	rm -f $(BASE_DEPENDS)
-- 
2.25.1


