Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38080 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728632AbfAKPnU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 11 Jan 2019 10:43:20 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0BFToru102002
        for <perfbook@vger.kernel.org>; Fri, 11 Jan 2019 10:43:18 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pxu8x98da-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 11 Jan 2019 10:43:17 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 11 Jan 2019 15:43:17 -0000
Date: Fri, 11 Jan 2019 07:43:14 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Question regarding hash_resize
Reply-To: paulmck@linux.ibm.com
References: <6d75361a-8a7f-1190-0c34-dccb7e2dea01@gmail.com>
 <CABoNC81zQw-qfd-7=RGNssos004f9+dp+nZvRGh4Udjc=j5YYQ@mail.gmail.com>
 <20190108152846.GN1215@linux.ibm.com>
 <b7ccf8ed-dc55-0b44-af2c-be2d31c7f6fd@gmail.com>
 <20190108183931.GR1215@linux.ibm.com>
 <288a7aca-75ba-d9ba-297b-5bbd98054d5f@gmail.com>
 <20190109001959.GS1215@linux.ibm.com>
 <20190109025913.GA7904@linux.ibm.com>
 <20190111040822.GA23716@linux.ibm.com>
 <a367c4fa-a085-4470-1d48-a3a517bb9fb1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a367c4fa-a085-4470-1d48-a3a517bb9fb1@gmail.com>
Message-Id: <20190111154314.GC1215@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Fri, Jan 11, 2019 at 11:25:18PM +0900, Akira Yokosawa wrote:
> On 2019/01/11 13:08, Paul E. McKenney wrote:
> > On Tue, Jan 08, 2019 at 06:59:13PM -0800, Paul E. McKenney wrote:
> >> On Tue, Jan 08, 2019 at 04:19:59PM -0800, Paul E. McKenney wrote:
> >>> On Wed, Jan 09, 2019 at 07:16:05AM +0900, Akira Yokosawa wrote:
> >>>> On 2019/01/08 10:39:31 -0800, Paul E. McKenney wrote:
> >>>>> On Wed, Jan 09, 2019 at 12:35:37AM +0900, Akira Yokosawa wrote:
> >>>>>> On 2019/01/09 0:28, Paul E. McKenney wrote:
> >>>>>>> On Tue, Jan 08, 2019 at 09:56:57AM +0800, Junchang Wang wrote:
> >>>>>>>> On Tue, Jan 8, 2019 at 7:06 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> >>>>>>>>> On 2019/01/08 07:54:16 +0900, Akira Yokosawa wrote:
> >>>
> >>> [ . . . ]
> >>>
> >>>>>>>> Hi Paul and Akira,
> >>>>>>>>
> >>>>>>>> Thanks a lot for the comments, which I need some more time to look
> >>>>>>>> into. For Paul's patch, I have a few concerns. Please take a look.
> >>>>>>>>
> >>>>>>>> My understanding is that with this path, during the time period when
> >>>>>>>> the resizing thread is running, an updater may insert/delete an item
> >>>>>>>> into/from the new hash table, while readers are still looking up data
> >>>>>>>> in the old one, resulting the readers are unaware of
> >>>>>>>> insertions/deletions happening simultaneously. For example, it seems
> >>>>>>>> the following sequence could happen.
> >>>>>>>>
> >>>>>>>> 1. The resizing thread starts.
> >>>>>>>> 2. The resizing thread successfully passes bucket *B* of the old hash table.
> >>>>>>>> 3. An updater wants to insert a new item *I* which should be inserted
> >>>>>>>> into bucket *B*.
> >>>>>>>> 4. The updater will select the new hash table and insert the item *I*
> >>>>>>>> into the new hash table.
> >>>>>>>> 5. A read request comes in and wants to lookup item *I*. The lookup
> >>>>>>>> request will check the old hash table and fail. Doesn't it?
> >>>>>>>> 6. The resizing thread exits.
> >>>>>>>> 7. Now subsequent read requests can successfully find item *I*.
> >>>>>>>
> >>>>>>> Yes, this can happen.
> >>>>>>>
> >>>>>>>> Is my understanding correct? Please let me know if I misunderstood
> >>>>>>>> anything. Give the truth that this patch can accelerate the fast path,
> >>>>>>>> I think it should be OK because resizing is typically happen rarely.
> >>>>>>>> Just want to make sure I fully understand the algorithm.
> >>>>>>>
> >>>>>>> It is a design choice, and some users would prefer not to fail to see
> >>>>>>> new items during a resize.  One approach would be to revert back to
> >>>>>>> the old-style checking, and another would be to provide a separate
> >>>>>>> lookup interface that synchronizes with adds and deletes.
> >>>>>>>
> >>>>>>> So, I could add a quick quiz with this information, I could revert the
> >>>>>>> change, or I could add another lookup function that provided more timely
> >>>>>>> information.  Left to myself, I would provide a quick quiz, but what
> >>>>>>> do you guys think?
> >>>>>>
> >>>>>> Hi, I was composing a message, but now I'm replying to this one.
> >>>>>> I think adding a quick quiz would be a good idea.
> >>>>>
> >>>>> But in the meantime, it occurred to me that I was looking at the
> >>>>> problem in the wrong way.  I believe that the following patch makes
> >>>>> hashtab_lookup() find elements recently added by hashtab_add(), even
> >>>>> during a resize, and without the need for memory barriers.
> >>>>>
> >>>>> The scenario that convinced me to take this approach is when a thread
> >>>>> does hashtab_add(), then immediately searches for the newly added element.
> >>>>> Failing to find it would be quite a surprise to most people.
> >>>>
> >>>> When a thread does hashtab_del() and immediately checks the deletion,
> >>>> it still finds the deleted element while resizing is in progress.
> >>>> This would also be a surprise. Current version looks less consistent
> >>>> than the simpler one did.
> >>>
> >>> I bet I can fix that...  Famous last words!  ;-)
> >>>
> >>> But please see below and tell me what you think.
> >>
> >> Well, that is not quite right, but close.  Working on it...
> > 
> > Seems to be stable.  I have not yet updated the text.  I am currently
> > looking into whether I can get rid of ->ht_resize_cur.
> 
> Without ->ht_resize_cur, it would be hard (or impossible) for
> hashtab_lock_mod() to see if bucket in the new table needs
> to be locked, wouldn't it?

