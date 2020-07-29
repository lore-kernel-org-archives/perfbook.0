Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rV+kJQWnNG/HnuEBdo6s6sh0p3/RFNl8Zdu4BuWkAug=;
        b=NTyakJuoKZKFyHhZlscQORJRdKg50gH+QVFlEtZLBsNfFECsRTEGly7nYNMrcpYuSI
         Qy1rNbxcBfV8B46oYSpcd1sQUjGqlLZAG9bZJXzlnMMVhWPmmT4HUcZPPi4XKv5p78V1
         jrVK+8oUCsOyI+b50PGUMzG0a8M0nhHXMSih67ixKyz9IF2Sy67gukGxRCHflET/tQhJ
         PLpsCbV4vmmXGO9Y1Lh2uAssOaxt2ulGPBGilSSdXIgCxujwbW4MUfkz/6DdoHhXKDsQ
         IxLPFoCpo2OB9JQFoDYNQv/hmkWKKYH6FhhAs+sq6lph6Khlsj58BCZbzp4U68TyUBp9
         ymIg==
Subject: [PATCH 3/5] perfbook-lt.tex: Tell cleveref not to capitalize 'page'
 in \cpageref{}
References: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <11008d21-198e-2e42-c25a-f8cb3715e219@gmail.com>
Date: Thu, 30 Jul 2020 00:17:12 +0900
MIME-Version: 1.0
In-Reply-To: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9488aa3736a281a0f9be8b9f1748c25c9d60f970 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 28 Jul 2020 00:30:36 +0900
Subject: [PATCH 3/5] perfbook-lt.tex: Tell cleveref not to capitalize 'page' in \cpageref{}

Negate the "capitalise" option for "page" type reference.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 6b339d51..7432eecc 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -225,6 +225,8 @@
 \crefname{sublisting}{Listing}{Listings}
 \crefname{sequencei}{step}{steps}
 \Crefname{sequencei}{Step}{Steps}
+\crefname{page}{page}{pages}
+\Crefname{page}{Page}{Pages}
 \newcommand{\crefrangeconjunction}{--}
 \newcommand{\creflastconjunction}{, and~}
 
-- 
2.17.1


