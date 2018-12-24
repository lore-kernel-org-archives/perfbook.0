Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ga/lUcxz6ZsrOVagfybqZQf0KZzTrV6DljnHFSUV18c=;
        b=aih7GKMzIe7zUvubENkoOMLpdMABcLF4zluImGi58Ry7GQtiCt04DkSqWx5zo5FIM9
         wFK1EGEWenQulw3pWlo/UdSuKSurufmjsomE4kIxX1Yey75Kjmy5ABRZ5Q0JS283caan
         1CVk/dEdt6Rqa1fnS47YK8phN2bMNnitvfeerFHIXo7rC2JhTYLQ6beEY2tF3xPDsFwC
         R4MvaitjzkxRyc47SDjgktB2+9+g1WJWXzsfSKCuN8+YkRxr5z8ChxF1UhHd29sW34O/
         ReVr9ytMsJWOsR7sLDY4oNGgY9JQf9DWdps8d+FTlr8qicrVYm1WYoXOJmTOXMlb4YNf
         mk4A==
Subject: [PATCH 11/11] datastruct: Tweak hyphenation
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bb453b65-e6ca-eefc-02a7-246eafc34518@gmail.com>
Date: Tue, 25 Dec 2018 00:05:48 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2d807fdaa140d87199167b78bb53e805cae5eb94 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 24 Dec 2018 20:02:14 +0900
Subject: [PATCH 11/11] datastruct: Tweak hyphenation

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 pfhyphex.tex              | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index f75b42b..f8add0b 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1031,7 +1031,7 @@ with a resize operation.
 
 Read-side concurrency control is provided by RCU as was shown in
 Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control},
-but the update-side concurrency-control functions
+but the update-side concurrency\-/control functions
 \co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()}
 must now deal with the possibility of a
 concurrent resize operation as shown in
diff --git a/pfhyphex.tex b/pfhyphex.tex
index fbcae67..1f319d4 100644
--- a/pfhyphex.tex
+++ b/pfhyphex.tex
@@ -3,4 +3,5 @@
   COPART
   GPGPU
   GPGPUs
+  Schr\"o-din-ger
 }
-- 
2.7.4


