Return-Path: <SRS0=caq+=35=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9yWWTW/yqTRgMJTaXyAgUUu0sYPxN0tmZZw5oiECyh4=;
        b=n7l1+7WFFwhWyiUBP4NwsbXlAM3G2sHpxDC057Do/JxmolVk/HFit93fhwqELYXeyO
         uSQVyNsaipHS/+Fxg+JIm83aQGrrmyF8tuQTboDt/+qTLF4tFd/g0RHG/TEiRN8AsNh+
         C4gqrH7OKNf9imvw7Gc/s/kDZaq41B9pT7RurTIV/tJ5mg0j6WOMdhR/LGXkoHlytl1W
         EM/nOPGf451Cm8bXkPSLu5fZDsHguIV4TnxP9GKCy55lv9LIBI+2UDt/LQxW8D2Msb3P
         AwQCggv0Z23mtUht/Mz1hy7dKv4/RO4PJQRTlCVpTnS3bguM0Qu+o0UL0ySPDt0Hrlwz
         rfgQ==
Subject: [PATCH 2/2] utilities/toarxiv: Copy up-to-date 'fvextra and
 'epigraph'
References: <3cd61bd0-40a0-bb56-57aa-95422018e628@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b98f9e1c-88c1-2eee-aa26-900fa60064b5@gmail.com>
Date: Sun, 9 Feb 2020 13:11:48 +0900
MIME-Version: 1.0
In-Reply-To: <3cd61bd0-40a0-bb56-57aa-95422018e628@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d42192f39128f32b145eed4de36002457b8ed085 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 9 Feb 2020 07:39:16 +0900
Subject: [PATCH 2/2] utilities/toarxiv: Copy up-to-date 'fvextra and 'epigraph'

The version of arxiv's TeX Live is 2016 at the moment.
As we depend on "fvextra" and up-to-date "epigraph" now, we need to
copy their .sty files into the bundle to upload.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

As I can't test the behavior of arxiv's build system,
I'm not sure this patch actually works as expected.

I'd like you to test the resulting bundle on arxiv.

        Thanks, Akira
--
 utilities/toarxiv.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utilities/toarxiv.sh b/utilities/toarxiv.sh
index 5e1c6388..f126eb5f 100644
--- a/utilities/toarxiv.sh
+++ b/utilities/toarxiv.sh
@@ -54,6 +54,8 @@ find */ -type d -print |
 	sh
 
 cp autodate.tex glossary.tex origpub.tex contrib.tex legal.tex qqz.tex origpub.sty qqz.sty pfbook.cls pfhyphex.tex perfbook.bbl ${destdir}
+cp `kpsewhich fvextra.sty` ${destdir}
+cp `kpsewhich epigraph.sty` ${destdir}
 
 find */ '(' -name '*.pdf' -o -name '*.lst' ')' -exec cp {} ${destdir}/{} \;
 
-- 
2.17.1


