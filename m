Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PpNz3URDkfeuxbMbEgxYlLbCK1UToCmmak1zNx+IJoY=;
        b=n2t3yiV929AH920jDjqIlYYRjMEVtzuO877GCqcr5ofAHcB5uaZ53aaurJBFs24REu
         LTngVDxf9r5i4lJyFO4+rFU9rdO4I02rHYvINrX7soWW23shZX48vslfGtTGm7cRYyT1
         AALRrIjaPMB6B9o417oOpfDv3WfCGuIpJRXnqkEQc9BBO/wsM/1JFVMmUNVHMEUPHdAI
         p3AOhS1HkbAjDSEVMAvCqTnehGwIAcSFvKC4sXiiGKa9RopG9ahADMQ6xx4cu/qoLyPO
         zB1blfwUBZho4ZVdzpg27EZmwsWF42tladToHH/RTaUOq0YwDHVq4I9X29Vkfeu3ekiB
         NXxA==
Subject: [PATCH 5/6] defer/rcuusage: Reverse nesting of fcvref and enumerate
 envs
References: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2da89ea5-579d-13da-f492-1753366a4edd@gmail.com>
Date: Sat, 7 Mar 2020 07:52:23 +0900
MIME-Version: 1.0
In-Reply-To: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 18c81bd11d841184bee4336e78f3e9296d5f2df8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Mar 2020 20:53:01 +0900
Subject: [PATCH 5/6] defer/rcuusage: Reverse nesting of fcvref and enumerate envs

This change enables qqzreoder.pl to move the ending white box
to the end of the last item in the list.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index cc25c536..e6c3cf7e 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -942,11 +942,11 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 	before releasing the lock on line~\lnref{rel2}?
 	\end{fcvref}
 \QuickQuizAnswer{
-	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Suppose we reverse the order of these two lines.
 	Then this code is vulnerable to the following sequence of
 	events:
 	\begin{enumerate}
+	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	\item	CPU~0 invokes \co{delete()}, and finds the element
 		to be deleted, executing through line~\lnref{rdunlock2}.
 		It has not yet actually deleted the element, but
@@ -971,8 +971,8 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 		that has been freed, and, worse yet, possibly
 		reallocated as some other type of data structure.
 		This is a fatal memory-corruption error.
-	\end{enumerate}
 	\end{fcvref}
+	\end{enumerate}
 } \QuickQuizEnd
 
 Alert readers will recognize this as only a slight variation on
-- 
2.17.1


