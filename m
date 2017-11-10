Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7hwGX5tSuBeUCGRxTZiFSWvHzkmBcez7HlCMy0XzhSE=;
 b=pNiJxxRd5ftSa6bUwvkjHJhRqky7HV6AtCkwlk5udkRXOjNY/dX6V4VDDOq19TspQY
 XgkIFUModtTo2ouMFgzDklcOrB8KzeuGZwrjdlVvAXzfQDrnuFa0Z+mfqaj7KxCJ8Xrw
 j9elqIIdarTKWVtgWX8mKw2Ikzd7XMFct2nflEP63zkmFCHAvwtrAZBtxv0/m9L5nTHy
 BPdQuUFnfx8aLy7WcPAlwK1VTy7fXBEXEjarfefcDimLY3PpBMlm9hTfG7xOTe1j/5L8
 GDxC5gt1tThSmFUDgrccdi+xKM8BBlZj994R/gwnvktITGeJWtFFVIUaSTtfwZqcc0Cu
 qfsA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/3] CodeSamples/formal: Separate litmus7 compatible litmus
 tests
Message-ID: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
Date: Sat, 11 Nov 2017 08:39:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 73b24a9b12ed7b9d086658a026833c09fdfe8bbe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Nov 2017 00:49:53 +0900
Subject: [PATCH 1/3] CodeSamples/formal: Separate litmus7 compatible litmus tests

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/.gitignore                 |  6 ---
 CodeSamples/formal/herd/C-2+2W+o-o+o-o.litmus      | 22 -----------
 .../formal/herd/C-2+2W+o-wmb-o+o-wmb-o.litmus      | 26 ------------
 .../formal/herd/C-CCIRIW+o+o+o-o+o-o.litmus        | 39 ------------------
 .../formal/herd/C-ISA2+o-r+a-r+a-r+a-o.litmus      | 41 -------------------
 .../formal/herd/C-LB+a-o+o-data-o+o-data-o.litmus  | 34 ----------------
 .../formal/herd/C-LB+a-r+a-r+a-r+a-r.litmus        | 42 --------------------
 .../herd/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus       | 27 -------------
 .../formal/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus   | 41 -------------------
 .../formal/herd/C-LB+o-cge-o+o-cge-o.litmus        | 27 -------------
 .../formal/herd/C-LB+o-cgt-o+o-cgt-o.litmus        | 27 -------------
 .../herd/C-LB+o-data-o+o-data-o+o-data-o.litmus    | 37 -----------------
 CodeSamples/formal/herd/C-LB+o-o+o-o.litmus        | 26 ------------
 CodeSamples/formal/herd/C-LB+o-r+a-o.litmus        | 26 ------------
 CodeSamples/formal/herd/C-LB+o-r+o-ctrl-o.litmus   | 27 -------------
 CodeSamples/formal/herd/C-LB+o-r+o-data-o.litmus   | 26 ------------
 CodeSamples/formal/herd/C-MP+o-o+o-rmb-o.litmus    | 28 -------------
 CodeSamples/formal/herd/C-MP+o-r+o-ctrl-o.litmus   | 27 -------------
 .../formal/herd/C-MP+o-wmb-o+ld-addr-o.litmus      | 30 --------------
 .../formal/herd/C-MP+o-wmb-o+o-addr-o.litmus       | 30 --------------
 CodeSamples/formal/herd/C-MP+o-wmb-o+o-o.litmus    | 28 -------------
 .../formal/herd/C-MP+o-wmb-o+o-rmb-o.litmus        | 29 --------------
 .../formal/herd/C-MP-OMCA+o-o-o+o-rmb-o.litmus     | 29 --------------
 CodeSamples/formal/herd/C-R+o-wmb-o+o-mb-o.litmus  | 26 ------------
 .../formal/herd/C-S+o-wmb-o+o-addr-o.litmus        | 29 --------------
 CodeSamples/formal/herd/C-SB+o-mb-o+o-mb-o.litmus  | 28 -------------
 CodeSamples/formal/herd/C-SB+o-o+o-o.litmus        | 26 ------------
 .../herd/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus      | 33 ----------------
 .../formal/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus   | 38 ------------------
 .../formal/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus      | 37 -----------------
 .../formal/herd/C-WRC+o+o-data-o+o-rmb-o.litmus    | 33 ----------------
 CodeSamples/formal/herd/C-WRC+o+o-r+a-o.litmus     | 32 ---------------
 .../formal/herd/C-WWC+o+o-data-o+o-addr-o.litmus   | 36 -----------------
 .../formal/herd/C-WWC+o+o-r+o-addr-o.litmus        | 36 -----------------
 .../herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus       | 46 ----------------------
 .../formal/herd/C-WWC+o-cge-o+o-cge-o+o.litmus     | 32 ---------------
 .../herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus       | 46 ----------------------
 .../formal/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus     | 32 ---------------
 .../formal/herd/C-Z6.2+o-r+a-o+o-mb-o.litmus       | 36 -----------------
 .../formal/herd/C-Z6.2+o-r+a-r+a-r+a-o.litmus      | 40 -------------------
 CodeSamples/formal/herd/Makefile                   | 34 ----------------
 CodeSamples/formal/herd/api.h                      | 23 -----------
 CodeSamples/formal/litmus/.gitignore               |  6 +++
 CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus    | 22 +++++++++++
 .../formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus    | 26 ++++++++++++
 .../formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus      | 39 ++++++++++++++++++
 .../formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus    | 41 +++++++++++++++++++
 .../litmus/C-LB+a-o+o-data-o+o-data-o.litmus       | 34 ++++++++++++++++
 .../formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus      | 42 ++++++++++++++++++++
 .../litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus     | 27 +++++++++++++
 .../formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus | 41 +++++++++++++++++++
 .../formal/litmus/C-LB+o-cge-o+o-cge-o.litmus      | 27 +++++++++++++
 .../formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus      | 27 +++++++++++++
 .../litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus  | 37 +++++++++++++++++
 CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus      | 26 ++++++++++++
 CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus      | 26 ++++++++++++
 CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus | 27 +++++++++++++
 CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus | 26 ++++++++++++
 CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus  | 28 +++++++++++++
 CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus | 27 +++++++++++++
 .../formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus    | 30 ++++++++++++++
 .../formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus     | 30 ++++++++++++++
 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus  | 28 +++++++++++++
 .../formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus      | 29 ++++++++++++++
 .../formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus   | 29 ++++++++++++++
 .../formal/litmus/C-R+o-wmb-o+o-mb-o.litmus        | 26 ++++++++++++
 .../formal/litmus/C-S+o-wmb-o+o-addr-o.litmus      | 29 ++++++++++++++
 .../formal/litmus/C-SB+o-mb-o+o-mb-o.litmus        | 28 +++++++++++++
 CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus      | 26 ++++++++++++
 .../litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus    | 33 ++++++++++++++++
 .../formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus | 38 ++++++++++++++++++
 .../formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus    | 37 +++++++++++++++++
 .../formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus  | 33 ++++++++++++++++
 CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus   | 32 +++++++++++++++
 .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus | 36 +++++++++++++++++
 .../formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      | 36 +++++++++++++++++
 .../litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus     | 46 ++++++++++++++++++++++
 .../formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus   | 32 +++++++++++++++
 .../litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus     | 46 ++++++++++++++++++++++
 .../formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus   | 32 +++++++++++++++
 .../formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus     | 36 +++++++++++++++++
 .../formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus    | 40 +++++++++++++++++++
 CodeSamples/formal/litmus/Makefile                 | 34 ++++++++++++++++
 CodeSamples/formal/litmus/api.h                    | 23 +++++++++++
 84 files changed, 1318 insertions(+), 1318 deletions(-)
 delete mode 100644 CodeSamples/formal/herd/.gitignore
 delete mode 100644 CodeSamples/formal/herd/C-2+2W+o-o+o-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-2+2W+o-wmb-o+o-wmb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-CCIRIW+o+o+o-o+o-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-ISA2+o-r+a-r+a-r+a-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+a-o+o-data-o+o-data-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+a-r+a-r+a-r+a-r.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-cgt-o+o-cgt-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-data-o+o-data-o+o-data-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-o+o-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-r+a-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-r+o-ctrl-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-LB+o-r+o-data-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP+o-o+o-rmb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP+o-r+o-ctrl-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP+o-wmb-o+ld-addr-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP+o-wmb-o+o-addr-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP+o-wmb-o+o-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP+o-wmb-o+o-rmb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-MP-OMCA+o-o-o+o-rmb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-R+o-wmb-o+o-mb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-S+o-wmb-o+o-addr-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-SB+o-mb-o+o-mb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-SB+o-o+o-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WRC+o+o-r+a-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WWC+o+o-data-o+o-addr-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WWC+o+o-r+o-addr-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
 delete mode 100644 CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-Z6.2+o-r+a-o+o-mb-o.litmus
 delete mode 100644 CodeSamples/formal/herd/C-Z6.2+o-r+a-r+a-r+a-o.litmus
 delete mode 100644 CodeSamples/formal/herd/Makefile
 delete mode 100644 CodeSamples/formal/herd/api.h
 create mode 100644 CodeSamples/formal/litmus/.gitignore
 create mode 100644 CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
 create mode 100644 CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
 create mode 100644 CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus
 create mode 100644 CodeSamples/formal/litmus/Makefile
 create mode 100644 CodeSamples/formal/litmus/api.h

