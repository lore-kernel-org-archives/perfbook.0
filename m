Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=viIKBPW57H+64ddXcFcy0p0zLv/VHIlkTOYIRq3ONcg=;
 b=Qdvmmdj0KDpZypLqwCjaIPRuj2eZIgh1ZcYwjIsaJzvXWwH2nAFR9tJPTIFg2OIlvs
 8/ZUCM+Av5jCVnt//AUQKkISeL0/Ask5/gfasVFs/3yO1383hxHA3rrDkfoSJRHFZlhG
 f1VFm4mMLE7nUhW0JH5gESj/qbYlmeUiC5kWbTRHN3SPBpBDq/TGBrR5zrVEHmN5TCsS
 cRxrk1DPfzw/kE170xNKgKgtuyY0ahom9SPRBewmWMsu87+oaPkAV0XvPuod2/fiMNKB
 zhi8PshWgZ4modvnXSWayVLO5i/ZMcv6U9p3cONLAVgWlsexAdqW6xaFkOUva11QaS/e
 bNyw==
Subject: [PATCH 8/8] SMPdesign: Add another shortcut of extdash
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5ee54d52-27a8-0f90-9541-343ea9470495@gmail.com>
Date: Tue, 17 Jan 2017 00:08:28 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4e1157502e94beeef363808e627acd2882e0aac0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 20:36:28 +0900
Subject: [PATCH 8/8] SMPdesign: Add another shortcut of extdash

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/partexercises.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 3431d2a..1c19a8a 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -440,7 +440,7 @@ shows the implementation of the enqueue and dequeue functions.\footnote{
 Discussion will focus on the left-hand operations, as the right-hand
 operations are trivially derived from them.

-Lines~1-13 show \co{pdeq_pop_l()}, which left-dequeues and returns
+Lines~1-13 show \co{pdeq_pop_l()}, which left\-/dequeues and returns
 an element if possible, returning \co{NULL} otherwise.
 Line~6 acquires the left-hand spinlock, and line~7 computes the
 index to be dequeued from.
-- 
2.7.4


