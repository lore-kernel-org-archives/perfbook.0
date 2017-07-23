Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q/w5sV5XDB/vbvRxPnp3KRekEgf9VmnnIwaCqrqOtmQ=;
 b=K1mn3HmSX+VuNBNI6JYx8WYFvP0CyXmf1/giIXHH0IPwTpwN01oRhKko9+qW0uMFGX
 TUcCKcCVru0nPhT2uL24yhFnWTpoJrcHt4w5rA7wwBD+21ClTGDOyTwo+uB7S4FTKw3K
 n0CuNvyi3My2fo+8e/zcrXddDbz+ziLPt/bXiO1lOqKDVgbIXnrjZHjchY0KuJWfPAty
 EBq/Wb6N+PMGYm7Ky29jv4WAvPfaxBr4mP/YX4Yst7ixxpYO7140uEghiQ3yF/t6Dy0n
 6YZLHLD4Da52b4zTcqyeIJ9I6tD94y4T4oZLpxa37brDsv0rvIPIeFIVekYI7umnIJHC
 Ntyw==
Subject: [PATCH v2] advsync: Add litmus tests of control dependency
References: <491b2704-0d61-aebc-0787-94cd0da74694@gmail.com>
 <20170719174450.GI3730@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <89bbe5d8-39e1-1019-bfc8-175a71d1005c@gmail.com>
Date: Sun, 23 Jul 2017 13:16:39 +0900
MIME-Version: 1.0
In-Reply-To: <20170719174450.GI3730@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4b73c3ec0a875ac5f1bc58afa1a5db49014b4ad3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Jul 2017 09:11:03 +0900
Subject: [PATCH v2] advsync: Add litmus tests of control dependency

C-LB+o-cgt-o+o-cgt-o and C-WWC+o-cgt-o+o-cgt-o+o correspond to
2-CPU and 3-CPU examples found in the discussion of lack of
transitivity in control dependency.

The 2-CPU example (with ">" in the "if" statements) behaves
differently from other LB (Load Buffering) litmus tests.
To get the expected behavior of an LB litmus test, we need to use
the ">=" operator (C-LB+o-cge-o+o-cge-o).
However, the "if" statements in this test are always true.
Optimizing compilers can prove it fairly easily from
the initial values and assigned-to values of "x" and "y" (0 and 1).

To prevent the "if" statements from being optimized out,
C-LB+o-cge-o+o-cge-o+dstb adds another thread which has
never-executed assignments of -1 to "x" and "y".

C-WWC+o-cge-o+o-cge-o+o is a ">=" version of 3-CPU example.
C-WWC+o-cge-o+o-cge-o+o+dstb has the extra thread mentioned above.

On PPC, C-WWC+o-cge-o+o-cge-o+o+dstb sometimes demonstrates
the lack of transitivity.

In the hope we can see the same with the ">" version,
C-WWC+o-cgt-o+o-cgt-o+o-dstb has the same extra thread.

And on PPC, it does occasionally show the lack of transitivity
while C-WWC+o-cgt-o+o-cgt-o+o does not.

Examples of litmus7 results on PPC demonstrating the lack of
transitivity:

-----------
Test C-WWC+o-cge-o+o-cge-o+o+dstb Allowed
Histogram (10 states)
848181:>0:r1=0; 1:r2=0; x=1;
15701449:>0:r1=1; 1:r2=0; x=1;
7523103:>0:r1=2; 1:r2=0; x=1;
20215797:>0:r1=0; 1:r2=1; x=1;
11079459:>0:r1=2; 1:r2=1; x=1;
4122418:>0:r1=0; 1:r2=0; x=2;
14473329:>0:r1=1; 1:r2=0; x=2;
15258139:>0:r1=2; 1:r2=0; x=2;
10778124:>0:r1=0; 1:r2=1; x=2;
1     *>0:r1=2; 1:r2=1; x=2;
Ok

Witnesses
Positive: 1, Negative: 99999999
Condition exists (0:r1=2 /\ 1:r2=1 /\ x=2) is validated
Hash=08acbed570bea87fa17496409e3b6fb4
Observation C-WWC+o-cge-o+o-cge-o+o+dstb Sometimes 1 99999999
Time C-WWC+o-cge-o+o-cge-o+o+dstb 98.11
-----------
Test C-WWC+o-cgt-o+o-cgt-o+o+dstb Allowed
Histogram (4 states)
10507061:>0:r1=2; 1:r2=1; x=1;
50351171:>0:r1=0; 1:r2=0; x=2;
39141767:>0:r1=2; 1:r2=0; x=2;
1     *>0:r1=2; 1:r2=1; x=2;
Ok

