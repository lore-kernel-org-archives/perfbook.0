Return-Path: <SRS0=tsBt=3K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9gFDWJe7S4mHOx/bGMoUx9o1k3fyWJLVqxLspFy27m4=;
        b=PsTC0X9C1lLhfv3WBS3mQVliuPoy4nOUjXIq/ioOGrYWFyfHTYdcm75V7kBNtmlIAA
         LlJiugA1bFCpvnqkdy7Ph7OVb5xpuFnkUvpx18Lah0UDlu+2B5yPQxh968zDPCUhxSn3
         HF363qF0SwV7r2Wmvx1UfGsMSqq9q4b2Wu5B1pgf2ScqvDtC1IOt5kLgphSf1nUNXIUM
         TDgdXcpyzFT1MEoLtrKSTjGI4hwG+kKhZDu+TuJtlI78QAvqwTupAYnec9mwSpLWHcuy
         kwA6Q4ACMQZlws9uQRk13/n27EXEXJOJKgE9ow2Xc6DrCmQPsFKO5bgvBn6vi42Svv9G
         mJyQ==
Subject: [PATCH 1/2] count: Prevent line breaks in the middle of 'and n.m'
References: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6f1293a8-c237-701f-141d-465131140eb5@gmail.com>
Date: Wed, 22 Jan 2020 07:36:39 +0900
MIME-Version: 1.0
In-Reply-To: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1229e8b66fc31e4b31f7ed027f9f99490789e9d9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 21 Jan 2020 06:38:31 +0900
Subject: [PATCH 1/2] count: Prevent line breaks in the middle of 'and n.m'

This commit touches paragraphs where a sequence of multiple
cross references can be handled by a \cref{} command as follows:

    \cref{label:a,label:b}

Also fix a typo in plural tense.

Substitute ";" for "," in a label string, which is incompatible
with cleveref, as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 55 ++++++++++++++++++++++++-------------------------
 owned/owned.tex |  4 ++--
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 28a6602b..2b1bbff9 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -151,8 +151,8 @@ takes on the exact structure-allocation limit problem.
 Finally, Section~\ref{sec:count:Parallel Counting Discussion}
 concludes the chapter with performance measurements.
 
-Sections~\ref{sec:count:Why Isn't Concurrent Counting Trivial?}
-and~\ref{sec:count:Statistical Counters}
+\Cref{sec:count:Why Isn't Concurrent Counting Trivial?,%
+sec:count:Statistical Counters}
 contain introductory material, while the remaining sections
 are more appropriate for advanced students.
 
@@ -1366,16 +1366,16 @@ has acquired \co{gblcnt_mutex}.
 \begin{listing}[tbp]
 \input{CodeSamples/count/count_lim@add_sub_read.fcv}
 \caption{Simple Limit Counter Add, Subtract, and Read}
-\label{lst:count:Simple Limit Counter Add, Subtract, and Read}
+\label{lst:count:Simple Limit Counter Add; Subtract; and Read}
 \end{listing}
 
-Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}
+\Cref{lst:count:Simple Limit Counter Add; Subtract; and Read}
 shows the \co{add_count()}, \co{sub_count()}, and \co{read_count()}
 functions (\path{count_lim.c}).
 
 \QuickQuiz{}
 	Why does
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}
 	provide \co{add_count()} and \co{sub_count()} instead of the
 	\co{inc_count()} and \co{dec_count()} interfaces show in
 	Section~\ref{sec:count:Statistical Counters}?
@@ -1412,7 +1412,7 @@ references only per-thread variables, and should not incur any cache misses.
 \QuickQuiz{}
 	What is with the strange form of the condition on
 	line~\ref{ln:count:count_lim:add_sub_read:add:checklocal} of
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}?
 	Why not the more intuitive form of the fastpath shown in
 	\cref{lst:count:Intuitive Fastpath}?
 \QuickQuizAnswer{
@@ -1423,7 +1423,7 @@ references only per-thread variables, and should not incur any cache misses.
 	with \co{counter} equal to~10 and
 	\co{delta} equal to \co{ULONG_MAX}.
 	Then try it again with the code shown in
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}.
 
 	A good understanding of integer overflow will be required for
 	the rest of this example, so if you have never dealt with
@@ -1469,7 +1469,7 @@ line~\lnref{return:gs} returns indicating success.
 \QuickQuiz{}
 	Why does \co{globalize_count()} zero the per-thread variables,
 	only to later call \co{balance_count()} to refill them in
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}?
 	Why not just leave the per-thread variables non-zero?
 \QuickQuizAnswer{
 	That is in fact what an earlier version of this code did.
@@ -1507,7 +1507,7 @@ Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
 \QuickQuiz{}
 	Given that \co{globalreserve} counted against us in \co{add_count()},
 	why doesn't it count for us in \co{sub_count()} in
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}?
 \QuickQuizAnswer{
 	The \co{globalreserve} variable tracks the sum of all threads'
 	\co{countermax} variables.
@@ -1522,7 +1522,7 @@ Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
 
 \QuickQuiz{}
 	Suppose that one thread invokes \co{add_count()} shown in
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read},
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read},
 	and then another thread invokes \co{sub_count()}.
 	Won't \co{sub_count()} return failure even though the value of
 	the counter is non-zero?
