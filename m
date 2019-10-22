Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VQ+iy4etpx0lgZKaWHph5r8EfvRS3r7G6fm/CBlRgCw=;
        b=fZjgCkulrdG/m9aiEN67vgUFs03LT7u4p8G4neV47d6bmZbg2Fn9jKgfkfWBUO9263
         4B/iZvx663yrNfJgrkHKhbFat4TsfZJ45LOVXT4KMNPstNklW8r/kstLHNxLkarwrGb/
         fbwZXxGuOzbhDGmhxoHAPoQNuRqppYfcUQAA+z9XRyFQchLsdTGVGuoKKicFap8cuCWD
         jomKUn4OxGjDJfbEqCBBrGULC9cSZMUABPYFffx0Gt0TU5GLOC4YpyFqNbJmjHhDBoyh
         rBGaz6qEvy7N2p1wHRfmvtB6dBu9buWJXQSeZL5T1eYO3Y7yo8UwPvku79W198v1lJsX
         8img==
Subject: [PATCH v3 1/6] treewide: Add '% mainfile:' tags in headers in sub
 .tex files
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <91aac537-cef4-0beb-a29a-8218b2cbd342@gmail.com>
Date: Tue, 22 Oct 2019 20:17:49 +0900
MIME-Version: 1.0
In-Reply-To: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f27c8e9ab71a7f6a6f12ac21e2469d26330de36c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 19 Oct 2019 20:44:40 +0900
Subject: [PATCH v3 1/6] treewide: Add '% mainfile:' tags in headers in sub .tex files

These tags enable SyncTeX forward search from gedit to evince.
Also fill in missing sub-directory names and SPDX License Identifiers.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex                   | 2 ++
 SMPdesign/beyond.tex                      | 4 +++-
 SMPdesign/criteria.tex                    | 1 +
 SMPdesign/partexercises.tex               | 2 ++
 advsync/advsync.tex                       | 2 ++
 advsync/rcu.tex                           | 2 ++
 advsync/rt.tex                            | 2 ++
 appendix/ack/ack.tex                      | 1 +
 appendix/appendix.tex                     | 1 +
 appendix/questions/after.tex              | 2 ++
 appendix/questions/concurrentparallel.tex | 1 +
 appendix/questions/questions.tex          | 1 +
 appendix/questions/time.tex               | 1 +
 appendix/styleguide/styleguide.tex        | 1 +
 appendix/toyrcu/toyrcu.tex                | 2 ++
 appendix/whymb/whymemorybarriers.tex      | 2 ++
 count/count.tex                           | 2 ++
 cpu/cpu.tex                               | 1 +
 cpu/hwfreelunch.tex                       | 1 +
 cpu/overheads.tex                         | 1 +
 cpu/overview.tex                          | 2 ++
 cpu/swdesign.tex                          | 1 +
 datastruct/datastruct.tex                 | 2 ++
 debugging/debugging.tex                   | 2 ++
 defer/defer.tex                           | 1 +
 defer/hazptr.tex                          | 1 +
 defer/rcu.tex                             | 3 ++-
 defer/rcuapi.tex                          | 2 ++
 defer/rcuexercises.tex                    | 1 +
 defer/rcufundamental.tex                  | 2 ++
 defer/rcuintro.tex                        | 2 ++
 defer/rcurelated.tex                      | 2 ++
 defer/rcuusage.tex                        | 2 ++
 defer/refcnt.tex                          | 2 ++
 defer/seqlock.tex                         | 2 ++
 defer/updates.tex                         | 3 ++-
 defer/whichtochoose.tex                   | 1 +
 easy/easy.tex                             | 1 +
 formal/axiomatic.tex                      | 2 ++
 formal/dyntickrcu.tex                     | 2 ++
 formal/formal.tex                         | 1 +
 formal/ppcmem.tex                         | 4 +++-
 formal/sat.tex                            | 1 +
 formal/spinhint.tex                       | 2 ++
 formal/stateless.tex                      | 1 +
 future/cpu.tex                            | 1 +
 future/formalregress.tex                  | 1 +
 future/future.tex                         | 1 +
 future/htm.tex                            | 2 ++
 future/tm.tex                             | 2 ++
 glossary.tex                              | 1 +
 howto/howto.tex                           | 2 ++
 intro/intro.tex                           | 1 +
 legal.tex                                 | 1 +
 locking/locking-existence.tex             | 4 +++-
 locking/locking.tex                       | 2 ++
 memalloc/memalloc.tex                     | 1 +
 memorder/memorder.tex                     | 2 ++
 owned/owned.tex                           | 2 ++
 together/applyrcu.tex                     | 2 ++
 together/count.tex                        | 1 +
 together/hash.tex                         | 1 +
 together/refcnt.tex                       | 2 ++
 together/together.tex                     | 1 +
 toolsoftrade/toolsoftrade.tex             | 2 ++
 65 files changed, 104 insertions(+), 5 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 045cd50e..0d351678 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1,4 +1,6 @@
 % SMPdesign/SMPdesign.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{cha:Partitioning and Synchronization Design}{Partitioning and Synchronization Design}
 %
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 40968c5a..0c0f9cb5 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -1,4 +1,6 @@
-% beyond.tex
+% SMPdesign/beyond.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Beyond Partitioning}
 \label{sec:SMPdesign:Beyond Partitioning}
diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index 0b8f4a96..56657fca 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -1,4 +1,5 @@
 % SMPdesign/criteria.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Design Criteria}
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index e56f8eeb..5ac0ac30 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -1,4 +1,6 @@
 % SMPdesign/partexercises.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Partitioning Exercises}
 \label{sec:SMPdesign:Partitioning Exercises}
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 304cf85b..f1a19ccc 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -1,4 +1,6 @@
 % advsync/advsync.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{sec:advsync:Advanced Synchronization}{Advanced Synchronization}
 %
diff --git a/advsync/rcu.tex b/advsync/rcu.tex
index ac5357ec..33335235 100644
--- a/advsync/rcu.tex
+++ b/advsync/rcu.tex
@@ -1,4 +1,6 @@
 % advsync/rcu.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Read-Copy Update}
 \label{sec:advsync:Read-Copy Update}
diff --git a/advsync/rt.tex b/advsync/rt.tex
index 16f4d2ef..c55ad3dc 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1,4 +1,6 @@
 % advsync/rt.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Parallel Real-Time Computing}
 \label{sec:advsync:Parallel Real-Time Computing}
diff --git a/appendix/ack/ack.tex b/appendix/ack/ack.tex
index de06eb38..3a84bb36 100644
--- a/appendix/ack/ack.tex
+++ b/appendix/ack/ack.tex
@@ -1,4 +1,5 @@
 % appendix/ack/ack.tex
+% mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \chapter{Credits}
diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index 7b0d5c76..bb73e813 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -1,4 +1,5 @@
 % appendix/appendix.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \include{appendix/questions/questions}
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 5e83fc43..c56621bd 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -1,4 +1,6 @@
 % appendix/questions/after.tex
+% mainfile: ../../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{What Does ``After'' Mean?}
 \label{sec:app:questions:What Does ``After'' Mean?}
diff --git a/appendix/questions/concurrentparallel.tex b/appendix/questions/concurrentparallel.tex
index 76b3d8ae..d10f544d 100644
--- a/appendix/questions/concurrentparallel.tex
+++ b/appendix/questions/concurrentparallel.tex
@@ -1,4 +1,5 @@
 % appendix/questions/concurrentparallel.tex
+% mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{What is the Difference Between ``Concurrent'' and ``Parallel''?}
diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
index 54d9df12..6d7dc5ff 100644
--- a/appendix/questions/questions.tex
+++ b/appendix/questions/questions.tex
@@ -1,4 +1,5 @@
 % appendix/questions/questions.tex
+% mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{cha:app:Important Questions}{Important Questions}
diff --git a/appendix/questions/time.tex b/appendix/questions/time.tex
index 017d44e0..39bdf9cc 100644
--- a/appendix/questions/time.tex
+++ b/appendix/questions/time.tex
@@ -1,4 +1,5 @@
 % appendix/questions/time.tex
+% mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{What Time Is It?}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 1fdf6e11..91064b1e 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1,4 +1,5 @@
 % appendix/styleguide/styleguide.tex
+% mainfile: ../../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \chapter{Style Guide}
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 3bb1f1e4..7b53ebab 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1,4 +1,6 @@
 % appendix/toyrcu/toyrcu.tex
+% mainfile: ../../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:app:``Toy'' RCU Implementations}{``Toy'' RCU Implementations}
 
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 803aebac..7d5e1f5c 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1,4 +1,6 @@
 % appendix/whymb/whymemorybarriers.tex
+% mainfile: ../../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:app:whymb:Why Memory Barriers?}{Why Memory Barriers?}
 
diff --git a/count/count.tex b/count/count.tex
index 61a11f5e..484c69af 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1,4 +1,6 @@
 % count/count.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Counting}{Counting}
 %
diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index c3dd9fa7..401f7132 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -1,4 +1,5 @@
 % cpu/cpu.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Hardware and its Habits}{Hardware and its Habits}
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index ca814b48..e0be6e0e 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -1,4 +1,5 @@
 % cpu/hwfreelunch.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Hardware Free Lunch?}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index dbe73bfc..99abee89 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -1,4 +1,5 @@
 % cpu/overheads.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Overheads}
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 73ed2909..12be1158 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -1,4 +1,6 @@
 % cpu/overview.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Overview}
 \label{sec:cpu:Overview}
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index 869c0f25..3c127b61 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -1,4 +1,5 @@
 % cpu/swdesign.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Software Design Implications}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 2cb698b6..c4d0817d 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1,4 +1,6 @@
 % datastruct/datastruct.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Data Structures}{Data Structures}
 %
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index fc5e16e3..20436845 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1,4 +1,6 @@
 % debugging/debugging.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Validation}{Validation}
 %
