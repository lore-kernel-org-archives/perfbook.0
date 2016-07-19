Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=O208DjrfNMD9vh60NYlmMkoiNf9dG5V3PNAOCWU6tUk=;
 b=wIJ7XMU5RV+kzKHdNNaDmFZVBsJdCgfJ/Ipg484fLVqdSaCUYMyRXZKYHru2LE+UyT
 Ay0AdtYwfrH6cNDdRd0zW7DOJuiMHokC9deM7SnQ61wuIQwc2Md0rAK1kwRUDA9ZgpQu
 egcxgf7EZHftITmvXMG6chiFqm87kEKpKVK3AxXnT3X23avfB5FGLXj1oo7j9CwfBoP2
 sPARM3MI6MJCAQCSHyNmejJVdHNbn9Z8kR9XLbL557F0/aQk7XG7nzCKwz58u8PBF5h2
 BXKJJlr8UAGNnv0eTVZGHwhx3ePmUIxrIVGyJfrEJkz7ckWHcg9ehRn3Hqlz0mbFR/vg
 d1pA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal: Trivial typo fixes
Message-ID: <ee5270b0-78c0-ae91-6a93-336968af2589@gmail.com>
Date: Tue, 19 Jul 2016 23:42:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aefb442330115d2af25f532fcd725ed4c06e6908 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 19 Jul 2016 23:30:18 +0900
Subject: [PATCH] formal: Trivial typo fixes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/formal.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/formal.tex b/formal/formal.tex
index 0e5fef3..ed9d7a3 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -126,7 +126,7 @@ The larger overarching software construct is of course validated by testing.
 	because the rate of change is just too great.
 	Furthermore, although the L4 microkernel is a large software
 	artifact from the viewpoint of formal verification, it is tiny
-	compared to the a great number of projects, including LLVM,
+	compared to a great number of projects, including LLVM,
 	gcc, the Linux kernel, Hadoop, MongoDB, and a great many others.

 	Although formal verification is finally starting to show some
@@ -171,4 +171,4 @@ All else being equal, a simpler implementation is much better than
 a mechanical proof for a complex implementation!

 And the open challenge to those working on formal verification techniques
-and systems is prove this summary wrong!
+and systems is to prove this summary wrong!
-- 
1.9.1

