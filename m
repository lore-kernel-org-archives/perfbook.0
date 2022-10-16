Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiJPMfP (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 16 Oct 2022 08:35:15 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA18528E00
        for <perfbook@vger.kernel.org>; Sun, 16 Oct 2022 05:35:11 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id j21so5213812qkk.9
        for <perfbook@vger.kernel.org>; Sun, 16 Oct 2022 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShAFRoysHJEt+xNHbyeWt/kGz65Z/PcPi1CU5Wke+sA=;
        b=TH3mDvVr17Cm/OeXSVg03B171E7kOogKXRhk5xh0dZPA5G6hWGP7kLhRC+3TsIEyAQ
         0dsey+0/rExOioM+esyIU/hX9UhsPI3JIkllYkYqMFXTQ93YkQccISz54pBFQ8peAa5i
         BsmH+7WCHCkrU02+N9Ib5orwLXtiFD1j37rfdt8jPreNgmnTakFkqkVUWFyO+6JEzruW
         CNIJCTvtmyoTWo2NXh6yPPIZ6DiV9NbNbzMk5mHbrKoKd27upPrGASRsopeRQmevL0yH
         yHnyKdBoWhf7/XRtRPOU6XoQBWL65ntkTyL3ojjtp4kiH3aiTPfJbKm652ih1d9P0d2P
         nRog==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] locking: now with more danger!
Date: Sun, 16 Oct 2022 08:35:02 -0400
Message-Id: <20221016123502.1856807-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Add an example to demonstrate how an assumption about the tree can be
invalidated by releasing and then re-acquiring a lock.

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/locking/rec_tree_itr.c | 59 +++++++++++++++++-------------
 locking/locking.tex                | 23 ++++++++++++
 2 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/CodeSamples/locking/rec_tree_itr.c b/CodeSamples/locking/rec_tree_itr.c
index 1445668c..d091e4cc 100644
--- a/CodeSamples/locking/rec_tree_itr.c
+++ b/CodeSamples/locking/rec_tree_itr.c
@@ -20,12 +20,10 @@
 
 #include "../api.h"
 
-#define MAX_CHILDREN 10
-
 struct node {
-    int data;
+	int data;
 	int nchildren;
-	struct node *children[MAX_CHILDREN];
+	struct node **children;
 };
 
 struct tree {
@@ -41,8 +39,10 @@ void tree_for_each_rec(struct tree *tr, struct node *nd,
 	callback(nd);
 	spin_lock(&tr->s);
 
+	struct node **itr = nd->children;
 	for (int i = 0; i < nd->nchildren; i++) {
-		tree_for_each_rec(tr, nd->children[i], callback);
+		tree_for_each_rec(tr, *itr, callback);
+		itr++;
 	}
 }
 
@@ -53,44 +53,51 @@ void tree_for_each(struct tree *tr,
 	tree_for_each_rec(tr, tr->root, callback);
 	spin_unlock(&tr->s);
 }
+
+void tree_add(struct tree *tr, struct node *parent,
+			  struct node *new_child)
+{
+	spin_lock(&tr->s);
+	parent->nchildren++;
+	parent->children = realloc(parent->children,
+				   sizeof(struct node *) * parent->nchildren);
+	parent->children[parent->nchildren - 1] = new_child;
+	spin_unlock(&tr->s);
+}
 //\end{snippet}
 
 void print_node_data(struct node *nd)
 {
-    printf("%d\n", nd->data);
+	printf("%d\n", nd->data);
 }
 
 int main(int argc, char *argv[])
 {
-    struct tree tr;
-    struct node *nodes = calloc(sizeof(struct node), 10);
+	struct tree tr;
+	struct node *nodes = calloc(sizeof(struct node), 10);
 
-    for (int i = 0; i < 10; i++) {
-        nodes[i].data = 100 + i;
-    }
+	for (int i = 0; i < 10; i++) {
+		nodes[i].data = 100 + i;
+	}
 
 	spin_lock_init(&tr.s);
 
-    tr.root = &nodes[0];
+	tr.root = &nodes[0];
 
-    nodes[0].nchildren = 3;
-    nodes[0].children[0] = &nodes[1];
-    nodes[0].children[1] = &nodes[2];
-    nodes[0].children[2] = &nodes[3];
+	tree_add(&tr, &nodes[0], &nodes[1]);
+	tree_add(&tr, &nodes[0], &nodes[2]);
+	tree_add(&tr, &nodes[0], &nodes[3]);
 
-    nodes[1].nchildren = 2;
-    nodes[1].children[0] = &nodes[4];
-    nodes[1].children[1] = &nodes[5];
+	tree_add(&tr, &nodes[1], &nodes[4]);
+	tree_add(&tr, &nodes[1], &nodes[5]);
 
-    nodes[2].nchildren = 1;
-    nodes[2].children[0] = &nodes[6];
+	tree_add(&tr, &nodes[2], &nodes[6]);
 
-    nodes[5].nchildren = 3;
-    nodes[5].children[0] = &nodes[7];
-    nodes[5].children[1] = &nodes[8];
-    nodes[5].children[2] = &nodes[9];
+	tree_add(&tr, &nodes[3], &nodes[7]);
+	tree_add(&tr, &nodes[3], &nodes[8]);
+	tree_add(&tr, &nodes[3], &nodes[9]);
 
-    tree_for_each(&tr, print_node_data);
+	tree_for_each(&tr, print_node_data);
 
 	return 0;
 }
diff --git a/locking/locking.tex b/locking/locking.tex
index b138cd59..7f2a8c5b 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -394,6 +394,29 @@ This code makes dangerous assumptions:
 	there, and
 \item	The visited node itself has not been removed and freed.
 \end{enumerate*}
+A few of these hazards can be encountered if one thread calls
+\co{tree_add()} while another thread releases the tree's lock to run a
+callback function.
+
+\QuickQuiz{
+	So the iterating thread may or may not observe the added child.
+	What's the big deal?
+}\QuickQuizAnswer{
+	There are (at least) two hazards in this situation.
+
+	One is indeed that the number of children may or may not be
+	observed to have changed.
+	While that would be consistent with \co{tree_add()} being called
+	either before or after the iterator started, it is better not
+	left to the vagaries of the compiler.
+	A more serious problem is that \co{realloc()} may not be able
+	to extend the array in place, causing the heap to free the
+	one used by the iterator and replace it with another block of
+	memory.
+	If the \co{children} pointer is not re-read then the iterating
+	thread will access the wrong memory (either free or reclaimed).
+}\QuickQuizEnd
+
 One strategy is to ensure that state is preserved despite the lock being
 released, for example, by acquiring a reference on a node to prevent it
 from being freed.
-- 
2.25.1

