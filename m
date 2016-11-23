Return-Path: <tklauser@distanz.ch>
From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] CodeSamples: Fix typo of "acquire"
Date: Wed, 23 Nov 2016 13:29:15 +0100
Message-Id: <20161123122915.14350-1-tklauser@distanz.ch>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Change "aquire" to "acquire".

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---

Hi Paul,

As suggested in our private conversation, I try to give it another shot to
submit a patch. Let's hope it now reaches you directly and/or via mailing list.

Thanks
Tobias

 CodeSamples/SMPdesign/lockrwdeq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/SMPdesign/lockrwdeq.c b/CodeSamples/SMPdesign/lockrwdeq.c
index 137aa1a7b669..fd0d07cad15a 100644
--- a/CodeSamples/SMPdesign/lockrwdeq.c
+++ b/CodeSamples/SMPdesign/lockrwdeq.c
@@ -74,7 +74,7 @@ void deq_push_r(struct cds_list_head *e, struct deq *p)
 /*
  * And now the concurrent implementation, which uses a counter and a rw lock.
  * The counter holds the current available number of items to modify.
- * Before doing a modification we aquire a read lock and reserve our item to modify
+ * Before doing a modification we acquire a read lock and reserve our item to modify
  * (link/unlink).
  * If there are not enough items left for true parallel access we will upgrade
  * the read lock, to a write lock, making the access truly sequential.
-- 
2.11.0.rc0.7.gbe5a750


