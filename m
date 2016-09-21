Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xWDkHZYYB597sqlaR81RFIVjnxTjyYFOe/XN/fUEhQE=;
 b=BO034aair6FSPZG0GDyp7jxUgrJVdtonLcuR710Exo3EWG/16029oJtcQhYgGBjiBZ
 YsDea32vJQKo9R92wPpKh0tdy4OYc3quGtxG9RKaL5DuL2ZyodjmsSYbiEWWvFq9+hUb
 jcOHOa7YndoNKdqSrBtv/wzTfxXtWICg2b4FHfSxtTwCf724v5DAxHoY0YspI+DI6moF
 pD7vx5qBPO5rDrJ4g43eY8I1eEni1NaxHjzF5+rcn6CZzihSOKlBDnmlNQKLiqGJyARA
 QAKlUAxwD1VuORC82cChf3q1YSagciW3TBB2nEVanSuYnEhUhgdj25UoYozfMB79ob7P
 eauA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 04/17] formal/spinhint: Use \path{} for file name quotation
Date: Wed, 21 Sep 2016 11:44:35 +0900
Message-Id: <20160921024448.24744-5-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index e91d458..73ebe8e 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -409,7 +409,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	This actually searches the state space.  The number of states
 	can reach into the tens of millions with very small state
 	machines, so you will need a machine with large memory.
-	For example, qrcu.spin with 3 readers and 2 updaters required
+	For example, \path{qrcu.spin} with 3 readers and 2 updaters required
 	2.7GB of memory.

 	If you aren't sure whether your machine has enough memory,
-- 
2.10.0

