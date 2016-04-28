Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:60326 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750932AbcD1OHC (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 28 Apr 2016
 10:07:02 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 28 Apr
 2016 10:07:01 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id A37526E804F
 for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 10:06:42 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3SE6vS136306968	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 14:06:57
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3SE6tpj004961	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 10:06:57
 -0400
Date: Thu, 28 Apr 2016 07:07:31 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] whymb: Remove redundant words
Message-ID: <20160428140731.GE4609@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <f053f42a-478a-8c35-780a-a51094b03030@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f053f42a-478a-8c35-780a-a51094b03030@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 28, 2016 at 08:18:15PM +0900, Akira Yokosawa wrote:
> >From 53364b467603cd5ec9e1f6a12ad9377a76ebb72a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Thu, 28 Apr 2016 20:08:32 +0900
> Subject: [PATCH] whymb: Remove redundant words
> 
> The sentence fixed in commit 3d3ce3673746 ("Fix now-obsolete back
> reference to Compaq Wizard web page") has redundant words around
> the citation. This commit removes them.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Good catch, queued!

And no, that change wasn't one of my better efforts, was it?

							Thanx, Paul

> ---
>  appendix/whymb/whymemorybarriers.tex | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 6d09bfc..0c3b83e 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -1788,8 +1788,7 @@ busy, but cache bank~0 is idle.
>  This could result in the cache invalidates for the new element being
>  delayed, so that the reading CPU gets the new value for the pointer,
>  but sees the old cached values for the new element.
> -See the documentation called out earlier~\cite{Compaq01} called out
> -earlier for more information,
> +See the documentation~\cite{Compaq01} called out earlier for more information,
>  or, again, if you think that I am just making all this up.\footnote{
>  	Of course, the astute reader will have already recognized that
>  	Alpha is nowhere near as mean and nasty as it could be,
> -- 
> 1.9.1
> 