diff --git a/CodeSamples/formal/herd/.gitignore b/CodeSamples/formal/herd/.gitignore
deleted file mode 100644
index a01a568..0000000
--- a/CodeSamples/formal/herd/.gitignore
+++ /dev/null
@@ -1,6 +0,0 @@
-*.out
-/@all
-/X86
-/PPC
-/ARM
-*.tar
diff --git a/CodeSamples/formal/herd/C-2+2W+o-o+o-o.litmus b/CodeSamples/formal/herd/C-2+2W+o-o+o-o.litmus
deleted file mode 100644
index 2ea8808..0000000
--- a/CodeSamples/formal/herd/C-2+2W+o-o+o-o.litmus
+++ /dev/null
@@ -1,22 +0,0 @@
-C C-2+2W+o-o+o-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	WRITE_ONCE(*x0, 1);
-	WRITE_ONCE(*x1, 2);
-}
-
-
-P1(int *x0, int *x1)
-{
-	WRITE_ONCE(*x1, 1);
-	WRITE_ONCE(*x0, 2);
-}
-
-exists (x0=1 /\ x1=1)
diff --git a/CodeSamples/formal/herd/C-2+2W+o-wmb-o+o-wmb-o.litmus b/CodeSamples/formal/herd/C-2+2W+o-wmb-o+o-wmb-o.litmus
deleted file mode 100644
index a58e637..0000000
--- a/CodeSamples/formal/herd/C-2+2W+o-wmb-o+o-wmb-o.litmus
+++ /dev/null
@@ -1,26 +0,0 @@
-C C-2+2W+o-wmb-o+o-wmb-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	WRITE_ONCE(*x0, 1);
-	smp_wmb();
-	WRITE_ONCE(*x1, 2);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	WRITE_ONCE(*x1, 1);
-	smp_wmb();
-	WRITE_ONCE(*x0, 2);
-}
-
-exists (x0=1 /\ x1=1)
diff --git a/CodeSamples/formal/herd/C-CCIRIW+o+o+o-o+o-o.litmus b/CodeSamples/formal/herd/C-CCIRIW+o+o+o-o+o-o.litmus
deleted file mode 100644
index 49a6a52..0000000
--- a/CodeSamples/formal/herd/C-CCIRIW+o+o+o-o+o-o.litmus
+++ /dev/null
@@ -1,39 +0,0 @@
-C C-CCIRIW+o+o+o-o+o-o
-
-{
-int x = 0;
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
-P1(int *x)
-{
-	WRITE_ONCE(*x, 2);
-}
-
-P2(int *x)
-{
-	int r1;
-	int r2;
-
-	r1 = READ_ONCE(*x);
-	r2 = READ_ONCE(*x);
-}
-
-P3(int *x)
-{
-	int r3;
-	int r4;
-
-	r3 = READ_ONCE(*x);
-	r4 = READ_ONCE(*x);
-}
-
-exists(2:r1=1 /\ 2:r2=2 /\ 3:r3=2 /\ 3:r4=1)
diff --git a/CodeSamples/formal/herd/C-ISA2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/herd/C-ISA2+o-r+a-r+a-r+a-o.litmus
deleted file mode 100644
index 343fded..0000000
--- a/CodeSamples/formal/herd/C-ISA2+o-r+a-r+a-r+a-o.litmus
+++ /dev/null
@@ -1,41 +0,0 @@
-C C-ISA2+o-r+a-r+a-r+a-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	WRITE_ONCE(*x0, 2);
-	smp_store_release(x1, 2);
-}
-
-
-P1(int *x1, int *x2)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x1);
-	smp_store_release(x2, 2);
-}
-
-P2(int *x2, int *x3)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x2);
-	smp_store_release(x3, 2);
-}
-
-P3(int *x3, int *x0)
-{
-	int r1;
-	int r2;
-
-	r1 = smp_load_acquire(x3);
-	r2 = READ_ONCE(*x0);
-}
-
-exists (1:r2=2 /\ 2:r2=2 /\ 3:r1=2 /\ 3:r2=0)
diff --git a/CodeSamples/formal/herd/C-LB+a-o+o-data-o+o-data-o.litmus b/CodeSamples/formal/herd/C-LB+a-o+o-data-o+o-data-o.litmus
deleted file mode 100644
index d517dae..0000000
--- a/CodeSamples/formal/herd/C-LB+a-o+o-data-o+o-data-o.litmus
+++ /dev/null
@@ -1,34 +0,0 @@
-C C-LB+a-o+o-data-o+o-data-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x0);
-	WRITE_ONCE(*x1, 2);
-}
-
-
-P1(int *x1, int *x2)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x1);
-	WRITE_ONCE(*x2, r2);
-}
-
-P2(int *x2, int *x0)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x2);
-	WRITE_ONCE(*x0, r2);
-}
-
-exists (0:r2=2 /\ 1:r2=2 /\ 2:r2=2)
diff --git a/CodeSamples/formal/herd/C-LB+a-r+a-r+a-r+a-r.litmus b/CodeSamples/formal/herd/C-LB+a-r+a-r+a-r+a-r.litmus
deleted file mode 100644
index 9105d41..0000000
--- a/CodeSamples/formal/herd/C-LB+a-r+a-r+a-r+a-r.litmus
+++ /dev/null
@@ -1,42 +0,0 @@
-C C-LB+a-r+a-r+a-r+a-r
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x0);
-	smp_store_release(x1, 2);
-}
-
-
-P1(int *x1, int *x2)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x1);
-	smp_store_release(x2, 2);
-}
-
-P2(int *x2, int *x3)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x2);
-	smp_store_release(x3, 2);
-}
-
-P3(int *x3, int *x0)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x3);
-	smp_store_release(x0, 2);
-}
-
-exists (0:r2=2 /\ 1:r2=2 /\ 2:r2=2 /\ 3:r2=2)
diff --git a/CodeSamples/formal/herd/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus b/CodeSamples/formal/herd/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
deleted file mode 100644
index a026e2d..0000000
--- a/CodeSamples/formal/herd/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
+++ /dev/null
@@ -1,27 +0,0 @@
-C C-LB+cmpxchg-ctrl-o+o-ctrl-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = cmpxchg(x, 2, 3);
-	if (r1 >= 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 >= 0)
-		WRITE_ONCE(*x, 1);
-}
-
-exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus b/CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus
deleted file mode 100644
index e97b879..0000000
--- a/CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o+dstb.litmus
+++ /dev/null
@@ -1,41 +0,0 @@
-C C-LB+o-cge-o+o-cge-o+dstb
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 >= 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 >= 0)
-		WRITE_ONCE(*x, 1);
-}
-
-/* P2 is to disturb compiler optimization */
-P2(int *x, int *y)
-{
-	int r3;
-	int r4;
-
-	r3 = READ_ONCE(*x);
-	r4 = READ_ONCE(*y);
-	if (r3 < 0)
-		WRITE_ONCE(*y, -1);
-	if (r4 < 0)
-		WRITE_ONCE(*x, -1);
-}
-
-exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o.litmus b/CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o.litmus
deleted file mode 100644
index 14539b9..0000000
--- a/CodeSamples/formal/herd/C-LB+o-cge-o+o-cge-o.litmus
+++ /dev/null
@@ -1,27 +0,0 @@
-C C-LB+o-cge-o+o-cge-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 >= 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 >= 0)
-		WRITE_ONCE(*x, 1);
-}
-
-exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/formal/herd/C-LB+o-cgt-o+o-cgt-o.litmus b/CodeSamples/formal/herd/C-LB+o-cgt-o+o-cgt-o.litmus
deleted file mode 100644
index d442f76..0000000
--- a/CodeSamples/formal/herd/C-LB+o-cgt-o+o-cgt-o.litmus
+++ /dev/null
@@ -1,27 +0,0 @@
-C C-LB+o-cgt-o+o-cgt-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 > 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 > 0)
-		WRITE_ONCE(*x, 1);
-}
-
-exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/formal/herd/C-LB+o-data-o+o-data-o+o-data-o.litmus b/CodeSamples/formal/herd/C-LB+o-data-o+o-data-o+o-data-o.litmus
deleted file mode 100644
index 98cbe27..0000000
--- a/CodeSamples/formal/herd/C-LB+o-data-o+o-data-o+o-data-o.litmus
+++ /dev/null
@@ -1,37 +0,0 @@
-C C-LB+o-data-o+o-data-o+o-data-o
-{
-int x0=0;
-int x1=1;
-int x2=2;
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x0);
-	WRITE_ONCE(*x1, r2);
-}
-
-
-P1(int *x1, int *x2)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x1);
-	WRITE_ONCE(*x2, r2);
-}
-
-P2(int *x2, int *x0)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x2);
-	WRITE_ONCE(*x0, r2);
-}
-
-exists (0:r2=2 /\ 1:r2=0 /\ 2:r2=1)
diff --git a/CodeSamples/formal/herd/C-LB+o-o+o-o.litmus b/CodeSamples/formal/herd/C-LB+o-o+o-o.litmus
deleted file mode 100644
index 8ee530d..0000000
--- a/CodeSamples/formal/herd/C-LB+o-o+o-o.litmus
+++ /dev/null
@@ -1,26 +0,0 @@
-C C-LB+o-o+o-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x1);
-	WRITE_ONCE(*x0, 2);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x0);
-	WRITE_ONCE(*x1, 2);
-}
-
-exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/herd/C-LB+o-r+a-o.litmus b/CodeSamples/formal/herd/C-LB+o-r+a-o.litmus
deleted file mode 100644
index bab943c..0000000
--- a/CodeSamples/formal/herd/C-LB+o-r+a-o.litmus
+++ /dev/null
@@ -1,26 +0,0 @@
-C C-LB+o-r+a-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x1);
-	smp_store_release(x0, 2);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x0);
-	WRITE_ONCE(*x1, 2);
-}
-
-exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/herd/C-LB+o-r+o-ctrl-o.litmus b/CodeSamples/formal/herd/C-LB+o-r+o-ctrl-o.litmus
deleted file mode 100644
index ab55690..0000000
--- a/CodeSamples/formal/herd/C-LB+o-r+o-ctrl-o.litmus
+++ /dev/null
@@ -1,27 +0,0 @@
-C C-LB+o-r+o-ctrl-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x1);
-	smp_store_release(x0, 2);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x0);
-	if (r2 >= 0)
-		WRITE_ONCE(*x1, 2);
-}
-
-exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/herd/C-LB+o-r+o-data-o.litmus b/CodeSamples/formal/herd/C-LB+o-r+o-data-o.litmus
deleted file mode 100644
index 42df8bf..0000000
--- a/CodeSamples/formal/herd/C-LB+o-r+o-data-o.litmus
+++ /dev/null
@@ -1,26 +0,0 @@
-C C-LB+o-r+o-data-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x1);
-	smp_store_release(x0, 2);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	r2 = READ_ONCE(*x0);
-	WRITE_ONCE(*x1, r2);
-}
-
-exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/herd/C-MP+o-o+o-rmb-o.litmus b/CodeSamples/formal/herd/C-MP+o-o+o-rmb-o.litmus
deleted file mode 100644
index 4b23976..0000000
--- a/CodeSamples/formal/herd/C-MP+o-o+o-rmb-o.litmus
+++ /dev/null
@@ -1,28 +0,0 @@
-C C-MP+o-o+o-rmb-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int* x1) {
-
-	WRITE_ONCE(*x0, 2);
-	WRITE_ONCE(*x1, 2);
-
-}
-
-P1(int* x0, int* x1) {
-
-	int r2;
-	int r3;
-
-	r2 = READ_ONCE(*x1);
-	smp_rmb();
-	r3 = READ_ONCE(*x0);
-
-}
-
-exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/herd/C-MP+o-r+o-ctrl-o.litmus b/CodeSamples/formal/herd/C-MP+o-r+o-ctrl-o.litmus
deleted file mode 100644
index 82cf629..0000000
--- a/CodeSamples/formal/herd/C-MP+o-r+o-ctrl-o.litmus
+++ /dev/null
@@ -1,27 +0,0 @@
-C C-MP+o-r+o-ctrl-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int* x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_store_release(x1, 2);
-
-}
-
-P1(int* x0, int* x1) {
-	int r2;
-	int r3 = 0;
-
-	r2 = READ_ONCE(*x1);
-	if (r2 >= 0)
-		r3 = READ_ONCE(*x0);
-
-}
-
-exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/herd/C-MP+o-wmb-o+ld-addr-o.litmus b/CodeSamples/formal/herd/C-MP+o-wmb-o+ld-addr-o.litmus
deleted file mode 100644
index 117a6e3..0000000
--- a/CodeSamples/formal/herd/C-MP+o-wmb-o+ld-addr-o.litmus
+++ /dev/null
@@ -1,30 +0,0 @@
-C C-MP+o-wmb-o+ld-ad-o
-
-{
-int y=1;
-int *x1 = &y;
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int** x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_wmb();
-	WRITE_ONCE(*x1, x0);
-
-}
-
-P1(int** x1) {
-
-	int *r2;
-	int r3;
-
-	r2 = lockless_dereference(*x1);
-	r3 = READ_ONCE(*r2);
-
-}
-
-exists (1:r2=x0 /\ 1:r3=1)
diff --git a/CodeSamples/formal/herd/C-MP+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/herd/C-MP+o-wmb-o+o-addr-o.litmus
deleted file mode 100644
index 381fea8..0000000
--- a/CodeSamples/formal/herd/C-MP+o-wmb-o+o-addr-o.litmus
+++ /dev/null
@@ -1,30 +0,0 @@
-C C-MP+o-wmb-o+o-ad-o
-
-{
-int y=1;
-int *x1 = &y;
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int** x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_wmb();
-	WRITE_ONCE(*x1, x0);
-
-}
-
-P1(int** x1) {
-
-	int *r2;
-	int r3;
-
-	r2 = READ_ONCE(*x1);
-	r3 = READ_ONCE(*r2);
-
-}
-
-exists (1:r2=x0 /\ 1:r3=1)
diff --git a/CodeSamples/formal/herd/C-MP+o-wmb-o+o-o.litmus b/CodeSamples/formal/herd/C-MP+o-wmb-o+o-o.litmus
deleted file mode 100644
index 57cda9e..0000000
--- a/CodeSamples/formal/herd/C-MP+o-wmb-o+o-o.litmus
+++ /dev/null
@@ -1,28 +0,0 @@
-C C-MP+o-wmb-o+o-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int* x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_wmb();
-	WRITE_ONCE(*x1, 2);
-
-}
-
-P1(int* x0, int* x1) {
-
-	int r2;
-	int r3;
-
-	r2 = READ_ONCE(*x1);
-	r3 = READ_ONCE(*x0);
-
-}
-
-exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/herd/C-MP+o-wmb-o+o-rmb-o.litmus b/CodeSamples/formal/herd/C-MP+o-wmb-o+o-rmb-o.litmus
deleted file mode 100644
index 61e23db..0000000
--- a/CodeSamples/formal/herd/C-MP+o-wmb-o+o-rmb-o.litmus
+++ /dev/null
@@ -1,29 +0,0 @@
-C C-MP+o-wmb-o+o-rmb-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int* x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_wmb();
-	WRITE_ONCE(*x1, 2);
-
-}
-
-P1(int* x0, int* x1) {
-
-	int r2;
-	int r3;
-
-	r2 = READ_ONCE(*x1);
-	smp_rmb();
-	r3 = READ_ONCE(*x0);
-
-}
-
-exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/herd/C-MP-OMCA+o-o-o+o-rmb-o.litmus b/CodeSamples/formal/herd/C-MP-OMCA+o-o-o+o-rmb-o.litmus
deleted file mode 100644
index c5c0242..0000000
--- a/CodeSamples/formal/herd/C-MP-OMCA+o-o-o+o-rmb-o.litmus
+++ /dev/null
@@ -1,29 +0,0 @@
-C C-MP-OMCA+o-o-o+o-rmb-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r0;
-
-	WRITE_ONCE(*x, 1);
-	r0 = READ_ONCE(*x);
-	WRITE_ONCE(*y, r0);
-}
-
-P1(int *x, int *y)
-{
-	int r1;
-	int r2;
-
-	r1 = READ_ONCE(*y);
-	smp_rmb();
-	r2 = READ_ONCE(*x);
-}
-
-exists (1:r1=1 /\ 1:r2=0)
diff --git a/CodeSamples/formal/herd/C-R+o-wmb-o+o-mb-o.litmus b/CodeSamples/formal/herd/C-R+o-wmb-o+o-mb-o.litmus
deleted file mode 100644
index d4f000c..0000000
--- a/CodeSamples/formal/herd/C-R+o-wmb-o+o-mb-o.litmus
+++ /dev/null
@@ -1,26 +0,0 @@
-C C-R+o-wmb-o+o-mb-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	WRITE_ONCE(*x0, 1);
-	smp_wmb();
-	WRITE_ONCE(*x1, 1);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	WRITE_ONCE(*x1, 2);
-	smp_mb();
-	r2 = READ_ONCE(*x0);
-}
-
-exists (1:r2=0 /\ x1=2)
diff --git a/CodeSamples/formal/herd/C-S+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/herd/C-S+o-wmb-o+o-addr-o.litmus
deleted file mode 100644
index 1ff49b1..0000000
--- a/CodeSamples/formal/herd/C-S+o-wmb-o+o-addr-o.litmus
+++ /dev/null
@@ -1,29 +0,0 @@
-C C-S+o-wmb-o+o-ad-o
-
-{
-int y=1;
-int *x1 = &y;
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int** x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_wmb();
-	WRITE_ONCE(*x1, x0);
-
-}
-
-P1(int** x1) {
-
-	int *r2;
-
-	r2 = READ_ONCE(*x1);
-	WRITE_ONCE(*r2, 3);
-
-}
-
-exists (1:r2=x0 /\ x0=2)
diff --git a/CodeSamples/formal/herd/C-SB+o-mb-o+o-mb-o.litmus b/CodeSamples/formal/herd/C-SB+o-mb-o+o-mb-o.litmus
deleted file mode 100644
index 1093329..0000000
--- a/CodeSamples/formal/herd/C-SB+o-mb-o+o-mb-o.litmus
+++ /dev/null
@@ -1,28 +0,0 @@
-C C-SB+o-mb-o+o-mb-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	WRITE_ONCE(*x0, 2);
-	smp_mb();
-	r2 = READ_ONCE(*x1);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	WRITE_ONCE(*x1, 2);
-	smp_mb();
-	r2 = READ_ONCE(*x0);
-}
-
-exists (1:r2=0 /\ 0:r2=0)
diff --git a/CodeSamples/formal/herd/C-SB+o-o+o-o.litmus b/CodeSamples/formal/herd/C-SB+o-o+o-o.litmus
deleted file mode 100644
index 2e45ee6..0000000
--- a/CodeSamples/formal/herd/C-SB+o-o+o-o.litmus
+++ /dev/null
@@ -1,26 +0,0 @@
-C C-SB+o-o+o-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r2;
-
-	WRITE_ONCE(*x0, 2);
-	r2 = READ_ONCE(*x1);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r2;
-
-	WRITE_ONCE(*x1, 2);
-	r2 = READ_ONCE(*x0);
-}
-
-exists (1:r2=0 /\ 0:r2=0)
diff --git a/CodeSamples/formal/herd/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus b/CodeSamples/formal/herd/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
deleted file mode 100644
index e150296..0000000
--- a/CodeSamples/formal/herd/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
+++ /dev/null
@@ -1,33 +0,0 @@
-C C-SB-OMCA+o-o-rmb-o+o-o-rmb-o
-
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	int r1;
-	int r2;
-
-	WRITE_ONCE(*x0, 2);
-	r1 = READ_ONCE(*x0);
-	smp_rmb();
-	r2 = READ_ONCE(*x1);
-}
-
-
-P1(int *x0, int *x1)
-{
-	int r1;
-	int r2;
-
-	WRITE_ONCE(*x1, 2);
-	r1 = READ_ONCE(*x1);
-	smp_rmb();
-	r2 = READ_ONCE(*x0);
-}
-
-exists (1:r2=0 /\ 0:r2=0 /\ 1:r1=2 /\ 0:r1=2)
diff --git a/CodeSamples/formal/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus b/CodeSamples/formal/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
deleted file mode 100644
index 23050e6..0000000
--- a/CodeSamples/formal/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
+++ /dev/null
@@ -1,38 +0,0 @@
-C C-W+RWC+o-mb-o+a-o+o-mb-o
-
-{
-int x = 0;
-int y = 0;
-int z = 0;
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	WRITE_ONCE(*x, 1);
-	smp_mb();
-	WRITE_ONCE(*y, 1);
-}
-
-P1(int *y, int *z)
-{
-	int r1;
-	int r2;
-
-	r1 = smp_load_acquire(y);
-	r2 = READ_ONCE(*z);
-}
-
-P2(int *z, int *x)
-{
-	int r3;
-
-	WRITE_ONCE(*z, 1);
-	smp_mb();
-	r3 = READ_ONCE(*x);
-}
-
-exists(1:r1=1 /\ 1:r2=0 /\ 2:r3=0)
diff --git a/CodeSamples/formal/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
deleted file mode 100644
index 527b373..0000000
--- a/CodeSamples/formal/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
+++ /dev/null
@@ -1,37 +0,0 @@
-C C-W+RWC+o-r+a-o+o-mb-o
-
-{
-int x = 0;
-int y = 0;
-int z = 0;
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	WRITE_ONCE(*x, 1);
-	smp_store_release(y, 1);
-}
-
-P1(int *y, int *z)
-{
-	int r1;
-	int r2;
-
-	r1 = smp_load_acquire(y);
-	r2 = READ_ONCE(*z);
-}
-
-P2(int *z, int *x)
-{
-	int r3;
-
-	WRITE_ONCE(*z, 1);
-	smp_mb();
-	r3 = READ_ONCE(*x);
-}
-
-exists(1:r1=1 /\ 1:r2=0 /\ 2:r3=0)
diff --git a/CodeSamples/formal/herd/C-WRC+o+o-data-o+o-rmb-o.litmus b/CodeSamples/formal/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
deleted file mode 100644
index 602e800..0000000
--- a/CodeSamples/formal/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
+++ /dev/null
@@ -1,33 +0,0 @@
-C C-WRC+o+o-data-o+o-rmb-o
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
diff --git a/CodeSamples/formal/herd/C-WRC+o+o-r+a-o.litmus b/CodeSamples/formal/herd/C-WRC+o+o-r+a-o.litmus
deleted file mode 100644
index 6d55ead..0000000
--- a/CodeSamples/formal/herd/C-WRC+o+o-r+a-o.litmus
+++ /dev/null
@@ -1,32 +0,0 @@
-C C-WRC+o+o-r+a-o
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
-	smp_store_release(y, r1);
-}
-
-P2(int *x, int* y)
-{
-	int r2;
-	int r3;
-
-	r2 = smp_load_acquire(y);
-	r3 = READ_ONCE(*x);
-}
-
-exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
diff --git a/CodeSamples/formal/herd/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/formal/herd/C-WWC+o+o-data-o+o-addr-o.litmus
deleted file mode 100644
index c0cbee8..0000000
--- a/CodeSamples/formal/herd/C-WWC+o+o-data-o+o-addr-o.litmus
+++ /dev/null
@@ -1,36 +0,0 @@
-C C-WWC+o+o-data-o+o-addr-o
-
-{
-int a = 0;
-int b = 0;
-int *c = &b;
-int *x = &a;
-int *y = &b;
-}
-
-{
-#include "api.h"
-}
-
-P0(int **x)
-{
-	WRITE_ONCE(*x, x);
-}
-
-P1(int **x, int **y)
-{
-	int *r1;
-
-	r1 = READ_ONCE(*x);
-	WRITE_ONCE(*y, r1);
-}
-
-P2(int **y, int **c)
-{
-	int *r2;
-
-	r2 = READ_ONCE(*y);
-	WRITE_ONCE(*r2, c);
-}
-
-exists(1:r1=x /\ 2:r2=x /\ x=x)
diff --git a/CodeSamples/formal/herd/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/formal/herd/C-WWC+o+o-r+o-addr-o.litmus
deleted file mode 100644
index 6f0a810..0000000
--- a/CodeSamples/formal/herd/C-WWC+o+o-r+o-addr-o.litmus
+++ /dev/null
@@ -1,36 +0,0 @@
-C C-WWC+o+o-r+o-addr-o
-
-{
-int a = 0;
-int b = 0;
-int *c = &b;
-int *x = &a;
-int *y = &b;
-}
-
-{
-#include "api.h"
-}
-
-P0(int **x)
-{
-	WRITE_ONCE(*x, x);
-}
-
-P1(int **x, int **y)
-{
-	int *r1;
-
-	r1 = READ_ONCE(*x);
-	smp_store_release(y, r1);
-}
-
-P2(int **y, int **c)
-{
-	int *r2;
-
-	r2 = READ_ONCE(*y);
-	WRITE_ONCE(*r2, c);
-}
-
-exists(1:r1=x /\ 2:r2=x /\ x=x)
diff --git a/CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus b/CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
deleted file mode 100644
index 015bcd0..0000000
--- a/CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
+++ /dev/null
@@ -1,46 +0,0 @@
-C C-WWC+o-cge-o+o-cge-o+o+dstb
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 >= 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 >= 0)
-		WRITE_ONCE(*x, 1);
-}
-
-P2(int *x)
-{
-	WRITE_ONCE(*x, 2);
-}
-
-/* P3 is to disturb compiler optimization */
-P3(int *x, int *y)
-{
-	int r3;
-	int r4;
-
-	r3 = READ_ONCE(*x);
-	r4 = READ_ONCE(*y);
-	if (r3 < 0)
-		WRITE_ONCE(*y, -1);
-	if (r4 < 0)
-		WRITE_ONCE(*x, -1);
-}
-
-exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o.litmus b/CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o.litmus
deleted file mode 100644
index 3fcd502..0000000
--- a/CodeSamples/formal/herd/C-WWC+o-cge-o+o-cge-o+o.litmus
+++ /dev/null
@@ -1,32 +0,0 @@
-C C-WWC+o-cge-o+o-cge-o+o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 >= 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 >= 0)
-		WRITE_ONCE(*x, 1);
-}
-
-P2(int *x)
-{
-	WRITE_ONCE(*x, 2);
-}
-
-exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus b/CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
deleted file mode 100644
index 989d99f..0000000
--- a/CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
+++ /dev/null
@@ -1,46 +0,0 @@
-C C-WWC+o-cgt-o+o-cgt-o+o+dstb
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 > 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 > 0)
-		WRITE_ONCE(*x, 1);
-}
-
-P2(int *x)
-{
-	WRITE_ONCE(*x, 2);
-}
-
-/* P3 is to disturb compiler optimization */
-P3(int *x, int *y)
-{
-	int r3;
-	int r4;
-
-	r3 = READ_ONCE(*x);
-	r4 = READ_ONCE(*y);
-	if (r3 < 0)
-		WRITE_ONCE(*y, -1);
-	if (r4 < 0)
-		WRITE_ONCE(*x, -1);
-}
-
-exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus b/CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus
deleted file mode 100644
index bfe5449..0000000
--- a/CodeSamples/formal/herd/C-WWC+o-cgt-o+o-cgt-o+o.litmus
+++ /dev/null
@@ -1,32 +0,0 @@
-C C-WWC+o-cgt-o+o-cgt-o+o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	int r1;
-
-	r1 = READ_ONCE(*x);
-	if (r1 > 0)
-		WRITE_ONCE(*y, 1);
-}
-
-P1(int *x, int *y)
-{
-	int r2;
-
-	r2 = READ_ONCE(*y);
-	if (r2 > 0)
-		WRITE_ONCE(*x, 1);
-}
-
-P2(int *x)
-{
-	WRITE_ONCE(*x, 2);
-}
-
-exists (0:r1=2 /\ 1:r2=1 /\ x=2)
diff --git a/CodeSamples/formal/herd/C-Z6.2+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/herd/C-Z6.2+o-r+a-o+o-mb-o.litmus
deleted file mode 100644
index 9563e6a..0000000
--- a/CodeSamples/formal/herd/C-Z6.2+o-r+a-o+o-mb-o.litmus
+++ /dev/null
@@ -1,36 +0,0 @@
-C C-Z6.2+o-r+a-o+o-mb-o
-
-{
-int x = 0;
-int y = 0;
-int z = 0;
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x, int *y)
-{
-	WRITE_ONCE(*x, 1);
-	smp_store_release(y, 1);
-}
-
-P1(int *y, int *z)
-{
-	int r1;
-
-	r1 = smp_load_acquire(y);
-	WRITE_ONCE(*z, 1);
-}
-
-P2(int *z, int *x)
-{
-	int r3;
-
-	WRITE_ONCE(*z, 2);
-	smp_mb();
-	r2 = READ_ONCE(*x);
-}
-
-exists(1:r1=1 /\ 2:r2=0 /\ z=2)
diff --git a/CodeSamples/formal/herd/C-Z6.2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/herd/C-Z6.2+o-r+a-r+a-r+a-o.litmus
deleted file mode 100644
index 34f7bbb..0000000
--- a/CodeSamples/formal/herd/C-Z6.2+o-r+a-r+a-r+a-o.litmus
+++ /dev/null
@@ -1,40 +0,0 @@
-C C-Z6.2+o-r+a-r+a-r+a-o
-{
-}
-
-{
-#include "api.h"
-}
-
-P0(int *x0, int *x1)
-{
-	WRITE_ONCE(*x0, 2);
-	smp_store_release(x1, 2);
-}
-
-
-P1(int *x1, int *x2)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x1);
-	smp_store_release(x2, 2);
-}
-
-P2(int *x2, int *x3)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x2);
-	smp_store_release(x3, 2);
-}
-
-P3(int *x3, int *x0)
-{
-	int r2;
-
-	r2 = smp_load_acquire(x3);
-	WRITE_ONCE(*x0, 3);
-}
-
-exists (1:r2=2 /\ 2:r2=2 /\ 3:r2=2 /\ x0=2)
diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
deleted file mode 100644
index 96c4495..0000000
--- a/CodeSamples/formal/herd/Makefile
+++ /dev/null
@@ -1,34 +0,0 @@
-LITMUS := $(wildcard *.litmus)
-LITMUS_OUT = $(addsuffix .out,$(LITMUS))
-CCOPTS = -fomit-frame-pointer -O2
-CCOPTS += -I$(shell pwd)
-CUSTOM_HEADER := $(wildcard *.h)
-
-.PHONY: all clean cross-x86 cross-ppc cross-arm cross
-
-all: $(LITMUS_OUT)
-
-%.litmus.out: %.litmus $(CUSTOM_HEADER)
-	litmus7 -r 1000 -carch X86 -ccopts "$(CCOPTS)" $< > $@ 2>&1
-
-cross-x86: TARGET = X86
-cross-x86: cross
-
-cross-ppc: TARGET = PPC
-cross-ppc: cross
-
-cross-arm: TARGET = ARM
-cross-arm: cross
-
-cross:
-	echo > @all
-	for l in $(LITMUS); do \
-	    echo $$l >> @all; \
-	done
-	mkdir -p $(TARGET)
-	litmus7 -r 1000 -carch $(TARGET) -o $(TARGET) @all
-	cp $(CUSTOM_HEADER) $(TARGET)
-
-clean:
-	rm -f *.out
-	rm -f @all
diff --git a/CodeSamples/formal/herd/api.h b/CodeSamples/formal/herd/api.h
deleted file mode 100644
index 0f14a48..0000000
--- a/CodeSamples/formal/herd/api.h
+++ /dev/null
@@ -1,23 +0,0 @@
-#ifndef __API_H__
-#define __API_H__
-#ifndef READ_ONCE
-#define READ_ONCE(x) __atomic_load_n((typeof(x) *)&(x), __ATOMIC_RELAXED)
-#define WRITE_ONCE(x, v) __atomic_store_n((typeof(x) *)&(x), (v), __ATOMIC_RELAXED)
-#define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
-#define smp_rmb() __atomic_thread_fence(__ATOMIC_ACQUIRE) /* outside std. */
-#define smp_wmb() __atomic_thread_fence(__ATOMIC_RELEASE) /* outside std. */
-#define smp_load_acquire(x) __atomic_load_n(x, __ATOMIC_ACQUIRE)
-#define smp_store_release(x, v) __atomic_store_n(x, v, __ATOMIC_RELEASE)
-#define smp_load_acquire(x) __atomic_load_n(x, __ATOMIC_ACQUIRE)
-#define cmpxchg(x, o, n) ({ \
-	typeof(o) __old = (o); \
-	__atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
-	__old; \
-})
-#ifdef __alpha__
-#define lockless_dereference(x) ({ typeof(x) ___x = READ_ONCE(x); smp_mb(); ___x; })
-#else
-#define lockless_dereference(x) READ_ONCE(x)
-#endif
-#endif
-#endif
diff --git a/CodeSamples/formal/litmus/.gitignore b/CodeSamples/formal/litmus/.gitignore
new file mode 100644
index 0000000..a01a568
--- /dev/null
+++ b/CodeSamples/formal/litmus/.gitignore
@@ -0,0 +1,6 @@
+*.out
+/@all
+/X86
+/PPC
+/ARM
+*.tar
diff --git a/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus
new file mode 100644
index 0000000..2ea8808
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus
@@ -0,0 +1,22 @@
+C C-2+2W+o-o+o-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	WRITE_ONCE(*x0, 1);
+	WRITE_ONCE(*x1, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+	WRITE_ONCE(*x1, 1);
+	WRITE_ONCE(*x0, 2);
+}
+
+exists (x0=1 /\ x1=1)
diff --git a/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus b/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
new file mode 100644
index 0000000..a58e637
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
@@ -0,0 +1,26 @@
+C C-2+2W+o-wmb-o+o-wmb-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	WRITE_ONCE(*x0, 1);
+	smp_wmb();
+	WRITE_ONCE(*x1, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x1, 1);
+	smp_wmb();
+	WRITE_ONCE(*x0, 2);
+}
+
+exists (x0=1 /\ x1=1)
diff --git a/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus
new file mode 100644
index 0000000..49a6a52
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus
@@ -0,0 +1,39 @@
+C C-CCIRIW+o+o+o-o+o-o
+
+{
+int x = 0;
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
+P1(int *x)
+{
+	WRITE_ONCE(*x, 2);
+}
+
+P2(int *x)
+{
+	int r1;
+	int r2;
+
+	r1 = READ_ONCE(*x);
+	r2 = READ_ONCE(*x);
+}
+
+P3(int *x)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*x);
+	r4 = READ_ONCE(*x);
+}
+
+exists(2:r1=1 /\ 2:r2=2 /\ 3:r3=2 /\ 3:r4=1)
diff --git a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
new file mode 100644
index 0000000..343fded
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
@@ -0,0 +1,41 @@
+C C-ISA2+o-r+a-r+a-r+a-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	WRITE_ONCE(*x0, 2);
+	smp_store_release(x1, 2);
+}
+
+
+P1(int *x1, int *x2)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x1);
+	smp_store_release(x2, 2);
+}
+
+P2(int *x2, int *x3)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x2);
+	smp_store_release(x3, 2);
+}
+
+P3(int *x3, int *x0)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(x3);
+	r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=2 /\ 2:r2=2 /\ 3:r1=2 /\ 3:r2=0)
diff --git a/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus b/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus
new file mode 100644
index 0000000..d517dae
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus
@@ -0,0 +1,34 @@
+C C-LB+a-o+o-data-o+o-data-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x0);
+	WRITE_ONCE(*x1, 2);
+}
+
+
+P1(int *x1, int *x2)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x1);
+	WRITE_ONCE(*x2, r2);
+}
+
+P2(int *x2, int *x0)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x2);
+	WRITE_ONCE(*x0, r2);
+}
+
+exists (0:r2=2 /\ 1:r2=2 /\ 2:r2=2)
diff --git a/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus b/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus
new file mode 100644
index 0000000..9105d41
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus
@@ -0,0 +1,42 @@
+C C-LB+a-r+a-r+a-r+a-r
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x0);
+	smp_store_release(x1, 2);
+}
+
+
+P1(int *x1, int *x2)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x1);
+	smp_store_release(x2, 2);
+}
+
+P2(int *x2, int *x3)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x2);
+	smp_store_release(x3, 2);
+}
+
+P3(int *x3, int *x0)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x3);
+	smp_store_release(x0, 2);
+}
+
+exists (0:r2=2 /\ 1:r2=2 /\ 2:r2=2 /\ 3:r2=2)
diff --git a/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus b/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
new file mode 100644
index 0000000..a026e2d
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus
@@ -0,0 +1,27 @@
+C C-LB+cmpxchg-ctrl-o+o-ctrl-o
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
+	r1 = cmpxchg(x, 2, 3);
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
diff --git a/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus
new file mode 100644
index 0000000..e97b879
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus
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
diff --git a/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus
new file mode 100644
index 0000000..14539b9
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus
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
diff --git a/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus b/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus
new file mode 100644
index 0000000..d442f76
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus
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
diff --git a/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus b/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus
new file mode 100644
index 0000000..98cbe27
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus
@@ -0,0 +1,37 @@
+C C-LB+o-data-o+o-data-o+o-data-o
+{
+int x0=0;
+int x1=1;
+int x2=2;
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x0);
+	WRITE_ONCE(*x1, r2);
+}
+
+
+P1(int *x1, int *x2)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x1);
+	WRITE_ONCE(*x2, r2);
+}
+
+P2(int *x2, int *x0)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x2);
+	WRITE_ONCE(*x0, r2);
+}
+
+exists (0:r2=2 /\ 1:r2=0 /\ 2:r2=1)
diff --git a/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus
new file mode 100644
index 0000000..8ee530d
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus
@@ -0,0 +1,26 @@
+C C-LB+o-o+o-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x1);
+	WRITE_ONCE(*x0, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x0);
+	WRITE_ONCE(*x1, 2);
+}
+
+exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus b/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus
new file mode 100644
index 0000000..bab943c
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus
@@ -0,0 +1,26 @@
+C C-LB+o-r+a-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x1);
+	smp_store_release(x0, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x0);
+	WRITE_ONCE(*x1, 2);
+}
+
+exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus b/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus
new file mode 100644
index 0000000..ab55690
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus
@@ -0,0 +1,27 @@
+C C-LB+o-r+o-ctrl-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x1);
+	smp_store_release(x0, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x0);
+	if (r2 >= 0)
+		WRITE_ONCE(*x1, 2);
+}
+
+exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus b/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus
new file mode 100644
index 0000000..42df8bf
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus
@@ -0,0 +1,26 @@
+C C-LB+o-r+o-data-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x1);
+	smp_store_release(x0, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	r2 = READ_ONCE(*x0);
+	WRITE_ONCE(*x1, r2);
+}
+
+exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus
new file mode 100644
index 0000000..4b23976
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus
@@ -0,0 +1,28 @@
+C C-MP+o-o+o-rmb-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int* x1) {
+
+	WRITE_ONCE(*x0, 2);
+	WRITE_ONCE(*x1, 2);
+
+}
+
+P1(int* x0, int* x1) {
+
+	int r2;
+	int r3;
+
+	r2 = READ_ONCE(*x1);
+	smp_rmb();
+	r3 = READ_ONCE(*x0);
+
+}
+
+exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus b/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus
new file mode 100644
index 0000000..82cf629
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus
@@ -0,0 +1,27 @@
+C C-MP+o-r+o-ctrl-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int* x1) {
+
+	WRITE_ONCE(*x0, 2);
+	smp_store_release(x1, 2);
+
+}
+
+P1(int* x0, int* x1) {
+	int r2;
+	int r3 = 0;
+
+	r2 = READ_ONCE(*x1);
+	if (r2 >= 0)
+		r3 = READ_ONCE(*x0);
+
+}
+
+exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus
new file mode 100644
index 0000000..117a6e3
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus
@@ -0,0 +1,30 @@
+C C-MP+o-wmb-o+ld-ad-o
+
+{
+int y=1;
+int *x1 = &y;
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int** x1) {
+
+	WRITE_ONCE(*x0, 2);
+	smp_wmb();
+	WRITE_ONCE(*x1, x0);
+
+}
+
+P1(int** x1) {
+
+	int *r2;
+	int r3;
+
+	r2 = lockless_dereference(*x1);
+	r3 = READ_ONCE(*r2);
+
+}
+
+exists (1:r2=x0 /\ 1:r3=1)
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
new file mode 100644
index 0000000..381fea8
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus
@@ -0,0 +1,30 @@
+C C-MP+o-wmb-o+o-ad-o
+
+{
+int y=1;
+int *x1 = &y;
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int** x1) {
+
+	WRITE_ONCE(*x0, 2);
+	smp_wmb();
+	WRITE_ONCE(*x1, x0);
+
+}
+
+P1(int** x1) {
+
+	int *r2;
+	int r3;
+
+	r2 = READ_ONCE(*x1);
+	r3 = READ_ONCE(*r2);
+
+}
+
+exists (1:r2=x0 /\ 1:r3=1)
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus
new file mode 100644
index 0000000..57cda9e
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus
@@ -0,0 +1,28 @@
+C C-MP+o-wmb-o+o-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int* x1) {
+
+	WRITE_ONCE(*x0, 2);
+	smp_wmb();
+	WRITE_ONCE(*x1, 2);
+
+}
+
+P1(int* x0, int* x1) {
+
+	int r2;
+	int r3;
+
+	r2 = READ_ONCE(*x1);
+	r3 = READ_ONCE(*x0);
+
+}
+
+exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus
new file mode 100644
index 0000000..61e23db
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus
@@ -0,0 +1,29 @@
+C C-MP+o-wmb-o+o-rmb-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int* x1) {
+
+	WRITE_ONCE(*x0, 2);
+	smp_wmb();
+	WRITE_ONCE(*x1, 2);
+
+}
+
+P1(int* x0, int* x1) {
+
+	int r2;
+	int r3;
+
+	r2 = READ_ONCE(*x1);
+	smp_rmb();
+	r3 = READ_ONCE(*x0);
+
+}
+
+exists (1:r2=2 /\ 1:r3=0)
diff --git a/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus
new file mode 100644
index 0000000..c5c0242
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus
@@ -0,0 +1,29 @@
+C C-MP-OMCA+o-o-o+o-rmb-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r0;
+
+	WRITE_ONCE(*x, 1);
+	r0 = READ_ONCE(*x);
+	WRITE_ONCE(*y, r0);
+}
+
+P1(int *x, int *y)
+{
+	int r1;
+	int r2;
+
+	r1 = READ_ONCE(*y);
+	smp_rmb();
+	r2 = READ_ONCE(*x);
+}
+
+exists (1:r1=1 /\ 1:r2=0)
diff --git a/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus
new file mode 100644
index 0000000..d4f000c
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus
@@ -0,0 +1,26 @@
+C C-R+o-wmb-o+o-mb-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	WRITE_ONCE(*x0, 1);
+	smp_wmb();
+	WRITE_ONCE(*x1, 1);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x1, 2);
+	smp_mb();
+	r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ x1=2)
diff --git a/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
new file mode 100644
index 0000000..1ff49b1
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus
@@ -0,0 +1,29 @@
+C C-S+o-wmb-o+o-ad-o
+
+{
+int y=1;
+int *x1 = &y;
+}
+
+{
+#include "api.h"
+}
+
+P0(int* x0, int** x1) {
+
+	WRITE_ONCE(*x0, 2);
+	smp_wmb();
+	WRITE_ONCE(*x1, x0);
+
+}
+
+P1(int** x1) {
+
+	int *r2;
+
+	r2 = READ_ONCE(*x1);
+	WRITE_ONCE(*r2, 3);
+
+}
+
+exists (1:r2=x0 /\ x0=2)
diff --git a/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus
new file mode 100644
index 0000000..1093329
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus
@@ -0,0 +1,28 @@
+C C-SB+o-mb-o+o-mb-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x0, 2);
+	smp_mb();
+	r2 = READ_ONCE(*x1);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x1, 2);
+	smp_mb();
+	r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ 0:r2=0)
diff --git a/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus b/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus
new file mode 100644
index 0000000..2e45ee6
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus
@@ -0,0 +1,26 @@
+C C-SB+o-o+o-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x0, 2);
+	r2 = READ_ONCE(*x1);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x1, 2);
+	r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ 0:r2=0)
diff --git a/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus b/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
new file mode 100644
index 0000000..e150296
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus
@@ -0,0 +1,33 @@
+C C-SB-OMCA+o-o-rmb-o+o-o-rmb-o
+
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	int r1;
+	int r2;
+
+	WRITE_ONCE(*x0, 2);
+	r1 = READ_ONCE(*x0);
+	smp_rmb();
+	r2 = READ_ONCE(*x1);
+}
+
+
+P1(int *x0, int *x1)
+{
+	int r1;
+	int r2;
+
+	WRITE_ONCE(*x1, 2);
+	r1 = READ_ONCE(*x1);
+	smp_rmb();
+	r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ 0:r2=0 /\ 1:r1=2 /\ 0:r1=2)
diff --git a/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
new file mode 100644
index 0000000..23050e6
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
@@ -0,0 +1,38 @@
+C C-W+RWC+o-mb-o+a-o+o-mb-o
+
+{
+int x = 0;
+int y = 0;
+int z = 0;
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	WRITE_ONCE(*x, 1);
+	smp_mb();
+	WRITE_ONCE(*y, 1);
+}
+
+P1(int *y, int *z)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(y);
+	r2 = READ_ONCE(*z);
+}
+
+P2(int *z, int *x)
+{
+	int r3;
+
+	WRITE_ONCE(*z, 1);
+	smp_mb();
+	r3 = READ_ONCE(*x);
+}
+
+exists(1:r1=1 /\ 1:r2=0 /\ 2:r3=0)
diff --git a/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus
new file mode 100644
index 0000000..527b373
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus
@@ -0,0 +1,37 @@
+C C-W+RWC+o-r+a-o+o-mb-o
+
+{
+int x = 0;
+int y = 0;
+int z = 0;
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	WRITE_ONCE(*x, 1);
+	smp_store_release(y, 1);
+}
+
+P1(int *y, int *z)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(y);
+	r2 = READ_ONCE(*z);
+}
+
+P2(int *z, int *x)
+{
+	int r3;
+
+	WRITE_ONCE(*z, 1);
+	smp_mb();
+	r3 = READ_ONCE(*x);
+}
+
+exists(1:r1=1 /\ 1:r2=0 /\ 2:r3=0)
diff --git a/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus b/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus
new file mode 100644
index 0000000..602e800
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus
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
diff --git a/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus b/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus
new file mode 100644
index 0000000..6d55ead
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus
@@ -0,0 +1,32 @@
+C C-WRC+o+o-r+a-o
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
+	smp_store_release(y, r1);
+}
+
+P2(int *x, int* y)
+{
+	int r2;
+	int r3;
+
+	r2 = smp_load_acquire(y);
+	r3 = READ_ONCE(*x);
+}
+
+exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
new file mode 100644
index 0000000..c0cbee8
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
@@ -0,0 +1,36 @@
+C C-WWC+o+o-data-o+o-addr-o
+
+{
+int a = 0;
+int b = 0;
+int *c = &b;
+int *x = &a;
+int *y = &b;
+}
+
+{
+#include "api.h"
+}
+
+P0(int **x)
+{
+	WRITE_ONCE(*x, x);
+}
+
+P1(int **x, int **y)
+{
+	int *r1;
+
+	r1 = READ_ONCE(*x);
+	WRITE_ONCE(*y, r1);
+}
+
+P2(int **y, int **c)
+{
+	int *r2;
+
+	r2 = READ_ONCE(*y);
+	WRITE_ONCE(*r2, c);
+}
+
+exists(1:r1=x /\ 2:r2=x /\ x=x)
diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
new file mode 100644
index 0000000..6f0a810
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
@@ -0,0 +1,36 @@
+C C-WWC+o+o-r+o-addr-o
+
+{
+int a = 0;
+int b = 0;
+int *c = &b;
+int *x = &a;
+int *y = &b;
+}
+
+{
+#include "api.h"
+}
+
+P0(int **x)
+{
+	WRITE_ONCE(*x, x);
+}
+
+P1(int **x, int **y)
+{
+	int *r1;
+
+	r1 = READ_ONCE(*x);
+	smp_store_release(y, r1);
+}
+
+P2(int **y, int **c)
+{
+	int *r2;
+
+	r2 = READ_ONCE(*y);
+	WRITE_ONCE(*r2, c);
+}
+
+exists(1:r1=x /\ 2:r2=x /\ x=x)
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
new file mode 100644
index 0000000..015bcd0
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus
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
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus
new file mode 100644
index 0000000..3fcd502
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus
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
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
new file mode 100644
index 0000000..989d99f
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus
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
diff --git a/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus
new file mode 100644
index 0000000..bfe5449
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus
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
diff --git a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
new file mode 100644
index 0000000..9563e6a
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
@@ -0,0 +1,36 @@
+C C-Z6.2+o-r+a-o+o-mb-o
+
+{
+int x = 0;
+int y = 0;
+int z = 0;
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	WRITE_ONCE(*x, 1);
+	smp_store_release(y, 1);
+}
+
+P1(int *y, int *z)
+{
+	int r1;
+
+	r1 = smp_load_acquire(y);
+	WRITE_ONCE(*z, 1);
+}
+
+P2(int *z, int *x)
+{
+	int r3;
+
+	WRITE_ONCE(*z, 2);
+	smp_mb();
+	r2 = READ_ONCE(*x);
+}
+
+exists(1:r1=1 /\ 2:r2=0 /\ z=2)
diff --git a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus
new file mode 100644
index 0000000..34f7bbb
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus
@@ -0,0 +1,40 @@
+C C-Z6.2+o-r+a-r+a-r+a-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x0, int *x1)
+{
+	WRITE_ONCE(*x0, 2);
+	smp_store_release(x1, 2);
+}
+
+
+P1(int *x1, int *x2)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x1);
+	smp_store_release(x2, 2);
+}
+
+P2(int *x2, int *x3)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x2);
+	smp_store_release(x3, 2);
+}
+
+P3(int *x3, int *x0)
+{
+	int r2;
+
+	r2 = smp_load_acquire(x3);
+	WRITE_ONCE(*x0, 3);
+}
+
+exists (1:r2=2 /\ 2:r2=2 /\ 3:r2=2 /\ x0=2)
diff --git a/CodeSamples/formal/litmus/Makefile b/CodeSamples/formal/litmus/Makefile
new file mode 100644
index 0000000..96c4495
--- /dev/null
+++ b/CodeSamples/formal/litmus/Makefile
@@ -0,0 +1,34 @@
+LITMUS := $(wildcard *.litmus)
+LITMUS_OUT = $(addsuffix .out,$(LITMUS))
+CCOPTS = -fomit-frame-pointer -O2
+CCOPTS += -I$(shell pwd)
+CUSTOM_HEADER := $(wildcard *.h)
+
+.PHONY: all clean cross-x86 cross-ppc cross-arm cross
+
+all: $(LITMUS_OUT)
+
+%.litmus.out: %.litmus $(CUSTOM_HEADER)
+	litmus7 -r 1000 -carch X86 -ccopts "$(CCOPTS)" $< > $@ 2>&1
+
+cross-x86: TARGET = X86
+cross-x86: cross
+
+cross-ppc: TARGET = PPC
+cross-ppc: cross
+
+cross-arm: TARGET = ARM
+cross-arm: cross
+
+cross:
+	echo > @all
+	for l in $(LITMUS); do \
+	    echo $$l >> @all; \
+	done
+	mkdir -p $(TARGET)
+	litmus7 -r 1000 -carch $(TARGET) -o $(TARGET) @all
+	cp $(CUSTOM_HEADER) $(TARGET)
+
+clean:
+	rm -f *.out
+	rm -f @all
diff --git a/CodeSamples/formal/litmus/api.h b/CodeSamples/formal/litmus/api.h
new file mode 100644
index 0000000..0f14a48
--- /dev/null
+++ b/CodeSamples/formal/litmus/api.h
@@ -0,0 +1,23 @@
+#ifndef __API_H__
+#define __API_H__
+#ifndef READ_ONCE
+#define READ_ONCE(x) __atomic_load_n((typeof(x) *)&(x), __ATOMIC_RELAXED)
+#define WRITE_ONCE(x, v) __atomic_store_n((typeof(x) *)&(x), (v), __ATOMIC_RELAXED)
+#define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
+#define smp_rmb() __atomic_thread_fence(__ATOMIC_ACQUIRE) /* outside std. */
+#define smp_wmb() __atomic_thread_fence(__ATOMIC_RELEASE) /* outside std. */
+#define smp_load_acquire(x) __atomic_load_n(x, __ATOMIC_ACQUIRE)
+#define smp_store_release(x, v) __atomic_store_n(x, v, __ATOMIC_RELEASE)
+#define smp_load_acquire(x) __atomic_load_n(x, __ATOMIC_ACQUIRE)
+#define cmpxchg(x, o, n) ({ \
+	typeof(o) __old = (o); \
+	__atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
+	__old; \
+})
+#ifdef __alpha__
+#define lockless_dereference(x) ({ typeof(x) ___x = READ_ONCE(x); smp_mb(); ___x; })
+#else
+#define lockless_dereference(x) READ_ONCE(x)
+#endif
+#endif
+#endif
-- 
2.7.4

