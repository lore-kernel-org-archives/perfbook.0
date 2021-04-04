Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1F+kEuyoXhjqL/yafL2+VbtCGtGgNLgSACfLZjSw+Cc=;
        b=ldO3WZczWo1SoKh769M1FKu4QukuW6/JsNotYAebl/NTQ09CcIYZMI+38wVn2OaYlV
         H/YFrpqf1ENf88GEvoCwW8pBGlhUq9EiVIjXbdGkc9vxf0ooevFNizRcQhjAvR+GjzOe
         VLp3kv83I+iuD4NBOlUyCzQe2sOGKHa220R5Pi/4c4H4WkQ0WMbNNPPjFiW5MrMKTkYW
         VIn/6xnl2ZaR9xAgGim+BhFXoIZLNBUCcsTru6SCjUbCwxl9VbBAVhDqlPRZtRupTx9e
         4p7F6FQZV4+8gE6rZuhuKOp7rbEjGVkpFDuFMtgPGQPUopEkZAT3GdNenKbHzYM4x2kR
         Hcbg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 1/4] howto: Use '\cref' and '\Cref' instead of 'Chapter~\ref'
Date: Sun,  4 Apr 2021 12:05:00 +0200
Message-Id: <20210404100503.20978-2-sj38.park@gmail.com>
In-Reply-To: <20210404100503.20978-1-sj38.park@gmail.com>
References: <20210404100503.20978-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit replaces 'Chapter~\ref' with '\cref' and '\Cref'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 7de1dbd9..627ae776 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -56,22 +56,22 @@ that it has brought to us!
 This book is a handbook of widely applicable and heavily
 used design techniques, rather than
 a collection of optimal algorithms with tiny areas of applicability.
-You are currently reading Chapter~\ref{chp:How To Use This Book}, but
+You are currently reading \cref{chp:How To Use This Book}, but
 you knew that already.
-Chapter~\ref{chp:Introduction} gives a high-level overview of parallel
+\Cref{chp:Introduction} gives a high-level overview of parallel
 programming.
 
-Chapter~\ref{chp:Hardware and its Habits} introduces shared-memory
+\Cref{chp:Hardware and its Habits} introduces shared-memory
 parallel hardware.
 After all, it is difficult to write good parallel code unless you
 understand the underlying hardware.
 Because hardware constantly evolves, this chapter will always be
 out of date.
 We will nevertheless do our best to keep up.
-Chapter~\ref{chp:Tools of the Trade} then provides a very brief overview
+\Cref{chp:Tools of the Trade} then provides a very brief overview
 of common shared-memory parallel-programming primitives.
 
-Chapter~\ref{chp:Counting} takes an in-depth look at parallelizing
+\Cref{chp:Counting} takes an in-depth look at parallelizing
 one of the simplest problems imaginable, namely counting.
 Because almost everyone has an excellent grasp of counting, this chapter
 is able to delve into many important parallel-programming issues without
@@ -79,9 +79,9 @@ the distractions of more-typical computer-science problems.
 My impression is that this chapter has seen the greatest use in
 parallel-programming coursework.
 
-Chapter~\ref{cha:Partitioning and Synchronization Design}
+\Cref{cha:Partitioning and Synchronization Design}
 introduces a number of design-level methods of addressing the issues
-identified in Chapter~\ref{chp:Counting}.
+identified in \cref{chp:Counting}.
 It turns out that it is important to address parallelism at
 the design level when feasible:
 To paraphrase \pplsur{Edsger W.}{Dijkstra}~\cite{Dijkstra:1968:LEG:362929.362947},
@@ -90,40 +90,40 @@ suboptimal''~\cite{PaulEMcKenney2012HOTPARsuboptimal}.
 
 The next three chapters examine three important approaches to
 synchronization.
-Chapter~\ref{chp:Locking} covers locking, which is still not only the
+\Cref{chp:Locking} covers locking, which is still not only the
 workhorse of production-quality parallel programming, but is also widely
 considered to be parallel programming's worst villain.
-Chapter~\ref{chp:Data Ownership} gives a brief overview of data ownership,
+\Cref{chp:Data Ownership} gives a brief overview of data ownership,
 an often overlooked but remarkably pervasive and powerful approach.
-Finally, Chapter~\ref{chp:Deferred Processing} introduces a number of
+Finally, \cref{chp:Deferred Processing} introduces a number of
 deferred-processing mechanisms, including reference counting,
 hazard pointers, sequence locking, and RCU\@.
 
-Chapter~\ref{chp:Data Structures} applies the lessons of previous
+\Cref{chp:Data Structures} applies the lessons of previous
 chapters to hash tables, which are heavily used due
 to their excellent partitionability, which (usually) leads to excellent
 performance and scalability.
 
 As many have learned to their sorrow, parallel programming without
 validation is a sure path to abject failure.
-Chapter~\ref{chp:Validation} covers various forms of testing.
+\Cref{chp:Validation} covers various forms of testing.
 It is of course impossible to test reliability into your program
-after the fact, so Chapter~\ref{chp:Formal Verification}
+after the fact, so \cref{chp:Formal Verification}
 follows up with a brief overview of a couple of practical approaches to
 formal verification.
 
-Chapter~\ref{chp:Putting It All Together}
+\Cref{chp:Putting It All Together}
 contains a series of moderate-sized parallel programming problems.
 The difficulty of these problems vary, but should be appropriate for
 someone who has mastered the material in the previous chapters.
 
-Chapter~\ref{sec:advsync:Advanced Synchronization}
+\Cref{sec:advsync:Advanced Synchronization}
 looks at advanced synchronization methods, including
 non-blocking synchronization and parallel real-time computing,
-while Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}
+while \cref{chp:Advanced Synchronization: Memory Ordering}
 covers the advanced topic of memory ordering.
-Chapter~\ref{chp:Ease of Use} follows up with some ease-of-use advice.
-Chapter~\ref{chp:Conflicting Visions of the Future}
+\Cref{chp:Ease of Use} follows up with some ease-of-use advice.
+\Cref{chp:Conflicting Visions of the Future}
 looks at a few possible future directions, including
 shared-memory parallel system design, software and hardware transactional
 memory, and functional programming for parallelism.
@@ -552,6 +552,6 @@ The style for this particular book is documented in
 
 As noted at the beginning of this section, I am this book's editor.
 However, if you choose to contribute, it will be your book as well.
-In that spirit, I offer you Chapter~\ref{chp:Introduction}, our introduction.
+In that spirit, I offer you \cref{chp:Introduction}, our introduction.
 
 \QuickQuizAnswersChp{qqzhowto}
-- 
2.17.1

