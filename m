Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730211AbfJPDby (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 15 Oct 2019 23:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571196712;
        bh=IGMPiFDulsFu/xfzHXGLc+nh+bczCicaEm+JS7yYHYs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pPV1vzLv4gRs2BrdqTwsbn697ozyId01dLipkzRawoeCCN9j9yM4U8KhFqGcuCP8c
         Eww6uUoWh+r2oUSD9HglgbZk3DysbL6Wx9coe4nKb6ON8EIP3D15RQroQsAioTbTMq
         h4Atlv3fcMFjG0ttVn+/OsWdhxg7oTef7KUeevLQ=
Date: Tue, 15 Oct 2019 20:31:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Fix indents in code snippets
Message-ID: <20191016033150.GV2689@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <cfb000d6-4374-3af6-4fec-2e8ed92e3f7e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb000d6-4374-3af6-4fec-2e8ed92e3f7e@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 16, 2019 at 12:06:53AM +0900, Akira Yokosawa wrote:
> >From d88490b0bbfa75dfde50144a420193500160ec1e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 15 Oct 2019 23:59:28 +0900
> Subject: [PATCH] Fix indents in code snippets
> 
> Fix inconsistencies in leading spaces.
> Some were errors during conversion to the new scheme (inline snippets),
> others emerged now that they are extracted from code samples.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/defer/rcu_nest.c  | 4 ++--
>  CodeSamples/defer/rcu_rcpl.h  | 2 +-
>  CodeSamples/defer/rcu_rcpls.h | 2 +-
>  memorder/memorder.tex         | 4 ++--
>  together/refcnt.tex           | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/CodeSamples/defer/rcu_nest.c b/CodeSamples/defer/rcu_nest.c
> index 7e368662..516f5921 100644
> --- a/CodeSamples/defer/rcu_nest.c
> +++ b/CodeSamples/defer/rcu_nest.c
> @@ -37,7 +37,7 @@ void synchronize_rcu(void)				//\lnlbl{syn:b}
>  	/* Advance to a new grace-period number, enforce ordering. */
>  
>  	WRITE_ONCE(rcu_gp_ctr, rcu_gp_ctr +		//\lnlbl{syn:incgp1}
> -			RCU_GP_CTR_BOTTOM_BIT);		//\lnlbl{syn:incgp2}
> +	           RCU_GP_CTR_BOTTOM_BIT);		//\lnlbl{syn:incgp2}
>  	smp_mb();					//\lnlbl{syn:mb2}
>  
>  	/*
> @@ -48,7 +48,7 @@ void synchronize_rcu(void)				//\lnlbl{syn:b}
>  	for_each_thread(t) {				//\lnlbl{syn:scan:b}
>  		while (rcu_gp_ongoing(t) &&		//\lnlbl{syn:ongoing}
>  		       ((READ_ONCE(per_thread(rcu_reader_gp, t)) -//\lnlbl{syn:lt1}
> -		          rcu_gp_ctr) < 0)) {		//\lnlbl{syn:lt2}
> +		         rcu_gp_ctr) < 0)) {		//\lnlbl{syn:lt2}
>  #ifndef FCV_SNIPPET
>  			/*@@@ poll(NULL, 0, 10); */
>  			barrier();
> diff --git a/CodeSamples/defer/rcu_rcpl.h b/CodeSamples/defer/rcu_rcpl.h
> index de08eee3..1d4dee8a 100644
> --- a/CodeSamples/defer/rcu_rcpl.h
> +++ b/CodeSamples/defer/rcu_rcpl.h
> @@ -65,7 +65,7 @@ static void rcu_read_unlock(void)
>  	smp_mb();
>  	n = __get_thread_var(rcu_nesting);
>  	if (n == 1) {
> -		 i = __get_thread_var(rcu_read_idx);
> +		i = __get_thread_var(rcu_read_idx);
>  		__get_thread_var(rcu_refcnt)[i]--;
>  	}
>  	__get_thread_var(rcu_nesting) = n - 1;
> diff --git a/CodeSamples/defer/rcu_rcpls.h b/CodeSamples/defer/rcu_rcpls.h
> index f0a84b55..1af5d13b 100644
> --- a/CodeSamples/defer/rcu_rcpls.h
> +++ b/CodeSamples/defer/rcu_rcpls.h
> @@ -66,7 +66,7 @@ static void rcu_read_unlock(void)
>  	smp_mb();
>  	n = __get_thread_var(rcu_nesting);
>  	if (n == 1) {
> -		 i = __get_thread_var(rcu_read_idx);
> +		i = __get_thread_var(rcu_read_idx);
>  		__get_thread_var(rcu_refcnt)[i]--;
>  	}
>  	__get_thread_var(rcu_nesting) = n - 1;
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index e901d33c..c686beb9 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1218,7 +1218,7 @@ P0(int* x0, int** x1) {
>  P1(int** x1) {
>  
>  	int *r2;
> -        int r3;
> +	int r3;
>  
>  	r2 = lockless_dereference(*x1); // Obsolete @lnlbl[deref]
>  	r3 = READ_ONCE(*r2);			    @lnlbl[read]
> @@ -2693,7 +2693,7 @@ void reader(void)		\lnlbl[read:b]
>  		return;			\lnlbl[read:nulret]
>  	r1 = p->b;			\lnlbl[read:pb]
>  	q = rcu_dereference(gp1);	\lnlbl[read:gp1]
> -        if (p == q) {			\lnlbl[read:equ]
> +	if (p == q) {			\lnlbl[read:equ]
>  		r2 = p->c;		\lnlbl[read:pc]
>  	}
>  	do_something_with(r1, r2);
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index 3bfb7139..aaecad4e 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -274,7 +274,7 @@ kref_sub(struct kref *kref, unsigned int count,
>  	WARN_ON(release == NULL);
>  
>  	if (atomic_sub_and_test((int) count,		\lnlbl[check]
> -                                &kref->refcount)) {
> +	                        &kref->refcount)) {
>  		release(kref);				\lnlbl[rel]
>  		return 1;				\lnlbl[ret:1]
>  	}
> -- 
> 2.17.1
> 
