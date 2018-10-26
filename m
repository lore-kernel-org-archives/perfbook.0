Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48812 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbeJ0Fgz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Oct 2018 01:36:55 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9QKsvus014670
        for <perfbook@vger.kernel.org>; Fri, 26 Oct 2018 16:58:22 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nc5y0jmh4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 26 Oct 2018 16:58:21 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 26 Oct 2018 16:58:20 -0400
Date: Fri, 26 Oct 2018 13:58:15 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] atomic_cmpxchg: Handle spurious failure of
 __atomic_compare_exchange_n in Power8 and ARMv8
Reply-To: paulmck@linux.ibm.com
References: <1540569805-7066-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540569805-7066-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20181026205815.GY4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sat, Oct 27, 2018 at 12:03:25AM +0800, Junchang Wang wrote:
> If the 4th parameter (field *weak*) of __atomic_compare_exchange_n is set, it
> may refuse to perform the CAS operation and return a failure, even if the value
> of field *old* is equal to the content of the specified memory location. This
> happens in architectures where LL/SC is used to emulate CAS primitive (e.g., PPC
> and ARM).
> 
> This patch returns the *old* value if __atomic_compare_exchange_n has been
> successfully performed; otherwise, *old*+1 is returned, which forces the caller
> to retry the CAS loop.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: kira Yokosawa <akiyks@gmail.com>

Very good, queued and pushed with adjustments to the commit log above,
thank you!!!

Please let me know if further adjustments are required.

							Thanx, Paul

> ---
>  CodeSamples/api-pthreads/api-gcc.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
> index 1dd26ca..3afe340 100644
> --- a/CodeSamples/api-pthreads/api-gcc.h
> +++ b/CodeSamples/api-pthreads/api-gcc.h
> @@ -168,9 +168,8 @@ struct __xchg_dummy {
>  ({ \
>  	typeof(*ptr) _____actual = (o); \
>  	\
> -	(void)__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> -					  __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
> -	_____actual; \
> +	__atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
> +			__ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
>  })
>  
>  static __inline__ int atomic_cmpxchg(atomic_t *v, int old, int new)
> -- 
> 2.7.4
> 

