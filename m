Return-Path: <SRS0=PA3/=BY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=FddJlRga+Gr7pxmOxbs9VedX4VI/v17i133bGnKJ0NE=;
        b=HrT5TQFgrpZQOIBvsSG5fG18XHWISKQSzGK21Ihwio2V3SXDLzD1svPwMxndIo1cAY
         hLj8aylpwiu+X8P7AGtCgdZp6DWYIeNPdO2+pQXEi2CguTZdszVEBNU4iJMdwgLH4XbH
         pQYpAJTc/Wep6ivTRO0blQ7iAkRj4q+5/ubWQe9h78ArZXLJG1YEcRX49hVNND6BlF1/
         zIhblF5Vj1lyOx99zlhEfJNst82rJStdWFQmsZoCJjdUryUQyaLhYZ6RIK+phiXIgO3b
         pnZPVphYgyX9ggaR7iIHWn5PZ4GwgBqEzmHWoy1Ww21IqzBHnN7VBPsrkGtVuyMZ9lmP
         VrOQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Makefile: Prevent parallel runs of divideqqz.pl
Message-ID: <791a999e-5eb4-4a02-f3da-65b9527fc810@gmail.com>
Date: Sat, 15 Aug 2020 07:58:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 425dc57b802e1b9b2d5838da3408edbc827a6d62 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Aug 2020 00:44:30 +0900
Subject: [PATCH] Makefile: Prevent parallel runs of divideqqz.pl

Parallel make runs divideqqz.pl redundantly:

    $ make -j4
    sh ./utilities/gen_snippet_d.sh
    cp perfbook-lt.tex perfbook.tex
    sh utilities/autodate.sh >autodate.tex
    echo > qqz.tex
    echo > contrib.tex
    echo > origpub.tex
    latexpand --empty-comments perfbook-lt.tex 1> perfbook_flat.tex 2> /dev/null
    sh utilities/extractqqz.sh < perfbook_flat.tex | perl utilities/qqzreorder.pl > qqz.tex
    sh utilities/extractorigpub.sh < perfbook_flat.tex > origpub.tex
    cat perfbook_flat.tex qqz.tex | sh utilities/extractcontrib.sh > contrib.tex
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    utilities/divideqqz.pl
    sh utilities/runfirstlatex.sh perfbook
    ...

Racy runs of divideqqz.pl can cause corruption in qqz*.tex files.
Fix this by using an empty target.

Fixes: 1716487bd983 ("Enhance qqz scheme for chapterwise QQZ answers")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore |  1 +
 Makefile   | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index a25a00b7..6d928c3c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -25,6 +25,7 @@
 *.synctex*
 perfbook_flat.tex
 qqz*.tex
+sub_qqz
 contrib.tex
 origpub.tex
 perfbook*.out
diff --git a/Makefile b/Makefile
index 3e0503d7..a3f98442 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,10 @@ SUB_QQZ := qqzhowto.tex qqzintro.tex qqzcpu.tex qqztoolsoftrade.tex \
 	qqzdefer.tex qqzdatastruct.tex qqzdebugging.tex qqzformal.tex \
 	qqztogether.tex	qqzadvsync.tex qqzmemorder.tex qqzeasy.tex \
 	qqzfuture.tex qqzquestions.tex qqztoyrcu.tex qqzwhymb.tex
-LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex $(SUB_QQZ)
+
+LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex sub_qqz
+# Note: Empty target "sub_qqz" is used on behalf of $(SUB_QQZ) to prevent
+# parallel runs of divideqqz.pl.
 
 TWOCOLTARGETS := mstx msr msn msnt sf qq nq
 ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
@@ -250,8 +253,10 @@ contrib.tex: perfbook_flat.tex qqz.tex
 origpub.tex: perfbook_flat.tex
 	sh utilities/extractorigpub.sh < $< > $@
 
-$(SUB_QQZ): qqz.tex
+# Empty target to generate $(SUB_QQZ) files
+sub_qqz: qqz.tex
 	utilities/divideqqz.pl
+	@touch sub_qqz
 
 perfbook.tex: $(PERFBOOK_BASE)
 	cp $< $@
@@ -502,6 +507,7 @@ clean:
 		-o -name '*.pdfp' -o -name '*.pdfq' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out $(GENERATED_MAIN)
 	rm -f $(LATEXGENERATED)
+	rm -f qqz*.tex
 	rm -f CodeSamples/snippets.d
 	rm -f *.synctex*
 	@rm -f $(OBSOLETE_FILES)
-- 
2.17.1

