Return-Path: <SRS0=njsb=XW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=PBy2wJ3ql+ay8zkHZ90HHMbXh1KlXf3iZhxF35Wnhv0=;
        b=GY7H7sjFz9PPoJIZXHN91ENsJmRPxk5EQZNrXDFcS4kx9GeY/Su8VFRSgmiZ30DI3k
         I8fMOdwMkB+gLQuSgrMW2b6RdpupgHAhaOTAsr9cjKJPeSXCfXYNduaNkIK604ughlbF
         DtnlUDtnLnoxpBuCBYKUdJhKIKudzAWEED/9ObPFQiKIC4F2r/9pr8Gfw0jkC8CkhmZZ
         uZ9jGI0JHyp6LF4XcBRF1okKxLdNPUjfGkfJb8WaP+HRMO4NzE31mxevdz4Or83iUozo
         jEAJu8GHgp+WmYGOhDQ0JwL57LEuqt1So2bMFenF143Wz/HilA+MTlbyi3IqHk/GzGOP
         d5uA==
Message-ID: <c784e9e1-7cf5-bb7e-18e1-4aa7ae7665ef@gmail.com>
Date: Sun, 17 Jul 2022 13:09:23 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] SMPdesign: Apply \clnref{} scheme to Listing
 6.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Commit a7a722ddae4c ("SMPdesign: Work in the spacetime partitioning
viewpoint") used raw line counts for referencing lines in Listing 6.5.

Embedding line labels in the code snippet and using \clnref{} can
reduce the risk of line-count mismatches in the future.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index d0a9446b78a1..4d93c6e72f0b 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -208,6 +208,7 @@ has now become three statements due to the need to release the
 lock before returning.
 
 \begin{listing}
+\begin{fcvlabel}[ln:SMPdesign:Code-Locking Hash Table Search]
 \begin{VerbatimL}[commandchars=\\\[\]]
 spinlock_t hash_lock;
 
@@ -227,32 +228,35 @@ int hash_search(struct hash_table *h, long key)
 	struct node *cur;
 	int retval;
 
-	spin_lock(&hash_lock);
+	spin_lock(&hash_lock);				\lnlbl[acq]
 	cur = h->buckets[key % h->nbuckets];
 	while (cur != NULL) {
 		if (cur->key >= key) {
 			retval = (cur->key == key);
-			spin_unlock(&hash_lock);
+			spin_unlock(&hash_lock);	\lnlbl[rel1]
 			return retval;
 		}
 		cur = cur->next;
 	}
-	spin_unlock(&hash_lock);
+	spin_unlock(&hash_lock);			\lnlbl[rel2]
 	return 0;
 }
 \end{VerbatimL}
+\end{fcvlabel}
 \caption{Code-Locking Hash Table Search}
 \label{lst:SMPdesign:Code-Locking Hash Table Search}
 \end{listing}
 
-Note that the \co{hash_lock} acquisition and release statements on lines~19, 
-24, and~29 are mediating ownership of the hash table among the CPUs
-wishing to concurrently access that hash table.
+\begin{fcvref}[ln:SMPdesign:Code-Locking Hash Table Search]
+Note that the \co{hash_lock} acquisition and release statements on
+\clnref{acq,rel1,rel2} are mediating ownership of the hash table among
+the CPUs wishing to concurrently access that hash table.
 Another way of looking at this is that \co{hash_lock} is partitioning
 time, thus giving each requesting CPU its own partition of time during
 which it owns this hash table.
 In addition, in a well-designed algorithm, there should be ample partitions
 of time during which no CPU owns this hash table.
+\end{fcvref}
 
 \QuickQuiz{
 	``Partitioning time''?

base-commit: bccd13b1e32770a985dfceb971ddf814785dcd41
-- 
2.25.1

