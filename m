Return-Path: <SRS0=pVRY=DD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WjGn4bc3EMERao4ov1O0M3k9TONmlVG7TX9u5iGhC1g=;
        b=aCr96sFAJOM83DCLXKR2xVNWn1aeGOFFROiTiOZy3+dwCizMHRgqYWbcIuoDU9eTb2
         1Or/V9irjnh9Sslhn+l0EgPaBHhw1qdM/bi1LK3OcMIS6n2877FonueGm6Fq2bGLjT1M
         csMpvTeWjCyv+pVNA9DhmcnpfNbzxKRNXQBq2o6qWYGqiO6k9mQg9h1DTnHZlJoHRKLM
         a0gTtMMUOkFeEVm3gqTX5Weu5oRVDdlAXpixPOLdBraUObepkxMyimNpIRJ14RqkGTwW
         WI3XsP9puhcHNlpmu11vBwfyHAStXzLMvEJ57o5N43pf8BYaDeFjTp61lxCumGO8afpC
         9TKg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] CodeSamples/formal: Add pointer cast in WRITE_ONCE() for
 Linux v5.8 compat
Message-ID: <2cbc9fb0-2e93-a8bd-bed3-4cea039e88ca@gmail.com>
Date: Sat, 26 Sep 2020 12:32:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 456d16d1450416bbd4eeea175a4bc0c2f819062d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Sep 2020 12:11:37 +0900
Subject: [PATCH] CodeSamples/formal: Add pointer cast in WRITE_ONCE() for Linux v5.8 compat

On Linux v5.8, "make" under klitmus/ after "make cross-klitmus" at
CodeSamples/formal/herd/ doesn't complete with the following error:

    In file included from ./include/linux/export.h:43,
                     from ./include/linux/linkage.h:7,
                     from ./include/linux/kernel.h:8,
                     from ./include/linux/list.h:9,
                     from ./include/linux/module.h:12,
                     from [...]/CodeSamples/fromal/herd/klitmus/litmus030.c:11:
    [...]/CodeSamples/formal/herd/klitmus/litmus030.c: In function 'code0':
    ./include/linux/compiler.h:297:30: error: assignment to 'int * volatile'
    from incomatible pointer type 'int **' [-Werror=incompatible-pointer-types]
      297 |  *(volatile typeof(x) *)&(x) = (val);   \
          |                              ^

    ./include/linux/compiler.h:303:2: note: in expansion of macro '__WRITE_ONCE'
      303 |  __WRITE_ONCE(x, val);    \
          |  ^~~~~~~~~~~~

    [...]/CodeSamples/formal/herd/klitmus/litmus030.c:363:2: note: in expansion
    of macro 'WRITE_ONCE'
      363 |  WRITE_ONCE(*x, x);
          |  ^~~~~~~~~~

    cc1: some warnings being treated as errors

This is due to the simplification of WRITE_ONCE() [1].
Now WRITE_ONCE() catches type mismatch of its arguments.

Adding a pointer cast to the WRITE_ONCE() argumant:

    WRITE_ONCE(*x, (int*)x);

makes the compiler happy.

[1]: https://git.kernel.org/linus/a5460b5e5fb8
     ("READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()")

NOTE1: These litmus tests are converted from those under
       CodeSamples/formal/litmus/.
NOTE2: They were once presented as code snippets in perfbook.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus | 2 +-
 CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
index cd9df060..3525e033 100644
--- a/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus
@@ -13,7 +13,7 @@ int *y = &b;
 
 P0(int **x)
 {
-	WRITE_ONCE(*x, x);
+	WRITE_ONCE(*x, (int*)x);
 }
 
 P1(int **x, int **y)
diff --git a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
index 6a65d674..0d16b2f7 100644
--- a/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
+++ b/CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus
@@ -13,7 +13,7 @@ int *y = &b;
 
 P0(int **x)
 {
-	WRITE_ONCE(*x, x);
+	WRITE_ONCE(*x, (int*)x);
 }
 
 P1(int **x, int **y)
-- 
2.17.1

