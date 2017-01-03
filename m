Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=U8ESgeCHu4OwkP0xbRY5r7pRTBhINYX3HoA+FhVHa5Q=;
 b=R7Xk/fLkRghqcGijU6FG5IgZBd8jQaLJW9JtBrQZeP/Vxbs44XOEzYMDm7gA60Nqdp
 H675FGpC3FGQIOCnh7dlJZunEIQqpcmiQzKN7VfsBeSuCZuvtQhf8YCxXZe+iLW5WRfR
 ZWWIxG9OvsaaDM3Pyl6A7HPpE+ZkHAFy5YTVfpad9EMvHy5X4kR+BLu0cMKts84ArxRx
 uBYb1TpnuYxEAVSqd1L4rePkVLWDppJhFCTX4QnN8XCOiI3AcKMmP7N4ftPIeUzEbcqh
 LBe0MbynVsHzH2uBXcNowvabqpD0OlDNg/xZ1DE+tUUtA/YDlEMSNuoy2Blyeuzoa7m3
 sSfQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] toolsoftrade: Close uncompleted parentheses
Date: Wed,  4 Jan 2017 03:59:52 +0900
Message-Id: <20170103185953.3000-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 194659949d36..899ef01e6e2a 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1320,7 +1320,7 @@ storage, and other less-polite names, are used extremely
 heavily in concurrent code, as will be explored in
 Chapters~\ref{chp:Counting} and~\ref{chp:Data Ownership}.
 POSIX supplies the \co{pthread_key_create()} function to create a
-per-thread variable (and return the corresponding key,
+per-thread variable (and return the corresponding key),
 \co{pthread_key_delete()} to delete the per-thread variable corresponding
 to key,
 \co{pthread_setspecific()} to set the value of the current thread's
-- 
2.10.0

