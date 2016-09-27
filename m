Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5BfoXSE6PkP+WVAJS1rFj3KEHJtNh/Hf8DrnKEE+T0o=;
 b=qiQpZ7vBiSZZ7FBDxGe+4zYouvPVSWqkNEZKOHZTyQaXokpxL3FeKmiG8ZQV4ZOw4Q
 3rQATZCbr41RAi30OXz8Nrb13JQYV0XJQCCtGxL1vC1C35a4OFWDDvsXPzIOz+ZMSAW+
 bwfnRW2KlThC5GlJQ+1a7XErlHyCo9lU/NY5CaJth4Jf5EBaBRXq79qpH2D/+36+JYxQ
 WdnIqb8LaSkQdMTneVcLliXNs7fPRLRh2UP1vYHQ2vZMjfOhGAnxy+uO63ATiWfdmXN/
 CTlBMUfg+8CcSZ7Wo6+jJj0Q5d3iU+an1+zUOUBZVzn2/Y2neC9eirvJdHzXyEE52am1
 +EOw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 03/17] formal/spinhint: Fix typos
Date: Wed, 28 Sep 2016 06:56:27 +0900
Message-Id: <20160927215641.7330-3-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 7787ed8..e91d458 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -422,7 +422,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	you.

 	Don't forget to capture the output, especially
-	if you are working on a remote machine,
+	if you are working on a remote machine.

 	If your model includes forward-progress checks, you will likely
 	need to enable ``weak fairness'' via the \co{-f} command-line
@@ -594,7 +594,7 @@ The following tricks can help you to abuse Promela safely:
 	Because each statement contributes to state, we can reduce
 	the number of useless states by enclosing it in an \co{atomic}
 	block as shown in
-	Figure~\ref{fig:analysis:Atomic Block for Complex Promela Assertion}
+	Figure~\ref{fig:analysis:Atomic Block for Complex Promela Assertion}.

 \item	Promela does not provide functions.
 	You must instead use C preprocessor macros.
-- 
2.10.0

