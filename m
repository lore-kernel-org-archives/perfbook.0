Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55458 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1754288AbdA3T66 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 30
 Jan 2017 14:58:58 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0UJwZ7Z090149
 for <perfbook@vger.kernel.org>; Mon, 30 Jan 2017 14:58:58 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 289sqxtg8a-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 30 Jan 2017 14:58:57 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 30 Jan
 2017 12:58:56 -0700
Date: Mon, 30 Jan 2017 11:58:55 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/8] bib/syncrefs: Add doi to Kontothanassis97a
Reply-To: paulmck@linux.vnet.ibm.com
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
 <71c01432-ecaa-d43b-269e-b44bd7cdf1ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c01432-ecaa-d43b-269e-b44bd7cdf1ce@gmail.com>
Message-Id: <20170130195855.GP3989@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 30, 2017 at 12:30:48AM +0900, Akira Yokosawa wrote:
> >From ab76f3f9691060ea7b88561e6027a9ee65857f45 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 13 Nov 2016 13:23:45 +0900
> Subject: [PATCH 4/8] bib/syncrefs: Add doi to Kontothanassis97a
> 
> Also fix publication info to match what is found in ACM Digital
> Library.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  bib/syncrefs.bib | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index aa2baad..073ada8 100644
> --- a/bib/syncrefs.bib
> +++ b/bib/syncrefs.bib
> @@ -311,11 +311,12 @@ Symposium on Computer Architecture"
>  ,author="Leonidas Kontothanassis and Robert W. Wisniewski and Michael L. Scott"
>  ,title="Scheduler-Conscious Synchronization"
>  ,Year="1997"
> -,Month="January"
> -,journal="Communications of the {ACM}"
> +,Month="Feburuary"

I fixed this to "February" while applying to my private bibtex archive.  ;-)

							Thanx, Paul

> +,journal="{ACM} Transactions on Computer Systems"
>  ,volume="15"
>  ,number="1"
>  ,pages="3--40"
> +,doi="10.1145/244764.244765"
>  }
> 
>  @Conference{HubertusFrancke2002Futex
> -- 
> 2.7.4
> 
> 

