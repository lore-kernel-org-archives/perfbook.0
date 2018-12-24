Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sHyZ8xq30qDWu2Ti9yNSFE55nCKETDzlmiPlZS2l8ZU=;
        b=str0w9W87giT77sEf8CYQQWZPLDe7WWy4J2B3tZU2OCoZofo0umMqAWfjx5kwrQ+iM
         CUp/Errr8Is859kfQXnLiM9Wt5hFPu2AnBpzJdOmqMUBvyStV0QzQr8UhpUltqT2wGEF
         DlWHZyrJvFgLxZiYf+2RpaXZVNjEKzn9/DVHoK+dV2kYhAjVguB9zN3rau8zp5BKNpQE
         K9Fv5WluRSdsANjKPJ7oJPGuie1xOZT91zugkEVZM2No3bO+gXKxaWqVuWc71CLNKLi5
         h5Zu0d2K8cbP3g5yq+ye3nFIcRYkApRmkwUD1o0gYJuLbXNl62PiZbyRGWMrEIzQKquw
         SA6w==
Subject: [PATCH 08/11] datastruct: Employ new scheme for snippets of
 hash_bkt_rcu and hash_resize
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <61e12b0c-c056-108d-5b30-271b29d064a0@gmail.com>
Date: Tue, 25 Dec 2018 00:02:57 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e94531367e4c5bc66a7cabe2e1e41e80dedf5a53 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 22:58:09 +0900
Subject: [PATCH 08/11] datastruct: Employ new scheme for snippets of hash_bkt_rcu and hash_resize

Other than mechanical conversion, fix cross reference to
Listing 10.13 in Quick Quiz 10.13.

Also there appears an smp_mb() in Lising 10.10, which has no
explanation in the text. The memory barrier was added in commit
1daf3670c304 ("Fix resizable hash table memory ordering") along
with a synchronize_rcu() in hashtab_resize().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_bkt_rcu.c |  33 +-
 CodeSamples/datastruct/hash/hash_resize.c  | 232 ++++++++------
 datastruct/datastruct.tex                  | 492 ++++++++---------------------
 3 files changed, 284 insertions(+), 473 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hash_bkt_rcu.c b/CodeSamples/datastruct/hash/hash_bkt_rcu.c
index 45abf03..bb74087 100644
--- a/CodeSamples/datastruct/hash/hash_bkt_rcu.c
+++ b/CodeSamples/datastruct/hash/hash_bkt_rcu.c
@@ -65,16 +65,20 @@ static void hashtab_unlock(struct hashtab *htp, unsigned long hash)
 	spin_unlock(&HASH2BKT(htp, hash)->htb_lock);
 }
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt_rcu:lock_unlock,commandchars=\\\[\]]
 /* Read-side lock/unlock functions. */
-static void hashtab_lock_lookup(struct hashtab *htp, unsigned long hash)
+static void hashtab_lock_lookup(struct hashtab *htp,
+                                unsigned long hash)
 {
 	rcu_read_lock();
 }
 
-static void hashtab_unlock_lookup(struct hashtab *htp, unsigned long hash)
+static void hashtab_unlock_lookup(struct hashtab *htp,
+                                  unsigned long hash)
 {
 	rcu_read_unlock();
 }
+//\end{snippet}
 
 /* Update-side lock/unlock functions. */
 static void hashtab_lock_mod(struct hashtab *htp, unsigned long hash)
@@ -94,6 +98,7 @@ void hashtab_lookup_done(struct ht_elem *htep)
 {
 }
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt_rcu:lookup,commandchars=\\\[\]]
 /*
  * Look up a key.  Caller must have acquired either a read-side or update-side
  * lock via either hashtab_lock_lookup() or hashtab_lock_mod().  Note that
@@ -103,13 +108,17 @@ void hashtab_lookup_done(struct ht_elem *htep)
  * Note that the caller is responsible for mapping from whatever type
  * of key is in use to an unsigned long, passed in via "hash".
  */
-struct ht_elem *hashtab_lookup(struct hashtab *htp, unsigned long hash,
-			       void *key)
+struct ht_elem *hashtab_lookup(struct hashtab *htp,
+                               unsigned long hash,
+                               void *key)
 {
-	struct ht_elem *htep;
+	struct ht_bucket *htb;
+	struct ht_elem  *htep;
 
-	cds_list_for_each_entry_rcu(htep, &HASH2BKT(htp, hash)->htb_head,
-				    hte_next) {
+	htb = HASH2BKT(htp, hash);
+	cds_list_for_each_entry_rcu(htep,
+	                            &htb->htb_head,
+	                            hte_next) {
 		if (htep->hte_hash != hash)
 			continue;
 		if (htp->ht_cmp(htep, key))
@@ -117,15 +126,20 @@ struct ht_elem *hashtab_lookup(struct hashtab *htp, unsigned long hash,
 	}
 	return NULL;
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_bkt_rcu:add_del,commandchars=\\\[\]]
 /*
  * Add an element to the hash table.  Caller must have acquired the
  * update-side lock via hashtab_lock_mod().
  */
-void hashtab_add(struct hashtab *htp, unsigned long hash, struct ht_elem *htep)
+void hashtab_add(struct hashtab *htp,
+                 unsigned long hash,
+                 struct ht_elem *htep)
 {
 	htep->hte_hash = hash;
-	cds_list_add_rcu(&htep->hte_next, &HASH2BKT(htp, hash)->htb_head);
+	cds_list_add_rcu(&htep->hte_next,
+	                 &HASH2BKT(htp, hash)->htb_head);
 }
 
 /*
@@ -136,6 +150,7 @@ void hashtab_del(struct ht_elem *htep)
 {
 	cds_list_del_rcu(&htep->hte_next);
 }
+//\end{snippet}
 
 /*
  * Allocate a new hash table with the specified number of buckets.
diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index ab76b23..285075e 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -25,10 +25,11 @@
 #include <urcu.h>
 #include "../../api.h"
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:data,commandchars=\\\@\$]
 /* Hash-table element to be included in structures in a hash table. */
 struct ht_elem {
 	struct rcu_head rh;
-	struct cds_list_head hte_next[2];
+	struct cds_list_head hte_next[2];		//\lnlbl{ht_elem:next}
 	unsigned long hte_hash;
 };
 
@@ -39,23 +40,26 @@ struct ht_bucket {
 };
 
 /* Hash-table instance, duplicated at resize time. */
-struct ht {
-	long ht_nbuckets;
-	long ht_resize_cur;
-	struct ht *ht_new;
-	int ht_idx;
-	void *ht_hash_private;
-	int (*ht_cmp)(void *hash_private, struct ht_elem *htep, void *key);
+struct ht {						//\lnlbl{ht:b}
+	long ht_nbuckets;				//\lnlbl{ht:nbuckets}
+	long ht_resize_cur;				//\lnlbl{ht:resize_cur}
+	struct ht *ht_new;				//\lnlbl{ht:new}
+	int ht_idx;					//\lnlbl{ht:idx}
+	void *ht_hash_private;				//\lnlbl{ht:hash_private}
+	int (*ht_cmp)(void *hash_private,
+	              struct ht_elem *htep,
+	              void *key);
 	long (*ht_gethash)(void *hash_private, void *key);
-	void *(*ht_getkey)(struct ht_elem *htep);
-	struct ht_bucket ht_bkt[0];
-};
+	void *(*ht_getkey)(struct ht_elem *htep);	//\lnlbl{ht:getkey}
+	struct ht_bucket ht_bkt[0];			//\lnlbl{ht:bkt}
+};							//\lnlbl{ht:e}
 
 /* Top-level hash-table data structure, including buckets. */
-struct hashtab {
+struct hashtab {					//\lnlbl{hashtab:b}
 	struct ht *ht_cur;
 	spinlock_t ht_lock;
-};
+};							//\lnlbl{hashtab:e}
+//\end{snippet}
 
 /* Allocate a hash-table instance. */
 struct ht *
@@ -114,28 +118,34 @@ void hashtab_free(struct hashtab *htp_master)
 	free(htp_master);
 }
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:get_bucket,commandchars=\\\@\$]
 /* Get hash bucket corresponding to key, ignoring the possibility of resize. */
