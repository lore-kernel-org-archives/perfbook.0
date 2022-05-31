Return-Path: <SRS0=PzxR=WH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=j1nuf7bNkCD4zLBtUNICwF35f1OAM363+PMiU/FwTFE=;
        b=hyojRd2gk1M+Ht8DgsyuucZtI5J3HfWIG+EUtPG25FcgXapjJT7B/Z229iJgyn3PpA
         XXy34jUmp5ylnHc6RC6gzzVlEe8gchY5MZBlhW5zF0sWTMKOUkYCPaGrwJtvo58XeMla
         U/qKsAGQU1z/MzlxyUUvxbMawl5JZlcJn5HVYbMyeUsjHKPqJUZqLfYGp6O/ERyFZ/gR
         L3oCfx0c5uUWAdMZIbvzSBOB/ugVtg08BSObIDBXY7tO3SHtXFsH2eEpJvPomHMZe9Wt
         8Uhir67dd0NEFkaHD4Zvb9/mUNXQZhJCFXrnOrp9YKPkSSoHMyT+FnFeKG9QsiQoaEVX
         BAww==
Message-ID: <6b69a285-0996-db50-d053-a402713e879c@gmail.com>
Date: Wed, 1 Jun 2022 08:25:31 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] epstopdf-rule.mk: Add -dNOSAFER to eps2eps for .eps
 -> .pdf (from .tex)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Somehow, eps2eps doesn't have -dNOSAFER while epstopdf has
--nosafer in the same recipe.
On CentOS stream 8, ghostscript 9.27 complains about the lack of
-dNOSAFER.

Add the missing option.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 epstopdf-rule.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/epstopdf-rule.mk b/epstopdf-rule.mk
index 4efad17a78a6..d248ce750d68 100644
--- a/epstopdf-rule.mk
+++ b/epstopdf-rule.mk
@@ -28,7 +28,7 @@ ifeq ($(GS_953_OR_LATER),1)
 	@eps2eps -dALLOWPSTRANSPARENCY $< $(basename $<)__.eps
 	@epstopdf --gsopt=-dALLOWPSTRANSPARENCY $(GS_OPT) $(basename $<)__.eps $@
 else
-	@eps2eps $< $(basename $<)__.eps
+	@eps2eps -dNOSAFER $< $(basename $<)__.eps
 	@epstopdf --nosafer $(GS_OPT) $(basename $<)__.eps $@
 endif
 	@rm -f $(basename $<)__.eps

base-commit: f19269d216ef6ebcfb417e87d040bd8374754c33
-- 
2.25.1

