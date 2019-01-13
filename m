Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ioRYH1YB/i70U411jlL0ZCQ6f8/cHc4BWUrW/16m844=;
        b=nyyQVCnMoMBpbl2fo+RVts8hGWEEV79aX83NeAohel7litfL4SertTL8jEBlg65jOL
         ijxn9JtG2gfl6IXpzsSkaBlPahGE9e5R0sdEn25zH1DsKKSItaadtdi/zoPC2+HSkfj2
         RqItveye/IFpBVZDJAXTV4TEeSWLm9OUTu9+CdIiSyghzMowZOdj2xC/u2nnkppqnC4V
         nW75vAae1g5jmWIQkyL3AoOtipUN1eR68OnSpGJUhGOVG2gSKdSM6Pb56NKtrIRA6JWd
         P0QTf9jq+TeTKutGmCus5Y2Q/0aW4s1MSRUQvFiTkz9qU+tm3fQIP4lfaHwnS8Ew7mUZ
         MG5Q==
Subject: [PATCH 2/6] datastruct/hash: Add a couple of Quick Quizzes regarding
 hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <28a96d5f-8c39-74a0-1d2d-745f29c267b8@gmail.com>
Date: Mon, 14 Jan 2019 08:32:48 +0900
MIME-Version: 1.0
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f937854c677547147ac16b492c57c1961ff372c7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Jan 2019 19:56:22 +0900
Subject: [PATCH 2/6] datastruct/hash: Add a couple of Quick Quizzes regarding hash_resize.c

