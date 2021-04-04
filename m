Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XXcVemyBLYApcspxOjvTbYhTmhU9bJuS6GZb3Lg0x3Y=;
        b=lBi1PRkmwXncHPcx+9fvCW6H2ORiJe8apRRzL4kTE3pK02qCuXA33km+bjFywWwx1o
         g3mRKgWyclNWgc7gabBmmhcQmQotawoxlWGQd1Dugl9arwvR79nuk3O46oUj85+9HCW3
         x75mZFm8dOFCEmFLIYZoYf3/NPzPlnKtCsRVqzAEJ+jg8fwIL+TXNGTidqcAwFpBqQrj
         w83nKGOIrPnuHRS1POhHfhB2EQYhqehOiYDcYivqDytuxAoWS28HoJ896rIuG1tl/qgb
         DJ2+Zn46h081kDpfCb5Ow45Be+DJQ1/1QV4T4u5aAqYDW6RWena27FcP9p5PxGTj1Ipa
         etog==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/4] howto: Use '\cref' consistently
Date: Sun,  4 Apr 2021 09:50:07 +0200
Message-Id: <20210404075010.15858-2-sj38.park@gmail.com>
In-Reply-To: <20210404075010.15858-1-sj38.park@gmail.com>
References: <20210404075010.15858-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

'howto' chapter is using mix of '\cref' and 'Chapter~\ref'.  This commit
makes it to consistently use the shorter one, '\cref'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 7de1dbd9..4a00bb3c 100644
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
+\cref{chp:Introduction} gives a high-level overview of parallel
 programming.
 
-Chapter~\ref{chp:Hardware and its Habits} introduces shared-memory
+\cref{chp:Hardware and its Habits} introduces shared-memory
 parallel hardware.
 After all, it is difficult to write good parallel code unless you
 understand the underlying hardware.
 Because hardware constantly evolves, this chapter will always be
 out of date.
 We will nevertheless do our best to keep up.
-Chapter~\ref{chp:Tools of the Trade} then provides a very brief overview
+\cref{chp:Tools of the Trade} then provides a very brief overview
 of common shared-memory parallel-programming primitives.
 
-Chapter~\ref{chp:Counting} takes an in-depth look at parallelizing
+\cref{chp:Counting} takes an in-depth look at parallelizing
 one of the simplest problems imaginable, namely counting.
 Because almost everyone has an excellent grasp of counting, this chapter
 is able to delve into many important parallel-programming issues without
@@ -79,9 +79,9 @@ the distractions of more-typical computer-science problems.
 My impression is that this chapter has seen the greatest use in
 parallel-programming coursework.
 
-Chapter~\ref{cha:Partitioning and Synchronization Design}
+\cref{cha:Partitioning and Synchronization Design}
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
+\cref{chp:Locking} covers locking, which is still not only the
 workhorse of production-quality parallel programming, but is also widely
 considered to be parallel programming's worst villain.
-Chapter~\ref{chp:Data Ownership} gives a brief overview of data ownership,
+\cref{chp:Data Ownership} gives a brief overview of data ownership,
 an often overlooked but remarkably pervasive and powerful approach.
-Finally, Chapter~\ref{chp:Deferred Processing} introduces a number of
+Finally, \cref{chp:Deferred Processing} introduces a number of
 deferred-processing mechanisms, including reference counting,
 hazard pointers, sequence locking, and RCU\@.
 
-Chapter~\ref{chp:Data Structures} applies the lessons of previous
+\cref{chp:Data Structures} applies the lessons of previous
 chapters to hash tables, which are heavily used due
 to their excellent partitionability, which (usually) leads to excellent
 performance and scalability.
 
 As many have learned to their sorrow, parallel programming without
 validation is a sure path to abject failure.
-Chapter~\ref{chp:Validation} covers various forms of testing.
+\cref{chp:Validation} covers various forms of testing.
 It is of course impossible to test reliability into your program
-after the fact, so Chapter~\ref{chp:Formal Verification}
+after the fact, so \cref{chp:Formal Verification}
 follows up with a brief overview of a couple of practical approaches to
 formal verification.
 
-Chapter~\ref{chp:Putting It All Together}
+\cref{chp:Putting It All Together}
 contains a series of moderate-sized parallel programming problems.
 The difficulty of these problems vary, but should be appropriate for
 someone who has mastered the material in the previous chapters.
 
-Chapter~\ref{sec:advsync:Advanced Synchronization}
+\cref{sec:advsync:Advanced Synchronization}
 looks at advanced synchronization methods, including
 non-blocking synchronization and parallel real-time computing,
-while Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}
+while \cref{chp:Advanced Synchronization: Memory Ordering}
 covers the advanced topic of memory ordering.
-Chapter~\ref{chp:Ease of Use} follows up with some ease-of-use advice.
-Chapter~\ref{chp:Conflicting Visions of the Future}
+\cref{chp:Ease of Use} follows up with some ease-of-use advice.
+\cref{chp:Conflicting Visions of the Future}
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

