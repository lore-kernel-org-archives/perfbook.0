Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:48323 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1753714AbcDCN5b (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2016
 09:57:31 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Apr 2016
 07:57:29 -0600
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 D8AB019D803F	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 07:45:20 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u33DvR0c40304854	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 13:57:27 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u33DvR3e025343	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:57:27 -0400
Date: Sun, 3 Apr 2016 06:57:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 6/6] advsync: Fix wrong reference to section ``MMIO write
 barrier''
Message-ID: <20160403135726.GC5835@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-7-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459556911-11538-7-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: dhowells@redhat.com, perfbook@vger.kernel.org

On Sat, Apr 02, 2016 at 09:28:31AM +0900, SeongJae Park wrote:
> A sentence references ``MMIO write barrier'' subsection though the
> section does not exists.  Unfortunately, there is no section for MMIO
> write barrier though appendix ``Why Memory Barriers?'' says about
> mmiowb() subtly.  For the purpose of the sentence, it could be
> alternated with reference to ``Device operations'' subsection because it
> describes about the exceptional case.  For the reason, this commit
> updates it to the reference to ``Device Operations'' subsection.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 1fe0953..b511f51 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1559,7 +1559,7 @@ other strictly in the order specified.
> 
>  The use of LOCK and UNLOCK operations generally precludes the need for
>  other sorts of memory barrier (but note the exceptions mentioned in the
> -subsection ``MMIO write barrier'').
> +Section~\ref{sec:advsync:Device Operations}).
> 
>  \QuickQuiz{}
>  	What effect does the following sequence have on the
> -- 
> 1.9.1
> 

