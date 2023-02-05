Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675621312;
	bh=B9rqQ8K0z5ixhCzNt7c4+cBbKbM4pF3Vzud5x4YHKfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zm+RP0y8/Mt2/Skl1oLHu53SRyjDSJ5tQro9O2MpCeerVM5XvO+r94bJUv4hDZWW/
	 OvMXBCkXri8myjlDDXHRRL5n+QET2L5ECIG7vEGBVpyPPogIhEpIkf8zzMljZBfovu
	 gILy7fuYwc+D5G59xoK33sl7yB3t0/A9hWaajKkGKDYrCeS21UWdTBUxCSpaE3w8sJ
	 OhvIRb4rka68MjvP+pzJHWxGl+rpBHl6MKay3PxNLZLwAdD6TcZvP7Ra32mUXb8xQu
	 jkV2X3hNNCL7tTnXIr0kqA6aRrgUgQG8FE13LOFDEd+VHTc8adOc4tC7Y3+gXg4F6q
	 UzRzPEsdoAKPA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 1/5] debugging: Use \co{} for 'time' output examples
Date: Sun,  5 Feb 2023 10:21:24 -0800
Message-Id: <20230205182128.19044-2-sj@kernel.org>
In-Reply-To: <20230205182128.19044-1-sj@kernel.org>
References: <20230205182128.19044-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A quick quiz answer in debugging.tex is wrapping 'time' example outputs
with `` and ''.  Use \co{} instead.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 4568f90a..3104bb95 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -257,8 +257,8 @@ validation is just job for you.
 		consumed in system mode by a CPU-bound program?
 	\item	Do you have a test case in which all three times
 		are zero?
-	\item	Do you have a test case in which the ``user'' and ``sys''
-		times sum to more than the ``real'' time?
+	\item	Do you have a test case in which the \co{user} and \co{sys}
+		times sum to more than the \co{real} time?
 		(This would of course be completely legitimate in
 		a multithreaded program.)
 	\item	Do you have a set of tests cases in which one of the
@@ -267,7 +267,7 @@ validation is just job for you.
 		times uses more than ten seconds?
 	\item	Do you have a set of test cases in which one of the
 		times has non-zero minutes?
-		(For example, ``15m36.342s''.)
+		(For example, \co{15m36.342s}.)
 	\item	Do you have a set of test cases in which one of the
 		times has a seconds value of greater than 60?
 	\item	Do you have a set of test cases in which one of the
@@ -279,21 +279,21 @@ validation is just job for you.
 		times has a positive minutes value but a negative
 		seconds value?
 	\item	Do you have a set of test cases in which one of the
-		times omits the ``m'' or the ``s''?
+		times omits the \co{m} or the \co{s}?
 	\item	Do you have a set of test cases in which one of the
 		times is non-numeric?
-		(For example, ``Go Fish''.)
+		(For example, \co{Go Fish}.)
 	\item	Do you have a set of test cases in which one of the
 		lines is omitted?
-		(For example, where there is a ``real'' value and
-		a ``sys'' value, but no ``user'' value.)
+		(For example, where there is a \co{real} value and
+		a \co{sys} value, but no \co{user} value.)
 	\item	Do you have a set of test cases where one of the
 		lines is duplicated?
 		Or duplicated, but with a different time value for
 		the duplicate?
 	\item	Do you have a set of test cases where a given line
 		has more than one time value?
-		(For example, ``real 0m0.132s 0m0.008s''.)
+		(For example, \co{real 0m0.132s 0m0.008s}.)
 	\item	Do you have a set of test cases containing random
 		characters?
 	\item	In all test cases involving invalid input, did you
-- 
2.17.1