@@ -1549,7 +1549,7 @@ line~\lnref{return:gs} returns success.
 
 \QuickQuiz{}
 	Why have both \co{add_count()} and \co{sub_count()} in
-	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
+	\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}?
 	Why not simply pass a negative number to \co{add_count()}?
 \QuickQuizAnswer{
 	Given that \co{add_count()} takes an \co{unsigned} \co{long}
@@ -1584,7 +1584,7 @@ Line~\lnref{return} then returns the sum.
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions}
 shows a number of utility functions used by the \co{add_count()},
 \co{sub_count()}, and \co{read_count()} primitives shown in
-Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
+\cref{lst:count:Simple Limit Counter Add; Subtract; and Read}.
 
 \begin{lineref}[ln:count:count_lim:utility:globalize]
 \Clnrefrange{b}{e} show \co{globalize_count()},
@@ -1771,13 +1771,13 @@ This task is undertaken in the next section.
 
 Because this implementation (\path{count_lim_app.c}) is quite similar to
 that in the previous section
-(Listings~\ref{lst:count:Simple Limit Counter Variables},
-\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}, and
-\ref{lst:count:Simple Limit Counter Utility Functions}),
+(\cref{lst:count:Simple Limit Counter Variables,%
+lst:count:Simple Limit Counter Add; Subtract; and Read,%
+lst:count:Simple Limit Counter Utility Functions}),
 only the changes are shown here.
-Listing~\ref{lst:count:Approximate Limit Counter Variables}
+\Cref{lst:count:Approximate Limit Counter Variables}
 is identical to
-Listing~\ref{lst:count:Simple Limit Counter Variables},
+\cref{lst:count:Simple Limit Counter Variables},
 with the addition of \co{MAX_COUNTERMAX}, which sets the maximum
 permissible value of the per-thread \co{countermax} variable.
 
@@ -2114,9 +2114,9 @@ Finally, line~\lnref{return} returns the sum.
 \label{lst:count:Atomic Limit Counter Utility Functions 2}
 \end{listing}
 
-Listings~\ref{lst:count:Atomic Limit Counter Utility Functions 1}
-and~\ref{lst:count:Atomic Limit Counter Utility Functions 2}
-shows the utility functions
+\Cref{lst:count:Atomic Limit Counter Utility Functions 1,%
+lst:count:Atomic Limit Counter Utility Functions 2}
+show the utility functions
 \co{globalize_count()},
 \co{flush_local_count()},
 \co{balance_count()},
@@ -2125,7 +2125,7 @@ shows the utility functions
 \begin{lineref}[ln:count:count_lim_atomic:utility1:globalize]
 The code for \co{globalize_count()} is shown on
 \clnrefrange{b}{e},
-of Listing~\ref{lst:count:Atomic Limit Counter Utility Functions 1} and
+of \cref{lst:count:Atomic Limit Counter Utility Functions 1} and
 is similar to that of previous algorithms, with the addition of
 line~\lnref{split}, which is now required to split out \co{counter} and
 \co{countermax} from \co{counterandmax}.
@@ -2781,8 +2781,7 @@ device removal.
 	\item	Reader-writer locks do not scale well.
 		One way of avoiding the high read-acquisition costs
 		of reader-writer locks is presented in
-		Chapters~\ref{chp:Locking}
-		and~\ref{chp:Deferred Processing}.
+		\cref{chp:Locking,chp:Deferred Processing}.
 	\end{enumerate}
 } \QuickQuizEnd
 
@@ -3056,14 +3055,14 @@ this chapter and the material presented in a number of later chapters.
 The examples in this chapter have shown that an important scalability
 and performance tool is \emph{partitioning}.
 The counters might be fully partitioned, as in the statistical counters
-discussed in Section~\ref{sec:count:Statistical Counters},
+discussed in \cref{sec:count:Statistical Counters},
 or partially partitioned as in the limit counters discussed in
-Sections~\ref{sec:count:Approximate Limit Counters} and
-\ref{sec:count:Exact Limit Counters}.
+\cref{sec:count:Approximate Limit Counters,%
+sec:count:Exact Limit Counters}.
 Partitioning will be considered in far greater depth in
-Chapter~\ref{cha:Partitioning and Synchronization Design},
+\cref{cha:Partitioning and Synchronization Design},
 and partial parallelization in particular in
-Section~\ref{sec:SMPdesign:Parallel Fastpath}, where it is called
+\cref{sec:SMPdesign:Parallel Fastpath}, where it is called
 \emph{parallel fastpath}.
 
 \QuickQuiz{}
diff --git a/owned/owned.tex b/owned/owned.tex
index 506359af..14257c60 100644
--- a/owned/owned.tex
+++ b/owned/owned.tex
@@ -329,8 +329,8 @@ a considerable reduction in the spread of certain types of disease.
 
 In other cases, privatization imposes costs.
 For example, consider the simple limit counter shown in
-Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read} on
-page~\pageref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
+\cref{lst:count:Simple Limit Counter Add; Subtract; and Read} on
+\cpageref{lst:count:Simple Limit Counter Add; Subtract; and Read}.
 This is an example of an algorithm where threads can read each others'
 data, but are only permitted to update their own data.
 A quick review of the algorithm shows that the only cross-thread
-- 
2.17.1


