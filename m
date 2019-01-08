Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42466 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727484AbfAHSji (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 8 Jan 2019 13:39:38 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x08IdJgE139785
        for <perfbook@vger.kernel.org>; Tue, 8 Jan 2019 13:39:35 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pvy6mexgu-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 08 Jan 2019 13:39:34 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 8 Jan 2019 18:39:33 -0000
Date: Tue, 8 Jan 2019 10:39:31 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Question regarding hash_resize
Reply-To: paulmck@linux.ibm.com
References: <CABoNC81XkNKv6=g2GUq4pNkwc4mcZ1FyZbjreD9KRfxQQUuPYg@mail.gmail.com>
 <20190107183317.GB1215@linux.ibm.com>
 <63181ff3-bcfa-0819-460a-867e438a22f7@gmail.com>
 <6d75361a-8a7f-1190-0c34-dccb7e2dea01@gmail.com>
 <CABoNC81zQw-qfd-7=RGNssos004f9+dp+nZvRGh4Udjc=j5YYQ@mail.gmail.com>
 <20190108152846.GN1215@linux.ibm.com>
 <b7ccf8ed-dc55-0b44-af2c-be2d31c7f6fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7ccf8ed-dc55-0b44-af2c-be2d31c7f6fd@gmail.com>
Message-Id: <20190108183931.GR1215@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Wed, Jan 09, 2019 at 12:35:37AM +0900, Akira Yokosawa wrote:
> On 2019/01/09 0:28, Paul E. McKenney wrote:
> > On Tue, Jan 08, 2019 at 09:56:57AM +0800, Junchang Wang wrote:
> >> On Tue, Jan 8, 2019 at 7:06 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> >>> On 2019/01/08 07:54:16 +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> On 2019/01/07 10:33:17 -0800, Paul E. McKenney wrote:
> >>>>> On Mon, Jan 07, 2019 at 09:49:19PM +0800, Junchang Wang wrote:
> >>>>>> Hi all,
> >>>>>>
> >>>>>> I'm reading hash_resize recently, and have a few questions regarding
> >>>>>> this algorithm. Please take a look if you have time. Any suggestions
> >>>>>> are warmly welcomed.
> >>>>>>
> >>>>>> === Question 1 ===
> >>>>>> In hash_resize.c : hashtab_lock_mod
> >>>>>> 186         if (b > READ_ONCE(htp->ht_resize_cur)) {
> >>>>>> 187                 lsp->hbp[1] = NULL;
> >>>>>> 188                 return;
> >>>>>> 189         }
> >>>>>> 190         htp = rcu_dereference(htp->ht_new);
> >>>>>>
> >>>>>> It seems we are missing a barrier (e.g., smp_mb) in between lines 189
> >>>>>> and 190, because neither READ_ONCE() nor rcu_dereference() can prevent
> >>>>>> compilers and hardware from reordering the two unrelated variables,
> >>>>>> ht_resize_cur and ht_new. Is my understanding correct?
> >>>>>
> >>>>> Ah, but hashtab_lock_mod() is invoked within an RCU read-side critical
> >>>>> section
> >>>>
> >>>> You mean "rcu_read_lock() at the beginning of hashtab_lock_mod() starts
> >>>> an RCU read-side critical section", don't you?
> >>>>
> >>>>>         and there is a synchronize_rcu() between the update to ->ht_new
> >>>>> and the updates to ->ht_resize_cur.  For more details on how this works,
> >>>>> please see https://lwn.net/Articles/573497/.
> >>>>>
> >>>>> Of course, if you find a code path in which a call to hashtab_lock_mod()
> >>>>> is invoked outside of an RCU read-side critical section, that would be
> >>>>> a bug.  (Can you tell me an exception to this rule, that is, a case
> >>>>> where hashtab_lock_mod() could safely be invoked outside of an RCU
> >>>>> read-side critical section?)
> >>>>>
> >>>>>> === Question 2 ===
> >>>>>> In hash_resize.c, each time an updater wants to access a bucket, the
> >>>>>> updater must first acquire the bucket's lock (htb_lock), preventing
> >>>>>> other updaters accessing the same bucket concurrently. This approach
> >>>>>> is OK if the linked list of a bucket is relatively short, but for a
> >>>>>> larger system where linked lists are long enough and the
> >>>>>> perftest_resize thread is running simultaneously, it could become a
> >>>>>> potential performance bottleneck. One naive solution is to allow
> >>>>>> multiple updaters to access the same bucket, only if they don't
> >>>>>> operate on the same item of the list of this bucket. I wonder if there
> >>>>>> are any existing works or discussions on this topic?
> >>>>>
> >>>>> One approach is to use a hashed array of locks, and to hash a given
> >>>>> element's address to locate the lock to be used.  Please see
> >>>>> Section 7.1.1.5 ("Conditional Locking") and Section 7.1.1.6 ("Acquire
> >>>>> Needed Locks First"), including Quick Quiz 7.9, for additional details.
> >>>>>
> >>>>> Another approach is to use RCU to protect traversals, and locks within the
> >>>>> linked-list elements themselves.  These locks are conditionally acquired
> >>>>> (again, please see Section 7.1.1.5), and deadlock is avoided by acquiring
> >>>>> them in list order, and the tricks in Quick Quiz 7.9.
> >>>>>
> >>>>> Non-blocking synchronization can also be used, but it is often quite a
> >>>>> bit more complicated.  See for example the split-order list of Shalev
> >>>>> and Shavit, along with Desnoyers's RCU-protected extension in the
> >>>>> userspace RCU library.
> >>>>>
> >>>>> But it is usually -way- better to just choose a good hash function and
> >>>>> to increase the number of buckets.  Which is of course one reason for
> >>>>> having resizable hash tables.  ;-)
> >>>>>
> >>>>> But the other techniques can be useful in more complex linked data
> >>>>> structures, such as graphs, where there is no reasonable way to
> >>>>> partition the data.  Nevertheless, many people choose to do the
> >>>>> partitioning anyway, especially on distributed systems.
> >>>>>
> >>>>>> === Question 3 ===
> >>>>>> Chapter Data Structures also discusses other resizable hash tables,
> >>>>>> namely "Resizable, scalable, concurrent hash tables via relativistic
> >>>>>> programming" from Josh Triplett, which can save memory footprint by
> >>>>>> using a single pair of pointers. But my understanding is that
> >>>>>> perftest_resize.c is unique in that it allows you to rebuild the hash
> >>>>>> table by utilizing a different hash function, which could be very
> >>>>>> useful in practice (e.g., to prevent DDoS attack). Other solutions do
> >>>>>> not share this property. Is my understanding correct? Did I miss any
> >>>>>> discussions on this topic in perfbook?
> >>>>>
> >>>>> Indeed, to the best of my knowledge, Herbert Xu's pointer-pair approach
> >>>>> (which I use in hash_resize.c) is the only one allowing arbitrary changes
> >>>>> to hash functions.  I expect that this advantage will become increasingly
> >>>>> important as security issues become more challenging.  Furthermore, I
> >>>>> suspect that the pointer-pair approach is faster and more scalable.
> >>>>> It is certainly simpler.
> >>>>>
> >>>>> On the other hand, one advantage of the other two approaches is decreased
> >>>>> memory consumption.
> >>>>>
> >>>>> Another advantage of Josh Triplett's pointer-unzip approach is that
> >>>>> concurrent updates are (in theory, anyway) not blocked for as long
> >>>>> by resize operations.  The other edge of this sword is that resizing
> >>>>> is much slower, given the need to wait for many RCU grace periods.
> >>>>>
> >>>>> Another advantage of Mathieu Desnoyers's RCUified variant of Shalev
> >>>>> and Shavit's split-order list is that all operations are non-blocking,
> >>>>> which can be important on massively overloaded systems, such as one
> >>>>> might find in cloud computing.
> >>>>>
> >>>>>> === Question 4 ===
> >>>>>> In the current implementation of hash_resize.c, the perftest_resize
> >>>>>> could block an updater, and vice versa. It seems this is not what we
> >>>>>> expected. Ideally, they should be allowed to run concurrently, or at
> >>>>>> least the perftest_resize thread should have lower priority and
> >>>>>> updaters should never be blocked by the perftest_resize thread. Is
> >>>>>> that right? I'm very interested in helping improve. Please let me know
> >>>>>> if you have any suggestions.
> >>>>>
> >>>>> In hash_resize.c, an updater is blocked only for the time required to
> >>>>> redisposition a bucket.  This is a great improvement over blocking
> >>>>> updaters for the full resize over all buckets.
> >>>>>
> >>>>> But yes, it is not hard to do better, for example, periodically dropping
> >>>>> the old-table lock in hashtab_resize().  This requires a few careful
> >>>>> adjustments, of course.  Can you tell me what these adjustments are?
> >>>>>
> >>>>> Hmmm...  I could simplify hashtab_lookup(), couldn't I?  After all,
> >>>>> optimizing for the race with hashtab_resize() doesn't make a whole lot
> >>>>> of sense.  Please see the patch below.  Thoughts?
> >>>>>
> >>>>>                                                      Thanx, Paul
> >>>>>
> >>>>> ------------------------------------------------------------------------
> >>>>>
> >>>>> commit 737646a9c868d841b32199b52f5569668975953e
> >>>>> Author: Paul E. McKenney <paulmck@linux.ibm.com>
> >>>>> Date:   Mon Jan 7 10:29:14 2019 -0800
> >>>>>
> >>>>>     datastruct/hash: Simplify hashtab_lookup()
> >>>>>
> >>>>>     Because resizing leaves the old hash table intact, and because lookups
> >>>>>     are carried out within RCU read-side critical sections (which prevent
> >>>>>     a second resizing operation from starting), there is no need for a
> >>>>>     lookup to search anywhere but in the old hash table.  And in the common
> >>>>>     case, there is no resize, so there is no new hash table.  Therefore,
> >>>>>     eliminating the check for resizing speeds things up in the common
> >>>>>     case.  In addition, this simplifies the code.
> >>>>>
> >>>>>     This commit therefore eliminates the ht_get_bucket() function,
> >>>>>     renames the ht_get_bucket_single() function to ht_get_bucket(),
> >>>>>     and modifies callers appropriately.
> >>>>>
> >>>>>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> >>>>>
> >>>>> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> >>>>> index 29e05f907200..be4157959b83 100644
> >>>>> --- a/CodeSamples/datastruct/hash/hash_resize.c
> >>>>> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> >>>>> @@ -124,8 +124,7 @@ void hashtab_free(struct hashtab *htp_master)
> >>>>>  //\begin{snippet}[labelbase=ln:datastruct:hash_resize:get_bucket,commandchars=\\\@\$]
> >>>>>  /* Get hash bucket corresponding to key, ignoring the possibility of resize. */
> >>>>>  static struct ht_bucket *                           //\lnlbl{single:b}
> >>>>> -ht_get_bucket_single(struct ht *htp, void *key, long *b,
> >>>>> -                     unsigned long *h)
> >>>>> +ht_get_bucket(struct ht *htp, void *key, long *b, unsigned long *h)
> >>>>>  {
> >>>>>      unsigned long hash = htp->ht_gethash(key);
> >>>>>
> >>>>> @@ -134,24 +133,6 @@ ht_get_bucket_single(struct ht *htp, void *key, long *b,
> >>>>>              *h = hash;                              //\lnlbl{single:h}
> >>>>>      return &htp->ht_bkt[*b];                        //\lnlbl{single:return}
> >>>>>  }                                                   //\lnlbl{single:e}
> >>>>> -
> >>>>> -/* Get hash bucket correesponding to key, accounting for resize. */
> >>>>> -static struct ht_bucket *                           //\lnlbl{b}
> >>>>> -ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
> >>>>> -{
> >>>>> -    struct ht_bucket *htbp;
> >>>>> -
> >>>>> -    htbp = ht_get_bucket_single(*htp, key, b, NULL); //\lnlbl{call_single}
> >>>>> -                                                            //\fcvexclude
> >>>>> -    if (*b <= READ_ONCE((*htp)->ht_resize_cur)) {   //\lnlbl{resized}
> >>>>> -            smp_mb(); /* order ->ht_resize_cur before ->ht_new. */
> >>>>
> >>>> If we can remove this memory barrier, the counterpart smp_mb() in
> >>>> hashtab_resize() becomes unnecessary, doesn't it?
> >>>
> >>> And the WRITE_ONCE() in the following line.
> >>>
> >>>         Thanks, Akira
> >>>>
> >>>>         Thanks, Akira
> >>>>
> >>>>> -            *htp = rcu_dereference((*htp)->ht_new); //\lnlbl{newtable}
> >>>>> -            htbp = ht_get_bucket_single(*htp, key, b, NULL); //\lnlbl{newbucket}
> >>>>> -    }
> >>>>> -    if (i)                                          //\lnlbl{chk_i}
> >>>>> -            *i = (*htp)->ht_idx;                    //\lnlbl{set_idx}
> >>>>> -    return htbp;                                    //\lnlbl{return}
> >>>>> -}                                                   //\lnlbl{e}
> >>>>>  //\end{snippet}
> >>>>>
> >>>>>  /* Read-side lock/unlock functions. */
> >>>>> @@ -178,7 +159,7 @@ hashtab_lock_mod(struct hashtab *htp_master, void *key,
> >>>>>
> >>>>>      rcu_read_lock();                                //\lnlbl{l:rcu_lock}
> >>>>>      htp = rcu_dereference(htp_master->ht_cur);      //\lnlbl{l:refhashtbl}
> >>>>> -    htbp = ht_get_bucket_single(htp, key, &b, &h);  //\lnlbl{l:refbucket}
> >>>>> +    htbp = ht_get_bucket(htp, key, &b, &h);         //\lnlbl{l:refbucket}
> >>>>>      spin_lock(&htbp->htb_lock);                     //\lnlbl{l:acq_bucket}
> >>>>>      lsp->hbp[0] = htbp;                             //\lnlbl{l:lsp0b}
> >>>>>      lsp->hls_idx[0] = htp->ht_idx;
> >>>>> @@ -188,7 +169,7 @@ hashtab_lock_mod(struct hashtab *htp_master, void *key,
> >>>>>              return;                                 //\lnlbl{l:fastret1}
> >>>>>      }
> >>>>>      htp = rcu_dereference(htp->ht_new);             //\lnlbl{l:new_hashtbl}
> >>>>> -    htbp = ht_get_bucket_single(htp, key, &b, &h);  //\lnlbl{l:get_newbkt}
> >>>>> +    htbp = ht_get_bucket(htp, key, &b, &h);         //\lnlbl{l:get_newbkt}
> >>>>>      spin_lock(&htbp->htb_lock);                     //\lnlbl{l:acq_newbkt}
> >>>>>      lsp->hbp[1] = htbp;                             //\lnlbl{l:lsp1b}
> >>>>>      lsp->hls_idx[1] = htp->ht_idx;
> >>>>> @@ -223,16 +204,15 @@ struct ht_elem *                                       //\lnlbl{lkp:b}
> >>>>>  hashtab_lookup(struct hashtab *htp_master, void *key)
> >>>>>  {
> >>>>>      long b;
> >>>>> -    int i;
> >>>>>      struct ht *htp;
> >>>>>      struct ht_elem *htep;
> >>>>>      struct ht_bucket *htbp;
> >>>>>
> >>>>>      htp = rcu_dereference(htp_master->ht_cur);      //\lnlbl{lkp:get_curtbl}
> >>>>> -    htbp = ht_get_bucket(&htp, key, &b, &i);        //\lnlbl{lkp:get_curbkt}
> >>>>> +    htbp = ht_get_bucket(htp, key, &b, NULL);       //\lnlbl{lkp:get_curbkt}
> >>>>>      cds_list_for_each_entry_rcu(htep,               //\lnlbl{lkp:loop:b}
> >>>>>                                  &htbp->htb_head,
> >>>>> -                                hte_next[i]) {
> >>>>> +                                hte_next[htp->ht_idx]) {
> >>>>>              if (htp->ht_cmp(htep, key))             //\lnlbl{lkp:match}
> >>>>>                      return htep;                    //\lnlbl{lkp:ret_match}
> >>>>>      }                                               //\lnlbl{lkp:loop:e}
> >>>>> @@ -303,7 +283,7 @@ int hashtab_resize(struct hashtab *htp_master,
> >>>>>              htbp = &htp->ht_bkt[i];                 //\lnlbl{get_oldcur}
> >>>>>              spin_lock(&htbp->htb_lock);             //\lnlbl{acq_oldcur}
> >>>>>              cds_list_for_each_entry(htep, &htbp->htb_head, hte_next[idx]) { //\lnlbl{loop_list:b}
> >>>>> -                    htbp_new = ht_get_bucket_single(htp_new, htp_new->ht_getkey(htep), &b, NULL);
> >>>>> +                    htbp_new = ht_get_bucket(htp_new, htp_new->ht_getkey(htep), &b, NULL);
> >>>>>                      spin_lock(&htbp_new->htb_lock);
> >>>>>                      cds_list_add_rcu(&htep->hte_next[!idx], &htbp_new->htb_head);
> >>>>>                      spin_unlock(&htbp_new->htb_lock);
> >>>>> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> >>>>> index 5c61bf5e2389..0152437c274e 100644
> >>>>> --- a/datastruct/datastruct.tex
> >>>>> +++ b/datastruct/datastruct.tex
> >>>>> @@ -966,10 +966,8 @@ the old table.
> >>>>>  \begin{lineref}[ln:datastruct:hash_resize:get_bucket]
> >>>>>  Bucket selection is shown in
> >>>>>  Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection},
> >>>>> -which shows \co{ht_get_bucket_single()} on
> >>>>> -lines~\lnref{single:b}-\lnref{single:e} and
> >>>>> -\co{ht_get_bucket()} on lines~\lnref{b}-\lnref{e}.
> >>>>> -The \co{ht_get_bucket_single()} function returns a reference to the bucket
> >>>>> +which shows \co{ht_get_bucket()}.
> >>>>> +This function returns a reference to the bucket
> >>>>>  corresponding to the specified key in the specified hash table, without
> >>>>>  making any allowances for resizing.
> >>>>>  It also stores the bucket index corresponding to the key into the location
> >>>>> @@ -978,36 +976,6 @@ line~\lnref{single:gethash}, and the corresponding
> >>>>>  hash value corresponding to the key into the location
> >>>>>  referenced by parameter~\co{h} (if non-\co{NULL}) on line~\lnref{single:h}.
> >>>>>  Line~\lnref{single:return} then returns a reference to the corresponding bucket.
> >>>>> -
> >>>>> -The \co{ht_get_bucket()} function handles hash-table selection, invoking
> >>>>> -\co{ht_get_bucket_single()} on
> >>>>> -line~\lnref{call_single} to select the bucket
> >>>>> -corresponding to the hash in the current
> >>>>> -hash table, storing the hash value through parameter~\co{b}.
> >>>>> -If line~\lnref{resized} determines that the table is being resized and that
> >>>>> -line~\lnref{call_single}'s bucket has already been distributed across the new hash
> >>>>> -table, then line~\lnref{newtable} selects the new hash table and
> >>>>> -line~\lnref{newbucket}
> >>>>> -selects the bucket corresponding to the hash in the new hash table,
> >>>>> -again storing the hash value through parameter~\co{b}.
> >>>>> -\end{lineref}
> >>>>> -
> >>>>> -\QuickQuiz{}
> >>>>> -    The code in
> >>>>> -    Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection}
> >>>>> -    computes the hash twice!
> >>>>> -    Why this blatant inefficiency?
> >>>>> -\QuickQuizAnswer{
> >>>>> -    The reason is that the old and new hash tables might have
> >>>>> -    completely different hash functions, so that a hash computed
> >>>>> -    for the old table might be completely irrelevant to the
> >>>>> -    new table.
> >>>>> -} \QuickQuizEnd
> >>>>> -
> >>>>> -\begin{lineref}[ln:datastruct:hash_resize:get_bucket]
> >>>>> -If line~\lnref{chk_i} finds that parameter~\co{i} is non-\co{NULL}, then
> >>>>> -line~\lnref{set_idx} stores the pointer-set index for the selected hash table.
> >>>>> -Finally, line~\lnref{return} returns a reference to the selected hash bucket.
> >>>>>  \end{lineref}
> >>>>>
> >>>>>  \QuickQuiz{}
> >>>>> @@ -1021,10 +989,8 @@ Finally, line~\lnref{return} returns a reference to the selected hash bucket.
> >>>>>      functions described next.
> >>>>>  } \QuickQuizEnd
> >>>>>
> >>>>> -This implementation of
> >>>>> -\co{ht_get_bucket_single()} and \co{ht_get_bucket()}
> >>>>> -permit lookups and modifications to run concurrently
> >>>>> -with a resize operation.
> >>>>> +This implementation of \co{ht_get_bucket()} permits lookups and
> >>>>> +modifications to run concurrently with a resize operation.
> >>>>>
> >>>>>  \begin{listing}[tb]
> >>>>>  \input{CodeSamples/datastruct/hash/hash_resize@lock_unlock_mod.fcv}
> >>>>> @@ -1129,11 +1095,6 @@ hash lookups.
> >>>>>  Line~\lnref{get_curtbl} fetches the current hash table and
> >>>>>  line~\lnref{get_curbkt} obtains a reference
> >>>>>  to the bucket corresponding to the specified key.
> >>>>> -This bucket will be located in a new resized hash table when a
> >>>>> -resize operation has progressed past the bucket in the old hash
> >>>>> -table that contained the desired data element.
> >>>>> -Note that line~\lnref{get_curbkt} also passes back the index that will be
> >>>>> -used to select the correct set of pointers from the pair in each element.
> >>>>>  The loop spanning lines~\lnref{loop:b}-\lnref{loop:e} searches the bucket,
> >>>>>  so that if line~\lnref{match}
> >>>>>  detects a match,
> >>>>> @@ -1144,22 +1105,17 @@ failure.
> >>>>>  \end{lineref}
> >>>>>
> >>>>>  \QuickQuiz{}
> >>>>> -    In the \co{hashtab_lookup()} function in
> >>>>> -    Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions},
> >>>>> -    the code carefully finds the right bucket in the new hash table
> >>>>> -    if the element to be looked up has already been distributed
> >>>>> -    by a concurrent resize operation.
> >>>>> -    This seems wasteful for RCU-protected lookups.
> >>>>> -    Why not just stick with the old hash table in this case?
> >>>>> +    \begin{lineref}[ln:datastruct:hash_resize:access:lkp]
> >>>>> +    What if execution reaches line~\lnref{loop:b}
> >>>>> +    of \co{hashtab_lookup()} in
> >>>>> +    Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
> >>>>> +    just after this bucket has been resized.
> >>>>> +    Won't that result in lookup failures?
> >>>>> +    \end{lineref}
> >>>>>  \QuickQuizAnswer{
> >>>>> -    Suppose that a resize operation begins and distributes half of
> >>>>> -    the old table's buckets to the new table.
> >>>>> -    Suppose further that a thread adds a new element that goes into
> >>>>> -    one of the already-distributed buckets, and that this same thread
> >>>>> -    now looks up this newly added element.
> >>>>> -    If lookups unconditionally traversed only the old hash table,
> >>>>> -    this thread would get a lookup failure for the element that it
> >>>>> -    just added, which certainly sounds like a bug to me!
> >>>>> +    No, it won't.
> >>>>> +    Resizing into the new hash table leaves the old hash table
> >>>>> +    intact, courtesy of the pointer pairs.
> >>>>>  } \QuickQuizEnd
> >>>>>
> >>>>>  \begin{lineref}[ln:datastruct:hash_resize:access:add]
> >>>>>
> >>
> >> Hi Paul and Akira,
> >>
> >> Thanks a lot for the comments, which I need some more time to look
> >> into. For Paul's patch, I have a few concerns. Please take a look.
> >>
> >> My understanding is that with this path, during the time period when
> >> the resizing thread is running, an updater may insert/delete an item
> >> into/from the new hash table, while readers are still looking up data
> >> in the old one, resulting the readers are unaware of
> >> insertions/deletions happening simultaneously. For example, it seems
> >> the following sequence could happen.
> >>
> >> 1. The resizing thread starts.
> >> 2. The resizing thread successfully passes bucket *B* of the old hash table.
> >> 3. An updater wants to insert a new item *I* which should be inserted
> >> into bucket *B*.
> >> 4. The updater will select the new hash table and insert the item *I*
> >> into the new hash table.
> >> 5. A read request comes in and wants to lookup item *I*. The lookup
> >> request will check the old hash table and fail. Doesn't it?
> >> 6. The resizing thread exits.
> >> 7. Now subsequent read requests can successfully find item *I*.
> > 
> > Yes, this can happen.
> > 
> >> Is my understanding correct? Please let me know if I misunderstood
> >> anything. Give the truth that this patch can accelerate the fast path,
> >> I think it should be OK because resizing is typically happen rarely.
> >> Just want to make sure I fully understand the algorithm.
> > 
> > It is a design choice, and some users would prefer not to fail to see
> > new items during a resize.  One approach would be to revert back to
> > the old-style checking, and another would be to provide a separate
> > lookup interface that synchronizes with adds and deletes.
> > 
> > So, I could add a quick quiz with this information, I could revert the
> > change, or I could add another lookup function that provided more timely
> > information.  Left to myself, I would provide a quick quiz, but what
> > do you guys think?
> 
> Hi, I was composing a message, but now I'm replying to this one.
> I think adding a quick quiz would be a good idea.

But in the meantime, it occurred to me that I was looking at the
problem in the wrong way.  I believe that the following patch makes
hashtab_lookup() find elements recently added by hashtab_add(), even
during a resize, and without the need for memory barriers.

The scenario that convinced me to take this approach is when a thread
does hashtab_add(), then immediately searches for the newly added element.
Failing to find it would be quite a surprise to most people.

							Thanx, Paul

------------------------------------------------------------------------

commit b61179bdc22e9750147ad3f540215af225aa3376
Author: Paul E. McKenney <paulmck@linux.ibm.com>
Date:   Tue Jan 8 10:29:43 2019 -0800

    datastruct/hash: Make hashtab_lookup() more responsive during resize
    
    If hashtab_add() adds a new element to an already-resized bucket during
    a resize, hashtab_lookup() won't find it until the resize is complete.
    This is a not-unreasonable semantic, but might be quite surprising to most
    users, especially if the thread doing the lookup is the same thread that
    just added the new element.  This commit therefore causes hashtab_lookup()
    to find recently added elements even during resize operations.
    
    Note that this change involved a small refactoring of the code,
    introducing a new ht_search_bucket() helper function.  This refactoring
    avoids the need for memory barriers as well because when an element is
    not found and there is a resize in progress, the new version of the
    hash table is unconditionally searched, thus avoiding the need for a
    racy access to ->ht_resize_cur.  Although this approach can result in
    needless searches of not-yet-filled-in buckets, such searches will
    be rare (assuming resizing is rare), and a search of an empty bucket
    is cheap anyway.
    
    Reported-by: Junchang Wang <junchangwang@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 9f68a00dabe3..6dbfe020d78d 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -124,7 +124,8 @@ void hashtab_free(struct hashtab *htp_master)
 //\begin{snippet}[labelbase=ln:datastruct:hash_resize:get_bucket,commandchars=\\\@\$]
 /* Get hash bucket corresponding to key, ignoring the possibility of resize. */
 static struct ht_bucket *				//\lnlbl{single:b}
-ht_get_bucket(struct ht *htp, void *key, long *b, unsigned long *h)
+ht_get_bucket(struct ht *htp, void *key,
+              long *b, unsigned long *h)
 {
 	unsigned long hash = htp->ht_gethash(key);
 
@@ -133,6 +134,24 @@ ht_get_bucket(struct ht *htp, void *key, long *b, unsigned long *h)
 		*h = hash;				//\lnlbl{single:h}
 	return &htp->ht_bkt[*b];			//\lnlbl{single:return}
 }							//\lnlbl{single:e}
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
 //\end{snippet}
 
 /* Read-side lock/unlock functions. */
@@ -203,20 +222,17 @@ void hashtab_lookup_done(struct ht_elem *htep)
 struct ht_elem *					//\lnlbl{lkp:b}
 hashtab_lookup(struct hashtab *htp_master, void *key)
 {
-	long b;
 	struct ht *htp;
 	struct ht_elem *htep;
-	struct ht_bucket *htbp;
 
 	htp = rcu_dereference(htp_master->ht_cur);	//\lnlbl{lkp:get_curtbl}
-	htbp = ht_get_bucket(htp, key, &b, NULL);	//\lnlbl{lkp:get_curbkt}
-	cds_list_for_each_entry_rcu(htep,		//\lnlbl{lkp:loop:b}
-	                            &htbp->htb_head,
-	                            hte_next[htp->ht_idx]) {
-		if (htp->ht_cmp(htep, key)) 		//\lnlbl{lkp:match}
-			return htep;			//\lnlbl{lkp:ret_match}
-	}						//\lnlbl{lkp:loop:e}
-	return NULL;					//\lnlbl{lkp:ret_NULL}
+	htep = ht_search_bucket(htp, key);		//\lnlbl{lkp:get_curbkt}
+	if (htep)					//\lnlbl{lkp:entchk}
+		return htep;				//\lnlbl{lkp:ret_match}
+	htp = rcu_dereference(htp->ht_new);		//\lnlbl{lkp:get_nxttbl}
+	if (!htp)					//\lnlbl{lkp:htpchk}
+		return NULL;				//\lnlbl{lkp:noresize}
+	return ht_search_bucket(htp, key);		//\lnlbl{lkp:ret_nxtbkt}
 }							//\lnlbl{lkp:e}
 
 /*
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index eb7f790aa5a3..175056cbe911 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -966,8 +966,10 @@ the old table.
 \begin{lineref}[ln:datastruct:hash_resize:get_bucket]
 Bucket selection is shown in
 Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection},
-which shows \co{ht_get_bucket()}.
-This function returns a reference to the bucket
+which shows \co{ht_get_bucket()} on
+lines~\lnref{single:b}-\lnref{single:e} and \co{ht_search_bucket()} on
+lines~\lnref{hsb:b}-\lnref{hsb:e}.
+The \co{ht_get_bucket()} function returns a reference to the bucket
 corresponding to the specified key in the specified hash table, without
 making any allowances for resizing.
 It also stores the bucket index corresponding to the key into the location
@@ -976,6 +978,17 @@ line~\lnref{single:gethash}, and the corresponding
 hash value corresponding to the key into the location
 referenced by parameter~\co{h} (if non-\co{NULL}) on line~\lnref{single:h}.
 Line~\lnref{single:return} then returns a reference to the corresponding bucket.
+
+The \co{ht_search_bucket()} function searches for the specified key
+within the specified hash-table version.
+Line~\lnref{hsb:get_curbkt} obtains a reference to the bucket corresponding
+to the specified key.
+The loop spanning lines~\lnref{hsb:loop:b}-\lnref{hsb:loop:e} searches
+that bucket, so that if line~\lnref{hsb:match} detects a match,
+line~\lnref{hsb:ret_match} returns a pointer to the enclosing data element.
+Otherwise, if there is no match,
+line~\lnref{hsb:ret_NULL} returns \co{NULL} to indicate
+failure.
 \end{lineref}
 
 \QuickQuiz{}
@@ -1093,31 +1106,18 @@ The \co{hashtab_lookup()} function on
 lines~\lnref{b}-\lnref{e} of the listing does
 hash lookups.
 Line~\lnref{get_curtbl} fetches the current hash table and
-line~\lnref{get_curbkt} obtains a reference
-to the bucket corresponding to the specified key.
-The loop spanning lines~\lnref{loop:b}-\lnref{loop:e} searches the bucket,
-so that if line~\lnref{match}
-detects a match,
-line~\lnref{ret_match} returns a pointer to the enclosing data element.
-Otherwise, if there is no match,
-line~\lnref{ret_NULL} returns \co{NULL} to indicate
-failure.
+line~\lnref{get_curbkt} searches the bucket corresponding to the
+specified key.
+If line~\lnref{entchk} determines that the search was successful,
+line~\lnref{ret_match} returns a pointer to the element that was located.
+Otherwise, line~\lnref{get_nxttbl} picks up a pointer to the next version,
+and if line~\lnref{htpchk} determines that there is no resize in progress,
+line~\lnref{noresize} returns \co{NULL}.
+When there is a resize in progress, execution reaches
+line~\lnref{ret_nxtbkt}, which returns the result of searching the
+bucket corresponding to \co{key} in the new version.
 \end{lineref}
 
-\QuickQuiz{}
-	\begin{lineref}[ln:datastruct:hash_resize:access:lkp]
-	What if execution reaches line~\lnref{loop:b}
-	of \co{hashtab_lookup()} in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
-	just after this bucket has been resized.
-	Won't that result in lookup failures?
-	\end{lineref}
-\QuickQuizAnswer{
-	No, it won't.
-	Resizing into the new hash table leaves the old hash table
-	intact, courtesy of the pointer pairs.
-} \QuickQuizEnd
-
 \begin{lineref}[ln:datastruct:hash_resize:access:add]
 The \co{hashtab_add()} function on lines~\lnref{b}-\lnref{e} of the listing adds
 new data elements to the hash table.


