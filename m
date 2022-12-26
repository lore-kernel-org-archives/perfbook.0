Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672078621;
	bh=m+H7eqfNBE9aSNVeN/y9sb85jCpjZ/w1uGtIW7Ivjp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JobduoUv90tdHuSVWM1YHMf1h5HKYoC16y6jIYak9/YhYCrPzpyPotw7lGlO4VrgM
	 sgEbDnDpBfoKiQ/0yyy7qDc+75qHLSPxbiK9molf8Aaazz8LiDi4sJ4kN/7+T9V6nr
	 a5VjIyg/xYWfnBB3A7YRQ8J/uAqpvx3tKmPOKUPmYRrBMowjDx94A0SjA9eYJ080Pw
	 eTiUxt6gtYa8w9vaSVSNw6GqL9UhDdaZSclNF6UroFqY9qR/BzsxP9iXA9q1zmQrgo
	 MCkYYMwzaHSAWfTBlE1TYjx1IZrrG16k39Dads3kfuKMkbqc/BSm9oQNKXBUBZVcNT
	 RBnmvM2JETJPQ==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 4/4] datastruct: Put \cref{} content in a single line
Date: Mon, 26 Dec 2022 10:16:39 -0800
Message-Id: <20221226181639.10795-10-sj@kernel.org>
In-Reply-To: <20221226181639.10795-1-sj@kernel.org>
References: <20221226181639.10795-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Every \cref{} content is in a single line and it helps grep-like
scripting.  However two \cref{}s are broken into two lines.  Make those
single lines for consistency and easier grep.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 9dffaf37..4c7f9fe2 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1551,8 +1551,7 @@ and \clnref{acq_oldcur} acquires that bucket's spinlock.
 	\co{hashtab_del()} functions must be enclosed
 	in RCU read-side critical sections, courtesy of
 	\co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()} in
-	\cref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency
-	Control}.
+	\cref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.
 	\end{fcvref}
 }\QuickQuizEnd
 
@@ -1584,8 +1583,7 @@ the old hash table, and finally \clnref{ret_success} returns success.
 	\begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod]
 	Together with the \co{READ_ONCE()}
 	on \clnref{l:ifresized} in \co{hashtab_lock_mod()}
-	of \cref{lst:datastruct:Resizable Hash-Table Update-Side
-	Concurrency Control},
+	of \cref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control},
 	it tells the compiler that the non-initialization accesses
 	to \co{->ht_resize_cur} must remain because reads
 	from \co{->ht_resize_cur} really can race with writes,
-- 
2.17.1

