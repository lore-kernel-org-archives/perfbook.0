Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1Uipsi0fneejtWnPiN0pzaBMK15w914UydB21u1piHU=;
 b=vBDyu+jLrkXvl2MVQHLUmo3Sw7ipg7Wk4lxHH+0pYZbFyAxUFHvBe6q/j3Epi4Pluz
 PBv95gln5+lQO36Y3BghOWvg9yR/uT1ljfQwIk3TCjanWPC9TKimFiIGuyYsfPbT/cMb
 wevClvlAgDZKE8+5HuH/ZyCLr7OSf+wMunV9eOG0qi6PUPfP+66PH8325XCQgOddnLuy
 4jLvJnc5dkOTzbRNI05w7vWZ8OiEJSBSLsFWCiFVwxZEbLawLrSYPP6UtnG/rTXIbybJ
 K1JsyQwtl2815zyRPDj+NMF45wjj01+o1QUH7xTyLFBLNXmV4wBw5Y5wlalOPp9A4n21
 2pIg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Fix litmus tests
Message-ID: <2f1687fb-136e-88e8-e678-9066be8b0448@gmail.com>
Date: Sat, 26 Aug 2017 09:07:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 65f40cf041aa5506e62c25e4ab9fd63d1d34fdd7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Aug 2017 08:48:01 +0900
Subject: [PATCH] advsync: Fix litmus tests

Adjust litmus-test syntax to be accepted by litmus7.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is my attempt to make litmus7 happy.
herd7 says:

--
$ herd7 -conf strong.cfg C-WWC+o+o-data-o+o-addr-o.litmus 
Test C-WWC+o+o-data-o+o-addr-o Allowed
States 5
1:r1=x; 2:r2=u; x=x;
1:r1=x; 2:r2=x; x=a;
1:r1=x; 2:r2=x; x=x;
1:r1=z; 2:r2=u; x=x;
1:r1=z; 2:r2=z; x=x;
Ok
Witnesses
Positive: 1 Negative: 4
Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
Observation C-WWC+o+o-data-o+o-addr-o Sometimes 1 4
Hash=262fd275af47e8ed4fba69491478bb7d
--

and

--
$ herd7 -conf strong.cfg C-WWC+o+o-r+o-addr-o.litmus 
Test C-WWC+o+o-r-o+o-addr-o Allowed
States 4
1:r1=x; 2:r2=u; x=x;
1:r1=x; 2:r2=x; x=a;
1:r1=z; 2:r2=u; x=x;
1:r1=z; 2:r2=z; x=x;
No
Witnesses
Positive: 0 Negative: 4
Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
Observation C-WWC+o+o-r-o+o-addr-o Never 0 4
Hash=607040ae8eb633fee308b55be24729e1
--

Do these look reasonable?

     Thanks, Akira
--
 .../advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus  | 22 ++++++++++---
 .../advsync/herd/C-WWC+o+o-r+o-addr-o.litmus       | 24 ++++++++++----
 advsync/memorybarriers.tex                         | 38 +++++++++++++++-------
 3 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus
index e49712f..3e51168 100644
--- a/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus
+++ b/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus
@@ -1,23 +1,35 @@
 C C-WWC+o+o-data-o+o-addr-o

 {
-x=z;
-b=a;
+int z = 0;
+int *x = &z;
+int u = 0;
+int *y = &u;
+int b = 0;
+int *a = &b;
 }

-void P0(int **x)
+{
+#include "api.h"
+}
+
+P0(int **x)
 {
 	WRITE_ONCE(*x, x);
 }

-void P1(int **x, int **y)
+P1(int **x, int **y)
 {
+	int *r1;
+
 	r1 = READ_ONCE(*x);
 	WRITE_ONCE(*y, r1);
 }

-void P2(int **x, int **y)
+P2(int **y, int **a)
 {
+	int *r2;
+
 	r2 = READ_ONCE(*y);
 	WRITE_ONCE(*r2, a);
 }
diff --git a/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus
index 5439868..7f47f7a 100644
--- a/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus
+++ b/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus
@@ -1,23 +1,35 @@
-C C-WWC+o+o-data-o+o-addr-o
+C C-WWC+o+o-r-o+o-addr-o

 {
-x=z;
-b=a;
+int z = 0;
+int *x = &z;
+int u = 0;
+int *y = &u;
+int b = 0;
+int *a = &b;
 }

-void P0(int **x)
+{
+#include "api.h"
+}
+
+P0(int **x)
 {
 	WRITE_ONCE(*x, x);
 }

-void P1(int **x, int **y)
+P1(int **x, int **y)
 {
+	int *r1;
+
 	r1 = READ_ONCE(*x);
 	smp_store_release(y, r1);
 }

-void P2(int **x, int **y)
+P2(int **y, int **a)
 {
+	int *r2;
+
 	r2 = READ_ONCE(*y);
 	WRITE_ONCE(*r2, a);
 }
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index fbcd22a..51236c8 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1311,23 +1311,31 @@ does need to deal with them.
 C C-WWC+o+o-data-o+o-addr-o

 {
-x=z;
-b=a;
+int z = 0;
+int *x = &z;
+int u = 0;
+int *y = &u;
+int b = 0;
+int *a = &b;
 }

-void P0(int **x)
+P0(int **x)
 {
   WRITE_ONCE(*x, x);
 }

-void P1(int **x, int **y)
+P1(int **x, int **y)
 {
+  int *r1;
+
   r1 = READ_ONCE(*x);
   WRITE_ONCE(*y, r1);
 }

-void P2(int **x, int **y)
+P2(int **y, int **a)
 {
+  int *r2;
+
   r2 = READ_ONCE(*y);
   WRITE_ONCE(*r2, a);
 }
@@ -1344,26 +1352,34 @@ exists(1:r1=x /\ 2:r2=x /\ x=x)
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
-C C-WWC+o+o-data-o+o-addr-o
+C C-WWC+o+o-r-o+o-addr-o

 {
-x=z;
-b=a;
+int z = 0;
+int *x = &z;
+int u = 0;
+int *y = &u;
+int b = 0;
+int *a = &b;
 }

-void P0(int **x)
+P0(int **x)
 {
   WRITE_ONCE(*x, x);
 }

-void P1(int **x, int **y)
+P1(int **x, int **y)
 {
+  int *r1;
+
   r1 = READ_ONCE(*x);
   smp_store_release(y, r1);
 }

-void P2(int **x, int **y)
+P2(int **y, int **a)
 {
+  int *r2;
+
   r2 = READ_ONCE(*y);
   WRITE_ONCE(*r2, a);
 }
-- 
2.7.4

