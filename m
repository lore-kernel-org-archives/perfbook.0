Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MPhP5Nj3AIXvmNb0jZ2ULtdgndSCqPO50LUE/NRI/bs=;
 b=IjrXRixray41WkCrPcBvvEVNV4i9kgNTD6JgPr90XuuTBTAuO8QsQq+nXeHSpt4bM3
 8GSmsO5/2bzXfgMSk5zOo7ofdyhRCLP8xUkNT5Kt1o+aGMKYt9MONYCKZyTmiZlfM5Hw
 mk5osKiTx5LGGkBcgQbmAjAF2PVuTLgnmvsthya4cb+QtffKhRrmP1we7TdKgMPQXXUi
 eb+cWFTf/i0kEt0tAZ02X4aV7Et6p0Oi/htVkMNtlVJZ6GFuo4H2yQ3mMhOEAhDW47hb
 XUJ/fV7Rr7P1EfetFvV9lxO0jgbMzFUE8ITsZHIOqhZTgXyXScYxReOCoDZFZlhVh+0P
 y86Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 10/17] formal/dyntickrcu: Fix wrong line number quotation
Date: Wed, 28 Sep 2016 06:56:34 +0900
Message-Id: <20160927215641.7330-10-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index bbbdb18..1c99a0b 100644
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

