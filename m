Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BS9wYxcAwd5gzr9MK+dBYk542S46K+NX8PdMHrGV8mQ=;
        b=Elpp6JCGOhMVqm5NG2gp823j3oBQzhEtv//RxTzvzL48V+qW4OsVgKq3OqmRJOmIGq
         4g+pHJb0FYDQuYpNjmdRuguAeyPJuT1bNHu90cziCib+XLxW3mQnILfIR7D+Ytd9y9ov
         hrUCggVPGxQVsAFBczXrm30jZ6MD8qAMXDSR6NHX/No9/VnOMprY5i/1rqMueKGxBe8B
         urFV9cBLJ1VjHWWqkfH2n4UXn4XP0IAMlrtOtPZCEppXZX4agcCagHBfkA8XnbKpSe6J
         N1acCDefWvfWr2f4TkK85UleZ8dEbYCFFLDG3lnCtVfLaG1g6eWgeoYtOddeJKDdvLmP
         IuYg==
Subject: [PATCH 6/6] ppcmem: Move final sentence of Answer to QQZ 12.27 to the
 next
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <00527ec5-7961-69e1-1e5f-3fc87817a79f@gmail.com>
Date: Sat, 28 Sep 2019 11:04:45 +0900
MIME-Version: 1.0
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6442399eab974be84927a3b57d34f31de7e81700 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Sep 2019 22:05:08 +0900
Subject: [PATCH 6/6] ppcmem: Move final sentence of Answer to QQZ 12.27 to the next

Given the added Quick Quiz, this sentence looks better fitted in
the next one.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/ppcmem.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index a1960e2d..dff0b0b2 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -324,8 +324,6 @@ cannot happen.
 	function's assembly-language implementation.
 	PowerPC no longer has this bug; it has long since been
 	fixed~\cite{BenjaminHerrenschmidt2011:powerpc:atomic_return}.
-	Finding any other bugs that the Linux kernel might have is left
-	as an exercise for the reader.
 } \QuickQuizEnd
 
 \QuickQuiz{}
@@ -344,6 +342,8 @@ cannot happen.
 	\cite{BoqunFeng2015:powerpc:value-returning-atomics}
 	as a result of an email thread on a couple of other litmus
 	tests~\cite{Paulmck2015:powerpc:value-returning-atomics}.
+	Finding any other bugs that the Linux kernel might have is left
+	as an exercise for the reader.
 } \QuickQuizEnd
 
 \subsection{PPCMEM Discussion}
-- 
2.17.1


