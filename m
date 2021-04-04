Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j3IDySHOuIkGBwJ76bePdFqIbzAo5s2iJn4EoTdNxoo=;
        b=ESbYvXzQhmob/EJf2CNTtqD7cBiTTZRbae8VtOrXGTohtsipKJzb0KjiGWSdRnz1SH
         IGwRP6DndB7TAmyYImIFo6Dyx7QoaRqjuoqyHLbBtV0UcY3SujWym/x1usJOmY38ZtgV
         f+98HP69ohi1IYHmGdzfITd6TYqpICzrIaAccHsqF6GCLdg1wfU67M8ouhAukI8cB7Vh
         0holfGoi8I8ZM3PCbgJ4/q8U+G2Vbd8cEZfid0ryjMp5fsVADL/OwMzPYUEZKrkenChM
         R5tAegseixt4Vhs7ow5EGafsXrLmE5x8B3N+twDLivwiDLkjtgltAOasRMt8jQ02ucV0
         U5kw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 4/4] howto: Fix a typo (License -> license)
Date: Sun,  4 Apr 2021 12:05:03 +0200
Message-Id: <20210404100503.20978-5-sj38.park@gmail.com>
In-Reply-To: <20210404100503.20978-1-sj38.park@gmail.com>
References: <20210404100503.20978-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit fixes a trivial typo.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 1c279e9a..8bedd649 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -511,7 +511,7 @@ a very specific meaning, namely that you are certifying that:
 	the open source license indicated in the file; or
 \item	The contribution is based upon previous work
 	that, to the best of my knowledge, is covered
-	under an appropriate open source License and I
+	under an appropriate open source license and I
 	have the right under that license to submit that
 	work with modifications, whether created in whole
 	or in part by me, under the same open source
-- 
2.17.1

