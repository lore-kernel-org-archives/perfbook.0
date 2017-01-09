Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=/ifk7QBVXuy60dvnTYU2oTj38+sRwiXRjiV5iPy1p1E=;
 b=KknxWqnmfYycwMTTytNhU+ROS44Ym7noHlFR5ORkAYdAUMwZVqg7g+E2s1V7MyHILN
 GKnHsDCVJYje2RBXI6G4eqvCz/GUvWDDip1du40WH+MbrOp/aixFhBjWzXGhDLDlQYZc
 UseR07+tgx+WVMdOv1q9MlGysE+JQxfLlc8YzWhaKOn7JyW2Q61sfzZOBvd9XnZEKHNu
 aWbuvj26pdg9OGYBwwqZ8/zZ7YlozlhIe02qPp6c6leMZFCsOzbNgTQ7iQAhrBb7Bj4V
 E+MjeC88HpQsFjs6f7OEJ8n/pwmE8MR7Phgqm1YJgagiHZxq3JhbE3aRW2DA9J3mwsNP
 b8wQ==
Subject: [PATCH 2/3] Makefile: Use qqzreorder.pl in qqz.tex target
References: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <066f5d73-7c92-a31c-f80e-771bda14918f@gmail.com>
Date: Mon, 9 Jan 2017 23:41:52 +0900
MIME-Version: 1.0
In-Reply-To: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 36a6809e32a47baf16e8ebe8922e7e05caa6a083 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 9 Jan 2017 18:29:59 +0900
Subject: [PATCH 2/3] Makefile: Use qqzreorder.pl in qqz.tex target

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9a2e118..e953842 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ perfbook_flat.tex: perfbook.tex $(LATEXSOURCES) $(PDFTARGETS_OF_EPS) $(PDFTARGET
 	texexpand perfbook.tex > $@

 qqz.tex: perfbook_flat.tex
-	sh utilities/extractqqz.sh < $< > $@
+	sh utilities/extractqqz.sh < $< | perl utilities/qqzreorder.pl > $@

 contrib.tex: perfbook_flat.tex qqz.tex
 	cat $^ | sh utilities/extractcontrib.sh > $@
-- 
2.7.4


