Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=aCyO+lrkL1vwQF/Y4VBVuxX0s9WcLxFs97mkz/VRhBU=;
 b=knb3FjOFKRziKiKF5bMccVE2h+MwnIasVLjj+hn19K0Y3veRonxhIOyfWYn+bPpvik
 wK95YocGattSYfNXra+HK1e7jUTszjuk/ab414TPbOadmEnMFyisK5voeAAyj7HUd1vU
 j8IekYVnj+DRFDZONfaX51gwah3Nwsx6GBwnbcvcnfRezEfyt2kRDsYp+TDi3BTQ1v5i
 WKtXVuVLBeCBlcTVPvvFXRXdA2p3UAHsyQR/FsUF805pzD3n0XVmjuWAcqIAZYNBH1+u
 tmVnnSz9qK0CXLnWRQdhENxqMXuCHHYBfHDtwp+0ZiTQVdnVa1H1fjzn1rEVwScxx7pp
 eazg==
Subject: [RFC PATH 4/6] epigraph: Use \epigraphhead{}
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <64257d12-ee0c-42cf-6118-975ae11db04f@gmail.com>
Date: Mon, 19 Sep 2016 12:06:25 +0900
MIME-Version: 1.0
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 632b23d9bc6f823ab5168b50f33ab8f11d17b05a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 10 Sep 2016 20:10:26 +0900
Subject: [RFC PATH 4/6] epigraph: Use \epigraphhead{}

This commit makes use of \epigraphhead{} so that epigraphs are
placed in header areas of chapter heading pages.
To make the change less invasive, it defines a macro \Epigraph{}
in the preamble and use it after each chapter heading.
By modifying the definition of the macro, it would be easy to
tweak layout of epigraphs.

Note that no text (nor line break) is permitted between \chapter{}
and \epigraphhead{} commands. So each blank line above \epigraph{}
is replaced with a comment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex          | 4 ++--
 advsync/advsync.tex              | 4 ++--
 appendix/ack/ack.tex             | 4 ++--
 appendix/questions/questions.tex | 4 ++--
 count/count.tex                  | 4 ++--
 cpu/cpu.tex                      | 4 ++--
 datastruct/datastruct.tex        | 4 ++--
 debugging/debugging.tex          | 4 ++--
 defer/defer.tex                  | 4 ++--
 easy/easy.tex                    | 4 ++--
 formal/formal.tex                | 4 ++--
 future/future.tex                | 4 ++--
 glossary.tex                     | 4 ++--
 intro/intro.tex                  | 4 ++--
 locking/locking.tex              | 4 ++--
 owned/owned.tex                  | 4 ++--
 perfbook.tex                     | 1 +
 qqz.sty                          | 2 +-
 rt/rt.tex                        | 4 ++--
 together/together.tex            | 4 ++--
 toolsoftrade/toolsoftrade.tex    | 4 ++--
 21 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index e5c112b..2662826 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1,8 +1,8 @@
 % SMPdesign/SMPdesign.tex

 \QuickQuizChapter{cha:Partitioning and Synchronization Design}{Partitioning and Synchronization Design}
-
-\epigraph{Divide and rule.}{\emph{Philip II of Macedon}}
+%
+\Epigraph{Divide and rule.}{\emph{Philip II of Macedon}}

 This chapter describes how to design software to take advantage of
 the multiple CPUs that are increasingly appearing in commodity systems.
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 4804cb7..5647622 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -1,8 +1,8 @@
 % advsync/advsync.tex

 \QuickQuizChapter{sec:advsync:Advanced Synchronization}{Advanced Synchronization}
