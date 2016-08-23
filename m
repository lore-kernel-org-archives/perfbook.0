Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2aCRji0ZBudxOVWcZd9SURH+8dy6MXrLNB01qnaC6j4=;
 b=dGyzp9jS1DpHrv9GfCAU0H3d4BJsKP8ble+cFrefjvy1Q7zI7m1cWtFIUjmUtPAVQ6
 0aNxFqi3L4OiOZWWQO6jddptWWkGKZq794slKwU28M6cXdamYjp2YM4PFDyHXdDVjwRh
 0YZmdaNK3xOmc6HtQvznvpdiF0q1/lBNbCVz8KW4izlnm6zDdMzr4+fre4a1TEiYaThK
 B191/1TRa7Nx9FDGTigPQHXXlwxVPiBUNoD1x9P+2A0vOZJYMyOucVxx+ClalJiipJI3
 5uBnLBQ1YK76dZPVaFzimIdDsYYA/gHMm3bMBbdCV4fNXiGUtuQ/VsJl8+bCc3Agy+cD
 USlA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] debugging: Add missing tilde
Date: Tue, 23 Aug 2016 09:06:27 +0900
Message-Id: <1471910788-24070-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
References: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index b8156c8..0162442 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2230,7 +2230,7 @@ Lines~32 and~33 then compute the maximum of these two values.

 Each pass through the loop spanning lines~34-43 attempts to add another
 data value to the set of good data.
-Lines 35-39 compute the trend-break delta, with line~36 disabling this
+Lines~35-39 compute the trend-break delta, with line~36 disabling this
 limit if we don't yet have enough values to compute a trend,
 and with lines~38 and~39 multiplying \co{trendbreak} by the average
 difference between pairs of data values in the good set.
-- 
1.9.1

