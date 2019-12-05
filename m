Return-Path: <SRS0=ldQa=Z3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=stAZqa9iFtyURFB8p0+GNTvNNrAMBG3zE8S0IjP2iTw=;
        b=tV0gguynL3DhhjAbqD2AiInJFa0g7ngeT7NCDlgu7m8jFQFdMlKkoCFoHEk0Sz/NDJ
         xbNqBPEZRgYyC47ynMlbpisCMwPBQWOjubxPPNqvPiZ4Gu1wS5QF8r71R9N4Drzr86YU
         b3p9PUpy65MO2O49/Bi2QtJ1MJ/F98m0+ZLApmJiWra7O7rR9++CpuN92/4TS8ftMNhG
         hVRun90fwXFCuE9bftu2SH6lZq7wPYKCtn+XWsbivbbUV5ULzVj1u2+oyiOBczpYk9jr
         E9NsXaP8rZbENT79Ac7dEH360S/JAfoaA+qnE9+s58baAabyaMW+f25nJRTFFdosi/Uz
         FtFA==
Subject: [PATCH 1/3] bib/hw.bib: Use endash for volume range
References: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ef4f504d-84b3-5fa2-44d1-3f1c13aa7236@gmail.com>
Date: Fri, 6 Dec 2019 00:15:38 +0900
MIME-Version: 1.0
In-Reply-To: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 45e5c61493718de6337af0194ed7f6feffd80928 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 4 Dec 2019 19:32:45 +0900
Subject: [PATCH 1/3] bib/hw.bib: Use endash for volume range

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index b8c1af93..51f6714e 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -150,7 +150,7 @@ of Melbourne}"
 
 
 @manual{AMDOpteron02
-,title="AMD x86-64 Architecture Programmer's Manual Volumes 1-5"
+,title="AMD x86-64 Architecture Programmer's Manual Volumes 1--5"
 ,organization="Advanced Micro Devices"
 ,year="2002"
 ,number="24592 rev. 3.07"
-- 
2.17.1