-static struct ht_bucket *
+static struct ht_bucket *				//\lnlbl{single:b}
 ht_get_bucket_single(struct ht *htp, void *key, long *b)
 {
-	*b = htp->ht_gethash(htp->ht_hash_private, key) % htp->ht_nbuckets;
-	return &htp->ht_bkt[*b];
-}
+	*b = htp->ht_gethash(htp->ht_hash_private,	//\lnlbl{single:gethash:b}
+	                     key) % htp->ht_nbuckets;	//\lnlbl{single:gethash:e}
+	return &htp->ht_bkt[*b];			//\lnlbl{single:return}
+}							//\lnlbl{single:e}
 
 /* Get hash bucket correesponding to key, accounting for resize. */
-static struct ht_bucket *ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
+static struct ht_bucket *				//\lnlbl{b}
+ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
 {
-	struct ht_bucket *htbp = ht_get_bucket_single(*htp, key, b);
+	struct ht_bucket *htbp;
 
-	if (*b <= (*htp)->ht_resize_cur) {
+	htbp = ht_get_bucket_single(*htp, key, b);	//\lnlbl{call_single}
+								//\fcvexclude
+	if (*b <= (*htp)->ht_resize_cur) {		//\lnlbl{resized}
 		smp_mb(); /* order ->ht_resize_cur before ->ht_new. */
-		*htp = (*htp)->ht_new;
-		htbp = ht_get_bucket_single(*htp, key, b);
+		*htp = (*htp)->ht_new;			//\lnlbl{newtable}
+		htbp = ht_get_bucket_single(*htp, key, b); //\lnlbl{newbucket}
 	}
-	if (i)
-		*i = (*htp)->ht_idx;
-	return htbp;
-}
+	if (i)						//\lnlbl{chk_i}
+		*i = (*htp)->ht_idx;			//\lnlbl{set_idx}
+	return htbp;					//\lnlbl{return}
+}							//\lnlbl{e}
+//\end{snippet}
 
 /* Read-side lock/unlock functions. */
 static void hashtab_lock_lookup(struct hashtab *htp_master, void *key)
@@ -148,35 +158,41 @@ static void hashtab_unlock_lookup(struct hashtab *htp_master, void *key)
 	rcu_read_unlock();
 }
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:lock_unlock_mod,commandchars=\\\[\]]
 /* Update-side lock/unlock functions. */
-static void hashtab_lock_mod(struct hashtab *htp_master, void *key)
+static void						//\lnlbl{lock:b}
+hashtab_lock_mod(struct hashtab *htp_master, void *key)
 {
 	long b;
 	struct ht *htp;
 	struct ht_bucket *htbp;
 	struct ht_bucket *htbp_new;
 
-	rcu_read_lock();
-	htp = rcu_dereference(htp_master->ht_cur);
-	htbp = ht_get_bucket_single(htp, key, &b);
-	spin_lock(&htbp->htb_lock);
-	if (b > htp->ht_resize_cur)
-		return;
-	htp = htp->ht_new;
-	htbp_new = ht_get_bucket_single(htp, key, &b);
-	spin_lock(&htbp_new->htb_lock);
-	spin_unlock(&htbp->htb_lock);
-}
-
-static void hashtab_unlock_mod(struct hashtab *htp_master, void *key)
+	rcu_read_lock();				//\lnlbl{lock:rcu_lock}
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{lock:refhashtbl}
+	htbp = ht_get_bucket_single(htp, key, &b);	//\lnlbl{lock:refbucket}
+	spin_lock(&htbp->htb_lock);			//\lnlbl{lock:acq_bucket}
+	if (b > htp->ht_resize_cur)			//\lnlbl{lock:chk_resz_dist}
+		return;					//\lnlbl{lock:fastret}
+	htp = htp->ht_new;				//\lnlbl{lock:new_hashtbl}
+	htbp_new = ht_get_bucket_single(htp, key, &b);	//\lnlbl{lock:get_newbucket}
+	spin_lock(&htbp_new->htb_lock);			//\lnlbl{lock:acq_newbucket}
+	spin_unlock(&htbp->htb_lock);			//\lnlbl{lock:rel_oldbucket}
+}							//\lnlbl{lock:e}
+
+static void						//\lnlbl{unlock:b}
+hashtab_unlock_mod(struct hashtab *htp_master, void *key)
 {
 	long b;
-	struct ht *htp = rcu_dereference(htp_master->ht_cur);
-	struct ht_bucket *htbp = ht_get_bucket(&htp, key, &b, NULL);
+	struct ht *htp;
+	struct ht_bucket *htbp;
 
-	spin_unlock(&htbp->htb_lock);
-	rcu_read_unlock();
-}
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{unlock:get_curtbl}
+	htbp = ht_get_bucket(&htp, key, &b, NULL);	//\lnlbl{unlock:get_curbucket}
+	spin_unlock(&htbp->htb_lock);			//\lnlbl{unlock:rel_curbucket}
+	rcu_read_unlock();				//\lnlbl{unlock:rcu_unlock}
+}							//\lnlbl{unlock:e}
+//\end{snippet}
 
 /*
  * Finished using a looked up hashtable element.
@@ -185,63 +201,74 @@ void hashtab_lookup_done(struct ht_elem *htep)
 {
 }
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:access,commandchars=\\\@\$]
 /*
  * Look up a key.  Caller must have acquired either a read-side or update-side
  * lock via either hashtab_lock_lookup() or hashtab_lock_mod().  Note that
  * the return is a pointer to the ht_elem: Use offset_of() or equivalent
  * to get a pointer to the full data structure.
  */
