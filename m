Return-Path: <SRS0=ySBD=ZQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=d783x06/KWkGJ571LWSlM0+NvW2LMXg38/fr+Ovw3Bw=;
        b=pCOEiB5YId7+vZpI/6cnDc3ZXY43bZuBwsFyNejW5PXGQVLkHdnBnlS6sJXpBWiTUm
         ayQyqP3Gca7lSi1zS53nrJds5apu6g4AZPFYG0zjJjUfWK0mWvKSUKNOGdS/1Ywi6sEQ
         wbvDYhwhx5p+dZfQ/3YnrTzG8bhhBqD1qCPce/WlrMVwd6+n3UvHXZIJjtVTueDziqOI
         wPPSXU6pUxWrrHHUve4JSGtMoU3YLIZbOujAeOCh8fQqhOZdbWu7m0Vr/lQOYx4QDqgd
         9eIpH1o3kBfcTaHMCcmzXB68J1KEsE6nXrRmUmrFTsnR3yL6BtrrT7m77AYY83lyB8/c
         95Og==
Message-ID: <f7d486c3-34f4-0908-7221-41ab634378d3@gmail.com>
Date: Tue, 13 Sep 2022 09:18:13 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] SMPdesign: Fix command characters in code snippets
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Some of listings in Chapter 6 use the command character option of
"commandchars=\\\[\]".
This collides with "[" and "]" in the code snippets and removes
them in the resulting listings.

Fix the issue by using "commandchars=\\\@\$" instead and adjusting
the \lnlbl commands.

Reported-by: Elad Lahav <e2lahav@gmail.com>
Fixes: 2c8eae0b8c65 ("SMPdesign: Employ new scheme for inline snippets")
Fixes: 05d62c297542 ("SMPdesign: Apply \clnref{} scheme to Listing 6.5")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 05b86ec7271b..70936c12ce7e 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -134,7 +134,7 @@ careful choice of data structure, can be arbitrarily large.
 On the other hand, if you are not in this happy situation, read on!
 
 \begin{listing}
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimL}[commandchars=\\\@\$]
 struct hash_table
 {
 	long nbuckets;
@@ -209,7 +209,7 @@ lock before returning.
 
 \begin{listing}
 \begin{fcvlabel}[ln:SMPdesign:Code-Locking Hash Table Search]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimL}[commandchars=\\\@\$]
 spinlock_t hash_lock;
 
 struct hash_table
@@ -228,17 +228,17 @@ int hash_search(struct hash_table *h, long key)
 	struct node *cur;
 	int retval;
 
-	spin_lock(&hash_lock);				\lnlbl[acq]
+	spin_lock(&hash_lock);				\lnlbl@acq$
 	cur = h->buckets[key % h->nbuckets];
 	while (cur != NULL) {
 		if (cur->key >= key) {
 			retval = (cur->key == key);
-			spin_unlock(&hash_lock);	\lnlbl[rel1]
+			spin_unlock(&hash_lock);	\lnlbl@rel1$
 			return retval;
 		}
 		cur = cur->next;
 	}
-	spin_unlock(&hash_lock);			\lnlbl[rel2]
+	spin_unlock(&hash_lock);			\lnlbl@rel2$
 	return 0;
 }
 \end{VerbatimL}
@@ -912,7 +912,7 @@ the POSIX implementation described in
 shows how the hash search might be implemented using reader-writer locking.
 
 \begin{listing}
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimL}[commandchars=\\\@\$]
 rwlock_t hash_lock;
 
 struct hash_table
@@ -972,7 +972,7 @@ and likely perform better.
 
 \begin{listing}
 \begin{fcvlabel}[ln:SMPdesign:Hierarchical-Locking Hash Table Search]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimL}[commandchars=\\\@\$]
 struct hash_table
 {
 	long nbuckets;
@@ -1003,7 +1003,7 @@ int hash_search(struct hash_table *h, long key)
 		if (cur->key >= key) {
 			spin_lock(&cur->node_lock);
 			spin_unlock(&bp->bucket_lock);
-			retval = (cur->key == key);\lnlbl[retval]
+			retval = (cur->key == key);\lnlbl@retval$
 			spin_unlock(&cur->node_lock);
 			return retval;
 		}

base-commit: 34400fe10ca37b884ee64f7bd2b93d5cccfe675d
-- 
2.25.1

