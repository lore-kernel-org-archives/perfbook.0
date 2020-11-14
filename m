Return-Path: <SRS0=dTYp=EU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hz0HJ+pXbKQUHvV0b1+oEJDoZQQOawEJYnLpAXWVtmE=;
        b=VltaHJeZQBoyWKUY7tVbTn094O9I6+K/Zua5j7zBDkdJaKhksMiewPt7wtYWp2NUMO
         w9PkYZEegKr6Cm37fQ3IozMUwQgLfNBx/ukNQubk6mvmY8cyLlR9xND3D0rZNrTz5fV6
         BMj1KkU5df3qci00tg6RFVkW0RZtzCZTz9Sex7uV8WGCU3GietveyJA57qide6D34fYE
         dk1XGgvtFm/8eQ9q03/FHZj+E1nKhu+mhtnOkfeodrjel2WxfEpzs7245OrQmfEpVjmk
         TzHChbIZHGSKM5TVwtEwqVJuRP5TMFOSue9qn1OeANApBT05ZzOk5BT/c420n4fI9D+V
         fW7Q==
Subject: [PATCH perfbook 1/2] CodeSamples/formal/litmus: Remove redundant
 initialization
References: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ca6ca762-cd9d-1545-f638-936870b27b6a@gmail.com>
Date: Sat, 14 Nov 2020 13:54:21 +0900
MIME-Version: 1.0
In-Reply-To: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 40b6085963f79b50b2d326cad2b37692a7e89880 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Nov 2020 07:33:29 +0900
Subject: [PATCH perfbook 1/2] CodeSamples/formal/litmus: Remove redundant initialization

In C Flavor litmus tests, global variables of type "int" need
initialization only when they aren't 0.
This is true not only for herd7 but also for klitmus7/litmus7.

Declaration of plain "int" or "int *" can also be removed.

We can also remove "&" in the right hand side of initialization.

Finally, to reduce line counts of snippets, use "{}" when
init blocks are empty.

For consistency, put an empty line above initialization blocks and
remove extra blank lines in other parts of litmus tests.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus     | 5 ++---
 .../formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus  | 7 +++----
 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus    | 4 ++--
 CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus     | 4 ++--
 .../formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus        | 6 +-----
 CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus   | 6 +-----
 .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus        | 6 ++----
 CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus     | 6 ++----
 CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus    | 6 +-----
 memorder/memorder.tex                                     | 8 ++------
 10 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus
index 833dc9cf..017c782b 100644
--- a/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus
+++ b/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus
@@ -1,8 +1,7 @@
 C C-CCIRIW+o+o+o-o+o-o
 //\begin[snippet][labelbase=ln:formal:C-CCIRIW+o+o+o-o+o-o:whole,commandchars=\@\[\]]
-{
-int x = 0;
-}
+
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus b/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus
index 48bf94e3..aa1c3cd0 100644
--- a/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus
+++ b/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus
@@ -1,9 +1,9 @@
 C C-LB+o-data-o+o-data-o+o-data-o
 //\begin[snippet][labelbase=ln:formal:C-LB+o-data-o+o-data-o+o-data-o:whole,commandchars=\@\[\]]
+
 {
-int x0=0;
-int x1=1;
-int x2=2;
+x1=1;
+x2=2;
 }
 
 {				//\fcvexclude
@@ -18,7 +18,6 @@ P0(int *x0, int *x1)
 	WRITE_ONCE(*x1, r2);
 }
 
-
 P1(int *x1, int *x2)
 {
 	int r2;
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
index 63a86562..865943e5 100644
--- a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
@@ -2,8 +2,8 @@ C C-MP+o-wmb-o+o-ad-o
 //\begin[snippet][][labelbase=ln:formal:C-MP+o-wmb-o+o-addr-o:whole,commandchars=\@\[\]]
 
 {
-int y=1;			(* \lnlbl[init:y] *)
-int *x1 = &y;			(* \lnlbl[init:x1] *)
+y=1;			(* \lnlbl[init:y] *)
+x1=y;			(* \lnlbl[init:x1] *)
 }
 
 {				//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
index e9b91e87..11171cd5 100644
--- a/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
@@ -2,8 +2,8 @@ C C-S+o-wmb-o+o-addr-o
 //\begin[snippet][labelbase=ln:formal:C-S+o-wmb-o+o-addr-o:whole,commandchars=\@\[\]]
 
 {
-int y=1;
-int *x1 = &y;
+y=1;
+x1=y;
 }
 
 {				//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
index d664136b..a6d99b6f 100644
--- a/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
+++ b/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
@@ -1,11 +1,7 @@
 C C-W+RWC+o-mb-o+a-o+o-mb-o
 //\begin[snippet][labelbase=ln:formal:C-W+RWC+o-mb-o+a-o+o-mb-o:whole,commandchars=\@\[\]]
 
-{
-int x = 0;
-int y = 0;
-int z = 0;
-}
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus
index 17f300e1..53ae7bdc 100644
--- a/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus
+++ b/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus
@@ -1,11 +1,7 @@
 C C-W+RWC+o-r+a-o+o-mb-o
 //\begin[snippet][labelbase=ln:formal:C-W+RWC+o-r+a-o+o-mb-o:whole,commandchars=\@\[\]]
 
-{
-int x = 0;
-int y = 0;
-int z = 0;
-}
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
index 3525e033..1310bd7f 100644
--- a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
@@ -1,10 +1,8 @@
 C C-WWC+o+o-data-o+o-addr-o
 
 {
-int a = 0;
-int b = 0;
-int *x = &a;
-int *y = &b;
+x=a;
+y=b;
 }
 
 {
diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
index 0d16b2f7..dbfc8044 100644
--- a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
@@ -1,10 +1,8 @@
 C C-WWC+o+o-r+o-addr-o
 
 {
-int a = 0;
-int b = 0;
-int *x = &a;
-int *y = &b;
+x=a;
+y=b;
 }
 
 {
diff --git a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
index 2115bcf1..747f777f 100644
--- a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
+++ b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
@@ -1,11 +1,7 @@
 C C-Z6.2+o-r+a-o+o-mb-o
 //\begin[snippet][labelbase=ln:formal:C-Z6.2+o-r+a-o+o-mb-o:whole,commandchars=\@\[\]]
 
-{
-int x = 0;
-int y = 0;
-int z = 0;
-}
+{}
 
 {				//\fcvexclude
 #include "api.h"		//\fcvexclude
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 44e1d14d..5118241e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1216,26 +1216,22 @@ Therefore, on older versions of Linux,
 C C-MP+o-wmb-o+ld-addr-o
 
 {
-int y=1;
-int *x1 = &y;
+y=1;
+x1=y;
 }
 
 P0(int* x0, int** x1) {
-
 	WRITE_ONCE(*x0, 2);
 	smp_wmb();
 	WRITE_ONCE(*x1, x0);
-
 }
 
 P1(int** x1) {
-
 	int *r2;
 	int r3;
 
 	r2 = lockless_dereference(*x1); // Obsolete @lnlbl[deref]
 	r3 = READ_ONCE(*r2);			    @lnlbl[read]
-
 }
 
 exists (1:r2=x0 /\ 1:r3=1)
-- 
2.17.1


