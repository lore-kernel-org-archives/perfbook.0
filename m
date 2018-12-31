Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43464 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727524AbeLaVC5 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 31 Dec 2018 16:02:57 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBVKmtVK094816
        for <perfbook@vger.kernel.org>; Mon, 31 Dec 2018 16:02:55 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pqkmj6pe0-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 31 Dec 2018 16:02:55 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 31 Dec 2018 21:02:54 -0000
Date: Mon, 31 Dec 2018 13:03:07 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] EXP hashtorture.h: Avoid sporadic SIGSEGV in hash_bkt_rcu
Reply-To: paulmck@linux.ibm.com
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
 <20181224235832.GW4170@linux.ibm.com>
 <20181225005315.GA20719@linux.ibm.com>
 <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
 <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
 <20181226150018.GY4170@linux.ibm.com>
 <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
 <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
Message-Id: <20181231210307.GU4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 01, 2019 at 12:15:23AM +0900, Akira Yokosawa wrote:
> >From 52f5d218442eb64f2798335d56a1838f90d96d5f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 30 Dec 2018 22:54:43 +0900
> Subject: [PATCH] EXP hashtorture.h: Avoid sporadic SIGSEGV in hash_bkt_rcu
> 
> Commit 4e22bdc905ff ("Wait at end of test for call_rcu() to finish")
> added a couple of synchronize_rcu()s in perftest_update()
> and zoo_reader().
> 
> However, there still remains sporadic SIGSEGV in
> 
>     $ ./hash_bkt_rcu --perftest --nupdaters 3
> 
> On the other hand,
> 
>     $ ./hash_bkt_rcu --schroedinger --nupdaters 3
> 
> does not show such issue. Just moving synchronize_rcu()s in
> zoo_reader() to zoo_updater() does not resolve the
> SIGSEGV.
> 
> 
> This commit defines rcu_barrier() if not available,
> and puts them at both before and after the final loop
> of perftest_updater() and zoo_updater().
> 
> It looks like this change can fix the above mentioned
> SIGSEGV in "--perftest".
> 
> [Tested on Ubuntu Xenial with liburcu-dev/xenial,now 0.9.1-3 and
> liburcu4/xenial,now 0.9.1-3 installed.]
> 
> NOTE:
> 
>     $ ./hash_resize --schroedinger --resizemult 2 --duration 20

I get SIGSEGV and hangs from time to time, so I am looking into this.
Thank you for calling it to my attention!

> still fails with SIGSEGV frequently in zoo_del(). GDB says:
> 
>     (gdb) where
>     #0  0x0000000000402b27 in cds_list_del_rcu (elem=0x7ff8fc0138f0)
>         at /usr/include/urcu/rculist.h:71
>     #1  hashtab_del (htep=0x7ff8fc0138d0, htp_master=<optimized out>)
>         at hash_resize.c:261
>     #2  zoo_del (zhep=0x7ff8fc0138d0) at hashtorture.h:1007
>     #3  zoo_updater (arg=0x1e8b298) at hashtorture.h:1153
>     #4  0x00007ff9057d16ba in start_thread (arg=0x7ff903fed700)
>         at pthread_create.c:333
>     #5  0x00007ff9050f741d in clone ()
>         at ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queue and pushed, thank you!

With one small modification -- given that liburcu has had rcu_barrier()
for some years now, I removed the "training wheels" (and unreliable)
use of the wait and pair of synchronize_rcu() calls.

> ---
> Hi Paul,
> 
> This is a partial fix, but it resolves SIGSEGV in "--perftest" of
> hash_bkt_rcu and hash_resize.
> 
> "--schroedinger" of hash_resize with resizing enabled still seg faults
> as mentioned in the commit log.
> 
> By the way, what version of liburcu are you using?

It is about two years old, but it does have rcu_barrier().

								Thanx, Paul

>         Thanks, Akira
> --
>  CodeSamples/datastruct/hash/hashtorture.h | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
> index 0e90220..9ae3dfa 100644
> --- a/CodeSamples/datastruct/hash/hashtorture.h
> +++ b/CodeSamples/datastruct/hash/hashtorture.h
> @@ -55,6 +55,15 @@ void (*defer_del_done)(struct ht_elem *htep) = NULL;
>  #ifndef quiescent_state
>  #define quiescent_state() do ; while (0)
>  #define synchronize_rcu() do ; while (0)
> +#define rcu_barrier() do ; while (0)
> +#else
> +#ifndef rcu_barrier
> +#define rcu_barrier() do { \
> +		synchronize_rcu(); \
> +		poll(NULL, 0, 100); \
> +		synchronize_rcu(); \
> +	} while (0)
> +#endif /* #ifndef rcu_barrier */
>  #endif /* #ifndef quiescent_state */
>  
>  /*
> @@ -765,6 +774,7 @@ void *perftest_reader(void *arg)
>  		if (i >= ne)
>  			i = i % ne + offset;
>  	}
> +
>  	pap->nlookups = nlookups;
>  	pap->nlookupfails = nlookupfails;
>  	hash_unregister_thread();
> @@ -839,6 +849,7 @@ void *perftest_updater(void *arg)
>  			quiescent_state();
>  	}
>  
> +	rcu_barrier();
>  	/* Test over, so remove all our elements from the hash table. */
>  	for (i = 0; i < elperupdater; i++) {
>  		if (thep[i].in_table != 1)
> @@ -846,10 +857,7 @@ void *perftest_updater(void *arg)
>  		BUG_ON(!perftest_lookup(thep[i].data));
>  		perftest_del(&thep[i]);
>  	}
> -	/* Really want rcu_barrier(), but missing from old liburcu versions. */
> -	synchronize_rcu();
> -	poll(NULL, 0, 100);
> -	synchronize_rcu();
> +	rcu_barrier();
>  
>  	hash_unregister_thread();
>  	free(thep);
> @@ -1048,10 +1056,6 @@ void *zoo_reader(void *arg)
>  		if (i >= ne)
>  			i = i % ne + offset;
>  	}
> -	/* Really want rcu_barrier(), but missing from old liburcu versions. */
> -	synchronize_rcu();
> -	poll(NULL, 0, 100);
> -	synchronize_rcu();
>  
>  	pap->nlookups = nlookups;
>  	pap->nlookupfails = nlookupfails;
> @@ -1136,15 +1140,19 @@ void *zoo_updater(void *arg)
>  			quiescent_state();
>  	}
>  
> +	rcu_barrier();
>  	/* Test over, so remove all our elements from the hash table. */
>  	for (i = 0; i < elperupdater; i++) {
>  		if (!zheplist[i])
>  			continue;
>  		zoo_del(zheplist[i]);
>  	}
> +	rcu_barrier();
> +
>  	hash_unregister_thread();
>  	pap->nadds = nadds;
>  	pap->ndels = ndels;
> +	free(zheplist);
>  	return NULL;
>  }
>  
> -- 
> 2.7.4
> 
> 