diff --git a/defer/defer.tex b/defer/defer.tex
index e67e024f..8323de6b 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -1,4 +1,5 @@
 % defer/defer.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Deferred Processing}{Deferred Processing}
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index f384e804..8c9ac7e4 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -1,4 +1,5 @@
 % defer/hazptr.tex
+% mainfile: ../perfbook.tex
 % From an C++ Standards Committee meeting:  "Can I hazptr cheezeberger?"
 
 \section{Hazard Pointers}
diff --git a/defer/rcu.tex b/defer/rcu.tex
index ac982aaa..d7b7418d 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -1,4 +1,5 @@
-% rcu.tex
+% defer/rcu.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Read-Copy Update (RCU)}
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index ae0e3e2b..47bb2da2 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -1,4 +1,6 @@
 % defer/rcuAPI.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \subsection{RCU Linux-Kernel API}
 \label{sec:defer:RCU Linux-Kernel API}
diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
index c4592454..3dfa514e 100644
--- a/defer/rcuexercises.tex
+++ b/defer/rcuexercises.tex
@@ -1,4 +1,5 @@
 % defer/rcuexercises.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \subsection{RCU Exercises}
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 3e341950..562333f4 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -1,4 +1,6 @@
 % defer/rcufundamental.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \subsection{RCU Fundamentals}
 \label{sec:defer:RCU Fundamentals}
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 5633818e..b9b9400e 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -1,4 +1,6 @@
 % defer/rcuintro.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \subsection{Introduction to RCU}
 \label{sec:defer:Introduction to RCU}
diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 32fd3457..dba9000e 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -1,4 +1,6 @@
 % defer/rcurelated.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \subsection{RCU Related Work}
 \label{sec:defer:RCU Related Work}
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 16bf8603..9ccc0c92 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1,4 +1,6 @@
 % defer/rcuusage.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \subsection{RCU Usage}
 \label{sec:defer:RCU Usage}
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index f3853897..91a2f346 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -1,4 +1,6 @@
 % defer/refcnt.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Reference Counting}
 \label{sec:defer:Reference Counting}
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 6c48fd3b..0e9b74e8 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -1,4 +1,6 @@
 % defer/seqlock.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Sequence Locks}
 \label{sec:defer:Sequence Locks}
diff --git a/defer/updates.tex b/defer/updates.tex
index d3ab0f2f..df52d124 100644
--- a/defer/updates.tex
+++ b/defer/updates.tex
@@ -1,4 +1,5 @@
-% updates.tex
+% defer/updates.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{What About Updates?}
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 15df46a3..5c54e6c8 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -1,4 +1,5 @@
 % defer/whichtochoose.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Which to Choose?}
diff --git a/easy/easy.tex b/easy/easy.tex
index daee76fb..aaf48d89 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -1,4 +1,5 @@
 % easy/easy.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Ease of Use}{Ease of Use}
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 230fa9ce..e681a84e 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -1,4 +1,6 @@
 % formal/axiomatic.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Axiomatic Approaches}
 \label{sec:formal:Axiomatic Approaches}
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 7f0c6ac2..c2b9569f 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1,4 +1,6 @@
 % formal/dyntickrcu.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 % Disable frame around VerbatimN in two-column layout
 \IfTwoColumn{
diff --git a/formal/formal.tex b/formal/formal.tex
index 80ea5bd3..d0ea4bcb 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -1,4 +1,5 @@
 % formal/formal.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Formal Verification}{Formal Verification}
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 67b59572..2e9264fc 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -1,4 +1,6 @@
-% ppcmem.tex
+% formal/ppcmem.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Special-Purpose State-Space Search}
 \label{sec:formal:Special-Purpose State-Space Search}
diff --git a/formal/sat.tex b/formal/sat.tex
index 8cb00886..30d19746 100644
--- a/formal/sat.tex
+++ b/formal/sat.tex
@@ -1,4 +1,5 @@
 % formal/sat.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{SAT Solvers}
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index bae4ddaf..0356d1bf 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -1,4 +1,6 @@
 % formal/spinhint.html
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{State-Space Search}
 \label{sec:formal:State-Space Search}
diff --git a/formal/stateless.tex b/formal/stateless.tex
index 62734c27..17c63e67 100644
--- a/formal/stateless.tex
+++ b/formal/stateless.tex
@@ -1,4 +1,5 @@
 % formal/stateless.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Stateless Model Checkers}
