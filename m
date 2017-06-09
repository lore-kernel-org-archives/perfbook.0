Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53211 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751635AbdFIWlA (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 9
 Jun 2017 18:41:00 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v59MdM9j144680
 for <perfbook@vger.kernel.org>; Fri, 9 Jun 2017 18:41:00 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ayv5gwgt1-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 09 Jun 2017 18:40:59 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 9 Jun 2017
 18:40:58 -0400
Date: Fri, 9 Jun 2017 15:40:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] route_refcnt: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Reply-To: paulmck@linux.vnet.ibm.com
References: <1496995551-4976-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496995551-4976-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20170609224055.GQ3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 09, 2017 at 04:05:51PM +0800, Junchang Wang wrote:
> Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE(), and updated corresponding
> latex file.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/defer/route_refcnt.c | 8 ++++----
>  defer/refcnt.tex                 | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
> index 6f8ae65..8a48faf 100644
> --- a/CodeSamples/defer/route_refcnt.c
> +++ b/CodeSamples/defer/route_refcnt.c
> @@ -35,7 +35,7 @@ DEFINE_SPINLOCK(routelock);
> 
>  static void re_free(struct route_entry *rep)
>  {
> -	ACCESS_ONCE(rep->re_freed) = 1;
> +	WRITE_ONCE(rep->re_freed, 1);
>  	free(rep);
>  }
> 
> @@ -56,13 +56,13 @@ retry:
>  	do {
>  		if (rep && atomic_dec_and_test(&rep->re_refcnt))
>  			re_free(rep);
> -		rep = ACCESS_ONCE(*repp);
> +		rep = READ_ONCE(*repp);
>  		if (rep == NULL)
>  			return ULONG_MAX;
> 
>  		/* Acquire a reference if the count is non-zero. */
>  		do {
> -			if (ACCESS_ONCE(rep->re_freed))
> +			if (READ_ONCE(rep->re_freed))
>  				abort();
>  			old = atomic_read(&rep->re_refcnt);
>  			if (old <= 0)
> @@ -137,7 +137,7 @@ void route_clear(void)
> 
>  	spin_lock(&routelock);
>  	rep = route_list.re_next;
> -	ACCESS_ONCE(route_list.re_next) = NULL;
> +	WRITE_ONCE(route_list.re_next, NULL);
>  	while (rep != NULL) {
>  		rep1 = rep->re_next;
>  		if (atomic_dec_and_test(&rep->re_refcnt))
> diff --git a/defer/refcnt.tex b/defer/refcnt.tex
> index c46fa48..c231961 100644
> --- a/defer/refcnt.tex
> +++ b/defer/refcnt.tex
> @@ -18,7 +18,7 @@
>  10
>  11 static void re_free(struct route_entry *rep)
>  12 {
> -13   ACCESS_ONCE(rep->re_freed) = 1;
> +13   WRITE_ONCE(rep->re_freed, 1);
>  14   free(rep);
>  15 }
>  16
> @@ -37,11 +37,11 @@
>  29     if (rep &&
>  30         atomic_dec_and_test(&rep->re_refcnt))
>  31       re_free(rep);
> -32     rep = ACCESS_ONCE(*repp);
> +32     rep = READ_ONCE(*repp);
>  33     if (rep == NULL)
>  34       return ULONG_MAX;
>  35     do {
> -36       if (ACCESS_ONCE(rep->re_freed))
> +36       if (READ_ONCE(rep->re_freed))
>  37         abort();
>  38       old = atomic_read(&rep->re_refcnt);
>  39       if (old <= 0)
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

