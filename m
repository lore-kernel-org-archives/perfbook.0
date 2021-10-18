Return-Path: <SRS0=U37W=PG=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v+wMJmNsq3h3p+xtkKGhdaSHYKvmShPoQKr9oh3eK1M=;
        b=TrJjs18eqN7+LgtIZPgzLRg1nX7pVZ5OKlJao1hvJLwTrJ58AS63Si3kTpTvRztpBz
         Fc1vBRO7KhlyvgPuhhJ/LnA9fEfDWzUkCr75emkwciHSUC8r9jhcFwQbgDL9eh8M/pcp
         ydJzmOwhvItb6RtjgHmHop4Ld3aI+CGbX36eljHuRFpePIybGYqwkdxA1i2HzsWetHQu
         FNO1i5Qx3SEiRe+OxaLfn2qvw4h8qWDe3PD8xVUb2xK3dMdlfEWO46eIGqRjWzFLs4zb
         YogfJ4LzR4nM1uKkRaDgrXD77VgyP2FmF6139pnlbyDt5mjIY1XxJFeVtRz4Zb2JVyvH
         ZUtg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/5] toolsoftrade: Use '\co{}' instead of '{\tt}'
Date: Mon, 18 Oct 2021 10:44:39 +0200
Message-Id: <20211018084439.7112-5-sj38.park@gmail.com>
In-Reply-To: <20211018084439.7112-1-sj38.park@gmail.com>
References: <20211018084439.7112-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is a sentence using '{\tt}' instead of '\co{}'.  This commit
updates those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 7cbe2f0b..8badbcaf 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1448,10 +1448,10 @@ spin_unlock(&mutex);
 \end{VerbatimU}
 
 \QuickQuiz{
-	What problems could occur if the variable {\tt counter} were
-	incremented without the protection of {\tt mutex}?
+	What problems could occur if the variable \co{counter} were
+	incremented without the protection of \co{mutex}?
 }\QuickQuizAnswer{
-	On CPUs with load-store architectures, incrementing {\tt counter}
+	On CPUs with load-store architectures, incrementing \co{counter}
 	might compile into something like the following:
 
 \begin{VerbatimU}
@@ -1461,9 +1461,9 @@ STORE r0,counter
 \end{VerbatimU}
 
 	On such machines, two threads might simultaneously load the
-	value of {\tt counter}, each increment it, and each store the
+	value of \co{counter}, each increment it, and each store the
 	result.
-	The new value of {\tt counter} will then only be one greater
+	The new value of \co{counter} will then only be one greater
 	than before, despite two threads each incrementing it.
 }\QuickQuizEnd
 
-- 
2.17.1

