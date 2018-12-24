Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z9aEnkcz83OLGi8JvyBo3huQFDIObTqJS9IaQibMOgc=;
        b=C3bRth8ES1b7GdwNV6TeBvs5zIDO0XWCCpcJA2T5/Pyug6G8yPjyBMIsBJ13cPtVL/
         b4xQX3U9uxvBO1jpGiyVb435vH2tKQWEZxPuIbvt2SB4OG7uGYEsyOKtr9HH7W6axxU9
         lvCfriPXEeE2uMyhOfcjEyN7NBrm4aN6d/DrU/rHcpJFXWYLKRkDxx/MAsBvrO8aqIBQ
         VhF35i93pN1okJ3MXdLrXjwtbnTGOGSwhspgi2OZsN6B65q53bJoDgkIQbBdMus0EGYl
         xfr7XUnyZ0ZwmXZO8Xa9NLK5/6mEKXsAn0pueGiRPxT976PRP0wf8njELkGjC4BXvOtg
         dG6w==
Subject: [PATCH 06/11] datastruct: Employ new scheme for snippets of
 hash_bkt.c
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1ba6433f-593d-d768-ccab-0b12645635b9@gmail.com>
Date: Tue, 25 Dec 2018 00:00:19 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4e71dc2a3c253e78785f5320f8dd9419d968bf25 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 15:13:01 +0900
Subject: [PATCH 06/11] datastruct: Employ new scheme for snippets of hash_bkt.c

Also update text to reflect the change in struct hashtab adding
ht_cmp field, which was done in commit a988f7798f75 ("Define
comparison function at initialization").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_bkt.c |  96 +++++++++-------
 datastruct/datastruct.tex              | 193 +++++++++------------------------
 2 files changed, 111 insertions(+), 178 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hash_bkt.c b/CodeSamples/datastruct/hash/hash_bkt.c
index af7b2dc..10faab9 100644
--- a/CodeSamples/datastruct/hash/hash_bkt.c
+++ b/CodeSamples/datastruct/hash/hash_bkt.c
@@ -21,38 +21,45 @@
 #define _LGPL_SOURCE
 #include "../../api.h"
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt:struct,commandchars=\\\@\$]
 /* Hash-table element to be included in structures in a hash table. */
-struct ht_elem {
+struct ht_elem {				//\lnlbl{elem:b}
 	struct cds_list_head hte_next;
 	unsigned long hte_hash;
-};
+};						//\lnlbl{elem:e}
 
 /* Hash-table bucket element. */
-struct ht_bucket {
+struct ht_bucket {				//\lnlbl{bucket:b}
 	struct cds_list_head htb_head;
 	spinlock_t htb_lock;
-};
+};						//\lnlbl{bucket:e}
 
 /* Top-level hash-table data structure, including buckets. */
-struct hashtab {
+struct hashtab {					//\lnlbl{tab:b}
 	unsigned long ht_nbuckets;
 	int (*ht_cmp)(struct ht_elem *htep, void *key);
 	struct ht_bucket ht_bkt[0];
-};
+};							//\lnlbl{tab:e}
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt:map_lock,commandchars=\!\@\$]
 /* Map from hash value to corresponding bucket. */
-#define HASH2BKT(htp, h) (&(htp)->ht_bkt[h % (htp)->ht_nbuckets])
+#define HASH2BKT(htp, h) /* \lnlbl{map:b} */\
+	(&(htp)->ht_bkt[h % (htp)->ht_nbuckets])	//\lnlbl{map:e}
 
 /* Underlying lock/unlock functions. */
-static void hashtab_lock(struct hashtab *htp, unsigned long hash)
+static void hashtab_lock(struct hashtab *htp,
+                         unsigned long hash)
 {
 	spin_lock(&HASH2BKT(htp, hash)->htb_lock);
 }
 
-static void hashtab_unlock(struct hashtab *htp, unsigned long hash)
+static void hashtab_unlock(struct hashtab *htp,
+                           unsigned long hash)
 {
 	spin_unlock(&HASH2BKT(htp, hash)->htb_lock);
 }
+//\end{snippet}
 
 /* Read-side lock/unlock functions. */
 static void hashtab_lock_lookup(struct hashtab *htp, unsigned long hash)
