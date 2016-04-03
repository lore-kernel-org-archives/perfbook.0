Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34711 "EHLO
 mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751347AbcDCWZd (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3
 Apr 2016 18:25:33 -0400
Received: by mail-pf0-f195.google.com with SMTP id d184so3714363pfc.1 for
 <perfbook@vger.kernel.org>; Sun, 03 Apr 2016 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DK99G8YNVuG2s5GlfuzIFubzzR7W3FaVOyqBOnMhYOM=;
 b=dJ8mJHrvPFBNJvWPVSc2BXaZ2Q4EaWO75KCkqvswBuCsvOsnv3BmkalKuaAWSAX8Ep
 CBqeBH+d07+PJhLdlUf9hHoJDkykor6SHPnhf0IJA1NWkCpfOSspmuUtSza2A5LK1Oex
 /l3LCI7W6hWB3TZElr4wJtS3w+n4F5j5q4ASd6VjSFU544+tZmjGkqPQ6ej9WDZKnZTY
 wcX8HCzeXyXmxEohguBOPmNkj4+uYC3uk/GuOuv1QkKfIW9QXnCzz74JmFg5DnjdB6eu
 PQaCQ+48PFKj6rzLdEP6uZ43dxu7VRcMXkmPlS1mqc//v2y6oGIqBPNfskAC4jtQpgAD
 74Og==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] advsync: fix latex syntax related typos
Date: Mon,  4 Apr 2016 07:25:19 +0900
Message-Id: <1459722319-8443-1-git-send-email-sj38.park@gmail.com>
In-Reply-To: <alpine.DEB.2.10.1604040651570.22948@hxeon>
References: <alpine.DEB.2.10.1604040651570.22948@hxeon>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

This commit fixes typos related with latex.  The typos include:
missed tildes, doubly inserted commas, and incinsistently formatted code
citations.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index c668f3c..47d910a 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -37,7 +37,7 @@ appears to guarantee that the assertion never fires.
 After all, if \co{r1 != 1}, we might hope that Thread~1's load from \co{y}
 must have happened before Thread~2's store to \co{y}, which might raise
 further hopes that Thread~2's load from \co{x} must happen after
-Thread 1's store to \co{x}, so that \co{r2 == 1}, as required by the
+Thread~1's store to \co{x}, so that \co{r2 == 1}, as required by the
 assertion.
 The example is symmetric, so similar hopeful reasoning might lead
 us to hope that \co{r2 != 1} guarantees that \co{r1 == 1}.
@@ -295,7 +295,7 @@ over a 532-nanosecond time period, as shown in
 Figure~\ref{fig:advsync:A Variable With Multiple Simultaneous Values}.
 This data was collected on 1.5GHz POWER5 system with 8 cores, each containing
 a pair of hardware threads.
-CPUs~1, 2, 3, and 4 recorded the values, while CPU 0 controlled the test.
+CPUs~1, 2, 3, and~4 recorded the values, while CPU~0 controlled the test.
 The timebase counter period was about 5.32ns, sufficiently fine-grained
 to allow observations of intermediate cache states.

@@ -1039,10 +1039,10 @@ a few simple rules:
 		that variable's value.}
 \item	If one CPU does ordered stores to variables A and B,\footnote{
 		For example, by executing the store to A, a
-		memory barrier, and then the store to B.},
+		memory barrier, and then the store to B.}
 	and if a second CPU does ordered loads from B and A,\footnote{
 		For example, by executing the load from B, a
-		memory barrier, and then the load from A.},
+		memory barrier, and then the load from A.}
 	then if the second CPU's load from B gives the value stored
 	by the first CPU, then the second CPU's load from A must
 	give the value stored by the first CPU.
@@ -1903,9 +1903,9 @@ In the above example, CPU~2 perceives that \co{B} is 7,
 despite the load of \co{*C}
 (which would be \co{B}) coming after the \co{LOAD} of \co{C}.

-If, however, a data dependency barrier were to be placed between the load of C
-and the load of \co{*C} (i.e.: \co{B}) on CPU~2, again with initial values of
-{\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
+If, however, a data dependency barrier were to be placed between the load of
+\co{C} and the load of \co{*C} (i.e.: \co{B}) on CPU~2, again with initial
+values of {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -2002,7 +2002,7 @@ Figure~\ref{fig:advsync:Read Barrier Supplied}.
 \end{figure*}

 To illustrate this more completely, consider what could happen if the code
-contained a load of A either side of the read barrier, once again
+contained a load of \co{A} either side of the read barrier, once again
 with the same initial values of
 {\tt \{A = 0, B = 9\}}:

-- 
1.9.1

