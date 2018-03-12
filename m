Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51322 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S932419AbeCLCJh (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun,
 11 Mar 2018 22:09:37 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2C29awC112617
 for <perfbook@vger.kernel.org>; Sun, 11 Mar 2018 22:09:36 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2gmwjwjd58-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 11 Mar 2018 22:09:35 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 11 Mar
 2018 22:09:25 -0400
Date: Sun, 11 Mar 2018 19:10:01 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] intro: Polish a sentence for MIPS graphs
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180311125241.30343-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180311125241.30343-1-sj38.park@gmail.com>
Message-Id: <20180312021001.GP3918@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 11, 2018 at 09:52:41PM +0900, SeongJae Park wrote:
> This commit polishes a sentence for MIPS graphs, which is updated by
> commit "cpu: Update MIPS graphs, adding past five years of CPUs"
> (71d8328f3d18).  The sentence is saying that the updated graph is
> showing past three decades, though it is now showing past forty years
> and the sentence also says so at last.  This commit polishes the
> sentence to say about the fourty years.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  intro/intro.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/intro/intro.tex b/intro/intro.tex
> index a4ec3a8..2f5679d 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -449,7 +449,7 @@ The CSIRAC and the Z80 are two points in a long-term trend, as can be
>  seen in
>  Figure~\ref{fig:intro:MIPS per Die for Intel CPUs}.
>  This figure plots an approximation to computational power per die
> -over the past three decades, showing an impressive six-order-of-magnitude
> +over the past four decades, showing an impressive six-order-of-magnitude
>  increase over a period of forty years.
>  Note that the advent of multicore CPUs has permitted this increase to
>  continue apace despite the clock-frequency wall encountered in 2003,
> -- 
> 2.10.0
> 

