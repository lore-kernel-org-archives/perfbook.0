Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:58705 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752355AbcDCN5O (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2016
 09:57:14 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Apr 2016
 09:57:13 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 334C0C90027
 for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:57:07 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u33DvBC938666422	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 13:57:11 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u33DvBmK024877	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:57:11 -0400
Date: Sun, 3 Apr 2016 06:57:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/6] advsync: Fix critical section bleed-in description
Message-ID: <20160403135710.GB5835@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-6-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459556911-11538-6-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: dhowells@redhat.com, perfbook@vger.kernel.org

On Sat, Apr 02, 2016 at 09:28:30AM +0900, SeongJae Park wrote:
> A sentence in `Locking Examples` section says both LOCK and UNLOCK
> allows preceding operations `bleed in` to the critical section.
> However, it's wrong description.  LOCK allows only preceding operations
> and UNLOCK allows only following operations to bleed in.  Looks like the
> wrong description made by just a trivial mistake.  This commit fixes the
> sentence to have correct description.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index b1f49d3..1fe0953 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -2232,8 +2232,9 @@ might well execute in the following order:
>  \end{minipage}
>  \vspace{5pt}
> 
> -Again, always remember that both LOCK and UNLOCK are permitted to let
> -preceding operations ``bleed in'' to the critical section.
> +Again, always remember that LOCK and UNLOCK are permitted to let preceding
> +operations and following operations ``bleed in'' to the critical section
> +respectively.
> 
>  \QuickQuiz{}
>  	What sequence of LOCK-UNLOCK operations \emph{would}
> -- 
> 1.9.1
> 