Also copy hash_resize.c as of commit 180bd693751b ("datastruct/hash:
Always place to-be-added-to bucket in [0]") to hash_size_s.c and
include listings of its access functions and the update-side locking
function in an answer to one of the added quick quizzes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/Makefile        |   5 +-
 CodeSamples/datastruct/hash/hash_resize.c   |   3 +-
 CodeSamples/datastruct/hash/hash_resize_s.c | 365 ++++++++++++++++++++++++++++
 datastruct/datastruct.tex                   |  60 +++++
 4 files changed, 431 insertions(+), 2 deletions(-)
 create mode 100644 CodeSamples/datastruct/hash/hash_resize_s.c

diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index 4f1c2f5..758d574 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -16,7 +16,7 @@
 
 include ../../Makefile.arch
 
-PROGS =	hash_bkt hash_bkt_hazptr hash_bkt_rcu hash_global hash_resize
+PROGS =	hash_bkt hash_bkt_hazptr hash_bkt_rcu hash_global hash_resize hash_resize_s
 
 top := ../..
 include $(top)/depends.mk
@@ -49,5 +49,8 @@ hash_global: hash_global.c ../../api.h hashtorture.h
 hash_resize: hash_resize.c ../../api.h hashtorture.h
 	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c -lpthread -lurcu -lurcu-signal
 
+hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
+	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c -lpthread -lurcu -lurcu-signal
+
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index e475910..68fdc12 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -16,7 +16,8 @@
  * along with this program; if not, you can access it online at
  * http://www.gnu.org/licenses/gpl-2.0.html.
  *
- * Copyright (c) 2013 Paul E. McKenney, IBM Corporation.
+ * Copyright (c) 2013-2019 Paul E. McKenney, IBM Corporation.
+ * Copyright (c) 2019 Akira Yokosawa
  */
 
 #define _GNU_SOURCE
diff --git a/CodeSamples/datastruct/hash/hash_resize_s.c b/CodeSamples/datastruct/hash/hash_resize_s.c
new file mode 100644
index 0000000..755a8c7
--- /dev/null
+++ b/CodeSamples/datastruct/hash/hash_resize_s.c
@@ -0,0 +1,365 @@
+/*
+ * hash_resize_s.c: Resizable hash table protected by a per-bucket lock for
+ *	updates and RCU for lookups (less bucket updates).
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
+ * Copyright (c) 2013-2019 Paul E. McKenney, IBM Corporation.
+ */
+
+#define _GNU_SOURCE
+#define _LGPL_SOURCE
+#define RCU_SIGNAL
+#include <urcu.h>
+#include "../../api.h"
+
+/* Hash-table element to be included in structures in a hash table. */
+struct ht_elem {
+	struct rcu_head rh;
+	struct cds_list_head hte_next[2];		//\lnlbl{ht_elem:next}
+#ifndef FCV_SNIPPET
+	unsigned long hte_hash;
+#endif /* #ifndef FCV_SNIPPET */
+};
+
+/* Hash-table bucket element. */
+struct ht_bucket {
+	struct cds_list_head htb_head;
+	spinlock_t htb_lock;
+};
+
+struct ht_lock_state {					//\lnlbl{hls:b}
+	struct ht_bucket *hbp[2];
+#ifndef FCV_SNIPPET
+	unsigned long hls_hash[2];
+#endif /* #ifndef FCV_SNIPPET */
+	int hls_idx[2];
+};							//\lnlbl{hls:e}
+
+/* Hash-table instance, duplicated at resize time. */
+struct ht {						//\lnlbl{ht:b}
+	long ht_nbuckets;				//\lnlbl{ht:nbuckets}
+	long ht_resize_cur;				//\lnlbl{ht:resize_cur}
+	struct ht *ht_new;				//\lnlbl{ht:new}
+	int ht_idx;					//\lnlbl{ht:idx}
+	int (*ht_cmp)(struct ht_elem *htep,		//\lnlbl{ht:cmp}
+	              void *key);
+	unsigned long (*ht_gethash)(void *key);
+	void *(*ht_getkey)(struct ht_elem *htep);	//\lnlbl{ht:getkey}
+	struct ht_bucket ht_bkt[0];			//\lnlbl{ht:bkt}
+};							//\lnlbl{ht:e}
+
+/* Top-level hash-table data structure, including buckets. */
+struct hashtab {					//\lnlbl{hashtab:b}
+	struct ht *ht_cur;
+	spinlock_t ht_lock;
+};							//\lnlbl{hashtab:e}
+
+/* Allocate a hash-table instance. */
+struct ht *
+ht_alloc(unsigned long nbuckets,
+	 int (*cmp)(struct ht_elem *htep, void *key),
+	 unsigned long (*gethash)(void *key),
+	 void *(*getkey)(struct ht_elem *htep))
+{
+	struct ht *htp;
+	int i;
+
+	htp = malloc(sizeof(*htp) + nbuckets * sizeof(struct ht_bucket));
+	if (htp == NULL)
+		return NULL;
+	htp->ht_nbuckets = nbuckets;
+	htp->ht_resize_cur = -1;
+	htp->ht_new = NULL;
+	htp->ht_idx = 0;
+	htp->ht_cmp = cmp;
+	htp->ht_gethash = gethash;
+	htp->ht_getkey = getkey;
+	for (i = 0; i < nbuckets; i++) {
+		CDS_INIT_LIST_HEAD(&htp->ht_bkt[i].htb_head);
+		spin_lock_init(&htp->ht_bkt[i].htb_lock);
+	}
+	return htp;
+}
+
+/* Allocate a full hash table, master plus instance. */
+struct hashtab *
+hashtab_alloc(unsigned long nbuckets,
+	      int (*cmp)(struct ht_elem *htep, void *key),
+	      unsigned long (*gethash)(void *key),
+	      void *(*getkey)(struct ht_elem *htep))
+{
+	struct hashtab *htp_master;
+
+	htp_master = malloc(sizeof(*htp_master));
+	if (htp_master == NULL)
+		return NULL;
+	htp_master->ht_cur =
+		ht_alloc(nbuckets, cmp, gethash, getkey);
+	if (htp_master->ht_cur == NULL) {
+		free(htp_master);
+		return NULL;
+	}
+	spin_lock_init(&htp_master->ht_lock);
+	return htp_master;
+}
+
+/* Free a full hash table, master plus instance. */
+void hashtab_free(struct hashtab *htp_master)
+{
+	free(htp_master->ht_cur);
+	free(htp_master);
+}
+
+/* Get hash bucket corresponding to key, ignoring the possibility of resize. */
+static struct ht_bucket *				//\lnlbl{single:b}
+ht_get_bucket(struct ht *htp, void *key,
+              long *b, unsigned long *h)
+{
+	unsigned long hash = htp->ht_gethash(key);
+
+	*b = hash % htp->ht_nbuckets;			//\lnlbl{single:gethash}
+	if (h)
+		*h = hash;				//\lnlbl{single:h}
+	return &htp->ht_bkt[*b];			//\lnlbl{single:return}
+}							//\lnlbl{single:e}
+
+/* Search the bucket for the specfied key in the specified ht structure. */
+static struct ht_elem *					//\lnlbl{hsb:b}
+ht_search_bucket(struct ht *htp, void *key)
+{
+	long b;
+	struct ht_elem *htep;
+	struct ht_bucket *htbp;
+
+	htbp = ht_get_bucket(htp, key, &b, NULL);	//\lnlbl{hsb:get_curbkt}
+	cds_list_for_each_entry_rcu(htep,		//\lnlbl{hsb:loop:b}
+	                            &htbp->htb_head,
+	                            hte_next[htp->ht_idx]) {
+		if (htp->ht_cmp(htep, key)) 		//\lnlbl{hsb:match}
+			return htep;			//\lnlbl{hsb:ret_match}
+	}						//\lnlbl{hsb:loop:e}
+	return NULL;					//\lnlbl{hsb:ret_NULL}
+}							//\lnlbl{hsb:e}
+
+/* Read-side lock/unlock functions. */
+static void hashtab_lock_lookup(struct hashtab *htp_master, void *key)
+{
+	rcu_read_lock();
+}
+
+static void hashtab_unlock_lookup(struct hashtab *htp_master, void *key)
+{
+	rcu_read_unlock();
+}
+
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize_s:lock_mod,commandchars=\\\@\$]
+/* Update-side lock/unlock functions. */
+static void						//\lnlbl{l:b}
+hashtab_lock_mod(struct hashtab *htp_master, void *key,
+                 struct ht_lock_state *lsp)
+{
+	long b;
+	unsigned long h;
+	struct ht *htp;
+	struct ht_bucket *htbp;
+
+	rcu_read_lock();				//\lnlbl{l:rcu_lock}
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{l:refhashtbl}
+	htbp = ht_get_bucket(htp, key, &b, &h);		//\lnlbl{l:refbucket}
+	spin_lock(&htbp->htb_lock);			//\lnlbl{l:acq_bucket}
+	lsp->hbp[0] = htbp;				//\lnlbl{l:lsp0b}
+	lsp->hls_idx[0] = htp->ht_idx;
+#ifndef FCV_SNIPPET
+	lsp->hls_hash[0] = h;				//\lnlbl{l:lsp0e}
+#endif /* #ifndef FCV_SNIPPET */
+	if (b > READ_ONCE(htp->ht_resize_cur)) {	//\lnlbl{l:ifresized}
+		lsp->hbp[1] = NULL;			//\lnlbl{l:lsp1_1}
+		return;					//\lnlbl{l:fastret1}
+	}
+	htp = rcu_dereference(htp->ht_new);		//\lnlbl{l:new_hashtbl}
+	htbp = ht_get_bucket(htp, key, &b, &h);		//\lnlbl{l:get_newbkt}
+	spin_lock(&htbp->htb_lock);			//\lnlbl{l:acq_newbkt}
+	lsp->hbp[1] = lsp->hbp[0];			//\lnlbl{l:lsp1b}
+	lsp->hls_idx[1] = lsp->hls_idx[0];
+#ifndef FCV_SNIPPET
+	lsp->hls_hash[1] = lsp->hls_hash[0];
+#endif /* #ifndef FCV_SNIPPET */
+	lsp->hbp[0] = htbp;
+	lsp->hls_idx[0] = htp->ht_idx;
+#ifndef FCV_SNIPPET
+	lsp->hls_hash[0] = h;				//\lnlbl{l:lsp1e}
+#endif /* #ifndef FCV_SNIPPET */
+}							//\lnlbl{l:e}
+//\end{snippet}
+
+static void						//\lnlbl{ul:b}
+hashtab_unlock_mod(struct ht_lock_state *lsp)
+{
+	spin_unlock(&lsp->hbp[0]->htb_lock);		//\lnlbl{ul:relbkt0}
+	if (lsp->hbp[1])				//\lnlbl{ul:ifbkt1}
+		spin_unlock(&lsp->hbp[1]->htb_lock);	//\lnlbl{ul:relbkt1}
+	rcu_read_unlock();				//\lnlbl{ul:rcu_unlock}
+}							//\lnlbl{ul:e}
+
+/*
+ * Finished using a looked up hashtable element.
+ */
+void hashtab_lookup_done(struct ht_elem *htep)
+{
+}
+
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize_s:access,commandchars=\\\@\$]
+/*
+ * Look up a key.  Caller must have acquired either a read-side or update-side
+ * lock via either hashtab_lock_lookup() or hashtab_lock_mod().  Note that
+ * the return is a pointer to the ht_elem: Use offset_of() or equivalent
+ * to get a pointer to the full data structure.
+ */
+struct ht_elem *					//\lnlbl{lkp:b}
+hashtab_lookup(struct hashtab *htp_master, void *key)
+{
+	struct ht *htp;
+	struct ht_elem *htep;
+
+	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{lkp:get_curtbl}
+	htep = ht_search_bucket(htp, key);		//\lnlbl{lkp:get_curbkt}
+	if (htep)					//\lnlbl{lkp:entchk}
+		return htep;				//\lnlbl{lkp:ret_match}
+	htp = rcu_dereference(htp->ht_new);		//\lnlbl{lkp:get_nxttbl}
+	if (!htp)					//\lnlbl{lkp:htpchk}
+		return NULL;				//\lnlbl{lkp:noresize}
+	return ht_search_bucket(htp, key);		//\lnlbl{lkp:ret_nxtbkt}
+}							//\lnlbl{lkp:e}
+
+/*
+ * Add an element to the hash table.  Caller must have acquired the
+ * update-side lock via hashtab_lock_mod().
+ */
+void hashtab_add(struct ht_elem *htep,			//\lnlbl{add:b}
+                 struct ht_lock_state *lsp)
+{
+	struct ht_bucket *htbp = lsp->hbp[0];		//\lnlbl{add:htbp}
+	int i = lsp->hls_idx[0];			//\lnlbl{add:i}
+
+#ifndef FCV_SNIPPET
+	htep->hte_hash = lsp->hls_hash[0];		//\lnlbl{add:hash}
+#endif /* #ifndef FCV_SNIPPET */
+	htep->hte_next[!i].prev = NULL;			//\lnlbl{add:initp}
+	cds_list_add_rcu(&htep->hte_next[i], &htbp->htb_head); //\lnlbl{add:add}
+}							//\lnlbl{add:e}
+
+/*
+ * Remove the specified element from the hash table.  Caller must have
+ * acquired the update-side lock via hashtab_lock_mod().
+ */
+void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
+                 struct ht_lock_state *lsp)
+{
+	int i = lsp->hls_idx[0];			//\lnlbl{del:i}
+
+	if (htep->hte_next[i].prev) {			//\lnlbl{del:if}
+		cds_list_del_rcu(&htep->hte_next[i]);	//\lnlbl{del:del}
+		htep->hte_next[i].prev = NULL;		//\lnlbl{del:init}
+	}
+	if (lsp->hbp[1] && htep->hte_next[!i].prev) {	//\lnlbl{del:ifnew}
+		cds_list_del_rcu(&htep->hte_next[!i]);	//\lnlbl{del:delnew}
+		htep->hte_next[!i].prev = NULL;		//\lnlbl{del:initnew}
+	}
+}							//\lnlbl{del:e}
+//\end{snippet}
+
+/* Resize a hash table. */
+int hashtab_resize(struct hashtab *htp_master,
+                   unsigned long nbuckets,
+                   int (*cmp)(struct ht_elem *htep, void *key),
+                   unsigned long (*gethash)(void *key),
+                   void *(*getkey)(struct ht_elem *htep))
+{
+	struct ht *htp;
+	struct ht *htp_new;
+	int i;
+	int idx;
+	struct ht_elem *htep;
+	struct ht_bucket *htbp;
+	struct ht_bucket *htbp_new;
+	long b;
+
+	if (!spin_trylock(&htp_master->ht_lock))	//\lnlbl{trylock}
+		return -EBUSY;				//\lnlbl{ret_busy}
+	htp = htp_master->ht_cur;			//\lnlbl{get_curtbl}
+	htp_new = ht_alloc(nbuckets,			//\lnlbl{alloc:b}
+	                   cmp ? cmp : htp->ht_cmp,
+	                   gethash ? gethash : htp->ht_gethash,
+	                   getkey ? getkey : htp->ht_getkey); //\lnlbl{alloc:e}
+	if (htp_new == NULL) {				//\lnlbl{chk_nomem}
+		spin_unlock(&htp_master->ht_lock);	//\lnlbl{rel_nomem}
+		return -ENOMEM;				//\lnlbl{ret_nomem}
+	}
+	idx = htp->ht_idx;				//\lnlbl{get_curidx}
+	htp_new->ht_idx = !idx;				//\lnlbl{put_curidx}
+	rcu_assign_pointer(htp->ht_new, htp_new);	//\lnlbl{set_newtbl}
+	synchronize_rcu();				//\lnlbl{sync_rcu}
+	for (i = 0; i < htp->ht_nbuckets; i++) {	//\lnlbl{loop:b}
+		htbp = &htp->ht_bkt[i];			//\lnlbl{get_oldcur}
+		spin_lock(&htbp->htb_lock);		//\lnlbl{acq_oldcur}
+		cds_list_for_each_entry(htep, &htbp->htb_head, hte_next[idx]) { //\lnlbl{loop_list:b}
+			htbp_new = ht_get_bucket(htp_new, htp_new->ht_getkey(htep), &b, NULL);
+			spin_lock(&htbp_new->htb_lock);
+			cds_list_add_rcu(&htep->hte_next[!idx], &htbp_new->htb_head);
+			spin_unlock(&htbp_new->htb_lock);
+		}					//\lnlbl{loop_list:e}
+		WRITE_ONCE(htp->ht_resize_cur, i);	//\lnlbl{update_resize}
+		spin_unlock(&htbp->htb_lock);		//\lnlbl{rel_oldcur}
+	}						//\lnlbl{loop:e}
+	rcu_assign_pointer(htp_master->ht_cur, htp_new); //\lnlbl{rcu_assign}
+	synchronize_rcu();				//\lnlbl{sync_rcu_2}
+	spin_unlock(&htp_master->ht_lock);		//\lnlbl{rel_master}
+	free(htp);					//\lnlbl{free}
+	return 0;					//\lnlbl{ret_success}
+}
+
+
+#define hash_register_thread() rcu_register_thread()
+#define hash_unregister_thread() rcu_unregister_thread()
+#define hashtab_lock_lookup(htp, i) hashtab_lock_lookup((htp), (void *)(i))
+#define hashtab_unlock_lookup(htp, i) hashtab_unlock_lookup((htp), (void *)(i))
+#define hashtab_lock_mod(htp, i, h) hashtab_lock_mod((htp), (void *)(i), h)
+#define hashtab_lock_mod_zoo(htp, k, i, h) hashtab_lock_mod((htp), k, h)
+#define hashtab_unlock_mod(htp, i, h) hashtab_unlock_mod(h)
+#define hashtab_lookup(htp, h, k) hashtab_lookup((htp), (k))
+#define hashtab_add(htp, h, htep, s) hashtab_add((htep), (s))
+#define hashtab_del(htep,s) hashtab_del((htep), (s))
+#define hash_resize_test(htp, n) hashtab_resize((htp), (n), NULL, NULL, NULL)
+
+void (*defer_del_done)(struct ht_elem *htep) = NULL;
+
+void defer_del_rcu(struct rcu_head *rhp)
+{
+	defer_del_done((struct ht_elem *)rhp);
+}
+
+#ifdef TEST_HASH
+#define defer_del(p)	call_rcu(&(p)->rh, defer_del_rcu)
+
+#define quiescent_state() rcu_quiescent_state()
+
+#ifndef FCV_SNIPPET
+#else /* #ifndef FCV_SNIPPET */
+#define check_hash() (0)
+#endif /* #ifndef FCV_SNIPPET */
+
+#include "hashtorture.h"
+#endif /* #ifdef TEST_HASH */
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c5898cd..f344842 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1113,6 +1113,20 @@ Line~\lnref{ret} returns a pointer to the element that was located
 or \co{NULL} when the search failed.
 \end{lineref}
 
