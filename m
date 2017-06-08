Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38739 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751940AbdFHDi2 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 7
 Jun 2017 23:38:28 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v583YTPv009300
 for <perfbook@vger.kernel.org>; Wed, 7 Jun 2017 23:38:28 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2axt7xs203-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 07 Jun 2017 23:38:28 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 7 Jun 2017
 23:38:26 -0400
Date: Wed, 7 Jun 2017 20:38:22 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Patches to chapter Deferred Processing
Reply-To: paulmck@linux.vnet.ibm.com
References: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20170608033822.GV3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 08, 2017 at 11:16:31AM +0800, Junchang Wang wrote:
> Hi Paul and list,
> 
> Attached are two patches for routetorture.h. Please take a look.

Good catches, queued and pushed, thank you!

> One of my remaining question is about the two smp_mb() in routetorture.h. Take
> the smp_mb() in perftest() as example, my understanding is that it is used to
> prevent the access to nthreads_running and access to goflag from being
> reorganized. If that's the case, don't we need a paired memory barrier
> instruction in perftest_reader()? Specifically, in between line 105
> (atomic_inc(&nthreads_running);) and line 106 (gf = READ_ONCE(goflag);). 

This one is unusual.  The ordering controls not correctness, but
time duration.  Plus the assignment of GOFLAG_RUN to goflag cannot
happen until after the effect of the atomic_inc() propagates back.
Interestingly enough, this code does fully not take control dependencies
into account, which could reduce the number of memory barriers.

In short, this situation is unusual and makes complex reliance on
implicit ordering guarantees.

But it might well have bugs.  If you have time, one
approach would be to read https://lwn.net/Articles/718628/ and
https://lwn.net/Articles/720550/, download the tool described, and try
to create the corresponding litmus test.  Either way, please let me know
your intentions.  This would be a really cool way for you to learn the
latest and greatest stuff about the Linux kernel memory model!

> Another puzzle is that we are using shared memory 'pap' to transfer statistic
> results from working threads, e.g. perftest_reader, to main thread, e.g.
> perftest. Do we need a smp_mb() at the tail (before instruction return) of
> function perftest_reader to force the results being written before the thread
> terminates? In other words, I'm not sure if the two events, writing to shared
> memory pap and thread termination, could be reordered.  Hints are welcome!

The pthread_create() system call guarantees that the child will see
all of the parent's memory accesses that precede the pthread_create().
Similarly, the pthread_join() system call guarantees that the parent's
accesses following the pthread_join() will see all of the (now terminated)
child's accesses.

							Thanx, Paul

> Thanks,
> --Jason
> 
> Junchang Wang (2):
>   Fix typos in help messages
>   routetorture.h: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
> 
>  CodeSamples/defer/routetorture.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> -- 
> 2.7.4
> 

