Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=YsGWSO7M2/vX7kjq6rIGZ8iOXsiHSU3l39vLAkLdAF4=;
 b=CKxPpsKECTYql6qam+VMgin8gNtlrUFAU2OL9kstuzURC2Ze5PaPKRzwpLPlap1mCf
 Jsp9Xm0Lg6WB2pxaYPnRS0eF87J1XuBjnhIV/dqtWoglTGtr1DZXjj84j/CJ5L17ZuBW
 cxdpRQHeAMLgl1P24SyewZ/hJ5Lyy/GoXkYRaPBJ/qLleAQKwOdZU4k5v+f68eluxSJI
 rdfF2WpH8rOICKcuJQjCuRMZdzuOPjAIkwlnrH/9ouHYdFFF2GI7In+f0XUldpY8B55+
 LfTiIRKB9Or2JGVQ0V21K3hxzyuBCJsi00qR9w9y+AeylKGnzcvwgeByeZ10aBR7eYXH
 5jfA==
Subject: [PATCH 3/6] formal/spinhint: Adjust option of enumerate list
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bde4d3eb-3173-576c-a550-cb11f7e6010b@gmail.com>
Date: Tue, 14 Mar 2017 07:46:31 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fe01252839978d67b611eafca1c49e8772582fd2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:47:56 +0900
Subject: [PATCH 3/6] formal/spinhint: Adjust option of enumerate list

This enumeration list can be optimized by specifying starting
count and label format. It is also better to use a narrower
item separation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index a10b57b..d6acef1 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -924,10 +924,10 @@ sections).
 The \co{readerprogress} array elements have values as follows,
 indicating the state of the corresponding reader:

-\begin{enumerate}
-\item	0: not yet started.
-\item	1: within QRCU read-side critical section.
-\item	2: finished with QRCU read-side critical section.
+\begin{enumerate}[label={\arabic*}:,start=0,itemsep=0pt]
+\item	not yet started.
+\item	within QRCU read-side critical section.
+\item	finished with QRCU read-side critical section.
 \end{enumerate}

 Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
-- 
2.7.4


