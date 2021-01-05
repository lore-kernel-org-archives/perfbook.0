Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbhAERSe (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 5 Jan 2021 12:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609867073;
        bh=IadjOrnmKvi7ZytVXcErxzigtUxZxAR2oX2bEZ8c0to=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nAtD0e63OdomPTKH5xedjSoJuxGevZuSEX2xlxmmNESXlfG6gNM+Qbbjm3iLhpA04
         QTV2VrNIqwqOCCP64Hh7NahkCS/SKdhrRY4F0vTIN2t0/URo48tOhV5X2oEklXG5W/
         7m8uF6m6P/VIIlnDUPJSpUBC9tzkjjBZC1ZyZmncOLqKUfeH+a0ea0C0Ig3OdOU5xX
         DqVfnHkTR4DJvDgR63VdxE20p4+KQLqdYlpdES2k3Ntc+FNERvlf+vZ6uRoCS0zrK9
         CnhV/s6ncCkO/wqoJkmvMExrB44wBxAwl9pM2n2K9q0Vig89D2+QPsrkUlvJW9WvUT
         KvNh6qRD+y2dQ==
Date: Tue, 5 Jan 2021 09:17:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] bib/RCU: Salvage URL of McKenney01f
Message-ID: <20210105171753.GG17086@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <742e49a4-71d4-095f-1ce8-f0523d3d9cfb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <742e49a4-71d4-095f-1ce8-f0523d3d9cfb@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 05, 2021 at 08:44:27PM +0900, Akira Yokosawa wrote:
> >From 6c70e72f223c2af31aa91b4e2ba69e352f67b046 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 5 Jan 2021 20:28:09 +0900
> Subject: [PATCH -perfbook] bib/RCU: Salvage URL of McKenney01f
> 
> Looks like the link to http://marc.theaimsgroup.com/ does not work.
> Use the archive at https://lore.kernel.org/lkml/ instead.
> 
> The mail thread is not perfect, but it allows us to see the opinions
> of people nearly two decades ago.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  bib/RCU.bib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/bib/RCU.bib b/bib/RCU.bib
> index cf490ec4..de75eb8f 100644
> --- a/bib/RCU.bib
> +++ b/bib/RCU.bib
> @@ -322,8 +322,8 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni",
>   month="October",
>   year="2001",
>   note="Available:
> -\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=100259266316456&w=2}
> -[Viewed June 23, 2004]",
> +\url{https://lore.kernel.org/lkml/200110090155.f991tPt22329@eng4.beaverton.ibm.com/}
> +[Viewed January 05, 2021]",
>  }
>  
>  @unpublished{Spraul01,
> -- 
> 2.17.1
> 
