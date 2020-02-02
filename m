Return-Path: <SRS0=XWF6=3W=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=plNMOuRTf93hnzS5bT4AaK3fwj2uOiDSHrUBWaPDNfk=;
        b=T3EQKXNrh0ja8LdWvpBVwPuZ0umP/FmewgSEiLFxUp5uo8p0XBldmQe1uBmMcHIv/u
         uoWM22B7RKad1sKf4rp6FU40Aazw+1DaSkPuh9w7C3ibSj0daWVFgS31JFCI/Ion9d3m
         PI4qykXgtSB2KsUOY98hsBbimDgfTPnKZQR+X+05AOnX4XWwdia7c8cuk1YOLJFwBLr+
         C/kvO7OEd5RKzftt8dYXV7VbV9ktMeyB3ka+DYr5YRe+/vtrHP12zU72VR+1EYsZtOG3
         94Agr4ckAcloGYAwys5mj4msaRWUXA7DQfdcNrCRw/6+E/HyvsovJ1EjxbOZ/YxJ9r9X
         B3Mw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] FAQ-BUILD: Fix trivial typo
Message-ID: <21d9e8af-cbf7-3d35-63a7-b9f195bd1a4f@gmail.com>
Date: Sun, 2 Feb 2020 20:35:30 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4066e351c2673b626fe8c4e85f9a87f82ebb1842 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Feb 2020 19:24:03 +0900
Subject: [PATCH 1/2] FAQ-BUILD: Fix trivial typo

Fixes: 4c6ee39761a0 ("Remove required version of 'epigraph'")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 4657c4ee..2eca5027 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -264,7 +264,7 @@
 		has resolved the issue. You can upgrade it by following
 		the instructions at #10 above.
 		The Up-to-date package can be downloaded from:
-		http://mirrors.ctan.org/macros/latex/contrib/fvextra.zip
+		http://mirrors.ctan.org/macros/latex/contrib/epigraph.zip
 
 	    NOTE: On Tex Live 2015/Debian (Ubuntu Xenial) and TeX Live 2016,
 		the up-to-date "epigraph" does not work properly along
-- 
2.17.1

