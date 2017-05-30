Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39495 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750844AbdE3AK0 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 29
 May 2017 20:10:26 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4U09Cqo120140
 for <perfbook@vger.kernel.org>; Mon, 29 May 2017 20:10:25 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2art12xvjv-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 29 May 2017 20:10:25 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 29 May
 2017 20:10:24 -0400
Date: Mon, 29 May 2017 17:10:25 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 3/4] CodeSamples: Use 'intptr_t' to be compatible with
 'void *'
Reply-To: paulmck@linux.vnet.ibm.com
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <916893a3-f31a-6cc9-a03d-b0c9023be634@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916893a3-f31a-6cc9-a03d-b0c9023be634@gmail.com>
Message-Id: <20170530001025.GR3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 30, 2017 at 07:17:27AM +0900, Akira Yokosawa wrote:
> >From e325a5ff132d8e4a79dfe465b18f573b97da75db Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 28 May 2017 12:38:27 +0900
> Subject: [RFC PATCH 3/4] CodeSamples: Use 'intptr_t' to be compatible with 'void *'
> 
> On x86_64, casting between "int" and "void *" in threadcreate.c
> causes GCC to emit warnings such as:
> 
>     warning: cast from pointer to integer of different size
>     warning: cast from integer to pointer of different size
> 
> Let's adopt C99 way of writing portable code.
> 
> Also do the same changes where appropriate. (Other than
> threadcreate.c, no warnings were observed on x86_64, but we can
> remove a few casts to "long".)
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/SMPdesign/matmul.c     | 13 +++++++------
>  CodeSamples/SMPdesign/smpalloc.c   | 11 ++++++-----
>  CodeSamples/defer/gettimestampmp.c |  2 +-
>  CodeSamples/intro/threadcreate.c   |  7 ++++---
>  4 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/CodeSamples/SMPdesign/matmul.c b/CodeSamples/SMPdesign/matmul.c
> index 6a07730..9f0b250 100644
> --- a/CodeSamples/SMPdesign/matmul.c
> +++ b/CodeSamples/SMPdesign/matmul.c
> @@ -18,12 +18,13 @@
>   * Copyright (c) 2009 Paul E. McKenney, IBM Corporation.
>   */
> 
> +#include <inttypes.h>
>  #include "../api.h"
> 
>  float *a;
>  float *b;
>  float *c;
> -long dim = 1000;
> +intptr_t dim = 1000;

This really is an int, used only for array index calculations.  I don't
see how it helps to make it be an intptr_t.  What am I missing?