-struct ht_elem *hashtab_lookup(struct hashtab *htp_master, void *key)
+struct ht_elem *					//\lnlbl{lookup:b}
+hashtab_lookup(struct hashtab *htp_master, void *key)
 {
 	long b;
 	int i;
-	struct ht *htp = rcu_dereference(htp_master->ht_cur);
+	struct ht *htp;
 	struct ht_elem *htep;
-	struct ht_bucket *htbp = ht_get_bucket(&htp, key, &b, &i);
+	struct ht_bucket *htbp;
 
-	cds_list_for_each_entry_rcu(htep, &htbp->htb_head, hte_next[i]) {
-		if (htp->ht_cmp(htp->ht_hash_private, htep, key))
-			return htep;
-	}
-	return NULL;
-}
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{lookup:get_curtbl}
+	htbp = ht_get_bucket(&htp, key, &b, &i);	//\lnlbl{lookup:get_curbucket}
+	cds_list_for_each_entry_rcu(htep,		//\lnlbl{lookup:loop:b}
+	                            &htbp->htb_head,
+	                            hte_next[i]) {
+		if (htp->ht_cmp(htp->ht_hash_private, htep, key)) //\lnlbl{lookup:match}
+			return htep;			//\lnlbl{lookup:ret_match}
+	}						//\lnlbl{lookup:loop:e}
+	return NULL;					//\lnlbl{lookup:ret_NULL}
+}							//\lnlbl{lookup:e}
 
 /*
  * Add an element to the hash table.  Caller must have acquired the
  * update-side lock via hashtab_lock_mod().
  */
-void hashtab_add(struct hashtab *htp_master, struct ht_elem *htep)
+void hashtab_add(struct hashtab *htp_master,		//\lnlbl{add:b}
+                 struct ht_elem *htep)
 {
 	long b;
 	int i;
-	struct ht *htp = rcu_dereference(htp_master->ht_cur);
-	struct ht_bucket *htbp = ht_get_bucket(&htp, htp->ht_getkey(htep),
-					       &b, &i);
+	struct ht *htp;
+	struct ht_bucket *htbp;
 
-	cds_list_add_rcu(&htep->hte_next[i], &htbp->htb_head);
-}
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{add:get_curtbl}
+	htbp = ht_get_bucket(&htp, htp->ht_getkey(htep), &b, &i); //\lnlbl{add:get_curbucket}
+	cds_list_add_rcu(&htep->hte_next[i], &htbp->htb_head); //\lnlbl{add:add}
+}							//\lnlbl{add:e}
 
 /*
  * Remove the specified element from the hash table.  Caller must have
  * acquired the update-side lock via hashtab_lock_mod().
  */
-void hashtab_del(struct hashtab *htp_master, struct ht_elem *htep)
+void hashtab_del(struct hashtab *htp_master,		//\lnlbl{del:b}
+                 struct ht_elem *htep)
 {
 	long b;
 	int i;
-	struct ht *htp = rcu_dereference(htp_master->ht_cur);
+	struct ht *htp;
 
-	(void)ht_get_bucket(&htp, htp->ht_getkey(htep), &b, &i);
-	cds_list_del_rcu(&htep->hte_next[i]);
-}
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{del:get_curtbl}
+	(void)ht_get_bucket(&htp, htp->ht_getkey(htep), &b, &i); //\lnlbl{del:get_curidx}
+	cds_list_del_rcu(&htep->hte_next[i]);		//\lnlbl{del:del}
+}							//\lnlbl{del:e}
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$]
 /* Resize a hash table. */
