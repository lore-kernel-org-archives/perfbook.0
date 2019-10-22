Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730141AbfJVPvl (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 22 Oct 2019 11:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571759500;
        bh=qdHN4yDQ+rEH8E6L10MefUUp7DDys0k+x/z5hVYSNRc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Th+duWmy5JDcZ5yLpyNqzZ2DRe5G1omCxde7k/JegZWZZeQ8kbdf2vmGGW3aht6mQ
         GLTXPl+g+kLam5hgyXMcUSb4ePOAG57QBTDAaUkN6kj7PPx3BXLhtV5wSu9HlOBdd9
         ERtuvVGKu0gu7pDWVvsiHUlEwmkJr/2C4eNRLERU=
Date: Tue, 22 Oct 2019 08:51:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v4 5/6] defer/rcuintro: Convert snippet to new scheme
Message-ID: <20191022155137.GF2479@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
 <20191022120533.GE2479@paulmck-ThinkPad-P72>
 <67a02888-6011-faef-985f-f2cad86a091c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a02888-6011-faef-985f-f2cad86a091c@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>

On Tue, Oct 22, 2019 at 11:34:48PM +0900, Akira Yokosawa wrote:
> >From 6a9e5e96a0dd94b6f20052ab741d2606e79dc80f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 22 Oct 2019 23:23:42 +0900
> Subject: [PATCH v4 5/6] defer/rcuintro: Convert snippet to new scheme
> 
> This snippet was added using the verbatimbox scheme.
> Convert it using VerbatimL.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> > With the exception of defer/rcuintro.tex, which collided with one of
> > my cleanups.  I believe that the fix is straightforward, just accounting
> > for the line I added, but I figured that I should check.
> 
> FWIW, this is the result of my rebase of the patch.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> > 
> > 							Thanx, Paul
> 
> --
>  defer/rcuintro.tex | 58 ++++++++++++++++++++++------------------------
>  1 file changed, 28 insertions(+), 30 deletions(-)
> 
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index ed7ff0b0..dc750326 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -375,50 +375,48 @@ has executed a context switch, which in turn guarantees that
>  all pre-existing reader threads have completed.
>  
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}[\LstLineNo]
> +\begin{linelabel}[ln:defer:Insertion and Deletion With Concurrent Readers]
> +\begin{VerbatimL}[commandchars=\\\[\]]
>  struct route *gptr;
>  
>  int access_route(int (*f)(struct route *rp))
>  {
> -  int ret = -1;
> -  struct route *rp;
> -
> -  rcu_read_lock();
> -  rp = rcu_dereference(gptr);
> -  if (rp)
> -  	ret = f(rp);
> -  rcu_read_unlock();
> -  return ret;
> +	int ret = -1;
> +	struct route *rp;
> +
> +	rcu_read_lock();
> +	rp = rcu_dereference(gptr);
> +	if (rp)
> +		ret = f(rp);
> +	rcu_read_unlock();
> +	return ret;
>  }
>  
>  struct route *ins_route(struct route *rp)
>  {
> -  struct route *old_rp;
> +	struct route *old_rp;
>  
> -  spin_lock(&route_lock);
> -  old_rp = gptr;
> -  rcu_assign_pointer(gptr, rp);
> -  spin_unlock(&route_lock);
> -  return old_rp;
> +	spin_lock(&route_lock);
> +	old_rp = gptr;
> +	rcu_assign_pointer(gptr, rp);
> +	spin_unlock(&route_lock);
> +	return old_rp;
>  }
>  
>  int del_route(void)
>  {
> -  struct route *old_rp;
> -
> -  spin_lock(&route_lock);
> -  old_rp = gptr;
> -  RCU_INIT_POINTER(gptr, NULL);
> -  spin_unlock(&route_lock);
> -  synchronize_rcu();
> -  free(old_rp);
> -  return !!old_rp;
> +	struct route *old_rp;
> +
> +	spin_lock(&route_lock);
> +	old_rp = gptr;
> +	RCU_INIT_POINTER(gptr, NULL);
> +	spin_unlock(&route_lock);
> +	synchronize_rcu();
> +	free(old_rp);
> +	return !!old_rp;
>  }
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\end{VerbatimL}
> +\end{linelabel}
>  \caption{Insertion and Deletion With Concurrent Readers}
>  \label{lst:defer:Insertion and Deletion With Concurrent Readers}
>  \end{listing}
> -- 
> 2.17.1
> 
> 
