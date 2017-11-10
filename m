Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Blfo9ZYnIMM9/eCwDOxLfO/K/NDHB7hrm8Jk3u0rFcI=;
 b=V/50qRM373hz1ZPqN8PKEzSnj+IVJfw2cKqLq3od9ARttaso3XQk7dgJv6mHjzzZtU
 SNpUSmu2e7VYKZ0Lox8ekdCAxR+EOE9mqGhnxT/7NXX82utCUCPiAeNMvFenzPWC4haI
 y+jFBIqMB2pXhiITL83l08FzdRfZlpAVSGmzp1ZKFem2aqqk7Jc3Xns6UwE59ppU20mx
 RV2zPG+5RY6Edq4SEFXWO4QULYttZYyTpxqf/6eTuPS+u17pbfkf7HBNpC6ecpc0PpYg
 lPKMCK9XvVSKquiCQGwNxKwopPoMheOZVi9yHsU/qa2RahZzQQawtfzJcrT8XvUZwe7q
 L2FA==
Subject: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross
 compiling
References: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <61f6fcf3-480c-8ba4-a4b2-4af17546b53f@gmail.com>
Date: Sat, 11 Nov 2017 08:41:54 +0900
MIME-Version: 1.0
In-Reply-To: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6ecff66f2b5f95e914d90e29b6d0a2eb4d8901cc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Nov 2017 08:25:34 +0900
Subject: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross compiling

Also fix corresponding code snippet.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus | 2 --
 CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus  | 2 +-
 memorder/memorder.tex                                   | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus b/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
index a58e637..7f06c85 100644
--- a/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
+++ b/CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus
@@ -16,8 +16,6 @@ P0(int *x0, int *x1)

 P1(int *x0, int *x1)
 {
-	int r2;
-
 	WRITE_ONCE(*x1, 1);
 	smp_wmb();
 	WRITE_ONCE(*x0, 2);
diff --git a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
index 9563e6a..8d766bf 100644
--- a/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
+++ b/CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus
@@ -26,7 +26,7 @@ P1(int *y, int *z)

 P2(int *z, int *x)
 {
-	int r3;
+	int r2;

 	WRITE_ONCE(*z, 2);
 	smp_mb();
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 28be8b2..7d8e497 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2824,7 +2824,7 @@ P1(int *y, int *z)

 P2(int *z, int *x)
 {
-  int r3;
+  int r2;

   WRITE_ONCE(*z, 2);
   smp_mb();
-- 
2.7.4


