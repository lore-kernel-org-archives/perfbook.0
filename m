Return-Path: <SRS0=q5UQ=SQ=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=bwE6Zd93l/GTJP
	jzwQOPzzLpbyYxhUd1oGPha1yusgk=; b=ehktJetsQvgFPU/aettwwLH6jD6R83
	vRyqGRgbAF22EIIarmDyS42ofsid8u270pyfO2WKCxmZ7IMxhLdLgTs5YLAupXZR
	7aNtWQVFCWeFRJVascpPPXkQMUrE1PJpq3oEMh1/ILBBjg0AaMREB8gDsSIgV3sd
	W4YRcWUmxH3UZcJTuRjPja37dSKTMcEInh/5riAeqiO2CcujSQ8/cDiS8Da+BG1Z
	unyrjNH2aJF9SV4kiV4hceRUmKrOwipJHcrEayxLCxROXy3E90r+joe7tehCagrZ
	BRx+S1WvNVnSISOZZCPN/s3A59+7lTqdQerqTd/aFl/Dk3WLlZgYb7gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=bwE6Zd93l/GTJPjzwQOPzzLpbyYxhUd1oGPha1yus
	gk=; b=dkWTFpgNZiD/3Lnv56YAmhzrRM5P+0cJtoD0DbqTf9RVolaZwlV+Z8Blc
	62Vtu4PMlpnlIC3ej4IP2VDIaOVBHtEAv2h6RECFYI/nOJVhpLoEyzqBV3DY0wGi
	5R4iHjSjgQPi1LI3dnGWSgXu6b6AShtHbxjthSyphY+zV5jAd5wIguagwIpJRaRB
	ZnWrcrbSNU+QR++80b4A6Kw4F9lMe7jjdOUCpXD5rsm48WdBIMqYwJZTrwfeER0W
	9QT9Yk5pronOfe7YMAvSHakqxdxnJWtRaWgpWXyUeQrD4lCblxpAQ3QQoM2+966L
	i+npRT4AJQuYwPOapS+41kvriSF2w==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 3/4] glossary: Fix typo
Date: Tue,  1 Feb 2022 21:07:50 +0100
Message-Id: <20220201200751.23589-3-johann@jklaehn.de>
In-Reply-To: <20220201200751.23589-1-johann@jklaehn.de>
References: <20220201200751.23589-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index f0cb33e3..46c68bbe 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -441,7 +441,7 @@
 	The use of algorithms, mechanisms, or techniques that provide
 	non-blocking forward-progress guarantees.
 	NBS is often used in a more restrictive sense of providing one
-	of the stronger forward-progress guarantee, usually wait free or
+	of the stronger forward-progress guarantees, usually wait free or
 	lock free, but sometimes also obstruction free.
 	(See ``Non-blocking''.)
 \item[NUCA:]\glsuseriii{nuca}
-- 
2.34.1

