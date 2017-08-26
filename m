Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35581 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750737AbdHZEiD (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 26
 Aug 2017 00:38:03 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7Q4af6e034584
 for <perfbook@vger.kernel.org>; Sat, 26 Aug 2017 00:38:03 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cjrdm70e2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 26 Aug 2017 00:38:03 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 26 Aug
 2017 00:38:02 -0400
Date: Fri, 25 Aug 2017 21:38:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Adjust epigraph style
Reply-To: paulmck@linux.vnet.ibm.com
References: <f084b0ef-0b12-1cfd-b057-f4f79ed3b75e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f084b0ef-0b12-1cfd-b057-f4f79ed3b75e@gmail.com>
Message-Id: <20170826043810.GX11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 26, 2017 at 12:01:17PM +0900, Akira Yokosawa wrote:
> >From a7cccce3ad3d4c93d20d7c5cb05de931f5e67733 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 26 Aug 2017 11:57:45 +0900
> Subject: [PATCH] memorder: Adjust epigraph style
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, fixed!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index bde5a45..c571e49 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -4,7 +4,7 @@
>  \OriginallyPublished{Chapter}{chp:memorder:Memory Ordering}{Linux Kernel Memory Barriers}{kernel.org}{Howells2009membartxt}
>  \OriginallyPublished{Chapter}{chp:memorder:Memory Ordering}{A formal kernel memory-ordering model}{Linux Weekly News}{JadeAlglave2017LWN-LKMM-1,JadeAlglave2017LWN-LKMM-2}
>  %
> -\epigraph{The art of progress is to preserve order amid change and to preserve change amid order.}{Alfred North Whitehead}
> +\Epigraph{The art of progress is to preserve order amid change and to preserve change amid order.}{\emph{Alfred North Whitehead}}
> 
>  Causality and sequencing are deeply intuitive, and hackers often
>  tend to have a much stronger grasp of these concepts than does
> -- 
> 2.7.4
> 

