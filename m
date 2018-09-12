Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42678 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1726606AbeILSXh (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 12 Sep 2018 14:23:37 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8CDI757099975
 for <perfbook@vger.kernel.org>; Wed, 12 Sep 2018 09:19:08 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2mf1pudgk2-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Wed, 12 Sep 2018 09:19:05 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 12 Sep
 2018 09:18:59 -0400
Date: Wed, 12 Sep 2018 06:18:56 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] CodeSamples/count: Use READ_ONCE/WRITE_ONCE in
 count_nonatomic.c
Reply-To: paulmck@linux.vnet.ibm.com
References: <1ac811fa-ad08-43aa-ac74-e6367c33e742@gmail.com>
 <CAFMy-Rk76bc+oOXq7ijGT4wzYkFbs1F7bkLWQ-VwE_O2Q-Z2VQ@mail.gmail.com>
 <45701c97-023a-190f-0113-9b272fbd8e41@gmail.com>
 <59ab187c-a663-1e84-9241-919f358ba663@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59ab187c-a663-1e84-9241-919f358ba663@gmail.com>
Message-Id: <20180912131856.GH4225@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Imre Palik <imrep.amz@gmail.com>, perfbook@vger.kernel.org

On Wed, Sep 12, 2018 at 07:53:24PM +0900, Akira Yokosawa wrote:
> >From 13fa1b9b162483df5d88b7aefe408a4e17e83338 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 12 Sep 2018 19:27:41 +0900
> Subject: [PATCH] CodeSamples/count: Use READ_ONCE/WRITE_ONCE in count_nonatomic.c
> 
> Without them, inlined accesses can be optimized away by "-O3".

That code was written in a far more innocent time when compilers were
far less aggressive, wasn't it?

Great catch, both on the data and on the code, thank you!  Applied and
pushed.

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/count/count_nonatomic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/count/count_nonatomic.c b/CodeSamples/count/count_nonatomic.c
> index 90979c5..50df475 100644
> --- a/CodeSamples/count/count_nonatomic.c
> +++ b/CodeSamples/count/count_nonatomic.c
> @@ -25,12 +25,12 @@ unsigned long counter = 0;
> 
>  __inline__ void inc_count(void)
>  {
> -	counter++;
> +	WRITE_ONCE(counter, READ_ONCE(counter) + 1);
>  }
> 
>  __inline__ unsigned long read_count(void)
>  {
> -	return counter;
> +	return READ_ONCE(counter);
>  }
> 
>  __inline__ void count_init(void)
> -- 
> 2.7.4
> 
> 