@@ -83,6 +90,7 @@ void hashtab_lookup_done(struct ht_elem *htep)
 {
 }
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt:lookup,commandchars=\\\[\]]
 /*
  * Look up a key.  Caller must have acquired either a read-side or update-side
  * lock via either hashtab_lock_lookup() or hashtab_lock_mod().  Note that
@@ -92,30 +100,35 @@ void hashtab_lookup_done(struct ht_elem *htep)
  * Note that the caller is responsible for mapping from whatever type
  * of key is in use to an unsigned long, passed in via "hash".
  */
-struct ht_elem *hashtab_lookup(struct hashtab *htp, unsigned long hash,
-			       void *key)
+struct ht_elem *
+hashtab_lookup(struct hashtab *htp, unsigned long hash,
+               void *key)
 {
-	struct ht_elem *htep;
-
-	cds_list_for_each_entry(htep,
-				&HASH2BKT(htp, hash)->htb_head,
-				hte_next) {
-		if (htep->hte_hash != hash)
-			continue;
-		if (htp->ht_cmp(htep, key))
-			return htep;
-	}
-	return NULL;
+	struct ht_bucket *htb;
+	struct ht_elem   *htep;
+
+	htb = HASH2BKT(htp, hash);			//\lnlbl{map}
+	cds_list_for_each_entry(htep, &htb->htb_head, hte_next) { //\lnlbl{loop:b}
+		if (htep->hte_hash != hash)		//\lnlbl{hashmatch}
+			continue;			//\lnlbl{next}
+		if (htp->ht_cmp(htep, key))		//\lnlbl{keymatch}
+			return htep;			//\lnlbl{return}
+	}						//\lnlbl{loop:e}
+	return NULL;					//\lnlbl{ret_NULL}
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt:add_del,commandchars=\\\[\]]
 /*
  * Add an element to the hash table.  Caller must have acquired the
  * update-side lock via hashtab_lock_mod().
  */
-void hashtab_add(struct hashtab *htp, unsigned long hash, struct ht_elem *htep)
+void hashtab_add(struct hashtab *htp, unsigned long hash,
+                 struct ht_elem *htep)
 {
-	htep->hte_hash = hash;
-	cds_list_add(&htep->hte_next, &HASH2BKT(htp, hash)->htb_head);
+	htep->hte_hash = hash;				//\lnlbl{add:set}
+	cds_list_add(&htep->hte_next,			//\lnlbl{add:add:b}
+	             &HASH2BKT(htp, hash)->htb_head);	//\lnlbl{add:add:e}
 }
 
 /*
@@ -126,36 +139,41 @@ void hashtab_del(struct ht_elem *htep)
 {
 	cds_list_del_init(&htep->hte_next);
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt:alloc_free,commandchars=\\\@\$]
 /*
  * Allocate a new hash table with the specified number of buckets.
  */
-struct hashtab *hashtab_alloc(unsigned long nbuckets,
-			      int (*cmp)(struct ht_elem *htep, void *key))
+struct hashtab *
+hashtab_alloc(unsigned long nbuckets,
+              int (*cmp)(struct ht_elem *htep, void *key))
 {
 	struct hashtab *htp;
 	int i;
 
-	htp = malloc(sizeof(*htp) + nbuckets * sizeof(struct ht_bucket));
-	if (htp == NULL)
-		return NULL;
-	htp->ht_nbuckets = nbuckets;
-	htp->ht_cmp = cmp;
-	for (i = 0; i < nbuckets; i++) {
-		CDS_INIT_LIST_HEAD(&htp->ht_bkt[i].htb_head);
-		spin_lock_init(&htp->ht_bkt[i].htb_lock);
-	}
-	return htp;
+	htp = malloc(sizeof(*htp) +				//\lnlbl{alloc:alloc:b}
+	             nbuckets * sizeof(struct ht_bucket));	//\lnlbl{alloc:alloc:e}
+	if (htp == NULL)					//\lnlbl{alloc:chk_NULL}
+		return NULL;					//\lnlbl{alloc:ret_NULL}
+	htp->ht_nbuckets = nbuckets;				//\lnlbl{alloc:set_nbck}
+	htp->ht_cmp = cmp;					//\lnlbl{alloc:set_cmp}
+	for (i = 0; i < nbuckets; i++) {			//\lnlbl{alloc:loop:b}
+		CDS_INIT_LIST_HEAD(&htp->ht_bkt[i].htb_head);	//\lnlbl{alloc:init_head}
+		spin_lock_init(&htp->ht_bkt[i].htb_lock);	//\lnlbl{alloc:init_lock}
+	}							//\lnlbl{alloc:loop:e}
+	return htp;						//\lnlbl{alloc:return}
 }
 
 /*
  * Free a hash table.  It is the caller's responsibility to ensure that it
  * is empty and no longer in use.
  */
