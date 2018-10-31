Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WFVYmlMtDsPHBBjst5y/GzmLar6zf4KZaDqotosApnQ=;
        b=Glgdaz9LRm2WEn/4lFLDdQsSzMxCknK+/xoCDxJwMRZHSGAHV+IhticCzTRA1ufjNY
         SuHSy9636eat4SmPro18ugZkQSCvg8/GNZqafgCypIfD+CrzgkNtF5PqlA4dto/uvem8
         weq/00z13Rt8dAqposvZjIx60pnKWAL95fD8wujHWlI0nRRxBlWudfJKny6Q5XFpC284
         BpzUXio0oACd9SyTip7x28ah4B6dxOb5Fb9nxpSVjG0IY6qpvf5r2IMFOpJPM1OnpN9c
         R0zAorC+7cCc8GkP4d5YH8KeolcQX10N10ZjTUVUGyKnOgJcd9AzDYmzpUBkFMhVOo5D
         y7aQ==
Subject: [PATCH 7/8] formal/axiomatic: Convert snippets of IRIW tests to new
 scheme
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0c356dde-c3fb-2839-4a57-5df8beeb6e06@gmail.com>
Date: Thu, 1 Nov 2018 00:15:36 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a5c69acf48225773c83a5fab84e7aaaa0fae3664 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 19:59:22 +0900
Subject: [PATCH 7/8] formal/axiomatic: Convert snippets of IRIW tests to new scheme

Also by reducing width of header comment, use "listing" env
instead of "listing*" env.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex | 101 +++++++++++++++++++++++++--------------------------
 1 file changed, 49 insertions(+), 52 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 797b8f2..a5f610d 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -7,32 +7,30 @@
 \epigraph{Theory helps us to bear our ignorance of facts.}
 	{\emph{George Santayana}}
 
-\begin{listing*}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 PPC IRIW.litmus
- 2 ""
- 3 (* Traditional IRIW. *)
- 4 {
- 5 0:r1=1; 0:r2=x;
- 6 1:r1=1;         1:r4=y;
- 7         2:r2=x; 2:r4=y;
- 8         3:r2=x; 3:r4=y;
- 9 }
-10 P0           | P1           | P2           | P3           ;
-11 stw r1,0(r2) | stw r1,0(r4) | lwz r3,0(r2) | lwz r3,0(r4) ;
-12              |              | sync         | sync         ;
-13              |              | lwz r5,0(r4) | lwz r5,0(r2) ;
-14 
-15 exists
-16 (2:r3=1 /\ 2:r5=0 /\ 3:r3=1 /\ 3:r5=0)
-\end{verbbox}
+\begin{listing}[tb]
+\begin{linelabel}[ln:formal:IRIW Litmus Test]
+\begin{VerbatimL}[commandchars=\%\@\$]
+PPC IRIW.litmus
+""
+(* Traditional IRIW. *)
+{
+0:r1=1; 0:r2=x;
+1:r1=1;         1:r4=y;
+        2:r2=x; 2:r4=y;
+        3:r2=x; 3:r4=y;
 }
-\centering
-\theverbbox
+P0           | P1           | P2           | P3           ;
+stw r1,0(r2) | stw r1,0(r4) | lwz r3,0(r2) | lwz r3,0(r4) ;
+             |              | sync         | sync         ;
+             |              | lwz r5,0(r4) | lwz r5,0(r2) ;
+
+exists
+(2:r3=1 /\ 2:r5=0 /\ 3:r3=1 /\ 3:r5=0)
+\end{VerbatimL}
+\end{linelabel}
 \caption{IRIW Litmus Test}
 \label{lst:formal:IRIW Litmus Test}
-\end{listing*}
+\end{listing}
 
 Although the PPCMEM tool can solve the famous ``independent reads of
 independent writes'' (IRIW) litmus test shown in
@@ -75,38 +73,37 @@ The resulting tool, called ``herd'',  conveniently takes as input the
 same litmus tests as PPCMEM, including the IRIW litmus test shown in
 Listing~\ref{lst:formal:IRIW Litmus Test}.
 
-\begin{listing*}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 PPC IRIW5.litmus
- 2 ""
- 3 (* Traditional IRIW, but with five stores instead of just one. *)
- 4 {
- 5 0:r1=1; 0:r2=x;
- 6 1:r1=1;         1:r4=y;
- 7         2:r2=x; 2:r4=y;
- 8         3:r2=x; 3:r4=y;
- 9 }
-10 P0           | P1           | P2           | P3           ;
-11 stw r1,0(r2) | stw r1,0(r4) | lwz r3,0(r2) | lwz r3,0(r4) ;
-12 addi r1,r1,1 | addi r1,r1,1 | sync         | sync         ;
-13 stw r1,0(r2) | stw r1,0(r4) | lwz r5,0(r4) | lwz r5,0(r2) ;
-14 addi r1,r1,1 | addi r1,r1,1 |              |              ;
-15 stw r1,0(r2) | stw r1,0(r4) |              |              ;
-16 addi r1,r1,1 | addi r1,r1,1 |              |              ;
-17 stw r1,0(r2) | stw r1,0(r4) |              |              ;
-18 addi r1,r1,1 | addi r1,r1,1 |              |              ;
-19 stw r1,0(r2) | stw r1,0(r4) |              |              ;
-20 
-21 exists
-22 (2:r3=1 /\ 2:r5=0 /\ 3:r3=1 /\ 3:r5=0)
-\end{verbbox}
+\begin{listing}[tb]
+\begin{linelabel}[ln:formal:Expanded IRIW Litmus Test]
+\begin{VerbatimL}[commandchars=\%\@\$]
+PPC IRIW5.litmus
+""
+(* Traditional IRIW, but with five stores instead of *)
+(* just one.                                         *)
+{
+0:r1=1; 0:r2=x;
+1:r1=1;         1:r4=y;
+        2:r2=x; 2:r4=y;
+        3:r2=x; 3:r4=y;
 }
-\centering
-\theverbbox
+P0           | P1           | P2           | P3           ;
+stw r1,0(r2) | stw r1,0(r4) | lwz r3,0(r2) | lwz r3,0(r4) ;
+addi r1,r1,1 | addi r1,r1,1 | sync         | sync         ;
+stw r1,0(r2) | stw r1,0(r4) | lwz r5,0(r4) | lwz r5,0(r2) ;
+addi r1,r1,1 | addi r1,r1,1 |              |              ;
+stw r1,0(r2) | stw r1,0(r4) |              |              ;
+addi r1,r1,1 | addi r1,r1,1 |              |              ;
+stw r1,0(r2) | stw r1,0(r4) |              |              ;
+addi r1,r1,1 | addi r1,r1,1 |              |              ;
+stw r1,0(r2) | stw r1,0(r4) |              |              ;
+
+exists
+(2:r3=1 /\ 2:r5=0 /\ 3:r3=1 /\ 3:r5=0)
+\end{VerbatimL}
+\end{linelabel}
 \caption{Expanded IRIW Litmus Test}
 \label{lst:formal:Expanded IRIW Litmus Test}
-\end{listing*}
+\end{listing}
 
 However, where PPCMEM requires 14 CPU hours to solve IRIW, herd does so
 in 17 milliseconds, which represents a speedup of more than six orders
-- 
2.7.4


