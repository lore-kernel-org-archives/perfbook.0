Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ka9OxfaUhzlWYwK7eslAKUG45W8GCC/eDDlV50aOH50=;
        b=Gp3bBXX/0y+ztm5zhxMMd7NlumpC0NwGiyydgaVzQ80FAjLI/4C85TLvKRTMKAlCtS
         gYcujDhAXxt+OzzcfhP0e7ytjEpQo/LPTOGnqHh1qCmQi0SAYrfpzgTO3+c2rtXxz+fl
         pJelZg5axPdnsuv6kShViM399zFtaYGmL8pQiLSU8LDbJ+RUBrnBUK6h5f+V2M+Q7LRJ
         Pv/v/fmwqDxsFrTL1KUNIyYlhn/BFBY5jhNzSZrJL81z17EqyZm3Stlc4VI+74IrO4QY
         GNuWb3MHeRxMPljk6cSNQ15kLCVlfaMp4NW2gblaJcnpsJX4gDWTa01IDh6N3doaCSEZ
         Qg2A==
Message-ID: <dad2c450-653d-6a62-d1de-4be2bcc754c0@gmail.com>
Date: Wed, 4 Jan 2023 18:32:58 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/3] Redefine \epigraph to avoid boilerplate \emph{}
Content-Language: en-US
References: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

It is tedious and error prone to put an \emph{} command in every
\epigraph command.

Instead, redefine the \epigraph command to include \emph{} in the
source part and remove all those \emph{} commands from existing
\epigraph commands.

No change is intended in the output, except for the one at
Section 11.1 where "Filipe Fortes" did not have an \emph{}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex              |  6 +++---
 SMPdesign/beyond.tex                 |  4 ++--
 SMPdesign/criteria.tex               |  2 +-
 SMPdesign/partexercises.tex          |  2 +-
 ack.tex                              |  2 +-
 advsync/advsync.tex                  |  6 +++---
 advsync/rt.tex                       |  4 ++--
 appendix/questions/questions.tex     |  2 +-
 appendix/styleguide/styleguide.tex   |  2 +-
 appendix/toyrcu/toyrcu.tex           |  2 +-
 appendix/whymb/whymemorybarriers.tex |  2 +-
 count/count.tex                      | 12 ++++++------
 cpu/cpu.tex                          |  2 +-
 cpu/hwfreelunch.tex                  |  2 +-
 cpu/overheads.tex                    |  2 +-
 cpu/overview.tex                     |  2 +-
 cpu/swdesign.tex                     |  2 +-
 datastruct/datastruct.tex            | 16 ++++++++--------
 debugging/debugging.tex              | 18 +++++++++---------
 defer/defer.tex                      |  4 ++--
 defer/hazptr.tex                     |  2 +-
 defer/rcu.tex                        |  2 +-
 defer/seqlock.tex                    |  2 +-
 defer/updates.tex                    |  2 +-
 defer/whichtochoose.tex              |  2 +-
 easy/easy.tex                        | 10 +++++-----
 formal/axiomatic.tex                 |  2 +-
 formal/formal.tex                    |  6 +++---
 formal/ppcmem.tex                    |  2 +-
 formal/sat.tex                       |  2 +-
 formal/spinhint.tex                  |  2 +-
 formal/stateless.tex                 |  2 +-
 future/cpu.tex                       |  2 +-
 future/formalregress.tex             |  2 +-
 future/fp.tex                        |  2 +-
 future/future.tex                    |  2 +-
 future/htm.tex                       |  2 +-
 future/tm.tex                        |  2 +-
 glossary.tex                         |  4 ++--
 howto/howto.tex                      | 12 ++++++------
 intro/intro.tex                      | 12 ++++++------
 locking/locking-existence.tex        |  2 +-
 locking/locking.tex                  | 14 +++++++-------
 memorder/memorder.tex                | 14 +++++++-------
 owned/owned.tex                      | 14 +++++++-------
 perfbook-lt.tex                      |  2 ++
 qqz.sty                              |  2 +-
 summary.tex                          |  2 +-
 together/applyrcu.tex                |  2 +-
 together/count.tex                   |  2 +-
 together/hazptr.tex                  |  2 +-
 together/refcnt.tex                  |  2 +-
 together/seqlock.tex                 |  2 +-
 together/together.tex                |  2 +-
 toolsoftrade/toolsoftrade.tex        | 10 +++++-----
 55 files changed, 122 insertions(+), 120 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index f8a1b289bb8f..21eaf35ceb8d 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -4,7 +4,7 @@
 
 \QuickQuizChapter{cha:Partitioning and Synchronization Design}{Partitioning and Synchronization Design}{qqzSMPdesign}
 %
-\Epigraph{Divide and rule.}{\emph{Philip II of Macedon}}
+\Epigraph{Divide and rule.}{Philip II of Macedon}
 
 This chapter describes how to design software to take advantage of
 modern commodity multicore systems by using idioms, or
@@ -44,7 +44,7 @@ takes a brief look beyond partitioning.
 \label{sec:SMPdesign:Synchronization Granularity}
 %
 \epigraph{Doing little things well is a step toward doing big things better.}
-	 {\emph{Harry F.~Banks}}
+	 {Harry F.~Banks}
 
 \Cref{fig:SMPdesign:Design Patterns and Lock Granularity}
 gives a pictorial view of different levels of synchronization granularity,
@@ -849,7 +849,7 @@ or the parallel-fastpath approach discussed in the next section.
 %
 \epigraph{There are two ways of meeting difficulties:
 	  You alter the difficulties, or you alter yourself to meet them.}
-	 {\emph{Phyllis Bottome}}
+	 {Phyllis Bottome}
 
 Fine-grained (and therefore \emph{usually} higher-performance)
 designs are typically more complex than are coarser-grained designs.
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index f628ff550e57..0195a8e39c5f 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -7,7 +7,7 @@
 \OriginallyPublished{Section}{sec:SMPdesign:Beyond Partitioning}{Retrofitted Parallelism Considered Grossly Sub-Optimal}{4\textsuperscript{th} USENIX Workshop on Hot Topics on Parallelism}{PaulEMcKenney2012HOTPARsuboptimal}
 %
 \epigraph{It is all right to aim high if you have plenty of ammunition.}
-	 {\emph{Hawley R. Everhart}}
+	 {Hawley R. Everhart}
 
 This chapter has discussed how data partitioning can be used to design
 simple linearly scalable parallel programs.
@@ -688,7 +688,7 @@ to be retrofitted into existing programs.
 \label{sec:SMPdesign:Partitioning; Parallelism; and Optimization}
 %
 \epigraph{Knowledge is of no value unless you put it into practice.}
-	 {\emph{Anton Chekhov}}
+	 {Anton Chekhov}
 
 Most important, although this chapter has demonstrated that applying
 parallelism at the design level gives excellent results, this final
diff --git a/SMPdesign/criteria.tex b/SMPdesign/criteria.tex
index 4834f7afac79..d3d84506c870 100644
--- a/SMPdesign/criteria.tex
+++ b/SMPdesign/criteria.tex
@@ -6,7 +6,7 @@
 \label{sec:SMPdesign:Design Criteria}
 %
 \epigraph{One pound of learning requires ten pounds of commonsense to apply it.}
