Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbiI2MLc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 29 Sep 2022 08:11:32 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902D5B6001
        for <perfbook@vger.kernel.org>; Thu, 29 Sep 2022 05:11:26 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id ml1so769740qvb.1
        for <perfbook@vger.kernel.org>; Thu, 29 Sep 2022 05:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=de8lwNHNxniGqGsgZ0hlaGJNJHXX1bleLcE/NrKCRnY=;
        b=VPnSv1U+P4iwX/+fbcYIk+yLOoev70sz4exwKihiJq/Aq49fG00evn4wvwEUvyy0rQ
         0sYBQw8+f4AMn0F/Qi3YFCj0RxEQRZtZpneN5NVOBwDcFguZKlQAz2A+PJIcn7T1rlsY
         7Y/rNOPeP9EsFh0MEybN63AKGEZ222CQjpbg3lzhup309+IlU2L21XiJrqmJfc2K/k+h
         OFatRBfTEpngu6FFhbe/U0s1G9hz8t5tc/bc89y0PIXg86YTTiQQSK4J5JP6nU6euYhS
         VwSu8BxNAGXyxj4LQhb0aa3CgZ93DiYEUbjM7SEvVSMxUjHK0fPPsq6vtrgqhBo2SWqg
         MKxw==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] locking: Warn about state preservation when releasing and re-acquiring locks
Date: Thu, 29 Sep 2022 08:11:12 -0400
Message-Id: <20220929121112.373983-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/locking/Makefile       |  5 +-
 CodeSamples/locking/rec_tree_itr.c | 96 ++++++++++++++++++++++++++++++
 locking/locking.tex                | 32 +++++++++-
 3 files changed, 130 insertions(+), 3 deletions(-)
 create mode 100644 CodeSamples/locking/rec_tree_itr.c

diff --git a/CodeSamples/locking/Makefile b/CodeSamples/locking/Makefile
index 3663a7d5..cf600636 100644
--- a/CodeSamples/locking/Makefile
+++ b/CodeSamples/locking/Makefile
@@ -1,4 +1,4 @@
-ARCH_INDEPENDENT = locked_list
+ARCH_INDEPENDENT = locked_list rec_tree_itr
 ARCH_DEPENDENT = xchglock
 PROGS = $(ARCH_INDEPENDENT) $(ARCH_DEPENDENT)
 
@@ -20,5 +20,8 @@ locked_list: locked_list.c ../api.h
 xchglock: xchglock.c ../api.h
 	cc -g -Wall -o xchglock xchglock.c -lpthread
 
