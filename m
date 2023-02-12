Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9IaPSUZFy3mLEx2Mrr0xnSFwTaifAeNeyhD9zEnio1A=;
        b=VgooYBQyZBNlPdrQ0Kuu1MZCJc5jHps52FgYmM/gse6UV9024P5RqspotoC8k4PEHo
         G8xuXFt2KIJNPlmluS0t7yvhmwojVN2w+1Ck5+K9xeVcQUKRrOn4Aq0D2CfkZ49G1Jb7
         r8qDAUyiGeolL4gsNyIi7JUu6ScGH/sufYaXcKv1zGYs2Ij5NoP2zy6y9CQxQWeGYMUR
         WXN80RoyPDURpOdvGQKhAqMDgw/DjPHFrRf7W6LOLigjzsFDsTsM5+HP1yv5W8QGOjgF
         rX38KOdTMUQTPXia/AuglYX/jit553+JU63PJhppeQI43XAq36GsCCZZ1nmGHiWnYGMa
         HsYw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 1/4] debugging: Use \qco{} for 'time' output examples
Date: Sun, 12 Feb 2023 08:56:27 -0800
Message-Id: <20230212165630.26268-2-sj38.park@gmail.com>
In-Reply-To: <20230212165630.26268-1-sj38.park@gmail.com>
References: <20230212165630.26268-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj@kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A quick quiz answer in debugging.tex is wrapping 'time' example outputs
with only `` and ''.  Use \qco{} instead.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index a5324a14..fde2d446 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -257,8 +257,8 @@ validation is just job for you.
 		consumed in system mode by a CPU-bound program?
 	\item	Do you have a test case in which all three times
 		are zero?
-	\item	Do you have a test case in which the ``user'' and ``sys''
-		times sum to more than the ``real'' time?
+	\item	Do you have a test case in which the \qco{user} and \qco{sys}
+		times sum to more than the \qco{real} time?
 		(This would of course be completely legitimate in
 		a multithreaded program.)
 	\item	Do you have a set of tests cases in which one of the
@@ -267,7 +267,7 @@ validation is just job for you.
 		times uses more than ten seconds?
 	\item	Do you have a set of test cases in which one of the
 		times has non-zero minutes?
-		(For example, ``15m36.342s''.)
+		(For example, \qco{15m36.342s}.)
 	\item	Do you have a set of test cases in which one of the
 		times has a seconds value of greater than 60?
 	\item	Do you have a set of test cases in which one of the
@@ -279,21 +279,21 @@ validation is just job for you.
 		times has a positive minutes value but a negative
 		seconds value?
 	\item	Do you have a set of test cases in which one of the
-		times omits the ``m'' or the ``s''?
+		times omits the \qco{m} or the \qco{s}?
 	\item	Do you have a set of test cases in which one of the
 		times is non-numeric?
-		(For example, ``Go Fish''.)
+		(For example, \qco{Go Fish}.)
 	\item	Do you have a set of test cases in which one of the
 		lines is omitted?
-		(For example, where there is a ``real'' value and
-		a ``sys'' value, but no ``user'' value.)
+		(For example, where there is a \qco{real} value and
+		a \qco{sys} value, but no \qco{user} value.)
 	\item	Do you have a set of test cases where one of the
 		lines is duplicated?
 		Or duplicated, but with a different time value for
 		the duplicate?
 	\item	Do you have a set of test cases where a given line
 		has more than one time value?
-		(For example, ``real 0m0.132s 0m0.008s''.)
+		(For example, \qco{real 0m0.132s 0m0.008s}.)
 	\item	Do you have a set of test cases containing random
 		characters?
 	\item	In all test cases involving invalid input, did you
-- 
2.17.1

