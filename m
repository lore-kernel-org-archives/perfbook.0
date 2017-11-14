Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=LXtZzoHfsChRjPNF3c+LGqyoWcD1FoQZMLCAuYAbtHw=;
 b=NiKch2QdnUjjqvxBfBwSiVzWOm3NxZA9TROJJI9XEKa56WXmZj2hFgkXM3iuyGaBT2
 Revpm6ES6mVXn9kDAwyt3R0BoCV0EGTHJWSSfFBTjdU8kZqQELOBDMhIYU/PG03pnJn1
 Hn83llmrP/0iV6+lo5UqSJdvfumsrqVYDa/zt6SUkw/UdkHN0cZim+VAHB12XI0Jwzf0
 2mGYY+bjRvvfBzdVTOH7ZVkLGzQzsnFaEVnXwqPtLGajYBnyn1AKl7lurqUGYsQbx/Qq
 dgve4gUJxGCNAa9PJvMYoF6hZ3uaqZVNNLlkwM5euTmILWZCggycmfiFbm8OlK/1ewVK
 nFwg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Use litmus test in section 'control dependency
 calamity'
Message-ID: <50409a82-e3d0-c5cb-92a3-db4b42e3a7ed@gmail.com>
Date: Tue, 14 Nov 2017 21:07:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9b53814671df7e54b294599959b739f592196258 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 14 Nov 2017 20:57:08 +0900
Subject: [PATCH] memorder: Use litmus test in section 'control dependency calamity'

Also substitute "cumulativity" for "transitivity".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 139 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 94 insertions(+), 45 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f028789..180a721 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3957,54 +3957,103 @@ invoked by those two clauses), not to code following that ``\co{if}''.
 Finally, control dependencies do \emph{not} provide cumulativity.\footnote{
 	Refer to Section~\ref{sec:memorder:Cumulativity} for
 	the meaning of cumulativity.}
-This is demonstrated by two related examples, with the initial values
-of~\co{x} and~\co{y} both being zero:
+This is demonstrated by two related litmus tests, namely
+Listings~\ref{lst:memorder:LB Litmus Test With Control Dependency}
+and~\ref{lst:memorder:WWC Litmus Test With Control Dependency (Cumulativity?)}
+with the initial values
+of~\co{x} and~\co{y} both being zero.

-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\tt
-\scriptsize
-\begin{tabular}{l|p{1.5in}}
-	\nf{CPU 0} &	\nf{CPU 1} \\
-	\hline
-	\tco{r1 = READ_ONCE(x);} &
-		\tco{r2 = READ_ONCE(y);} \\
-	if (r1 > 0) &
-		if (r2 > 0) \\
-	~~~\tco{WRITE_ONCE(y, 1);} &
-		~~~\tco{WRITE_ONCE(x, 1);} \\
-	\multicolumn{2}{l}{~} \\
-	\multicolumn{2}{l}{\tco{assert(!(r1 == 1 && r2 == 1));}} \\
-\end{tabular}
-\end{minipage}
-\vspace{5pt}
+\begin{listing}
+{ \scriptsize
+\begin{verbbox}[\LstLineNo]
+C C-LB+o-cgt-o+o-cgt-o
+{
+}

-The above two-CPU example will never trigger the \co{assert()}.
-However, if control dependencies guaranteed transitivity (which they do
-not), then adding the following CPU would guarantee a related assertion:
+P0(int *x, int *y)
+{
+  int r1;

-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\tt
-\scriptsize
-\begin{tabular}{l}
-	\nf{CPU 2} \\
-	\hline
-	\tco{WRITE_ONCE(x, 2);} \\
-	\multicolumn{1}{l}{~} \\
-	\multicolumn{1}{l}{\tco{assert(!(r1 == 2 && r2 == 1 && x == 2));}} \\
-\end{tabular}
-\end{minipage}
-\vspace{5pt}
+  r1 = READ_ONCE(*x);
+  if (r1 > 0)
+    WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+  int r2;
+
+  r2 = READ_ONCE(*y);
+  if (r2 > 0)
+    WRITE_ONCE(*x, 1);
+}
+
+exists (0:r1=1 /\ 1:r2=1)
+\end{verbbox}
+}
+\centering
+\theverbbox
+\caption{LB Litmus Test With Control Dependency}
+\label{lst:memorder:LB Litmus Test With Control Dependency}
+\end{listing}
+
+The \co{exists} clause in the two-thread example of
+Listing~\ref{lst:memorder:LB Litmus Test With Control Dependency}
+(\path{C-LB+o-cgt-o+o-cgt-o.litmus})
+will never trigger.
+If control dependencies guaranteed cumulativity (which they do
+not), then adding a thread to the example as in
+Listing~\ref{lst:memorder:WWC Litmus Test With Control Dependency (Cumulativity?)}
+(\path{C-WWC+o-cgt-o+o-cgt-o+o.litmus})
+would guarantee the related \co{exists} clause never to trigger.
+
+\begin{listing}
+{ \scriptsize
+\begin{verbbox}[\LstLineNo]
+C C-WWC+o-cgt-o+o-cgt-o+o
+{
+}
+
+P0(int *x, int *y)
+{
+  int r1;
+
+  r1 = READ_ONCE(*x);
+  if (r1 > 0)
+    WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+  int r2;
+
+  r2 = READ_ONCE(*y);
+  if (r2 > 0)
+    WRITE_ONCE(*x, 1);
+}
+
+P2(int *x)
+{
+  WRITE_ONCE(*x, 2);
+}
+
+exists (0:r1=2 /\ 1:r2=1 /\ x=2)
+\end{verbbox}
+}
+\centering
+\theverbbox
+\caption{WWC Litmus Test With Control Dependency (Cumulativity?)}
+\label{lst:memorder:WWC Litmus Test With Control Dependency (Cumulativity?)}
+\end{listing}

-But because control dependencies do \emph{not} provide transitivity, the above
-assertion can fail after the combined three-CPU example completes.
-If you need the three-CPU example to provide ordering, you will need
-\co{smp_mb()} between the loads and stores in the CPU~0 and CPU~1 code
-fragments, that is, just before or just after the ``\co{if}'' statements.
-Furthermore, the original two-CPU example is very fragile and should be avoided.
+But because control dependencies do \emph{not} provide cumulativity, the
+\co{exists} clause in the three-thread litmus test can trigger.
+If you need the three-thread example to provide ordering, you will need
+\co{smp_mb()} between the loads and stores in threads \co{P0()} and \co{P1()},
+that is, just before or just after the ``\co{if}'' statements.
+Furthermore, the original two-thread example is very fragile and should be avoided.

-The two-CPU example is known as LB (load buffering) and the three-CPU
+The two-thread example is known as LB (load buffering) and the three-thread
 example as WWC~\cite{Maranget2012TutorialARMPower}.

 The following list of rules summarizes the lessons of this section:
@@ -4053,8 +4102,8 @@ The following list of rules summarizes the lessons of this section:
 \item	Control dependencies pair normally with other types of
 	memory-ordering operations.

-\item	Control dependencies do \emph{not} provide transitivity.
-	If you need transitivity, use \co{smp_mb()}.
+\item	Control dependencies do \emph{not} provide cumulativity.
+	If you need cumulativity, use \co{smp_mb()}.
 \end{enumerate}

 In short, many popular languages were designed primarily with
-- 
2.7.4

