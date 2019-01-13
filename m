Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M9rxY+SsMGLhftuyqu4GYe/jJ+2cJXxQkk3sohHh3Nk=;
        b=M1mZ7TBfeBrJhFxC2pukR9Va6VumYkcT2hhW4KKhpGP/5IOnZqC6A1Ww55qfAHwXlf
         07KcDSnRvhRYAB0C6JFDHpU6yZwcOVBX7+yp6udkBfCKZ0/VoNSS0ugrCpCX6Czi1rU6
         KWQ286fKfvH8KG/VAHCNsvc7YWuakp2rzpUNOmos122MjrszbwG8NAMEQj0B6ARoNK/L
         QJiBEfiVofEU+31IApf2UEMI2tZaJTgZ2PFAAJQeRAA063uXJKug/39Cw0LI60BhXfH2
         1aDF7/seMqOMv1AVyGolGT8autgKwGSkeTX/fVhLPwnyx0coRwn8AvtX5ibK6LHhnTbc
         DJdA==
Subject: [PATCH 1/6] datastruct/hash: Simplify hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7155cb3d-fb2c-f848-a183-1c8dcc0bafa5@gmail.com>
Date: Mon, 14 Jan 2019 08:31:27 +0900
MIME-Version: 1.0
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1ffe7edfb90cbb8efb2a33d2ae8c3e855e684acf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Jan 2019 19:47:23 +0900
Subject: [PATCH 1/6] datastruct/hash: Simplify hash_resize.c

By keeping updating the current (old) hash table until resizing
completes, hashtab_lookup() only needs to see the current hash table.
Instead, hashtab_add() and hashtab_del() need to update the bucket in
the current hash table as well as that in the new hash table if
hashtab_lock_mod() has locked the new bucket.

This simplifies the lookup side and no performance degradation
is expected as long as no resizing is in progress.

Note that during resize operation, the cost of updates can be
doubled in the worst case.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_resize.c | 56 ++++++++++++++-----------
 CodeSamples/datastruct/hash/hashtorture.h |  6 ++-
 datastruct/datastruct.tex                 | 69 ++++++++++---------------------
 3 files changed, 59 insertions(+), 72 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 9f9fe8c..e475910 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -30,7 +30,9 @@
 struct ht_elem {
 	struct rcu_head rh;
 	struct cds_list_head hte_next[2];		//\lnlbl{ht_elem:next}
-	unsigned long hte_hash;
+#ifndef FCV_SNIPPET
+	unsigned long hte_hash[2];
+#endif /* #ifndef FCV_SNIPPET */
 };
 
 /* Hash-table bucket element. */
