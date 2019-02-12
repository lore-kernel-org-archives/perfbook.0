Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jm3gVMuOlFT2jGEsFyG6fDD8+Qme4/Hq4yfQ+LEa6Wo=;
        b=GdFeFkkqY0ZHr6D5Jbbq6aanJ+sly/e/Wagz6x023DWjvpQdPU7E1fC+sOuLbiCOX2
         UC4PPWhtpG9QkhHZ2M9UOTmyT+kBObcFEUFxSHkhHNbKNWY/Bo0AJBPktKrc+lZFpTJe
         J0bEkn06ExjKl8c32biug6i8UaZ/AT75csjvzyPhRe5w0tBZrkp+7KnTqP0lEJhqpmiV
         IWUhY1qy5vtTy5gLmnKBKc6QZ0EAe3jje24TeZ1eV9A7v7gy/WoHoUa9w6HC5uQ9IJfH
         daN0NHgS7KB4xBeGnfHZ+ZpG9jfUyvbH32156wypbWReWhyNIQTbIGaPNnK8pgtVaV3C
         mDCw==
Subject: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray litmus
 test
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f824fa58-c67a-afb5-68e2-cac8cf86660e@gmail.com>
Date: Wed, 13 Feb 2019 00:39:38 +0900
MIME-Version: 1.0
In-Reply-To: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0ddf5c5ea4a66a0d6bff1b6c0ce32682459c20ad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Feb 2019 23:18:29 +0900
Subject: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray litmus test

C-SB+o-rcusync-o+rl-rul-o.litmus is identical to
C-SB+o-rcusync-o+rl-o-rul-o.litmus and causes "make" to emit
warning:

    target 'CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o@whole.fcv'
    given more than once in the same rule

This commit removes "snippet" meta commands in the test.
Just removing the file can cause a build error afterward.
A "make clean" will resolve the error, but keeping the file
looks like a reasonable approach to avoid surprising people.
The file can be removed in the near future when most active
users have updated snippets.d.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus | 2 --
 1 file changed, 2 deletions(-)

diff --git a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
index a39baf3..2407a51 100644
--- a/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
+++ b/CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
@@ -1,5 +1,4 @@
 C C-SB+o-rcusync-o+rl-o-rul-o
-//\begin[snippet][labelbase=ln:formal:C-SB+o-rcusync-o+rl-o-rul-o:whole,commandchars=\@\[\]]
 {
 }
 
@@ -19,5 +18,4 @@ P1(uintptr_t *x0, uintptr_t *x1)
 	uintptr_t r2 = READ_ONCE(*x0);
 }
 
-//\end[snippet]
 exists (1:r2=0 /\ 0:r2=0)
-- 
2.7.4


