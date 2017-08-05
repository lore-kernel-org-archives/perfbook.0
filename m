Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36340 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751136AbdHEDoX (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 4
 Aug 2017 23:44:23 -0400
Received: by mail-pg0-f66.google.com with SMTP id y129so3375747pgy.3 for
 <perfbook@vger.kernel.org>; Fri, 04 Aug 2017 20:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k29QnnBEJtyzs3fxBazSMRLUslr86fG7ssdIxpxiB5Q=;
 b=W2iSsJBdt+wacX1GFI/YDfEz/4D4wD5QN3xn0GX/WBJ7gGYOlIACoaiybFsD/aHepr
 V/kJu2cWpDSQn8z7OvMt3UviHgg354bBllLMQM0Hjp6hCN2Qti4cBUEkqNC7yK+a9Aap
 Qo80oWs5GvOT6LckVqDQMXlUS54yFAhawLbiwOXYiZjkXIMDSTyA7fpS0OBnuuu+RevH
 KY9Fa76qYOZcwuXkdn6CdEYSyAtsqBLeCjQuyTJ2cdxj+xoYZZWHjGyE53XUUrmukuYS
 lQj+VK9mBni7JRaq39e/9w6/ZTiwOWXzqCbgFbkrjxQIDzXxXOE2WAV9e204zCop2L6E
 G/Kg==
Subject: [PATCH 2/3] advsync: Employ auto-numbering in litmus tests
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
 <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
 <20170802162910.GY3730@linux.vnet.ibm.com>
 <0a7b7a93-c60c-436f-77a7-e2b27de86a40@gmail.com>
 <20170802224820.GH3730@linux.vnet.ibm.com>
 <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
 <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <64b5ab11-6891-1561-e139-a951e907e8eb@gmail.com>
Date: Sat, 5 Aug 2017 12:44:19 +0900
MIME-Version: 1.0
In-Reply-To: <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From afc9bca87eff357ed51a49e8933a1006071d8b39 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 3 Aug 2017 21:37:34 +0900
Subject: [PATCH 2/3] advsync: Employ auto-numbering in litmus tests

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 502 ++++++++++++++++++++++-----------------------
 perfbook.tex               |   2 +
 2 files changed, 253 insertions(+), 251 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 6754ba5..3ebd3bc 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -14,29 +14,29 @@ RCU.

 \begin{figure}
 { \scriptsize
-\begin{verbbox}
- 1 C C-SB+o-o+o-o
- 2 {
- 3 }
- 4
- 5 P0(int *x0, int *x1)
- 6 {
- 7   int r2;
- 8
- 9   WRITE_ONCE(*x0, 2);
-10   r2 = READ_ONCE(*x1);
-11 }
-12
-13
-14 P1(int *x0, int *x1)
-15 {
-16   int r2;
-17
-18   WRITE_ONCE(*x1, 2);
-19   r2 = READ_ONCE(*x0);
-20 }
-21
-22 exists (1:r2=0 /\ 0:r2=0)
+\begin{verbbox}[\LstLineNo]
+C C-SB+o-o+o-o
+{
+}
+
+P0(int *x0, int *x1)
+{
+  int r2;
+
+  WRITE_ONCE(*x0, 2);
+  r2 = READ_ONCE(*x1);
+}
+
+
+P1(int *x0, int *x1)
+{
+  int r2;
+
+  WRITE_ONCE(*x1, 2);
+  r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ 0:r2=0)
 \end{verbbox}
 }
 \centering
@@ -284,31 +284,31 @@ thus allowing you to stop reading this section.

 \begin{figure}
 { \scriptsize
-\begin{verbbox}
- 1 C C-SB+o-mb-o+o-mb-o
- 2 {
- 3 }
- 4
- 5 P0(int *x0, int *x1)
- 6 {
- 7   int r2;
- 8
- 9   WRITE_ONCE(*x0, 2);
-10   smp_mb();
-11   r2 = READ_ONCE(*x1);
-12 }
-13
-14
-15 P1(int *x0, int *x1)
-16 {
-17   int r2;
-18
-19   WRITE_ONCE(*x1, 2);
-20   smp_mb();
-21   r2 = READ_ONCE(*x0);
-22 }
-23
-24 exists (1:r2=0 /\ 0:r2=0)
+\begin{verbbox}[\LstLineNo]
+C C-SB+o-mb-o+o-mb-o
+{
+}
+
+P0(int *x0, int *x1)
+{
+  int r2;
+
+  WRITE_ONCE(*x0, 2);
+  smp_mb();
+  r2 = READ_ONCE(*x1);
+}
+
+
+P1(int *x0, int *x1)
+{
+  int r2;
+
+  WRITE_ONCE(*x1, 2);
+  smp_mb();
+  r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ 0:r2=0)
 \end{verbbox}
 }
 \centering
@@ -589,32 +589,32 @@ loads and stores.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-MP+o-wmb-o+o-o.litmus
- 2
- 3 {
- 4 }
- 5
- 6
- 7 P0(int* x0, int* x1) {
- 8
- 9   WRITE_ONCE(*x0, 2);
-10   smp_wmb();
-11   WRITE_ONCE(*x1, 2);
-12
-13 }
-14
-15 P1(int* x0, int* x1) {
-16
-17   int r2;
-18   int r3;
-19
-20   r2 = READ_ONCE(*x1);
-21   r3 = READ_ONCE(*x0);
-22
-23 }
-24
-25 exists (1:r2=2 /\ 1:r3=0)
+\begin{verbbox}[\LstLineNo]
+C C-MP+o-wmb-o+o-o.litmus
+
+{
+}
+
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
+exists (1:r2=2 /\ 1:r3=0)
 \end{verbbox}
 }
 \centering
