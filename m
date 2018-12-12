Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o24d/rMsw2g8Q8+wBJL1CRP2yxnKspl0XOyShyPgntA=;
        b=DnKjpPkxjn5T68QL9W13ijb4XnPaIHmnOsmC8MNNmcokTDiOLgawdqC7w8c7IesYvy
         UpwqMSkEPFxjfV2UppRePJM7s0gXstAB37Lb98iwouJuSuFT7aMTBMzrpTvY+E4x3Z2i
         WwV1Oikjk9EsqwabCg3a2yYOCEytvT3dlsJGkF/86jBY8DE4oorSLSQUrKl4CGTcHPK9
         vYU1ijCOUCzMzPyUyK+WkGMCwvu1I51LOQgL5RaQyq2iq1BA567ZzITfpURrkKhDg2Cd
         tqRmCpxVTtjI2VnEXd6hagOS42enezJDFKsdcC6xYe/VD+GZ5jCqKxc3Dgh45ivKEM3W
         r6/A==
Subject: [PATCH v2] Makefile: Add recipe to remove obsolete intermediate files
References: <28055f52-bc17-b9b4-b81f-d286b930e096@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <398dbc5f-7e83-cc5a-0029-b6125fba8f1b@gmail.com>
Date: Wed, 12 Dec 2018 20:27:15 +0900
MIME-Version: 1.0
In-Reply-To: <28055f52-bc17-b9b4-b81f-d286b930e096@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 33b506548ce3b09cbf7a7e4e8bf1a80496dd9e1a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Dec 2018 20:11:21 +0900
Subject: [PATCH v2] Makefile: Add recipe to remove obsolete intermediate files

Commit 3ab5541f7404 ("intro: Add containers and hypervisor to
"iron triangle" diagram") replaced intro/PPGrelation.fig with
intro/PPGrelation.svg.  Left-over intermediate file
intro/PPGrelation.eps causes duplicated targets in the Makefile.

Therefore, add a list OBSOLETE_FILES in the Makefile and exclude
such files from EPSSOURCES.

Add "extraction" to the list since it was once an empty target
and obsolete now.

"make clean" will remove those files.

Also remove PPGrelation.eps from intro/.gitignore.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is an improved update.

v1 -> v2:

o   To prevent warning of "make" even if the obsolete .eps file
    exists, exclude OBSOLETE_FILES from EPSSOURCES.

o   "extraction" is also obsolete, so add it to OBSOLETE_FILES.

        Thanks, Akira
--
 Makefile         | 6 +++---
 intro/.gitignore | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c928c80..79ccd99 100644
--- a/Makefile
+++ b/Makefile
@@ -12,6 +12,7 @@ LATEXSOURCES = \
 	*/*/*.tex
 
 LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
+OBSOLETE_FILES = intro/PPGrelation.eps extraction
 
 ABBREVTARGETS := tcb 1c hb msns mss mstx msr msn msnt 1csf
 
@@ -38,7 +39,7 @@ EPSSOURCES_DUP := \
 	$(EPSSOURCES_FROM_DOT) \
 	$(EPSSOURCES_FROM_FIG)
 
-EPSSOURCES := $(sort $(EPSSOURCES_DUP))
+EPSSOURCES := $(sort $(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP)))
 
 PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
 
@@ -293,8 +294,7 @@ clean:
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
 		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
-	rm -f $(LATEXGENERATED)
-	rm -f extraction
+	rm -f $(LATEXGENERATED) $(OBSOLETE_FILES)
 	rm -f CodeSamples/snippets.mk CodeSamples/snippets.d
 
 distclean: clean
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


