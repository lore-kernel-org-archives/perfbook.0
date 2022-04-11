Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ERCDDrlUmV9+kOZUT1p3PFJjbQth6Euq9bdBRwrk3rM=;
        b=Vv4QeRmOorYfHd02M1mD9snDpZ/Zyp3Mi9hGkTpgWMxUKDLkefe7Q0jql8tKts+PJc
         seaHfzK5wx4i+9gysqVGkW0mqVV59+wMdstm7T95Ct1Bpze2GIH+mKndyYR3Dia/PdKZ
         UmeaaaTFFOTNRe9rCpElOXgLHJ1TkZW6IZZRWV31Eu9xaTpzJT5E3MdfKcDXe2L/GkhC
         nllC3H5X7LFAwcLqWou+d0luNW1J/kuXGT0OKCmLx9ApQWHqFwoh8pfMry7z/xSuDpwV
         UbYRfXdlbHbOEFUWRWvtWAePTFJ3L2l5zEO3APJFAPdxpXHvtDf1vP6eUxUEQpkOo+hA
         XNgg==
Message-ID: <01defb62-e787-81ab-1875-616d7e23e688@gmail.com>
Date: Mon, 11 Apr 2022 16:55:52 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/7] Makefile: Remove redundant nest of filter-out
 function
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Simplify the use of filter-out function.
This simpler list of variables in its first argument should have
been used in commit afd0c61f9cd2 ("Makefile: Ignore .eps files
under CodeSamples/.../OLD-*/").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a605487a..ff8a6a26 100644
--- a/Makefile
+++ b/Makefile
@@ -80,7 +80,7 @@ EPSSOURCES_OLD := \
 	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps) \
 	$(wildcard CodeSamples/*/*/*/OLD-*/*/*.eps)
 
-EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD),$(filter-out $(OBSOLETE_FILES) $(EPSSOURCES_TMP),$(EPSSOURCES_DUP))))
+EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD) $(OBSOLETE_FILES) $(EPSSOURCES_TMP),$(EPSSOURCES_DUP)))
 
 PDFTARGETS_OF_EPS := $(EPSSOURCES:%.eps=%.pdf)
 
-- 
2.25.1


