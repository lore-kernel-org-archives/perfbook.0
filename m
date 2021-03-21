Return-Path: <SRS0=60x9=IT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=sZoYzcLhjxfwz5/6IMOcyp7bNu4f2VgKDCcAWt5tLyE=;
        b=euU+dqI/M5/TnxDALWg/IPDQpFctLX4U17S3KxCLjK5oIkuZ2oePdgbm56nWG+IBzm
         iRESwNp6NGT94m+h/0PYadaWUkaiAl/R4UgUnqKLv1BSrnEnmt3F5+dCdKVUxedyI5km
         RiT/AleG2GLh/zk6/SJ1XHkF+Hnv9+LK683YqkhiepLlwvwaBCd5Eecm894Qm5C+9CrR
         Pn1NJBmLg15HI+HdPNGVoQMEhDxs+leYwZVJuqfM9g/tYN61tB5XHWhHanNeU1ScLemT
         99DWn7yHSbm0wAyAJCDTUK54WlPPoWsxMxuCpLEIQEIZZwyJb7g4xt33KZttbWvUEOsx
         psrg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] future/htm: Remove redundant 'to' from 'WRT to' in
 section headings
Message-ID: <2a52dc42-5b2e-326b-2f94-a967e86b12bc@gmail.com>
Date: Sun, 21 Mar 2021 19:17:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

Not urgent at all, but last minute fixes for the 2nd edition.

       Thanks, Akira
--
 future/htm.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/future/htm.tex b/future/htm.tex
index cf222e5b..242b85f2 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -41,7 +41,7 @@ cache misses, and supporting a fair number of practical applications.
 However, it always pays to read the fine print, and HTM is no exception.
 A major point of this section is determining under what conditions HTM's
 benefits outweigh the complications hidden in its fine print.
-To this end, \cref{sec:future:HTM Benefits WRT to Locking}
+To this end, \cref{sec:future:HTM Benefits WRT Locking}
 describes HTM's benefits and
 \cref{sec:future:HTM Weaknesses WRT Locking} describes its weaknesses.
 This is the same approach used in earlier
@@ -51,7 +51,7 @@ and also in the previous section.\footnote{
 	discussions with the other authors, Maged Michael, Josh Triplett,
 	and Jonathan Walpole, as well as with Andi Kleen.}
 
-\Cref{sec:future:HTM Weaknesses WRT to Locking When Augmented} then describes
+\Cref{sec:future:HTM Weaknesses WRT Locking When Augmented} then describes
 HTM's weaknesses with respect to the combination of synchronization
 primitives used in the Linux kernel (and in many user-space applications).
 \Cref{sec:future:Where Does HTM Best Fit In?} looks at where HTM
@@ -61,8 +61,8 @@ greatly increase HTM's scope and appeal.
 Finally, \cref{sec:future:Conclusions}
 presents concluding remarks.
 
-\subsection{HTM Benefits WRT to Locking}
-\label{sec:future:HTM Benefits WRT to Locking}
+\subsection{HTM Benefits WRT Locking}
+\label{sec:future:HTM Benefits WRT Locking}
 
 The primary benefits of HTM are
 (1)~its avoidance of the cache misses that are often incurred by
@@ -144,7 +144,7 @@ Although it is possible to use two-phased locking and hashed arrays
 of locks to partition general data structures, other techniques
 have proven preferable~\cite{DavidSMiller2006HashedLocking},
 as will be discussed in
-\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
+\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
 Given its avoidance of synchronization cache misses,
 HTM is therefore a very real possibility for large non-partitionable
 data structures, at least assuming relatively small updates.
@@ -843,7 +843,7 @@ serious shortcomings of locking,\footnote{
 	deadlock detectors~\cite{JonathanCorbet2006lockdep}, a wealth
 	of data structures that have been adapted to locking, and
 	a long history of augmentation, as discussed in
-	\cref{sec:future:HTM Weaknesses WRT to Locking When Augmented}.
+	\cref{sec:future:HTM Weaknesses WRT Locking When Augmented}.
 	In addition, if locking really were as horrible as a quick skim
 	of many academic papers might reasonably lead one to believe,
 	where did all the large lock-based parallel programs (both
@@ -867,8 +867,8 @@ hazard pointers~\cite{MagedMichael04a,HerlihyLM02},
 and RCU~\cite{McKenney98,McKenney01a,ThomasEHart2007a,PaulEMcKenney2012ELCbattery}.
 The next section looks at how such augmentation changes the equation.
 
-\subsection{HTM Weaknesses WRT to Locking When Augmented}
-\label{sec:future:HTM Weaknesses WRT to Locking When Augmented}
+\subsection{HTM Weaknesses WRT Locking When Augmented}
+\label{sec:future:HTM Weaknesses WRT Locking When Augmented}
 
 \input{future/HTMtableRCU}
 
-- 
2.17.1