Witnesses
Positive: 1, Negative: 99999999
Condition exists (0:r1=2 /\ 1:r2=1 /\ x=2) is validated
Hash=a23a617c655d9e373993764f59634ed9
Observation C-WWC+o-cgt-o+o-cgt-o+o+dstb Sometimes 1 99999999
Time C-WWC+o-cgt-o+o-cgt-o+o+dstb 94.83
-----------

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v1 (RFC) -> v2:
 o Add ">" versions of test as C-LB+o-cgt-o+o-cgt-o.litmus and
   C-WWC+o-cgt-o+o-cgt-o+o.litmus.
 o Rename ">=" versions of test C-LB+o-cge-o+o-cge-o.litmus and
   C-WWC+o-cge-o+o-cge-o+o.litmus.
 o Add ">=" tests with an extra thread to make it hard for compilers
   to optimize out "if" statements (C-LB+o-cge-o+o-cge-o+dstb and
   C-WWC+o-cge-o+o-cge-o+o+dstb).
 o Add ">" version of WWC test with the same extra thread
   (C-WWC+o-cgt-o+o-cgt-o+o+dstb). In this case it is not necessary
   to restrict optimizations, but it increases the probability
   the lack of transitivity is demonstrated.
--
 .../advsync/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus  | 41 +++++++++++++++++++
 .../advsync/herd/C-LB+o-cge-o+o-cge-o.litmus       | 27 +++++++++++++
 .../advsync/herd/C-LB+o-cgt-o+o-cgt-o.litmus       | 27 +++++++++++++
 .../herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus       | 46 ++++++++++++++++++++++
 .../advsync/herd/C-WWC+o-cge-o+o-cge-o+o.litmus    | 32 +++++++++++++++
 .../herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus       | 46 ++++++++++++++++++++++
 .../advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus    | 32 +++++++++++++++
 7 files changed, 251 insertions(+)
 create mode 100644 CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus
 create mode 100644 CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o.litmus
 create mode 100644 CodeSamples/advsync/herd/C-LB+o-cgt-o+o-cgt-o.litmus
 create mode 100644 CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
 create mode 100644 CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o.litmus
 create mode 100644 CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
 create mode 100644 CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus

diff --git a/CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus b/CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus
new file mode 100644
index 0000000..e97b879
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus
@@ -0,0 +1,41 @@
+C C-LB+o-cge-o+o-cge-o+dstb
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 >= 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 >= 0)
+		WRITE_ONCE(*x, 1);
+}
+
+/* P2 is to disturb compiler optimization */
+P2(int *x, int *y)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*x);
+	r4 = READ_ONCE(*y);
+	if (r3 < 0)
+		WRITE_ONCE(*y, -1);
+	if (r4 < 0)
+		WRITE_ONCE(*x, -1);
+}
+
+exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o.litmus b/CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o.litmus
new file mode 100644
index 0000000..14539b9
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-LB+o-cge-o+o-cge-o.litmus
@@ -0,0 +1,27 @@
+C C-LB+o-cge-o+o-cge-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 >= 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 >= 0)
+		WRITE_ONCE(*x, 1);
+}
+
+exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/advsync/herd/C-LB+o-cgt-o+o-cgt-o.litmus b/CodeSamples/advsync/herd/C-LB+o-cgt-o+o-cgt-o.litmus
new file mode 100644
index 0000000..d442f76
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-LB+o-cgt-o+o-cgt-o.litmus
@@ -0,0 +1,27 @@
+C C-LB+o-cgt-o+o-cgt-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 > 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 > 0)
+		WRITE_ONCE(*x, 1);
+}
+
+exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus b/CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
new file mode 100644
index 0000000..015bcd0
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
@@ -0,0 +1,46 @@
+C C-WWC+o-cge-o+o-cge-o+o+dstb
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 >= 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 >= 0)
+		WRITE_ONCE(*x, 1);
+}
+
+P2(int *x)
+{
+	WRITE_ONCE(*x, 2);
+}
+
+/* P3 is to disturb compiler optimization */
+P3(int *x, int *y)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*x);
+	r4 = READ_ONCE(*y);
+	if (r3 < 0)
+		WRITE_ONCE(*y, -1);
+	if (r4 < 0)
+		WRITE_ONCE(*x, -1);
+}
+
+exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o.litmus b/CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o.litmus
new file mode 100644
index 0000000..3fcd502
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-WWC+o-cge-o+o-cge-o+o.litmus
@@ -0,0 +1,32 @@
+C C-WWC+o-cge-o+o-cge-o+o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 >= 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 >= 0)
+		WRITE_ONCE(*x, 1);
+}
+
+P2(int *x)
+{
+	WRITE_ONCE(*x, 2);
+}
+
+exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus b/CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
new file mode 100644
index 0000000..989d99f
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
@@ -0,0 +1,46 @@
+C C-WWC+o-cgt-o+o-cgt-o+o+dstb
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 > 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 > 0)
+		WRITE_ONCE(*x, 1);
+}
+
+P2(int *x)
+{
+	WRITE_ONCE(*x, 2);
+}
+
+/* P3 is to disturb compiler optimization */
+P3(int *x, int *y)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*x);
+	r4 = READ_ONCE(*y);
+	if (r3 < 0)
+		WRITE_ONCE(*y, -1);
+	if (r4 < 0)
+		WRITE_ONCE(*x, -1);
+}
+
+exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus b/CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus
new file mode 100644
index 0000000..bfe5449
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus
@@ -0,0 +1,32 @@
+C C-WWC+o-cgt-o+o-cgt-o+o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 > 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 > 0)
+		WRITE_ONCE(*x, 1);
+}
+
+P2(int *x)
+{
+	WRITE_ONCE(*x, 2);
+}
+
+exists (0:r1=2 /\ 1:r2=1 /\ x=2)
-- 
2.7.4


