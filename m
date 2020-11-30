Return-Path: <SRS0=tTHS=FE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ep2rcFdEInWpN1I6cZfSAyyPqsIEuZXTjBS+kyCyeF8=;
        b=nNoDKT4Yxmhma4m8D+9HTcF4blYCG6xdrWVa9q5M2AbPD+iiH4Sa7aFLN5xXYfyddS
         qTt1yIyNY8CYZlaqbxJerYPwrR2NFGgB09h2aNPfZNM2eaZQB8fEh29/4PP1C0x6cdqM
         K0oY59ay91q+MWL9mt5GyPpFtsC2CZJuaqjypi4TKuZI1qxL0rTzUVVMhJHHlTQ2RAcD
         bzDRAaEES65++j1m0+f6X+RuuPle2RSzGZ4ZjK++d0nzN0zFCvDQGRaGnaz5YlAcFQqR
         DjcCmdaL/eVf0Nbb8BvZVwrC7q948LLN2ZZfCLg6PrTxGmn6WqokQwsuwpMrk21YG7zQ
         h2/g==
Subject: [PATCH -perfbook 2/2] Makefile: Extend wildcard pattern to catch .eps
 files under CodeSamples
References: <ee4f6b1e-fd90-819a-5ff8-681d6a2e680c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1f652999-02ce-39a0-6880-6303bc017ce4@gmail.com>
Date: Mon, 30 Nov 2020 21:04:04 +0900
MIME-Version: 1.0
In-Reply-To: <ee4f6b1e-fd90-819a-5ff8-681d6a2e680c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8306e360c789e4063f027c2862658764a2f531be Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 30 Nov 2020 20:14:16 +0900
Subject: [PATCH -perfbook 2/2] Makefile: Extend wildcard pattern to catch .eps files under CodeSamples

Some of the files have not been bounding-box adjusted for some time.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 07c6616a..56ce62bf 100644
--- a/Makefile
+++ b/Makefile
@@ -55,6 +55,9 @@ OBSOLETE_FILES = extraction $(FAKE_EPS_FROM_SVG) CodeSamples/snippets.mk
 EPSSOURCES_DUP := \
 	$(wildcard */*.eps) \
 	$(wildcard */*/*.eps) \
+	$(wildcard */*/*/*.eps) \
+	$(wildcard */*/*/*/*.eps) \
+	$(wildcard */*/*/*/*/*.eps) \
 	$(EPSSOURCES_FROM_TEX) \
 	$(EPSSOURCES_FROM_DOT) \
 	$(EPSSOURCES_FROM_FIG)
-- 
2.17.1