-int
-hashtab_resize(struct hashtab *htp_master,
-	       unsigned long nbuckets, void *hash_private,
-	       int (*cmp)(void *hash_private, struct ht_elem *htep, void *key),
-	       long (*gethash)(void *hash_private, void *key),
-	       void *(*getkey)(struct ht_elem *htep))
+int hashtab_resize(struct hashtab *htp_master,
+                   unsigned long nbuckets, void *hash_private,
+                   int (*cmp)(void *hash_private, struct ht_elem *htep, void *key),
+                   long (*gethash)(void *hash_private, void *key),
+                   void *(*getkey)(struct ht_elem *htep))
 {
 	struct ht *htp;
 	struct ht *htp_new;
@@ -252,44 +279,41 @@ hashtab_resize(struct hashtab *htp_master,
 	struct ht_bucket *htbp_new;
 	long b;
 
-	if (!spin_trylock(&htp_master->ht_lock))
-		return -EBUSY;
-	htp = htp_master->ht_cur;
-	htp_new = ht_alloc(nbuckets,
-			   hash_private ? hash_private : htp->ht_hash_private,
-			   cmp ? cmp : htp->ht_cmp,
-			   gethash ? gethash : htp->ht_gethash,
-			   getkey ? getkey : htp->ht_getkey);
-	if (htp_new == NULL) {
-		spin_unlock(&htp_master->ht_lock);
-		return -ENOMEM;
+	if (!spin_trylock(&htp_master->ht_lock))		//\lnlbl{trylock}
+		return -EBUSY;					//\lnlbl{ret_busy}
+	htp = htp_master->ht_cur;				//\lnlbl{get_curtbl}
+	htp_new = ht_alloc(nbuckets,				//\lnlbl{alloc:b}
+	                   hash_private ? hash_private : htp->ht_hash_private,
+	                   cmp ? cmp : htp->ht_cmp,
+	                   gethash ? gethash : htp->ht_gethash,
+	                   getkey ? getkey : htp->ht_getkey);	//\lnlbl{alloc:e}
+	if (htp_new == NULL) {					//\lnlbl{chk_nomem}
+		spin_unlock(&htp_master->ht_lock);		//\lnlbl{rel_nomem}
+		return -ENOMEM;					//\lnlbl{ret_nomem}
 	}
-	htp->ht_new = htp_new;
-	synchronize_rcu();
-	idx = htp->ht_idx;
+	htp->ht_new = htp_new;					//\lnlbl{set_newtbl}
+	synchronize_rcu();					//\lnlbl{sync_rcu}
+	idx = htp->ht_idx;					//\lnlbl{get_curidx}
 	htp_new->ht_idx = !idx;
-	for (i = 0; i < htp->ht_nbuckets; i++) {
-		htbp = &htp->ht_bkt[i];
-		spin_lock(&htbp->htb_lock);
-		htp->ht_resize_cur = i;
-		cds_list_for_each_entry(htep, &htbp->htb_head, hte_next[idx]) {
-			htbp_new =
-				ht_get_bucket_single(htp_new,
-						     htp_new->ht_getkey(htep),
-						     &b);
+	for (i = 0; i < htp->ht_nbuckets; i++) {		//\lnlbl{loop:b}
+		htbp = &htp->ht_bkt[i];				//\lnlbl{get_oldcur}
+		spin_lock(&htbp->htb_lock);			//\lnlbl{acq_oldcur}
+		htp->ht_resize_cur = i;				//\lnlbl{update_resize}
+		cds_list_for_each_entry(htep, &htbp->htb_head, hte_next[idx]) { //\lnlbl{loop_list:b}
+			htbp_new = ht_get_bucket_single(htp_new, htp_new->ht_getkey(htep), &b);
 			spin_lock(&htbp_new->htb_lock);
-			cds_list_add_rcu(&htep->hte_next[!idx],
-					 &htbp_new->htb_head);
+			cds_list_add_rcu(&htep->hte_next[!idx], &htbp_new->htb_head);
 			spin_unlock(&htbp_new->htb_lock);
-		}
-		spin_unlock(&htbp->htb_lock);
-	}
-	rcu_assign_pointer(htp_master->ht_cur, htp_new);
-	synchronize_rcu();
-	spin_unlock(&htp_master->ht_lock);
-	free(htp);
-	return 0;
+		}						//\lnlbl{loop_list:e}
+		spin_unlock(&htbp->htb_lock);			//\lnlbl{rel_oldcur}
+	}							//\lnlbl{loop:e}
+	rcu_assign_pointer(htp_master->ht_cur, htp_new);	//\lnlbl{rcu_assign}
+	synchronize_rcu();					//\lnlbl{sync_rcu_2}
+	spin_unlock(&htp_master->ht_lock);			//\lnlbl{rel_master}
+	free(htp);						//\lnlbl{free}
+	return 0;						//\lnlbl{ret_success}
 }
+//\end{snippet}
 
 /* Test functions. */
 long tgh(void *hash_private, void *key)
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 65eb650..f75b42b 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -471,23 +471,7 @@ section~\cite{McKenney:2013:SDS:2483852.2483867}.
 \label{sec:datastruct:RCU-Protected Hash Table Implementation}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 static void hashtab_lock_lookup(struct hashtab *htp,
- 2                                 unsigned long hash)
- 3 {
- 4   rcu_read_lock();
- 5 }
- 6 
- 7 static void hashtab_unlock_lookup(struct hashtab *htp,
- 8                                   unsigned long hash)
- 9 {
-10   rcu_read_unlock();
-11 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt_rcu@lock_unlock.fcv}
 \caption{RCU-Protected Hash-Table Read-Side Concurrency Control}
 \label{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
 \end{listing}
@@ -507,33 +491,7 @@ shown in
 Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct ht_elem
- 2 *hashtab_lookup(struct hashtab *htp,
- 3                 unsigned long hash,
- 4                 void *key,
- 5                 int (*cmp)(struct ht_elem *htep,
- 6                            void *key))
- 7 {
- 8   struct ht_bucket *htb;
- 9   struct ht_elem *htep;
-10 
-11   htb = HASH2BKT(htp, hash);
-12   cds_list_for_each_entry_rcu(htep,
-13                               &htb->htb_head,
-14                               hte_next) {
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
+\input{CodeSamples/datastruct/hash/hash_bkt_rcu@lookup.fcv}
 \caption{RCU-Protected Hash-Table Lookup}
 \label{lst:datastruct:RCU-Protected Hash-Table Lookup}
 \end{listing}
@@ -576,26 +534,7 @@ RCU read-side critical section, for example, the caller must invoke
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
- 7   cds_list_add_rcu(&htep->hte_next,
- 8                    &HASH2BKT(htp, hash)->htb_head);
- 9 }
-10 
-11 void hashtab_del(struct ht_elem *htep)
-12 {
-13   cds_list_del_rcu(&htep->hte_next);
-14 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_bkt_rcu@add_del.fcv}
 \caption{RCU-Protected Hash-Table Modification}
 \label{lst:datastruct:RCU-Protected Hash-Table Modification}
 \end{listing}
@@ -939,51 +878,18 @@ which is the subject of the next section.
 \label{sec:datastruct:Resizable Hash Table Implementation}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct ht_elem {
- 2   struct rcu_head rh;
- 3   struct cds_list_head hte_next[2];
- 4   unsigned long hte_hash;
- 5 };
- 6 
- 7 struct ht_bucket {
- 8   struct cds_list_head htb_head;
- 9   spinlock_t htb_lock;
-10 };
-11 
-12 struct ht {
-13   long ht_nbuckets;
-14   long ht_resize_cur;
-15   struct ht *ht_new;
-16   int ht_idx;
-17   void *ht_hash_private;
-18   int (*ht_cmp)(void *hash_private,
-19                 struct ht_elem *htep,
-20                 void *key);
-21   long (*ht_gethash)(void *hash_private,
-22                      void *key);
-23   void *(*ht_getkey)(struct ht_elem *htep);
-24   struct ht_bucket ht_bkt[0];
-25 };
-26 
-27 struct hashtab {
-28   struct ht *ht_cur;
-29   spinlock_t ht_lock;
-30 };
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_resize@data.fcv}
 \caption{Resizable Hash-Table Data Structures}
 \label{lst:datastruct:Resizable Hash-Table Data Structures}
 \end{listing}
 
+\begin{lineref}[ln:datastruct:hash_resize:data]
 Resizing is accomplished by the classic approach of inserting a level
 of indirection, in this case, the \co{ht} structure shown on
-lines~12-25 of
+lines~\lnref{ht:b}-\lnref{ht:e} of
 Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures}.
-The \co{hashtab} structure shown on lines~27-30 contains only a
+The \co{hashtab} structure shown on
+lines~\lnref{hashtab:b}-\lnref{hashtab:e} contains only a
 pointer to the current \co{ht} structure along with a spinlock that
 is used to serialize concurrent attempts to resize the hash table.
 If we were to use a traditional lock- or atomic-operation-based
@@ -993,15 +899,17 @@ However, because resize operations should be relatively infrequent,
 we should be able to make good use of RCU.
 
 The \co{ht} structure represents a specific size of the hash table,
-as specified by the \co{->ht_nbuckets} field on line~13.
+as specified by the \co{->ht_nbuckets} field on line~\lnref{ht:nbuckets}.
 The size is stored in the same structure containing the array of
-buckets (\co{->ht_bkt[]} on line~24) in order to avoid mismatches between
+buckets (\co{->ht_bkt[]} on
+line~\lnref{ht:bkt}) in order to avoid mismatches between
 the size and the array.
-The \co{->ht_resize_cur} field on line~14 is equal to $-1$ unless a resize
+The \co{->ht_resize_cur} field on
+line~\lnref{ht:resize_cur} is equal to $-1$ unless a resize
 operation
 is in progress, in which case it indicates the index of the bucket whose
 elements are being inserted into the new hash table, which is referenced
-by the \co{->ht_new} field on line~15.
+by the \co{->ht_new} field on line~\lnref{ht:new}.
 If there is no resize operation in progress, \co{->ht_new} is \co{NULL}.
 Thus, a resize operation proceeds by allocating a new \co{ht} structure
 and referencing it via the \co{->ht_new} pointer, then advancing
@@ -1011,13 +919,15 @@ table is linked into the \co{hashtab} structure's \co{->ht_cur} field.
 Once all old readers have completed, the old hash table's \co{ht} structure
 may be freed.
 
-The \co{->ht_idx} field on line~16 indicates which of the two sets of
+The \co{->ht_idx} field on
+line~\lnref{ht:idx} indicates which of the two sets of
 list pointers are being used by this instantiation of the hash table,
 and is used to index the \co{->hte_next[]} array in the \co{ht_elem}
-structure on line~3.
+structure on line~\lnref{ht_elem:next}.
 
 The \co{->ht_hash_private}, \co{->ht_cmp()}, \co{->ht_gethash()},
-and \co{->ht_getkey()} fields on lines~17-23
+and \co{->ht_getkey()} fields on
+lines~\lnref{ht:hash_private}-\lnref{ht:getkey}
 collectively define the per-element key and the hash function.
 The \co{->ht_hash_private} allows the hash function to be
 perturbed~\cite{McKenney89c,McKenney90,McKenney91}, which can be
@@ -1044,62 +954,40 @@ from the new table.
 Conversely, if the bucket that would be selected from the old table
 has not yet been distributed, then the bucket should be selected from
 the old table.
+\end{lineref}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 static struct ht_bucket *
- 2 ht_get_bucket_single(struct ht *htp,
- 3                      void *key, long *b)
- 4 {
- 5   *b = htp->ht_gethash(htp->ht_hash_private,
- 6                        key) % htp->ht_nbuckets;
- 7   return &htp->ht_bkt[*b];
- 8 }
- 9 
-10 static struct ht_bucket *
-11 ht_get_bucket(struct ht **htp, void *key,
-12               long *b, int *i)
-13 {
-14   struct ht_bucket *htbp;
-15 
-16   htbp = ht_get_bucket_single(*htp, key, b);
-17   if (*b <= (*htp)->ht_resize_cur) {
-18     *htp = (*htp)->ht_new;
-19     htbp = ht_get_bucket_single(*htp, key, b);
-20   }
-21   if (i)
-22     *i = (*htp)->ht_idx;
-23   return htbp;
-24 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_resize@get_bucket.fcv}
 \caption{Resizable Hash-Table Bucket Selection}
 \label{lst:datastruct:Resizable Hash-Table Bucket Selection}
 \end{listing}
 
+\begin{lineref}[ln:datastruct:hash_resize:get_bucket]
 Bucket selection is shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection},
-which shows \co{ht_get_bucket_single()} on lines~1-8 and
-\co{ht_get_bucket()} on lines~10-24.
+which shows \co{ht_get_bucket_single()} on
+lines~\lnref{single:b}-\lnref{single:e} and
+\co{ht_get_bucket()} on lines~\lnref{b}-\lnref{e}.
 The \co{ht_get_bucket_single()} function returns a reference to the bucket
 corresponding to the specified key in the specified hash table, without
 making any allowances for resizing.
 It also stores the hash value corresponding to the key into the location
-referenced by parameter \co{b} on lines~5 and ~6.
-Line~7 then returns a reference to the corresponding bucket.
+referenced by parameter \co{b} on
+lines~\lnref{single:gethash:b} and ~\lnref{single:gethash:e}.
+Line~\lnref{single:return} then returns a reference to the corresponding bucket.
 
 The \co{ht_get_bucket()} function handles hash-table selection, invoking
-\co{ht_get_bucket_single()} on line~16 to select the bucket
+\co{ht_get_bucket_single()} on
+line~\lnref{call_single} to select the bucket
 corresponding to the hash in the current
 hash table, storing the hash value through parameter \co{b}.
-If line~17 determines that the table is being resized and that
-line~16's bucket has already been distributed across the new hash
-table, then line~18 selects the new hash table and line~19
+If line~\lnref{resized} determines that the table is being resized and that
+line~\lnref{call_single}'s bucket has already been distributed across the new hash
+table, then line~\lnref{newtable} selects the new hash table and
+line~\lnref{newbucket}
 selects the bucket corresponding to the hash in the new hash table,
 again storing the hash value through parameter \co{b}.
+\end{lineref}
 
 \QuickQuiz{}
 	The code in
@@ -1113,9 +1001,11 @@ again storing the hash value through parameter \co{b}.
 	new table.
 } \QuickQuizEnd
 
