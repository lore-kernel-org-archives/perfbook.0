Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58279 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751195AbdILF1e (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 12
 Sep 2017 01:27:34 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8C5O8kE097574
 for <perfbook@vger.kernel.org>; Tue, 12 Sep 2017 01:27:34 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cx8nwtg43-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 12 Sep 2017 01:27:33 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 12 Sep
 2017 01:27:32 -0400
Date: Mon, 11 Sep 2017 20:58:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] memorder: Fix wrong variable citation
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170912005617.19975-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170912005617.19975-1-sj38.park@gmail.com>
Message-Id: <20170912035849.GR3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 12, 2017 at 09:56:15AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes!  Applied all three, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 183c525..2da7b98 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -704,8 +704,8 @@ as Y0, the store to \co{x1} on line~19 as Y1, and the load from
>  Applying the if-then rule step by step, we know that the store to
>  \co{x1} on line~19 happens after the load from \co{x1} on line~11 if
>  \co{P0()}'s local variable \co{r2} is set to the value zero.
> -The if-then rule would then state that the load from \co{x1} on
> -line~21 happens after the store to \co{x1} on line~9.
> +The if-then rule would then state that the load from \co{x0} on
> +line~21 happens after the store to \co{x0} on line~9.
>  In other words,
>  \co{P1()}'s local variable \co{r2} is guaranteed
>  to end up with the value two \emph{only if}
> -- 
> 2.10.0
> 