@@ -636,32 +636,32 @@ this~\cite{JadeAlglave2011ppcmem}.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-MP+o-wmb-o+o-rmb-o.litmus
- 2
- 3 {
- 4 }
- 5
- 6 P0(int* x0, int* x1) {
- 7
- 8   WRITE_ONCE(*x0, 2);
- 9   smp_wmb();
-10   WRITE_ONCE(*x1, 2);
-11
-12 }
-13
-14 P1(int* x0, int* x1) {
-15
-16   int r2;
-17   int r3;
-18
-19   r2 = READ_ONCE(*x1);
-20   smp_rmb();
-21   r3 = READ_ONCE(*x0);
-22
-23 }
-24
-25 exists (1:r2=2 /\ 1:r3=0)
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
 \end{verbbox}
 }
 \centering
@@ -677,29 +677,29 @@ Figure~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-LB+o-o+o-o
- 2 {
- 3 }
- 4
- 5 P0(int *x0, int *x1)
- 6 {
- 7   int r2;
- 8
- 9   r2 = READ_ONCE(*x1);
-10   WRITE_ONCE(*x0, 2);
-11 }
-12
-13
-14 P1(int *x0, int *x1)
-15 {
-16   int r2;
-17
-18   r2 = READ_ONCE(*x0);
-19   WRITE_ONCE(*x1, 2);
-20 }
-21
-22 exists (1:r2=2 /\ 0:r2=2)
+\begin{verbbox}[\LstLineNo]
+C C-LB+o-o+o-o
+{
+}
+
+P0(int *x0, int *x1)
+{
+  int r2;
+
+  r2 = READ_ONCE(*x1);
+  WRITE_ONCE(*x0, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+  int r2;
+
+  r2 = READ_ONCE(*x0);
+  WRITE_ONCE(*x1, 2);
+}
+
+exists (1:r2=2 /\ 0:r2=2)
 \end{verbbox}
 }
 \centering
@@ -718,29 +718,29 @@ reordering~\cite{JadeAlglave2011ppcmem}.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-LB+o-r+a-o.litmus
- 2 {
- 3 }
- 4
- 5 P0(int *x0, int *x1)
- 6 {
- 7   int r2;
- 8
- 9   r2 = READ_ONCE(*x1);
-10   smp_store_release(x0, 2);
-11 }
-12
-13
-14 P1(int *x0, int *x1)
-15 {
-16   int r2;
-17
-18   r2 = smp_load_acquire(x0);
-19   WRITE_ONCE(*x1, 2);
-20 }
-21
-22 exists (1:r2=2 /\ 0:r2=2)
+\begin{verbbox}[\LstLineNo]
+C C-LB+o-r+a-o.litmus
+{
+}
+
+P0(int *x0, int *x1)
+{
+  int r2;
+
+  r2 = READ_ONCE(*x1);
+  smp_store_release(x0, 2);
+}
+
+
+P1(int *x0, int *x1)
+{
+  int r2;
+
+  r2 = smp_load_acquire(x0);
+  WRITE_ONCE(*x1, 2);
+}
+
+exists (1:r2=2 /\ 0:r2=2)
 \end{verbbox}
 }
 \centering
@@ -757,31 +757,31 @@ Figure~\ref{fig:advsync:Enforcing Ordering of Load-Buffering Litmus Test}.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-MP+o-o+o-rmb-o.litmus
- 2
- 3 {
- 4 }
- 5
- 6 P0(int* x0, int* x1) {
- 7
- 8   WRITE_ONCE(*x0, 2);
- 9   WRITE_ONCE(*x1, 2);
-10
-11 }
-12
-13 P1(int* x0, int* x1) {
-14
-15   int r2;
-16   int r3;
-17
-18   r2 = READ_ONCE(*x1);
-19   smp_rmb();
-20   r3 = READ_ONCE(*x0);
-21
-22 }
-23
-24 exists (1:r2=2 /\ 1:r3=0)
+\begin{verbbox}[\LstLineNo]
+C C-MP+o-o+o-rmb-o.litmus
+
+{
+}
+
+P0(int* x0, int* x1) {
+
+  WRITE_ONCE(*x0, 2);
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
 \end{verbbox}
 }
 \centering
