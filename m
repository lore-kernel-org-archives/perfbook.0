Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cbRSRCQiWWt/hhn6P8Cs1uWluwIjbzCf/cb7rAjtQgo=;
        b=UbrBkj/ZNGqopARSsFJMdZpr4BYuZ/bjX8/xJUU1Hz0CMPo4ZcGKV90wWWCHNi9M1e
         noP3Rcn1PykOEOZfkml4rSe+lMH7/Zj4hWRQToua5orO38E+vUnk2ekWMUVtgObN1Dyh
         EmDTBpaxJGo7hfZFyhjt0IoNbTAwSNk4169l+JTkOBkToJAqyLYNFCklklAdthBtocVC
         qdO35P7awQnJm3xBScwPhSNZjiBGVU6mztYKClcWNBTtBNJ78w98InabCqVVQxLvt8zv
         KimfECIDFAir/hUyrBrjwSGw2+AcxFIYF5+MKSrWg3WB0mRyPP3/ZOSoVTDHie5lxR1G
         rAKg==
Subject: [PATCH 2/5] Enhance qqz scheme for chapterwise QQZ answers
References: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fceaeb34-7b66-a566-3cf3-5d115a7a6850@gmail.com>
Date: Thu, 30 Jul 2020 00:15:41 +0900
MIME-Version: 1.0
In-Reply-To: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fe2a375d55b744d48f776586caafa261bc6486fa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 27 Jul 2020 20:45:35 +0900
Subject: [PATCH 2/5] Enhance qqz scheme for chapterwise QQZ answers

This commit enables chapterwise QQZ answers in target perfbook-nq.pdf.
To achieve this, following changes are made.

    o Add a boolean "qqzchpend" in the preamble.
    o In qqz.sty, add a 3rd argument to \QuickQuizChapter{} and
      \QuickQAC{}.  It is used to specify basename of chapterwise
      QQZ .tex file.  Also add a command \QuickQuizAnswerChp{} for
      conditionally including the chapterwise QQZ file.
    o In chapter level .tex files, add the 3rd argument to
      \QuickQuizChapter{} at the top and add the \QuickQuizAnswersChp{}
      commands at the bottom.
      Chapterwise QQZ files are named qqzhowto.tex, qqzintro.tex, and
      so on.
    o Add a script "utilities/divideqqz.pl" to generate chapterwise
      qqz .tex files.
    o Tweak howto.tex to deal with the lack of answers to QQZ in
      Appendix.
    o Enable "qqzchpend" for target perfbook-nq.pdf.
    o Update .gitignore (qqz*.tex)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore                           |  2 +-
 Makefile                             | 15 ++++++++--
 SMPdesign/SMPdesign.tex              |  4 ++-
 advsync/advsync.tex                  |  4 ++-
 appendix/questions/questions.tex     |  4 ++-
 appendix/toyrcu/toyrcu.tex           |  4 ++-
 appendix/whymb/whymemorybarriers.tex |  4 ++-
 count/count.tex                      |  4 ++-
 cpu/cpu.tex                          |  4 ++-
 datastruct/datastruct.tex            |  4 ++-
 debugging/debugging.tex              |  4 ++-
 defer/defer.tex                      |  4 ++-
 easy/easy.tex                        |  4 ++-
 formal/formal.tex                    |  4 ++-
 future/future.tex                    |  4 ++-
 howto/howto.tex                      | 27 ++++++++++++++----
 intro/intro.tex                      |  4 ++-
 locking/locking.tex                  |  4 ++-
 memorder/memorder.tex                |  4 ++-
 owned/owned.tex                      |  4 ++-
 perfbook-lt.tex                      |  3 ++
 qqz.sty                              | 22 +++++++++++++--
 together/together.tex                |  4 ++-
 toolsoftrade/toolsoftrade.tex        |  4 ++-
 utilities/divideqqz.pl               | 42 ++++++++++++++++++++++++++++
 25 files changed, 156 insertions(+), 31 deletions(-)
 create mode 100755 utilities/divideqqz.pl

diff --git a/.gitignore b/.gitignore
index d0459aef..a25a00b7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -24,7 +24,7 @@
 *.pdfq
 *.synctex*
 perfbook_flat.tex
-qqz.tex
+qqz*.tex
 contrib.tex
 origpub.tex
 perfbook*.out
