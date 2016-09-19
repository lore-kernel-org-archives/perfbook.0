Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=rq5gf9pY6Mnk+Nru8fOFCFvXzOWDaahnlIaPJKvbssk=;
 b=NHGE8efrkY2c6uQ3vcPZbEsrbcW48+QdNoQb/OwC3a1ljY2LjUUPl1pEzebiGyz9zZ
 Tv16UGhPULn6Aq9KwBML/qj6Hdw3ObgJe9BBJYlG3sXfTThC2YNiksV/0G5o2MQZpHoc
 v4l0Olp0fsK4Mrtke8UkG77ooFLE9wgBiQGE0iXBCwMxcfkEIKp3hLvK+MTF8b4il/WS
 7IoeKDNR1tWyhPGBDx8t7KkrJtJffB/uNBQFF92GpeCtdZMbV68SvUMsV0uQm8I+1Dx9
 2TGl0ZLmhlttLYML8MFAztAMt4CIvKWOZdjN4aQd0mfzhou3XI9FAdoUcxNfUAbAF44O
 Zc0w==
Subject: [RFC PATH 3/6] Makefile: Add localized 'book.cls' to dependency
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7c04e1e1-6abc-f01d-bab3-72b95bf09bb0@gmail.com>
Date: Mon, 19 Sep 2016 12:05:12 +0900
MIME-Version: 1.0
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5592199d5aa5e2c64c8763079d93fabcc45afc77 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 19 Sep 2016 07:31:59 +0900
Subject: [RFC PATH 3/6] Makefile: Add localized 'book.cls' to dependency

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 570b79e..e06b0a8 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,7 @@ LATEXSOURCES = \
 	legal.tex \
 	glossary.tex \
 	qqz.sty origpub.sty \
+	book.cls \
 	*/*.tex \
 	*/*/*.tex

-- 
1.9.1


