Return-Path: <SRS0=8s4x=OA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JT9rm7yMW1GgkdFTEHHe9/Sa3y0RlGuu9C8eDnmN/M8=;
        b=axl2x9qPwmG1v3mZVnBdH0zhXAbZdk8OgLospcV59WTpkmDIyc3dJug620YqQ6MPog
         ZhiAoGUfSqIU9qA2nfoGCYfx2MqzPqZcqBj4KEXmYNAFHIHHJY0Os2vYVoj2X4PP6oVU
         SIGB5AFuvTGwM1NApHLMfksqS11LIACOwRQavfgArQ8ayHiv2GQ35IgTZQchhaJV1TH9
         RReHLqXh67YgHjvzs1pK/lbLOt1QoTJKW/Lj+1oUrDl6SeStTgLevPFYboWY6S0Zkuo+
         AWaNlTh0yOHqi60DW3PfBC6atcLAsyG+VoFM3ha/7Pj/3Z6JeBCXkN5ODoEPQGTc9nyW
         nQNg==
Subject: [PATCH --perfbook v2 2/3] Makefile: Ignore .eps files under
 CodeSamples/.../OLD-*/
References: <19d34b29-3ccf-39c9-c933-c53fcf552a47@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f1789762-cdeb-661c-218e-04356d9ebbd9@gmail.com>
Date: Fri, 10 Sep 2021 19:12:33 +0900
MIME-Version: 1.0
In-Reply-To: <19d34b29-3ccf-39c9-c933-c53fcf552a47@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3df1810e..73b64e12 100644
--- a/Makefile
+++ b/Makefile
@@ -67,7 +67,11 @@ EPSSOURCES_DUP := \
 	$(EPSSOURCES_FROM_DOT) \
 	$(EPSSOURCES_FROM_FIG)
 
-EPSSOURCES := $(sort $(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP)))
+EPSSOURCES_OLD := \
+	$(wildcard CodeSamples/*/*/OLD-*/*.eps) \
+	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps)
+
+EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD),$(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP))))
 
 PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
 
-- 
2.17.1


