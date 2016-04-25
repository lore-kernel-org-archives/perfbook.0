Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=jUp8Koto7nGWYqxZv8BHoMV/i+pEG0ejB7MyLhlsWZE=;
 b=os7j1/Z+YCSRKLlxqXREessJkKHEpgmzqyP60OYIpVVnSsPJ9WJ7QxdcWTPHfsfbkY
 ZVzpDCI2qIy9OV3safSU+mm2bv7nKc1z8N5MFwZMFGshnhVOoWlizIRV9cCKohUb7ZlQ
 RHJNXME9wpVtG1LaFYSXTLIIa6RfxO2RCu7uZwaBQm6ySdOTXVlxrQiXsPGCQhFUN2Oq
 FvnUSitvO9p7YWDMReC4AVLhJL1lxNllxXbZNlL22ZKPRePSJjWYTdWfJltrKO2n8gup
 Fck2CplxzpgGtJH/zB7AmEFXFMxY2gjWc0UZtShjdp58DP6WgE6myC2r7ehWTVNdgz1z
 o+9w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Fix regression in improvement of build scripts
Message-ID: <571E0B74.6030808@gmail.com>
Date: Mon, 25 Apr 2016 21:20:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul.

I realized there was a real regression in the runlatex refactoring
patch.

Attached is the obvious fix.
I hope nobody has been affected by the bug.
Please apply.
                                                   Thanks, Akira

---
From 816c5fb3ae9bf1ad18e622cbee327aca1df66629 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Mon, 25 Apr 2016 20:47:31 +0900
Subject: [PATCH] Fix regression in improvement of build scripts

In commit 4038e781ed56 ("Improve behavior of build scripts"),
I made an obvious error in the dependency of 'perfbook.aux.'
This commit fixes it.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7202334..b909c81 100644
--- a/Makefile
+++ b/Makefile
@@ -173,7 +173,7 @@ perfbook.pdf: perfbook.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 perfbook.bbl: $(BIBSOURCES) perfbook.aux
 	bibtex perfbook

-perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES)
+perfbook.aux: $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
 	sh utilities/runfirstlatex.sh perfbook

 perfbook-1c.pdf: perfbook-1c.bbl $(LATEXSOURCES) $(EPSSOURCES) extraction embedfonts
-- 
1.9.1

