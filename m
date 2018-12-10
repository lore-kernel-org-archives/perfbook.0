Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48502 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726392AbeLJUR5 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Dec 2018 15:17:57 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBAKDwlQ017002
        for <perfbook@vger.kernel.org>; Mon, 10 Dec 2018 15:17:56 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p9uhcjf02-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 10 Dec 2018 15:17:56 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 10 Dec 2018 20:17:54 -0000
Date: Mon, 10 Dec 2018 12:17:52 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Definition of cmpxchg()
Reply-To: paulmck@linux.ibm.com
References: <daa12711-177f-6f25-09c4-841751365a8f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa12711-177f-6f25-09c4-841751365a8f@gmail.com>
Message-Id: <20181210201752.GA4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Tue, Dec 11, 2018 at 12:29:08AM +0900, Akira Yokosawa wrote:
> Hi Paul and Junchang,
> 
> This is a continuation of the discussion on the definition of
> cmpxchg() in CodeSamples/api-pthreads/api-gcc.h.
> 
> Current definition is as follows:
> 
> #define cmpxchg(ptr, o, n) \
> ({ \
> 	typeof(*ptr) _____actual = (o); \
> 	\
> 	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> 			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
> })
> 
> As was already pointed out by Paul, this definition has potential issue
> when an argument with side-effect is given to "o". Also, (o)+1 can overflow.
> 
> As a matter of fact, there is another definition of cmpxchg() in
> CodeSamples/formal/litmus/api.h. Currently it is defined as follows:
> 
> #define cmpxchg(x, o, n) ({ \
> 	typeof(o) __old = (o); \
> 	__atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> 	__old; \
> })
> 
> Apparently, this definition is not good on PPC or ARM.
> 
> Following is a simple litmus test of cmpxchg() (to be executed by litmus7):
> --------------------------------------------
> C C-cmpxchg
> {
> }
> 
> {
> #include "api.h"
> }
> 
> P0(int *x)
> {
> 	int r1;
> 
> 	r1 = cmpxchg(x, 1, 2);
> }
> 
> P1(int *x)
> {
> 	int r1;
> 
> 	r1 = cmpxchg(x, 0, 1);
> }
> 
> locations [1:r1]
> exists (0:r1=1 /\ ~x=2)
> ---------------------------------
> 
> Testing on PPC with the current api.h yields the following:
> ---------------------------------
> Test C-cmpxchg Allowed
> Histogram (4 states)
> 2789  :>0:r1=0; 1:r1=0; x=0;
> 50452053:>0:r1=0; 1:r1=0; x=1;
> 36003 *>0:r1=1; 1:r1=0; x=1;
> 49509155:>0:r1=1; 1:r1=0; x=2;
> Ok
> 
> Witnesses
> Positive: 36003, Negative: 99963997
> Condition exists (0:r1=1 /\ not (x=2)) is validated
> Hash=3f625d680407ff822fb56f1a80834291
> Observation C-cmpxchg Sometimes 36003 99963997
> Time C-cmpxchg 43.37
> ----------------------------------
> 
> If we change the definition to suppress spurious failure in
> __atomic_compare_exchange_n(), i.e.:
> 
> #define cmpxchg(x, o, n) ({ \
> 	typeof(o) __old = (o); \
> 	__atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> 	__old; \
> })
> 
> , litmus7 yields the following:
> ----------------------------------
> Test C-cmpxchg Allowed
> Histogram (2 states)
> 50766497:>0:r1=0; 1:r1=0; x=1;
> 49233503:>0:r1=1; 1:r1=0; x=2;
> No
> 
> Witnesses
> Positive: 0, Negative: 100000000
> Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
> Hash=3f625d680407ff822fb56f1a80834291
> Observation C-cmpxchg Never 0 100000000
> Time C-cmpxchg 35.20
> ----------------------------------
> 
> This matches what herd7 says (with the 2nd pair of {} removed):
> ----------------------------------
> Test C-cmpxchg Allowed
> States 2
> 0:r1=0; 1:r1=0; x=1;
> 0:r1=1; 1:r1=0; x=2;
> No
> Witnesses
> Positive: 0 Negative: 2
> Condition exists (0:r1=1 /\ not (x=2))
> Observation C-cmpxchg Never 0 2
> Time C-cmpxchg 0.01
> Hash=1720691890ea69e35615997626680d6f
> ----------------------------------
> 
> Also, klitmus7 on PPC says:
> ----------------------------------
> Test C-cmpxchg Allowed
> Histogram (2 states)
> 2019624 :>0:r1=0; 1:r1=0; x=1;
> 1980376 :>0:r1=1; 1:r1=0; x=2;
> No
> 
> Witnesses
> Positive: 0, Negative: 4000000
> Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
> Hash=1720691890ea69e35615997626680d6f
> Observation C-cmpxchg Never 0 4000000
> Time C-cmpxchg 0.76
> ----------------------------------
> 
> If we use the definition in api-gcc.h, litmus7 says:
> ----------------------------------
> Test C-cmpxchg Allowed
> Histogram (3 states)
> 11388 :>0:r1=2; 1:r1=1; x=0;
> 50373528:>0:r1=2; 1:r1=0; x=1;
> 49615084:>0:r1=1; 1:r1=0; x=2;
> No
> 
> Witnesses
> Positive: 0, Negative: 100000000
> Condition exists (0:r1=1 /\ not (x=2)) is NOT validated
> Hash=3f625d680407ff822fb56f1a80834291
> Observation C-cmpxchg Never 0 100000000
> Time C-cmpxchg 52.06
> ----------------------------------
> The result is still "Never", but the statistics look quite different.
> There is no "0:r1=0" observed!
> 
> So, at least for litmus test, cmpxchg() should be defined as follows:
> 
> #define cmpxchg(x, o, n) ({ \
> 	typeof(o) __old = (o); \
> 	__atomic_compare_exchange_n((x), &__old, (n), 0, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
> 	__old; \
> })
> 
> If this is the way to go, I think the definition in api-gcc.h should
> be the same way for consistency, even if it would cause a little
> performance degradation. Then there would be no worry about overflows.

Makes sense to me!  Longer term, it would be good to characterize
weak mode, but having things work is a very good thing.  ;-)

							Thanx, Paul

