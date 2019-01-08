Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D3fbRLz60DYLQ8BEgZSmOLYtD/rz3JBFNArYuNKjcYI=;
        b=qE0KA4BJljsqKt4JptXDfEeL7iURTsG5k211nj2lz6kBEYnKIpjq3ZsiuEAuiw8jAk
         kIcAPi0gI4FzlISmbJ7AIFt+EssoIgvtlTfkZSSfxx+JBZnKtZKUxsKS+fb/yJCQg3eS
         /Anu0H5M0TB4+WY/wTiVwKyOuaFxqGI3WkauxvgtY9PZ91cEVvC1WMhsRS9ObKWEr3Jp
         BHZL15hvOtkYa9Ja3IpNni7MA9Gq3EfgGItnRQt5eAoqpxrsEucCkygjkQAkDGsZrhem
         of+3C2L6jA2O9BbePbZeZ+CO+KNc8P159BRYjMxK0PbMwGoCCGBZj3SbhxL1qdPuMxvl
         VoUw==
Subject: Re: Question regarding hash_resize
References: <CABoNC81XkNKv6=g2GUq4pNkwc4mcZ1FyZbjreD9KRfxQQUuPYg@mail.gmail.com>
 <20190107183317.GB1215@linux.ibm.com>
 <63181ff3-bcfa-0819-460a-867e438a22f7@gmail.com>
 <6d75361a-8a7f-1190-0c34-dccb7e2dea01@gmail.com>
 <20190107234850.GJ1215@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <24b85a58-a2fe-3ce4-e58c-bf67488ae6b8@gmail.com>
