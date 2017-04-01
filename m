Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=QyjLqR67808+FasPEe+oGdO1HZ1MHMNqCYdG5r1mgFA=;
 b=tKQqHBbe0IBSigp+ZA4NzlXsYl/k8r9WyPkmTlVq6gXVwrLSLSmhtCNk1CPiiFHevw
 Kh4YcaAS+e4WmMh+iw6DNelpPYsU/zrL5ef+yxNHxKcEy04vWtxOmDfGIbFT7wugRBTO
 HdfM2EfbOErVvR4mYw8rf/vkvBBj3LmY8YF9xocVYAqdQD+ccC+bxzX1aoFy40BcCUhJ
 83JDBTDHZFLIN7UKhkceaqo2/zrUC7Nh3UkmTZ9fKKLxk3OZlwTZd9a6tC+zqrKrcV+7
 ODllj6zrsl7rHBijKww33DT9lsjsx7lMyvGHZZqslkpwJ2gPxJtW5CkYWjp6ocLQcnIN
 xFXQ==
Subject: [RFC PATCH 10/12] advsync: Fix line number called out
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <945cdd92-767a-2515-cb07-671760c9eb23@gmail.com>
Date: Sat, 1 Apr 2017 11:22:01 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8eed2299c472dff87047577d847de98b0ac0ba67 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 17:19:07 +0900
Subject: [RFC PATCH 10/12] advsync: Fix line number called out

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 942c430..99593a6 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -250,7 +250,7 @@ synchronized among all CPUs (not available from all CPU architectures,
 unfortunately!), and the loop from lines~3-8 records the length of
 time that the variable retains the value that this CPU assigned to it.
 Of course, one of the CPUs will ``win'', and would thus never exit
-the loop if not for the check on lines~6-8.
+the loop if not for the check on lines~6-7.

 \QuickQuiz{}
 	What assumption is the code fragment
-- 
2.7.4


