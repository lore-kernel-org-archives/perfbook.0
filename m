Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I4ZR8aqtg0adoZ8KDJuS6O9823cnv42/cHdnhDauRBk=;
 b=h3YlwvZ+KVINJRnUhbNRQaIIXKAna7kDh2blSBeS9e54+8Dlpi+mJTe2FQSkOAHdn6
 H6FcIXG2nKUyQiLsrjJvsgQpLAevlggwk2W5bUzYqn46lgsPu41LlQC3CDUYFZ+Gxabz
 1eQdG4deeErborsWu6rc9NTEHOQrJgJvOGmZssM+avFqtiZe5cy0TCoeWUszGn3dxUf0
 ncqEIgbo/Af5qWdpGvbMoWgg1yRZAlP64yX1v8vfKWw6VwDSoIP6GSX99/chnUz9VtQc
 uyGupAMCziwMAYlrVOEsWWlExnB/m0sJF0MQn5Qpb9vqMOyeErMnokm/AUkHPUIGSqGf
 0Y8g==
Subject: [PATCH 2/2] CodeSamples/formal/litmus: Fix type of 2:r2 in
 C-WWC+o+o-*.litmus test
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dd7c329d-ff4f-7f26-c08e-aeb0a930ae4c@gmail.com>
Date: Wed, 22 Nov 2017 00:36:34 +0900
MIME-Version: 1.0
In-Reply-To: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 180abe9a72d4e3fbe200ce2a032a6c616a70ce03 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 21 Nov 2017 22:26:53 +0900
Subject: [PATCH 2/2] CodeSamples/formal/litmus: Fix type of 2:r2 in C-WWC+o+o-*.litmus test

This change gets rid of warnings in klitmus7 cross-compile:

-------
In file included from include/uapi/linux/stddef.h:1:0,
                 from include/linux/stddef.h:4,
                 from ./include/uapi/linux/posix_types.h:4,
                 from include/uapi/linux/types.h:13,
                 from include/linux/types.h:5,
                 from include/linux/list.h:4,
                 from include/linux/module.h:9,
                 from [...]/CodeSamples/formal/herd/klitmus/litmus012.c:11:
[...]/CodeSamples/formal/herd/klitmus/litmus012.c: In function 'code2':
include/linux/compiler.h:297:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
   { .__val = (__force typeof(x)) (val) }; \
              ^
[...]/CodeSamples/formal/herd/klitmus/litmus012.c:414:2: note: in expansion of macro 'WRITE_ONCE'
  WRITE_ONCE(*r2, c);
  ^
-------

r2 is declared as "int *r2;", and WRITE_ONCE(*r2, c) will store to an
int variable. r2 should have been "int**" type.

Also revert the variable used in the WRITE_ONCE to "a" as had been
before the changes listed in the "Fixes:" tags below.

Fixes: d78c5805a715 ("advsync: Fix C-WWC+o+o-data-o+o-addr-o litmus tests")
Fixes: f0222eae620f ("advsync: Fix C-WWC+o+o-r+o-addr-o litmus tests")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus | 9 ++++-----
 CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
index c0cbee8..cd9df06 100644
--- a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
@@ -3,7 +3,6 @@ C C-WWC+o+o-data-o+o-addr-o
 {
 int a = 0;
 int b = 0;
-int *c = &b;
 int *x = &a;
 int *y = &b;
 }
@@ -25,12 +24,12 @@ P1(int **x, int **y)
 	WRITE_ONCE(*y, r1);
 }

-P2(int **y, int **c)
+P2(int **y, int *a)
 {
-	int *r2;
+	int **r2;

-	r2 = READ_ONCE(*y);
-	WRITE_ONCE(*r2, c);
+	r2 = (int**)READ_ONCE(*y);
+	WRITE_ONCE(*r2, a);
 }

 exists(1:r1=x /\ 2:r2=x /\ x=x)
diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
index 6f0a810..6a65d67 100644
--- a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
@@ -3,7 +3,6 @@ C C-WWC+o+o-r+o-addr-o
 {
 int a = 0;
 int b = 0;
-int *c = &b;
 int *x = &a;
 int *y = &b;
 }
@@ -25,12 +24,12 @@ P1(int **x, int **y)
 	smp_store_release(y, r1);
 }

-P2(int **y, int **c)
+P2(int **y, int *a)
 {
-	int *r2;
+	int **r2;

-	r2 = READ_ONCE(*y);
-	WRITE_ONCE(*r2, c);
+	r2 = (int**)READ_ONCE(*y);
+	WRITE_ONCE(*r2, a);
 }

 exists(1:r1=x /\ 2:r2=x /\ x=x)
-- 
2.7.4


