Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9IaPSUZFy3mLEx2Mrr0xnSFwTaifAeNeyhD9zEnio1A=;
        b=odCwM7VIzzDMmVdgDgUJsVeOsYi0UYPG6Qe3uCpzPEg36scm2LOZxDbSpfkWtjv6yY
         yQUvWX6LwaoPUMCcgwoRcJ1Z3mg9vdU2vseVyg49VWf79c7XMyTzubCyjP8rNvuRA6G0
         m7nZ7dY2xLk/MHgZt6JXpPS9EMYQr3ff08J1qC9NFjwcryngRkXwqFSBn535cWxCRjMP
         41+sBKywXf8NPHM0OVzQQFnddzbWQXQ4g2SqePC+dl3aE+AfXIBa5kIOn4+7u8AEUY1G
         Znx66lfzX2N6BHJWJxivXp/6nsumKrH2gkbpusbVw+GyhBF+MwrgojEfVg/T/Q8TpS6d
         Ckyw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 1/4] debugging: Use \co{} for 'time' output examples
Date: Sat, 11 Feb 2023 09:10:05 -0800
Message-Id: <20230211171008.9415-2-sj38.park@gmail.com>
In-Reply-To: <20230211171008.9415-1-sj38.park@gmail.com>
References: <20230211171008.9415-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj38.park@gmail.com, sj@kernel.org
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

