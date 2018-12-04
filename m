Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yioaos0WJFjAGytxh7QNuKKZzJrghhMwab2WPM6U4bM=;
        b=Yy3UNZAROqFtskRkkm2nnpoAQvCvNEhUG40iMSISsMT8V6xFP+njjXRovWKudQaibL
         Mngx8R18DEiusPh3ofqOA0TLDSMuVPYF2TF1HdaWgTn8V+6ziEb2Km0wnzzUI2E14FjO
         vactjBHoPoNwBY8wsZVW4pptlGdJYU+iQ1Yo1Q1vzgIosHjj09A+PjM3gUSbNJyk0eOo
         lx4v3LNra7ViqDybM5zoRzoK8C3WVslp++tCVUwXHwcfeuOkeL4RvKCKQkpsrvBrIOgb
         F2esrCKXfrBZgb4fCZWelw2cDKPHHk0yOIS/mrgU1WABmNPHC0/UoB8e9W7AeHUEmiJR
         ticA==
Subject: [PATCH 3/4] defer: Prevent page/column break in short inline code
 snippets
References: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <07819686-d1a2-f170-c4da-3dd80805a4d2@gmail.com>
Date: Wed, 5 Dec 2018 00:31:10 +0900
MIME-Version: 1.0
In-Reply-To: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 23fca971d1fe94d7c3e1dd94ea9818e397056e10 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 23:40:56 +0900
Subject: [PATCH 3/4] defer: Prevent page/column break in short inline code snippets

Put "samepage=true" option to such VerbatimN snippets.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcufundamental.tex | 14 +++++++-------
 defer/rcuintro.tex       |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 3a5fad2..6cf209c 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -112,7 +112,7 @@ We therefore encapsulate them into a primitive
 \co{rcu_assign_pointer()} that has publication semantics.
 The last four lines would then be as follows:
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 p->a = 1;
 p->b = 2;
 p->c = 3;
@@ -128,7 +128,7 @@ However, it is not sufficient to only enforce ordering at the
 updater, as the reader must enforce proper ordering as well.
 Consider for example the following code fragment:
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 p = gp;
 if (p != NULL) {
 	do_something_with(p->a, p->b, p->c);
@@ -163,7 +163,7 @@ directives are required for this purpose:\footnote{
 	\co{memory_order_acquire}, thus emitting a needless memory-barrier
 	instruction on weakly ordered systems.)}
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 rcu_read_lock();
 p = rcu_dereference(gp);
 if (p != NULL) {
@@ -257,7 +257,7 @@ instance from executing concurrently with RCU readers.
 
 Subscribing to an RCU-protected list is straightforward:
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 rcu_read_lock();
 list_for_each_entry_rcu(p, head, list) {
 	do_something_with(p->a, p->b, p->c);
@@ -340,7 +340,7 @@ mechanism, for example, a lock.
 Subscribing to an RCU-protected hlist is also similar to the
 circular list:
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 rcu_read_lock();
 hlist_for_each_entry_rcu(p, head, list) {
 	do_something_with(p->a, p->b, p->c);
@@ -544,7 +544,7 @@ to read as follows:
 \end{lineref}
 
 \begin{linelabel}[ln:defer:RCU Deletion From Linked List]
-\begin{VerbatimN}[commandchars=\\\[\]]
+\begin{VerbatimN}[samepage=true,commandchars=\\\[\]]
 p = search(head, key);
 if (p != NULL) {
 	list_del_rcu(&p->list);		\lnlbl[del_rcu]
@@ -623,7 +623,7 @@ example shown in
 Listing~\ref{lst:defer:Canonical RCU Replacement Example}:
 
 \begin{linelabel}[ln:defer:Canonical RCU Replacement Example (2nd)]
-\begin{VerbatimN}[commandchars=\\\[\],firstnumber=15]
+\begin{VerbatimN}[samepage=true,commandchars=\\\[\],firstnumber=15]
 q = kmalloc(sizeof(*p), GFP_KERNEL);	\lnlbl[kmalloc]
 *q = *p;				\lnlbl[copy]
 q->b = 2;				\lnlbl[update1]
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index b93136d..f42e2e7 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -146,7 +146,7 @@ with time advancing from the top of the figure to the bottom.
 Although production-quality implementations of this approach can be
 quite complex, a toy implementation is exceedingly simple:
 
-\begin{VerbatimN}
+\begin{VerbatimN}[samepage=true]
 for_each_online_cpu(cpu)
 	run_on(cpu);
 \end{VerbatimN}
-- 
2.7.4