-	 {\emph{Persian proverb}}
+	 {Persian proverb}
 
 One way to obtain the best performance and scalability is to simply
 hack away until you converge on the best possible parallel program.
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 6f9622c16c3a..8fa468dcb035 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -8,7 +8,7 @@
 \epigraph{Whenever a theory appears to you as the only possible one,
 	  take this as a sign that you have neither understood the theory
 	  nor the problem which it was intended to solve.}
-	  {\emph{Karl Popper}}
+	  {Karl Popper}
 
 Although partitioning is more widely understood than it was in the early
 2000s, its value is still underappreciated.
diff --git a/ack.tex b/ack.tex
index 743b2bf46363..1794dee0df26 100644
--- a/ack.tex
+++ b/ack.tex
@@ -6,7 +6,7 @@
 \label{bck:ack:Credits}
 %
 \Epigraph{If I have seen further it is by standing on the shoulders of
-	  giants.}{\emph{Isaac Newton, modernized}}
+	  giants.}{Isaac Newton, modernized}
 
 % \section{Authors}
 
diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 3ff205e237b9..67861e6bcf9e 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{sec:advsync:Advanced Synchronization}{Advanced Synchronization}{qqzadvsync}
 %
 \Epigraph{If a little knowledge is a dangerous thing, just think what
-	  you could do with a lot of knowledge!}{\emph{Unknown}}
+	  you could do with a lot of knowledge!}{Unknown}
 
 This chapter covers synchronization techniques used for lockless
 algorithms and parallel real-time systems.
@@ -38,7 +38,7 @@ which is the topic of
 \label{sec:advsync:Avoiding Locks}
 %
 \epigraph{We are confronted with insurmountable opportunities.}
-	 {\emph{Walt Kelly}}
+	 {Walt Kelly}
 
 Although locking is the workhorse of parallelism in production, in
 many situations performance, scalability, and real-time response can
