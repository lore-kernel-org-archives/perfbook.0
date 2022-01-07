Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:50934 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348010AbiAGPQf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 7 Jan 2022 10:16:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 748DBB82630
        for <perfbook@vger.kernel.org>; Fri,  7 Jan 2022 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641568593;
        bh=I3nuqh8A8iYnwZLODE8nL0QbcetPdVQ4oi0BmIcdBAE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QMivG484mE4oAVKEV4Kax7lB9NYM1y1rd04UOca6zQ/QCTCqoiO04u11B8L9n6KAz
         RtZN/sEwjMbK6gfJ/gMzbHPER7NLsoMNQTvKm5J/LgJmBKdHn/d8tlCpImfTdFDp3q
         0hrO0syvTtD2uVYx9pcXlwDgXUqfNCoVJcYFkQET9w6XHTNSPHZ1V5GhlUlAnW15mu
         Wi8ZFe0r3SMbCh85g/pBjjzeqQ8A9yqOFo273MVj/9U4ijgzK2tAhOsbeXhmiipMP+
         rk4KRPEsL79Mln4Gg2YxqX5DJylH8TsUdrRyJHItjF51yhiuw6MKQ2PTSVaXaNFrCD
         Tlh3My4ERcdKA==
Date: Fri, 7 Jan 2022 07:16:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuintro: Tweak appearance of new Table
 9.1
Message-ID: <20220107151632.GP4202@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <31e91d36-74df-da18-29fa-06ce20154e58@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31e91d36-74df-da18-29fa-06ce20154e58@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 07, 2022 at 11:36:42PM +0900, Akira Yokosawa wrote:
> Shrink the table width so that it can fit in 1c and eb builds.
> Overall appearance is based on Table D.8 in Style Guide.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

The addition of the grey highlighting is also nice, thank you!

Queued and pushed.

							Thanx, Paul

> ---
>  defer/rcuintro.tex | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index dbea667f..db87b9f6 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -235,22 +235,24 @@ to initialize the pointed-to structure.
>  }\QuickQuizEnd
>  
>  \begin{table*}
> -\renewcommand*{\arraystretch}{1.15}
> -\footnotesize
> +\renewcommand*{\arraystretch}{1.25}
> +\rowcolors{2}{}{lightgray}
> +\small
>  \centering
> -\begin{tabular}{lll}
> +\ebresizewidth{
> +\begin{tabular}{llp{2.4in}}
>  \toprule
>  &
>  	Primitive &
>  		Purpose \\
>  \midrule
> -\emph{Readers} &
> +\cellcolor{white}\emph{Readers} &
>  	\tco{rcu_read_lock()} &
>  		Start an RCU read-side critical section. \\
>  &
>  	\tco{rcu_read_unlock()} &
>  		End an RCU read-side critical section. \\
> -&
> +\cellcolor{white}&
>  	\tco{rcu_dereference()} &
>  		Safely load an RCU-protected pointer. \\
>  \midrule
> @@ -258,7 +260,7 @@ to initialize the pointed-to structure.
>  	\tco{synchronize_rcu()} &
>  		Wait for all pre-existing RCU read-side critical sections to
>  		complete. \\
> -&
> +\cellcolor{white}&
>  	\tco{call_rcu()} &
>  		Invoke the specified function after all pre-existing RCU read-side
>  		critical sections complete. \\
> @@ -267,6 +269,7 @@ to initialize the pointed-to structure.
>  		Safely update an RCU-protected pointer. \\
>  \bottomrule
>  \end{tabular}
> +}
>  \caption{RCU Core API}
>  \label{tab:defer:RCU Core API}
>  \end{table*}
> 
> base-commit: f21271f0939bb620a95b1bb3d76ac0259c4bb54c
> -- 
> 2.17.1
> 
