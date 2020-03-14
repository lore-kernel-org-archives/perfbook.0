Return-Path: <SRS0=cZgG=47=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ACg+WR30dNJJyswlk8GSpKGDggiGc8maZXu5t3I9o0=;
        b=NAmyz9TWkmUkLS61rVm7g7sh504EdOj78V3POPlWpsSvyhOVLunVETqmklmFJDKt+j
         pxBx/9uE4p0ngpd1aRjcnCAgJNXhKMnhuG/fAp9h+Ij6Dd3JO5VeFJbfZ629m9tOw8SP
         q1CZmUpYHZEso3GJ3qmA0YsIdXPJJTjwC5QgYhi+M+kYcEyk+EaFjTRo2LYcRzq85hcr
         RWgtwfTgJvintKeXl6n8TkD/srwWXUVu+gJDE2RKj2+6KSOZ/H9UCXswdmaUCgt3u0By
         5FIl5XRP7S8cCOqC3BwyNl9/TsThK+FoQR9z4g3d+crd/SR0TqdvDZOBSRDHDwR0sOfp
         eeDw==
Subject: [PATCH 4/4] formal/axiomatic: Move table env next to QQA's first
 paragraph
References: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4c80c176-0613-3464-4274-6823036990f6@gmail.com>
Date: Sun, 15 Mar 2020 00:17:23 +0900
MIME-Version: 1.0
In-Reply-To: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 530d73392e389c1775946078391e9f017a4d9dad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 14 Mar 2020 19:33:42 +0900
Subject: [PATCH 4/4] formal/axiomatic: Move table env next to QQA's first paragraph

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 26e3f1ac..1565f413 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -188,6 +188,22 @@ And in this case, the \co{herd} tool's output features the string
 	Why bother modeling locking directly?
 	Why not simply emulate locking with atomic operations?
 \QuickQuizAnswer{
+	In a word, performance, as can be seen in
+	Table~\ref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
+	The first column shows the number of herd processes modeled.
+	The second column shows the herd runtime when modeling
+	\co{spin_lock()} and \co{spin_unlock()} directly in herd's
+	cat language.
+	The third column shows the herd runtime when emulating
+	\co{spin_lock()} with \co{cmpxchg_acquire()} and \co{spin_unlock()}
+	with \co{smp_store_release()}, using the herd \co{filter}
+	clause to reject executions that fail to acquire the lock.
+	The fourth column is like the third, but using \co{xchg_acquire()}
+	instead of \co{cmpxchg_acquire()}.
+	The fifth and sixth columns are like the third and fourth,
+	but instead using the herd \co{exists} clause to reject
+	executions that fail to acquire the lock.
+
 \begin{table}[tb]
 \rowcolors{2}{}{lightgray}
 \small
@@ -210,21 +226,6 @@ And in this case, the \co{herd} tool's output features the string
 \caption{Locking: Modeling vs. Emulation Time (s)}
 \label{tab:formal:Locking: Modeling vs. Emulation Time (s)}
 \end{table}
-	In a word, performance, as can be seen in
-	Table~\ref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
-	The first column shows the number of herd processes modeled.
-	The second column shows the herd runtime when modeling
-	\co{spin_lock()} and \co{spin_unlock()} directly in herd's
-	cat language.
-	The third column shows the herd runtime when emulating
-	\co{spin_lock()} with \co{cmpxchg_acquire()} and \co{spin_unlock()}
-	with \co{smp_store_release()}, using the herd \co{filter}
-	clause to reject executions that fail to acquire the lock.
-	The fourth column is like the third, but using \co{xchg_acquire()}
-	instead of \co{cmpxchg_acquire()}.
-	The fifth and sixth columns are like the third and fourth,
-	but instead using the herd \co{exists} clause to reject
-	executions that fail to acquire the lock.
 
 	Note also that use of the \co{filter} clause is about twice
 	as fast as is use of the \co{exists} clause.
-- 
2.17.1


