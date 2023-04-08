Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975211;
	bh=KNWWJSz6uP8Vjdql6l/+oqY8cmAy6EtIk+Rao96fiJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fl5NurXEsJPBSCqC53cZctpY1/2099IoodYK0PARucDHswe/AT0j45AdAr3Pl95EW
	 OaOxRBmJC3pjl6xZWqeFDQ7YxOqgMAUhl7toUWjG/UxNAtLQ19A2cXn9oJC8x0W1Tt
	 OX4bY22sHlLjcYCbnkZ7LIOKa8iCLZBQyBLmT91WIXRp26d8gIPxaB2q+bw3mmddkT
	 OrYRBNp98By5APx4UY3RDtt2GhuwVf/zCwDwvlAc5xdDFWrPmK7fmQhOICPCHbJTen
	 cHsxgUhBWVkBRWTA+XZL5Gh5Z1mXooWQj5QfLIR9wfihzSJRBAmaE0OuXM7XNiLUkm
	 jhqeqLAWvVVGw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 11/12] formal/ppcmem: s/powerpc/PowerPC/ on sentences
Date: Sat,  8 Apr 2023 10:33:08 -0700
Message-Id: <20230408173309.5543-12-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Most sentences are using 'PowerPC' while a sentence in ppcmem.tex is
using 'powerpc'.  Use 'PowerPC' consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 25d07c34..181ca7c6 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -204,7 +204,7 @@ and \clnref{P1lwz} is equivalent to the C statement \co{r3=x}.
 	the one that is the \co{Fail1:} label?
 	\end{fcvref}
 }\QuickQuizAnswer{
-	The implementation of powerpc version of \co{atomic_add_return()}
+	The implementation of PowerPC version of \co{atomic_add_return()}
 	loops when the \co{stwcx} instruction fails, which it communicates
 	by setting non-zero status in the condition-code register,
 	which in turn is tested by the \co{bne} instruction.
-- 
2.17.1

