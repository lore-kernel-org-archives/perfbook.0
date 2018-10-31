Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0c0czD0SMb1tJy4/PQ1BBVM9tMHjL3cXmJ3hCOJ8Nqc=;
        b=F0SJJhmMrTfup4aEewXOReNFCLSZcpGWErcSunZw3b8/p/wEDtj9931sESggYBV9aR
         mkyPe/lvMQiWOgubZh/n3xXhZfAl/vi+V3SK+gMAPoyZbU29VmO92LVHvYQ1OFa/g7A5
         IFidPh34+8Ute36z3uMRxPXJbX+9+tia1lWswFmG7leW8PeZQ+U76rIiTI0pL6tLwVWj
         /Jh5P+FTGnLIKgI78KDVrV5PW73m6My/ZxO1m5RurAwjqweX7D13YYSDcQlkGjMJ4kDp
         R70/jLXnl9RS+WrkCyvk7E/v7PS4Ej6f/9ryjlYVoK/nQPpoBFIt3pZ/imhI6dE2EUV9
         ymAA==
Subject: [PATCH 6/8] formal/axiomatic: Import snippet from
 C-RomanPenyanev-list-rcu-rr.litmus
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <54c7ef80-63f2-c148-f96e-f78f292b7e0c@gmail.com>
Date: Thu, 1 Nov 2018 00:14:42 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ec371f214cc26b5d3be12e2c8947964ac1b7be35 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 08:35:19 +0900
Subject: [PATCH 6/8] formal/axiomatic: Import snippet from C-RomanPenyanev-list-rcu-rr.litmus

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex | 62 ++++++----------------------------------------------
 1 file changed, 7 insertions(+), 55 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 8706635..797b8f2 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -274,60 +274,12 @@ the \co{herd} output.
 \end{lineref}
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:formal:Complex RCU Litmus Test]
-\begin{VerbatimL}[commandchars=\\\[\]]
-C C-RomanPenyaev-list-rcu-rr
-
-{
-	int *z=1;\lnlbl[listtail]
-	int *y=z;
-	int *x=y;
-	int *w=x;
-	int *v=w;\lnlbl[listhead]
-	int *c=w;\lnlbl[rrcache]
-}
-
-P0(int *c, int *v)\lnlbl[P0start]
-{
-	rcu_read_lock();\lnlbl[rl1]
-	r1 = READ_ONCE(*c);\lnlbl[rdcache]
-	if (r1 == 0) {\lnlbl[rdckcache]
-		r1 = READ_ONCE(*v);\lnlbl[rdinitcache]
-	}
-	r2 = rcu_dereference(*r1);\lnlbl[rdnext]
-	smp_store_release(c, r2);\lnlbl[rdupdcache]
-	rcu_read_unlock();\lnlbl[rul1]
-	rcu_read_lock();\lnlbl[rl2]
-	r3 = READ_ONCE(*c);
-	if (r3 == 0) {
-		r3 = READ_ONCE(*v);
-	}
-	r4 = rcu_dereference(*r3);
-	smp_store_release(c, r4);
-	rcu_read_unlock();\lnlbl[rul2]
-}\lnlbl[P0end]
-
-P1(int *c, int *v, int *w, int *x, int *y)\lnlbl[P1start]
-{
-	rcu_assign_pointer(*w, y);\lnlbl[updremove]
-	synchronize_rcu();\lnlbl[updsync1]
-	r1 = READ_ONCE(*c);\lnlbl[updrdcache]
-	if (r1 == x) {\lnlbl[updckcache]
-		WRITE_ONCE(*c, 0);\lnlbl[updinitcache]
-		synchronize_rcu();\lnlbl[updsync2]
-	}
-	smp_store_release(x, 0);\lnlbl[updfree]
-}\lnlbl[P1end]
-
-locations [0:r1; 1:r1; 1:r3; c; v; w; x; y]\lnlbl[locations]
-exists (0:r1=0 \/ 0:r2=0 \/ 0:r3=0 \/ 0:r4=0)\lnlbl[exists]
-\end{VerbatimL}
-\end{linelabel}
+\input{CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr@whole.fcv}
 \caption{Complex RCU Litmus Test}
 \label{lst:formal:Complex RCU Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:Complex RCU Litmus Test]
+\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 A litmus test for a more complex example proposed by
 Roman Penyaev~\cite{RomanPenyaev2018rrRCU} is shown in
 Figure~\ref{lst:formal:Complex RCU Litmus Test}.
@@ -374,7 +326,7 @@ registers \co{r3} and \co{r4} instead of \co{r1} and \co{r2}.
 As with
 Listing~\ref{lst:formal:Canonical RCU Removal Litmus Test},
 this litmus test stores zero to emulate \co{free()}, so
-line~\lnref{exists} checks for any of these four registers being
+line~\lnref{exists_} checks for any of these four registers being
 \co{NULL}, also known as zero.
 
 Because \co{P0()} leaks an RCU-protected pointer from its first
@@ -400,26 +352,26 @@ in the \co{herd} output.
 \end{lineref}
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:Complex RCU Litmus Test]
+	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	In Listing~\ref{lst:formal:Complex RCU Litmus Test},
 	why not have just one call to \co{synchronize_rcu()}
 	immediately before line~\lnref{updfree}?
 	\end{lineref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:formal:Complex RCU Litmus Test]
+	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Because this results in \co{P0()} accessing a freed element.
 	But don't take my word for this, try it out in \co{herd}!
 	\end{lineref}
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	\begin{lineref}[ln:formal:Complex RCU Litmus Test]
+	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Also in Listing~\ref{lst:formal:Complex RCU Litmus Test},
 	can't line~\lnref{updfree} be \co{WRITE_ONCE} instead
 	of \co{smp_store_release(}?
 	\end{lineref}
 \QuickQuizAnswer{
-	\begin{lineref}[ln:formal:Complex RCU Litmus Test]
+	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	That is an excellent question.
 	As of late 2018, the answer is ``no one knows''.
 	Much depends on the semantics of ARMv8's conditional-move
-- 
2.7.4


