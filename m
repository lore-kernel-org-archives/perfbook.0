Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+sWThJHF3pYEZDQdC+pAtiz6pZRqlGOHPelQV5uVAmU=;
        b=iZ3a/vK3jUgm0Hvx5yJdH+gWuNTQkIfc/kLcVy5bLV06kPItud5uYN+pGJ6Wv4TZNS
         pjAAeKruLWmbA3FljJQqHIl9wSm3hAu59csEom8CUlI2HD3F63LFJG2vZhYPYenQC6Zg
         oxCJAlE97GYVzkYxDfXY3nQlNTFvnSoqM+1KaeohqH60l25F4w65BKOGl1T1YEPTHKD0
         bk6quaR0j4aM+PfiwR29JUNujJKFjo501WGC17dk+lN7AP+528tf9OZCFBBpCgYnHSIN
         /NiXe1yZAXSAFBrv3idse+UUK7BMi3r3OUyrdIS9XZglv5spb5v+9umWDZUyGzf7PjdJ
         hTbA==
Subject: [PATCH 2/3] Makefile: Invoke checkfcv.pl in -> .fcv recipes
References: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9e61b075-0d45-e709-055a-487911161f60@gmail.com>
Date: Sun, 27 Jan 2019 00:11:32 +0900
MIME-Version: 1.0
In-Reply-To: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1aeb3e922c7d588e21bf269c63b62b6ea4fd0c7a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Jan 2019 21:56:28 +0900
Subject: [PATCH 2/3] Makefile: Invoke checkfcv.pl in -> .fcv recipes

Also suppress echo of commands in these recipes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6ef4629..2ed7500 100644
--- a/Makefile
+++ b/Makefile
@@ -254,15 +254,17 @@ CodeSamples/snippets.d: $(SOURCES_OF_SNIPPET) $(GEN_SNIPPET_D)
 
 $(FCVSNIPPETS):
 	@echo "$< --> $@"
-	utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
+	@utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
+	@utilities/checkfcv.pl $@
 
 $(FCVSNIPPETS_VIA_LTMS):
 	@echo "$< --> $@"
-	utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
+	@utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
+	@utilities/checkfcv.pl $@
 
 $(FCVSNIPPETS_LTMS):
 	@echo "$< --> $@"
-	utilities/reorder_ltms.pl $< > $@
+	@utilities/reorder_ltms.pl $< > $@
 
 help:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
-- 
2.7.4


