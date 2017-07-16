Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u9IJLU02VwnbYXffzcdFMDKDfZfG+HAoybVomhBZSH4=;
 b=TLDXVfc0WuvSHc2PyWcRk4Opw+xFGxhBH63fIHKW+BR9MUcqN25qDWIcWAF3eAqdC4
 gnpni3aOD5tayoNPH5S7HAbkYniS+NezpLkGGjGq+G2s5uvuTpgwiY2bsB6GiAMRlrqp
 EfAxfOKJz8n+6xwWYgdPbVwbaL348Y7xAqPfBoAxT66Qtd3eVqaOgfQvGlIDJMjsw0ru
 lmzGBnxXlHlcMEsHbW98wyfsOf+5eHF2mThAvO0T81Y4+tNu0JPYNslEJhr9qOGXUwwy
 cIm4Sn1n2NB5/9Kc1FDG+ULB6z29jJ/izOf1rtM8P9H5JNz4KyYb0o1uZ4QfoVUy6IIy
 WDww==
Subject: [PATCH] advsync: Fix two-CPU control-dependency example
References: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2caf7648-6f8a-f679-2d02-b215d45d3718@gmail.com>
Date: Sun, 16 Jul 2017 23:27:58 +0900
MIME-Version: 1.0
In-Reply-To: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8996357b6bd21245ef6545fca0c282fb4a31349e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Jul 2017 20:33:14 +0900
Subject: [PATCH] advsync: Fix two-CPU control-dependency example

The two-CPU example always results in r1==0 && r2==0 when the
operator ">" is used in the "if" statement.
The point of this example is to use control dependency for ordering,
and the WRITE_ONCE() should always be executed.

So the corresponding example in memory-barriers.txt was correct
before commit 5646f7acc95f in Linux kernel repository.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So sounds like you didn't like the previous patch in this thread.
I tried to convert the examples to litmus test format,
and found out the two-CPU example results in a single outcome.

If you prefer these examples to be converted to litmus test format,
I can respin these patches and add the tests to CodeSamples.
But I need to know what names to use for the tests.
Do "C-SB+o-c-o+o-c-o" and "C-WWC+o-c-o+o-c-o+o" work?

Or if these changes conflict with your ongoing work, I'll back off.

FWIW I've not seen the three-CPU litmus test results in "sometimes",
even on PPC. 

      Thanks, Akira
--
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 894de6d..f0ca79d 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -3015,8 +3015,8 @@ of~\co{x} and~\co{y} both being zero:
 	\hline
 	\tco{r1 = READ_ONCE(x);} &
 		\tco{r2 = READ_ONCE(y);} \\
-	if (r1 > 0) &
-		if (r2 > 0) \\
+	if (r1 >= 0) &
+		if (r2 >= 0) \\
 	~~~\tco{WRITE_ONCE(y, 1);} &
 		~~~\tco{WRITE_ONCE(x, 1);} \\
 	\multicolumn{2}{l}{~} \\
-- 
2.7.4


