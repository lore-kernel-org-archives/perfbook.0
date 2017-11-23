Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EI8ljgGxdUa7EHL/kToE8wiDfWrqWgI5d3aK36DWnqY=;
 b=m4iLx6EQE3GcFEGM+ECXmdlNp6qcx8MojR9/eAysWeQlge01N1VPTu91hrBf5xhtbU
 /Rv1/Lyqhm5lEymv6XayixoQZnRfFHH/j1calBDLsgRLL8V5wkkRj/V/YdjfoMgZer7h
 E40i+3mHIxNXzbq8YKVM3UMeh/eQ4ivbno4s/LLztNT9CPSfcFwsEW20iH714FX/IwnQ
 CldASEoBEKNE1tl0UqfE9HRMey0z2jLnXuJ1UaNl2Bn2JxQiC2/PLtLJ4sLGFG+5nK0i
 +N8x29kem3ZsekqEdi2SNUGhQxrCzP6SQXJYBh5OWEGVygsDwx0wGIYpcKA7dFgcWjJc
 Gugw==
Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to memory model in
 cross-klitmus
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <436dc15a-073d-adec-3fd6-92633bd93041@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7350c9f9-6f73-3a00-eee6-239889f93d37@gmail.com>
Date: Thu, 23 Nov 2017 12:17:57 +0900
MIME-Version: 1.0
In-Reply-To: <436dc15a-073d-adec-3fd6-92633bd93041@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 62491d966a645d08ffc6bb0c5bae9f725458cbec Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 23 Nov 2017 12:07:18 +0900
Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to memory model in cross-klitmus

Target "cross-klitmus" does not depend on memory model.
Remove the implicit dependency of "cd $(LKMM_DIR)" from the recipe.

Fixes: ef76630632df ("CodeSamples/formal/herd: Add Makefile and utility script")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 1abe5c7..b99699b 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -73,7 +73,7 @@ cross-klitmus: klitmus.tar

 klitmus.tar: litmus2herd
 	mkdir -p klitmus
-	cd $(LKMM_DIR); klitmus7 -o $(HERD_DIR)/klitmus $(addprefix $(HERD_DIR)/,$(LITMUS7_HERD_TEST))
+	klitmus7 -o klitmus $(LITMUS7_HERD_TEST)
 	tar cf klitmus.tar ./klitmus

 clean:
-- 
2.7.4


