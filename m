Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32820 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726036AbfAEAKe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 4 Jan 2019 19:10:34 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0508a9l146569
        for <perfbook@vger.kernel.org>; Fri, 4 Jan 2019 19:10:33 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ptg2cubr3-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 04 Jan 2019 19:10:32 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 5 Jan 2019 00:10:31 -0000
Date: Fri, 4 Jan 2019 16:10:48 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 2/2] datastruct/hash: Annotate racy accesses with
 READ_ONCE/WRITE_ONCE
Reply-To: paulmck@linux.ibm.com
References: <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com>
 <20190102191822.GA30360@linux.ibm.com>
 <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
 <20190103172145.GG4170@linux.ibm.com>
 <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
 <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
 <422fd7bf-e025-66ab-e6dd-cc833cb8e83b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422fd7bf-e025-66ab-e6dd-cc833cb8e83b@gmail.com>
Message-Id: <20190105001048.GO4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jan 05, 2019 at 12:41:25AM +0900, Akira Yokosawa wrote:
> >From ed528d05b7800d651ef5e36de37732a06b456462 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 5 Jan 2019 00:15:47 +0900
> Subject: [PATCH 2/2] datastruct/hash: Annotate racy accesses with READ_ONCE/WRITE_ONCE
> 
> ht_get_bucket() runs concurrently with hash_resize().
> As a defensive coding rule to survive compiler optimization,
> accesses to (*htp)->ht_resize_cur, (*htp)->ht_new, and
> (*htp)->ht_idx should be annotated by READ_ONCE/WRITE_ONCE.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Thank you!

The trick I used to avoid having to apply this before getting the bugs
fixed was to compile with -O0.  Crude, but effective.  Plus handy in
that it allows gdb to actually show you the values of all the variables
instead of just saying the ones you need have been optimized out.  ;-)

Responses below, and update patch after that.  As always, please let
me know if I messed something up.

							Thanx, Paul

> ---
>  CodeSamples/datastruct/hash/hash_resize.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index 57c75c1..e1d92a6 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -137,13 +137,13 @@ ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
>  
>  	htbp = ht_get_bucket_single(*htp, key, b);	//\lnlbl{call_single}
>  								//\fcvexclude
> -	if (*b <= (*htp)->ht_resize_cur) {		//\lnlbl{resized}
> +	if (*b <= READ_ONCE((*htp)->ht_resize_cur)) {	//\lnlbl{resized}

Good point, this one is needed.

>  		smp_mb(); /* order ->ht_resize_cur before ->ht_new. */
> -		*htp = (*htp)->ht_new;			//\lnlbl{newtable}
> +		*htp = READ_ONCE((*htp)->ht_new);	//\lnlbl{newtable}

This one needs to be rcu_dereference().

>  		htbp = ht_get_bucket_single(*htp, key, b); //\lnlbl{newbucket}
>  	}
>  	if (i)						//\lnlbl{chk_i}
> -		*i = (*htp)->ht_idx;			//\lnlbl{set_idx}
> +		*i = READ_ONCE((*htp)->ht_idx);		//\lnlbl{set_idx}

This is -not- needed because ->ht_idx is constant once the new set of
buckets is exposed to readers.  (Yes, it was exposed before the last
change when you produced this patch, but that was just me being stupid,
so it is now fixed.)

>  	return htbp;					//\lnlbl{return}
>  }							//\lnlbl{e}
>  //\end{snippet}
> @@ -301,10 +301,10 @@ int hashtab_resize(struct hashtab *htp_master,
>  		spin_unlock(&htp_master->ht_lock);		//\lnlbl{rel_nomem}
>  		return -ENOMEM;					//\lnlbl{ret_nomem}
>  	}
> -	htp->ht_new = htp_new;					//\lnlbl{set_newtbl}
> +	WRITE_ONCE(htp->ht_new, htp_new);			//\lnlbl{set_newtbl}

This is now an smp_store_release().  Hmmm...  It really needs to instead
be rcu_assign_pointer(), doesn't it?

>  	synchronize_rcu();					//\lnlbl{sync_rcu}
>  	idx = htp->ht_idx;					//\lnlbl{get_curidx}
> -	htp_new->ht_idx = !idx;
> +	WRITE_ONCE(htp_new->ht_idx, !idx);

Now that this is ordered before the ->ht_new update, it can just be a
plain store.