>  int nthread = 1;
> 
>  #define GOFLAG_INIT     0
> @@ -38,8 +39,8 @@ atomic_t nstarted;
> 
>  void *matmul_thread(void *me_in)
>  {
> -	long me = (long)me_in;
> -	int i, j, k;
> +	intptr_t me = (intptr_t)me_in;
> +	intptr_t i, j, k;

Hmmm...  Now "me" is a long and used as such, but the conversion from
a pointer on 32-bit systems could get warnings on some systems.  But
it is guaranteed to be a small integer.  Would something like this work?

	int me = (int)(long)me_in;

Or this?

	int me = (intptr_t)me_in;

Or even this?

	int me = ((intptr_t)me_in) & 0xffffffff;

I suppose that the painfully correct way to do this would be to pass in
a pointer to a structure containing a lone int.  Any other approaches
that work?

The variables i, j, and k, like dim, are used only as int to compute
array indexes.

I have similar concerns about the remaining cases.  I am not inalterably
opposed, but it seems better to keep intptr_t usage more confined.

								Thanx, Paul

>  	atomic_inc(&nstarted);
>  	while (goflag == GOFLAG_INIT)
> @@ -58,7 +59,7 @@ void *matmul_thread(void *me_in)
> 
>  int main(int argc, char *argv[])
>  {
> -	int i, j;
> +	intptr_t i, j;
>  	long long startcreatetime;
>  	long long starttime;
>  	long long endtime;
> @@ -87,7 +88,7 @@ int main(int argc, char *argv[])
>  	goflag = GOFLAG_INIT;
>  	startcreatetime = get_microseconds();
>  	for (i = 0; i < nthread; i++)
> -		create_thread(matmul_thread, (void *)(long)i);
> +		create_thread(matmul_thread, (void *)i);
>  	while (atomic_read(&nstarted) != nthread)
>  		barrier();
>  	starttime = get_microseconds();
> @@ -95,7 +96,7 @@ int main(int argc, char *argv[])
>  	while (atomic_read(&ndone) != nthread)
>  		poll(NULL, 0, 1);
>  	endtime = get_microseconds();
> -	printf("dim = %ld, nthread = %d, duration = %lld : %lld us\n",
> +	printf("dim = %" PRIdPTR ", nthread = %d, duration = %lld : %lld us\n",
>  	       dim, nthread, endtime - startcreatetime, endtime - starttime);
>  	return 0;
>  }
> diff --git a/CodeSamples/SMPdesign/smpalloc.c b/CodeSamples/SMPdesign/smpalloc.c
> index 95b21a1..0882f63 100644
> --- a/CodeSamples/SMPdesign/smpalloc.c
> +++ b/CodeSamples/SMPdesign/smpalloc.c
> @@ -19,6 +19,7 @@
>   * Copyright (c) 2006 Paul E. McKenney, IBM Corporation.
>   */
> 
> +#include <inttypes.h>
>  #include "../api.h"
> 
>  #define TARGET_POOL_SIZE 3
> @@ -123,7 +124,7 @@ void *memblock_test(void *arg)
>  	long cnt = 0;
>  	long cntfail = 0;
>  	int i;
> -	int runlength = (int)(long)arg;
> +	intptr_t runlength = (intptr_t)arg;
>  	struct memblock *p[MAX_RUN];
> 
>  	if (runlength > MAX_RUN)
> @@ -159,7 +160,7 @@ int main(int argc, char *argv[])
>  	long long nc;
>  	long long nf;
>  	int nkids = 1;
> -	int runlength = 1;
> +	intptr_t runlength = 1;
>  	int totbefore;
> 
>  	smp_init();
> @@ -176,12 +177,12 @@ int main(int argc, char *argv[])
>  	if (argc > 2) {
>  		runlength = strtoul(argv[2], NULL, 0);
>  		if (runlength > MAX_RUN) {
> -			fprintf(stderr, "nkids = %d too large, max = %d\n",
> +			fprintf(stderr, "nkids = %" PRIdPTR " too large, max = %d\n",
>  				runlength, MAX_RUN);
>  			usage(argv[0]);
>  		}
>  	}
> -	printf("%d %d ", nkids, runlength);
> +	printf("%d %" PRIdPTR, nkids, runlength);
> 
>  	init_per_thread(results, 0L);
>  	init_per_thread(failures, 0L);
> @@ -189,7 +190,7 @@ int main(int argc, char *argv[])
> 
>  	goflag = 1;
>  	for (i = 0; i < nkids; i++)
> -		create_thread(memblock_test, (void *)(long)runlength);
> +		create_thread(memblock_test, (void *)runlength);
> 
>  	sleep(1);
>  	goflag = 0;
> diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
> index bc0b9ea..e794e82 100644
> --- a/CodeSamples/defer/gettimestampmp.c
> +++ b/CodeSamples/defer/gettimestampmp.c
> @@ -29,7 +29,7 @@ long curtimestamp = 0;
> 
>  void *collect_timestamps(void *mask_in)
>  {
> -	long mask = (long)mask_in;
> +	intptr_t mask = (intptr_t)mask_in;
> 
>  	while (curtimestamp < MAX_TIMESTAMPS) {
>  		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
> diff --git a/CodeSamples/intro/threadcreate.c b/CodeSamples/intro/threadcreate.c
> index 26b7ba9..470bb11 100644
> --- a/CodeSamples/intro/threadcreate.c
> +++ b/CodeSamples/intro/threadcreate.c
> @@ -18,13 +18,14 @@
>   * Copyright (c) 2006 Paul E. McKenney, IBM Corporation.
>   */
> 
> +#include <inttypes.h>
>  #include "../api.h"
> 
>  void *thread_test(void *arg)
>  {
> -	int myarg = (int)arg;
> +	intptr_t myarg = (intptr_t)arg;
> 
> -	printf("child thread %d: smp_thread_id() = %d\n",
> +	printf("child thread %" PRIdPTR ": smp_thread_id() = %d\n",
>  	       myarg, smp_thread_id());
>  	return NULL;
>  }
> @@ -38,7 +39,7 @@ void usage(char *progname)
> 
>  int main(int argc, char *argv[])
>  {
> -	int i;
> +	intptr_t i;
>  	int nkids = 1;
> 
>  	smp_init();
> -- 
> 2.7.4
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

