Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5BfoXSE6PkP+WVAJS1rFj3KEHJtNh/Hf8DrnKEE+T0o=;
 b=u04cMqB6fBGFZxz9Umz+ENvBKHceP9xJNveW7JjCpr/GahS5kAd2/rEmidCicFxWBM
 2Rz6gPwBa+VqEJJHhdZv7rJp+2broJnJ7Sy7C/G6futEZHLicfbP8DpALNMta7dMw41n
 4JiJ27/zDgWgk6N/RqQoy6MkH+QLmoJFnbp4y1rNNHkIZc0/bzAlR2/OQp8J+lgHn/Ga
 JXxEWvWEqnP8lT9NC+aup55zezxXdz27vhskTaSOAaC1nOQa3/2Ek5g2+wAQZ4DDCW4Y
 2889hS+p+agVedcKCC1uR2Ogan7p1sQhQTz4+o5EyAwnZR4PybnDmdsMv1reXkkwLyNU
 oqMQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 03/17] formal/spinhint: Fix typos
Date: Wed, 21 Sep 2016 11:44:34 +0900
Message-Id: <20160921024448.24744-4-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
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