@@ -41,7 +43,9 @@ struct ht_bucket {
 
 struct ht_lock_state {					//\lnlbl{hls:b}
 	struct ht_bucket *hbp[2];
+#ifndef FCV_SNIPPET
 	unsigned long hls_hash[2];
+#endif /* #ifndef FCV_SNIPPET */
 	int hls_idx[2];
 };							//\lnlbl{hls:e}
 
@@ -181,8 +185,10 @@ hashtab_lock_mod(struct hashtab *htp_master, void *key,
 	htbp = ht_get_bucket(htp, key, &b, &h);		//\lnlbl{l:refbucket}
 	spin_lock(&htbp->htb_lock);			//\lnlbl{l:acq_bucket}
 	lsp->hbp[0] = htbp;				//\lnlbl{l:lsp0b}
-	lsp->hls_idx[0] = htp->ht_idx;
-	lsp->hls_hash[0] = h;				//\lnlbl{l:lsp0e}
+	lsp->hls_idx[0] = htp->ht_idx;			//\lnlbl{l:lsp0e}
+#ifndef FCV_SNIPPET
+	lsp->hls_hash[0] = h;
+#endif /* #ifndef FCV_SNIPPET */
 	if (b > READ_ONCE(htp->ht_resize_cur)) {	//\lnlbl{l:ifresized}
 		lsp->hbp[1] = NULL;			//\lnlbl{l:lsp1_1}
 		return;					//\lnlbl{l:fastret1}
@@ -190,12 +196,11 @@ hashtab_lock_mod(struct hashtab *htp_master, void *key,
 	htp = rcu_dereference(htp->ht_new);		//\lnlbl{l:new_hashtbl}
 	htbp = ht_get_bucket(htp, key, &b, &h);		//\lnlbl{l:get_newbkt}
 	spin_lock(&htbp->htb_lock);			//\lnlbl{l:acq_newbkt}
-	lsp->hbp[1] = lsp->hbp[0];			//\lnlbl{l:lsp1b}
-	lsp->hls_idx[1] = lsp->hls_idx[0];
-	lsp->hls_hash[1] = lsp->hls_hash[0];
-	lsp->hbp[0] = htbp;
-	lsp->hls_idx[0] = htp->ht_idx;
-	lsp->hls_hash[0] = h;				//\lnlbl{l:lsp1e}
+	lsp->hbp[1] = htbp;				//\lnlbl{l:lsp1b}
+	lsp->hls_idx[1] = htp->ht_idx;			//\lnlbl{l:lsp1e}
+#ifndef FCV_SNIPPET
+	lsp->hls_hash[1] = h;
+#endif /* #ifndef FCV_SNIPPET */
 }							//\lnlbl{l:e}
 
 static void						//\lnlbl{ul:b}
@@ -230,12 +235,7 @@ hashtab_lookup(struct hashtab *htp_master, void *key)
 
 	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{lkp:get_curtbl}
 	htep = ht_search_bucket(htp, key);		//\lnlbl{lkp:get_curbkt}
-	if (htep)					//\lnlbl{lkp:entchk}
-		return htep;				//\lnlbl{lkp:ret_match}
-	htp = rcu_dereference(htp->ht_new);		//\lnlbl{lkp:get_nxttbl}
-	if (!htp)					//\lnlbl{lkp:htpchk}
-		return NULL;				//\lnlbl{lkp:noresize}
-	return ht_search_bucket(htp, key);		//\lnlbl{lkp:ret_nxtbkt}
+	return htep;					//\lnlbl{lkp:ret}
 }							//\lnlbl{lkp:e}
 
 /*
@@ -248,9 +248,16 @@ void hashtab_add(struct ht_elem *htep,			//\lnlbl{add:b}
 	struct ht_bucket *htbp = lsp->hbp[0];		//\lnlbl{add:htbp}
 	int i = lsp->hls_idx[0];			//\lnlbl{add:i}
 
-	htep->hte_hash = lsp->hls_hash[0];		//\lnlbl{add:hash}
-	htep->hte_next[!i].prev = NULL;			//\lnlbl{add:initp}
+#ifndef FCV_SNIPPET
+	htep->hte_hash[0] = lsp->hls_hash[0];
+#endif /* #ifndef FCV_SNIPPET */
 	cds_list_add_rcu(&htep->hte_next[i], &htbp->htb_head); //\lnlbl{add:add}
+	if ((htbp = lsp->hbp[1])) {			//\lnlbl{add:ifnew}
+#ifndef FCV_SNIPPET
+		htep->hte_hash[1] = lsp->hls_hash[1];
+#endif /* #ifndef FCV_SNIPPET */
+		cds_list_add_rcu(&htep->hte_next[!i], &htbp->htb_head); //\lnlbl{add:addnew}
+	}
 }							//\lnlbl{add:e}
 
 /*
@@ -262,14 +269,9 @@ void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
 {
 	int i = lsp->hls_idx[0];			//\lnlbl{del:i}
 
-	if (htep->hte_next[i].prev) {			//\lnlbl{del:if}
-		cds_list_del_rcu(&htep->hte_next[i]);	//\lnlbl{del:del}
-		htep->hte_next[i].prev = NULL;		//\lnlbl{del:init}
-	}
-	if (lsp->hbp[1] && htep->hte_next[!i].prev) {	//\lnlbl{del:ifnew}
+	cds_list_del_rcu(&htep->hte_next[i]);		//\lnlbl{del:del}
+	if (lsp->hbp[1])				//\lnlbl{del:ifnew}
 		cds_list_del_rcu(&htep->hte_next[!i]);	//\lnlbl{del:delnew}
-		htep->hte_next[!i].prev = NULL;		//\lnlbl{del:initnew}
-	}
 }							//\lnlbl{del:e}
 //\end{snippet}
 
@@ -350,5 +352,11 @@ void defer_del_rcu(struct rcu_head *rhp)
 
 #define quiescent_state() rcu_quiescent_state()
 
+#ifndef FCV_SNIPPET
+#define check_hash() (htep->hte_hash[0] != hash && htep->hte_hash[1] != hash)
+#else
+#define check_hash() (0)
+#endif /* #ifndef FCV_SNIPPET */
+
 #include "hashtorture.h"
 #endif /* #ifdef TEST_HASH */
diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
index 6f47baa..d6345cc 100644
--- a/CodeSamples/datastruct/hash/hashtorture.h
+++ b/CodeSamples/datastruct/hash/hashtorture.h
@@ -62,6 +62,10 @@ void (*defer_del_done)(struct ht_elem *htep) = NULL;
 #define rcu_barrier() do ; while (0)
 #endif /* #ifndef quiescent_state */
 
+#ifndef check_hash
+#define check_hash() (htep->hte_hash != hash)
+#endif /* #ifndef check_hash */
+
 /*
  * Test variables.
  */
@@ -988,7 +992,7 @@ int zoo_lookup(char *key)
 	htep = hashtab_lookup(perftest_htp, hash, key);
 	zhep = container_of(htep, struct zoo_he, zhe_e);
 	BUG_ON(htep &&
-	       (htep->hte_hash != hash ||
+	       (check_hash() ||
 	        strncmp(zhep->name, (char *)key, ZOO_NAMELEN) != 0));
 	hashtab_unlock_lookup(perftest_htp, hash);
 	hashtab_lookup_done(htep);
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 175056c..c5898cd 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -887,7 +887,8 @@ which is the subject of the next section.
 Resizing is accomplished by the classic approach of inserting a level
 of indirection, in this case, the \co{ht} structure shown on
 lines~\lnref{ht:b}-\lnref{ht:e} of
-Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures}.
+Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures}
+(\path{hash_resize.c}).
 The \co{hashtab} structure shown on
 lines~\lnref{hashtab:b}-\lnref{hashtab:e} contains only a
 pointer to the current \co{ht} structure along with a spinlock that
