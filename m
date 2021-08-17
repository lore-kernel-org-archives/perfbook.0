Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c9to7k+WcpaNDPNH7IcMJANu+GW0Lc8xPzF0MCEtxfk=;
        b=V5r5fQrllRS3GUE5xmsJMStPutiQ/rjF/ovsVqYfO31XNZBTRrZVAWigRP9bxQCmVT
         KlHJcZ2n04/y8F618xhH9OCijQsjSwiRhpSu56oLtw2DATkdXtSDG05p4/9ACTBDdEt0
         3jL+eQq2bR6jrgYtcTdKvChV5tzPgiymKxzYFOME7SzaW0TXkPCdmPCN5Qpkh1SIQ74Z
         KX3V5KxHZjNHpMeFEBUQ9UYUGVmPPBh71k9qPeDJdFDjlj0FSs6Kb+vVVoBem21/YmIq
         NU2lwx6ZuaKgI+PJxTVTYgus+OAQ4i1j0+IFECt39QHdsS4+Z4xHHcR6pMl4bKNgpP6b
         5+gA==
Subject: [PATCH -perfbook 03/11] treewide: Adjust punctuation convention
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <40cbfe70-1022-ca3d-b27c-74b93017bb55@gmail.com>
Date: Tue, 17 Aug 2021 19:19:47 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fix violations of punctuation convention flagged by the
to-be-updated check scripts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex      |  5 +++--
 count/count.tex           |  2 +-
 datastruct/datastruct.tex | 19 ++++++++++++-------
 defer/rcufundamental.tex  |  4 ++--
 future/formalregress.tex  |  2 +-
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 60aeed12..9c35de62 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -204,11 +204,12 @@ The parallel work-queue solver is a straightforward parallelization
 of the algorithm shown in
 \cref{lst:SMPdesign:SEQ Pseudocode,lst:SMPdesign:SEQ Helper Pseudocode}.
 \begin{fcvref}[ln:SMPdesign:SEQ Pseudocode]
-\Clnref{ifge} of Listing~\ref{lst:SMPdesign:SEQ Pseudocode} must use fetch-and-add,
+\Clnref{ifge} of \cref{lst:SMPdesign:SEQ Pseudocode} must use fetch-and-add,
 and the local variable \co{vi} must be shared among the various threads.
 \end{fcvref}
 \begin{fcvref}[ln:SMPdesign:SEQ Helper Pseudocode:try]
-\Clnref{chk:not:visited,mark:visited} of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode} must be
+\Clnref{chk:not:visited,mark:visited} of
+\cref{lst:SMPdesign:SEQ Helper Pseudocode} must be
 combined into a CAS loop, with CAS failure indicating a loop in the
 maze.
 \Clnrefrange{recordnext}{next:visited} of this listing must use
diff --git a/count/count.tex b/count/count.tex
index c61a9fce..14ae9a36 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2301,7 +2301,7 @@ The state machine starts out in the IDLE state, and when \co{add_count()}
 or \co{sub_count()} find that the combination of the local thread's count
 and the global count cannot accommodate the request, the corresponding
 slowpath sets each thread's \co{theft} state to REQ (unless that thread
-has no count, in which case it transitions directly to READY).
+has no count, in which case it transitions directly to READY)\@.
 Only the slowpath, which holds the \co{gblcnt_mutex} lock, is permitted to
 transition from the IDLE state, as indicated by the green color.\footnote{
 	For those with black-and-white versions of this book,
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index f9746e7c..6363ef33 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -182,7 +182,8 @@ shows mapping and locking functions.
 \Clnref{b,e}
 show the macro \co{HASH2BKT()}, which maps from a hash value
 to the corresponding \co{ht_bucket} structure.
-This macro uses a simple modulus: if more aggressive hashing is required,
+This macro uses a simple modulus:
+If more aggressive hashing is required,
 the caller needs to implement it when mapping from key to hash value.
 The remaining two functions acquire and release the \co{->htb_lock}
 corresponding to the specified hash value.
@@ -318,8 +319,8 @@ on two or more CPUs.
 
 And things only get worse with more CPUs, as can be seen in
 \cref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; 448 CPUs}.
-We do not need to show ideal performance: The performance for 29~CPUs
-and beyond is all too clearly worse than abysmal.
+We do not need to show ideal performance:
+The performance for 29~CPUs and beyond is all too clearly worse than abysmal.
 This clearly underscores the dangers of extrapolating performance from a
 modest number of CPUs.
 
@@ -1754,8 +1755,9 @@ splits and combines corresponding hash chains so that readers always
 see valid hash chains at all points during the resizing operation.
 This incremental splitting and combining relies on the fact that it
 is harmless for a reader to see a data element that should be in some
-other hash chain: When this happens, the reader will simply ignore the
-extraneous data element due to key mismatches.
+other hash chain:
+When this happens, the reader will simply ignore the extraneous data
+element due to key mismatches.
 
 \begin{figure}
 \centering
@@ -2074,8 +2076,11 @@ However, the resizable hash table's \co{ht} structure is not all that
 highly replicated.
 It is instead the \co{ht_bucket} structures we should focus on.
 There are two major opportunities for shrinking the \co{ht_bucket} structure:
-(1)~Placing the \co{->htb_lock} field in a low-order bit of one of the
-\co{->htb_head} pointers and (2)~Reducing the number of pointers required.
+\begin{enumerate*}[(1)]
+\item Placing the \co{->htb_lock} field in a low-order bit of one of the
+\co{->htb_head} pointers and
+\item Reducing the number of pointers required.
+\end{enumerate*}
 
 The first opportunity might make use of bit-spinlocks in the Linux
 kernel, which are provided by the \path{include/linux/bit_spinlock.h}
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 054512e0..4ee37d87 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -296,7 +296,7 @@ However, it cannot be the case that \co{r1}'s final value is 0 and \co{r2}'s
 final value is 1.
 This would mean that an RCU read-side critical section had completely
 overlapped a grace period, which is forbidden (or at the very least
-constitutes a bug in RCU).
+constitutes a bug in RCU)\@.
 RCU's wait-for-readers guarantee therefore has two parts:
 \begin{enumerate*}[(1)]
 \item If any part of a given RCU read-side critical section precedes
@@ -484,7 +484,7 @@ One way to resolve this strange situation is via weaker semanitics.
 A reader traversal must encounter any data item that was present
 during the full traversal (B, C, and~D), and might or might not
 encounter data items that were present for only part of the
-traversal (A and~E).
+traversal (A and~E)\@.
 Therefore, in this particular case, it is perfectly legitimate for
 the reader traveral to encounter all five elements.
 If this outcome is problematic, another way to resolve this situation is
diff --git a/future/formalregress.tex b/future/formalregress.tex
index 60a0fdb0..789e1636 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -114,7 +114,7 @@ project~\cite{ThomasSewell2013L4binaryVerification}.
 	And although SEL4 has gained multi-processor
 	capabilities, it is currently using very coarse-grained
 	locking that is similar to the Linux kernel's old
-	Big Kernel Lock (BKL).
+	Big Kernel Lock (BKL)\@.
 	There will hopefully come a day when it makes sense to add
 	SEL4's verifiers to a book on parallel programming, but
 	this is not yet that day.
-- 
2.17.1