The thought is to just unconditionally lock the buckets in both tables
when resizing.  This would of course result in added locking overhead
for adds and deletes, but only during resizing.

> I have another idea to simplify the code, with the possibility of
> increasing update-side cost during resizing.
> 
> By keeping updating ->cur hashtab until the resizing finished,
> hashtab_lookup() only needs to see ->cur.
> hashtab_add() and hashtab_del() update both buckets if hashtab_lock_mod()
> has locked two buckets.

Now that hashtab_lookup() does a lookup in both buckets, it should not be
necessary to add to both buckets.  But you are right that it should not
hurt, given that there is no API for iterating over the entire hash table.
And I do see how it reduces the non-resize-time cost of failed lookups,
which is a good thing.

So this is a promising approach!  One question interspersed below.

							Thanx, Paul

> I've added the code as the alternative code to avoid messing line lables.
> The diff is appended below.
> 
> Thoughts?
> 
> Note: By adding a "-DFCV_SNIPPET" flag to the compiler, you can compile
> your version of the code.
> 
>         Thanks, Akira
> 
> >                                                        In theory, this
> > would make it trivial to make the resizing "pause", releasing the lock
> > from time to time.
> > 
> > For whatever it is worth...
> > 
> > 							Thanx, Paul
> > 
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index 9f9fe8c..35bc847 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -30,7 +30,11 @@
>  struct ht_elem {
>  	struct rcu_head rh;
>  	struct cds_list_head hte_next[2];		//\lnlbl{ht_elem:next}
> +#ifndef FCV_SNIPPET
> +	unsigned long hte_hash[2];
> +#else /* #ifndef FCV_SNIPPET */
>  	unsigned long hte_hash;
> +#endif /* #ifndef FCV_SNIPPET */
>  };
>  
>  /* Hash-table bucket element. */
> @@ -230,12 +234,16 @@ hashtab_lookup(struct hashtab *htp_master, void *key)
>  
>  	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{lkp:get_curtbl}
>  	htep = ht_search_bucket(htp, key);		//\lnlbl{lkp:get_curbkt}
> +#ifndef FCV_SNIPPET
> +	return htep;
> +#else /* #ifndef FCV_SNIPPET */
>  	if (htep)					//\lnlbl{lkp:entchk}
>  		return htep;				//\lnlbl{lkp:ret_match}
>  	htp = rcu_dereference(htp->ht_new);		//\lnlbl{lkp:get_nxttbl}
>  	if (!htp)					//\lnlbl{lkp:htpchk}
>  		return NULL;				//\lnlbl{lkp:noresize}
>  	return ht_search_bucket(htp, key);		//\lnlbl{lkp:ret_nxtbkt}
> +#endif /* #ifndef FCV_SNIPPET */
>  }							//\lnlbl{lkp:e}
>  
>  /*
> @@ -248,9 +256,18 @@ void hashtab_add(struct ht_elem *htep,			//\lnlbl{add:b}
>  	struct ht_bucket *htbp = lsp->hbp[0];		//\lnlbl{add:htbp}
>  	int i = lsp->hls_idx[0];			//\lnlbl{add:i}
>  
> +#ifndef FCV_SNIPPET
> +	htep->hte_hash[0] = lsp->hls_hash[0];
> +	cds_list_add_rcu(&htep->hte_next[i], &htbp->htb_head);
> +	if ((htbp = lsp->hbp[1])) {
> +	  htep->hte_hash[1] = lsp->hls_hash[1];
> +	  cds_list_add_rcu(&htep->hte_next[!i], &htbp->htb_head);
> +	}
> +#else /* #ifndef FCV_SNIPPET */
>  	htep->hte_hash = lsp->hls_hash[0];		//\lnlbl{add:hash}
>  	htep->hte_next[!i].prev = NULL;			//\lnlbl{add:initp}
>  	cds_list_add_rcu(&htep->hte_next[i], &htbp->htb_head); //\lnlbl{add:add}
> +#endif /* #ifndef FCV_SNIPPET */
>  }							//\lnlbl{add:e}
>  
>  /*
> @@ -262,6 +279,11 @@ void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
>  {
>  	int i = lsp->hls_idx[0];			//\lnlbl{del:i}
>  
> +#ifndef FCV_SNIPPET
> +	cds_list_del_rcu(&htep->hte_next[i]);
> +	if (lsp->hbp[1])
> +	  cds_list_del_rcu(&htep->hte_next[!i]);

What if the element was added before the resize started, so that it is not
in the new version of the table?  Or are we initializing each element's
pointers to point to themselves somewhere that I am currently blind to?

> +#else /* #ifndef FCV_SNIPPET */
>  	if (htep->hte_next[i].prev) {			//\lnlbl{del:if}
>  		cds_list_del_rcu(&htep->hte_next[i]);	//\lnlbl{del:del}
>  		htep->hte_next[i].prev = NULL;		//\lnlbl{del:init}
> @@ -270,6 +292,7 @@ void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
>  		cds_list_del_rcu(&htep->hte_next[!i]);	//\lnlbl{del:delnew}
>  		htep->hte_next[!i].prev = NULL;		//\lnlbl{del:initnew}
>  	}
> +#endif /* #ifndef FCV_SNIPPET */
>  }							//\lnlbl{del:e}
>  //\end{snippet}
>  
> @@ -350,5 +373,9 @@ void defer_del_rcu(struct rcu_head *rhp)
>  
>  #define quiescent_state() rcu_quiescent_state()
>  
> +#ifndef FCV_SNIPPET
> +#define check_hash() (htep->hte_hash[0] != hash && htep->hte_hash[1] != hash)
> +#endif /* #ifndef FCV_SNIPPET */
> +
>  #include "hashtorture.h"
>  #endif /* #ifdef TEST_HASH */
> diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
> index 6f47baa..d6345cc 100644
> --- a/CodeSamples/datastruct/hash/hashtorture.h
> +++ b/CodeSamples/datastruct/hash/hashtorture.h
> @@ -62,6 +62,10 @@ void (*defer_del_done)(struct ht_elem *htep) = NULL;
>  #define rcu_barrier() do ; while (0)
>  #endif /* #ifndef quiescent_state */
>  
> +#ifndef check_hash
> +#define check_hash() (htep->hte_hash != hash)
> +#endif /* #ifndef check_hash */
> +
>  /*
>   * Test variables.
>   */
> @@ -988,7 +992,7 @@ int zoo_lookup(char *key)
>  	htep = hashtab_lookup(perftest_htp, hash, key);
>  	zhep = container_of(htep, struct zoo_he, zhe_e);
>  	BUG_ON(htep &&
> -	       (htep->hte_hash != hash ||
> +	       (check_hash() ||
>  	        strncmp(zhep->name, (char *)key, ZOO_NAMELEN) != 0));
>  	hashtab_unlock_lookup(perftest_htp, hash);
>  	hashtab_lookup_done(htep);
> 
> 