-void hashtab_free(struct hashtab *htp)
+void hashtab_free(struct hashtab *htp)			//\lnlbl{free:b}
 {
 	free(htp);
-}
+}							//\lnlbl{free:e}
+//\end{snippet}
 
 #ifdef TEST_HASH
 #include "hashtorture.h"
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index b3068d4..65eb650 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -141,26 +141,7 @@ offers excellent scalability.
 \label{sec:datastruct:Hash-Table Implementation}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct ht_elem {
- 2   struct cds_list_head hte_next;
- 3   unsigned long hte_hash;
- 4 };
- 5 
- 6 struct ht_bucket {
- 7   struct cds_list_head htb_head;
- 8   spinlock_t htb_lock;
- 9 };
-10 
-11 struct hashtab {
-12   unsigned long ht_nbuckets;
-13   struct ht_bucket ht_bkt[0];
-14 };
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt@struct.fcv}
 \caption{Hash-Table Data Structures}
 \label{lst:datastruct:Hash-Table Data Structures}
 \end{listing}
@@ -172,21 +153,25 @@ offers excellent scalability.
 \label{fig:datastruct:Hash-Table Data-Structure Diagram}
 \end{figure}
 
+\begin{lineref}[ln:datastruct:hash_bkt:struct]
 Listing~\ref{lst:datastruct:Hash-Table Data Structures}
 (\path{hash_bkt.c})
 shows a set of data structures used in a simple fixed-sized hash
 table using chaining and per-hash-bucket locking, and
 Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
 diagrams how they fit together.
