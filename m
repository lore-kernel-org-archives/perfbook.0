Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33506 "EHLO
 mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752045AbdGaOvQ (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 31
 Jul 2017 10:51:16 -0400
Received: by mail-pf0-f193.google.com with SMTP id k72so23107077pfj.0 for
 <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/v55qz9kcqV0ew/rcCSCvSvNn5xPzyiJdHXJNBEDOg8=;
 b=jLkti5baKQ3WQVsC2PLNmCVNEf2BNIv+oAYKBHS3Fr3cdZbiRicvOXR1gwQHfRGEG8
 z92HUnkPO2jXbZP267EvJiauJssB+r/ZV/zGEl/N5qum+oJHEorHNcg9sfAfSjSZ94po
 TTYZOMrJ7HfWD5+O/MT8qDI+56d2+r1Tcceof2jHP4YeaLyOBITsBT9i9HDBMnkcgZu/
 +nDxhqZ3q57iIPvYfzBaJxTdDdVgr9/c3+ZPGxs2ksN7U+dfVgK3BOZyK6mkGV18UheE
 /bSFfUCJTLkS2eFi3IXvZWgljf7ogqV+rlo/yiF2ihkgwRAlYwtbGq+eEVtjZnnPyGNj
 P97A==
Subject: [PATCH v2 6/8] styleguide: Add example of grouping code snippets
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <af993c29-261a-1c37-0b03-bff1dc8ae890@gmail.com>
Date: Mon, 31 Jul 2017 23:51:12 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 8a66ba5902d512e0e5e9a2bea27b4542ff74b57d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 21 Jul 2017 22:15:05 +0900
Subject: [PATCH v2 6/8] styleguide: Add example of grouping code snippets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 79 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index b04b62b..f84ade8 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -669,7 +669,84 @@ The floatrow package provides the features to do so.\footnote{
   One problem of grouping figures might be the learning curve
   to do so.}

-% TODO: Add example
+For example,
+Figures~\ref{fig:advsync:Message-Passing Litmus Test}
+and~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}
+can be grouped together as in
+Listings~\ref{lst:app:styleguide:Message-Passing Litmus Test}
+and~\ref{lst:app:styleguide:Enforcing Order of Message-Passing Litmus Test}.
+
+\begin{listing*}\RawFloats
+{ \scriptsize
+\begin{verbbox}
+ 1 C C-MP+o-wmb-o+o-o.litmus
+ 2
+ 3 {
+ 4 }
+ 5
+ 6
+ 7 P0(int* x0, int* x1) {
+ 8
+ 9   WRITE_ONCE(*x0, 2);
+10   smp_wmb();
+11   WRITE_ONCE(*x1, 2);
+12
+13 }
+14
+15 P1(int* x0, int* x1) {
+16
+17   int r2;
+18   int r3;
+19
+20   r2 = READ_ONCE(*x1);
+21   r3 = READ_ONCE(*x0);
+22
+23 }
+24
+25 exists (1:r2=2 /\ 1:r3=0)
+\end{verbbox}
+}
+  \begin{floatrow}[2]\thisfloatsetup{style=ruled}
+    \floatbox{listing}[2.2in]{\caption{Message-Passing Litmus Test}
+      \label{lst:app:styleguide:Message-Passing Litmus Test}}{
+      \theverbbox
+}
+{ \scriptsize
+\begin{verbbox}
+ 1 C C-MP+o-wmb-o+o-rmb-o.litmus
+ 2
+ 3 {
+ 4 }
+ 5
+ 6 P0(int* x0, int* x1) {
+ 7
+ 8   WRITE_ONCE(*x0, 2);
+ 9   smp_wmb();
+10   WRITE_ONCE(*x1, 2);
+11
+12 }
+13
+14 P1(int* x0, int* x1) {
+15
+16   int r2;
+17   int r3;
+18
+19   r2 = READ_ONCE(*x1);
+20   smp_rmb();
+21   r3 = READ_ONCE(*x0);
+22
+23 }
+24
+25 exists (1:r2=2 /\ 1:r3=0)
+\end{verbbox}
+}
+    \thisfloatsetup{style=ruled}\hspace{1em}%
+    \floatbox{listing}[2.2in]{\caption{Enforcing Order of Message\-/Passing Litmus Test}
+      \label{lst:app:styleguide:Enforcing Order of Message-Passing Litmus Test}}{
+      \theverbbox
+}
+  \end{floatrow}
+\end{listing*}

 \subsubsection{Ruled Line in Table}
 \label{sec:app:styleguide:Ruled Line in Table}
-- 
2.7.4


