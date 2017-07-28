Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YY9yi7bJYUVPP3nXK3uP3Vu+16Xslt49jOWK5wo2lb0=;
 b=ngCVZnJBaNtVzSoNGoT3ekXB7Rr0ND5pCrEBsM0n7VuqvlR9T9Z6httCN31g4YGb5x
 08wOVzx+95C9Ot3RudqZ86uOHKAjaTyYzW0qnqkD3lgTH1j5mZe3NJtW5uNDAFUMFLVl
 pkZeIvfxH3HqIbOZ5Gzdor/vNl5iOfAumhXmXJP1K9S2wCM6KR8gKX4+EgKmK68O/d7J
 P6qvuGVupL2jZtua/2gCx2UOQ0gisXvHNP5udpN0ZX9xzcuPrq/98UfRUquZdwXIL5MU
 LgTJGASLtVfNUSBegMGw50KehrO9JMEdf2JYKU3HjAdMGnLZ7nvuymhQ13WG0t8udh3G
 IF8A==
Subject: [PATCH 08/10] styleguide: Add example of grouping code snippets
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <38fce9bc-8f39-1fbc-472d-eeb132a12b9d@gmail.com>
Date: Fri, 28 Jul 2017 19:04:34 +0900
MIME-Version: 1.0
In-Reply-To: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6ded852056ccbac9537fff8230bec667062c9d49 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 21 Jul 2017 22:15:05 +0900
Subject: [PATCH 08/10] styleguide: Add example of grouping code snippets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 79 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index d2ace52..dab6ffd 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -669,7 +669,84 @@ The floatrow package provides the features to do so.\footnote{
   One problem of grouping figures might be the learning curve
   to do so.}

-% TODO: Add example
+For example,
+Figures~\ref{fig:advsync:Message-Passing Litmus Test}
+and~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}
+can be grouped together as in
+Listings~\ref{lst:app:styleguide:Message-Passing Litmus Test}
+and~\ref{lst:app:styleguide:Enforcing Order of Message-Passing Litmus Test}.
+
+\begin{listing*}\RawFloats
+{ \scriptsize
+\begin{verbbox}
+ 1 C C-MP+o-wmb-o+o-o.litmus
+ 2
+ 3 {
+ 4 }
+ 5
+ 6
+ 7 P0(int* x0, int* x1) {
+ 8
+ 9   WRITE_ONCE(*x0, 2);
+10   smp_wmb();
+11   WRITE_ONCE(*x1, 2);
+12
+13 }
+14
+15 P1(int* x0, int* x1) {
+16
+17   int r2;
+18   int r3;
+19
+20   r2 = READ_ONCE(*x1);
+21   r3 = READ_ONCE(*x0);
+22
+23 }
+24
+25 exists (1:r2=2 /\ 1:r3=0)
+\end{verbbox}
+}
+  \begin{floatrow}[2]\thisfloatsetup{style=ruled}
+    \floatbox{listing}[2.2in]{\caption{Message-Passing Litmus Test}
+      \label{lst:app:styleguide:Message-Passing Litmus Test}}{
+      \theverbbox
+}
+{ \scriptsize
+\begin{verbbox}
+ 1 C C-MP+o-wmb-o+o-rmb-o.litmus
+ 2
+ 3 {
+ 4 }
+ 5
+ 6 P0(int* x0, int* x1) {
+ 7
+ 8   WRITE_ONCE(*x0, 2);
+ 9   smp_wmb();
+10   WRITE_ONCE(*x1, 2);
+11
+12 }
+13
+14 P1(int* x0, int* x1) {
+15
+16   int r2;
+17   int r3;
+18
+19   r2 = READ_ONCE(*x1);
+20   smp_rmb();
+21   r3 = READ_ONCE(*x0);
+22
+23 }
+24
+25 exists (1:r2=2 /\ 1:r3=0)
+\end{verbbox}
+}
+    \thisfloatsetup{style=ruled}\hspace{1em}%
+    \floatbox{listing}[2.2in]{\caption{Enforcing Order of Message\-/Passing Litmus Test}
+      \label{lst:app:styleguide:Enforcing Order of Message-Passing Litmus Test}}{
+      \theverbbox
+}
+  \end{floatrow}
+\end{listing*}

 \subsubsection{Ruled Line in Table}
 \label{sec:app:styleguide:Ruled Line in Table}
-- 
2.7.4


