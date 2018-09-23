Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v61VMDTOg8wm92hi2I2qOTyMOwj/BZu0nl4O/sUhBuU=;
        b=lq37TalQqGa9Hbad3rFM9hlH81iFMn8NXpT0EyNm9/aX15GISFd4KhRt33PLzfha+N
         NGC3EjrsdfY9kGrNFtDgqHbuwzejikjjDyXpMf/EysHHlTSZfdKk9uQ1RVu4YzZS2dmd
         8dx8+hZ+LJL7uf1rMANUVVu1tMuPbytCRCEGjE2Gs2kmpiaeCV3yUY8Z23v1S8HnIsec
         A+QyHNc3GYs4eGLqt72QIr0EMScYeQ3nylo6Aolu0X7W/S9HHC3eoRdIZ1WlseP/4S5q
         mrmsvg784yuxLX8GJZMAzzBUZlPTUmnx31f5SdJOEBqMXDwS4RaSL1lM+sa1LzZX+nY0
         48sw==
Subject: [PATCH 9/9] future/formalregress: Example of extraction of snippet
 from .litmus file
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <89dd2630-6ea9-c392-2114-5b249c0183be@gmail.com>
Date: Sun, 23 Sep 2018 16:34:23 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From df6459c699d373a247342b3a79d3bf7a239cfbe3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 30 Aug 2018 22:59:44 +0900
Subject: [PATCH 9/9] future/formalregress: Example of extraction of snippet from .litmus file

This is a POC of including litmus test snippet extracted via
reorder_ltms.pl and fcvextract.pl.

As herdtools7 does not allow comment following a "filter" or
"exists" clause, we use an option "filterlabel" to the meta command
"\end[snippet]".

NOTE: Neither "exists" nor "filter" can appear as a token in
    comments of litmus test. "filter_" is OK. A token in comment?
    Don't ask me!

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus      |  2 ++
 future/formalregress.tex                           | 40 +++-------------------
 2 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
index ae64726..32d8e52 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
@@ -1,4 +1,5 @@
 C C-SB+l-o-o-u+l-o-o-u-C
+// \begin[snippet][labelbase=ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole,commandchars=\%\[\]]
 
 {
 }
@@ -25,5 +26,6 @@ P1(int *sl, int *x0, int *x1)
 	smp_store_release(sl, 0);
 }
 
+//\end[snippet][filterlabel=filter_]
 filter (0:r2=0 /\ 1:r2=0)
 exists (0:r1=0 /\ 1:r1=0)
diff --git a/future/formalregress.tex b/future/formalregress.tex
index 163237e..dd94c8c 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -188,41 +188,7 @@ is correct, and additional verification passes can verify correct
 use of the locking APIs.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}[\LstLineNo]
-C C-SB+l-o-o-u+l-o-o-u-C
-
-{
-}
-
-P0(int *sl, int *x0, int *x1)
-{
-  int r2;
-  int r1;
-
-  r2 = cmpxchg_acquire(sl, 0, 1);
-  WRITE_ONCE(*x0, 1);
-  r1 = READ_ONCE(*x1);
-  smp_store_release(sl, 0);
-}
-
-P1(int *sl, int *x0, int *x1)
-{
-  int r2;
-  int r1;
-
-  r2 = cmpxchg_acquire(sl, 0, 1);
-  WRITE_ONCE(*x1, 1);
-  r1 = READ_ONCE(*x0);
-  smp_store_release(sl, 0);
-}
-
-filter (0:r2=0 /\ 1:r2=0)
-exists (0:r1=0 /\ 1:r1=0)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C@whole.fcv}
 \caption{Emulating Locking with \tco{cmpxchg_acquire()}}
 \label{lst:future:Emulating Locking with cmpxchg}
 \end{listing}
@@ -263,11 +229,13 @@ The difference is not insignificant: At four processes, the model
 is more than two orders of magnitude faster than emulation!
 
 \QuickQuiz{}
-	Why bother with a separate \co{filter} command on line~28 of
+\begin{lineref}[ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole]
+	Why bother with a separate \co{filter} command on line~\lnref{filter_} of
 	Listing~\ref{lst:future:Emulating Locking with cmpxchg}
 	instead of just adding the condition to the \co{exists} clause?
 	And wouldn't it be simpler to use \co{xchg_acquire()} instead
 	of \co{cmpxchg_acquire()}?
+\end{lineref}
 \QuickQuizAnswer{
 	The \co{filter} clause causes the \co{herd} tool to discard
 	executions at an earlier stage of processing than does
-- 
2.7.4


