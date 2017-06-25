Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35160 "EHLO
 mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751292AbdFYAH1 (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 24
 Jun 2017 20:07:27 -0400
Received: by mail-pg0-f67.google.com with SMTP id f127so10771606pgc.2 for
 <perfbook@vger.kernel.org>; Sat, 24 Jun 2017 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cucABB1UQyXU5HrOnYDfgUcoTrUfH5AVDO8b4nHLnWU=;
 b=OPbCw7p+GlEqp31bfHFiQO/D/GMjnKuxLiUptvant8QAKuavZquvn4CCj+9SfjHFI3
 UqU5GqFCrUniz589OwDeEy5EgEJKJzVlCZ+OCDLsTbAXS5OZdyk9MUPZ7arMsoQ7JenE
 i8kUDnpecvXEfkNE33DR1GzO6Dr7FC9B/WKnaILgVEupVCnXo6WVndWguYNX4DbqDPJv
 3ZPM00Y2aNNIE5ieo4KAJVkmExkaNWDT9mKbi8hJ3PnD69ble63dL9giWfj84hS3bARk
 AYR34OsJcIxIeSSaIAlhGrO6E8ft875tnEtMR27v7skjptTgdIYs81bwykJhYE/xMbcz
 ZoLQ==
Subject: [PATCH 4/5] treewide: Add narrow spaces before non-SI unit symbols
References: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fd84cf1a-0be3-7199-5b26-78929eb9aa7f@gmail.com>
Date: Sun, 25 Jun 2017 09:07:24 +0900
MIME-Version: 1.0
In-Reply-To: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 64220c4713a15cec809cec8b7826d01fdbd325a4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Jun 2017 19:39:55 +0900
Subject: [PATCH 4/5] treewide: Add narrow spaces before non-SI unit symbols

KB, MB, and GB are not covered in NIST style guide.
Although it is common not to place white spaces before them in
computer technology literature, this commit adds narrow spaces
before them for consistency with SI unit symbols.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overview.tex      | 6 +++---
 formal/dyntickrcu.tex | 4 ++--
 formal/spinhint.tex   | 6 +++---
 intro/intro.tex       | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/cpu/overview.tex b/cpu/overview.tex
index b92c42c..f5c5558 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -92,15 +92,15 @@ thousands of instructions in the time required to access memory.
 This disparity is due to the fact that Moore's Law has increased CPU
 performance at a much greater rate than it has decreased memory latency,
 in part due to the rate at which memory sizes have grown.
-For example, a typical 1970s minicomputer might have 4KB (yes, kilobytes,
+For example, a typical 1970s minicomputer might have 4\,KB (yes, kilobytes,
 not megabytes, let alone gigabytes) of main memory, with
 single-cycle access.\footnote{
 	It is only fair to add that each of these single cycles
 	lasted no less than 1.6 \emph{microseconds}.}
-In 2008, CPU designers still can construct a 4KB memory with single-cycle
+In 2008, CPU designers still can construct a 4\,KB memory with single-cycle
 access, even on systems with multi-GHz clock frequencies.
 And in fact they frequently do construct such memories, but they now
-call them ``level-0 caches'', and they can be quite a bit bigger than 4KB.
+call them ``level-0 caches'', and they can be quite a bit bigger than 4\,KB.

 \begin{figure}[htb]
 \centering
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 55b2723..80fa3e7 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -55,14 +55,14 @@ Promela and spin~\cite{Holzmann03a}, as described in
 Chapter~\ref{chp:Formal Verification}.
 The following presents a series of seven increasingly realistic
 Promela models, the last of which passes, consuming about
-40GB of main memory for the state space.
+40\,GB of main memory for the state space.

 More important, Promela and Spin did find a very subtle bug for me!

 \QuickQuiz{}
 	Yeah, that's just great!
 	Now, just what am I supposed to do if I don't happen to have a
-	machine with 40GB of main memory???
+	machine with 40\,GB of main memory???
 \QuickQuizAnswer{
 	Relax, there are a number of lawful answers to
 	this question:
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index a18ae23..a40d2c3 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -378,7 +378,7 @@ as a function of number of incrementers modeled
 (by redefining {\tt NUMPROCS}):

 Running unnecessarily large models is thus subtly discouraged, although
-652MB is well within the limits of modern desktop and laptop machines.
+652\,MB is well within the limits of modern desktop and laptop machines.

 With this example under our belt, let's take a closer look at the
 commands used to analyze Promela models and then look at more
@@ -410,7 +410,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	can reach into the tens of millions with very small state
 	machines, so you will need a machine with large memory.
 	For example, \path{qrcu.spin} with 3 readers and 2 updaters required
-	2.7GB of memory.
+	2.7\,GB of memory.

 	If you aren't sure whether your machine has enough memory,
 	run \co{top} in one window and \co{./pan} in another.  Keep the
@@ -484,7 +484,7 @@ C++, or Java.
 	only six states, more than a five-fold reduction.  That factor
 	of five might not seem like a problem, at least not until you
 	are struggling with a verification program possessing more than
-	150 million states consuming more than 10GB of memory!
+	150 million states consuming more than 10\,GB of memory!
 \item	One of the most challenging things both in C torture-test code and
 	in Promela is formulating good assertions.  Promela also allows
 	\co{never} claims that act sort of like an assertion replicated
diff --git a/intro/intro.tex b/intro/intro.tex
index bf512f6..8eaa196 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -164,7 +164,7 @@ as discussed in Section~\ref{sec:cpu:Hardware Free Lunch?}.
 	In contrast, in 2006, Paul finds himself typing these words on a
 	dual-core x86 laptop.
 	Unlike the dual-80486 CPU boards, this laptop also contains
-	2GB of main memory, a 60GB disk drive, a display, Ethernet,
+	2\,GB of main memory, a 60\,GB disk drive, a display, Ethernet,
 	USB ports, wireless, and Bluetooth.
 	And the laptop is more than an order of magnitude cheaper than
 	even one of those dual-80486 CPU boards, even before taking inflation
-- 
2.7.4


