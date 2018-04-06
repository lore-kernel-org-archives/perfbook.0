Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=UOYqHj18d4HPoCpk4nBGuCW17+s5awxnCp15IAM7yKc=;
 b=ZTS5ybpjQLzLPjY61GYBL2+WwHQrO94ODHjqyZqPER9Ip3hVrV2PFuayKQiA9tCrjr
 0gzfufxThzBlBUNCY7mRCDlPYZlwTciacjEbZHLyfAnFfI44iGOIMEDJ+/pYBYT/aWqV
 NZUxV00BsOVD4ZxaI/VFPkbKDhfhBxzmYZixE/Akk8xJi/s3Y3T1W30A8rJfhl7YvUIy
 VfmJzC0RtZBbYMCJdCW4Y50dDuQWPk0/lyWb8Z1Gkx1NdRCuS0++3gWwaW8CfpxXbF0H
 PW04QjKeIQhMBaJb+xoHLBu/HK9KhXhiL6ibwDhd4Y+kmszVveYm0QV8953lwkjLW3aF
 sV3Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] count: Use consistent coding style
Date: Fri,  6 Apr 2018 09:31:04 +0900
Message-Id: <20180406003105.7332-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

One code snippet in `Counting` chapter has no space between 'if' keyword
and its opening brace while other snippets have.  This commit fixes the
snippet to use consistent coding style.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 752371f..cf79753 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1544,7 +1544,7 @@ references only per-thread variables, and should not incur any cache misses.
 	\begin{minipage}[t]{\columnwidth}
 	\small
 	\begin{verbatim}
-  3 if (counter + delta <= countermax){
+  3 if (counter + delta <= countermax) {
   4   counter += delta;
   5   return 1;
   6 }
-- 
2.10.0

