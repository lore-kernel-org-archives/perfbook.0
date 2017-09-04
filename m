Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=vIfpqpCjvv6BffF8EfC7VVbRu2wC+BZuTprDhU9shH0=;
 b=pyEqbuW7VGNxv+zlWAT9Q6nQpFdCHdLThNDHv3H2BrvW3Dg6y+AWZxRcLAH+1AV1Bt
 JNtB+uGBOE/Yux20zwS2D7NDjOG0Pmtdw3iulHBk9Yp+wfBF/OOj2oA8ZjGsBeExqxd1
 /g2m01gr2dQQSRf4HdMgUbzChUfM7ZRbovjq0/kfS3ZlRZO9wOCZYgsjggr3VAeGq+Pm
 co+qHWDkipyLDrP2+553JKEZObDN2QthDM68h+1njRKjVn4hF3+d3DNufNZCGCFyZkAR
 tEoZgvLTBltYwSbVP0bGwb2IPKDtFsExCt5UmC7kMSnUdcCHR68SGECT/rVHS5Rs8L23
 ShSA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Silence compiler warnings in litmus tests
Message-ID: <937d7bee-b3dd-831a-98a5-c0dcab3996b3@gmail.com>
Date: Tue, 5 Sep 2017 00:05:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 410b1edcf1255563371b9b9bc8b54f10b3125090 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 4 Sep 2017 23:35:06 +0900
Subject: [PATCH] memorder: Silence compiler warnings in litmus tests

Silence warnings from gcc:

    C-MP+o-r+o-ctrl-o.c:
        warning: 'r3' may be used uninitialized in this function
        [-Wmaybe-uninitialized]
    C-W+RWC+o-mb-o+a-o+o-mb-o.c, C-W+RWC+o-r+a-o+o-mb-o.c:
        warning: assignment makes pointer from integer without a cast
        [-Wint-conversion]
    C-W+RWC+o-mb-o+a-o+o-mb-o.c, C-W+RWC+o-r+a-o+o-mb-o.c:
        warning: cast from pointer to integer of different size
        [-Wpointer-to-int-cast]

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus         |  2 +-
 CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus |  6 +++---
 CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus    |  6 +++---
 memorder/memorder.tex                                     | 14 +++++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus b/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
index fe44072..82cf629 100644
--- a/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
+++ b/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
@@ -16,7 +16,7 @@ P0(int* x0, int* x1) {

 P1(int* x0, int* x1) {
 	int r2;
-	int r3;
+	int r3 = 0;

 	r2 = READ_ONCE(*x1);
 	if (r2 >= 0)
diff --git a/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus b/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
index 1e0f1b7..23050e6 100644
--- a/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
+++ b/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
@@ -19,8 +19,8 @@ P0(int *x, int *y)

 P1(int *y, int *z)
 {
-	int *r1;
-	int *r2;
+	int r1;
+	int r2;

 	r1 = smp_load_acquire(y);
 	r2 = READ_ONCE(*z);
@@ -28,7 +28,7 @@ P1(int *y, int *z)

 P2(int *z, int *x)
 {
-	int *r3;
+	int r3;

 	WRITE_ONCE(*z, 1);
 	smp_mb();
diff --git a/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus b/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
index a71f1ac..527b373 100644
--- a/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
+++ b/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
@@ -18,8 +18,8 @@ P0(int *x, int *y)

 P1(int *y, int *z)
 {
-	int *r1;
-	int *r2;
+	int r1;
+	int r2;

 	r1 = smp_load_acquire(y);
 	r2 = READ_ONCE(*z);
@@ -27,7 +27,7 @@ P1(int *y, int *z)

 P2(int *z, int *x)
 {
-	int *r3;
+	int r3;

 	WRITE_ONCE(*z, 1);
 	smp_mb();
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 624f9a8..151af4e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1567,7 +1567,7 @@ P0(int* x0, int* x1) {

 P1(int* x0, int* x1) {
   int r2;
-  int r3;
+  int r3 = 0;

   r2 = READ_ONCE(*x1);
   if (r2 >= 0)
@@ -2162,8 +2162,8 @@ P0(int *x, int *y)

 P1(int *y, int *z)
 {
-  int *r1;
-  int *r2;
+  int r1;
+  int r2;

   r1 = smp_load_acquire(y);
   r2 = READ_ONCE(*z);
@@ -2171,7 +2171,7 @@ P1(int *y, int *z)

 P2(int *z, int *x)
 {
-  int *r3;
+  int r3;

   WRITE_ONCE(*z, 1);
   smp_mb();
@@ -2258,8 +2258,8 @@ P0(int *x, int *y)

 P1(int *y, int *z)
 {
-  int *r1;
-  int *r2;
+  int r1;
+  int r2;

   r1 = smp_load_acquire(y);
   r2 = READ_ONCE(*z);
@@ -2267,7 +2267,7 @@ P1(int *y, int *z)

 P2(int *z, int *x)
 {
-  int *r3;
+  int r3;

   WRITE_ONCE(*z, 1);
   smp_mb();
-- 
2.7.4

