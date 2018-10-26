Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1HG5DIaqLf9w7M9csBEHiP3rtLzwLKPsM3Ewfvm0Ujw=;
        b=H1FpdTxZPfOnptTOUbB9G7IozLsDp5H0DYL5+XKFR+i5nXX+yP336BVsFVOQ5Rau1+
         4bovpWij3ivKuoz0vLmcGnamyI5wsoGCH7HUUHpiz7iloCp4tsrKCwh0V9RJj4NbFIZc
         m5unRQVHBBNcYJUiE3qdTjl1v7vnKRQTn5pya9hgH/Z+Tbu6S6E2wQNFZYb5wXqRXDTZ
         8sHtQrk2H8gIswQgYwZ0EupOZoVjiraijDDraFqP34Asze7KGp6zzrjDUGgrjzLu3H88
         9WZ0+80mBHbEFvPWozmz4Ml+HQyr1H3dwO4vegphiVPmVaJDAMRagmHZXu/JTWLV49HQ
         +BnA==
Subject: [PATCH 2/7] toolsoftrade: Use 'VerbatimU' for inline snippets
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7bdd087c-bb71-56d8-e32c-9b000faf3aec@gmail.com>
Date: Sat, 27 Oct 2018 00:24:52 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f65277139c063f4b44987edb0eee40ade1957df2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Oct 2018 14:54:14 +0900
Subject: [PATCH 2/7] toolsoftrade: Use 'VerbatimU' for inline snippets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 90 ++++++++++---------------------------------
 1 file changed, 20 insertions(+), 70 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 6896997..601829c 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -88,14 +88,9 @@ of \co{cat} execute sequentially.
 \QuickQuizAnswer{
 	One straightforward approach is the shell pipeline:
 
-\begin{minipage}[t]{\columnwidth}
-\vspace{0.1ex}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 grep $pattern1 | sed -e 's/a/b/' | sort
-\end{verbatim}
-\vspace{0.1ex}
-\end{minipage}
+\end{VerbatimU}
 
 	For a sufficiently large input file,
 	\co{grep} will pattern-match in parallel with \co{sed}
@@ -648,15 +643,10 @@ Lines~7-11 create a thread running \co{lock_writer()}.
 Lines~12-19 wait for both threads to complete.
 The output of this code fragment is as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 Creating two threads using same lock:
 lock_reader(): x = 0
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 Because both threads are using the same lock, the \co{lock_reader()}
 thread cannot see any of the intermediate values of \co{x} produced
@@ -718,18 +708,13 @@ shows a similar code fragment, but this time using different locks:
 \co{lock_writer()}.
 The output of this code fragment is as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 Creating two threads w/different locks:
 lock_reader(): x = 0
 lock_reader(): x = 1
 lock_reader(): x = 2
 lock_reader(): x = 3
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 Because the two threads are using different locks, they do not exclude
 each other, and can run concurrently.
@@ -1144,16 +1129,11 @@ If you instead need the new value, you can instead use the
 	For example, one could implement \co{__sync_nand_and_fetch()}
 	in terms of \co{__sync_fetch_and_nand()} as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 tmp = v;
 ret = __sync_fetch_and_nand(p, tmp);
 ret = ~ret & tmp;
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 	It is similarly possible to implement \co{__sync_fetch_and_add()},
 	\co{__sync_fetch_and_sub()}, and \co{__sync_fetch_and_xor()}
@@ -1615,16 +1595,11 @@ allowing other threads to acquire it.
 A spinlock named \co{mutex} may be used to protect a variable
 \co{counter} as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 spin_lock(&mutex);
 counter++;
 spin_unlock(&mutex);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 \QuickQuiz{}
 	What problems could occur if the variable {\tt counter} were
@@ -1633,16 +1608,11 @@ spin_unlock(&mutex);
 	On CPUs with load-store architectures, incrementing {\tt counter}
 	might compile into something like the following:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 LOAD counter,r0
 INC r0
 STORE r0,counter
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 	On such machines, two threads might simultaneously load the
 	value of {\tt counter}, each increment it, and each store the
@@ -2505,51 +2475,31 @@ Section~\ref{sec:count:Statistical Counters},
 it is helpful to implement such a counter using a per-thread variable.
 Such a variable can be defined as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 DEFINE_PER_THREAD(int, counter);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 The counter must be initialized as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 init_per_thread(counter, 0);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 A thread can increment its instance of this counter as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 p_counter = &__get_thread_var(counter);
 WRITE_ONCE(*p_counter, *p_counter + 1);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 The value of the counter is then the sum of its instances.
 A snapshot of the value of the counter can thus be collected
 as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
+\begin{VerbatimU}
 for_each_thread(t)
   sum += READ_ONCE(per_thread(counter, t));
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 Again, it is possible to gain a similar effect using other mechanisms,
 but per-thread variables combine convenience and high performance,
-- 
2.7.4


