Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38694 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751224AbdIKPm7 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 11
 Sep 2017 11:42:59 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8BFdUlp055749
 for <perfbook@vger.kernel.org>; Mon, 11 Sep 2017 11:42:59 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cwtkwdcjf-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 11 Sep 2017 11:42:58 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 11 Sep
 2017 11:42:57 -0400
Date: Mon, 11 Sep 2017 08:42:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Fix typo in '*_acquire' example
Reply-To: paulmck@linux.vnet.ibm.com
References: <6b962183-2529-3786-a55a-8e9729b16ced@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b962183-2529-3786-a55a-8e9729b16ced@gmail.com>
Message-Id: <20170911154255.GK3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 12, 2017 at 12:28:33AM +0900, Akira Yokosawa wrote:
> >From 469e14bc026a2aedd15284d3fa0ef55827eb7853 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 12 Sep 2017 00:21:45 +0900
> Subject: [PATCH] memorder: Fix typo in '*_acquire' example
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, applied and pushed, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 96b598b..c44dfd2 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -519,7 +519,7 @@ conditionally.
>  Blank cells indicate that no ordering is supplied.
> 
>  The \co{*_acquire} row covers \co{smp_load_acquire()},
> -\co{cmpxchg_acquire()}, \co{xchg_release()}, and so on;
> +\co{cmpxchg_acquire()}, \co{xchg_acquire()}, and so on;
>  the \co{*_release} row covers \co{smp_store_release()},
>  \co{cmpxchg_release()}, \co{xchg_release()}, and so on; and
>  the ``Successful Non-Relaxed Non-\co{void} RMW'' row covers
> -- 
> 2.7.4
> 

