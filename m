Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLDA02Je2GV73aPKSncaAV0cazMshuMQQuabUMrIZZU=;
        b=G8gsbOOHjabxepJDaVFnVyTieveV6P3LMcSF+M7uyeErRxKGAH9NKcsJzfu6+DOM8E
         GgKYGI/licfDAbcNn/V5vsMOPWggdVHHiaGQGekzIdTW25bU2FKUMn7PVAaXzO5wrct7
         Ojjmk4SghCitjGoKOrxf6Ad7YbiGHnUE5HQBrjxx9cvdobAde8+CqyMddffX24n0zaGz
         bYe/AFLaAnTv4eQbW0r2/zKcapKYnrhG2G+erm1z6g3z5JPwn+RcvwBgclcQ5ctUf+jA
         giVX08X02cu6N0A1afceOuCTjGrGwpJ5gEhNwLAmRI2xgOiArJhohShfhL+9yVE71xYX
         IrnQ==
Subject: [PATCH 2/4] defer/hazptr: Fix trivial typo
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7418cc81-5bef-389c-72e6-8fadda8669e5@gmail.com>
Date: Sun, 21 Apr 2019 19:07:46 +0900
MIME-Version: 1.0
In-Reply-To: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 38be90e94c8ee91c54c6312ece01c9e0a89e2c1c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 21 Apr 2019 18:15:51 +0900
Subject: [PATCH 2/4] defer/hazptr: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/hazptr.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 84fd15bc..4b61d34d 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -80,7 +80,7 @@ If the value of the original pointer has not changed, then the hazard
 pointer protects the pointed-to object, and in that case,
 line~\lnref{htr:success} returns a pointer to that object, which also
 indicates success to the caller.
-Otherwise, if the pointer changed between the to \co{READ_ONCE()}
+Otherwise, if the pointer changed between the two \co{READ_ONCE()}
 invocations, line~\lnref{htr:race2} indicates failure.
 
 \QuickQuiz{}
-- 
2.17.1