-If line~21 finds that parameter \co{i} is non-\co{NULL}, then
-line~22 stores the pointer-set index for the selected hash table.
-Finally, line~23 returns a reference to the selected hash bucket.
+\begin{lineref}[ln:datastruct:hash_resize:get_bucket]
+If line~\lnref{chk_i} finds that parameter \co{i} is non-\co{NULL}, then
+line~\lnref{set_idx} stores the pointer-set index for the selected hash table.
+Finally, line~\lnref{return} returns a reference to the selected hash bucket.
+\end{lineref}
 
 \QuickQuiz{}
 	How does the code in
@@ -1134,44 +1024,7 @@ will permit lookups and modifications to run concurrently
 with a resize operation.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 void hashtab_lock_mod(struct hashtab *htp_master,
- 2                       void *key)
- 3 {
- 4   long b;
- 5   struct ht *htp;
- 6   struct ht_bucket *htbp;
- 7   struct ht_bucket *htbp_new;
- 8 
- 9   rcu_read_lock();
-10   htp = rcu_dereference(htp_master->ht_cur);
-11   htbp = ht_get_bucket_single(htp, key, &b);
-12   spin_lock(&htbp->htb_lock);
-13   if (b > htp->ht_resize_cur)
-14     return;
-15   htp = htp->ht_new;
-16   htbp_new = ht_get_bucket_single(htp, key, &b);
-17   spin_lock(&htbp_new->htb_lock);
-18   spin_unlock(&htbp->htb_lock);
-19 }
-20 
-21 void hashtab_unlock_mod(struct hashtab *htp_master,
-22                         void *key)
-23 {
-24   long b;
-25   struct ht *htp;
-26   struct ht_bucket *htbp;
-27 
-28   htp = rcu_dereference(htp_master->ht_cur);
-29   htbp = ht_get_bucket(&htp, key, &b, NULL);
-30   spin_unlock(&htbp->htb_lock);
-31   rcu_read_unlock();
-32 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_resize@lock_unlock_mod.fcv}
 \caption{Resizable Hash-Table Update-Side Concurrency Control}
 \label{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}
 \end{listing}
