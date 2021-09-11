Return-Path: <SRS0=Xarl=OB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=HZJ0lw+9/J1dUh7LCbrYD8F6VxI3FjlQwqhh0O8kDtk=;
        b=Z/y2qKk+GR8zDtgNBhO4u6vZscj4lLegNrnhFjqBACQMrw/o3zvj0Mm8UDrbQVTbLQ
         ujuBdyFvi3/h9hDffLT1xNYjKXsiJJpSOx1IW01SYU+La6vUiRRHSw/rhHTlD2uhns0O
         VGmQUaxYZSguyRx7+0Ibyoc94wqYO/dY4Tu6ZHqFblvzZIi047I8S7LQxue7pg51fX7q
         lZroQIvROcfCsVpDuPhBAg2/9udY+FXtnj6FkM7Mko+bNl2wLGi/+brf3GNNPOicJfSH
         89qVmn/BIa5Lg9sEajGEFqgvtMDYxtjFwXuIgqZrmzRgjaY2Ns13edmXLuGfEnm7abmL
         5bcw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Makefile: Add patterns to ignore 'OLD' .eps
 files
Message-ID: <72178e63-faf4-0853-1243-1bae45cbdd5f@gmail.com>
Date: Sat, 11 Sep 2021 23:24:18 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add patterns to catch:

    "CodeSamples/defer/data/OLD-3a20/2007.11.19a/rwlockRCUperfdbg.eps"

and similar.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 73b64e12..990ffe9e 100644
--- a/Makefile
+++ b/Makefile
@@ -69,7 +69,9 @@ EPSSOURCES_DUP := \
 
 EPSSOURCES_OLD := \
 	$(wildcard CodeSamples/*/*/OLD-*/*.eps) \
-	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps)
+	$(wildcard CodeSamples/*/*/OLD-*/*/*.eps) \
+	$(wildcard CodeSamples/*/*/*/OLD-*/*.eps) \
+	$(wildcard CodeSamples/*/*/*/OLD-*/*/*.eps)
 
 EPSSOURCES := $(sort $(filter-out $(EPSSOURCES_OLD),$(filter-out $(OBSOLETE_FILES),$(EPSSOURCES_DUP))))
 
-- 
2.17.1