@@ -1030,8 +1031,8 @@ corresponding to the key.
 Line~\lnref{acq_bucket} acquires that bucket's lock, which will prevent any concurrent
 resizing operation from distributing that bucket, though of course it
 will have no effect if that bucket has already been distributed.
-Lines~\lnref{lsp0b}-\lnref{lsp0e} store the bucket pointer,
-pointer-set index, and hash value into their respective fields in the
+Lines~\lnref{lsp0b}-\lnref{lsp0e} store the bucket pointer and
+pointer-set index into their respective fields in the
 \co{ht_lock_state} structure, which communicates the information to
 \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
 Line~\lnref{ifresized} then checks to see if a concurrent resize
@@ -1045,8 +1046,8 @@ Otherwise, a concurrent resize operation has already distributed this
 bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
 line~\lnref{get_newbkt} selects the bucket corresponding to the key,
 and line~\lnref{acq_newbkt} acquires the bucket's lock.
-Lines~\lnref{lsp1b}-\lnref{lsp1e} store the bucket pointer,
-pointer-set index, and hash value into their respective fields in the
+Lines~\lnref{lsp1b}-\lnref{lsp1e} store the bucket pointer and
+pointer-set index into their respective fields in the
 \co{ht_lock_state} structure, which communicates the information to
 \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
 Note that in this case, two locks are held, one in the old \co{ht_bucket}
@@ -1108,28 +1109,20 @@ hash lookups.
 Line~\lnref{get_curtbl} fetches the current hash table and
 line~\lnref{get_curbkt} searches the bucket corresponding to the
 specified key.
