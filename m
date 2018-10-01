Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Bw3ZrNMEvHTpC892xhAoK8+JQr/SXHwXG5K2XbTJX4=;
        b=XSoyHbYbff+e3haNv9JMWEghDX303575df0DC2GkyT8Tu32dhK05iJ+7eXoRcD58ec
         /Vk8bMBhyYxXW51v0e6fjPJW8OuvF3Kc7cjAHfKbchLQmPl8LOo6zWd6DZb9KFXekjlt
         l570/E+rH3V8lBE8Rs/9kibhgxKZUpOKVdha+Ixf86UXO/ZTG57YRimJwR+bRVOm1P4R
         eJOPZhBvSJs8M0XnYaPKsqiRqWYx3A8PBeXrhcnq9Ft0q6kJ6+YZkavINqZoAAqjdAld
         bSIM0MWtQcxoIWLNWSyIjFMB7nXuZyyATsrfuCdccdm50a8H/YLx+1Cn8Ft9S/9du0ie
         77zw==
Subject: [PATCH 2/5] FAQ-BUILD.txt: Fix typo
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9b242798-23ca-815d-3b99-887bfa658776@gmail.com>
Date: Mon, 1 Oct 2018 22:51:24 +0900
MIME-Version: 1.0
In-Reply-To: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dcfafce655608d035b5ebee05d0c0d52ea9cfd75 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 29 Sep 2018 23:41:41 +0900
Subject: [PATCH 2/5] FAQ-BUILD.txt: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 336ab71..012a1d6 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -87,7 +87,7 @@
 
 	A.	Please see #5 above.
 
-7.	Building perfbook aborts with error "Your need to update a2ping".
+7.	Building perfbook aborts with error "You need to update a2ping".
 	What can I do?
 
 	A.	a2ping 2.77p has become incompatible with up-to-date
-- 
2.7.4


