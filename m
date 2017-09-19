Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qH+dPKh/W/jSl0rHt0xqNAbHjXfBz2C0nCif1Vm7yqU=;
 b=hFO5ioZQ3Yjd8GxjzJ9CS73wDeMJ82hEtZhRQLm12IY6wJ+S+bXHls+52rXFkYDRMj
 moqnJY9SXOVoJ6y3Tf2Q4rrYTaO0SNyBXiZ4o5QjP3h+qaB2cN1xt/fhzZVVEHlXdFZz
 eWJ2ye0dQeX/peFAYMBwLyKzXMtIaPWoiZJeCEIAbUY9jfw0lk3nCuRWwaqeJ/SOX1Y9
 xer9GhMMLZf5bWZahHeus6qwAV4BdNuEcTsyV2GhhGuXKEuaSvyolC/f56VaXWgKjlhh
 EDg6xGUIdnw2SNewQ0dIXxvd4uaBykjVjes3/34w8iEnb5Ac2GTRMAN46IFAENDWezoU
 uuEQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/3] memorder: Present P0()-P3() in consistent manner
Date: Wed, 20 Sep 2017 00:34:56 +0900
Message-Id: <20170919153456.10274-3-sj38.park@gmail.com>
In-Reply-To: <20170919153456.10274-1-sj38.park@gmail.com>
References: <20170919153456.10274-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 85ba46e..5df5649 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1982,12 +1982,12 @@ This sequence of events will depend critically on \co{P0()} and
 Figure~\ref{fig:memorder:Shared Store Buffers And Multi-Copy Atomicity}.

 \QuickQuiz{}
-	But just how is it fair that P0 and P1 must share a store buffer
-	and a cache, but P2 gets one each of its very own???
+	But just how is it fair that \co{P0()} and \co{P1()} must share a store
+	buffer and a cache, but \co{P2()} gets one each of its very own???
 \QuickQuizAnswer{
-	Presumably there is a P3, as is in fact shown in
+	Presumably there is a \co{P3()}, as is in fact shown in
 	Figure~\ref{fig:memorder:Shared Store Buffers And Multi-Copy Atomicity},
-	that shares P2's store buffer and cache.
+	that shares \co{P2()}'s store buffer and cache.
 	But not necessarily.
 	Some platforms allow different cores to disable different numbers
 	of threads, allowing the hardware to adjust to the needs of the
@@ -2008,8 +2008,8 @@ Figure~\ref{fig:memorder:Shared Store Buffers And Multi-Copy Atomicity}.
 } \QuickQuizEnd

 Row~1 shows the initial state, with the initial value of \co{y} in
-P0's and P1's shared cache, and the initial value of \co{x} in
-P2's cache.
+\co{P0()}'s and \co{P1()}'s shared cache, and the initial value of \co{x} in
+\co{P2()}'s cache.

 Row~2 shows the immediate effect of \co{P0()} executing its store on line~8.
 Because the cacheline containing \co{x} is not in \co{P0()}'s and \co{P1()}'s
-- 
2.10.0

