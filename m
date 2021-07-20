Return-Path: <SRS0=ftAS=MM=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xFoRNQLVfhNw+Lmst0ihxkvRfP2nluy1Pz+jL9ThcHk=;
        b=btYEB8k2FcRBlbdI5ZRVgKzQvnmkwxZr5FNSULoDPGliNtDxPRxc2NLC41YmBscKjc
         2PK+XU6j7+k6MAR5sQcqspEpbsC0xzz9bTd36w3lc7vi3Z6SL587KyXpt+OJdBWS2wIn
         IT76olf8CIT5dLfp+XX5rIrxj8GkxSGlfn/kUFViwY8U3EF6+zMypQsc46J0WtCrZfH5
         j24I7yn6jC9idQb5LAmoyioiNPjgqVYNrU2Al4Hm9TO1W8hCv380Wkb6btRuJCDRVJUM
         9wTlJW0a+dVMSiQa1whjwyuhhawBjh0mm4U/LZ56GHfBZfwCRQiiO+yfX6x+aasa1g24
         yHmg==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] defer: remove superfluous preposition
Date: Tue, 20 Jul 2021 15:17:25 +0800
Message-Id: <1626765445-5916-1-git-send-email-zhouzhouyi@gmail.com>
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul
 I think preposition 'on' here is superfluous, correct me if I am wrong.
Best Wishes
Zhouyi

---
 defer/rcufundamental.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 66f9b70..62f31d0 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -332,7 +332,7 @@ greater detail in \cref{sec:memorder:RCU}.
 	It might seem strange to have RCU read-side critical sections
 	containing writes, but RCU is just fine with this.
 	This capability is used frequently in the Linux kernel, for
-	example, acquiring a lock on or reference to a data structure.
+	example, acquiring a lock or reference to a data structure.
 	Acquiring either a lock or a reference results in a write
 	to memory, and it is OK to do these within an RCU read-side
 	critical section.
-- 
2.5.0

