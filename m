Return-Path: <SRS0=65dD=ZU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9Mi5JUVSWAfIs1tF9ohTvew5bJ1pl3IDgRuXtMI+wbw=;
        b=CZ2Td1JBU29rj5R4eag91Z1Xej54dMg7X1jLuI3Tm6HgOR067tHzIO20668vrUa5qS
         ALLoilYthW954ISHnjkXIMQa/tmXFt93I9uHaIhDsW8vttrfX9WzFnY+HQh6FAytqFCg
         aTTT9XcZ6Semllv/YaVpUZ0p3H1t9RmXDx5tkSRhjr3kImW/j4WWRBnjEMkuSqWRL51/
         jv8IC40AVuTPNcH4WV/EnpvHFYAFR7HdFXG2rLFsDNzYhP/7f+irwUGQoMI9sm4esIh1
         JYghhkBf54YD631YL1W13oXyc/+XFVfKPw1UNuLdPyTNBA1Ni0SPy+IAlQ9A+9ErSoe0
         hFkw==
Subject: [PATCH 2/3] toolsortrade: Backport LWN article
References: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2753eecd-aee4-75bd-d755-0caf5e3b1a64@gmail.com>
Date: Fri, 29 Nov 2019 07:26:48 +0900
MIME-Version: 1.0
In-Reply-To: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9132989d5f2db9c1829750971a187afdd4c4a6ee Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 28 Nov 2019 07:42:59 +0900
Subject: [PATCH 2/3] toolsortrade: Backport LWN article

The LWN article "Who's afraid of a big bad optimizing compiler?"
originated from Section 4.3.4.1. In preparing the article,
there were improvements around store tearing. Backport the
changes into this section and designate the article by
\OriginallyPublished.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 37 ++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 6c6d64b6..c9fee28b 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1563,7 +1563,8 @@ variable, all of those accesses are loads.
 
 \subsubsection{Shared-Variable Shenanigans}
 \label{sec:toolsoftrade:Shared-Variable Shenanigans}
-
+\OriginallyPublished{Section}{sec:toolsoftrade:Shared-Variable Shenanigans}{Shared-Variable Shenanigans}{Linux Weekly News}{JadeAlglave2019WhoAfraidCompiler}
+%
 Given code that does plain loads and stores,\footnote{
 	That is, normal loads and stores instead of C11 atomics, inline
 	assembly, or volatile accesses.}
@@ -1599,20 +1600,34 @@ cannot rule out load tearing in the general case.
 
 {\bf Store tearing} occurs when the compiler uses multiple store
 instructions for a single access.
-For example, one thread might store \co{0x1234} to a four-byte integer
-variable at the same time another thread stored \co{0xabcd}.
+For example, one thread might store \co{0x12345678} to a four-byte integer
+variable at the same time another thread stored \co{0xabcdef00}.
 If the compiler used 16-bit stores for either access, the result
-might well be \co{0x12cd}, which could come as quite a surprise to
+might well be \co{0x1234ef00}, which could come as quite a surprise to
 code loading from this integer.
 Nor is this a strictly theoretical issue.
-For example, there are CPUs that can store small immediate values
-directly into memory, and on such CPUs, the compiler can be expected
-to split this into two 16-bit stores in order to avoid the overhead
-of explicitly forming the 32-bit constant.\footnote{
-	One such CPU is the rare and elusive x86:
-	\url{https://gcc.gnu.org/bugzilla/show_bug.cgi?id=55981}.}
-Furthermore, the C standard simply has no choice in the general case, given
+For example, there are CPUs that feature small immediate values,
+and on such CPUs, the compiler can be tempted to split a 64-bit
+store into two 32-bit stores in order to reduce the overhead
+of explicitly forming the 64-bit constant in a register,
+even on a 64-bit CPU.
+There are historical reports of this actually happening in
+the wild (e.g.~\cite{KonstantinKhlebnikov2013gccstoretearing}),
+but there is also a recent
+report~\cite{WillDeacon2019StoreTearingReport}.\footnote{
+	Note that this tearing can happen even on properly aligned
+        and machine-word-sized accesses, and in this particular case,
+	even for volatile stores.
+	Some might argue that this behavior constitutes a bug in the
+	compiler, but either way it illustrates the perceived value of
+	store tearing from a compiler-writer viewpoint.
+}
+
+Of course, the compiler simply has no choice but to tear some stores
+in the general case, given
 the possibility of code using 64-bit integers running on a 32-bit system.
+But for properly aligned machine-sized stores, \co{WRITE_ONCE} will
+prevent store tearing.
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
-- 
2.17.1


