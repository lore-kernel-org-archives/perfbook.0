Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ZXd0xlJZ2ab1DkwM1MsJ1Py+Q3sEAlqVOhiCYdUizxk=;
 b=Gg1ehGWT+yZOaxdrGG776NsIbYnlPVY93j2rHrmBGdTowdIdd1enc5KbYoXJOQPU7o
 Zjoo7Kt+wb6swbDBMyN6j84bo9ex8qz627MTMR6aTncEzqRgdUTHxvN3ASLNk5+mp4Fo
 2XYll4nXvQ/4mXQ2FrLiUSnqOPmDFef4TJB8LdxTOcghimWUlqfSZZWbopYRZ2kECaL4
 wcok7rdsvf54JmIv0JsdJdLBWa7EIOjjNGOQqcKMkfeoXilOsgECQZHL016z3hQr9/2f
 4LQRn9LtqDgc1NCwc3KHlLKFRkUT+1Ab+p/qJikmv56F5pjDmUzoIcUoCTfQE2TAACp/
 V1nQ==
Subject: [PATCH 2/6] formal/spinhint: Fix typo
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <646d2285-946e-8df3-33a6-5fd0b408907a@gmail.com>
Date: Tue, 14 Mar 2017 07:45:35 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 32cf4c216eb3b0c8395ecff9ffa2e53e1e415c89 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:47:29 +0900
Subject: [PATCH 2/6] formal/spinhint: Fix typo

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


