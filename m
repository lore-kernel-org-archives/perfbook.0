Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=No1vBurEKlN3N/b3effu863uFri9Zhcq7bqSU7P3A0I=;
 b=zJnwPZ7ZS/3lMHKS1fmpl/x4+pROWH4rvChqsumbh2OoTjdk/uf+0swTL4uP1atH2H
 NOur23ZttnDjSdVU3539gojEtW5qXA9dzCJqB5B0mJUCWIU4anwpc/JEmtIYpBxJsCRF
 OF5KZ+xx/zRwwf/OOTlogQLp+d2r55NN+SWXoPF0nqMaTmFta1JtXxNUZHyxcfhsxAOm
 5PAcVWIiysoQBOAz6ViWkKokejlv+aLJUU6z85OQY+bOdSYXHFPG9s5AoqdoE7XSbfm/
 cga8DfLDWScPX8ZSvsKh1L8I7KIUyMHSxKoalXb188d4DWERtNMXNe4cvd0fRqCRmTSa
 HY5Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 10/17] formal/dyntickrcu: Fix wrong line number quotation
Date: Wed, 21 Sep 2016 11:44:41 +0900
Message-Id: <20160921024448.24744-11-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 1d3e155..a36901e 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1098,7 +1098,7 @@ The first step is to convert \co{dyntick_nohz()} to
 }

 It is important to note that when a group of statements is passed
-to \co{EXECUTE_MAINLINE()}, as in lines~11-14, all
+to \co{EXECUTE_MAINLINE()}, as in lines~12-15, all
 statements in that group execute atomically.

 \QuickQuiz{}
@@ -1216,7 +1216,7 @@ to model an interrupt handler:
 }

 The loop from lines~7-48 models up to \co{MAX_DYNTICK_LOOP_IRQ}
-interrupts, with lines~8 and~9 forming the loop condition and line~45
+interrupts, with lines~8 and~9 forming the loop condition and line~46
 incrementing the control variable.
 Line~10 tells \co{dyntick_nohz()} that an interrupt handler
 is running, and line~45 tells \co{dyntick_nohz()} that this
@@ -2046,7 +2046,7 @@ Otherwise, the two functions increment \co{dynticks_nmi}, with
 \co{rcu_nmi_enter()} leaving it with an odd value and \co{rcu_nmi_exit()}
 leaving it with an even value.
 Both functions execute memory barriers between this increment
-and possible RCU read-side critical sections on lines~11 and~21,
+and possible RCU read-side critical sections on lines~10 and~20,
 respectively.

 \subsubsection{Interrupts From Dynticks-Idle Mode}
-- 
2.10.0