-The \co{hashtab} structure (lines~11-14 in
+The \co{hashtab} structure (lines~\lnref{tab:b}-\lnref{tab:e} in
 Listing~\ref{lst:datastruct:Hash-Table Data Structures})
-contains four \co{ht_bucket} structures (lines~6-9 in
+contains four \co{ht_bucket} structures
+(lines~\lnref{bucket:b}-\lnref{bucket:e} in
 Listing~\ref{lst:datastruct:Hash-Table Data Structures}),
-with the \co{->ht_nbuckets} field controlling the number of buckets.
+with the \co{->ht_nbuckets} field controlling the number of buckets
+and the \co{->ht_cmp} field holding the pointer to key-comparison
+function.
 Each such bucket contains a list header \co{->htb_head} and
 a lock \co{->htb_lock}.
 The list headers chain \co{ht_elem} structures
-(lines~1-4 in
+(lines~\lnref{elem:b}-\lnref{elem:e} in
 Listing~\ref{lst:datastruct:Hash-Table Data Structures})
 through their
 \co{->hte_next} fields, and each \co{ht_elem} structure also caches
@@ -194,99 +179,64 @@ the corresponding element's hash value in the \co{->hte_hash} field.
 The \co{ht_elem} structure would be included in the larger structure
 being placed in the hash table, and this larger structure might contain
 a complex key.
+\end{lineref}
 
 The diagram shown in
 Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
 has bucket~0 with two elements and bucket~2 with one.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 #define HASH2BKT(htp, h) \
- 2   (&(htp)->ht_bkt[h % (htp)->ht_nbuckets])
- 3 
- 4 static void hashtab_lock(struct hashtab *htp,
- 5                          unsigned long hash)
- 6 {
- 7   spin_lock(&HASH2BKT(htp, hash)->htb_lock);
- 8 }
- 9 
-10 static void hashtab_unlock(struct hashtab *htp,
-11                            unsigned long hash)
-12 {
-13   spin_unlock(&HASH2BKT(htp, hash)->htb_lock);
-14 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt@map_lock.fcv}
 \caption{Hash-Table Mapping and Locking}
 \label{lst:datastruct:Hash-Table Mapping and Locking}
 \end{listing}
 
+\begin{lineref}[ln:datastruct:hash_bkt:map_lock:map]
 Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}
 shows mapping and locking functions.
-Lines~1 and~2 show the macro \co{HASH2BKT()}, which maps from a hash value
+Lines~\lnref{b} and~\lnref{e}
+show the macro \co{HASH2BKT()}, which maps from a hash value
 to the corresponding \co{ht_bucket} structure.
 This macro uses a simple modulus: if more aggressive hashing is required,
 the caller needs to implement it when mapping from key to hash value.
 The remaining two functions acquire and release the \co{->htb_lock}
 corresponding to the specified hash value.
+\end{lineref}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct ht_elem *
- 2 hashtab_lookup(struct hashtab *htp,
- 3                unsigned long hash,
- 4                void *key,
- 5                int (*cmp)(struct ht_elem *htep,
- 6                           void *key))
- 7 {
- 8   struct ht_bucket *htb;
- 9   struct ht_elem *htep;
-10 
-11   htb = HASH2BKT(htp, hash);
-12   cds_list_for_each_entry(htep,
-13                           &htb->htb_head,
-14                           hte_next) {
-15     if (htep->hte_hash != hash)
-16       continue;
-17     if (cmp(htep, key))
-18       return htep;
-19   }
-20   return NULL;
-21 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt@lookup.fcv}
 \caption{Hash-Table Lookup}
 \label{lst:datastruct:Hash-Table Lookup}
 \end{listing}
 
+\begin{lineref}[ln:datastruct:hash_bkt:lookup]
 Listing~\ref{lst:datastruct:Hash-Table Lookup}
 shows \co{hashtab_lookup()},
 which returns a pointer to the element with the specified hash and key if it
 exists, or \co{NULL} otherwise.
 This function takes both a hash value and a pointer to the key because
 this allows users of this function to use arbitrary keys and
-arbitrary hash functions, with the key-comparison function passed in via
-\co{cmp()}, in a manner similar to \co{qsort()}.
-Line~11 maps from the hash value to a pointer to the corresponding
+arbitrary hash functions.
+Line~\lnref{map} maps from the hash value to a pointer to the corresponding
 hash bucket.
-Each pass through the loop spanning lines~12-19 examines one element
+Each pass through the loop spanning
+lines~\lnref{loop:b}-\lnref{loop:e} examines one element
 of the bucket's hash chain.
-Line~15 checks to see if the hash values match, and if not, line~16
+Line~\lnref{hashmatch} checks to see if the hash values match, and if not,
+line~\lnref{next}
 proceeds to the next element.
-Line~17 checks to see if the actual key matches, and if so,
-line~18 returns a pointer to the matching element.
-If no element matches, line~20 returns \co{NULL}.
+Line~\lnref{keymatch} checks to see if the actual key matches, and if so,
+line~\lnref{return} returns a pointer to the matching element.
+If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
+\end{lineref}
 
 \QuickQuiz{}
-	But isn't the double comparison on lines~15-18 in
+	\begin{lineref}[ln:datastruct:hash_bkt:lookup]
+	But isn't the double comparison on
+	lines~\lnref{hashmatch}-\lnref{return} in
 	Listing~\ref{lst:datastruct:Hash-Table Lookup} inefficient
 	in the case where the key fits into an unsigned long?
+	\end{lineref}
 \QuickQuizAnswer{
 	Indeed it is!
 	However, hash tables quite frequently store information with
@@ -298,26 +248,7 @@ If no element matches, line~20 returns \co{NULL}.
 } \QuickQuizEnd
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 void
- 2 hashtab_add(struct hashtab *htp,
- 3             unsigned long hash,
- 4             struct ht_elem *htep)
- 5 {
- 6   htep->hte_hash = hash;
- 7   cds_list_add(&htep->hte_next,
- 8                &HASH2BKT(htp, hash)->htb_head);
- 9 }
-10 
-11 void hashtab_del(struct ht_elem *htep)
-12 {
-13   cds_list_del_init(&htep->hte_next);
-14 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt@add_del.fcv}
 \caption{Hash-Table Modification}
 \label{lst:datastruct:Hash-Table Modification}
 \end{listing}
@@ -326,9 +257,11 @@ Listing~\ref{lst:datastruct:Hash-Table Modification}
 shows the \co{hashtab_add()} and \co{hashtab_del()} functions
 that add and delete elements from the hash table, respectively.
 
+\begin{lineref}[ln:datastruct:hash_bkt:add_del:add]
 The \co{hashtab_add()} function simply sets the element's hash
-value on line~6, then adds it to the corresponding bucket on
-lines~7 and~8.
+value on line~\lnref{set}, then adds it to the corresponding bucket on
+lines~\lnref{add:b} and~\lnref{add:e}.
+\end{lineref}
 The \co{hashtab_del()} function simply removes the specified element
 from whatever hash chain it is on, courtesy of the doubly linked
 nature of the hash-chain lists.
@@ -338,35 +271,7 @@ or modifying this same bucket, for example, by invoking
 \co{hashtab_lock()} beforehand.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct hashtab *
- 2 hashtab_alloc(unsigned long nbuckets)
- 3 {
- 4   struct hashtab *htp;
- 5   int i;
- 6 
- 7   htp = malloc(sizeof(*htp) +
- 8                nbuckets *
- 9                sizeof(struct ht_bucket));
-10   if (htp == NULL)
-11     return NULL;
-12   htp->ht_nbuckets = nbuckets;
-13   for (i = 0; i < nbuckets; i++) {
-14     CDS_INIT_LIST_HEAD(&htp->ht_bkt[i].htb_head);
-15     spin_lock_init(&htp->ht_bkt[i].htb_lock);
-16   }
-17   return htp;
-18 }
-19 
-20 void hashtab_free(struct hashtab *htp)
-21 {
-22   free(htp);
-23 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt@alloc_free.fcv}
 \caption{Hash-Table Allocation and Free}
 \label{lst:datastruct:Hash-Table Allocation and Free}
 \end{listing}
@@ -374,14 +279,24 @@ or modifying this same bucket, for example, by invoking
 Listing~\ref{lst:datastruct:Hash-Table Allocation and Free}
 shows \co{hashtab_alloc()} and \co{hashtab_free()},
 which do hash-table allocation and freeing, respectively.
-Allocation begins on lines~7-9 with allocation of the underlying memory.
-If line~10 detects that memory has been exhausted, line~11 returns
+\begin{lineref}[ln:datastruct:hash_bkt:alloc_free:alloc]
+Allocation begins on
+lines~\lnref{alloc:b}-\lnref{alloc:e} with allocation of the underlying memory.
+If line~\lnref{chk_NULL} detects that memory has been exhausted,
+line~\lnref{ret_NULL} returns
 \co{NULL} to the caller.
-Otherwise, line~12 initializes the number of buckets, and the loop
-spanning lines~13-16 initializes the buckets themselves,
-including the chain list header on line~14 and the lock on line~15.
-Finally, line~17 returns a pointer to the newly allocated hash table.
-The \co{hashtab_free()} function on lines~20-23 is straightforward.
+Otherwise, lines~\lnref{set_nbck} and~\lnref{set_cmp} initialize
+the number of buckets and the pointer to key-comparison function,
+and the loop
+spanning lines~\lnref{loop:b}-\lnref{loop:e} initializes the buckets themselves,
+including the chain list header on
+line~\lnref{init_head} and the lock on line~\lnref{init_lock}.
+Finally, line~\lnref{return} returns a pointer to the newly allocated hash table.
+\end{lineref}
+\begin{lineref}[ln:datastruct:hash_bkt:alloc_free:free]
+The \co{hashtab_free()} function on
+lines~\lnref{b}-\lnref{e} is straightforward.
+\end{lineref}
 
 \subsection{Hash-Table Performance}
 \label{sec:datastruct:Hash-Table Performance}
-- 
2.7.4