diff --git a/Makefile b/Makefile
index 4e2b65ab..3e0503d7 100644
--- a/Makefile
+++ b/Makefile
@@ -16,7 +16,12 @@ LATEXSOURCES = \
 LST_SOURCES := $(wildcard CodeSamples/formal/promela/*.lst) \
 	$(wildcard appendix/styleguide/*.c)
 
-LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex
+SUB_QQZ := qqzhowto.tex qqzintro.tex qqzcpu.tex qqztoolsoftrade.tex \
+	qqzcount.tex qqzSMPdesign.tex qqzlocking.tex qqzowned.tex \
+	qqzdefer.tex qqzdatastruct.tex qqzdebugging.tex qqzformal.tex \
+	qqztogether.tex	qqzadvsync.tex qqzmemorder.tex qqzeasy.tex \
+	qqzfuture.tex qqzquestions.tex qqztoyrcu.tex qqzwhymb.tex
+LATEXGENERATED = autodate.tex qqz.tex contrib.tex origpub.tex $(SUB_QQZ)
 
 TWOCOLTARGETS := mstx msr msn msnt sf qq nq
 ABBREVTARGETS := lt hb a4 1c tcb msns mss $(TWOCOLTARGETS) $(foreach v,$(TWOCOLTARGETS),1c$(v))
@@ -245,6 +250,9 @@ contrib.tex: perfbook_flat.tex qqz.tex
 origpub.tex: perfbook_flat.tex
 	sh utilities/extractorigpub.sh < $< > $@
 
+$(SUB_QQZ): qqz.tex
+	utilities/divideqqz.pl
+
 perfbook.tex: $(PERFBOOK_BASE)
 	cp $< $@
 
@@ -328,7 +336,8 @@ perfbook-qq.tex perfbook-1cqq.tex:
 perfbook-nq.tex: $(PERFBOOK_BASE)
 perfbook-1cnq.tex: perfbook-1c.tex
 perfbook-nq.tex perfbook-1cnq.tex:
-	sed -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' < $< > $@
+	sed -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' \
+	    -e 's/{qqzchpend}{false}/{qqzchpend}{true}/' < $< > $@
 
 perfbook-a4.tex: perfbook-lt.tex
 perfbook-a4.tex:
@@ -458,7 +467,7 @@ help-full: help-official
 	@echo "Experimental targets:"
 	@echo "  Full,              Abbr."
 	@echo "  perfbook-qq.pdf,   qq:   framed Quick Quizzes"
-	@echo "  perfbook-nq.pdf,   nq:   without inline Quick Quizzes"
+	@echo "  perfbook-nq.pdf,   nq:   no inline Quick Quizzes (chapterwise Answers)"
 	@echo "  perfbook-msnt.pdf, msnt: newtxtt as monospace (non-slashed 0)"
 	@echo "  perfbook-mstx.pdf, mstx: txtt as monospace"
 	@echo "  perfbook-msr.pdf,  msr:  regular thickness courier clone as monospace"
diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index ef4d4c6c..c7570bae 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{cha:Partitioning and Synchronization Design}{Partitioning and Synchronization Design}
+\QuickQuizChapter{cha:Partitioning and Synchronization Design}{Partitioning and Synchronization Design}{qqzSMPdesign}
 %
 \Epigraph{Divide and rule.}{\emph{Philip II of Macedon}}
 
@@ -1315,3 +1315,5 @@ System memory	  & Code locking   & Memory from/to system \\
 \end{table}
 
 \input{SMPdesign/beyond}
+
+\QuickQuizAnswersChp{qqzSMPdesign}
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 66cc797a..bfd3737d 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{sec:advsync:Advanced Synchronization}{Advanced Synchronization}
+\QuickQuizChapter{sec:advsync:Advanced Synchronization}{Advanced Synchronization}{qqzadvsync}
 %
 \Epigraph{If a little knowledge is a dangerous thing, just think what
 	  you could do with a lot of knowledge!}{\emph{Unknown}}
@@ -455,3 +455,5 @@ However, once an appropriate body of theory becomes available,\footnote{
 it is wise to make use of it.
 
 \input{advsync/rt}
+
+\QuickQuizAnswersChp{qqzadvsync}
diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
index f5b04d5f..4bb981bc 100644
--- a/appendix/questions/questions.tex
+++ b/appendix/questions/questions.tex
@@ -2,7 +2,7 @@
 % mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{cha:app:Important Questions}{Important Questions}
+\QuickQuizChapter{cha:app:Important Questions}{Important Questions}{qqzquestions}
 %
 \Epigraph{Ask me no questions, and I'll tell you no fibs.}
 	 {\emph{``She Stoops to Conquer'', Oliver Goldsmith}}
@@ -31,3 +31,5 @@ pose an overwhelming challenge.
 \input{appendix/questions/concurrentparallel}
 \input{appendix/questions/time}
 \input{appendix/questions/ordering}
+
+\QuickQuizAnswersChp{qqzquestions}
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index abfdf41a..6feff768 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -2,7 +2,7 @@
 % mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:app:``Toy'' RCU Implementations}{``Toy'' RCU Implementations}
+\QuickQuizChapter{chp:app:``Toy'' RCU Implementations}{``Toy'' RCU Implementations}{qqztoyrcu}
 %
 \Epigraph{The only difference between men and boys is the price of their toys.}
 	 {\emph{M. H\'ebert}}
@@ -1647,3 +1647,5 @@ create a new RCU implementation.
 	to a (mythical) unconditional read-to-write upgrade for
 	reader-writer locking.
 }\QuickQuizEnd
+
+\QuickQuizAnswersChp{qqztoyrcu}
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index a6e9fcdf..dff7fafc 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2,7 +2,7 @@
 % mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:app:whymb:Why Memory Barriers?}{Why Memory Barriers?}
+\QuickQuizChapter{chp:app:whymb:Why Memory Barriers?}{Why Memory Barriers?}{qqzwhymb}
 %
 \Epigraph{Order!
 	  Order in the court!}
@@ -1669,3 +1669,5 @@ future such problems:
 \end{enumerate}
 
 Again, we encourage hardware designers to avoid these practices!
+
+\QuickQuizAnswersChp{qqzwhymb}
diff --git a/count/count.tex b/count/count.tex
index 0dd35271..161ad2fc 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Counting}{Counting}
+\QuickQuizChapter{chp:Counting}{Counting}{qqzcount}
 %
 \Epigraph{As easy as 1, 2, 3!}{\emph{Unknown}}
 
@@ -3247,3 +3247,5 @@ fundamental concurrency issues without the distraction of
 complex synchronization primitives or elaborate data structures.
 Such synchronization primitives and data structures are covered
 in later chapters.
+
+\QuickQuizAnswersChp{qqzcount}
diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index c563364a..85327a33 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Hardware and its Habits}{Hardware and its Habits}
+\QuickQuizChapter{chp:Hardware and its Habits}{Hardware and its Habits}{qqzcpu}
 %
 \Epigraph{Premature abstraction is the root of all evil.}
 	 {\emph{A cast of thousands}}
@@ -68,3 +68,5 @@ Chapter~\ref{chp:Counting} will investigate problems and solutions to
 parallel counting, and
 Chapter~\ref{cha:Partitioning and Synchronization Design}
 will discuss design disciplines that promote performance and scalability.
+
+\QuickQuizAnswersChp{qqzcpu}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 347b9381..16dc2286 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Data Structures}{Data Structures}
+\QuickQuizChapter{chp:Data Structures}{Data Structures}{qqzdatastruct}
 %
 \Epigraph{Bad programmers worry about the code. Good programmers worry
 	  about data structures and their relationships.}
@@ -1938,3 +1938,5 @@ including:
 
 That said, performance and scalability are of little use without reliability,
 so the next chapter covers validation.
+
+\QuickQuizAnswersChp{qqzdatastruct}
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 4f13c4bc..39d46f9b 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Validation}{Validation}
+\QuickQuizChapter{chp:Validation}{Validation}{qqzdebugging}
 %
 \Epigraph{If it is not tested, it doesn't work.}{\emph{Unknown}}
 
@@ -2657,3 +2657,5 @@ and, more speculatively, Section~\ref{sec:future:Formal Regression Testing?}.
 The topic of choosing a validation plan, be it testing, formal
 verification, or both, is taken up by
 \cref{sec:formal:Choosing a Validation Plan}.
+
+\QuickQuizAnswersChp{qqzdebugging}
diff --git a/defer/defer.tex b/defer/defer.tex
index e972ddc1..738b13a5 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Deferred Processing}{Deferred Processing}
+\QuickQuizChapter{chp:Deferred Processing}{Deferred Processing}{qqzdefer}
 %
 \Epigraph{All things come to those who wait.}{\emph{Violet Fane}}
 
@@ -113,3 +113,5 @@ ideal scalability and performance.
 \input{defer/rcuexercises}
 \input{defer/whichtochoose}
 \input{defer/updates}
+
+\QuickQuizAnswersChp{qqzdefer}
diff --git a/easy/easy.tex b/easy/easy.tex
index ca4d1c14..455dffdd 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Ease of Use}{Ease of Use}
+\QuickQuizChapter{chp:Ease of Use}{Ease of Use}{qqzeasy}
 %
 \Epigraph{Creating a perfect API is like committing the perfect crime.
 	  There are at least fifty things that can go wrong, and if you are
@@ -298,3 +298,5 @@ Figure~\ref{fig:easy:Shaving the Mandelbrot Set}.
 \caption{Shaving the Mandelbrot Set}
 \ContributedBy{Figure}{fig:easy:Shaving the Mandelbrot Set}{Melissa Broussard}
 \end{figure}
+
+\QuickQuizAnswersChp{qqzeasy}
diff --git a/formal/formal.tex b/formal/formal.tex
index b37bbcb0..24289420 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Formal Verification}{Formal Verification}
+\QuickQuizChapter{chp:Formal Verification}{Formal Verification}{qqzformal}
 %
 \Epigraph{Beware of bugs in the above code; I have only proved it correct,
 	  not tried it.}{\emph{Donald Knuth}}
@@ -376,3 +376,5 @@ In short, choosing a validation plan for concurrent software remains
 more an art than a science, let alone a field of engineering.
 However, there is every reason to expect that ordered approaches
 will continue to become more prevalent.
+
+\QuickQuizAnswersChp{qqzformal}
diff --git a/future/future.tex b/future/future.tex
index e7832811..96cda4bb 100644
--- a/future/future.tex
+++ b/future/future.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Conflicting Visions of the Future}{Conflicting Visions of the Future}
+\QuickQuizChapter{chp:Conflicting Visions of the Future}{Conflicting Visions of the Future}{qqzfuture}
 %
 \Epigraph{Prediction is very difficult, especially about the future.}
 	 {\emph{Niels Bohr}}
@@ -151,3 +151,5 @@ that this long-touted methodology is starting to see credible
 competition on its formal-verification home turf.
 There is therefore continued reason to doubt the inevitability of
 functional-programming dominance.
+
+\QuickQuizAnswersChp{qqzfuture}
diff --git a/howto/howto.tex b/howto/howto.tex
index c929aa10..23064a72 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:How To Use This Book}{How To Use This Book}
+\QuickQuizChapter{chp:How To Use This Book}{How To Use This Book}{qqzhowto}
 %
 \Epigraph{If you would only recognize that life is hard, things would be so
 	  much easier for you.}{\emph{Louis D. Brandeis}}
@@ -132,9 +132,11 @@ This chapter is followed by a number of appendices.
 The most popular of these appears to be
 Appendix~\ref{chp:app:whymb:Why Memory Barriers?},
 which delves even further into memory ordering.
+\IfQqzChpEnd{}{
 Appendix~\ref{chp:Answers to Quick Quizzes}
 contains the answers to the infamous Quick Quizzes, which are discussed in
 the next section.
+}
 
 \section{Quick Quizzes}
 \label{sec:howto:Quick Quizzes}
@@ -144,8 +146,15 @@ the next section.
 
 ``Quick quizzes'' appear throughout this book, and the answers may
 be found in
-Appendix~\ref{chp:Answers to Quick Quizzes} starting on
-page~\pageref{chp:Answers to Quick Quizzes}.
+\IfQqzChpEnd{
+the final section of each chapter.\footnote{
+	In the official release/edition of this book, all the answers are
+	gathered in an Appendix.
+}
+}{
+\cref{chp:Answers to Quick Quizzes} starting on
+\cpageref{chp:Answers to Quick Quizzes}.
+}
 Some of them are based on material in which that quick quiz
 appears, but others require you to think beyond that section, and,
 in some cases, beyond the realm of current knowledge.
@@ -160,9 +169,13 @@ of parallel programming.
 \QuickQuizB{
 	Where are the answers to the Quick Quizzes found?
 }\QuickQuizAnswerB{
-	In Appendix~\ref{chp:Answers to Quick Quizzes} starting on
-	page~\pageref{chp:Answers to Quick Quizzes}.
-
+\IfQqzChpEnd{
+	At the end of each chapter as you see here in
+        \cref{sec:qqzhowto:Answers to Quick Quizzes}.
+}{
+	In \cref{chp:Answers to Quick Quizzes} starting on
+	\cpageref{chp:Answers to Quick Quizzes}.
+}
 	Hey, I thought I owed you an easy one!
 }\QuickQuizEndB
 %
@@ -525,3 +538,5 @@ The style for this particular book is documented in
 As noted at the beginning of this section, I am this book's editor.
 However, if you choose to contribute, it will be your book as well.
 With that, I offer you Chapter~\ref{chp:Introduction}, our introduction.
+
+\QuickQuizAnswersChp{qqzhowto}
diff --git a/intro/intro.tex b/intro/intro.tex
index 1de276b2..cfd6f91d 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Introduction}{Introduction}
+\QuickQuizChapter{chp:Introduction}{Introduction}{qqzintro}
 %
 \Epigraph{If parallel programming is so hard, why are there so many
 	  parallel programs?}{\emph{Unknown}}
@@ -1240,3 +1240,5 @@ parallel-programming challenge here in the 21\textsuperscript{st} century!
 We are now ready to proceed to the next chapter, which dives into the
 relevant properties of the parallel hardware underlying our parallel
 software.
+
+\QuickQuizAnswersChp{qqzintro}
diff --git a/locking/locking.tex b/locking/locking.tex
index ebcd0e35..89659d9c 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Locking}{Locking}
+\QuickQuizChapter{chp:Locking}{Locking}{qqzlocking}
 %
 \Epigraph{Locking is the worst general-purpose synchronization mechanism
 	  except for all those other mechanisms that
@@ -2467,3 +2467,5 @@ need to one day run in parallel, locking should therefore not be the
 only tool in your parallel-programming toolbox.
 The next few chapters will discuss other tools, and how they can best
 be used in concert with locking and with each other.
+
+\QuickQuizAnswersChp{qqzlocking}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index fb623ca7..44e1d14d 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}
+\QuickQuizChapter{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}{qqzmemorder}
 \OriginallyPublished{Chapter}{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}{the Linux kernel}{Howells2009membartxt}
 \OriginallyPublished{Chapter}{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}{Linux Weekly News}{JadeAlglave2017LWN-LKMM-1,JadeAlglave2017LWN-LKMM-2}
 %
@@ -4858,3 +4858,5 @@ One final word of advice: Use of raw memory-ordering primitives is
 a last resort.
 It is almost always better to use existing primitives, such as locking
 or RCU, thus letting those primitives do the memory ordering for you.
+
+\QuickQuizAnswersChp{qqzmemorder}
diff --git a/owned/owned.tex b/owned/owned.tex
index b45fabb1..163f2d89 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Data Ownership}{Data Ownership}
+\QuickQuizChapter{chp:Data Ownership}{Data Ownership}{qqzowned}
 %
 \Epigraph{It is mine, I tell you. My own. My precious. Yes, my precious.}
 	 {\emph{Gollum in ``The Fellowship of the Ring'', J.R.R.~Tolkien}}
@@ -435,3 +435,5 @@ greater performance and scalability coupled with reduced complexity.
 % populate with problems showing benefits of coupling data ownership with
 % other approaches. For example, work-stealing schedulers. Perhaps also
 % move memory allocation here, though its current location is quite good.
+
+\QuickQuizAnswersChp{qqzowned}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 46b6ad06..6b339d51 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -93,6 +93,9 @@
 \newboolean{noqqz}
 \setboolean{noqqz}{false}
 \newcommand{\IfNoQqz}[2]{\ifthenelse{\boolean{noqqz}}{#1}{#2}}
+\newboolean{qqzchpend}
+\setboolean{qqzchpend}{false}
+\newcommand{\IfQqzChpEnd}[2]{\ifthenelse{\boolean{qqzchpend}}{#1}{#2}}
 
 \input{autodate} % need to input here to reflect tag state
 \usepackage{qqz}
diff --git a/qqz.sty b/qqz.sty
index 815ba2ad..6d87e192 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -64,7 +64,7 @@
 \newcommand{\QuickQHeadingMiddle}[3]{\scriptsize\hyperref[#2.#3]{{ #3}}\label{#1.#3},}
 \newcommand{\QuickQHeadingEnd}[3]{\scriptsize\hyperref[#2.#3]{{ #3}}\label{#1.#3}}
 
-\newcommand{\QuickQuizChapter}[2]{
+\newcommand{\QuickQuizChapter}[3]{
 	\chapter{#2}
 	\label{#1}
 	}
@@ -168,6 +168,15 @@
 	\hyperref[QQA.#1]{Quick Quiz~#1}%
 }
 
+\IfQqzChpEnd{
+\newcommand{\QuickQuizAnswers}{}
+\newcommand{\QuickQuizAnswersChp}[1]{
+%	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
+%	\label{sec:#1:Answers to Quick Quizzes}
+	\setlength{\parskip}{0.0pt plus 1ex}
+	\input{#1}
+	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
+}}{
 \newcommand{\QuickQuizAnswers}{
 	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
 	\chapter{Answers to Quick Quizzes}
@@ -179,12 +188,21 @@
 	\input{qqz}
 	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
 }
+\newcommand{\QuickQuizAnswersChp}[1]{}
+}
 
 %% Internal interfaces generated by scripts.
 
-\newcommand{\QuickQAC}[2]{
+\IfQqzChpEnd{
+\newcommand{\QuickQAC}[3]{
+	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
+	\section{Answers to Quick Quizzes}
+	\label{sec:#3:Answers to Quick Quizzes}}
+}{
+\newcommand{\QuickQAC}[3]{
 	\edef\QuickQuizAnswerChapter{\getrefnumber{#1}}
 	\section{#2}}
+}
 
 \IfQqzBg{
 \newcommand{\QuickQ}[1]{
diff --git a/together/together.tex b/together/together.tex
index 88eb9568..4b558b71 100644
--- a/together/together.tex
+++ b/together/together.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Putting It All Together}{Putting It All Together}
+\QuickQuizChapter{chp:Putting It All Together}{Putting It All Together}{qqztogether}
 %
 \Epigraph{You don't learn how to shoot and then learn how to launch
 	  and then learn to do a controlled spin---you learn to
@@ -26,3 +26,5 @@ and finishing off with some hashing hassles in
 \input{together/hash.tex}
 % Later add section on updates: hashed arrays of locks, fifos/streaming,
 % batching to trade off latency for perf/scale.
+
+\QuickQuizAnswersChp{qqztogether}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 71b935d7..034e72f0 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2,7 +2,7 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\QuickQuizChapter{chp:Tools of the Trade}{Tools of the Trade}
+\QuickQuizChapter{chp:Tools of the Trade}{Tools of the Trade}{qqztoolsoftrade}
 %
 \Epigraph{You are only as good as your tools, and your tools are only
 	  as good as you are.}{\emph{Unknown}}
@@ -2629,3 +2629,5 @@ you realize that you are in trouble~\cite{DeadlockEmpire2016}.
 Therefore, it is necessary to make the right design choices as well as
 the correct choice of individual primitives,
 as will be discussed at length in subsequent chapters.
+
+\QuickQuizAnswersChp{qqztoolsoftrade}
diff --git a/utilities/divideqqz.pl b/utilities/divideqqz.pl
new file mode 100755
index 00000000..7387f683
--- /dev/null
+++ b/utilities/divideqqz.pl
@@ -0,0 +1,42 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Divide qqz.tex for each chapter
+#
+# Usage:
+#
+# $ utilities/divideqqz.pl
+#
+# Note:
+#
+# Input file is fixed to qqz.tex.
+#
+# Name of each output file is taken from the 3rd argument of the
+# \QuickQAC macro, which originates from the \QuickQuizChapter macro
+# in source .tex files.
+#
+# Copyright (C) Akira Yokosawa, 2020
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $src_file = "qqz.tex";
+my $chp_name;
+my $QAC_ptn = "\\\\QuickQAC\\{[^}]*}\\{[^}]*}\\{([^}]*)}" ;
+my $out_h;
+my $out_file;
+
+open(my $in_h, "<", $src_file) or die "cannot open $src_file: $!" ;
+while (my $line = <$in_h>) {
+    if ($line =~ /$QAC_ptn/) {
+	$out_file = $1 . ".tex" ;
+	open ($out_h, ">", $out_file) or die "cannot open $out_file: $!" ;
+	print $out_h "% mainfile: perfbook.tex\n" ;
+	print $out_h "% Do not edit! Generated by divideqqz.pl\n" ;
+    }
+    if ($out_h) {
+	print $out_h $line ;
+    }
+}
-- 
2.17.1


