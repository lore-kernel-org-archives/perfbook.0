Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yEE0Qdpz/sCpmDQFwsTf3GF3v5+WzZ1Vn0tAhoNI5mE=;
 b=zSpr9R52YyUlP5nor+SYk79KwKy9Ep04f+DTuGwzYzKavJDPUMAF9ngJw0ilziPrne
 DsAFl1WwBzAdL3HcayOL/PeqzaUafl/y0m9Jn74zKLmMN4coYFcoQp/EtPAcy/oBTrvE
 UgDmBqBoCI6i0WAOf7x8l51DGxZdUC/b/A5RLSANWrJ9W1w5ENfRcJVOaAtnD8QMLJ92
 jDipP0fQk2iXHdLzdScSHVvSRd4QHnACTJBoR9sGoZ6xtKLygGD6m0RyubJGj80oiDTy
 XOyqlPREcphB5IXUe8g5V/KNTsQKVecNG94L1bFqXIGXPRlVXeATGoeD1rjxzLoXJjmL
 Lhtw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/4] defer/seqlock: Fix wrong line reference
Date: Fri,  1 Jul 2016 09:43:54 +0900
Message-Id: <1467333834-17050-5-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
References: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

One sentence is referencing code line incorrectly.  This commit fix it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/seqlock.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index f56659f..fb733e6 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -229,7 +229,7 @@ were no writers present since the time of the corresponding
 call to \co{read_seqbegin()}.
 Line~29 orders the caller's prior critical section before line~30's
 fetch of the new snapshot of the sequence counter.
-Finally, line~30 checks that the sequence counter has not changed,
+Finally, line~31 checks that the sequence counter has not changed,
 in other words, that there has been no writer, and returns true if so.

 \QuickQuiz{}
-- 
1.9.1