+rec_tree_itr: rec_tree_itr.c ../api.h
+	cc -g -Wall -o rec_tree_itr rec_tree_itr.c -lpthread
+
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/locking/rec_tree_itr.c b/CodeSamples/locking/rec_tree_itr.c
new file mode 100644
index 00000000..1445668c
--- /dev/null
+++ b/CodeSamples/locking/rec_tree_itr.c
@@ -0,0 +1,96 @@
+/*
+ * locked_list.c: Recursive tree iterator
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, you can access it online at
+ * http://www.gnu.org/licenses/gpl-2.0.html.
+ *
+ * Copyright (c) 2022 Elad Lahav
+ */
+
+#include "../api.h"
+
+#define MAX_CHILDREN 10
+
+struct node {
+    int data;
+	int nchildren;
+	struct node *children[MAX_CHILDREN];
+};
+
+struct tree {
+	spinlock_t s;
+	struct node *root;
+};
+
+//\begin{snippet}[labelbase=ln:locking:rec_tree_iterator:tree_for_each,commandchars=\\\@\$]
+void tree_for_each_rec(struct tree *tr, struct node *nd,
+					   void (*callback)(struct node *))
+{
+	spin_unlock(&tr->s);
+	callback(nd);
+	spin_lock(&tr->s);
+
+	for (int i = 0; i < nd->nchildren; i++) {
+		tree_for_each_rec(tr, nd->children[i], callback);
+	}
+}
+
+void tree_for_each(struct tree *tr,
+				   void (*callback)(struct node *))
+{
+	spin_lock(&tr->s);
+	tree_for_each_rec(tr, tr->root, callback);
+	spin_unlock(&tr->s);
+}
+//\end{snippet}
+
+void print_node_data(struct node *nd)
+{
+    printf("%d\n", nd->data);
+}
+
+int main(int argc, char *argv[])
+{
+    struct tree tr;
+    struct node *nodes = calloc(sizeof(struct node), 10);
+
+    for (int i = 0; i < 10; i++) {
+        nodes[i].data = 100 + i;
+    }
+
+	spin_lock_init(&tr.s);
+
+    tr.root = &nodes[0];
+
+    nodes[0].nchildren = 3;
+    nodes[0].children[0] = &nodes[1];
+    nodes[0].children[1] = &nodes[2];
+    nodes[0].children[2] = &nodes[3];
+
+    nodes[1].nchildren = 2;
+    nodes[1].children[0] = &nodes[4];
+    nodes[1].children[1] = &nodes[5];
+
+    nodes[2].nchildren = 1;
+    nodes[2].children[0] = &nodes[6];
+
+    nodes[5].nchildren = 3;
+    nodes[5].children[0] = &nodes[7];
+    nodes[5].children[1] = &nodes[8];
+    nodes[5].children[2] = &nodes[9];
+
+    tree_for_each(&tr, print_node_data);
+
+	return 0;
+}
diff --git a/locking/locking.tex b/locking/locking.tex
index 45a12caa..c8343638 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -375,6 +375,34 @@ deadlock is avoided if each module separately avoids deadlock.
 This rule therefore greatly simplifies deadlock analysis and greatly
 improves modularity.
 
+Nevertheless, the golden rule comes with a warning.
+The state protected by the lock cannot be trusted to survive the release
+and re-acquisition of the lock by the module.
+Such assumptions on state preservation can often be subtle and thus the
+source of many bugs.
+The use of \co{qsort()} in the examples above may not illustrate the
+danger.
+
+Consider, however, the recursive tree iterator in
+\cref{lst:locking:Recursive Tree Iterator}.
+The iterator visits every node in the tree, invoking a user's callback
+function.
+The tree lock is released before the invocation and re-acquired after.
+This code makes dangerous assumptions about the preservation of state,
+such as that the number of children of the current node has not changed,
+that the ancestors stored on the stack by the recursion are still there,
+or even that the visited node itself has not been removed and freed.
+The module author must therefore take great care to ensure either that
+state is preserved (e.g., by acquiring a reference on a node to prevent
+it from being freed) or re-initialized when the lock is acquired after
+the return of the callback function.
+
+\begin{listing}
+\input{CodeSamples/locking/rec_tree_iterator@tree_for_each.fcv}
+\caption{Concurrent List Iterator}
+\label{lst:locking:Recursive Tree Iterator}
+\end{listing}
+
 \subsubsection{Layered Locking Hierarchies}
 \label{sec:locking:Layered Locking Hierarchies}
 
@@ -1399,7 +1427,7 @@ for example:
 	that some FIFO ordering applies for threads of the same priority.
 \item	Random, so that the new lock holder is chosen randomly from
 	all threads attempting acquisition, regardless of timing.
-\item	
+\item
 	Unfair, so that a given acquisition might never acquire the lock
 	(see \cref{sec:locking:Unfairness}).
 \end{enumerate}
@@ -1486,7 +1514,7 @@ when switching from read-holder to write-holder mode.
 Here are a few possible approaches:
 
 \begin{enumerate}
-\item	
+\item
 	Reader-preference implementations unconditionally favor readers
 	over writers, possibly allowing write acquisitions to be
 	indefinitely blocked.
-- 
2.25.1

