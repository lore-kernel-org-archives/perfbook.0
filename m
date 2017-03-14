Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=8BOSeG9HlHMDi+/IvL7Nr/ev+TnL0spkIkJpuizddYY=;
 b=R9FvOii2A0G09V7RV6qESWVu4yRkkiIrcIjVpRo77lLK5QnWw7w588AKtontO4jzA8
 Ug6Wso2PzaoSXdltNty1tcL5gjU7qxN2DCn6T/hSEFd4nfQSkuRYXLtXjwwLRsFwbF9h
 5WXcJBcAnghMlyoHaUJrsJ/xCaILKLZAsITU7nUYZwradZZG9gE6jdE/mLTqqXcImZq+
 RP6Gq/XUSLZMyleSxePJrt0oX8THKmYYU89/mIb0OGHmTtw9C7B6PYqX4eWxBLsNHpaa
 +ApnovU2ZVeZ3d5/QLbu5fn7e4LsGH2sVHFKf01aBA1wAtkd9+Vy2seL5Jqxa1JtsLRU
 4jiQ==
Subject: [PATCH v2 2/6] formal/spinhint: Fix typo
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4cb95d9b-1604-fedb-d430-42aebf37b0f0@gmail.com>
Date: Tue, 14 Mar 2017 21:39:54 +0900
MIME-Version: 1.0
In-Reply-To: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 32cf4c216eb3b0c8395ecff9ffa2e53e1e415c89 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:47:29 +0900
Subject: [PATCH v2 2/6] formal/spinhint: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 87a7040..a10b57b 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -854,8 +854,8 @@ latencies of most other RCU implementations.
 \item	There are \co{qrcu_read_lock()} and \co{qrcu_read_unlock()}
 	primitives that delimit QRCU read-side critical sections.
 	The corresponding \co{qrcu_struct} must be passed into
-	these primitives, and the return value from \co{rcu_read_lock()}
-	must be passed to \co{rcu_read_unlock()}.
+	these primitives, and the return value from \co{qrcu_read_lock()}
+	must be passed to \co{qrcu_read_unlock()}.

 	For example:

-- 
2.7.4


