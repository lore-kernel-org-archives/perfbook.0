Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=e9yeXTIDGXo7Xqx/LVdhAbVoo3JVksG3MWsk2bQAytM=;
 b=HJdH+LPIGAnAhYHKfZrlXqTzdnfQU6EDU7qbQZ8WWJBmbUR77yluyGQkg9YXKY2hVV
 gFWv3fN4wBMSurDQ1Fk8uKwW5XCJvaSM5P/8Lcoh/tcp+MwrLDl4kM2QNjknSEX3WhNG
 vUQuTLRtHrU2Du9fM2NpMJK6TmfpK3CXURHFQYm1qSx6SoUT160JaMsZRvn8X3yOwl+x
 APfgyWXmkTOTWtGPguSp9SBWvRIUJvcY6GAkGlTh6yQ3AO6CTzkNKEAZouMEtrrbOeYk
 PQK6kqigK3soD1WXOZbAcqTm6tgGKJ5Mdfrzfeq2whjVzrWlVfEo4pzxJ4s2wot/j8hp
 VgDQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix typo in '*_acquire' example
Message-ID: <6b962183-2529-3786-a55a-8e9729b16ced@gmail.com>
Date: Tue, 12 Sep 2017 00:28:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 469e14bc026a2aedd15284d3fa0ef55827eb7853 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Sep 2017 00:21:45 +0900
Subject: [PATCH] memorder: Fix typo in '*_acquire' example

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 96b598b..c44dfd2 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -519,7 +519,7 @@ conditionally.
 Blank cells indicate that no ordering is supplied.

 The \co{*_acquire} row covers \co{smp_load_acquire()},
-\co{cmpxchg_acquire()}, \co{xchg_release()}, and so on;
+\co{cmpxchg_acquire()}, \co{xchg_acquire()}, and so on;
 the \co{*_release} row covers \co{smp_store_release()},
 \co{cmpxchg_release()}, \co{xchg_release()}, and so on; and
 the ``Successful Non-Relaxed Non-\co{void} RMW'' row covers
-- 
2.7.4

