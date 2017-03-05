Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37768 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751921AbdCFGUG (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 6
 Mar 2017 01:20:06 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v266E4aE038796
 for <perfbook@vger.kernel.org>; Mon, 6 Mar 2017 01:18:37 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28yuy1m8hr-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 06 Mar 2017 01:18:37 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 5 Mar 2017
 23:18:36 -0700
Date: Sun, 5 Mar 2017 13:24:10 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] bib/syncrefs: Add doi to Hoare74
Reply-To: paulmck@linux.vnet.ibm.com
References: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
 <9ce3ae6a-d341-7ec2-5e27-2c2ba9fc2d7c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ce3ae6a-d341-7ec2-5e27-2c2ba9fc2d7c@gmail.com>
Message-Id: <20170305212410.GH30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 03, 2017 at 09:29:46PM +0900, Akira Yokosawa wrote:
> >From 5a3db5ddd9458a1787bdf9bd554146079501df18 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 3 Mar 2017 21:20:05 +0900
> Subject: [PATCH 2/2] bib/syncrefs: Add doi to Hoare74
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you!  I will push this as soon as I get to decent
internet connectivity.

							Thanx, Paul

> ---
>  bib/syncrefs.bib | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index 0a946d4..c5d7372 100644
> --- a/bib/syncrefs.bib
> +++ b/bib/syncrefs.bib
> @@ -268,6 +268,7 @@ Brent A Kingsbury"
>  ,volume="17"
>  ,number="10"
>  ,pages="549-557"
> +,doi="10.1145/355620.361161"
>  }
> 
>  @article{Lamport74a
> -- 
> 2.7.4
> 
> 

