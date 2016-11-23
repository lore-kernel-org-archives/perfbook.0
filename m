Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43514 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S933908AbcKWTpm (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 23
 Nov 2016 14:45:42 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uANJhekv042774
 for <perfbook@vger.kernel.org>; Wed, 23 Nov 2016 14:45:42 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 26we2xwfc7-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 23 Nov 2016 14:45:42 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 23 Nov
 2016 12:45:41 -0700
Date: Wed, 23 Nov 2016 11:45:39 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] CodeSamples: Fix typo of "acquire"
Reply-To: paulmck@linux.vnet.ibm.com
References: <20161123122915.14350-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161123122915.14350-1-tklauser@distanz.ch>
Message-Id: <20161123194539.GY3612@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: perfbook@vger.kernel.org

On Wed, Nov 23, 2016 at 01:29:15PM +0100, Tobias Klauser wrote:
> Change "aquire" to "acquire".
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
> 
> Hi Paul,
> 
> As suggested in our private conversation, I try to give it another shot to
> submit a patch. Let's hope it now reaches you directly and/or via mailing list.

I did get this one!  Queued and pushed, thank you!

							Thanx, Paul

> Thanks
> Tobias
> 
>  CodeSamples/SMPdesign/lockrwdeq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/SMPdesign/lockrwdeq.c b/CodeSamples/SMPdesign/lockrwdeq.c
> index 137aa1a7b669..fd0d07cad15a 100644
> --- a/CodeSamples/SMPdesign/lockrwdeq.c
> +++ b/CodeSamples/SMPdesign/lockrwdeq.c
> @@ -74,7 +74,7 @@ void deq_push_r(struct cds_list_head *e, struct deq *p)
>  /*
>   * And now the concurrent implementation, which uses a counter and a rw lock.
>   * The counter holds the current available number of items to modify.
> - * Before doing a modification we aquire a read lock and reserve our item to modify
> + * Before doing a modification we acquire a read lock and reserve our item to modify
>   * (link/unlink).
>   * If there are not enough items left for true parallel access we will upgrade
>   * the read lock, to a write lock, making the access truly sequential.
> -- 
> 2.11.0.rc0.7.gbe5a750
> 
> 

