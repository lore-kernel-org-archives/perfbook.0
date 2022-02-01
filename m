Return-Path: <SRS0=q5UQ=SQ=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=6WAkQuZEHpreBewJOhtPmX27I+RdoUgkVXu4P+
	qsxFc=; b=EdkKIvInuXRJxuFd/qeBflkGtLa0I+r/COvqBgsgjnL4hAax2YtNjX
	pqyo0FcGYL9BTIhEbNpcaNVdUjKUtbpt/aDfWGF3+GlGhdwdZm4j+FzmSFam6mBX
	LWaAwv//Fxjt/JTJZGlaTV9KwBC3eT/Qa5UWoSiXV5+1h+Y2L1le2Jc5ol1e+xAm
	kYuBta86/o7nU/xNEh1TWESQNayiO8OSa7RSlwO5YiXaT9H2aj+8iTZIZVYwv7kG
	33WblyX9cpo3KdDAFuv1xNiZjlpVd6/kMurYMx6IoqSDMbZBnkMeXmmfk0y2XKOS
	5esEc2DFJDsiUIaspJIxcnsQRsMjrvzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6WAkQu
	ZEHpreBewJOhtPmX27I+RdoUgkVXu4P+qsxFc=; b=oELLc2PZ+/Buo/aMwfkQpf
	awkWwHHyCxwN4lUpP9Nuids1puxZGlDL/FIy2ObM8OZag3pe5JMP4Zo2onvzaA3e
	7Zu7zD41uTnIwR7ZEsR17oHecl3CqRaEM5oHdYo49XXfefzC6+Iq2f/0fD2EsG+N
	CKn6qqO2hOumWrOPVVyV2MyUZIm4Tll8F7hZSw5mv6L1OguLYI/EejnSN/7shgCP
	aMDiH6Kbaf5Gvmm4r1ERgewJCvVp/uQIzaqTafDyvBq7OrAYlOZpIlYhGJLEDDns
	S8IIQh+IXxlOKuWE90yHN/iQLSSy463lNV12BSRYjsuxt80LZCtVSMYS41wzJYfQ
	==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 1/4] cpu: Fix typo
Date: Tue,  1 Feb 2022 21:07:48 +0100
Message-Id: <20220201200751.23589-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 cpu/overheads.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 84360256..b8a65faa 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -109,7 +109,7 @@ events might ensue:
 	CPUs~0 and~7 might have different values for the same set
 	of variables in the cacheline.
 	This sort of incoherence greatly complicates parallel software,
-	which is why so wise hardware architects avoid it.
+	which is why wise hardware architects avoid it.
 }\QuickQuizEndE
 }
 
-- 
2.34.1

