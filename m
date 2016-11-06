Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=MYa3QI/bnGqyuvasjS+yADODOzY+jI4zGlf5LTvZu1g=;
 b=rNGpEuHOxx12znRX/oxgydKGC+5MNf2HaV4seesRHj2nfm46hk1srMnnJ2hJjBf2p5
 86yTw7aDlnOHu8AAIAjRg3iQue+BRJw2oqn4N5c2Klj1JiwH9TTWVW+7KcDDzwKZqW71
 YokASXJq/SSpS1+5vjMUWet5FFxJMQwfr045dqMK7KVHgT7VGIe8ZPH8YNHKc4UEB0oF
 jCIWNGbQ38hhFdm7r3fcNhbFeTEV3NXgv9O2lD6J5yamUrpWikytIfSuDlY4jFcdpUKi
 DXyeUINwl0WV8zCyWKsYzCpGOB3gXZvTCBoZA/s4eYTMjixg5IZoEstVkh0ldkdvuDpd
 MsfA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] rt: Insert missing NBSPs
Date: Mon,  7 Nov 2016 02:52:33 +0900
Message-Id: <20161106175234.13878-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 rt/rt.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rt/rt.tex b/rt/rt.tex
index 21a53a4514b8..870bc9af6e0b 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -386,7 +386,7 @@ cylinder contained in the log to the blade,
 Each of these six phases of operation might well have its own set of
 deadlines and environmental constraints,
 for example, one would expect phase~4's deadlines to be much more severe
-than those of phase 6, milliseconds instead of seconds.
+than those of phase~6, milliseconds instead of seconds.
 One might therefore expect that low-priority work would be performed in
 phase~6 rather than in phase~4.
 That said, careful choices of hardware, drivers, and software configuration
@@ -1429,7 +1429,7 @@ only being one runnable task on that CPU is said to be in
 \emph{adaptive ticks mode}.

 As an alternative to the \co{nohz_full=} boot parameter, you can build
-your kernel with \co{NO_HZ_FULL_ALL}, which will designate CPU 0 as
+your kernel with \co{NO_HZ_FULL_ALL}, which will designate CPU~0 as
 a housekeeping CPU and all other CPUs as worker CPUs.
 Either way, it is important to ensure that you have designated enough
 housekeeping CPUs to handle the housekeeping load imposed by the
-- 
2.10.0

