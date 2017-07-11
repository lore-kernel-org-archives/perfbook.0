Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oxH/+/B4hyuAMfZQSIUktY/Z9d17QwlOL96UZ1Qc/dE=;
 b=LL0iBisKoozchcMDcoCn8VjlGwU6eALld+TvSZ7ucfkQIq0HXx8B13id2Zd/5Rxcjz
 QUHHWPzttLqEId7gA5mVD+Wom+ZI9kQCYy0KTqNh/rYeDe+Tlj58hA+MKZBmoXsoYcxL
 lTT/HCTArEYEEt2RHOtxk31v28vIUowpwrBJw9n08yel250f+G7um/h0WXgFy4XbMEHD
 IOf7XE8pPQxC3AVFBeBoyPxlVREosITz8XcFirVfl2I8lgRQwTqK89B25XcAbWCDOUkH
 cO8f6ORo7YB5PZifMgmS0I+WMI6XLqjA8EygB/R3awa9hJYwyt7QXgdY8LpNfHV3vM90
 VsWQ==
Subject: [PATCH 1/2] advsync: Add dependency to $(CUSTOM_HEADER)
References: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <53e917f7-0f6b-75de-7841-f56cbf4e7494@gmail.com>
Date: Wed, 12 Jul 2017 00:31:07 +0900
MIME-Version: 1.0
In-Reply-To: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 69493e126b70589656c3331d34865d2a57b5cf36 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Jul 2017 12:18:19 +0900
Subject: [PATCH 1/2] advsync: Add dependency to $(CUSTOM_HEADER)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/herd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/advsync/herd/Makefile b/CodeSamples/advsync/herd/Makefile
index 056f5f9..96c4495 100644
--- a/CodeSamples/advsync/herd/Makefile
+++ b/CodeSamples/advsync/herd/Makefile
@@ -8,7 +8,7 @@ CUSTOM_HEADER := $(wildcard *.h)

 all: $(LITMUS_OUT)

-%.litmus.out: %.litmus
+%.litmus.out: %.litmus $(CUSTOM_HEADER)
 	litmus7 -r 1000 -carch X86 -ccopts "$(CCOPTS)" $< > $@ 2>&1

 cross-x86: TARGET = X86
-- 
2.7.4