>  	for (i = 0; i < htp->ht_nbuckets; i++) {		//\lnlbl{loop:b}
>  		htbp = &htp->ht_bkt[i];				//\lnlbl{get_oldcur}
>  		spin_lock(&htbp->htb_lock);			//\lnlbl{acq_oldcur}
> @@ -315,7 +315,7 @@ int hashtab_resize(struct hashtab *htp_master,
>  			spin_unlock(&htbp_new->htb_lock);
>  		}						//\lnlbl{loop_list:e}
>  		smp_mb(); /* Fill new buckets before claiming them. */
> -		htp->ht_resize_cur = i;				//\lnlbl{update_resize}
> +		WRITE_ONCE(htp->ht_resize_cur, i);		//\lnlbl{update_resize}

Good catch, this is needed.

>  		spin_unlock(&htbp->htb_lock);			//\lnlbl{rel_oldcur}
>  	}							//\lnlbl{loop:e}
>  	rcu_assign_pointer(htp_master->ht_cur, htp_new);	//\lnlbl{rcu_assign}

------------------------------------------------------------------------

commit 714422e1a98ffdf3de8bc0b87896eccec24be272
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Fri Jan 4 16:07:22 2019 -0800

    datastruct/hash: Annotate racy accesses
    
    Because the resizable hash table allows adds, deletes, and lookups to
    run concurrently with resizing, ht_get_bucket() can run concurrently
    with hash_resize().  As a defensive coding rule to survive compiler
    optimization, accesses to (*htp)->ht_resize_cur should be annotated
    by rcu_dereference()/rcu_assign_pointer() and (*htp)->ht_new should be
    annotated by READ_ONCE()/WRITE_ONCE().
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    [ paulmck: Adjusted based on recent changes. ]
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 37251a769212..173043a5b788 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -143,9 +143,9 @@ ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
 
 	htbp = ht_get_bucket_single(*htp, key, b, NULL); //\lnlbl{call_single}
 								//\fcvexclude
-	if (*b <= (*htp)->ht_resize_cur) {		//\lnlbl{resized}
+	if (*b <= READ_ONCE((*htp)->ht_resize_cur)) {	//\lnlbl{resized}
 		smp_mb(); /* order ->ht_resize_cur before ->ht_new. */
-		*htp = (*htp)->ht_new;			//\lnlbl{newtable}
+		*htp = rcu_dereference((*htp)->ht_new);	//\lnlbl{newtable}
 		htbp = ht_get_bucket_single(*htp, key, b, NULL); //\lnlbl{newbucket}
 	}
 	if (i)						//\lnlbl{chk_i}
@@ -185,7 +185,7 @@ resize_lock_mod(struct hashtab *htp_master, void *key,
 	lsp->hbp[0] = htbp;
 	lsp->hls_idx[0] = htp->ht_idx;
 	lsp->hls_hash[0] = h;
-	if (b > htp->ht_resize_cur) {			//\lnlbl{lock:chk_resz_dist}
+	if (b > READ_ONCE(htp->ht_resize_cur)) {	//\lnlbl{lock:chk_resz_dist}
 		lsp->hbp[1] = NULL;
 		return;					//\lnlbl{lock:fastret1}
 	}
@@ -303,7 +303,7 @@ int hashtab_resize(struct hashtab *htp_master,
 	}
 	idx = htp->ht_idx;					//\lnlbl{get_curidx}
 	htp_new->ht_idx = !idx;
-	smp_store_release(&htp->ht_new, htp_new);		//\lnlbl{set_newtbl}
+	rcu_assign_pointer(htp->ht_new, htp_new);		//\lnlbl{set_newtbl}
 	synchronize_rcu();					//\lnlbl{sync_rcu}
 	for (i = 0; i < htp->ht_nbuckets; i++) {		//\lnlbl{loop:b}
 		htbp = &htp->ht_bkt[i];				//\lnlbl{get_oldcur}
@@ -315,7 +315,7 @@ int hashtab_resize(struct hashtab *htp_master,
 			spin_unlock(&htbp_new->htb_lock);
 		}						//\lnlbl{loop_list:e}
 		smp_mb(); /* Fill new buckets before claiming them. */
-		htp->ht_resize_cur = i;				//\lnlbl{update_resize}
+		WRITE_ONCE(htp->ht_resize_cur, i);		//\lnlbl{update_resize}
 		spin_unlock(&htbp->htb_lock);			//\lnlbl{rel_oldcur}
 	}							//\lnlbl{loop:e}
 	rcu_assign_pointer(htp_master->ht_cur, htp_new);	//\lnlbl{rcu_assign}