@@ -1184,28 +1037,33 @@ must now deal with the possibility of a
 concurrent resize operation as shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.
 
-The \co{hashtab_lock_mod()} spans lines~1-19 in the listing.
-Line~9 enters an RCU read-side critical section to prevent
+\begin{lineref}[ln:datastruct:hash_resize:lock_unlock_mod:lock]
+The \co{hashtab_lock_mod()} spans
+lines~\lnref{b}-\lnref{e} in the listing.
+Line~\lnref{rcu_lock} enters an RCU read-side critical section to prevent
 the data structures from being freed during the traversal,
-line~10 acquires a reference to the current hash table, and then
-line~11 obtains a reference to the bucket in this hash table
+line~\lnref{refhashtbl} acquires a reference to the current hash table, and then
+line~\lnref{refbucket} obtains a reference to the bucket in this hash table
 corresponding to the key.
-Line~12 acquires that bucket's lock, which will prevent any concurrent
+Line~\lnref{acq_bucket} acquires that bucket's lock, which will prevent any concurrent
 resizing operation from distributing that bucket, though of course it
 will have no effect if the resizing operation has already distributed
 this bucket.
-Line~13 then checks to see if a concurrent resize operation has
+Line~\lnref{chk_resz_dist} then checks to see if a concurrent resize operation has
 already distributed this bucket across the new hash table, and if not,
-line~14 returns with the selected hash bucket's lock held (and also
+line~\lnref{fastret} returns with the selected hash bucket's lock held (and also
 within an RCU read-side critical section).
 
 Otherwise, a concurrent resize operation has already distributed this
-bucket, so line~15 proceeds to the new hash table and line~16
+bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table and
+line~\lnref{get_newbucket}
 selects the bucket corresponding to the key.
-Finally, line~17 acquires the bucket's lock and line~18 releases the
+Finally, line~\lnref{acq_newbucket} acquires the bucket's lock and
+line~\lnref{rel_oldbucket} releases the
 lock for the old hash table's bucket.
 Once again, \co{hashtab_lock_mod()} exits within an RCU read-side critical
 section.
+\end{lineref}
 
 \QuickQuiz{}
 	The code in
@@ -1222,14 +1080,18 @@ section.
 	Carrying out this optimization is left as an exercise for the reader.
 } \QuickQuizEnd
 
+\begin{lineref}[ln:datastruct:hash_resize:lock_unlock_mod:unlock]
 The \co{hashtab_unlock_mod()} function releases the lock acquired by
 \co{hashtab_lock_mod()}.
-Line~28 picks up the current hash table, and then line~29 invokes
+Line~\lnref{get_curtbl} picks up the current hash table, and then
+line~\lnref{get_curbucket} invokes
 \co{ht_get_bucket()} in order to gain a reference to the bucket that
 corresponds to the key---and of course this bucket might well be in a
 new hash table.
-Line~30 releases the bucket's lock and finally line~31 exits the
+Line~\lnref{rel_curbucket} releases the bucket's lock and finally
+line~\lnref{rcu_unlock} exits the
 RCU read-side critical section.
+\end{lineref}
 
 \QuickQuiz{}
 	Suppose that one thread is inserting an element into the
@@ -1252,64 +1114,7 @@ RCU read-side critical section.
 } \QuickQuizEnd
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 struct ht_elem *
- 2 hashtab_lookup(struct hashtab *htp_master,
- 3                void *key)
- 4 {
- 5   long b;
- 6   int i;
- 7   struct ht *htp;
- 8   struct ht_elem *htep;
- 9   struct ht_bucket *htbp;
-10 
-11   htp = rcu_dereference(htp_master->ht_cur);
-12   htbp = ht_get_bucket(&htp, key, &b, &i);
-13   cds_list_for_each_entry_rcu(htep,
-14                               &htbp->htb_head,
-15                               hte_next[i]) {
-16     if (htp->ht_cmp(htp->ht_hash_private,
-17                     htep, key))
-18       return htep;
-19   }
-20   return NULL;
-21 }
-22 
-23 void
-24 hashtab_add(struct hashtab *htp_master,
-25             struct ht_elem *htep)
-26 {
-27   long b;
-28   int i;
-29   struct ht *htp;
-30   struct ht_bucket *htbp;
-31 
-32   htp = rcu_dereference(htp_master->ht_cur);
-33   htbp = ht_get_bucket(&htp, htp->ht_getkey(htep),
-34                        &b, &i);
-35   cds_list_add_rcu(&htep->hte_next[i],
-36                    &htbp->htb_head);
-37 }
-38 
-39 void
-40 hashtab_del(struct hashtab *htp_master,
-41             struct ht_elem *htep)
-42 {
-43   long b;
-44   int i;
-45   struct ht *htp;
-46   struct ht_bucket *htbp;
-47 
-48   htp = rcu_dereference(htp_master->ht_cur);
-49   htbp = ht_get_bucket(&htp, htp->ht_getkey(htep),
-50                        &b, &i);
-51   cds_list_del_rcu(&htep->hte_next[i]);
-52 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_resize@access.fcv}
 \caption{Resizable Hash-Table Access Functions}
 \label{lst:datastruct:Resizable Hash-Table Access Functions}
 \end{listing}
