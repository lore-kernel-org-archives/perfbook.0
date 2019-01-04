Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wRF++khqNzeS6B+RtMgN1OF1IqA9b3Bm/tlYVwgIfdI=;
        b=D4txCOWOphoLE/lrKnWK3n0aP76bbWsyhjX2q1v3SjzfRs9RLaiAvt9/7dGs589HsZ
         D5S3pfc2R6OfISgpnvPjXGeNprtBYdj0YVkp1R3tcFKP1zZdjqukSmkzwJThJ/O1uyJY
         5Kednu7fnxKy2NxZ/2WSYslvPIqSy8HqPGeOZ73pdDw94Ck0+XStxNGUFd1xUP95ZdSA
         9YRU9mlLNytFceWET+PqnXAx9s0+QMNuxyEclksOYe/4/kG5GAUZRQqjUAvtQUq4GHD4
         PB1vJ2EuW+pcxfhRCsh5LBbDhBIPIEJ2s0jv3/BPECc2GcAfp6wPT4f17f8lWQEJ22OQ
         PwhQ==
Subject: [PATCH 2/2] datastruct/hash: Annotate racy accesses with
 READ_ONCE/WRITE_ONCE
References: <20181226150018.GY4170@linux.ibm.com>
 <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
 <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
 <20181231210307.GU4170@linux.ibm.com>
 <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com> <20190102191822.GA30360@linux.ibm.com>
 <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
 <20190103172145.GG4170@linux.ibm.com>
 <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
 <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <422fd7bf-e025-66ab-e6dd-cc833cb8e83b@gmail.com>
Date: Sat, 5 Jan 2019 00:41:25 +0900
MIME-Version: 1.0
In-Reply-To: <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ed528d05b7800d651ef5e36de37732a06b456462 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Jan 2019 00:15:47 +0900
Subject: [PATCH 2/2] datastruct/hash: Annotate racy accesses with READ_ONCE/WRITE_ONCE

ht_get_bucket() runs concurrently with hash_resize().
As a defensive coding rule to survive compiler optimization,
accesses to (*htp)->ht_resize_cur, (*htp)->ht_new, and
(*htp)->ht_idx should be annotated by READ_ONCE/WRITE_ONCE.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_resize.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 57c75c1..e1d92a6 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -137,13 +137,13 @@ ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
 
 	htbp = ht_get_bucket_single(*htp, key, b);	//\lnlbl{call_single}
 								//\fcvexclude
-	if (*b <= (*htp)->ht_resize_cur) {		//\lnlbl{resized}
+	if (*b <= READ_ONCE((*htp)->ht_resize_cur)) {	//\lnlbl{resized}
 		smp_mb(); /* order ->ht_resize_cur before ->ht_new. */
-		*htp = (*htp)->ht_new;			//\lnlbl{newtable}
+		*htp = READ_ONCE((*htp)->ht_new);	//\lnlbl{newtable}
 		htbp = ht_get_bucket_single(*htp, key, b); //\lnlbl{newbucket}
 	}
 	if (i)						//\lnlbl{chk_i}
-		*i = (*htp)->ht_idx;			//\lnlbl{set_idx}
+		*i = READ_ONCE((*htp)->ht_idx);		//\lnlbl{set_idx}
 	return htbp;					//\lnlbl{return}
 }							//\lnlbl{e}
 //\end{snippet}
@@ -301,10 +301,10 @@ int hashtab_resize(struct hashtab *htp_master,
 		spin_unlock(&htp_master->ht_lock);		//\lnlbl{rel_nomem}
 		return -ENOMEM;					//\lnlbl{ret_nomem}
 	}
-	htp->ht_new = htp_new;					//\lnlbl{set_newtbl}
+	WRITE_ONCE(htp->ht_new, htp_new);			//\lnlbl{set_newtbl}
 	synchronize_rcu();					//\lnlbl{sync_rcu}
 	idx = htp->ht_idx;					//\lnlbl{get_curidx}
-	htp_new->ht_idx = !idx;
+	WRITE_ONCE(htp_new->ht_idx, !idx);
 	for (i = 0; i < htp->ht_nbuckets; i++) {		//\lnlbl{loop:b}
 		htbp = &htp->ht_bkt[i];				//\lnlbl{get_oldcur}
 		spin_lock(&htbp->htb_lock);			//\lnlbl{acq_oldcur}
@@ -315,7 +315,7 @@ int hashtab_resize(struct hashtab *htp_master,
 			spin_unlock(&htbp_new->htb_lock);
 		}						//\lnlbl{loop_list:e}
 		smp_mb(); /* Fill new buckets before claiming them. */
-		htp->ht_resize_cur = i;				//\lnlbl{update_resize}
+		WRITE_ONCE(htp->ht_resize_cur, i);		//\lnlbl{update_resize}
 		spin_unlock(&htbp->htb_lock);			//\lnlbl{rel_oldcur}
 	}							//\lnlbl{loop:e}
 	rcu_assign_pointer(htp_master->ht_cur, htp_new);	//\lnlbl{rcu_assign}
-- 
2.7.4


