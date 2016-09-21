Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AoBaiIiCGQQeTdzOGe7O028qFSwmC/Ogcm+lXAzGdZU=;
 b=JCFi5MVRSMXr54JNat78UcXSGoGqeuilIrNYKRXHCarhBB/mkYo3zV2l3v2BnNtLpQ
 AN6EgnnS+Bu7atE1W7arlqnocwBSgukWLkg89BO3BJ6lJe2vh+eBa/YvfgTveWyeca6u
 LGCLxlRlwU7jb+BW0HotDAHlE50RJ2whSoFZ0KdMKZ7diN/QenEoNCcpSzMSdjLGW8LE
 YksSvi5kGrcNBmCVjQx0ql/9WcZHysYLZVccgkEMAPLpi9rrffPREA7Zr1tcku9KLPy2
 Ol4zIqdKxwBDreWuEcBSwiD4dacMt7cyaEdPBxKU6Zx+tU34Si1QfgaLai5E6ButfiIc
 WRDw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 17/17] formal/dyntickrcu: Shorten too long code line length
Date: Wed, 21 Sep 2016 11:44:48 +0900
Message-Id: <20160921024448.24744-18-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Lines 19 and 39 of dyntickRCU-irqnn-ssl.spin is too long.  This commit
shortens the lines.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 68 ++++++++++++++++++++++++++-------------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index e31996d..922e556 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1272,46 +1272,48 @@ The \co{grace_period()} process then becomes as follows:
  16   :: 1 ->
  17     atomic {
  18       assert(!shouldexit);
- 19       shouldexit = dyntick_nohz_done && dyntick_irq_done;
- 20       curr = dynticks_progress_counter;
- 21       if
- 22       :: (curr - snap) >= 2 || (curr & 1) == 0 ->
- 23         break;
- 24       :: else -> skip;
- 25       fi;
- 26     }
- 27   od;
- 28   gp_state = GP_DONE;
- 29   gp_state = GP_IDLE;
- 30   atomic {
- 31     shouldexit = 0;
- 32     snap = dynticks_progress_counter;
- 33     gp_state = GP_WAITING;
- 34   }
- 35   do
- 36   :: 1 ->
- 37     atomic {
- 38       assert(!shouldexit);
- 39       shouldexit = dyntick_nohz_done && dyntick_irq_done;
- 40       curr = dynticks_progress_counter;
- 41       if
- 42       :: (curr != snap) || ((curr & 1) == 0) ->
- 43         break;
- 44       :: else -> skip;
- 45       fi;
- 46     }
- 47   od;
- 48   gp_state = GP_DONE;
- 49 }
+ 19       shouldexit = dyntick_nohz_done &&
+ 20                        dyntick_irq_done;
+ 21       curr = dynticks_progress_counter;
+ 22       if
+ 23       :: (curr - snap) >= 2 || (curr & 1) == 0 ->
+ 24         break;
+ 25       :: else -> skip;
+ 26       fi;
+ 27     }
+ 28   od;
+ 29   gp_state = GP_DONE;
+ 30   gp_state = GP_IDLE;
+ 31   atomic {
+ 32     shouldexit = 0;
+ 33     snap = dynticks_progress_counter;
+ 34     gp_state = GP_WAITING;
+ 35   }
+ 36   do
+ 37   :: 1 ->
+ 38     atomic {
+ 39       assert(!shouldexit);
+ 40       shouldexit = dyntick_nohz_done &&
+ 41                        dyntick_irq_done;
+ 42       curr = dynticks_progress_counter;
+ 43       if
+ 44       :: (curr != snap) || ((curr & 1) == 0) ->
+ 45         break;
+ 46       :: else -> skip;
+ 47       fi;
+ 48     }
+ 49   od;
+ 50   gp_state = GP_DONE;
+ 51 }
 \end{verbatim}
 }

 The implementation of \co{grace_period()} is very similar
 to the earlier one.
 The only changes are the addition of line~10 to add the new
-interrupt-count parameter, changes to lines~19 and~39 to
+interrupt-count parameter, changes to lines~19-20 and~40-41 to
 add the new \co{dyntick_irq_done} variable to the liveness
-checks, and of course the optimizations on lines~22 and~42.
+checks, and of course the optimizations on lines~23 and~44.

 This model (\path{dyntickRCU-irqnn-ssl.spin})
 results in a correct verification with roughly half a million
-- 
2.10.0

