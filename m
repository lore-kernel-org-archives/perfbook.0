Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=niF+/Niqt4H6uKMKxW2niz3o1rDHasLuaaESmdlWiqw=;
 b=ps/K2VDTnSN8LMuDYSw0+A6QFIsh6KSeZRPf61ZG74eCc1/BugwM887gj0cu9xgmc4
 xp7BDJtptHHhoyPwACy3R7KTzxrZL+ycdUe/PLb53LOrdxopJiBissyVZ8LvZklR02ku
 9d9Jwd8slRz4jXax4Nov1Ii/zF1yYPuF6OpN/25zACHgGujrmllhFuiYQwpf6Q9HfXFC
 kdynVZKKkAmsglZhkziHsLSH2kBvbFF9Oc/U31CfK9n0JUaHM5UeU7XDJKYFWncNs4l+
 1gP805Jt/CheA0cczI/dLLuk2ZCMpQgPvzOL0XYO9BnGFiByMe05qXQz5o1OJrl8C5p4
 MmgA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Another regression fix of build script improvement
Message-ID: <6a3c510c-f4c6-6826-46af-a91c7a45d17a@gmail.com>
Date: Tue, 26 Apr 2016 22:16:34 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c2ea05aa026f81e4b7641b8a14144fd8caa8f661 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Tue, 26 Apr 2016 21:20:15 +0900
Subject: [PATCH] Another regression fix of build script improvement

After commit 4038e781ed56 ("Improve behavior of build scripts"),
it is impossible to build 'perfbook-1c.pdf' and 'perfbook-hb.pdf'
just after cloning the git repository.
The reason is the lack of rules for 'perfbook-1c.tex' and
'perfbook-hb.tex'targets, which are required for them.
This commit adds those rules to Makefile.
The reason I couldn't find the bug during my test is both
'perfbook-1c.tex' and 'perfbook-hb.tex' survive even
'make neatfreak' which I assumed to be used to clean everything.
To avoid similar regression to recur, this commit also appends
them to the 'clean' target.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 Makefile | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index b909c81..4d9ed30 100644
--- a/Makefile
+++ b/Makefile
@@ -176,20 +176,24 @@ perfbook.bbl: $(BIBSOURCES) perfbook.aux
 perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sh utilities/runfirstlatex.sh perfbook

-perfbook-1c.pdf: perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
-	sed -e 's/,twocolumn//' -e '/^\\frontmatter/a \\\\pagestyle{plain}' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
+perfbook-1c.pdf: perfbook-1c.tex perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sh utilities/runlatex.sh perfbook-1c

+perfbook-1c.tex: perfbook.tex
+	sed -e 's/,twocolumn//' -e '/^\\frontmatter/a \\\\pagestyle{plain}' -e 's/setboolean{twocolumn}{true}/setboolean{twocolumn}{false}/' < perfbook.tex > perfbook-1c.tex
+
 perfbook-1c.bbl: $(BIBSOURCES) perfbook-1c.aux
 	bibtex perfbook-1c

 perfbook-1c.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sh utilities/runfirstlatex.sh perfbook-1c

-perfbook-hb.pdf: perfbook-hb.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
-	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
+perfbook-hb.pdf: perfbook-hb.tex perfbook-hb.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sh utilities/runlatex.sh perfbook-hb

+perfbook-hb.tex: perfbook.tex
+	sed -e 's/,twocolumn/&,letterpaperhb/' -e 's/setboolean{hardcover}{false}/setboolean{hardcover}{true}/' < perfbook.tex > perfbook-hb.tex
+
 perfbook-hb.bbl: $(BIBSOURCES) perfbook-hb.aux
 	bibtex perfbook-hb

@@ -257,7 +261,7 @@ clean:
 		-o -name '*.dvi' -o -name '*.log' \
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook_html.tex perfbook.out perfbook-1c.out
-	rm -f perfbook-hb.out
+	rm -f perfbook-hb.out perfbook-1c.tex perfbook-hb.tex
 	rm -rf perfbook_html
 	rm -f SMPdesign/DiningPhilosopher5.eps \
 	      SMPdesign/DiningPhilosopher5TB.eps \
-- 
1.9.1

