Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PbmDsHyckv2R0c8Jitv0jAoxNPPUd/YiwNnTuQ0c/nY=;
        b=eOf5TugIZhVEOmBCJw/zAZoacN04ip9pzUaz62/fShkLnew3b3DxwybKnEq+0WQMcK
         cuHtc/RO93ci2RN2IV49vt1TghxHaKlCRjEX5s2V84rk2KQQchrPu9MA7OuLSxxIXC4G
         MOnR3d49TsC55YsdzXa9Lsv3IQCHbyAaLex3rGNXR1N1L9jiDSIFHLW/1aMjqOeH0JVs
         HZO2Rdf242QEgFUbepSFId5aaVhCzaGq+fvssRBJ0juGcs1ke6OAK9U+qrUzMXXI6YZB
         xnkP+cP+sLsbP5SE9RwZW0+PPXIwcVAznoirPngMY7WvvL1iOLeFqsShE6mA9G782qXX
         tovw==
Subject: [PATCH 4/7] SMPdesign: Employ new scheme for inline snippets
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2aaa11d5-81c8-c8c0-ff6d-e9d10c486b9e@gmail.com>
Date: Sun, 4 Nov 2018 09:11:56 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 798445931ab13a7fab28d9a9271f719adf14c89a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 1 Nov 2018 07:45:05 +0900
Subject: [PATCH 4/7] SMPdesign: Employ new scheme for inline snippets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex | 357 +++++++++++++++++++++++-------------------------
 1 file changed, 170 insertions(+), 187 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 824de41..06a0c8c 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -120,36 +120,32 @@ In contrast, speedups due to sequential optimizations, for example,
 careful choice of data structure, can be arbitrarily large.
 
 \begin{listing}[tbhp]
