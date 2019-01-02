Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58450 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726104AbfABTSJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 2 Jan 2019 14:18:09 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x02JEFrc131318
        for <perfbook@vger.kernel.org>; Wed, 2 Jan 2019 14:18:07 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2prywm985p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 02 Jan 2019 14:18:07 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 2 Jan 2019 19:18:07 -0000
Date: Wed, 2 Jan 2019 11:18:22 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] EXP hashtorture.h: Avoid sporadic SIGSEGV in hash_bkt_rcu
Reply-To: paulmck@linux.ibm.com
References: <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
 <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
 <20181226150018.GY4170@linux.ibm.com>
 <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
 <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
 <20181231210307.GU4170@linux.ibm.com>
 <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190102171848.GA4170@linux.ibm.com>
Message-Id: <20190102191822.GA30360@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 02, 2019 at 09:18:48AM -0800, Paul E. McKenney wrote:
> On Thu, Jan 03, 2019 at 12:02:56AM +0900, Akira Yokosawa wrote:
> > On 2019/01/01 10:00:25 -0800, Paul E. McKenney wrote:

[ . . . ]

> > There is one more thing I've noticed with "hash_resize --schroedinger".
> > *Without* resizing enabled, it says:
> > 
> >     $ ./hash_resize --schroedinger
> >     nlookups: 91373 91373  ncats: 0  nadds: 5  ndels: 6  duration: 10.851
> >     ns/read: 118.755  ns/update: 986455
> > 
> > This means that all the lookups failed. OTOH, hash_bkt_rcu works as expected
> > as follows:
> > 
> >     $ ./hash_bkt_rcu --schroedinger
> >     nlookups: 56064 28004  ncats: 0  nadds: 5  ndels: 5  duration: 10.373
> >     ns/read: 185.021  ns/update: 1.0373e+06
> > 
> > (ns/read looks slow because compiler optimization is disabled.)
> > 
> > There seems to be some mismatch in hash/key handling of hash_resize.c --
> > hashtorture.h combination. I've not yet figured out the cause, though.
> 
> The short story is that I am working to return the locking state
> from hashtab_lock_mod() for use by hashtab_add(), hashtab_del(),
> and hashtab_unlock_mod().  Also, the first resize carries out some
> "interesting" state changes that might need to be reflected in
> initialization.
> 
> But yes, not one of my best efforts...

To be a bit less cryptic, the problem is that the non-resizable hash
tables completely delegate hashing to the caller.  This is not viable
for resizable hash tables (which were indeed added later) because the
resizing is internal to the hash table, yet needs to know the hash
function.  And currently hash_resize.c and hashtorture.h agree on the
hash function except for the --schroedinger case.  So zoo_lookup()
and zoo_add() won't be looking at the same buckets except by accident.
And a rather low-probability accident at that.

So I remove "hash_private", which was intended to allow hash-function
perturbation, but is not used.  Then I can pass the hash function into
hashtab_alloc(), where all but hash_resize can ignore it.  Then I continue
the locking/bucket-selection cleanup.

And again, thank you for finding these problems!

							Thanx, Paul

