Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D4XeprPeyeOtQuZpEqjzRKs2M7BIyTT51U54cQoC1ZM=;
        b=jnvGsJo1hRq+6mI1KnETuoSGLdCYA4boIc6egwS9Ls73AuKWCx9PD75x0iW5VQyMEh
         Th5vjz7XrtG8JbqBM0oG3FoBX/37ITJL1cZ2V6O79IRpD6mv/SpWLR8/aS7k1/3Eqotn
         50BZib+jDM/oGE6vK03vvGIirM5tCTocd2Tm0KbBY+OZq/fAIyuLUKeUGVDRyedenKoY
         HQSYkoz1laUP8I9LUov2uwnV0aAR+hEgzXiXzHcKw6ngo6o2SXiY7WWFh5mIMdBTqWnf
         9Cgch1AZ53Jo2xULtDSNDZyzx5LK0I2tg6CmeL793E4vXyAEYlT9B5ll7fqogOa+6VJp
         eoUg==
Subject: [PATCH 8/8] formal/axiomatic: Fill in missing ')'
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b4bb7c1-7643-c4ec-fedd-94261a2970ac@gmail.com>
Date: Thu, 1 Nov 2018 00:16:20 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 134f743e70db33fdbd1f822dd0b3b4548aedc95a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 20:15:23 +0900
Subject: [PATCH 8/8] formal/axiomatic: Fill in missing ')'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index a5f610d..992eb97 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -365,7 +365,7 @@ in the \co{herd} output.
 	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Also in Listing~\ref{lst:formal:Complex RCU Litmus Test},
 	can't line~\lnref{updfree} be \co{WRITE_ONCE} instead
-	of \co{smp_store_release(}?
+	of \co{smp_store_release()}?
 	\end{lineref}
 \QuickQuizAnswer{
 	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
-- 
2.7.4


