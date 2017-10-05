Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:38852 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751094AbdJEPt5 (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 5
 Oct 2017 11:49:57 -0400
Received: by mail-pg0-f65.google.com with SMTP id j3so359339pga.5 for
 <perfbook@vger.kernel.org>; Thu, 05 Oct 2017 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rQNyPtZCv9hLQ/BtQ6vlCERqYBN+yX4rDbsRRHSQ9i8=;
 b=ZZ2NtMBRl5shod0X4LfOUDNsc8xhKciwYWsqUDS6hRJtGAj67hfN3BozaXZd9tksRb
 NsSK6Fq+Q5V8ZF40x2NnDlUU1p20r3l7ascruWMv7VW756OlqcOz2P2cFDv3yECq5dTP
 JAf7Qy66oMvICnButIY7922+1chE30GyfeotcBnjiqk6oyAAvijurJ6/dVVWiEuJmcoC
 reIWRjoTdkXwxf6NdC7evwo1qHKBw7OJEFPLV1iQ0bX8Nz4PFaIiSGYQgiZmfS59tHuc
 1VuIShBX8yagbSc+jIPAZf6lVpHB/vJLBUBgoU8mx0oa2Orm2ejLZ4mH0Ca+BYH2mZjE
 bhpA==
Subject: [PATCH 02/10] debugging: Use upright font for Euler's number
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <98c3766b-73a7-9dc9-b337-392da9c0ea57@gmail.com>
Date: Fri, 6 Oct 2017 00:49:53 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 69881c2d7792c59d8dfbed3a799186a95ef835fb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Sep 2017 17:37:45 +0900
Subject: [PATCH 02/10] debugging: Use upright font for Euler's number

Also use \ln for natural logarithm.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 24 ++++++++++++------------
 perfbook.tex            |  2 ++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 5747656..7a5f71d 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1116,7 +1116,7 @@ is reassuring.

 \QuickQuiz{}
 	In Equation~\ref{eq:debugging:Binomial Number of Tests Required},
-	are the logarithms base-10, base-2, or base-$e$?
+	are the logarithms base-10, base-2, or base-$\euler$?
 \QuickQuizAnswer{
 	It does not matter.
 	You will get the same answer no matter what base of logarithms
@@ -1201,7 +1201,7 @@ The fundamental formula for failure probabilities is the Poisson
 distribution:

 \begin{equation}
-	F_m = \frac{\lambda^m}{m!} e^{-\lambda}
+	F_m = \frac{\lambda^m}{m!} \euler^{-\lambda}
 \label{eq:debugging:Poisson Probability}
 \end{equation}

@@ -1225,14 +1225,14 @@ In this case, $\lambda$ is zero, so that
 Equation~\ref{eq:debugging:Poisson Probability} reduces to:

 \begin{equation}
-	F_0 =  e^{-\lambda}
+	F_0 =  \euler^{-\lambda}
 \end{equation}

 Solving this requires setting $F_0$
 to 0.01 and solving for $\lambda$, resulting in:

 \begin{equation}
-	\lambda = - \log 0.01 = 4.6
+	\lambda = - \ln 0.01 = 4.6
 \end{equation}

 Because we get $0.3$ failures per hour, the number of hours required
@@ -1246,11 +1246,11 @@ is a good and sufficient substitute for the Poisson distribution in
 a great many situations.

 More generally, if we have $n$ failures per unit time, and we want to
-be P\,\% certain that a fix reduced the failure rate, we can use the
+be $P$\,\% certain that a fix reduced the failure rate, we can use the
 following formula:

 \begin{equation}
-	T = - \frac{1}{n} \log \frac{100 - P}{100}
+	T = - \frac{1}{n} \ln \frac{100 - P}{100}
 \label{eq:debugging:Error-Free Test Duration}
 \end{equation}

@@ -1287,14 +1287,14 @@ Equation~\ref{eq:debugging:Poisson Probability} as follows:

 \begin{equation}
 	F_0 + F_1 + \dots + F_{m - 1} + F_m =
-		\sum_{i=0}^m \frac{\lambda^i}{i!} e^{-\lambda}
+		\sum_{i=0}^m \frac{\lambda^i}{i!} \euler^{-\lambda}
 \end{equation}

 This is the Poisson cumulative distribution function, which can be
 written more compactly as:

 \begin{equation}
-	F_{i \le m} = \sum_{i=0}^m \frac{\lambda^i}{i!} e^{-\lambda}
+	F_{i \le m} = \sum_{i=0}^m \frac{\lambda^i}{i!} \euler^{-\lambda}
 \label{eq:debugging:Possion CDF}
 \end{equation}

@@ -1341,18 +1341,18 @@ that the fix actually had some relationship to the bug.\footnote{
 	Indeed it should.
 	And it does.

-	To see this, note that $e^{-\lambda}$ does not depend on $i$,
+	To see this, note that $\euler^{-\lambda}$ does not depend on $i$,
 	which means that it can be pulled out of the summation as follows:

 	\begin{equation}
-		e^{-\lambda} \sum_{i=0}^\infty \frac{\lambda^i}{i!}
+		\euler^{-\lambda} \sum_{i=0}^\infty \frac{\lambda^i}{i!}
 	\end{equation}

 	The remaining summation is exactly the Taylor series for
-	$e^\lambda$, yielding:
+	$\euler^\lambda$, yielding:

 	\begin{equation}
-		e^{-\lambda} e^\lambda
+		\euler^{-\lambda} \euler^\lambda
 	\end{equation}

 	The two exponentials are reciprocals, and therefore cancel,
diff --git a/perfbook.tex b/perfbook.tex
index 84e48eb..da9cfa8 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -137,6 +137,8 @@
 \newcommand{\nf}[1]{\textnormal{#1}} % to return to normal font
 \newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.

+\DeclareRobustCommand{\euler}{\ensuremath{\mathrm{e}}}
+
 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

 \input{ushyphex} % Hyphenation exceptions for US English from hyphenex package
-- 
2.7.4


