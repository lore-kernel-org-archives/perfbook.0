Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56560 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S932279AbdJ0Xcs (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri,
 27 Oct 2017 19:32:48 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9RNTj8j124931
 for <perfbook@vger.kernel.org>; Fri, 27 Oct 2017 19:32:47 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2dv9su2ts3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 27 Oct 2017 19:32:47 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 27 Oct
 2017 19:32:47 -0400
Date: Fri, 27 Oct 2017 16:32:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] typo at Chp 7.
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171027092317.GA8509@HP> <20171027093317.GB8509@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171027093317.GB8509@HP>
Message-Id: <20171027233244.GU3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 27, 2017 at 05:33:20PM +0800, Yubin Ruan wrote:
> And here are some more modification to some wording in chapter 7, but I am not
> sure whether you like it or not.
> 
> Anyway, chapter 7 makes me feel good ;-) It makes me know that home-brewing a
> lock primitives with atomic instructions(which is what I was doing) is
> something that is possible and used in production.

It most certainly is possible, but it is wise less often than it might
seem.  ;-)

> Thanks,
> Yubin

BTW, I cannot accept patches without a valid Signed-off-by.  As Akira
suggested, please see the FAQ for more details.

> diff --git a/locking/locking.tex b/locking/locking.tex
> index 14db27d..a9f46f1 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -2166,8 +2166,8 @@ Signal-handler deadlocks can be explicitly avoided as follows:
>  	of a signal handler.
>  \item	If the application invokes the library function
>  	while holding a lock acquired within a given signal
> -	handler, then that signal must be blocked every time that the
> -	library function is called outside of a signal handler.
> +	handler, then that signal must be blocked every time that lock
> +    is to be acquired outside of a signal handler.
>  \end{enumerate}

I covered this on in my earlier email.

>  These rules can be enforced by using tools similar to
> @@ -2329,7 +2329,7 @@ locking's villainy.
>  If there are a very large number of uses of a callback-heavy library,
>  it may be wise to again add a parallel-friendly API to the library in
>  order to allow existing users to convert their code incrementally.
> -Alternatively, some advocate use of transactional memory in these cases.
> +Alternatively, some advocate using transactional memory in these cases.
>  While the jury is still out on transactional memory,
>  Section~\ref{sec:future:Transactional Memory} discusses its strengths and
>  weaknesses.

And for this one, I am not seeing the problem with the original wording.

							Thanx, Paul

