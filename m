Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nyjqMracNshQOUkHIPJDqY39FEbIVS8shmtDZUdP5Bw=;
 b=Dyya1wz24DHPgI6+S7gjQlYJTYFME0S73wztypv87vrwkbwS9aJ1d0z9IOvK/wSAOE
 pwL43MOiknnXpqAC9JuUO31NF2v+U5bFmdAj+o1ik6D7tnn65inXyOnIFSRTGe6zfIBv
 AUQbmcd3qrLPw3kvitN1YBTxc38qgQ0uxA96AEUIBpDVTRf5tuWT52+TLwDPmqKeNjm+
 g9OOCczak8d8dzTdSu4mEshMI2kXdwCllWLdjNJNO4By/U7N0kjSnFTNZEYL5rvVRxEE
 gQHubWdu6aWs5i+1TRAjJOCSr17FTEqo43THX1FpzNSO0aJJo0Mo1ZaVetsph5xefHdp
 Th1Q==
Subject: [RFC PATCH 2/7] advsync: Permit p (page) placement for consecutive
 wide figures
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fc5b2d47-9e81-0472-53db-1b265e10bd60@gmail.com>
Date: Sat, 25 Mar 2017 18:37:00 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dca204da98e03f993098030fd6590b782a165690 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:42:38 +0900
Subject: [RFC PATCH 2/7] advsync: Permit p (page) placement for consecutive wide figures

In 2-column layouts, these figures tend to be placed far from where
it is referenced. It should be better to give room for LaTeX to
place these figures in dedicated pages.

In 1-column layouts, there is no visual change in the result.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index efc2cbd..496ace9 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2287,7 +2287,7 @@ Without intervention, CPU~2 may perceive the events on CPU~1 in some
 effectively random order, despite the write barrier issued by CPU~1, as
 shown in Figure~\ref{fig:advsync:Data Dependency Barrier Omitted}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/DataDependencyNeeded}
 \caption{Data Dependency Barrier Omitted}
@@ -2323,7 +2323,7 @@ values of {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
 then ordering will be as intuitively expected, as shown in
 Figure~\ref{fig:advsync:Data Dependency Barrier Supplied}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/DataDependencySupplied}
 \caption{Data Dependency Barrier Supplied}
@@ -2354,7 +2354,7 @@ Without intervention, CPU~2 may then choose to perceive the events on CPU~1 in
 some effectively random order, despite the write barrier issued by CPU~1, as
 shown in Figure~\ref{fig:advsync:Read Barrier Needed}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/ReadBarrierNeeded}
 \caption{Read Barrier Needed}
@@ -2386,7 +2386,7 @@ then the partial ordering imposed by CPU~1's write barrier will be
 perceived correctly by CPU~2, as shown in
 Figure~\ref{fig:advsync:Read Barrier Supplied}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/ReadBarrierSupplied}
 \caption{Read Barrier Supplied}
@@ -2421,7 +2421,7 @@ both occur after the load of \co{B}, they may both
 come up with different values, as shown in
 Figure~\ref{fig:advsync:Read Barrier Supplied, Double Load}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/ReadBarrierSupplied1}
 \caption{Read Barrier Supplied, Double Load}
@@ -2432,7 +2432,7 @@ Of course, it may well be that CPU~1's update to \co{A} becomes perceptible
 to CPU~2 before the read barrier completes, as shown in
 Figure~\ref{fig:advsync:Read Barrier Supplied, Take Two}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/ReadBarrierSupplied2}
 \caption{Read Barrier Supplied, Take Two}
@@ -2486,7 +2486,7 @@ common case, overlapping the load with the divides will permit the load
 to complete more quickly, as illustrated by
 Figure~\ref{fig:advsync:Speculative Load}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/SpeculativeLoad}
 \caption{Speculative Load}
@@ -2522,14 +2522,14 @@ from some other CPU, then the speculation will be cancelled and the
 value of \co{A} will be reloaded,
 as shown in Figure~\ref{fig:advsync:Speculative Loads Cancelled by Barrier}.

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/SpeculativeLoadBarrier}
 \caption{Speculative Load and Barrier}
 \ContributedBy{Figure}{fig:advsync:Speculative Loads and Barrier}{David Howells}
 \end{figure*}

-\begin{figure*}[htb]
+\begin{figure*}[htbp]
 \centering
 \includegraphics{advsync/SpeculativeLoadBarrierCancel}
 \caption{Speculative Load Cancelled by Barrier}
-- 
2.7.4


