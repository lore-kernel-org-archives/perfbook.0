Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=gRKFwSK6KlwRci9iGY38YcgPPK42+859H7i+xizD4sg=;
 b=Z7mhFukPARt+Hy74dZLoM4INGvRyrLzBhU30jNqY1kPTUFyR3eJiYbH5LmKjQ7vhL3
 3I9/qcmD23fUsVY9QlDdz/i3iwKGgFdlv2FG8gxs3MHN2ZfBlkPiXXP+JqFdO9M1hbsW
 ++NwLsHIIv6giHl2sX+/UFULbeTcRmT4WuD1wfjh0VX6V/7OJPPw6C8h2VMxvYIVQNPR
 JgeqrZaEg8CIioeUueDlntsILMEsMyxsRWSo36lXFEFCDSN9Pah0JFmdJ+SwPp/AwxHK
 rfFTCkNKAlSdvKm8M78U72F55M8/w0zxjqj3e0Y47IJtL0cuF2SpBANBp3bDej3vTHcW
 5dZg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Use consistent names of WRC litmus tests
Message-ID: <4bb0abd4-6f24-f5d0-bc2b-4019d19b4006@gmail.com>
Date: Wed, 20 Sep 2017 07:17:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6c728887ced50a760683df02da552a069dd51ead Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 20 Sep 2017 07:05:32 +0900
Subject: [PATCH] memorder: Use consistent names of WRC litmus tests

Also update path names of litmus tests.

Fixes: 3162ff468ef4 ("memorder: Substitute WRC for WWC to illustrate non-MCA")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus   | 33 ++++++++++++++++++++++
 CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus    |  2 +-
 .../advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus   | 33 ----------------------
 memorder/memorder.tex                              |  8 +++---
 4 files changed, 38 insertions(+), 38 deletions(-)
 create mode 100644 CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
 delete mode 100644 CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus

diff --git a/CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus b/CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
new file mode 100644
index 0000000..602e800
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
@@ -0,0 +1,33 @@
+C C-WRC+o+o-data-o+o-rmb-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x)
+{
+	WRITE_ONCE(*x, 1);
+}
+
+P1(int *x, int* y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	WRITE_ONCE(*y, r1);
+}
+
+P2(int *x, int* y)
+{
+	int r2;
+	int r3;
+
+	r2 = READ_ONCE(*y);
+	smp_rmb();
+	r3 = READ_ONCE(*x);
+}
+
+exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
diff --git a/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus b/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus
index 5585f5e..6d55ead 100644
--- a/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus
+++ b/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus
@@ -1,4 +1,4 @@
-C C-WRC+o+o-r+a-o.litmus
+C C-WRC+o+o-r+a-o

 {
 }
diff --git a/CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus b/CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus
deleted file mode 100644
index 5d9f200..0000000
--- a/CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus
+++ /dev/null
@@ -1,33 +0,0 @@
-C C-WRC-o+o-data-o+o-rmb-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x)
-{
-	WRITE_ONCE(*x, 1);
-}
-
-P1(int *x, int* y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	WRITE_ONCE(*y, r1);
-}
-
-P2(int *x, int* y)
-{
-	int r2;
-	int r3;
-
-	r2 = READ_ONCE(*y);
-	smp_rmb();
-	r3 = READ_ONCE(*x);
-}
-
-exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5df5649..316bab7 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1847,7 +1847,7 @@ does need to deal with them.
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
-C C-WRC-o+o-data-o+o-rmb-o
+C C-WRC+o+o-data-o+o-rmb-o

 {
 }
@@ -1885,7 +1885,7 @@ exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
 \end{listing}

 Listing~\ref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}
-(\path{C-WWC+o+o-data-o+o-addr-o.litmus})
+(\path{C-WRC+o+o-data-o+o-rmb-o.litmus})
 demonstrates multicopy atomicity, that is, on a multicopy-atomic platform,
 the \co{exists} clause on line~29 cannot trigger.
 In contrast, on a non-multicopy-atomic
@@ -2093,7 +2093,7 @@ same variable.
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
-C C-WRC+o+o-r+a-o.litmus
+C C-WRC+o+o-r+a-o

 {
 }
@@ -2137,7 +2137,7 @@ However, as indicated by the ``C'' in their ``C'' column,
 release operations do provide cumulativity.
 Therefore,
 Listing~\ref{lst:memorder:WRC Litmus Test With Release}
-(\path{C-WWC+o+o-r+o-addr-o.litmus})
+(\path{C-WRC+o+o-r+a-o.litmus})
 substitutes a release operation for
 Listing~\ref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}'s
 data dependency.
-- 
2.7.4

