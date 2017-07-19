Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51796 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752811AbdGSRa3 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 19 Jul 2017 13:30:29 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6JHSla1070912
 for <perfbook@vger.kernel.org>; Wed, 19 Jul 2017 13:30:29 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2bt75m627q-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 19 Jul 2017 13:30:29 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 19 Jul
 2017 13:30:28 -0400
Date: Wed, 19 Jul 2017 10:30:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix control-dependency no-transitivity example
Reply-To: paulmck@linux.vnet.ibm.com
References: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165340ca-3acd-a8be-43ad-ccf64582aa21@gmail.com>
Message-Id: <20170719173026.GF3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 14, 2017 at 11:34:45PM +0900, Akira Yokosawa wrote:
> >From 8740c546fbb6988c2fcf4a88c4314df972d0b9b7 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 14 Jul 2017 22:48:37 +0900
> Subject: [PATCH] advsync: Fix control-dependency no-transitivity example
> 
> The corresponding assert condition in memory-barriers.txt was
> fixed in commit 5646f7acc95f ("memory-barriers: Fix control-
> ordering no-transitivity example") of Linux kernel repository.
> Somehow it was imported to perfbook in a wrong form and has
> survived since.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

And I did take this, thank you very much, and please accept my apologies
for the delay.

If I understand correctly, I should leave your second patch alone.
If I am confused, please let me know!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index c9c975c..25a90b2 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -3036,9 +3036,9 @@ not), then adding the following CPU would guarantee a related assertion:
>  \begin{tabular}{l}
>  	\nf{CPU 2} \\
>  	\hline
> -	\tco{WRITE_ONCE(y, 1);} \\
> +	\tco{WRITE_ONCE(x, 2);} \\
>  	\multicolumn{1}{l}{~} \\
> -	\multicolumn{1}{l}{\tco{assert(!(r1 == 1 && r2 == 1 && x == 1));}} \\
> +	\multicolumn{1}{l}{\tco{assert(!(r1 == 2 && r2 == 1 && x == 2));}} \\
>  \end{tabular}
>  \end{minipage}
>  \vspace{5pt}
> -- 
> 2.7.4
> 

