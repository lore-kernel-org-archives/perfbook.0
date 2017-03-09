Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4OBnLr10qQ2ZuoI4fimwCsJMlNhKG/I0ccGuALulwlM=;
 b=EnbXK3aMKvjhvRKPTDtEmiixtDy2D/6Itg4VlGlD+tyhifb2edZzs5okCDvrgXQyNf
 dXrY+/H4WtlbhSudWJtJlCnB74zyIs058lqfhuQyUw9BBk39WSzNPqUXzsqL8dVWO1Id
 SLaLpx5wkpoDpopa5H4pZVZliG6XoEeB+7g853ugGopBQwmNXotHY66I5woqRQ7ijMYz
 JVoMsTPmPSi2S1gNp/UKj4V9EcFoP97EuaKb3bvEbCoL1tDPRlOLgC+/zNQYJtsRJPWK
 Rs49FYwHHYeKvkAGdOJIGOoh+6DiTRFRZwUUaUWUxpc3nw09iKXbmynw3yddFjYq9hfK
 YuaQ==
Subject: [PATCH 3/5] debugging: Convert to 'description'
References: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fb944df1-6bc2-d029-3789-4be81422d069@gmail.com>
Date: Fri, 10 Mar 2017 00:24:56 +0900
MIME-Version: 1.0
In-Reply-To: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 138b82d8fee707c43874095711887e912a9a92a7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 9 Mar 2017 23:52:35 +0900
Subject: [PATCH 3/5] debugging: Convert to 'description'

This list looks better in "description" environment.
Again, \tco{} is safer than \co{} for option names in labels.
Note that ":" at the end of each label is enclosed by \nf{} to
avoid confusing impression that the ":" belongs to the option.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 86b1118..6797c2f 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2191,16 +2191,16 @@ and output consists of one line for each input line, with fields as follows:

 This script takes three optional arguments as follows:

-\begin{itemize}
-\item	\co{--divisor}: Number of segments to divide the list into,
+\begin{description}
+\item	[\tco{--divisor}\nf{:}] Number of segments to divide the list into,
 	for example, a divisor of four means that the first quarter
 	of the data elements will be assumed to be good.
 	This defaults to three.
-\item	\co{--relerr}: Relative measurement error.  The script assumes
+\item	[\tco{--relerr}\nf{:}] Relative measurement error.  The script assumes
 	that values that differ by less than this error are for all
 	intents and purposes equal.
 	This defaults to 0.01, which is equivalent to 1\%.
-\item	\co{--trendbreak}: Ratio of inter-element spacing constituting
+\item	[\tco{--trendbreak}\nf{:}] Ratio of inter-element spacing constituting
 	a break in the trend of the data.
 	For example, if the average spacing in the data accepted so far
 	is 1.5, then if the trend-break ratio is 2.0, then if the next
@@ -2208,7 +2208,7 @@ This script takes three optional arguments as follows:
 	constitutes a break in the trend.
 	(Unless of course, the relative error is greater than 3.0, in
 	which case the ``break'' will be ignored.)
-\end{itemize}
+\end{description}

 Lines~1-3 of
 Figure~\ref{fig:count:Statistical Elimination of Interference}
-- 
2.7.4