-If line~\lnref{entchk} determines that the search was successful,
-line~\lnref{ret_match} returns a pointer to the element that was located.
-Otherwise, line~\lnref{get_nxttbl} picks up a pointer to the next version,
-and if line~\lnref{htpchk} determines that there is no resize in progress,
-line~\lnref{noresize} returns \co{NULL}.
-When there is a resize in progress, execution reaches
-line~\lnref{ret_nxtbkt}, which returns the result of searching the
-bucket corresponding to \co{key} in the new version.
+Line~\lnref{ret} returns a pointer to the element that was located
+or \co{NULL} when the search failed.
 \end{lineref}
 
 \begin{lineref}[ln:datastruct:hash_resize:access:add]
 The \co{hashtab_add()} function on lines~\lnref{b}-\lnref{e} of the listing adds
 new data elements to the hash table.
-Line~\lnref{new} determines whether a resize was in progress and the
-corresponding old bucket has already been distributed (value of one)
-or not (value of zero).
-Line~\lnref{htbp} picks up the \co{ht_bucket} structure into which the
+Line~\lnref{htbp} picks up the current \co{ht_bucket} structure into which the
 new element is to be added, and line~\lnref{i} picks up the index of
 the pointer pair.
-Line~\lnref{hash} stores the hash value in the to-be-added element
-for debug purposes,
-Finally, line~\lnref{add} adds the new element to the proper hash bucket.
+Line~\lnref{add} adds the new element to the current hash bucket.
+Then line~\lnref{ifnew} determines if the bucket has been distributed to
+a new hash table, and if so,
+line~\lnref{addnew} adds the new element to the bucket in the new hash table.
 The caller is required to handle concurrency, for example, by invoking
 \co{hashtab_lock_mod()} before the call to \co{hashtab_add()} and invoking
 \co{hashtab_unlock_mod()} afterwards.
@@ -1140,34 +1133,16 @@ The \co{hashtab_del()} function on
 lines~\lnref{b}-\lnref{e} of the listing removes
 an existing element from the hash table.
 Line~\lnref{i} picks up the index of the pointer pair
-and line~\lnref{del} removes the specified element.
+and line~\lnref{del} removes the specified element from the current table.
+Then line~\lnref{ifnew} determines if the bucket has been distributed to
+a new hash table, and if so,
+line~\lnref{delnew} removes the sepcified element from the bucket in
+the new table.
 As with \co{hashtab_add()}, the caller is responsible for concurrency
 control and this concurrency control suffices for synchronizing with
 a concurrent resize operation.
 \end{lineref}
 
-\QuickQuiz{}
-	The \co{hashtab_del()} function in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
-	might not remove the element from the old hash table.
-	Doesn't this mean that readers might access this newly removed
-	element after it has been freed?
-\QuickQuizAnswer{
-	No.
-	The \co{hashtab_del()} function omits removing the element
-	from the old hash table only if the resize operation has
-	already progressed beyond the bucket containing the just-deleted
-	element.
-	But this means that new \co{hashtab_lookup()} operations will
-	use the new hash table when looking up that element.
-	Therefore, only old \co{hashtab_lookup()} operations that started
-	before the \co{hashtab_del()} might encounter the newly
-	removed element.
-	This means that \co{hashtab_del()} need only wait for an
-	RCU grace period to avoid inconveniencing
-	\co{hashtab_lookup()} operations.
-} \QuickQuizEnd
-
 \begin{listing*}[tb]
 \input{CodeSamples/datastruct/hash/hash_resize@resize.fcv}
 \caption{Resizable Hash-Table Resizing}
@@ -1211,10 +1186,10 @@ and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
 	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing},
 	what guarantees that the update to \co{->ht_new} on line~\lnref{set_newtbl}
 	will be seen as happening before the update to \co{->ht_resize_cur}
-	on line~\lnref{update_resize} from the perspective of \co{hashtab_lookup()},
-	\co{hashtab_add()}, and \co{hashtab_del()}?
-	In other words, what prevents \co{hashtab_lookup()},
-	\co{hashtab_add()}, and \co{hashtab_del()}, from dereferencing
+	on line~\lnref{update_resize} from the perspective of
+	\co{hashtab_add()} and \co{hashtab_del()}?
+	In other words, what prevents \co{hashtab_add()}
+	and \co{hashtab_del()} from dereferencing
 	a NULL pointer loaded from \co{->ht_new}?
 	\end{lineref}
 \QuickQuizAnswer{
-- 
2.7.4


