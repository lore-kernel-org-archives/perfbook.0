Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43846 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751208AbdEKDPt (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 10
 May 2017 23:15:49 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4B3BkM2145233
 for <perfbook@vger.kernel.org>; Wed, 10 May 2017 23:15:48 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ac47py3b2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 10 May 2017 23:15:48 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 10 May
 2017 23:15:47 -0400
Date: Wed, 10 May 2017 20:15:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
 <07cd658e-d71b-496e-5583-e204ae1c3ebf@gmail.com>
 <CABoNC81561Cdif7=LnT0z3xdkM++Ldznnd5uGNzMuyVv_XU56g@mail.gmail.com>
 <838da0fb-e7c9-8a0d-a0a9-52bff6095702@gmail.com>
 <CABoNC80oag9-esaYM2aDs0kf5ve=GJuHf8MAEVjGGzJin0QT-g@mail.gmail.com>
 <c324d63f-7da2-2c9c-f99f-c74fecb2bcc3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c324d63f-7da2-2c9c-f99f-c74fecb2bcc3@gmail.com>
Message-Id: <20170511031543.GC3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Thu, May 11, 2017 at 09:47:58AM +0900, Akira Yokosawa wrote:
> >From 557aa593d97bf2b8cc47ff14fbcaf3f80703866a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 9 May 2017 23:39:57 +0900
> Subject: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27
> 
> Reported-by: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Acked-by: Junchang Wang <junchangwang@gmail.com>

Queued and pushed, thank you both!

							Thanx, Paul

> ---
>  count/count.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index cc47554..096b53d 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -1260,7 +1260,7 @@ machine.
>  \QuickQuizAnswer{
>  	One approach would be to maintain a global approximation
>  	to the value.
> -	Readers would increment their per-thread variable, but when it
> +	Updaters would increment their per-thread variable, but when it
>  	reached some predefined limit, atomically add it to a global
>  	variable, then zero their per-thread variable.
>  	This would permit a tradeoff between average increment overhead
> -- 
> 2.7.4
> 
> 