Date: Wed, 9 Jan 2019 00:18:14 +0900
MIME-Version: 1.0
In-Reply-To: <20190107234850.GJ1215@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/01/07 15:48:50 -0800, Paul E. McKenney wrote:
> On Tue, Jan 08, 2019 at 08:06:51AM +0900, Akira Yokosawa wrote:
>> On 2019/01/08 07:54:16 +0900, Akira Yokosawa wrote:
>>> Hi Paul, 
>>>
>>> On 2019/01/07 10:33:17 -0800, Paul E. McKenney wrote:
>>>> On Mon, Jan 07, 2019 at 09:49:19PM +0800, Junchang Wang wrote:
>>>>> Hi all,
>>>>>
>>>>> I'm reading hash_resize recently, and have a few questions regarding
>>>>> this algorithm. Please take a look if you have time. Any suggestions
>>>>> are warmly welcomed.
>>>>>
>>>>> === Question 1 ===
>>>>> In hash_resize.c : hashtab_lock_mod
>>>>> 186         if (b > READ_ONCE(htp->ht_resize_cur)) {
>>>>> 187                 lsp->hbp[1] = NULL;
>>>>> 188                 return;
>>>>> 189         }
>>>>> 190         htp = rcu_dereference(htp->ht_new);
>>>>>
>>>>> It seems we are missing a barrier (e.g., smp_mb) in between lines 189
>>>>> and 190, because neither READ_ONCE() nor rcu_dereference() can prevent
>>>>> compilers and hardware from reordering the two unrelated variables,
>>>>> ht_resize_cur and ht_new. Is my understanding correct?
>>>>
>>>> Ah, but hashtab_lock_mod() is invoked within an RCU read-side critical
>>>> section
>>>
>>> You mean "rcu_read_lock() at the beginning of hashtab_lock_mod() starts
>>> an RCU read-side critical section", don't you?
>>>
>>>>         and there is a synchronize_rcu() between the update to ->ht_new
>>>> and the updates to ->ht_resize_cur.  For more details on how this works,
>>>> please see https://lwn.net/Articles/573497/.
>>>>
>>>> Of course, if you find a code path in which a call to hashtab_lock_mod()
>>>> is invoked outside of an RCU read-side critical section, that would be
>>>> a bug.  (Can you tell me an exception to this rule, that is, a case
>>>> where hashtab_lock_mod() could safely be invoked outside of an RCU
>>>> read-side critical section?)
>>>>
>>>>> === Question 2 ===
>>>>> In hash_resize.c, each time an updater wants to access a bucket, the
>>>>> updater must first acquire the bucket's lock (htb_lock), preventing
>>>>> other updaters accessing the same bucket concurrently. This approach
>>>>> is OK if the linked list of a bucket is relatively short, but for a
>>>>> larger system where linked lists are long enough and the
>>>>> perftest_resize thread is running simultaneously, it could become a
>>>>> potential performance bottleneck. One naive solution is to allow
>>>>> multiple updaters to access the same bucket, only if they don't
>>>>> operate on the same item of the list of this bucket. I wonder if there
>>>>> are any existing works or discussions on this topic?
>>>>
>>>> One approach is to use a hashed array of locks, and to hash a given
>>>> element's address to locate the lock to be used.  Please see
>>>> Section 7.1.1.5 ("Conditional Locking") and Section 7.1.1.6 ("Acquire
>>>> Needed Locks First"), including Quick Quiz 7.9, for additional details.
>>>>
>>>> Another approach is to use RCU to protect traversals, and locks within the
>>>> linked-list elements themselves.  These locks are conditionally acquired
>>>> (again, please see Section 7.1.1.5), and deadlock is avoided by acquiring
>>>> them in list order, and the tricks in Quick Quiz 7.9.
>>>>
>>>> Non-blocking synchronization can also be used, but it is often quite a
>>>> bit more complicated.  See for example the split-order list of Shalev
>>>> and Shavit, along with Desnoyers's RCU-protected extension in the
>>>> userspace RCU library.
>>>>
>>>> But it is usually -way- better to just choose a good hash function and
>>>> to increase the number of buckets.  Which is of course one reason for
>>>> having resizable hash tables.  ;-)
>>>>
>>>> But the other techniques can be useful in more complex linked data
>>>> structures, such as graphs, where there is no reasonable way to
>>>> partition the data.  Nevertheless, many people choose to do the
>>>> partitioning anyway, especially on distributed systems.
>>>>
>>>>> === Question 3 ===
>>>>> Chapter Data Structures also discusses other resizable hash tables,
>>>>> namely "Resizable, scalable, concurrent hash tables via relativistic
>>>>> programming" from Josh Triplett, which can save memory footprint by
>>>>> using a single pair of pointers. But my understanding is that
>>>>> perftest_resize.c is unique in that it allows you to rebuild the hash
>>>>> table by utilizing a different hash function, which could be very
>>>>> useful in practice (e.g., to prevent DDoS attack). Other solutions do
>>>>> not share this property. Is my understanding correct? Did I miss any
>>>>> discussions on this topic in perfbook?
>>>>
>>>> Indeed, to the best of my knowledge, Herbert Xu's pointer-pair approach
>>>> (which I use in hash_resize.c) is the only one allowing arbitrary changes
>>>> to hash functions.  I expect that this advantage will become increasingly
>>>> important as security issues become more challenging.  Furthermore, I
>>>> suspect that the pointer-pair approach is faster and more scalable.
>>>> It is certainly simpler.
>>>>
>>>> On the other hand, one advantage of the other two approaches is decreased
>>>> memory consumption.
>>>>
>>>> Another advantage of Josh Triplett's pointer-unzip approach is that
>>>> concurrent updates are (in theory, anyway) not blocked for as long
>>>> by resize operations.  The other edge of this sword is that resizing
>>>> is much slower, given the need to wait for many RCU grace periods.
>>>>
>>>> Another advantage of Mathieu Desnoyers's RCUified variant of Shalev
>>>> and Shavit's split-order list is that all operations are non-blocking,
>>>> which can be important on massively overloaded systems, such as one
>>>> might find in cloud computing.
>>>>
>>>>> === Question 4 ===
>>>>> In the current implementation of hash_resize.c, the perftest_resize
>>>>> could block an updater, and vice versa. It seems this is not what we
>>>>> expected. Ideally, they should be allowed to run concurrently, or at
>>>>> least the perftest_resize thread should have lower priority and
>>>>> updaters should never be blocked by the perftest_resize thread. Is
>>>>> that right? I'm very interested in helping improve. Please let me know
>>>>> if you have any suggestions.
>>>>
>>>> In hash_resize.c, an updater is blocked only for the time required to
>>>> redisposition a bucket.  This is a great improvement over blocking
>>>> updaters for the full resize over all buckets.
>>>>
>>>> But yes, it is not hard to do better, for example, periodically dropping
>>>> the old-table lock in hashtab_resize().  This requires a few careful
>>>> adjustments, of course.  Can you tell me what these adjustments are?
>>>>
>>>> Hmmm...  I could simplify hashtab_lookup(), couldn't I?  After all,
>>>> optimizing for the race with hashtab_resize() doesn't make a whole lot
>>>> of sense.  Please see the patch below.  Thoughts?
>>>>
>>>> 							Thanx, Paul
>>>>
>>>> ------------------------------------------------------------------------
>>>>
>>>> commit 737646a9c868d841b32199b52f5569668975953e
>>>> Author: Paul E. McKenney <paulmck@linux.ibm.com>
>>>> Date:   Mon Jan 7 10:29:14 2019 -0800
>>>>
>>>>     datastruct/hash: Simplify hashtab_lookup()
>>>>     
>>>>     Because resizing leaves the old hash table intact, and because lookups
>>>>     are carried out within RCU read-side critical sections (which prevent
>>>>     a second resizing operation from starting), there is no need for a
>>>>     lookup to search anywhere but in the old hash table.  And in the common
>>>>     case, there is no resize, so there is no new hash table.  Therefore,
>>>>     eliminating the check for resizing speeds things up in the common
>>>>     case.  In addition, this simplifies the code.
>>>>     
>>>>     This commit therefore eliminates the ht_get_bucket() function,
>>>>     renames the ht_get_bucket_single() function to ht_get_bucket(),
>>>>     and modifies callers appropriately.
>>>>     
>>>>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
>>>>
>>>> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
>>>> index 29e05f907200..be4157959b83 100644
>>>> --- a/CodeSamples/datastruct/hash/hash_resize.c
>>>> +++ b/CodeSamples/datastruct/hash/hash_resize.c
>>>> @@ -124,8 +124,7 @@ void hashtab_free(struct hashtab *htp_master)
>>>>  //\begin{snippet}[labelbase=ln:datastruct:hash_resize:get_bucket,commandchars=\\\@\$]
>>>>  /* Get hash bucket corresponding to key, ignoring the possibility of resize. */
>>>>  static struct ht_bucket *				//\lnlbl{single:b}
>>>> -ht_get_bucket_single(struct ht *htp, void *key, long *b,
>>>> -                     unsigned long *h)
>>>> +ht_get_bucket(struct ht *htp, void *key, long *b, unsigned long *h)
>>>>  {
>>>>  	unsigned long hash = htp->ht_gethash(key);
>>>>  
>>>> @@ -134,24 +133,6 @@ ht_get_bucket_single(struct ht *htp, void *key, long *b,
>>>>  		*h = hash;				//\lnlbl{single:h}
>>>>  	return &htp->ht_bkt[*b];			//\lnlbl{single:return}
>>>>  }							//\lnlbl{single:e}
>>>> -
>>>> -/* Get hash bucket correesponding to key, accounting for resize. */
>>>> -static struct ht_bucket *				//\lnlbl{b}
>>>> -ht_get_bucket(struct ht **htp, void *key, long *b, int *i)
>>>> -{
>>>> -	struct ht_bucket *htbp;
>>>> -
>>>> -	htbp = ht_get_bucket_single(*htp, key, b, NULL); //\lnlbl{call_single}
>>>> -								//\fcvexclude
>>>> -	if (*b <= READ_ONCE((*htp)->ht_resize_cur)) {	//\lnlbl{resized}
>>>> -		smp_mb(); /* order ->ht_resize_cur before ->ht_new. */
>>>
>>> If we can remove this memory barrier, the counterpart smp_mb() in
>>> hashtab_resize() becomes unnecessary, doesn't it?
>>
>> And the WRITE_ONCE() in the following line.
> 
> Actually, that must stay.  It is true that the bucket lock is held by
> hashtab_unlock_mod(), and that this prevents concurrent resizing of that
> bucket, but other buckets might well be resized, which results in the
> possibiliity of concurrent reads and writes for ->ht_resize_cur.
> 
> Anyway, here is the resulting commit.  Thoughts?

Looks good to me. (Give or take a few typo in commit log.)
I missed the remaining READ_ONCE(), which didn't appear in the diff.

And if you choose this way of simplifying hashtab_lookup(),
the Quick Quiz on smp_mb()s would become out of context.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 1aac0c703482c90c2ce4092b2cc604d474f5a44b
> Author: Paul E. McKenney <paulmck@linux.ibm.com>
> Date:   Mon Jan 7 15:39:40 2019 -0800
> 
>     datastruct/hash: Remove extraneous barrier from hashtab_resize()
>     
>     Now that hashtab_lookup() is iresizing-agnostic, all non-initialization
>     accesses to ->ht_resize-cur are protected by locking in the restricted
>     sense that any change to ->ht_resize_cur that would change the value
>     of the "if" condition cannot happen while the lock is held on the old
>     bucket.  This means that the memory barrier may be removed.  However,
>     the READ_ONCE() and WRITE_ONCE() markings on non-initialization accesses
>     to ->ht_resize_cur must remain because reads from ->ht_resize_cur really
>     can race with writes, just not is a way to change the "if" conditions.
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index be4157959b83..9f68a00dabe3 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -288,7 +288,6 @@ int hashtab_resize(struct hashtab *htp_master,
>  			cds_list_add_rcu(&htep->hte_next[!idx], &htbp_new->htb_head);
>  			spin_unlock(&htbp_new->htb_lock);
>  		}					//\lnlbl{loop_list:e}
> -		smp_mb(); /* Fill new buckets before claiming them. */
>  		WRITE_ONCE(htp->ht_resize_cur, i);	//\lnlbl{update_resize}
>  		spin_unlock(&htbp->htb_lock);		//\lnlbl{rel_oldcur}
>  	}						//\lnlbl{loop:e}
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 0152437c274e..e2159330790f 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1245,10 +1245,7 @@ lines~\lnref{loop_list:b}-\lnref{loop_list:e} adds one data element
>  from the current old-table bucket to the corresponding new-table bucket,
>  holding the new-table bucket's lock during the add operation.
>  Line~\lnref{update_resize} updates
> -\co{->ht_resize_cur} to indicate that this bucket has been distributed,
> -and is preceded by a full memory barrier that pairs with the one in
> -\co{ht_get_bucket()} shown in
> -Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection}.
> +\co{->ht_resize_cur} to indicate that this bucket has been distributed.
>  Finally, line~\lnref{rel_oldcur} releases the old-table bucket lock.
>  
>  \QuickQuiz{}
> 