-
-\epigraph{If a little knowledge is a dangerous thing, just imagine all
+%
+\Epigraph{If a little knowledge is a dangerous thing, just imagine all
 	  the havoc you could wreak with a lot of knowledge!}{\emph{Unknown}}

 This section discusses a number of ways of using weaker, and hopefully
diff --git a/appendix/ack/ack.tex b/appendix/ack/ack.tex
index 23d5baa..a7737ff 100644
--- a/appendix/ack/ack.tex
+++ b/appendix/ack/ack.tex
@@ -3,8 +3,8 @@

 \chapter{Credits}
 \label{app:ack:Credits}
-
-\epigraph{If I have seen further it is by standing on the shoulders of
+%
+\Epigraph{If I have seen further it is by standing on the shoulders of
 	  giants.}{\emph{Isaac Newton, modernized}}

 \section{Authors}
diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
index b921a38..551384e 100644
--- a/appendix/questions/questions.tex
+++ b/appendix/questions/questions.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{cha:app:Important Questions}{Important Questions}
-
-\epigraph{Ask me no questions, and I'll tell you no fibs.}
+%
+\Epigraph{Ask me no questions, and I'll tell you no fibs.}
 	 {\emph{``She Stoops to Conquer'', Oliver Goldsmith}}

 The following sections discuss some important questions relating to
diff --git a/count/count.tex b/count/count.tex
index ace3923..39747d0 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1,8 +1,8 @@
 % count/count.tex

 \QuickQuizChapter{chp:Counting}{Counting}
-
-\epigraph{As easy as 1, 2, 3!}{\emph{Unknown}}
+%
+\Epigraph{As easy as 1, 2, 3!}{\emph{Unknown}}

 Counting is perhaps the simplest and most natural thing a computer can do.
 However, counting efficiently and scalably on a large
diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index 6bfdf91..c3dd9fa 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:Hardware and its Habits}{Hardware and its Habits}
-
-\epigraph{Premature abstraction is the root of all evil.}
+%
+\Epigraph{Premature abstraction is the root of all evil.}
 	 {\emph{A cast of thousands}}

 Most people have an intuitive understanding that passing messages between
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index bf91bd9..96ebd4c 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1,8 +1,8 @@
 % datastruct/datastruct.tex

 \QuickQuizChapter{chp:Data Structures}{Data Structures}
-
-\epigraph{Bad programmers worry about the code. Good programmers worry
+%
+\Epigraph{Bad programmers worry about the code. Good programmers worry
 	  about data structures and their relationships.}
 	 {\emph{Linus Torvalds}}

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 83429be..12235a0 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1,8 +1,8 @@
 % debugging/debugging.tex

 \QuickQuizChapter{chp:Validation}{Validation}
-
-\epigraph{If it is not tested, it doesn't work.}{\emph{Unknown}}
+%
+\Epigraph{If it is not tested, it doesn't work.}{\emph{Unknown}}

 I have had a few parallel programs work the first time, but that is only
 because I have written a large number parallel programs over the past two
diff --git a/defer/defer.tex b/defer/defer.tex
index f6e6600..020b8b9 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:Deferred Processing}{Deferred Processing}
-
-\epigraph{All things come to those who wait.}{\emph{Violet Fane}}
+%
+\Epigraph{All things come to those who wait.}{\emph{Violet Fane}}

 The strategy of deferring work goes back before the dawn of recorded
 history. It has occasionally been derided as procrastination or
diff --git a/easy/easy.tex b/easy/easy.tex
index 3e4bb8a..0a1b92a 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:Ease of Use}{Ease of Use}
-
-\epigraph{Creating a perfect API is like committing the perfect crime.
+%
+\Epigraph{Creating a perfect API is like committing the perfect crime.
 	  There are at least fifty things that can go wrong, and if you are
 	  a genius, you might be able to anticipate twenty-five of them.}
 	 {\emph{With apologies to any Kathleen Turner fans who might
diff --git a/formal/formal.tex b/formal/formal.tex
index ed9d7a3..8335978 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:formal:Formal Verification}{Formal Verification}
-
-\epigraph{Beware of bugs in the above code; I have only proved it correct,
+%
+\Epigraph{Beware of bugs in the above code; I have only proved it correct,
 	  not tried it.}{\emph{Donald Knuth}}

 \OriginallyPublished{Appendix}{chp:formal:Formal Verification}{Formal Verification}{Linux Weekly News}{PaulEMcKenney2007QRCUspin,PaulEMcKenney2008dynticksRCU,PaulEMcKenney2011ppcmem}
diff --git a/future/future.tex b/future/future.tex
index 3a19b04..6e88f30 100644
--- a/future/future.tex
+++ b/future/future.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:Conflicting Visions of the Future}{Conflicting Visions of the Future}
-
-\epigraph{Prediction is very difficult, especially about the future.}
+%
+\Epigraph{Prediction is very difficult, especially about the future.}
 	 {\emph{Niels Bohr}}

 This chapter presents some conflicting visions of the future of parallel
diff --git a/glossary.tex b/glossary.tex
index 9bfb3b3..6e4a837 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \chapter{Glossary and Bibliography}
-
-\epigraph{Dictionaries are inherently circular in nature.}
+%
+\Epigraph{Dictionaries are inherently circular in nature.}
 	 {\emph{``Self Reference in word definitions'',
 	        David~Levary~et~al.}}

diff --git a/intro/intro.tex b/intro/intro.tex
index e54e5ad..413525b 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:Introduction}{Introduction}
-
-\epigraph{If parallel programming is so hard, why are there any
+%
+\Epigraph{If parallel programming is so hard, why are there any
 	  parallel programs?}{\emph{Unknown}}

 Parallel programming has earned a reputation as one of the most
diff --git a/locking/locking.tex b/locking/locking.tex
index 300383c..35d8d9f 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1,8 +1,8 @@
 % locking/locking.tex

 \QuickQuizChapter{chp:Locking}{Locking}
-
-\epigraph{Locking is the worst general-purpose synchronization mechanism
+%
+\Epigraph{Locking is the worst general-purpose synchronization mechanism
 	  except for all those other mechanisms that
 	  have been tried from time to time.}{\emph{With apologies
 	  to the memory of Winston Churchill and to whoever he was
diff --git a/owned/owned.tex b/owned/owned.tex
index b6e9e02..b37f0c4 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -1,8 +1,8 @@
 % owned/owned.tex

 \QuickQuizChapter{chp:Data Ownership}{Data Ownership}
-
-\epigraph{It is mine, I tell you. My own. My precious. Yes, my precious.}
+%
+\Epigraph{It is mine, I tell you. My own. My precious. Yes, my precious.}
 	 {\emph{Gollum in ``The Fellowship of the Ring'', J.R.R.~Tolkien}}

 One of the simplest ways to avoid the synchronization overhead that
diff --git a/perfbook.tex b/perfbook.tex
index bdd42ad..564b214 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -64,6 +64,7 @@
 % ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
 \newcommand{\nbco}[1]{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}
+\newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}

 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
 \author{
diff --git a/qqz.sty b/qqz.sty
index 4505f8c..dda1c17 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -62,7 +62,7 @@
 	\renewcommand*{\theHNum}{\arabic{section}.\arabic{quickquizctrC}}
 	\chapter{Answers to Quick Quizzes}
 	\label{chp:Answers to Quick Quizzes}
-	\epigraph{The Answer to the Ultimate Question of Life, The Universe,
+	\Epigraph{The Answer to the Ultimate Question of Life, The Universe,
 		  and Everything.}
 		 {\emph{``The Hitchhikers Guide to the Galaxy'', Douglas~Adams}}
 	\setlength{\parskip}{0.0pt plus 2ex}
diff --git a/rt/rt.tex b/rt/rt.tex
index 651cb12..e73ba0a 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -1,8 +1,8 @@
 % rt/rt.tex

 \QuickQuizChapter{chp:Parallel Real-Time Computing}{Parallel Real-Time Computing}
-
-\epigraph{The difference between you and me is that I was right in time.}
+%
+\Epigraph{The difference between you and me is that I was right in time.}
 	 {\emph{Konrad Adenauer}}

 An important emerging area in computing is that of parallel real-time
diff --git a/together/together.tex b/together/together.tex
index 8a8e8cb..ee8bff2 100644
--- a/together/together.tex
+++ b/together/together.tex
@@ -2,8 +2,8 @@
 % SPDX-License-Identifier: CC-BY-SA-3.0

 \QuickQuizChapter{chp:Putting It All Together}{Putting It All Together}
-
-\epigraph{You don't learn how to shoot and then learn how to launch
+%
+\Epigraph{You don't learn how to shoot and then learn how to launch
 	  and then learn to do a controlled spin---you learn to
 	  launch-shoot-spin.}{\emph{``Ender's Shadow'', Orson Scott Card}}

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index b4a2ba5..403c6c8 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1,8 +1,8 @@
 % toolsoftrade/toolsoftrade.tex

 \QuickQuizChapter{chp:Tools of the Trade}{Tools of the Trade}
-
-\epigraph{You are only as good as your tools, and your tools are only
+%
+\Epigraph{You are only as good as your tools, and your tools are only
 	  as good as you are.}{\emph{Unknown}}

 This chapter provides a brief introduction to some basic tools of the
-- 
1.9.1


