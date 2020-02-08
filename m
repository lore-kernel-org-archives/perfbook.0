Return-Path: <SRS0=RuZN=34=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=BWkV69iueCtk0FjO8HkSPNauMa4fnK2HZHwFjPmV748=;
        b=l4iP+33SGsAkvqbWQkm+m9kk68lfzfMaMsaF2Y8+oPACCRvwYEdVchkkii/p8XpiAE
         8pfOvn8JR/0eO/HNmTofFA9RVKoEjAYd9KMRwQzRNFQJSSgStT/oSihINxb1h6Kca4bG
         x0u0QWuglUwBn1bTzPRxF9D4TdJiROagw+GZP2MLQKgQSaNHPV1JKCg+uZUgbvnr961F
         gLMtQMO5TFs9JnoRAj0p21rO8gK75ZO4KKJobe/Qg2i/neNi1s/ZY8vhHk2N/PkCgrw4
         mOe/+Z7rWc9Zbo1ZrjnUmOzN51TFATGeBM3ou4kyP2nJZ0//qx49u9Jbb/Ml+s53dunM
         dDTA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
Message-ID: <74a6c257-cf2a-315d-202a-a109c874e843@gmail.com>
Date: Sat, 8 Feb 2020 21:03:10 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 66df1c9aaaefb2ef5ccfd0c23837b33218a24f30 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 8 Feb 2020 08:29:08 +0900
Subject: [PATCH] SMPdesign: Fix meaningless consecutive blank pages

In the introduction of Dining Philosophers, there is two-page
"think about it" gap before presenting an answer.

Let's see what we need for print editions.

When the question is on an odd page, the answer can be on the next page
(the other side of the question's page).
When the question is on an even page, the answer should be on the
next even page to prevent it from being spotted too early.

For electronic editions, there needs to be a gap of at least one
page regardless of the question's position.

As \cleardoublepage changes its behavior depending on whether it is
on an odd page (one blank page) or on an even page (nothing), it
can not cover the requirement for electronic editions.

For our purpose, the sequence of \clearpage, "((Intentional blank page)",
and another \clearpage should suffice.

Reported-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/partexercises.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 5d1f1fb0..4ceaefeb 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -107,9 +107,9 @@ philosophers to eat concurrently.
 Please think about ways of partitioning the Dining Philosophers Problem
 before reading further.
 
-\pagebreak
+\clearpage
 (Intentional blank page)
-\cleardoublepage
+\clearpage
 
 \begin{figure}[tb]
 \centering
-- 
2.17.1

