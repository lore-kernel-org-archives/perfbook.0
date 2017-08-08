Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YkVeqaB8NTDA1J1PbD4wAJ6atfZaQu7tBcqU06xp0Lc=;
 b=YgpTdgimVZh2gAF9AorRpA3DVBCTxexgTgjBWGK+WUu4rMLAt5qk14pkmP9l3CUyBY
 EH3Tp+nwOz/QKCLjEeZOS/978NQyZ7HR5yH5mDRMN2E1tfPuvnBjIb4msH/VvwpwWM6b
 bGCAFoP96ZNZxm/rPAD46kLMvalammBcP6tB0eXIDJMcnd2aVgP0UthIdvF+ZndRnYdq
 ovGlk7yIMc7DwpVuOzYCqc/hZz5i82WhcPpf4rYcccePHAp2eoMiek5/0VZ1cw8fzkGO
 Ust1Q3p1/DSo4PV7taGWtNu6RRyH6lqiB0eDRiLY12hT0zLwQxk/64EkFSrVZu/FpW8D
 RFag==
Subject: [PATCH 4/6] styleguide: Add examples of grouping floating objects
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <26b2a05e-39f1-7578-b4ad-0e51a6e73673@gmail.com>
Date: Wed, 9 Aug 2017 07:10:31 +0900
MIME-Version: 1.0
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a2038d757f095defb47e4d073b7e9885d295488b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 6 Aug 2017 12:08:47 +0900
Subject: [PATCH 4/6] styleguide: Add examples of grouping floating objects

Two examples:

  1) Grouping two figures using a par of minipages
  2) Grouping two code snippets of listing environment using
     subfig package's "subfloat" macro

Also remove now obsolete footnote on subfigure package.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 132 +++++++++++++++++++++++++++++++++++--
 1 file changed, 128 insertions(+), 4 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 8ebf9bf..3518aea 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -666,14 +666,138 @@ as the default for the environment.

 To prevent a pair of closely related figures or listings
 from being placed in different pages, it is desirable to group
-them into a single floating environment.
+them into a single floating object.
 The ``subfig'' package provides the features to do so.\footnote{
-  Note that the ``subfigure'' package currently declared in the
-  preamble is obsoleted by subfig package.
   One problem of grouping figures might be the complexity in
   \LaTeX\ source.}

-% TODO: Add example
+Two floating objects can be placed side by side by using
+\co{\\parbox} or \co{minipage}.
+For example,
+Figures~\ref{fig:rt:Timer Wheel at 1kHz}
+and~\ref{fig:rt:Timer Wheel at 100kHz}
+can be grouped together by using a pair of \co{minipage}s
+as shown in
+Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
+and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}.
+
+\begin{figure*}[tbhp]\centering
+\begin{minipage}[t][][t]{2.1in}
+\resizebox{2.1in}{!}{\includegraphics{cartoons/1kHz}}
+\caption{Timer Wheel at 1\,kHz}
+\label{fig:app:styleguide:Timer Wheel at 1kHz}
+\end{minipage}
+\qquad
+\begin{minipage}[t][][t]{2.3in}
+\resizebox{2.3in}{!}{\includegraphics{cartoons/100kHz}}
+\caption{Timer Wheel at 100\,kHz}
+\label{fig:app:styleguide:Timer Wheel at 100kHz}
+\end{minipage}
+\end{figure*}
+
+By using subfig package,
+Figures~\ref{fig:advsync:Message-Passing Litmus Test}
+and~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}
+can be grouped together as shown in
+Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}
+with sub\-/captions (with a minor change of blank line).
+
+Note that they can not be grouped in the same way as
+Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
+and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}
+because the ``ruled'' style prevents their captions
+from being properly typeset.
+
+The sub\-/caption can be cited by combining a \verb|\ref{}| macro
+and a \verb|\subref{}| macro, for example,
+``Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}\,%
+\subref{sublst:app:styleguide:Not Enforcing Order}''.
+
+It can also be cited by a \verb|\ref{}| macro, for example,
+``Listing~\ref{sublst:app:styleguide:Enforcing Order}''.
+Note the difference in the resulting format. For the citing by
+a \verb|\ref{}| to work, you need to place the \verb|\label{}|
+macro of the combined floating object ahead of the definition of
+subfloats.
+Otherwise, the resulting caption number would be off by one
+from the actual number.
+
+\floatstyle{ruled}
+\restylefloat{listing}
+
+\begin{listing*}%
+\caption{Message-Passing Litmus Test (by subfig)}%
+\label{lst:app:styleguide:Message-Passing Litmus Test (subfig)}%
+{\scriptsize%
+\begin{verbbox}[\LstLineNo]
+C C-MP+o-wmb-o+o-o.litmus
+
+{
+}
+
+P0(int* x0, int* x1) {
+
+  WRITE_ONCE(*x0, 2);
+  smp_wmb();
+  WRITE_ONCE(*x1, 2);
+
+}
+
+P1(int* x0, int* x1) {
+
+  int r2;
+  int r3;
+
+  r2 = READ_ONCE(*x1);
+  r3 = READ_ONCE(*x0);
+
+}
+
+
+exists (1:r2=2 /\ 1:r3=0)
+\end{verbbox}
+}
+\centering
+\hspace*{\fill}
+\subfloat[Not Enforcing Order]{
+  \theverbbox
+  \label{sublst:app:styleguide:Not Enforcing Order}
+}
+\hspace{\fill}
+{\scriptsize%
+\begin{verbbox}[\LstLineNo]
+C C-MP+o-wmb-o+o-rmb-o.litmus
+
+{
+}
+
+P0(int* x0, int* x1) {
+
+  WRITE_ONCE(*x0, 2);
+  smp_wmb();
+  WRITE_ONCE(*x1, 2);
+
+}
+
+P1(int* x0, int* x1) {
+
+  int r2;
+  int r3;
+
+  r2 = READ_ONCE(*x1);
+  smp_rmb();
+  r3 = READ_ONCE(*x0);
+
+}
+
+exists (1:r2=2 /\ 1:r3=0)
+\end{verbbox}
+}%
+\subfloat[Enforcing Order]{%
+  \theverbbox
+  \label{sublst:app:styleguide:Enforcing Order}
+}\hspace*{\fill}%
+\end{listing*}

 \subsubsection{Ruled Line in Table}
 \label{sec:app:styleguide:Ruled Line in Table}
-- 
2.7.4