@@ -811,33 +811,33 @@ instruction.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-MP+o-wmb-o+o-ad-o.litmus
- 2
- 3 {
- 4 int y=1;
- 5 int *x1 = &y;
- 6 }
- 7
- 8 P0(int* x0, int** x1) {
- 9
-10   WRITE_ONCE(*x0, 2);
-11   smp_wmb();
-12   WRITE_ONCE(*x1, x0);
-13
-14 }
-15
-16 P1(int** x1) {
-17
-18   int *r2;
-19   int r3;
-20
-21   r2 = READ_ONCE(*x1);
-22   r3 = READ_ONCE(*r2);
-23
-24 }
-25
-26 exists (1:r2=x0 /\ 1:r3=1)
+\begin{verbbox}[\LstLineNo]
+C C-MP+o-wmb-o+o-ad-o.litmus
+
+{
+int y=1;
+int *x1 = &y;
+}
+
+P0(int* x0, int** x1) {
+
+  WRITE_ONCE(*x0, 2);
+  smp_wmb();
+  WRITE_ONCE(*x1, x0);
+
+}
+
+P1(int** x1) {
+
+  int *r2;
+  int r3;
+
+  r2 = READ_ONCE(*x1);
+  r3 = READ_ONCE(*r2);
+
+}
+
+exists (1:r2=x0 /\ 1:r3=1)
 \end{verbbox}
 }
 \centering
@@ -872,33 +872,33 @@ Section~\ref{sec:app:whymb:Alpha}.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-MP+o-wmb-o+ld-ad-o.litmus
- 2
- 3 {
- 4 int y=1;
- 5 int *x1 = &y;
- 6 }
- 7
- 8 P0(int* x0, int** x1) {
- 9
-10   WRITE_ONCE(*x0, 2);
-11   smp_wmb();
-12   WRITE_ONCE(*x1, x0);
-13
-14 }
-15
-16 P1(int** x1) {
-17
-18   int *r2;
-19   int r3;
-20
-21   r2 = lockless_dereference(*x1);
-22   r3 = READ_ONCE(*r2);
-23
-24 }
-25
-26 exists (1:r2=x0 /\ 1:r3=1)
+\begin{verbbox}[\LstLineNo]
+C C-MP+o-wmb-o+ld-ad-o.litmus
+
+{
+int y=1;
+int *x1 = &y;
+}
+
+P0(int* x0, int** x1) {
+
+  WRITE_ONCE(*x0, 2);
+  smp_wmb();
+  WRITE_ONCE(*x1, x0);
+
+}
+
+P1(int** x1) {
+
+  int *r2;
+  int r3;
+
+  r2 = lockless_dereference(*x1);
+  r3 = READ_ONCE(*r2);
+
+}
+
+exists (1:r2=x0 /\ 1:r3=1)
 \end{verbbox}
 }
 \centering
@@ -916,32 +916,32 @@ thereby forcing the required ordering on all platforms.

 \begin{figure}[tbp]
 { \scriptsize
-\begin{verbbox}
- 1 C C-S+o-wmb-o+o-ad-o.litmus
- 2
- 3 {
- 4 int y=1;
- 5 int *x1 = &y;
- 6 }
- 7
- 8 P0(int* x0, int** x1) {
- 9
-10   WRITE_ONCE(*x0, 2);
-11   smp_wmb();
-12   WRITE_ONCE(*x1, x0);
-13
-14 }
-15
-16 P1(int** x1) {
-17
-18   int *r2;
-19
-20   r2 = READ_ONCE(*x1);
-21   WRITE_ONCE(*r2, 3);
-22
-23 }
-24
-25 exists (1:r2=x0 /\ x0=2)
+\begin{verbbox}[\LstLineNo]
+C C-S+o-wmb-o+o-ad-o.litmus
+
+{
+int y=1;
+int *x1 = &y;
+}
+
+P0(int* x0, int** x1) {
+
+  WRITE_ONCE(*x0, 2);
+  smp_wmb();
+  WRITE_ONCE(*x1, x0);
+
+}
+
+P1(int** x1) {
+
+  int *r2;
+
+  r2 = READ_ONCE(*x1);
+  WRITE_ONCE(*r2, 3);
+
+}
+
+exists (1:r2=x0 /\ x0=2)
 \end{verbbox}
 }
 \centering
diff --git a/perfbook.tex b/perfbook.tex
index cda014c..7e201a6 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -80,6 +80,8 @@
 \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

+\newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
+
 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice

 \IfLmttForCode{
-- 
2.7.4


