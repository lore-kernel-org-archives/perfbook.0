Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vIHmqpO5CPH9AsEESPiGeq27u4tT2P6o4eAQAO77hNI=;
        b=umtoKS1EBfax64VbCUZrR/7r/FEJldLyscgz0xMLZWoQdvZJNIh0B17V5/Vlk4J8OU
         s0Wt8ntq5gx8y10iowwfIcz18GC5XKX2ctojfNqpFFjgN4ofuyJR5/PH32ggXa8qXWlV
         9Kc7gv4kWITq2U2cttanN7eXW26g+3spBM5j19ak/cJfB/vJiOsL/sFnh0R0rwLCXrQZ
         D6AxYYq1B3AYltDdsKx9qLh0AqJhgV5PHLoATKCzRvRDAVJ5bp3uebrzFetrYfxNPPdS
         37GBfd/vSSL4g51jykHiNADIUxvY6RVjl5HYr9dDldqGIfNDpFf6lcoCSw6zH6PMBdxC
         X+mw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 1/4] howto: Use '\cref' and '\Cref' consistently
Date: Sun,  4 Apr 2021 13:10:41 +0200
Message-Id: <20210404111044.27774-2-sj38.park@gmail.com>
In-Reply-To: <20210404111044.27774-1-sj38.park@gmail.com>
References: <20210404111044.27774-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit replaces 'Chapter~\ref', 'Listing~\ref', and 'Appendix~\ref'
with smart alternatives, '\cref' and '\Cref'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 52 ++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 7de1dbd9..b60e3a9a 100644
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
@@ -132,10 +132,10 @@ this book and its origins.
 
 This chapter is followed by a number of appendices.
 The most popular of these appears to be
-Appendix~\ref{chp:app:whymb:Why Memory Barriers?},
+\cref{chp:app:whymb:Why Memory Barriers?},
 which delves even further into memory ordering.
 \IfQqzChpEnd{}{
-Appendix~\ref{chp:Answers to Quick Quizzes}
+\Cref{chp:Answers to Quick Quizzes}
 contains the answers to the infamous Quick Quizzes, which are discussed in
 the next section.
 }
@@ -409,7 +409,7 @@ find CodeSamples -name rcu_rcpls.c -print
 \end{VerbatimU}
 
 This command will locate the file \path{rcu_rcpls.c}, which is called out in
-Appendix~\ref{chp:app:``Toy'' RCU Implementations}.
+\cref{chp:app:``Toy'' RCU Implementations}.
 Other types of systems have well-known ways of locating files by filename.
 
 \section{Whose Book Is This?}
@@ -456,18 +456,18 @@ make help                # Display other build options
 
 To create and display a current \LaTeX{} source tree of this book,
 use the list of Linux commands shown in
-Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
+\cref{lst:howto:Creating a Up-To-Date PDF}.
 In some environments, the \co{evince} command that displays \path{perfbook.pdf}
 may need to be replaced, for example, with \co{acroread}.
 The \co{git clone} command need only be used the first time you
 create a PDF, subsequently, you can run the commands shown in
-Listing~\ref{lst:howto:Generating an Updated PDF} to pull in any updates
+\cref{lst:howto:Generating an Updated PDF} to pull in any updates
 and generate an updated PDF\@.
 The commands in
-Listing~\ref{lst:howto:Generating an Updated PDF}
+\cref{lst:howto:Generating an Updated PDF}
 must be run within the \path{perfbook} directory created by the commands
 shown in
-Listing~\ref{lst:howto:Creating a Up-To-Date PDF}.
+\cref{lst:howto:Creating a Up-To-Date PDF}.
 
 \begin{listing}[tbp]
 \begin{VerbatimL}[numbers=none,xleftmargin=0pt]
@@ -552,6 +552,6 @@ The style for this particular book is documented in
 
 As noted at the beginning of this section, I am this book's editor.
 However, if you choose to contribute, it will be your book as well.
-In that spirit, I offer you Chapter~\ref{chp:Introduction}, our introduction.
+In that spirit, I offer you \cref{chp:Introduction}, our introduction.
 
 \QuickQuizAnswersChp{qqzhowto}
-- 
2.17.1