diff --git a/future/cpu.tex b/future/cpu.tex
index be97b68a..a503989c 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -1,4 +1,5 @@
 % future/cpu.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{The Future of CPU Technology Ain't What it Used to Be}
diff --git a/future/formalregress.tex b/future/formalregress.tex
index b827a56c..7ce585e4 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -1,4 +1,5 @@
 % future/formalregress.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Formal Regression Testing?}
diff --git a/future/future.tex b/future/future.tex
index 7e256ac0..7c7f03c2 100644
--- a/future/future.tex
+++ b/future/future.tex
@@ -1,4 +1,5 @@
 % future/future.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Conflicting Visions of the Future}{Conflicting Visions of the Future}
diff --git a/future/htm.tex b/future/htm.tex
index 03d8de1e..ca9d3bb0 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -1,4 +1,6 @@
 % future/htm.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Hardware Transactional Memory}
 \label{sec:future:Hardware Transactional Memory}
diff --git a/future/tm.tex b/future/tm.tex
index 1a4f1b1b..a5081762 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -1,4 +1,6 @@
 % future/tm.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Transactional Memory}
 \label{sec:future:Transactional Memory}
diff --git a/glossary.tex b/glossary.tex
index 9bd40248..532c8a16 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -1,4 +1,5 @@
 % glossary.tex
+% mainfile: perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \chapter{Glossary and Bibliography}
diff --git a/howto/howto.tex b/howto/howto.tex
index 3bdec595..bbdacbf1 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -1,4 +1,6 @@
 % howto/howto.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:How To Use This Book}{How To Use This Book}
 %
diff --git a/intro/intro.tex b/intro/intro.tex
index 5eb6976a..5cde0b6b 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -1,4 +1,5 @@
 % intro/intro.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Introduction}{Introduction}
diff --git a/legal.tex b/legal.tex
index d589d31e..7c827795 100644
--- a/legal.tex
+++ b/legal.tex
@@ -1,4 +1,5 @@
 % legal.tex
+% mainfile: perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section*{Legal Statement}
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 0be581a2..294e5176 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -1,4 +1,6 @@
-% locking-existence.tex
+% locking/locking-existence.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Lock-Based Existence Guarantees}
 \label{sec:locking:Lock-Based Existence Guarantees}
diff --git a/locking/locking.tex b/locking/locking.tex
index c069b458..c088d051 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1,4 +1,6 @@
 % locking/locking.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Locking}{Locking}
 %
diff --git a/memalloc/memalloc.tex b/memalloc/memalloc.tex
index dfbb14a0..efd2776b 100644
--- a/memalloc/memalloc.tex
+++ b/memalloc/memalloc.tex
@@ -1,4 +1,5 @@
 % memalloc/memalloc.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \chapter{Memory Allocation}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index c686beb9..ffb8c796 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1,4 +1,6 @@
 % memorder/memorder.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}
 \OriginallyPublished{Chapter}{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}{the Linux kernel}{Howells2009membartxt}
diff --git a/owned/owned.tex b/owned/owned.tex
index 989fc067..6960f68e 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -1,4 +1,6 @@
 % owned/owned.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Data Ownership}{Data Ownership}
 %
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 9cb733bf..6f5c04dc 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -1,4 +1,6 @@
 % together/applyrcu.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{RCU Rescues}
 \label{sec:together:RCU Rescues}
diff --git a/together/count.tex b/together/count.tex
index 50766cad..0374d396 100644
--- a/together/count.tex
+++ b/together/count.tex
@@ -1,4 +1,5 @@
 % together/count.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Counter Conundrums}
diff --git a/together/hash.tex b/together/hash.tex
index d98f0ec3..e3ca7f81 100644
--- a/together/hash.tex
+++ b/together/hash.tex
@@ -1,4 +1,5 @@
 % together/hash.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Hashing Hassles}
diff --git a/together/refcnt.tex b/together/refcnt.tex
index aaecad4e..26e053a3 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -1,4 +1,6 @@
 % together/refcnt.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \section{Refurbish Reference Counting}
 \label{sec:together:Refurbish Reference Counting}
diff --git a/together/together.tex b/together/together.tex
index 81475678..88eb9568 100644
--- a/together/together.tex
+++ b/together/together.tex
@@ -1,4 +1,5 @@
 % together/together.tex
+% mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Putting It All Together}{Putting It All Together}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 1c755d48..b4c1e044 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1,4 +1,6 @@
 % toolsoftrade/toolsoftrade.tex
+% mainfile: ../perfbook.tex
+% SPDX-License-Identifier: CC-BY-SA-3.0
 
 \QuickQuizChapter{chp:Tools of the Trade}{Tools of the Trade}
 %
-- 
2.17.1