@@ -1320,19 +1125,26 @@ The \co{hashtab_lookup()}, \co{hashtab_add()}, and \co{hashtab_del()}
 functions shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}.
 
-The \co{hashtab_lookup()} function on lines~1-21 of the figure does
+\begin{lineref}[ln:datastruct:hash_resize:access:lookup]
+The \co{hashtab_lookup()} function on
+lines~\lnref{b}-\lnref{e} of the figure does
 hash lookups.
-Line~11 fetches the current hash table and line~12 obtains a reference
+Line~\lnref{get_curtbl} fetches the current hash table and
+line~\lnref{get_curbucket} obtains a reference
 to the bucket corresponding to the specified key.
 This bucket will be located in a new resized hash table when a
 resize operation has progressed past the bucket in the old hash
 table that contained the desired data element.
-Note that line~12 also passes back the index that will be used to
+Note that line~\lnref{get_curbucket} also passes back the index that will be used to
 select the correct set of pointers from the pair in each element.
-The loop spanning lines~13-19 searches the bucket, so that if line~16
-detects a match, line~18 returns a pointer to the enclosing data element.
-Otherwise, if there is no match, line~20 returns \co{NULL} to indicate
+The loop spanning lines~\lnref{loop:b}-\lnref{loop:e} searches the bucket,
+so that if line~\lnref{match}
+detects a match,
+line~\lnref{ret_match} returns a pointer to the enclosing data element.
+Otherwise, if there is no match,
+line~\lnref{ret_NULL} returns \co{NULL} to indicate
 failure.
+\end{lineref}
 
 \QuickQuiz{}
 	In the \co{hashtab_lookup()} function in
@@ -1353,10 +1165,12 @@ failure.
 	just added, which certainly sounds like a bug to me!
 } \QuickQuizEnd
 
-The \co{hashtab_add()} function on lines~23-37 of the figure adds
+\begin{lineref}[ln:datastruct:hash_resize:access:add]
+The \co{hashtab_add()} function on lines~\lnref{b}-\lnref{e} of the figure adds
 new data elements to the hash table.
-Lines~32-34 obtain a pointer to the hash bucket corresponding to
-the key (and provide the index), as before, and line~35 adds the new
+Lines~\lnref{get_curtbl}-\lnref{get_curbucket} obtain a pointer to
+the hash bucket corresponding to
+the key (and provide the index), as before, and line~\lnref{add} adds the new
 element to the table.
 The caller is required to handle concurrency, for example, by invoking
 \co{hashtab_lock_mod()} before the call to \co{hashtab_add()} and invoking
@@ -1365,14 +1179,19 @@ These two concurrency-control functions will correctly synchronize with
 a concurrent resize operation:  If the resize operation has already
 progressed beyond the bucket that this data element would have been added to,
 then the element is added to the new table.
+\end{lineref}
 
-The \co{hashtab_del()} function on lines~39-52 of the figure removes
+\begin{lineref}[ln:datastruct:hash_resize:access:del]
+The \co{hashtab_del()} function on
+lines~\lnref{b}-\lnref{e} of the figure removes
 an existing element from the hash table.
-Lines~48-50 provide the bucket and index as before, and line~51 removes
+Lines~\lnref{get_curtbl}-\lnref{get_curidx} provide the index as before,
+and line~\lnref{del} removes
 the specified element.
 As with \co{hashtab_add()}, the caller is responsible for concurrency
 control and this concurrency control suffices for synchronizing with
 a concurrent resize operation.
+\end{lineref}
 
 \QuickQuiz{}
 	The \co{hashtab_del()} function in
@@ -1397,125 +1216,82 @@ a concurrent resize operation.
 } \QuickQuizEnd
 
 \begin{listing*}[tb]
-{ \scriptsize
-\begin{verbbox}
- 1 int hashtab_resize(struct hashtab *htp_master,
- 2                    unsigned long nbuckets, void *hash_private,
- 3                    int (*cmp)(void *hash_private, struct ht_elem *htep, void *key),
- 4                    long (*gethash)(void *hash_private, void *key),
- 5                    void *(*getkey)(struct ht_elem *htep))
- 6 {
- 7   struct ht *htp;
- 8   struct ht *htp_new;
- 9   int i;
-10   int idx;
-11   struct ht_elem *htep;
-12   struct ht_bucket *htbp;
-13   struct ht_bucket *htbp_new;
-14   unsigned long hash;
-15   long b;
-16 
-17   if (!spin_trylock(&htp_master->ht_lock))
-18     return -EBUSY;
-19   htp = htp_master->ht_cur;
-20   htp_new = ht_alloc(nbuckets,
-21                      hash_private ? hash_private : htp->ht_hash_private,
-22                      cmp ? cmp : htp->ht_cmp,
-23                      gethash ? gethash : htp->ht_gethash,
-24                      getkey ? getkey : htp->ht_getkey);
-25   if (htp_new == NULL) {
-26     spin_unlock(&htp_master->ht_lock);
-27     return -ENOMEM;
-28   }
-29   htp->ht_new = htp_new;
-30   synchronize_rcu();
-31   idx = htp->ht_idx;
-32   htp_new->ht_idx = !idx;
-33   for (i = 0; i < htp->ht_nbuckets; i++) {
-34     htbp = &htp->ht_bkt[i];
-35     spin_lock(&htbp->htb_lock);
-36     htp->ht_resize_cur = i;
-37     cds_list_for_each_entry(htep, &htbp->htb_head, hte_next[idx]) {
-38       htbp_new = ht_get_bucket_single(htp_new, htp_new->ht_getkey(htep), &b);
-39       spin_lock(&htbp_new->htb_lock);
-40       cds_list_add_rcu(&htep->hte_next[!idx], &htbp_new->htb_head);
-41       spin_unlock(&htbp_new->htb_lock);
-42     }
-43     spin_unlock(&htbp->htb_lock);
-44   }
-45   rcu_assign_pointer(htp_master->ht_cur, htp_new);
-46   synchronize_rcu();
-47   spin_unlock(&htp_master->ht_lock);
-48   free(htp);
-49   return 0;
-50 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/datastruct/hash/hash_resize@resize.fcv}
 \caption{Resizable Hash-Table Resizing}
 \label{lst:datastruct:Resizable Hash-Table Resizing}
 \end{listing*}
 
+\begin{lineref}[ln:datastruct:hash_resize:resize]
 The actual resizing itself is carried out by \co{hashtab_resize}, shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing} on
 page~\pageref{lst:datastruct:Resizable Hash-Table Resizing}.