+\QuickQuiz{}
+	The \co{hashtab_lookup()} function in
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
+	searches only the current hash bucket.
+	Doesn't this mean that readers might miss a newly added
+	element?
+\QuickQuizAnswer{
+	No.
+	As will be described soon,
+	The \co{hashtab_add()} and \co{hashtab_del()} functions
+	keep updating the current hash table while resizing is
+	progressing.
+} \QuickQuizEnd
+
 \begin{lineref}[ln:datastruct:hash_resize:access:add]
 The \co{hashtab_add()} function on lines~\lnref{b}-\lnref{e} of the listing adds
 new data elements to the hash table.
@@ -1143,6 +1157,52 @@ control and this concurrency control suffices for synchronizing with
 a concurrent resize operation.
 \end{lineref}
 
+\QuickQuiz{}
+	The \co{hashtab_add()} and \co{hashtab_del()} functions in
+	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
+	can update two hash buckets while a resize operation is progressing.
+	This might cause a poor performance if the frequency of resize operation
+	is not negligible.
+	Isn't it possible to reduce the cost of updates in such cases?
+\QuickQuizAnswer{
+	Yes.
+	If you can tollerate a slight increase in the cost of
+	\co{hashtab_lookup()}, there are several approaches
+	to reduce the number of updates in \co{hashtab_add()} and
+	\co{hashtab_del()}.
+	An alternative implementation of these three functions and the
+	update-side locking function is shown in
+	Listings~\ref{lst:datastruct:Resizable Hash-Table Access Functions
+	(Less Updates)}
+	and~\ref{lst:datastruct:Resizable Hash-Table Update-Side Locking
+	Function (Less Updates)} (\path{hash_resize_s.c}).
+
+\begin{listing}[tbh]
+\input{CodeSamples/datastruct/hash/hash_resize_s@access.fcv}
+\caption{Resizable Hash-Table Access Functions (Less Updates)}
+\label{lst:datastruct:Resizable Hash-Table Access Functions (Less Updates)}
+\end{listing}
+
+\begin{listing}[tbh]
+\input{CodeSamples/datastruct/hash/hash_resize_s@lock_mod.fcv}
+\caption{Resizable Hash-Table Update-Side Locking Function (Less Updates)}
+\label{lst:datastruct:Resizable Hash-Table Update-Side Locking Function (Less Updates)}
+\end{listing}
+
+	This version of \co{hashtab_add()} adds an element to
+	either the old bucket if it is not resized yet, or to the new
+	bucket if it has been resized. \co{hashtab_del()} removes
+	the specified element from the buckets it has been inserted.
+	\co{hashtab_lookup()} searches the new bucket if the search
+	of the old bucket fails.
+	The alternative \co{hashtab_lock_mod()} returns the locking
+	state of the new bucket in \co{->hbp[0]} and \co{->hls_idx[0]}
+	if resize operation is in progress. This reordering simplifies
+	\co{hashtab_add()}.
+
+	Further analysis of the code is left as an exercise for the reader.
+} \QuickQuizEnd
+
 \begin{listing*}[tb]
 \input{CodeSamples/datastruct/hash/hash_resize@resize.fcv}
 \caption{Resizable Hash-Table Resizing}
-- 
2.7.4


