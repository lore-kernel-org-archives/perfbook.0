Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i6mPCd9WTVE6boSv1YWze6I1bi3i+iifnwJXB+4++GA=;
 b=EW21hxV8QLjRhlxYz494pdCpjNw83V3fcpnlwHh5lTiQ+2rkruaAdYcD+RJ4zmDYx3
 0wseI1yizhUE2wHs2Ly2QVPODHYHu1WJtAgjUNgWqcC/A2MyMqI3dOnvGBlPI4NOOvb6
 73MZoEZvKNKIqGzzca1FJhe5xbd4GlY4d8yA0yJn9hMN9uWwFJdQRYFZmjJ9vAqlPKOK
 E4Z+9+e+NOU4s0wI58+VsSu09K3DUVPK0XPFdXRTkAk/MmG5aurClFRTZqmCV7KqjunP
 FJJ47jSgAXeDTT1VtFfwokciQCT+yWOgPac+uLlwsssVMRi3oQJMpmt2Qz8geRqUN5VF
 tsWw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 13/17] formal/ppcmem: Use \co{} for instruction quotation
Date: Wed, 21 Sep 2016 11:44:44 +0900
Message-Id: <20160921024448.24744-14-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Sentences about PPCMEM litmus test uses \co{} for machine instruction
quotations but missed it for `bne`.  This commit uses \co{} for `bne`
quotation.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index c18cb9a..5dfddd8 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -182,7 +182,7 @@ and line~11 is equivalent to the C statement \co{r3=x}.
 	The implementation of powerpc version of \co{atomic_add_return()}
 	loops when the \co{stwcx} instruction fails, which it communicates
 	by setting non-zero status in the condition-code register,
-	which in turn is tested by the bne instruction. Because actually
+	which in turn is tested by the \co{bne} instruction. Because actually
 	modeling the loop would result in state-space explosion, we
 	instead branch to the Fail: label, terminating the model with
 	the initial value of 2 in thread~1's \co{r3} register, which
-- 
2.10.0

