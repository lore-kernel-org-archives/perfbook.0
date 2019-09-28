Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ko3+WHnqKrBscMHIo6jA6m6DgDzA7o2Fn60uBAeCkcc=;
        b=omGMNinNfOU3lroBVjcObicKl3Xd/aTuCbWcWRk/EawgObHFDOY1JlWYMd/s4JbZsF
         yzZqzdBurOeK7Fq+MAkVJwDUPgOKE5BFKNTp4Ml4Z1IVcAWBP9gsKeDnvN+DBZxNfAAq
         Pw8TtWE1dViIZZEQRsMEI7P/GwZ2nLVKLUc4Yqv3kE9csmr5O7qN5EgTIKOB0LkBXbnZ
         UK+XIsgCP3II33NkaH6jF0UQz0LcJc647zzJALvC0BqY3zMUaNecOPmR9XvRAv8rDirH
         P4D6/P2mU5fbaioMcy0uNkE/lvsUccXaImUB0SE2j4OXTFWe6SBgj5VKmk/rgTvMFCtx
         dlVA==
Subject: [PATCH 5/6] ppcmem: Add Quick Quiz on lwsync in Listing 12.23
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <50d17c59-3236-a836-b377-f6fd23d053a6@gmail.com>
Date: Sat, 28 Sep 2019 11:03:51 +0900
MIME-Version: 1.0
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 305c387fd4b8e6d3c5599b4ddbd67a03d939f832 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Sep 2019 22:02:41 +0900
Subject: [PATCH 5/6] ppcmem: Add Quick Quiz on lwsync in Listing 12.23

The "lwsync" in front of ll-sc in atomic_add_return() is not
good enough for Linux kernel's semantics.
Add a Quick Quiz on the use of lwsync.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/ppcmem.tex | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index d292b7da..a1960e2d 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -328,6 +328,24 @@ cannot happen.
 	as an exercise for the reader.
 } \QuickQuizEnd
 
+\QuickQuiz{}
+	\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+	Is the \co{lwsync} on \clnref{P0lwsync} in
+	\cref{lst:formal:PPCMEM Litmus Test} good enough?
+	\end{lineref}
+\QuickQuizAnswer{
+	It depends on the semantics you expect.
+	As is discussed in
+	\cref{chp:Advanced Synchronization: Memory Ordering},
+	Linux kernel's momory consistency model requires
+	value-returning atomic RMW operations to be fully ordered
+	on both sides. \co{lwsync} is insufficient in this case and
+	should be \co{sync} instead. It has since been fixed~%
+	\cite{BoqunFeng2015:powerpc:value-returning-atomics}
+	as a result of an email thread on a couple of other litmus
+	tests~\cite{Paulmck2015:powerpc:value-returning-atomics}.
+} \QuickQuizEnd
+
 \subsection{PPCMEM Discussion}
 \label{sec:formal:PPCMEM Discussion}
 
-- 
2.17.1


