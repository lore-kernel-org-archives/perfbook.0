Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jk6eQ3EThaeMqNdE5YjvMHUZRWsx1PUmGg28qiwpe9g=;
 b=XDrdtF9ScKS3V9VF/BibRGQA1uHD6vfsPDGe8GYnDFVdO/UWGbuOBXhTf0400HQurU
 V83W2fqCFIDq1jo85izCBeefNOu/EuqfvfcICOtdRZPpemS/uz05bF3oVOjo9NEk86NG
 bUeFtFS7YuOuo3X6XTyPRanWDWbCk5FyZ2WTV1SWbljep8mkh8A9OtCgiM/W8nY5gPX3
 w1zqBkjZPFP6j/9sYEbAAisyJ5G5ZLjVDH0Ce98cgZGT3rqgwU7NXfFDp11hZNWUDfEI
 E6JeDhP/cZFEgqRY2H5+9hkoacnle/dUWwLbms7gJ7h8CMoSnthxJfQBLw0fkwxs46bU
 2N4A==
Subject: [PATCH v2 5/8] Disable 'floatrow' layout in manually aligned code
 snippets
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <03775301-1fba-5876-0fa4-d698e624180c@gmail.com>
Date: Mon, 31 Jul 2017 23:50:22 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b6806967d9ffbac1c992769e62e67c86134e2630 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 21 Jul 2017 00:02:37 +0900
Subject: [PATCH v2 5/8] Disable 'floatrow' layout in manually aligned code snippets

floatrow's default horizontal margin setting is "centering".
It conflicts with manually aligned code snippets in "figure*"
environments.

Disable the layout by \RawFloats macro for now.

These listings should be grouped into combined floating objects,
if we decide to employ the floatrow's feature.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 6 +++---
 howto/howto.tex    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index af4faff..f3174f3 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -603,7 +603,7 @@ and
 all taken from
 Wikipedia~\cite{WikipediaRCU}.

-\begin{figure*}[htbp]
+\begin{figure*}[htbp]\RawFloats
 { \scriptsize
 \begin{verbbox}
  1 struct el {                           1 struct el {
@@ -623,7 +623,7 @@ Wikipedia~\cite{WikipediaRCU}.
 \label{fig:defer:Converting Reader-Writer Locking to RCU: Data}
 \end{figure*}

-\begin{figure*}[htbp]
+\begin{figure*}[htbp]\RawFloats
 { \scriptsize
 \begin{verbbox}
  1 int search(long key, int *result)     1 int search(long key, int *result)
@@ -649,7 +649,7 @@ Wikipedia~\cite{WikipediaRCU}.
 \label{fig:defer:Converting Reader-Writer Locking to RCU: Search}
 \end{figure*}

-\begin{figure*}[htbp]
+\begin{figure*}[htbp]\RawFloats
 { \scriptsize
 \begin{verbbox}
  1 int delete(long key)                  1 int delete(long key)
diff --git a/howto/howto.tex b/howto/howto.tex
index 323f95f..af88c46 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -361,7 +361,7 @@ Other types of systems have well-known ways of locating files by filename.
 \section{Whose Book Is This?}
 \label{sec:howto:Whose Book Is This?}

-\begin{figure*}[tbp]
+\begin{figure*}[tbp]\RawFloats
 {
 \scriptsize
 \begin{verbbox}
@@ -379,7 +379,7 @@ Other types of systems have well-known ways of locating files by filename.
 \label{fig:howto:Creating a Up-To-Date PDF}
 \end{figure*}

-\begin{figure*}[tbp]
+\begin{figure*}[tbp]\RawFloats
 {
 \scriptsize
 \begin{verbbox}
-- 
2.7.4


