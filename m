Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33874 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751167AbdJ1NMb (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 28 Oct 2017 09:12:31 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9SD9Bpc124103
 for <perfbook@vger.kernel.org>; Sat, 28 Oct 2017 09:12:30 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dvnse0ju4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 28 Oct 2017 09:12:30 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 28 Oct
 2017 09:12:29 -0400
Date: Sat, 28 Oct 2017 06:12:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Listing 9.2: actual free(3) will probably cause problem
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171028092932.GG5742@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171028092932.GG5742@HP>
Message-Id: <20171028131227.GV3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 28, 2017 at 05:29:34PM +0800, Yubin Ruan wrote:
> Hi Paul,
> 
> I would suggest the following patch for defer/route_refcnt.c (as in Listing
> 9.2). For the change in re_free, if we actually call free(3) on `rep', we will
> lose that piece of memory so that the READ_ONCE() at line 36 might see garbage
> value and will probably will not call abort(3), i.e., that is implementation
> specific behavior. And I don't see why will we have `old <=0`.
> 
> I think I understand what that code mean but you might mean some other?
> Hopefully I will not be too picky.

Yes, this code is buggy and fixing it is on my list.  I would be happy to
accept a patch doing a real fix, but it is not simple.

One place to start is Anthony Williams's atomic shared pointer code.
The idea would be to translate that from C++ to C.

But please be aware that this is a non-trivial problem.  If you try to
hack together a solution, it -will- have subtle bugs.  So validating
your solution (even if you start from Anthony's approach) will be
non-trivial.  I suggest using cbmc or something similar in addition to
perfbook's stress tests.

So, are you up for it?  ;-)

							Thanx, Paul

> Thanks,
> Yubin
> 
> ----------------------------------------
> diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
> index 8a48faf..0d24e9d 100644
> --- a/CodeSamples/defer/route_refcnt.c
> +++ b/CodeSamples/defer/route_refcnt.c
> @@ -36,7 +36,8 @@ DEFINE_SPINLOCK(routelock);
>  static void re_free(struct route_entry *rep)
>  {
>  	WRITE_ONCE(rep->re_freed, 1);
> -	free(rep);
> +    /* Will not actually free it. Just use the `re_freed' as a flag */
> +	/*free(rep);*/
>  }
> 
>  /*
> @@ -50,7 +51,6 @@ unsigned long route_lookup(unsigned long addr)
>  	struct route_entry **repp;
>  	unsigned long ret;
> 
> -retry:
>  	repp = &route_list.re_next;
>  	rep = NULL;
>  	do {
> @@ -65,8 +65,6 @@ retry:
>  			if (READ_ONCE(rep->re_freed))
>  				abort();
>  			old = atomic_read(&rep->re_refcnt);
> -			if (old <= 0)
> -				goto retry;
>  			new = old + 1;
>  		} while (atomic_cmpxchg(&rep->re_refcnt, old, new) != old);
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