-{ \scriptsize
-\begin{verbbox}
-  1 struct hash_table
-  2 {
-  3   long nbuckets;
-  4   struct node **buckets;
-  5 };
-  6
-  7 typedef struct node {
-  8   unsigned long key;
-  9   struct node *next;
- 10 } node_t;
- 11
- 12 int hash_search(struct hash_table *h, long key)
- 13 {
- 14   struct node *cur;
- 15
- 16   cur = h->buckets[key % h->nbuckets];
- 17   while (cur != NULL) {
- 18     if (cur->key >= key) {
- 19       return (cur->key == key);
- 20     }
- 21     cur = cur->next;
- 22   }
- 23   return 0;
- 24 }
-\end{verbbox}
+\begin{VerbatimL}[commandchars=\\\[\]]
+struct hash_table
+{
+	long nbuckets;
+	struct node **buckets;
+};
+
+typedef struct node {
+	unsigned long key;
+	struct node *next;
+} node_t;
+
+int hash_search(struct hash_table *h, long key)
+{
+	struct node *cur;
+
+	cur = h->buckets[key % h->nbuckets];
+	while (cur != NULL) {
+		if (cur->key >= key) {
+			return (cur->key == key);
+		}
+		cur = cur->next;
+	}
+	return 0;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Sequential-Program Hash Table Search}
 \label{lst:SMPdesign:Sequential-Program Hash Table Search}
 \end{listing}
@@ -197,43 +193,39 @@ has now become three statements due to the need to release the
 lock before returning.
 
 \begin{listing}[tbhp]
-{ \scriptsize
-\begin{verbbox}
-  1 spinlock_t hash_lock;
-  2
-  3 struct hash_table
-  4 {
-  5   long nbuckets;
-  6   struct node **buckets;
-  7 };
-  8
-  9 typedef struct node {
- 10   unsigned long key;
- 11   struct node *next;
- 12 } node_t;
- 13
- 14 int hash_search(struct hash_table *h, long key)
- 15 {
- 16   struct node *cur;
- 17   int retval;
- 18
- 19   spin_lock(&hash_lock);
- 20   cur = h->buckets[key % h->nbuckets];
- 21   while (cur != NULL) {
- 22     if (cur->key >= key) {
- 23       retval = (cur->key == key);
- 24       spin_unlock(&hash_lock);
- 25       return retval;
- 26     }
- 27     cur = cur->next;
- 28   }
- 29   spin_unlock(&hash_lock);
- 30   return 0;
- 31 }
-\end{verbbox}
+\begin{VerbatimL}[commandchars=\\\[\]]
+spinlock_t hash_lock;
+
+struct hash_table
+{
+	long nbuckets;
+	struct node **buckets;
+};
+
+typedef struct node {
+	unsigned long key;
+	struct node *next;
+} node_t;
+
+int hash_search(struct hash_table *h, long key)
+{
+	struct node *cur;
+	int retval;
+
+	spin_lock(&hash_lock);
+	cur = h->buckets[key % h->nbuckets];
+	while (cur != NULL) {
+		if (cur->key >= key) {
+			retval = (cur->key == key);
+			spin_unlock(&hash_lock);
+			return retval;
+		}
+		cur = cur->next;
+	}
+	spin_unlock(&hash_lock);
+	return 0;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Code-Locking Hash Table Search}
 \label{lst:SMPdesign:Code-Locking Hash Table Search}
 \end{listing}
@@ -292,48 +284,44 @@ The increased scalability again results in a slight increase in complexity
 in the form of an additional data structure, the \co{struct bucket}.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 struct hash_table
-  2 {
-  3   long nbuckets;
-  4   struct bucket **buckets;
-  5 };
-  6
-  7 struct bucket {
-  8   spinlock_t bucket_lock;
-  9   node_t *list_head;
- 10 };
- 11
- 12 typedef struct node {
- 13   unsigned long key;
- 14   struct node *next;
- 15 } node_t;
- 16
- 17 int hash_search(struct hash_table *h, long key)
- 18 {
- 19   struct bucket *bp;
- 20   struct node *cur;
- 21   int retval;
- 22
- 23   bp = h->buckets[key % h->nbuckets];
- 24   spin_lock(&bp->bucket_lock);
- 25   cur = bp->list_head;
- 26   while (cur != NULL) {
- 27     if (cur->key >= key) {
- 28       retval = (cur->key == key);
- 29       spin_unlock(&bp->bucket_lock);
- 30       return retval;
- 31     }
- 32     cur = cur->next;
- 33   }
- 34   spin_unlock(&bp->bucket_lock);
- 35   return 0;
- 36 }
-\end{verbbox}
+\begin{VerbatimL}
+struct hash_table
+{
+	long nbuckets;
+	struct bucket **buckets;
+};
+
+struct bucket {
+	spinlock_t bucket_lock;
+	node_t *list_head;
+};
+
+typedef struct node {
+	unsigned long key;
+	struct node *next;
+} node_t;
+
+int hash_search(struct hash_table *h, long key)
+{
+	struct bucket *bp;
+	struct node *cur;
+	int retval;
+
+	bp = h->buckets[key % h->nbuckets];
+	spin_lock(&bp->bucket_lock);
+	cur = bp->list_head;
+	while (cur != NULL) {
+		if (cur->key >= key) {
+			retval = (cur->key == key);
+			spin_unlock(&bp->bucket_lock);
+			return retval;
+		}
+		cur = cur->next;
+	}
+	spin_unlock(&bp->bucket_lock);
+	return 0;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Data-Locking Hash Table Search}
 \label{lst:SMPdesign:Data-Locking Hash Table Search}
 \end{listing}
@@ -805,43 +793,39 @@ Listing~\ref{lst:SMPdesign:Reader-Writer-Locking Hash Table Search}
 shows how the hash search might be implemented using reader-writer locking.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 rwlock_t hash_lock;
-  2
-  3 struct hash_table
-  4 {
-  5   long nbuckets;
-  6   struct node **buckets;
-  7 };
-  8
-  9 typedef struct node {
- 10   unsigned long key;
- 11   struct node *next;
- 12 } node_t;
- 13
- 14 int hash_search(struct hash_table *h, long key)
- 15 {
- 16   struct node *cur;
- 17   int retval;
- 18
- 19   read_lock(&hash_lock);
- 20   cur = h->buckets[key % h->nbuckets];
- 21   while (cur != NULL) {
- 22     if (cur->key >= key) {
- 23       retval = (cur->key == key);
- 24       read_unlock(&hash_lock);
- 25       return retval;
- 26     }
- 27     cur = cur->next;
- 28   }
- 29   read_unlock(&hash_lock);
- 30   return 0;
- 31 }
-\end{verbbox}
+\begin{VerbatimL}[commandchars=\\\[\]]
+rwlock_t hash_lock;
+
+struct hash_table
+{
+	long nbuckets;
+	struct node **buckets;
+};
+
+typedef struct node {
+	unsigned long key;
+	struct node *next;
+} node_t;
+
+int hash_search(struct hash_table *h, long key)
+{
+	struct node *cur;
+	int retval;
+
+	read_lock(&hash_lock);
+	cur = h->buckets[key % h->nbuckets];
+	while (cur != NULL) {
+		if (cur->key >= key) {
+			retval = (cur->key == key);
+			read_unlock(&hash_lock);
+			return retval;
+		}
+		cur = cur->next;
+	}
+	read_unlock(&hash_lock);
+	return 0;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Reader-Writer-Locking Hash Table Search}
 \label{lst:SMPdesign:Reader-Writer-Locking Hash Table Search}
 \end{listing}
@@ -868,51 +852,49 @@ In this case, the simpler data-locking approach would be simpler
 and likely perform better.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 struct hash_table
-  2 {
-  3   long nbuckets;
-  4   struct bucket **buckets;
-  5 };
-  6
-  7 struct bucket {
-  8   spinlock_t bucket_lock;
-  9   node_t *list_head;
- 10 };
- 11
- 12 typedef struct node {
- 13   spinlock_t node_lock;
- 14   unsigned long key;
- 15   struct node *next;
- 16 } node_t;
- 17
- 18 int hash_search(struct hash_table *h, long key)
- 19 {
- 20   struct bucket *bp;
- 21   struct node *cur;
- 22   int retval;
- 23
- 24   bp = h->buckets[key % h->nbuckets];
- 25   spin_lock(&bp->bucket_lock);
- 26   cur = bp->list_head;
- 27   while (cur != NULL) {
- 28     if (cur->key >= key) {
- 29       spin_lock(&cur->node_lock);
- 30       spin_unlock(&bp->bucket_lock);
- 31       retval = (cur->key == key);
- 32       spin_unlock(&cur->node_lock);
- 33       return retval;
- 34     }
- 35     cur = cur->next;
- 36   }
- 37   spin_unlock(&bp->bucket_lock);
- 38   return 0;
- 39 }
-\end{verbbox}
+\begin{linelabel}[ln:SMPdesign:Hierarchical-Locking Hash Table Search]
+\begin{VerbatimL}[commandchars=\\\[\]]
+struct hash_table
+{
+	long nbuckets;
+	struct bucket **buckets;
+};
+
+struct bucket {
+	spinlock_t bucket_lock;
+	node_t *list_head;
+};
+
+typedef struct node {
+	spinlock_t node_lock;
+	unsigned long key;
+	struct node *next;
+} node_t;
+
+int hash_search(struct hash_table *h, long key)
+{
+	struct bucket *bp;
+	struct node *cur;
+	int retval;
+
+	bp = h->buckets[key % h->nbuckets];
+	spin_lock(&bp->bucket_lock);
+	cur = bp->list_head;
+	while (cur != NULL) {
+		if (cur->key >= key) {
+			spin_lock(&cur->node_lock);
+			spin_unlock(&bp->bucket_lock);
+			retval = (cur->key == key);\lnlbl[retval]
+			spin_unlock(&cur->node_lock);
+			return retval;
+		}
+		cur = cur->next;
+	}
+	spin_unlock(&bp->bucket_lock);
+	return 0;
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Hierarchical-Locking Hash Table Search}
 \label{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 \end{listing}
@@ -920,7 +902,8 @@ and likely perform better.
 \QuickQuiz{}
 	In what situation would hierarchical locking work well?
 \QuickQuizAnswer{
-	If the comparison on line~31 of
+	If the comparison on
+        line~\ref{ln:SMPdesign:Hierarchical-Locking Hash Table Search:retval} of
 	Listing~\ref{lst:SMPdesign:Hierarchical-Locking Hash Table Search}
 	were replaced by a much heavier-weight operation,
 	then releasing \co{bp->bucket_lock} \emph{might} reduce lock
-- 
2.7.4


