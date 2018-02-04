Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=QwD0pKfsTbOA5Bw/MoC9JJngCTjyyfv7iHO/V8AG7HU=;
 b=Qm58PGbWQdifJVgm16qo9xxr/FfeqA20p8XtmR4Iv+S2RHbD3+bS9uyCRYg0oGQ4Qh
 VG6oYR2CCO7Gx4/kMUUg9dTtCEeXFtr8z8vHH2oxMfVCxr6B3sJPzDO/9T+MOmHSvcxI
 r2exxp9puOLeT5PKJL6GqVAxjm5OvjC39CRNkt0K9OGx/erdEKv+Z6n+xiCJYMufbaUW
 MO/i0EmxjESbT9+VNDQ9UEVB1E5+Ok4ZUHhSyj6GIoVV6bokjFnmH06aT2TO/fHWmHqZ
 QHc9jKnoz9C4tEdPqhAw7IsqLNg4OvRYYGj0H/JOd6dbsv56n1NM1bxzclX9+immBluV
 gXsg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] toolsoftrade: Add a missed unbreakable space for line
 number
Date: Mon,  5 Feb 2018 07:11:34 +0900
Message-Id: <20180204221135.1001-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index e7a922b..ac25855 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -272,7 +272,7 @@ If the process ID is instead $-1$, this indicates that the \co{wait()}
 primitive was unable to wait on a child.
 If so, line~9 checks for the \co{ECHILD} errno, which indicates that there
 are no more child processes, so that line~10 exits the loop.
-Otherwise, lines~11 and 12 print an error and exit.
+Otherwise, lines~11 and~12 print an error and exit.

 \QuickQuiz{}
 	Why does this \co{wait()} primitive need to be so complicated?
-- 
2.10.0

