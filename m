Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/dHAyzWdlW3RF+Sv3Ekzpeij9rSzeb6yWH99+ZV9UhQ=;
 b=Dpesj5rCurcWP+yU6OcuI3fNpuRBqtQ8nXUdQ+Ac2yyTx0xY0YH1TFXBZy408uYUrs
 SFYx2ZDF6AY6SDPyAq7g8F5nUq8KxkizT8CSkRE/HO8jyHaeFOFFToIkQdi1ndhZGt6M
 qK9CgUOZBOZaY569Eb+jyErWsQePSknqUeYML0JZs7ZKUdlM+hjeykMFY2uwjQcg2pOD
 PaB6T57lctDNvb16kYve2aUxSeCOR3i4Mdt67g39hykDCzYL/aSQVIoHR2siNgRT9RSA
 8IaiBX2y30iZhe8xmgZt1j3pzHhBB5Z/5hPeYp2lczQtxa6g+o7w8W+16v4IJlMDjjrL
 +LvQ==
Subject: [PATCH 5/6] Specify 'labelfont=bf' option in captionsetup
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <aa6373aa-eb51-4cc3-61ea-24f3bf526c06@gmail.com>
Date: Wed, 9 Aug 2017 07:11:20 +0900
MIME-Version: 1.0
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 56e303e44387b2270d154d5ef4ed18d354e11c45 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 6 Aug 2017 12:14:22 +0900
Subject: [PATCH 5/6] Specify 'labelfont=bf' option in captionsetup

This change gives similar looks to captions of figures and tables
as code snippets with "ruled" style.
The bold caption labels have distinct looks from body text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index bfb1c79..f622708 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -25,6 +25,7 @@
 \usepackage{epsfig}
 \usepackage{subfig}
 \newsubfloat{listing}
+\captionsetup{labelfont=bf}
 % \usepackage{breakurl}
 \usepackage{graphicx}
 \usepackage{rotating}
-- 
2.7.4


