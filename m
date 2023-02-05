Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675621312;
	bh=KZ7HNCTforKTLmtBqOuNPn4iN3VVpr//fx/juhE7o5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BDqOuCzTH+cZftGedZFYjnLuwXxOXAz0cPs6+TE3mHpnLV1vjBmLRDSkl5gM7wyLI
	 LGVOFdCg1woaYnrPLf7Hw8ATRT1kLt/0CJozTLGJZb6cNKTFWQVUs/wopbDElZAGzM
	 vI4WjLiu4yF4ZhOzb+moFolsMBsf1RcEsC3DmvT1ihOjCxdHDDt1PpC+XCk/hvxuFl
	 ccLj9VM53nC/S4TcBaOhI3j1k81/oijlxpAZhO44VRaCp2O3QQs4T+l7oV/Iz+pw3V
	 Z9GXX88Zxofx9pQcdjucOQoswlbFk6LFQFujkBrQZrXvmla0JM62aa1wE3bOI+C9HP
	 ulExIK9aqJlIg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 3/5] debugging: Use \co{} for rcutorture
Date: Sun,  5 Feb 2023 10:21:26 -0800
Message-Id: <20230205182128.19044-4-sj@kernel.org>
In-Reply-To: <20230205182128.19044-1-sj@kernel.org>
References: <20230205182128.19044-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Some sentences in debugging.tex encloses 'rcutorture' with while some
others don't.  Use \co{} consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 3ce74469..1903c5db 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -697,7 +697,7 @@ what it knows is almost always way more than your head can hold.
 For this reason, high-quality test suites normally come with sophisticated
 scripts to analyze the voluminous output.
 But beware---scripts will only notice what you tell them to.
-My rcutorture scripts are a case in point:
+My \co{rcutorture} scripts are a case in point:
 Early versions of those scripts were quite satisfied with a test run
 in which RCU \IXpl{grace period} stalled indefinitely.
 This of course resulted in the scripts being modified to detect RCU
@@ -1252,14 +1252,14 @@ of time you spent testing.
 Functional tests tend to be discrete.
 
 On the other hand, if my patch involved RCU, I would probably run
-rcutorture, which is a kernel module that, strangely enough, tests RCU\@.
+\co{rcutorture}, which is a kernel module that, strangely enough, tests RCU\@.
 Unlike booting the kernel, where the appearance of a login prompt
-signals the successful end of a discrete test, rcutorture will happily
+signals the successful end of a discrete test, \co{rcutorture} will happily
 continue torturing RCU until either the kernel crashes or until you
 tell it to stop.
-The duration of the rcutorture test is usually of more
+The duration of the \co{rcutorture} test is usually of more
 interest than the number of times you started and stopped it.
-Therefore, rcutorture is an example of a continuous test, a category
+Therefore, \co{rcutorture} is an example of a continuous test, a category
 that includes many stress tests.
 
 Statistics for discrete tests are simpler and more familiar than those
@@ -1845,7 +1845,7 @@ If the program is structured such that it is difficult or impossible
 to apply much stress to a subsystem that is under suspicion,
 a useful anti-heisenbug is a stress test that tests that subsystem in
 isolation.
-The Linux kernel's rcutorture module takes exactly this approach with RCU\@:
+The Linux kernel's \co{rcutorture} module takes exactly this approach with RCU\@:
 Applying more stress to RCU than is feasible in a production environment
 increases the probability that RCU bugs will be found during testing
 rather than in production.\footnote{
@@ -1918,7 +1918,7 @@ delay might be counted as a near miss.\footnote{
 \end{figure}
 
 For example, a low-probability bug in RCU priority boosting occurred
-roughly once every hundred hours of focused rcutorture testing.
+roughly once every hundred hours of focused \co{rcutorture} testing.
 Because it would take almost 500 hours of failure-free testing to be
 99\,\% certain that the bug's probability had been significantly reduced,
 the \co{git bisect} process
-- 
2.17.1

