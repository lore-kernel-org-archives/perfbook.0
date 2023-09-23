Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjIWIXV (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 23 Sep 2023 04:23:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BD1198
        for <perfbook@vger.kernel.org>; Sat, 23 Sep 2023 01:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695457394;
        bh=S3H9TcXs7KrMDD31PmKo0ZAQWeP30UdM9UMWrsV0z68=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CDjTqJB+V2ZNfTj2ldq1KN+b0sccdE5KwBb+v9dxBqkp/y4g7ySRtehgTcvbqhVe5
         +oecDas8zXNMJyPTII3by0xrfnLmcAVWYdso04ggIFuTDp7W4jbQC479Mi/65jR0pq
         ypiN5kCgyemj5igxzC6N+2EtL1WBXiRUMLlcWio9uYWVtkTUjnCkhqQ7eA5iW1r+XS
         RhKTEig98maB2ygPGRFX2olqenprzc4kp0eFowC95mInTGtpjs97fHIGkecyEp2OuR
         Bn7XHkb2JnOVbR55iLlNaAcAdpIjergVwJsEWo79diQYIyBRabS7EzbqwZUjJa6H/b
         dJwGgbW9z+0mg==
Date: Sat, 23 Sep 2023 01:23:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/4] memorder: Add index markers for
 'address/control/data dependency', take 2
Message-ID: <5a2ed909-84c9-4f2d-b598-d0b7442d92f0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
 <a78a4604-cd3f-1adc-320d-2dbedf1f169b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78a4604-cd3f-1adc-320d-2dbedf1f169b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Sep 22, 2023 at 10:55:44PM +0900, Akira Yokosawa wrote:
> Add a few more index markers.
> 
> Note that the macro \IXpl{} and its friends don't work for the
> plural form of "dependencies".
> 
> \IXalth{}{}{} is used instead.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  memorder/memorder.tex | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 9610618b41f4..9af41194f1de 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3411,7 +3411,8 @@ In contrast, the penalty for failing to use them when needed can be quite high.
>  \label{sec:memorder:Address- and Data-Dependency Difficulties}
>  \OriginallyPublished{sec:memorder:Address- and Data-Dependency Difficulties}{Address- and Data-Dependency Difficulties}{the Linux kernel}{PaulEMcKenney2014rcu-dereference}
>  
> -The low overheads of the address and data dependencies discussed in
> +The low overheads of the \IXalth{address}{address}{dependency}

This looks strange given the different parameters to the \IXalth above
and the \IXalth below, but it gets the right thing to the right place
in the index, so I queued and pushed all four.

Thank you!!!  And yes, I am now generating a set of glossary entries.  ;-)

							Thanx, Paul

> +and \IXalth{data dependencies}{data}{dependency} discussed in
>  \cref{sec:memorder:Address Dependencies,%
>  sec:memorder:Data Dependencies},
>  respectively, makes their use extremely attractive.
> @@ -3770,7 +3771,7 @@ compiler-generated assembly code.
>  \subsection{Control-Dependency Calamities}
>  \label{sec:memorder:Control-Dependency Calamities}
>  
> -The control dependencies described in
> +The \IXalth{control dependencies}{control}{dependency} described in
>  \cref{sec:memorder:Control Dependencies}
>  are attractive due to their low overhead, but are also especially
>  tricky because current compilers do not understand them and can easily
> @@ -5403,7 +5404,8 @@ One could place an \co{smp_rmb()} primitive
>  between the pointer fetch and dereference in order to force Alpha
>  to order the pointer fetch with the later dependent load.
>  However, this imposes unneeded overhead on systems (such as \ARM,
> -Itanium, PPC, and SPARC) that respect address dependencies on the read side.
> +Itanium, PPC, and SPARC) that respect
> +\IXalth{address dependencies}{address}{dependency} on the read side.
>  A \co{smp_read_barrier_depends()} primitive was therefore added to the
>  Linux kernel to eliminate overhead on these systems, but was removed
>  in v5.9 of the Linux kernel in favor of augmenting Alpha's definition
> @@ -5550,7 +5552,8 @@ similar to that of \Power{}'s cumulativity, both of which are
>  stronger than \IXacr{lkmm}'s cumulativity described in
>  \cref{sec:memorder:Cumulativity}.
>  
> -\ARM\ also implements control dependencies, so that if a conditional
> +\ARM\ also implements \IXalth{control dependencies}{control}{dependency},
> +so that if a conditional
>  branch depends on a load, then any store executed after that conditional
>  branch will be ordered after the load.
>  However, loads following the conditional branch will \emph{not}
> -- 
> 2.25.1
> 
> 