-Line~17 conditionally acquires the top-level \co{->ht_lock}, and if
-this acquisition fails, line~18 returns \co{-EBUSY} to indicate that
+Line~\lnref{trylock} conditionally acquires the top-level \co{->ht_lock}, and if
+this acquisition fails, line~\lnref{ret_busy} returns \co{-EBUSY} to indicate that
 a resize is already in progress.
-Otherwise, line~19 picks up a reference to the current hash table,
-and lines~21-24 allocate a new hash table of the desired size.
+Otherwise, line~\lnref{get_curtbl} picks up a reference to the current hash table,
+and lines~\lnref{alloc:b}-\lnref{alloc:e} allocate a new hash table of the desired size.
 If a new set of hash/key functions have been specified, these are
 used for the new table, otherwise those of the old table are preserved.
-If line~25 detects memory-allocation failure, line~26 releases \co{->ht_lock}
-and line~27 returns a failure indication.
+If line~\lnref{chk_nomem} detects memory-allocation failure,
+line~\lnref{rel_nomem} releases \co{->ht_lock}
+and line~\lnref{ret_nomem} returns a failure indication.
 
-Line~29 starts the bucket-distribution process by installing a reference
+Line~\lnref{set_newtbl} starts the bucket-distribution process by installing a reference
 to the new table into the \co{->ht_new} field of the old table.
-Line~30 ensures that all readers who are not aware of the new table
+Line~\lnref{sync_rcu} ensures that all readers who are not aware of the new table
 complete before the resize operation continues.
-Line~31 picks up the current table's index and stores its inverse to
+Line~\lnref{get_curidx} picks up the current table's index and stores its inverse to
 the new hash table, thus ensuring that the two hash tables avoid overwriting
 each other's linked lists.
 
-Each pass through the loop spanning lines~33-44 distributes the contents
+Each pass through the loop spanning lines~\lnref{loop:b}-\lnref{loop:e} distributes the contents
 of one of the old hash table's buckets into the new hash table.
-Line~34 picks up a reference to the old table's current bucket,
-line~35 acquires that bucket's spinlock, and line~36 updates
+Line~\lnref{get_oldcur} picks up a reference to the old table's current bucket,
+line~\lnref{acq_oldcur} acquires that bucket's spinlock, and
+line~\lnref{update_resize} updates
 \co{->ht_resize_cur} to indicate that this bucket is being distributed.
+\end{lineref}
 
 \QuickQuiz{}
+	\begin{lineref}[ln:datastruct:hash_resize:resize]
 	In the \co{hashtab_resize()} function in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions},
-	what guarantees that the update to \co{->ht_new} on line~29
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing},
+	what guarantees that the update to \co{->ht_new} on line~\lnref{set_newtbl}
 	will be seen as happening before the update to \co{->ht_resize_cur}
-	on line~36 from the perspective of \co{hashtab_lookup()},
+	on line~\lnref{update_resize} from the perspective of \co{hashtab_lookup()},
 	\co{hashtab_add()}, and \co{hashtab_del()}?
+	\end{lineref}
 \QuickQuizAnswer{
-	The \co{synchronize_rcu()} on line~30 of
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
+	\begin{lineref}[ln:datastruct:hash_resize:resize]
+	The \co{synchronize_rcu()} on line~\lnref{sync_rcu} of
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing}
 	ensures that all pre-existing RCU readers have completed between
 	the time that we install the new hash-table reference on
-	line~29 and the time that we update \co{->ht_resize_cur} on
-	line~36.
+	line~\lnref{set_newtbl} and the time that we update \co{->ht_resize_cur} on
+	line~\lnref{update_resize}.
 	This means that any reader that sees a non-negative value
 	of \co{->ht_resize_cur} cannot have started before the
 	assignment to \co{->ht_new}, and thus must be able to see
 	the reference to the new hash table.
+	\end{lineref}
 } \QuickQuizEnd
 
-Each pass through the loop spanning lines~37-42 adds one data element
+\begin{lineref}[ln:datastruct:hash_resize:resize]
+Each pass through the loop spanning
+lines~\lnref{loop_list:b}-\lnref{loop_list:e} adds one data element
 from the current old-table bucket to the corresponding new-table bucket,
 holding the new-table bucket's lock during the add operation.
-Finally, line~43 releases the old-table bucket lock.
+Finally, line~\lnref{rel_oldcur} releases the old-table bucket lock.
 
-Execution reaches line~45 once all old-table buckets have been distributed
+Execution reaches line~\lnref{rcu_assign} once all old-table buckets have been distributed
 across the new table.
-Line~45 installs the newly created table as the current one, and
-line~46 waits for all old readers (who might still be referencing
+Line~\lnref{rcu_assign} installs the newly created table as the current one, and
+line~\lnref{sync_rcu_2} waits for all old readers (who might still be referencing
 the old table) to complete.
-Then line~47 releases the resize-serialization lock, line~48 frees
-the old hash table, and finally line~48 returns success.
+Then line~\lnref{rel_master} releases the resize-serialization lock,
+line~\lnref{free} frees
+the old hash table, and finally line~\lnref{ret_success} returns success.
+\end{lineref}
 
 \subsection{Resizable Hash Table Discussion}
 \label{sec:datastruct:Resizable Hash Table Discussion}
@@ -1994,16 +1770,12 @@ that element, they would incur expensive cache misses, degrading both
 performance and scalability.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-1 struct hash_elem {
-2   struct ht_elem e;
-3   long __attribute__ ((aligned(64))) counter;
-4 };
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{VerbatimL}
+struct hash_elem {
+	struct ht_elem e;
+	long __attribute__ ((aligned(64))) counter;
+};
+\end{VerbatimL}
 \caption{Alignment for 64-Byte Cache Lines}
 \label{lst:datastruct:Alignment for 64-Byte Cache Lines}
 \end{listing}
-- 
2.7.4


