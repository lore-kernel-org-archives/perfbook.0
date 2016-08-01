Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46538 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1750857AbcHADTG (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 31
 Jul 2016 23:19:06 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u713EKhO119173
 for <perfbook@vger.kernel.org>; Sun, 31 Jul 2016 23:19:05 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24grd39s5t-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 31 Jul 2016 23:19:05 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 31 Jul
 2016 21:19:05 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 408153E40030	for <perfbook@vger.kernel.org>; Sun, 31 Jul 2016 21:19:02 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u713J6m556426670	for <perfbook@vger.kernel.org>; Mon, 1 Aug 2016 03:19:06 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u713J1Rb009271	for <perfbook@vger.kernel.org>; Sun, 31 Jul 2016 23:19:01
 -0400
Date: Sun, 31 Jul 2016 20:19:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] datastruct: Fix code citation typos
Reply-To: paulmck@linux.vnet.ibm.com
References: <1470007095-7503-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470007095-7503-1-git-send-email-sj38.park@gmail.com>
Message-Id: <20160801031905.GH3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 01, 2016 at 08:18:15AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes, queued and pushed!

							Thanx, Paul

> ---
>  datastruct/datastruct.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index da735ae..4807223 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1089,7 +1089,7 @@ may be freed.
> 
>  The \co{->ht_idx} field on line~16 indicates which of the two sets of
>  list pointers are being used by this instantiation of the hash table,
> -and is used to index the \co{->hte_next[]} array in the \co{ht_bucket}
> +and is used to index the \co{->hte_next[]} array in the \co{ht_elem}
>  structure on line~3.
> 
>  The \co{->ht_hash_private}, \co{->ht_cmp()}, \co{->ht_gethash()},
> @@ -1543,7 +1543,7 @@ Otherwise, line~19 picks up a reference to the current hash table,
>  and lines~21-24 allocate a new hash table of the desired size.
>  If a new set of hash/key functions have been specified, these are
>  used for the new table, otherwise those of the old table are preserved.
> -If line~25 detects memory-allocation failure, line~26 releases \co{->htlock}
> +If line~25 detects memory-allocation failure, line~26 releases \co{->ht_lock}
>  and line~27 returns a failure indication.
> 
>  Line~29 starts the bucket-distribution process by installing a reference
> -- 
> 1.9.1
> 