@@ -78,7 +78,7 @@ them, please re-read
 %
 \epigraph{Never worry about theory as long as the machinery does what
 	  it's supposed to do.}
-	 {\emph{Robert A. Heinlein}}
+	 {Robert A. Heinlein}
 
 The term \IXBacrfst{nbs}~\cite{MauriceHerlihy90a}
 describes eight classes of \IX{linearizable} algorithms with differing
diff --git a/advsync/rt.tex b/advsync/rt.tex
index e9db1b04fc37..aa39d4b8ecca 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -6,9 +6,9 @@
 \label{sec:advsync:Parallel Real-Time Computing}
 %
 \epigraph{One always has time enough if one applies it well.}
-	 {\emph{Johann Wolfgang von G\"othe}}
+	 {Johann Wolfgang von G\"othe}
 % \epigraph{The difference between you and me is that I was right in time.}
-% 	 {\emph{Konrad Adenauer}}
+% 	 {Konrad Adenauer}
 % No support for this quote found.
 
 An important emerging area in computing is that of parallel real-time
diff --git a/appendix/questions/questions.tex b/appendix/questions/questions.tex
index 2e407ffbe1f1..d302e454498d 100644
--- a/appendix/questions/questions.tex
+++ b/appendix/questions/questions.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{cha:app:Important Questions}{Important Questions}{qqzquestions}
 %
 \Epigraph{Ask me no questions, and I'll tell you no fibs.}
-	 {\emph{``She Stoops to Conquer'', Oliver Goldsmith}}
+	 {``She Stoops to Conquer'', Oliver Goldsmith}
 
 The following sections discuss some important questions relating to
 SMP programming.
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index d23207acea49..38beb510dc94 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -5,7 +5,7 @@
 \chapter{Style Guide}
 \label{chp:app:styleguide:Style Guide}
 %
-\Epigraph{De gustibus non est disputandum.}{\emph{Latin maxim}}
+\Epigraph{De gustibus non est disputandum.}{Latin maxim}
 
 This appendix is a collection of style guides which is intended
 as a reference to improve consistency in perfbook.
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index d91961637c89..0a1ecb2b6dde 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:app:``Toy'' RCU Implementations}{``Toy'' RCU Implementations}{qqztoyrcu}
 %
 \Epigraph{The only difference between men and boys is the price of their toys.}
-	 {\emph{M. H\'ebert}}
+	 {M. H\'ebert}
 % https://www.ncbi.nlm.nih.gov/pubmed/11548147
 
 The toy RCU implementations in this appendix are designed not for
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index ee9f96f17aaa..68ff37af3a37 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -6,7 +6,7 @@
 %
 \Epigraph{Order!
 	  Order in the court!}
-	 {\emph{Unknown}}
+	 {Unknown}
 
 So what possessed CPU designers to cause them to inflict \IXBpl{memory barrier}
 on poor unsuspecting SMP software designers?
diff --git a/count/count.tex b/count/count.tex
index 598ae1bd2636..31fb114cb35e 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -4,7 +4,7 @@
 
 \QuickQuizChapter{chp:Counting}{Counting}{qqzcount}
 %
-\Epigraph{As easy as 1, 2, 3!}{\emph{Unknown}}
+\Epigraph{As easy as 1, 2, 3!}{Unknown}
 
 Counting is perhaps the simplest and most natural thing a computer can do.
 However, counting efficiently and scalably on a large
@@ -160,7 +160,7 @@ are more advanced.
 \section{Why Isn't Concurrent Counting Trivial?}
 \label{sec:count:Why Isn't Concurrent Counting Trivial?}
 %
-\epigraph{Seek simplicity, and distrust it.}{\emph{Alfred North Whitehead}}
+\epigraph{Seek simplicity, and distrust it.}{Alfred North Whitehead}
 
 Let's start with something simple, for example, the straightforward
 use of arithmetic shown in
@@ -432,7 +432,7 @@ avoids the delays inherent in such circulation.
 \label{sec:count:Statistical Counters}
 %
 \epigraph{Facts are stubborn things, but statistics are pliable.}
-	 {\emph{Mark Twain}}
+	 {Mark Twain}
 
 This section covers the common special case of statistical counters, where
 the count is updated extremely frequently and the value is read out
@@ -1216,7 +1216,7 @@ near the beginning of this chapter.
 %
 \epigraph{An approximate answer to the right problem is worth a good deal
 	  more than an exact answer to an approximate problem.}
-	 {\emph{John Tukey}}
+	 {John Tukey}
 
 Another special case of counting involves limit-checking.
 For example, as noted in the approximate structure-allocation limit
@@ -1844,7 +1844,7 @@ with exact limits.
 \label{sec:count:Exact Limit Counters}
 %
 \epigraph{Exactitude can be expensive.
-	  Spend wisely.}{\emph{Unknown}}
+	  Spend wisely.}{Unknown}
 
 To solve the exact structure-allocation limit problem noted in
 \QuickQuizRef{\QcountQexactcnt},
@@ -2828,7 +2828,7 @@ device removal.
 %
 \epigraph{This idea that there is generality in the specific is of
 	  far-reaching importance.}
-	 {\emph{Douglas R. Hofstadter}}
+	 {Douglas R. Hofstadter}
 
 This chapter has presented the reliability, performance, and
 scalability problems with traditional counting primitives.
diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index 8a4afc69d59a..4f48b1fd56e9 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:Hardware and its Habits}{Hardware and its Habits}{qqzcpu}
 %
 \Epigraph{Premature abstraction is the root of all evil.}
-	 {\emph{A cast of thousands}}
+	 {A cast of thousands}
 
 Most people intuitively understand that passing messages between systems
 is more expensive than performing simple calculations within the confines
diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
index b0d917588d1a..339a50d6a25d 100644
--- a/cpu/hwfreelunch.tex
+++ b/cpu/hwfreelunch.tex
@@ -9,7 +9,7 @@
 	  for someone else to do something for them.
 	  The solution to most of our troubles is to be found in everyone
 	  doing something for themselves.}
-	 {\emph{Henry Ford, updated}}
+	 {Henry Ford, updated}
 
 The major reason that concurrency has been receiving so much focus over
 the past few years is the end of \IXaltr{Moore's-Law}{Moore's Law}
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index c9f5f1f72d34..0d8270bf6e17 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{Don't design bridges in ignorance of materials, and don't design
 	  low-level software in ignorance of the underlying hardware.}
-	 {\emph{Unknown}}
+	 {Unknown}
 
 This section presents actual \IXpl{overhead} of the obstacles to performance
 listed out in the previous section.
diff --git a/cpu/overview.tex b/cpu/overview.tex
index c3302669b1a5..8c52fca64cd2 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{Mechanical Sympathy:
 	  Hardware and software working together in harmony.}
-	 {\emph{Martin Thompson}}
+	 {Martin Thompson}
 
 Careless reading of computer-system specification sheets might lead one
 to believe that CPU performance is a footrace on a clear track, as
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index 75541229d167..2421f3a9ef2a 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -9,7 +9,7 @@
 	  While the self-same breezes blow; \\
 	  'Tis the set of the sail and not the gail \\
 	  That bids them where to go.}
-	 {\emph{Ella Wheeler Wilcox}}
+	 {Ella Wheeler Wilcox}
 
 The values of the ratios in
 \cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index f61ee076d9c7..2768a4d34f39 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -7,7 +7,7 @@
 \Epigraph{Bad programmers worry about the code.
 	  Good programmers worry about data structures and their
 	  relationships.}
-	 {\emph{Linus Torvalds}}
+	 {Linus Torvalds}
 
 Serious discussions of algorithms include time complexity of their
 data structures~\cite{ThomasHCorman2001Algorithms}.
@@ -48,7 +48,7 @@ presents a summary of this chapter.
 %
 \epigraph{The art of doing mathematics consists in finding that special
 	  case which contains all the germs of generality.}
-	 {\emph{David Hilbert}}
+	 {David Hilbert}
 
 We will use the Schr\"odinger's Zoo application to evaluate
 performance~\cite{McKenney:2013:SDS:2483852.2483867}.
@@ -77,7 +77,7 @@ data structures.
 %
 \epigraph{Finding a way to live the simple life today is the most
 	  complicated task.}
-	 {\emph{Henry A. Courtney, updated}}
+	 {Henry A. Courtney, updated}
 
 There are a huge number of data structures in use today, so much so
 that there are multiple textbooks covering them.
@@ -449,7 +449,7 @@ read-mostly cases where updates are rare, but could happen at any time.
 \section{Read-Mostly Data Structures}
 \label{sec:datastruct:Read-Mostly Data Structures}
 %
-\epigraph{Adapt the remedy to the disease.}{\emph{Chinese proverb}}
+\epigraph{Adapt the remedy to the disease.}{Chinese proverb}
 
 Although partitioned data structures can offer excellent scalability,
 \IXacr{numa} effects can result in severe degradations of both performance and
@@ -1064,7 +1064,7 @@ or all of the above.
 %
 \epigraph{Don't be afraid to take a big step if one is indicated.
 	  You can't cross a chasm in two small steps.}
-	 {\emph{David Lloyd George}}
+	 {David Lloyd George}
 
 Fixed-size hash tables are perfectly partitionable, but resizable hash
 tables pose partitioning challenges when growing or shrinking, as
@@ -1896,7 +1896,7 @@ library~\cite{MathieuDesnoyers2009URCU}.
 %
 \epigraph{All life is an experiment.
 	  The more experiments you make the better.}
-	 {\emph{Ralph Waldo Emerson}}
+	 {Ralph Waldo Emerson}
 
 The preceding sections have focused on data structures that enhance
 concurrency due to partitionability
@@ -1973,7 +1973,7 @@ produce novel algorithms with surprising properties.
 \section{Micro-Optimization}
 \label{sec:datastruct:Micro-Optimization}
 %
-\epigraph{The devil is in the details.}{\emph{Unknown}}
+\epigraph{The devil is in the details.}{Unknown}
 
 The data structures shown in this section were coded straightforwardly,
 with no adaptation to the underlying system's cache hierarchy.
@@ -2251,7 +2251,7 @@ to a given situation.
 %
 \epigraph{There's only one thing more painful than learning from
 	  experience, and that is not learning from experience.}
-	 {\emph{Archibald MacLeish}}
+	 {Archibald MacLeish}
 
 This chapter has focused primarily on hash tables, including resizable
 hash tables, which are not fully partitionable.
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 172ed0ef8a22..4568f90a5cb7 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -4,7 +4,7 @@
 
 \QuickQuizChapter{chp:Validation}{Validation}{qqzdebugging}
 %
-\Epigraph{If it is not tested, it doesn't work.}{\emph{Unknown}}
+\Epigraph{If it is not tested, it doesn't work.}{Unknown}
 
 I have had a few parallel programs work the first time, but that is only
 because I have written a large number parallel programs over the past three
@@ -62,7 +62,7 @@ sleep!
 %
 % \epigraph{If debugging is the process of removing software bugs, then
 % 	  programming must be the process of putting them in.}
-% 	 {\emph{Edsger W.~Dijkstra}}
+% 	 {Edsger W.~Dijkstra}
 \epigraph{Debugging is like being the detective in a crime movie where
 	  you are also the murderer.}
 	 {Filipe Fortes}
@@ -648,7 +648,7 @@ you already have a good test suite.
 \label{sec:debugging:Tracing}
 %
 \epigraph{The machine knows what is wrong.
-	  Make it tell you.}{\emph{Unknown}}
+	  Make it tell you.}{Unknown}
 
 When all else fails, add a \co{printk()}!
 Or a \co{printf()}, if you are working with user-mode C-language applications.
@@ -714,7 +714,7 @@ In such cases, assertions can be helpful.
 \label{sec:debugging:Assertions}
 %
 \epigraph{No man really becomes a fool until he stops asking questions.}
-	 {\emph{Charles P. Steinmetz}}
+	 {Charles P. Steinmetz}
 
 Assertions are usually implemented in the following manner:
 
@@ -784,7 +784,7 @@ One approach is static analysis, which is discussed in the next section.
 %
 \epigraph{A lot of automation isn't a replacement of
 	  humans but of mind-numbing behavior.}
-	 {\emph{Summarized from Stewart Butterfield}}
+	 {Summarized from Stewart Butterfield}
 
 Static analysis is a validation technique where one program takes a second
 program as input, reporting errors and vulnerabilities located in this
@@ -824,7 +824,7 @@ describe more sophisticated forms of static analysis.
 %
 \epigraph{If a man speaks of my virtues, he steals from me;
 	  if he speaks of my vices, then he is my teacher.}
-	 {\emph{Chinese proverb}}
+	 {Chinese proverb}
 
 Code review is a special case of static analysis with human beings doing
 the analysis.
@@ -1161,7 +1161,7 @@ occur all too commonly when validating parallel software.
 %
 \epigraph{With both heisenbugs and impressionist art, the closer you
 	  get, the less you see.}
-	 {\emph{Unknown}}
+	 {Unknown}
 
 So your parallel program fails sometimes.
 But you used techniques from the earlier sections to locate
@@ -2066,7 +2066,7 @@ would be happy to thwart this Kiplingesque goal.
 \label{sec:debugging:Performance Estimation}
 %
 \epigraph{There are lies, damn lies, statistics, and benchmarks.}
-	 {\emph{Unknown}}
+	 {Unknown}
 
 Parallel programs usually have performance and scalability requirements,
 after all, if performance is not an issue, why not use a sequential
@@ -2698,7 +2698,7 @@ detecting interference via measurement
 %
 % \epigraph{To err is human---but it feels devine.}{\emph{Mae West}}
 \epigraph{To err is human!
-	  Stop being human!!!}{\emph{Ed Nofziger}}
+	  Stop being human!!!}{Ed Nofziger}
 
 Although validation never will be an exact science, much can be gained
 by taking an organized approach to it, as an organized approach will
diff --git a/defer/defer.tex b/defer/defer.tex
index be5f997bde97..fb0f51a3e29b 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -4,7 +4,7 @@
 
 \QuickQuizChapter{chp:Deferred Processing}{Deferred Processing}{qqzdefer}
 %
-\Epigraph{All things come to those who wait.}{\emph{Violet Fane}}
+\Epigraph{All things come to those who wait.}{Violet Fane}
 
 The strategy of deferring work goes back before the dawn of recorded
 history.
@@ -32,7 +32,7 @@ algorithm that will be used to compare and contrast these approaches.
 \label{sec:defer:Running Example}
 %
 \epigraph{An ounce of application is worth a ton of abstraction.}
-	 {\emph{Booker T.~Washington}}
+	 {Booker T.~Washington}
 
 This chapter will use a simplified packet-routing algorithm to demonstrate
 the value of these approaches and to allow them to be compared.
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 842924668015..7835807c7cbd 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -5,7 +5,7 @@
 \section{Hazard Pointers}
 \label{sec:defer:Hazard Pointers}
 %
-\epigraph{If in doubt, turn it inside out.}{\emph{Zara Carpenter}}
+\epigraph{If in doubt, turn it inside out.}{Zara Carpenter}
 
 One way of avoiding problems with concurrent reference counting
 is to implement the reference counters
diff --git a/defer/rcu.tex b/defer/rcu.tex
index 88e708730783..99f01af85d13 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -5,7 +5,7 @@
 \section{Read-Copy Update (RCU)}
 \label{sec:defer:Read-Copy Update (RCU)}
 %
-\epigraph{``Free'' is a \emph{very} good price!}{\emph{Tom Peterson}}
+\epigraph{``Free'' is a \emph{very} good price!}{Tom Peterson}
 
 All of the mechanisms discussed in the preceding sections
 used one of a number of approaches to defer specific actions
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index f435a1afeb4b..180916a7cb0f 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -5,7 +5,7 @@
 \section{Sequence Locks}
 \label{sec:defer:Sequence Locks}
 %
-\epigraph{It'll be just like starting over.}{\emph{John Lennon}}
+\epigraph{It'll be just like starting over.}{John Lennon}
 
 The published sequence-lock
 record~\cite{10.1145/800212.806505,10.1145/359863.359878}
diff --git a/defer/updates.tex b/defer/updates.tex
index 8b2310114bcd..b6dda7475ce6 100644
--- a/defer/updates.tex
+++ b/defer/updates.tex
@@ -6,7 +6,7 @@
 \label{sec:defer:What About Updates?}
 %
 \epigraph{The only thing constant in life is change.}
-	 {\emph{Fran\c{c}ois de la Rochefoucauld}}
+	 {Fran\c{c}ois de la Rochefoucauld}
 
 The deferred-processing techniques called out in this chapter are most
 directly applicable to read-mostly situations, which begs the question
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index dad3217aefce..c2ea14f6f645 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{Choose always the way that seems the best, however rough it
 	  may be; custom will soon render it easy and agreeable.}
-	  {\emph{Pythagoras}}
+	  {Pythagoras}
 
 \Cref{sec:defer:Which to Choose? (Overview)}
 provides a high-level overview and then
diff --git a/easy/easy.tex b/easy/easy.tex
index 75da6aeac170..6c20dfb68aae 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -7,15 +7,15 @@
 \Epigraph{Creating a perfect API is like committing the perfect crime.
 	  There are at least fifty things that can go wrong, and if you are
 	  a genius, you might be able to anticipate twenty-five of them.}
-	 {\emph{With apologies to any Kathleen Turner fans who might
-	  still be alive.}}
+	 {With apologies to any Kathleen Turner fans who might
+	  still be alive.}
 
 \section{What is Easy?}
 \label{sec:easy:What is Easy?}
 %
 \epigraph{When someone says ``I want a programming language in which I
 	  need only say what I wish done,'' give them a lollipop.}
-	 {\emph{Alan J.~ Perlis, updated}}
+	 {Alan J.~ Perlis, updated}
 % http://www.cs.yale.edu/homes/perlis-alan/quotes.html
 
 If you are tempted to look down on ease-of-use requirements, please
@@ -62,7 +62,7 @@ things are covered in the next section.
 \epigraph{Finding the appropriate measurement is thus not a mathematical
 	  exercise.
 	  It is a risk-taking judgment.}
-	 {\emph{Peter Drucker}}
+	 {Peter Drucker}
 % http://billhennessy.com/simple-strategies/2015/09/09/i-wish-drucker-never-said-it
 % Rusty is OK with this: July 19, 2006.
 
@@ -150,7 +150,7 @@ Linux kernel:
 \label{sec:easy:Shaving the Mandelbrot Set}
 %
 \epigraph{Simplicity does not precede complexity, \\ but follows it.}
-	 {\emph{Alan J.~Perlis}}
+	 {Alan J.~Perlis}
 
 The set of useful programs resembles the Mandelbrot set
 (shown in \cref{fig:easy:Mandelbrot Set})
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 1ee12cc6489d..80c5cafa0459 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -7,7 +7,7 @@
 \OriginallyPublished{Section}{sec:formal:Axiomatic Approaches}{Axiomatic Approaches}{Linux Weekly News}{PaulEMcKenney2014weakaxiom}
 %
 \epigraph{Theory helps us to bear our ignorance of facts.}
-	{\emph{George Santayana}}
+	{George Santayana}
 
 Although the PPCMEM tool can solve the famous ``independent reads of
 independent writes'' (IRIW) litmus test shown in
diff --git a/formal/formal.tex b/formal/formal.tex
index f8c9454d8ff6..895d2ba7360c 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:Formal Verification}{Formal Verification}{qqzformal}
 %
 \Epigraph{Beware of bugs in the above code; I have only proved it correct,
-	  not tried it.}{\emph{Donald Knuth}}
+	  not tried it.}{Donald Knuth}
 
 \OriginallyPublished{Chapter}{chp:Formal Verification}{Formal Verification}{Linux Weekly News}{PaulEMcKenney2007QRCUspin,PaulEMcKenney2008dynticksRCU,PaulEMcKenney2011ppcmem}
 
@@ -54,7 +54,7 @@ to a given software project.
 %
 \epigraph{Western thought has focused on True-False;
 	  it is high time to shift to Robust-Fragile.}
-	 {\emph{Nassim Nicholas Taleb, summarized}}
+	 {Nassim Nicholas Taleb, summarized}
 % Full quote:
 % Since Plato, Western thought and the theory of knowledge has focused on
 % the notions of True-False; as commendable as that was, it is high time
@@ -224,7 +224,7 @@ Have at it!!!
 %
 \epigraph{Science is a first-rate piece of furniture for one's upper
 	  chamber, but only given common sense on the ground floor.}
-	 {\emph{Oliver Wendell Holmes, updated}}
+	 {Oliver Wendell Holmes, updated}
 
 What sort of validation should you use for your project?
 
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 8664ee4e6a66..9f584b153e1a 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -5,7 +5,7 @@
 \section{Special-Purpose State-Space Search}
 \label{sec:formal:Special-Purpose State-Space Search}
 %
-\epigraph{Jack of all trades, master of none.}{\emph{Unknown}}
+\epigraph{Jack of all trades, master of none.}{Unknown}
 
 Although Promela and spin allow you to verify pretty much any (smallish)
 algorithm, their very generality can sometimes be a curse.
diff --git a/formal/sat.tex b/formal/sat.tex
index c17d5c712b92..ba90d74fac80 100644
--- a/formal/sat.tex
+++ b/formal/sat.tex
@@ -5,7 +5,7 @@
 \section{SAT Solvers}
 \label{sec:formal:SAT Solvers}
 %
-\epigraph{Live by the heuristic, die by the heuristic.}{\emph{Unknown}}
+\epigraph{Live by the heuristic, die by the heuristic.}{Unknown}
 
 Any finite program with bounded loops and recursion can be converted
 into a logic expression, which might express that program's assertions
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 66d4c964a2f5..e0659b498f12 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -6,7 +6,7 @@
 \label{sec:formal:State-Space Search}
 %
 \epigraph{Follow every byway / Every path you know.}
-	 {\emph{``Climb Every Mountain'', Rodgers \& Hammerstein}}
+	 {``Climb Every Mountain'', Rodgers \& Hammerstein}
 
 This section features the general-purpose Promela and Spin tools,
 which may be used to carry out a full
diff --git a/formal/stateless.tex b/formal/stateless.tex
index 06c09c183f55..604c4fbf3cc8 100644
--- a/formal/stateless.tex
+++ b/formal/stateless.tex
@@ -6,7 +6,7 @@
 \label{sec:formal:Stateless Model Checkers}
 %
 \epigraph{He's making a list, he's permuting it twice\dots}
-	{\emph{with apologies to Haven Gillespie and J. Fred Coots}}
+	{with apologies to Haven Gillespie and J. Fred Coots}
 
 The SAT-solver approaches described in the previous section are quite
 convenient and powerful, but the full tracking of all possible
diff --git a/future/cpu.tex b/future/cpu.tex
index 183731b9121a..9092e3106636 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -5,7 +5,7 @@
 \section{The Future of CPU Technology Ain't What it Used to Be}
 \label{sec:future:The Future of CPU Technology Ain't What it Used to Be}
 %
-\epigraph{A great future behind him.}{\emph{David Maraniss}}
+\epigraph{A great future behind him.}{David Maraniss}
 
 Years past always seem so simple and innocent when viewed through the
 lens of many years of experience.
diff --git a/future/formalregress.tex b/future/formalregress.tex
index a567fe45ef8e..a50df4ad9a7f 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{Theory without experiments:
 	  Have we gone too far?}
-	 {\emph{Michael Mitzenmacher}}
+	 {Michael Mitzenmacher}
 
 Formal verification has long proven useful in a number of production
 environments~\cite{JamesRLarus2004RightingSoftware,AlBessey2010BillionLoCLater,ByronCook2018FormalAmazon,CaitlinSadowski2018staticAnalysisGoogle,DinoDistefano2019FBstaticAnalysis}.
diff --git a/future/fp.tex b/future/fp.tex
index 64da41ed6ca1..3bad65bf9201 100644
--- a/future/fp.tex
+++ b/future/fp.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{The curious failure of functional programming for parallel
 	  applications.}
-	 {\emph{Malte Skarupke}}
+	 {Malte Skarupke}
 
 When I took my first-ever functional-programming class in the early 1980s,
 the professor asserted that the side-effect-free functional-programming
diff --git a/future/future.tex b/future/future.tex
index 8bd8fe72f5b2..91f8d06b2862 100644
--- a/future/future.tex
+++ b/future/future.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:Conflicting Visions of the Future}{Conflicting Visions of the Future}{qqzfuture}
 %
 \Epigraph{Prediction is very difficult, especially about the future.}
-	 {\emph{Niels Bohr}}
+	 {Niels Bohr}
 
 This chapter presents some conflicting visions of the future of parallel
 programming.
diff --git a/future/htm.tex b/future/htm.tex
index bf78d5ea9beb..1404169e66be 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -8,7 +8,7 @@
 \epigraph{Make sure your report system is reasonably clean and efficient
 	  before you automate.
 	  Otherwise, your new computer will just speed up the mess.}
-	 {\emph{Robert Townsend}}
+	 {Robert Townsend}
 % If at first you do succeed---try to hide your astonishment.
 % Harry F.~Banks
 
diff --git a/future/tm.tex b/future/tm.tex
index 8d8812cffb40..4af2da8da520 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -5,7 +5,7 @@
 \section{Transactional Memory}
 \label{sec:future:Transactional Memory}
 \epigraph{Everything should be as simple as it can be, but not simpler.}
-	 {\emph{Albert Einstein, by way of Louis Zukofsky}}
+	 {Albert Einstein, by way of Louis Zukofsky}
 
 The idea of using transactions outside of databases goes back many
 decades~\cite{DBLomet1977SIGSOFT,Knight:1986:AMF:319838.319854,Herlihy93a},
diff --git a/glossary.tex b/glossary.tex
index accd5e9c9de8..e1f8cb90e6fe 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -5,8 +5,8 @@
 \chapter{Glossary}
 %
 \Epigraph{Dictionaries are inherently circular in nature.}
-	 {\emph{``Self Reference in word definitions'',
-	        David~Levary~et~al.}}
+	 {``Self Reference in word definitions'',
+	        David~Levary~et~al.}
 
 \begin{description}
 \item[\IXG{Acquire Load}:]
diff --git a/howto/howto.tex b/howto/howto.tex
index b237733b769c..3782492d8c70 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:How To Use This Book}{How To Use This Book}{qqzhowto}
 %
 \Epigraph{If you would only recognize that life is hard, things would be so
-	  much easier for you.}{\emph{Louis D. Brandeis}}
+	  much easier for you.}{Louis D. Brandeis}
 
 The purpose of this book is to help you program
 shared-memory parallel systems without risking your sanity.\footnote{
@@ -56,7 +56,7 @@ that it has brought to us!
 		I don't know. \\
 	  Cat:
 		Then it doesn't matter which way you go.}
-	 {\emph{Lewis Carroll, Alice in Wonderland}}
+	 {Lewis Carroll, Alice in Wonderland}
 
 This book is a handbook of widely applicable and heavily
 used design techniques, rather than
@@ -147,7 +147,7 @@ the next section.
 \label{sec:howto:Quick Quizzes}
 %
 \epigraph{Undertake something difficult, otherwise you will never grow.}
-	 {\emph{Abbreviated from Ronald E.~Osburn}}
+	 {Abbreviated from Ronald E.~Osburn}
 
 ``Quick quizzes'' appear throughout this book, and the answers may
 be found in
@@ -316,7 +316,7 @@ The quick quizzes can be an extremely effective cure.
 \label{sec:Alternatives to This Book}
 %
 \epigraph{Between two evils I always pick the one I never tried before.}
-	 {\emph{Mae West}}
+	 {Mae West}
 
 As \pplsur{Donald}{Knuth} learned the hard way, if you want your book
 to be finite, it must be focused.
@@ -459,7 +459,7 @@ for low-level software, especially software written in C, read on!
 \section{Sample Source Code}
 \label{sec:howto:Sample Source Code}
 %
-\epigraph{Use the source, Luke!}{\emph{Unknown Star Wars fan}}
+\epigraph{Use the source, Luke!}{Unknown Star Wars fan}
 
 This book discusses its fair share of source code, and in many cases
 this source code may be found in the \path{CodeSamples} directory
@@ -478,7 +478,7 @@ Non-UNIX systems have their own well-known ways of locating files by filename.
 \label{sec:howto:Whose Book Is This?}
 %
 \epigraph{If you become a teacher, by your pupils you'll be taught.}
-	 {\emph{Oscar Hammerstein II}}
+	 {Oscar Hammerstein II}
 
 As the cover says, the editor is one Paul E.~McKenney.
 However, the editor does accept contributions via the
diff --git a/intro/intro.tex b/intro/intro.tex
index 2c7ad97b8111..f16f3acdec1d 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:Introduction}{Introduction}{qqzintro}
 %
 \Epigraph{If parallel programming is so hard, why are there so many
-	  parallel programs?}{\emph{Unknown}}
+	  parallel programs?}{Unknown}
 
 Parallel programming has earned a reputation as one of the most
 difficult areas a hacker can tackle.
@@ -57,7 +57,7 @@ counter-examples in many fields of endeavor.
 %
 \epigraph{Not the power to remember, but its very opposite, the power to
 	  forget, is a necessary condition for our existence.}
-	 {\emph{Sholem Asch}}
+	 {Sholem Asch}
 
 As indicated by its title, this book takes a different approach.
 Rather than complain about the difficulty of parallel programming,
@@ -244,7 +244,7 @@ This topic is addressed in the next section.
 \label{sec:intro:Parallel Programming Goals}
 %
 \epigraph{If you don't know where you are going, you will end up somewhere
-	  else.}{\emph{Yogi Berra}}
+	  else.}{Yogi Berra}
 
 The three major goals of parallel programming (over and above those
 of sequential programming) are as follows:
@@ -697,7 +697,7 @@ it is not always the best tool for the job.
 \label{sec:intro:Alternatives to Parallel Programming}
 %
 \epigraph{Experiment is folly when experience shows the way.}
-	 {\emph{Roger M. Babson}}
+	 {Roger M. Babson}
 
 In order to properly consider alternatives to parallel programming,
 you must first decide on what exactly you expect the parallelism
@@ -877,7 +877,7 @@ programming so difficult?''
 \label{sec:intro:What Makes Parallel Programming Hard?}
 %
 \epigraph{Real difficulties can be overcome; it is only the imaginary
-	  ones that are unconquerable.}{\emph{Theodore N.~Vail}}
+	  ones that are unconquerable.}{Theodore N.~Vail}
 
 \OriginallyPublished{Section}{sec:intro:What Makes Parallel Programming Hard?}{What Makes Parallel Programming Hard?}{a Portland State University Technical Report}{PaulEMcKenney2009ProgrammingHard}
 
@@ -1235,7 +1235,7 @@ as parallel systems continue to become cheaper and more readily available.
 \label{sec:intro:Discussion}
 %
 \epigraph{Until you try, you don't know what you can't do.}
-	 {\emph{Henry James}}
+	 {Henry James}
 
 This section has given an overview of the difficulties with, goals of,
 and alternatives to parallel programming.
diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index d0ee690cfc6a..151dab5f3b76 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -5,7 +5,7 @@
 \section{Lock-Based Existence Guarantees}
 \label{sec:locking:Lock-Based Existence Guarantees}
 %
-\epigraph{Existence precedes and rules essence.}{\emph{Jean-Paul Sartre}}
+\epigraph{Existence precedes and rules essence.}{Jean-Paul Sartre}
 
 A key challenge in parallel programming is to provide
 \emph{\IXpl{existence guarantee}}~\cite{Gamsa99},
diff --git a/locking/locking.tex b/locking/locking.tex
index ac8bab8c8a1b..8f4ff4cc2d1f 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -6,9 +6,9 @@
 %
 \Epigraph{Locking is the worst general-purpose synchronization mechanism
 	  except for all those other mechanisms that
-	  have been tried from time to time.}{\emph{With apologies
+	  have been tried from time to time.}{With apologies
 	  to the memory of Winston Churchill and to whoever he was
-	  quoting}}
+	  quoting}
 
 In recent concurrency research, locking often plays the role of villain.
 \IX{Locking} stands accused of inciting deadlocks, convoying, \IX{starvation},
@@ -96,7 +96,7 @@ more serious sins.
 \section{Staying Alive}
 \label{sec:locking:Staying Alive}
 %
-\epigraph{I work to stay alive.}{\emph{Bette Davis}}
+\epigraph{I work to stay alive.}{Bette Davis}
 
 Given that locking stands accused of deadlock and starvation,
 one important concern for shared-memory parallel developers is
@@ -1253,7 +1253,7 @@ to other locking use cases.
 %
 \epigraph{Only locks in life are what you think you know, but don't.
 	  Accept your ignorance and try something new.}
-	 {\emph{Dennis Vickers}}
+	 {Dennis Vickers}
 
 There are a surprising number of types of locks, more than this
 short chapter can possibly do justice to.
@@ -1868,7 +1868,7 @@ be required for the foreseeable future.
 \epigraph{When you translate a dream into reality, it's never a full
 	  implementation.
 	  It is easier to dream than to do.}
-	 {\emph{Shai Agassi}}
+	 {Shai Agassi}
 
 Developers are almost always best-served by using whatever locking
 primitives are provided by the system, for example, the POSIX
@@ -2203,7 +2203,7 @@ roll-your-own efforts is that the standard primitives are typically
 %
 \epigraph{You either die a hero or you live long enough to see yourself
 	  become the villain.}
-	 {\emph{Aaron Eckhart} as \emph{Harvey Dent}}
+	 {Aaron Eckhart \emph{as} Harvey Dent}
 
 As is often the case in real life, locking can be either hero or villain,
 depending on how it is used and on the problem at hand.
@@ -2678,7 +2678,7 @@ the problem at hand.
 \section{Summary}
 \label{sec:locking:Summary}
 %
-\epigraph{Achievement unlocked.}{\emph{Unknown}}
+\epigraph{Achievement unlocked.}{Unknown}
 
 Locking is perhaps the most widely used and most generally useful
 synchronization tool.
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 0c96d43bccc3..571c1ba24919 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -7,7 +7,7 @@
 \OriginallyPublished{Chapter}{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}{Linux Weekly News}{JadeAlglave2017LWN-LKMM-1,JadeAlglave2017LWN-LKMM-2}
 \OriginallyPublished{Chapter}{chp:Advanced Synchronization: Memory Ordering}{Advanced Synchronization: Memory Ordering}{ASPLOS '18}{Alglave:2018:FSC:3173162.3177156}
 %
-\Epigraph{The art of progress is to preserve order amid change and to preserve change amid order.}{\emph{Alfred North Whitehead}}
+\Epigraph{The art of progress is to preserve order amid change and to preserve change amid order.}{Alfred North Whitehead}
 
 Causality and sequencing are deeply intuitive, and hackers often
 have a strong grasp of these concepts.
@@ -68,7 +68,7 @@ provides some useful rules of thumb.
 %
 \epigraph{Nothing is orderly till people take hold of it.
 	  Everything in creation lies around loose.}
-	 {\emph{Henry Ward Beecher, updated}}
+	 {Henry Ward Beecher, updated}
 
 One motivation for memory ordering can be seen in the trivial-seeming
 litmus test in
@@ -829,7 +829,7 @@ and traps.
 \label{sec:memorder:Tricks and Traps}
 %
 \epigraph{Knowing where the trap is---that's the first step in evading it.}
-	 {\emph{Duke Leto Atreides, ``Dune'', Frank Herbert}}
+	 {Duke Leto Atreides, ``Dune'', Frank Herbert}
 
 Now that you know that hardware can reorder memory accesses and that you
 can prevent it from doing so, the next step is to get you to admit
@@ -2411,7 +2411,7 @@ sea of more complex memory-ordering constraints.
 \label{sec:memorder:Compile-Time Consternation}
 %
 \epigraph{Science increases our power in proportion as it lowers our pride.}
-	 {\emph{Claude Bernard}}
+	 {Claude Bernard}
 
 Most languages, including C, were developed on uniprocessor systems
 by people with little or no parallel-programming experience.
@@ -3238,7 +3238,7 @@ special attention to your memory references and dependencies.
 \label{sec:memorder:Higher-Level Primitives}
 %
 \epigraph{Method will teach you to win time.}
-	 {\emph{Johann Wolfgang von Goethe}}
+	 {Johann Wolfgang von Goethe}
 
 The answer to one of the quick quizzes in
 \cref{sec:formal:Axiomatic Approaches and Locking}
@@ -4125,7 +4125,7 @@ enable more capable static analysis and model checking.
 \label{sec:memorder:Hardware Specifics}
 \OriginallyPublished{Section}{sec:memorder:Hardware Specifics}{Memory-Barrier Instructions For Specific CPUs}{Linux Journal}{PaulMcKenney2005i,PaulMcKenney2005j}
 %
-\epigraph{Rock beats paper!}{\emph{Derek Williams}}
+\epigraph{Rock beats paper!}{Derek Williams}
 
 Each CPU family has its own peculiar approach to memory ordering, which
 can make portability a challenge, as indicated by
@@ -5180,7 +5180,7 @@ aforementioned \qco{bcr 15,0} instruction), and test-and-set.
 %
 \epigraph{Almost all people are intelligent.
 	  It is method that they lack.}
-	 {\emph{F. W. Nichol}}
+	 {F. W. Nichol}
 
 This section revisits
 \cref{tab:memorder:Linux-Kernel Memory-Ordering Cheat Sheet}
diff --git a/owned/owned.tex b/owned/owned.tex
index 0d1d17f14f0c..64db481b77a6 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -8,7 +8,7 @@
 	  My own.
 	  My precious.
 	  Yes, my precious.}
-	 {\emph{Gollum in ``The Fellowship of the Ring'', J.R.R.~Tolkien}}
+	 {Gollum in ``The Fellowship of the Ring'', J.R.R.~Tolkien}
 
 One of the simplest ways to avoid the synchronization overhead that
 comes with locking is to parcel the data out among the threads (or,
@@ -57,7 +57,7 @@ first-class citizen.
 \section{Multiple Processes}
 \label{sec:owned:Multiple Processes}
 %
-\epigraph{A man's home is his castle}{\emph{Ancient Laws of England}}
+\epigraph{A man's home is his castle}{Ancient Laws of England}
 
 \Cref{sec:toolsoftrade:Scripting Languages}
 introduced the following example:
@@ -156,7 +156,7 @@ parallel programs.
 \label{sec:owned:Partial Data Ownership and pthreads}
 %
 \epigraph{Give thy mind more to what thou hast than to what thou hast not.}
-	 {\emph{Marcus Aurelius Antoninus}}
+	 {Marcus Aurelius Antoninus}
 
 Concurrent counting (see \cref{chp:Counting}) uses data ownership heavily,
 but adds a twist.
@@ -214,7 +214,7 @@ thread.
 %
 \epigraph{If the mountain will not come to Muhammad, then Muhammad must
 	  go to the mountain.}
-	 {\emph{Essays, Francis Bacon}}
+	 {Essays, Francis Bacon}
 
 The previous section described a weak form of data ownership where
 threads reached out to other threads' data.
@@ -271,7 +271,7 @@ on
 \label{sec:owned:Designated Thread}
 %
 \epigraph{Let a man practice the profession which he best knows.}
-	 {\emph{Cicero}}
+	 {Cicero}
 
 The earlier sections describe ways of allowing each thread to keep its
 own copy or its own portion of the data.
@@ -321,7 +321,7 @@ as the name says, eventually converge on the actual value.
 %
 \epigraph{There is, of course, a difference between what a man seizes
 	  and what he really possesses.}
-	 {\emph{Pearl S.~Buck}}
+	 {Pearl S.~Buck}
 
 One way of improving the performance and scalability of a shared-memory
 parallel program is to transform it so as to convert shared data to
@@ -392,7 +392,7 @@ to increase complexity while decreasing performance and scalability.
 %
 \epigraph{Everything comes to us that belongs to us if we create the
 	  capacity to receive it.}
-	 {\emph{Rabindranath Tagore}}
+	 {Rabindranath Tagore}
 
 Data ownership works best when the data can be partitioned so that there
 is little or no need for cross thread access or update.
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 2c14114e246d..32ca14116247 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -567,6 +567,8 @@
 %\newcommand{\IRQ}{irq}      % For those who prefer "irq"
 \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
 
+\let\epigraphorig\epigraph
+\renewcommand{\epigraph}[2]{\epigraphorig{#1}{\emph{#2}}}
 \IfEbookSize{
   \newcommand{\Epigraph}[2]{\epigraph{#1}{#2}}
 }{
diff --git a/qqz.sty b/qqz.sty
index a16872939af9..e2e8e4ec3e6b 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -190,7 +190,7 @@
 	\label{chp:app:Answers to Quick Quizzes}
 	\Epigraph{The Answer to the Ultimate Question of Life, The Universe,
 		  and Everything.}
-		 {\emph{``The Hitchhikers Guide to the Galaxy'', Douglas~Adams}}
+		 {``The Hitchhikers Guide to the Galaxy'', Douglas~Adams}
 	\setlength{\parskip}{0.0pt plus 1ex}
 	\input{qqz}
 	\setlength{\parskip}{0.0pt plus 1.0pt}% return to default
diff --git a/summary.tex b/summary.tex
index a00d85931ad6..d8b0b60cf010 100644
--- a/summary.tex
+++ b/summary.tex
@@ -6,7 +6,7 @@
 \label{chp:Looking Forward and Back}
 %
 \Epigraph{History is the sum total of things that could have been avoided.}
-	  {\emph{Konrad Adenauer}}
+	  {Konrad Adenauer}
 
 You have arrived at the end of this book, well done!
 I~hope that your journey was a pleasant but challenging and worthwhile
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 1c9b1b7a23cd..1e69fe3e1bd5 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{With great doubts comes great understanding, with little doubts
 	  comes little understanding.}
-	 {\emph{Chinese proverb}}
+	 {Chinese proverb}
 
 This section shows how to apply RCU to some examples discussed earlier
 in this book.
diff --git a/together/count.tex b/together/count.tex
index 2650f5ba1cb3..368e8499f59c 100644
--- a/together/count.tex
+++ b/together/count.tex
@@ -9,7 +9,7 @@
 	  This is about the most aggressive thing you can do to a
 	  computer, the equivalent of going up to a human being and saying
 	  ``Blood \dots blood \dots blood \dots blood \dots''}
-	 {\emph{Douglas Adams}}
+	 {Douglas Adams}
 
 This \lcnamecref{sec:together:Counter Conundrums}
 outlines solutions to counter conundrums.
diff --git a/together/hazptr.tex b/together/hazptr.tex
index 937451188f78..25512ba9453b 100644
--- a/together/hazptr.tex
+++ b/together/hazptr.tex
@@ -6,7 +6,7 @@
 \label{sec:together:Hazard-Pointer Helpers}
 %
 \epigraph{It's the little things that count, hundreds of them.}
-	 {\emph{Cliff Shaw}}
+	 {Cliff Shaw}
 
 This section looks at some issues that can be addressed with the
 help of hazard pointers.
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 132ad53fb72e..56caed674741 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -7,7 +7,7 @@
 %
 \epigraph{Counting is the religion of this generation.
 	  It is its hope and its salvation.}
-	 {\emph{Gertrude Stein}}
+	 {Gertrude Stein}
 
 Although reference counting is a conceptually simple technique,
 many devils hide in the details when it is applied to concurrent
diff --git a/together/seqlock.tex b/together/seqlock.tex
index 42eb8faa5727..5fd31d832bcb 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -6,7 +6,7 @@
 \label{sec:together:Sequence-Locking Specials}
 %
 \epigraph{The girl who can't dance says the band can't play.}
-	 {\emph{Yiddish proverb}}
+	 {Yiddish proverb}
 
 This section looks at some special uses of sequence counters.
 
diff --git a/together/together.tex b/together/together.tex
index b1c9a1e86b4d..bc68e571fa65 100644
--- a/together/together.tex
+++ b/together/together.tex
@@ -6,7 +6,7 @@
 %
 \Epigraph{You don't learn how to shoot and then learn how to launch
 	  and then learn to do a controlled spin---you learn to
-	  launch-shoot-spin.}{\emph{``Ender's Shadow'', Orson Scott Card}}
+	  launch-shoot-spin.}{``Ender's Shadow'', Orson Scott Card}
 
 % And the paragraph preceding this is also instructive:
 % ``I may be pissed off, but that doesn't mean I can't learn.''
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 571086d926fa..ce8a9430b16e 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -5,7 +5,7 @@
 \QuickQuizChapter{chp:Tools of the Trade}{Tools of the Trade}{qqztoolsoftrade}
 %
 \Epigraph{You are only as good as your tools, and your tools are only
-	  as good as you are.}{\emph{Unknown}}
+	  as good as you are.}{Unknown}
 
 This chapter provides a brief introduction to some basic tools of the
 parallel-programming trade, focusing mainly on those available to
@@ -38,7 +38,7 @@ and more information will be provided in later chapters.
 \label{sec:toolsoftrade:Scripting Languages}
 %
 \epigraph{The supreme excellence is simplicity.}
-	 {\emph{Henry Wadsworth Longfellow, simplified}}
+	 {Henry Wadsworth Longfellow, simplified}
 % The original:
 % "In character, in manner, in style, in all things, the supreme
 % excellence is simplicity."
@@ -151,7 +151,7 @@ programming need not always be complex or difficult.
 \section{POSIX Multiprocessing}
 \label{sec:toolsoftrade:POSIX Multiprocessing}
 %
-\epigraph{A camel is a horse designed by committee.}{\emph{Unknown}}
+\epigraph{A camel is a horse designed by committee.}{Unknown}
 
 This section scratches the surface of the
 POSIX environment, including pthreads~\cite{OpenGroup1997pthreads},
@@ -1193,7 +1193,7 @@ of \co{__thread} with the portability of POSIX thread-specific data.
 %
 \epigraph{The strategic marketing paradigm of Open Source is a massively
 	  parallel drunkard's walk filtered by a Darwinistic process.}
-	 {\emph{Bruce Perens}}
+	 {Bruce Perens}
 
 Unfortunately, threading operations, locking primitives, and atomic
 operations were in reasonably wide use long before the various standards
@@ -2651,7 +2651,7 @@ as will be shown in more detail in
 \label{sec:toolsoftrade:The Right Tool for the Job: How to Choose?}
 %
 \epigraph{If you get stuck, change your tools; it may free your thinking.}
-	 {\emph{Paul Arden, abbreviated}}
+	 {Paul Arden, abbreviated}
 
 As a rough rule of thumb, use the simplest tool that will get the job done.
 If you can, simply program sequentially.
-- 
2.25.1


