Return-Path: <SRS0=jSvE=KB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4C4bubn/y1jalW8EFTibPrEzjSSCz2dzeb9JuLHY5vA=;
        b=o1+tFaEoVrLnJxuI//xOOHPv5+hlx9E9kxU4AfL4kqrKM5bNzfvtmbGqC9D4HLwz7g
         WLa+hknTI6oVb2+gx0aETSdirDPfwli1HCntgrpeghsyDqMZ/4YWarJPgf9Rf5ZDjVlF
         sWkI/HKbYy9bk7ZtiQZ/tBHjcFkaqDl+P8BX7umB1UuEipPvVI+9k0C5YoiFGIMxNxtG
         uYF02jryFpfsjNoStKf3M09LTK+vSuusr5DMDCUuZ8snDRDYYrC6/T8A0bixPk0rhyC9
         lv+GQ5dd4NuZfZ49oLVsK79Nf2AJB3BTxdvWkVsD7RS4TqrMag5dRIPgUy2eX4PNjsJS
         pptw==
Subject: [PATCH -perfbook 2/4] intro: Employ \cref{} and its variants
References: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f2fba879-d623-9d3f-df4f-6764ad1027aa@gmail.com>
Date: Thu, 6 May 2021 23:24:52 +0900
MIME-Version: 1.0
In-Reply-To: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index 77e89f3c..b40abeb5 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -136,7 +136,7 @@ so that the aforementioned engineering discipline has evolved practical
 and effective strategies for handling it.
 In addition, hardware designers are increasingly aware of these issues,
 so perhaps future hardware will be more friendly to parallel software,
-as discussed in Section~\ref{sec:cpu:Hardware Free Lunch?}.
+as discussed in \cref{sec:cpu:Hardware Free Lunch?}.
 
 \QuickQuiz{
 	Come on now!!!
@@ -351,7 +351,7 @@ This change in focus is due to the fact that, although \IXr{Moore's Law}
 continues to deliver increases in transistor density, it has ceased to
 provide the traditional single-threaded performance increases.
 This can be seen in
-Figure~\ref{fig:intro:Clock-Frequency Trend for Intel CPUs}\footnote{
+\cref{fig:intro:Clock-Frequency Trend for Intel CPUs}\footnote{
 	This plot shows clock frequencies for newer CPUs theoretically
 	capable of retiring one or more instructions per clock, and MIPS
 	(millions of instructions per second, usually from the old
@@ -473,7 +473,7 @@ anything but insignificant for the Z80.
 
 The CSIRAC and the Z80 are two points in a long-term trend, as can be
 seen in
-Figure~\ref{fig:intro:MIPS per Die for Intel CPUs}.
+\cref{fig:intro:MIPS per Die for Intel CPUs}.
 This figure plots an approximation to computational power per die
 over the past four decades, showing an impressive six-order-of-magnitude
 increase over a period of forty years.
@@ -601,7 +601,7 @@ not yet exist.
 Until such a nirvana appears, it will be necessary to make engineering
 tradeoffs among performance, productivity, and generality.
 One such tradeoff is shown in
-Figure~\ref{fig:intro:Software Layers and Performance; Productivity; and Generality},
+\cref{fig:intro:Software Layers and Performance; Productivity; and Generality},
 which shows how productivity becomes increasingly important at the upper layers
 of the system stack,
 while performance and generality become increasingly important at the
@@ -633,7 +633,7 @@ many things besides driving nails.
 It should therefore be no surprise to see similar tradeoffs
 appear in the field of parallel computing.
 This tradeoff is shown schematically in
-Figure~\ref{fig:intro:Tradeoff Between Productivity and Generality}.
+\cref{fig:intro:Tradeoff Between Productivity and Generality}.
 Here, users~1, 2, 3, and 4 have specific jobs that they need the computer
 to help them with.
 The most productive possible language or environment for a given user is one
@@ -671,7 +671,7 @@ to the hardware system (for example, low-level languages such as
 assembly, C, C++, or Java) or to some abstraction (for example,
 Haskell, Prolog, or Snobol), as is shown by the circular region near
 the center of
-Figure~\ref{fig:intro:Tradeoff Between Productivity and Generality}.
+\cref{fig:intro:Tradeoff Between Productivity and Generality}.
 These languages can be considered to be general in the sense that they
 are equally ill-suited to the jobs required by users~1, 2, 3, and 4.
 In other words, their generality comes at the expense of
@@ -698,7 +698,7 @@ it is not always the best tool for the job.
 In order to properly consider alternatives to parallel programming,
 you must first decide on what exactly you expect the parallelism
 to do for you.
-As seen in Section~\ref{sec:intro:Parallel Programming Goals},
+As seen in \cref{sec:intro:Parallel Programming Goals},
 the primary goals of parallel programming are performance, productivity,
 and generality.
 Because this book is intended for developers working on
@@ -801,7 +801,7 @@ optimization, albeit one that is becoming much more attractive
 as parallel systems become cheaper and more readily available.
 However, it is wise to keep in mind that the speedup available from
 parallelism is limited to roughly the number of CPUs
-(but see Section~\ref{sec:SMPdesign:Beyond Partitioning}
+(but see \cref{sec:SMPdesign:Beyond Partitioning}
 for an interesting exception).
 In contrast, the speedup available from traditional single-threaded
 software optimizations can be much larger.
@@ -921,7 +921,7 @@ programmers must undertake that are not required of sequential programmers.
 We can then evaluate how well a given programming language or environment
 assists the developer with these tasks.
 These tasks fall into the four categories shown in
-Figure~\ref{fig:intro:Categories of Tasks Required of Parallel Programmers},
+\cref{fig:intro:Categories of Tasks Required of Parallel Programmers},
 each of which is covered in the following sections.
 
 \subsection{Work Partitioning}
@@ -1046,8 +1046,8 @@ of these synchronization mechanisms, for example locking vs.\@ transactional
 memory~\cite{McKenney2007PLOSTM}, but such elaboration is beyond the
 scope of this section.
 (See
-Sections~\ref{sec:future:Transactional Memory}
-and~\ref{sec:future:Hardware Transactional Memory}
+\cref{sec:future:Transactional Memory,%
+sec:future:Hardware Transactional Memory}
 for more information on transactional memory.)
 
 \QuickQuiz{
@@ -1134,7 +1134,7 @@ inter-partition communication, partitions the code accordingly,
 and finally maps data partitions and threads so as to maximize
 throughput while minimizing inter-thread communication,
 as shown in
-Figure~\ref{fig:intro:Ordering of Parallel-Programming Tasks}.
+\cref{fig:intro:Ordering of Parallel-Programming Tasks}.
 The developer can then
 consider each partition separately, greatly reducing the size
 of the relevant state space, in turn increasing productivity.
-- 
2.17.1


