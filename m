Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730019AbgCKQLz (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 11 Mar 2020 12:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583943115;
        bh=4i8RFMwePYUdRnosrRyYyYQdb78v/3HaPOOWZVhN/Bw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=g4a9eqALKl9EMfu4LmnHC4b6NeLNvHNeCdsxr0cIaxRybOZtJNWCX43CTi1Zx9uiY
         bJMw3SN+fSqTl2lZNVCUDo8goOq/nb1FgAsOpwHNjySwAwY8VLCYoCJ//82SIZh7VN
         LCWG1Fo1GF1Y9x26KOW0qhaH4QIVurPrBvr+EgwE=
Date: Wed, 11 Mar 2020 09:11:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] cpu/overheads: Fix typos in large server's overhead
 table
Message-ID: <20200311161154.GR2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <db66a177-0ae2-14a2-0ec7-854531a2a62a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db66a177-0ae2-14a2-0ec7-854531a2a62a@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Mar 11, 2020 at 08:46:36PM +0900, Akira Yokosawa wrote:
> >From 512ad80cac5977ad331260b4691b172585827e1b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 10 Mar 2020 20:48:17 +0900
> Subject: [PATCH 1/2] cpu/overheads: Fix typo in large server's overhead table
> 
> CPU 224 is not among Off-core CPUs.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, applied, thank you!!!

							Thanx, Paul

> ---
>  cpu/overheads.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 717a9ea0..d1b4f596 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -149,8 +149,8 @@ optimization.
>  	Same-CPU lock		     &  15.4 &   32.3 & 0		  \\
>  	In-core blind CAS	     &   7.2 &   15.2 & 224		  \\
>  	In-core CAS		     &  18.0 &   37.7 & 224		  \\
> -	Off-core blind CAS	     &  47.5 &   99.8 & 1--27,224--251	  \\
> -	Off-core CAS		     & 101.9 &  214.0 & 1--27,224--251	  \\
> +	Off-core blind CAS	     &  47.5 &   99.8 & 1--27,225--251	  \\
> +	Off-core CAS		     & 101.9 &  214.0 & 1--27,225--251	  \\
>  	Off-socket blind CAS	     & 148.8 &  312.5 & 28--111,252--335  \\
>  	Off-socket CAS		     & 442.9 &  930.1 & 28--111,252--335  \\
>  	Cross-interconnect blind CAS & 336.6 &  706.8 & 112--223,336--447 \\
> -- 
> 2.17.1
> 
