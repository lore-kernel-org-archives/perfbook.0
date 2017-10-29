Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=bPTzUtS/cmlvjA/6cR3XjQevOeNVIA8C9R8EKJeWJwA=;
 b=c75GIOYoMgsdYfsT9jQxr5EPloBOSNTDM/KAP+kh5u9YZtp8CDSFtybPlYx4bKgGNd
 w/weZECkCrY9G8X34VjBEpEr6SJUlGuUrFgFXUUYjcdh/mECzQUome5W8395R3v2E3Ax
 KXK1wlbusC+xqQMHxDlleiCR4T99n6VVThP3qlPdGRlZ8QmyXBT65BOhnhaFogkhdKJO
 tsxdG1nlVuv5ak1EAmX8yRrGDt+k9FHaX5+A5hlUuXbDxqZGJsfAfLABL1U2t8N86FTz
 0SNWTmdsxjHfXCtaNQS8TEpHXaHCE4HHNeTVCdnvVhkp1Nmla+zsi6k44JJfpD//QXOU
 8AxQ==
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [PATCH] defer: Correct grammar
Message-ID: <3a7d438a-7b9c-8862-1f6e-3bc47e5f3c28@gmail.com>
Date: Sun, 29 Oct 2017 11:37:50 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: perfbook@vger.kernel.org
Cc: paulmck@linux.vnet.ibm.com
List-ID: <perfbook.vger.kernel.org>

From 9d049c1dcc544588c12c989ff433fa88e999e4bb Mon Sep 17 00:00:00 2001
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sun, 29 Oct 2017 11:36:21 +0800
Subject: [PATCH] defer: Correct grammar

Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
---
 defer/rcufundamental.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index ef3e4d4..4c16478 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -157,8 +157,8 @@ cause the values of \co{p->a}, \co{p->b}, and
 \co{p->c} to be fetched before the value of \co{p}.
 This is perhaps easiest to see in the case of value-speculation
 compiler optimizations, where the compiler guesses the value
-of \co{p} fetches \co{p->a}, \co{p->b}, and
-\co{p->c} then fetches the actual value of \co{p}
+of \co{p}, fetches \co{p->a}, \co{p->b}, and
+\co{p->c}, and then fetches the actual value of \co{p}
 in order to check whether its guess was correct.
 This sort of optimization is quite aggressive, perhaps insanely so,
 but does actually occur in the context of profile-driven optimization.
-- 
2.7.4

