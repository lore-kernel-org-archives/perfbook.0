Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFLERa (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 12 Jun 2023 00:17:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E81591
        for <perfbook@vger.kernel.org>; Sun, 11 Jun 2023 21:17:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D86160A66
        for <perfbook@vger.kernel.org>; Mon, 12 Jun 2023 04:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686543448;
        bh=kvFB2cSUmZ60M+PgQ6+qSTGe4yRueN+CFN4Yg+DATXk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=TchcPMGRZPXonjmPprmfxwTHfsGk0ppXyD1cfgfGrl5aKpv+HQ07B44C6GFmsPEk5
         jgRZQ/4g0dPWCK3l7iz93YGjdH9QHhI2DgjwNPFDY+IdIndA3q2x/AkWbzsRr89mtQ
         uFNdabDsqDdcNzgrWNU1+tSZkrRdRyEvyRIrKCO6P5WcsIBv3n253c/ehTsjz2YU2l
         CJauZREnONXCWOx+z+kOTmX7igQFmPjdvvkJNd0ogcy5Fjyncqkm7vaYOgjg7s7tWe
         BYX3HI/uCWlqAk8JHDteG2mfARAT2wDru9AnSgnANgi8KqZvM/YFEo0nKx4FT/Mjkt
         nhzGhok4kcnAA==
Date: Sun, 11 Jun 2023 21:17:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuapi: Embed Listing E.3 in Table E.3
Message-ID: <a51e58b9-3ae8-491e-8183-0b673deb51ee@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <d6f99279-a618-7733-7f41-684bc33d624a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6f99279-a618-7733-7f41-684bc33d624a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 12, 2023 at 08:21:15AM +0900, Akira Yokosawa wrote:
> In 2c layout, Table E.3 goes to the next page of Listing E.3.
> This is partly due to the table* environment, but as both of them
> are floating, there is no sure way for them to be on the same page.
> 
> Embed the listing at the bottom of the table so that they end up
> in the same page and adjust the wording in the text.
> 
> For 2c layout, using the table* environment causes the snippet to
> look unnecessarily wide. Instead, shrink the table by using the
> \tcresizewidth macro and use the normal table environment.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Link: https://www.spinics.net/lists/perfbook/msg04070.html
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> In 2c layout, the table might become too small.
> Does it look acceptable?

Definitely a great improvment, thank you!

Queued and pushed.

							Thanx, Paul

>         Thanks, Akira
> --
>  defer/rcuapi.tex | 58 ++++++++++++++++++++++--------------------------
>  1 file changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index eea7259776d1..34791918588d 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -337,40 +337,15 @@ The \apik{rcu_barrier()} primitive does this job.
>  	critical sections to complete, \co{rcu_barrier()} instead waits
>  	for callbacks from prior calls to \co{call_rcu()} to be invoked.
>  
> -\begin{listing}
> -\begin{fcvlabel}[ln:defer:synchonize-rcu vs rcu-barrier]
> -\begin{VerbatimL}[commandchars=\\\@\$]
> -	do_something_1();			\lnlbl@ds1$
> -	rcu_read_lock();			\lnlbl@rrl$
> -	do_something_2();			\lnlbl@ds2$
> -	call_rcu(&p->rh, f);			\lnlbl@cr$
> -	do_something_3();			\lnlbl@ds3$
> -	rcu_read_unlock();			\lnlbl@rrul$
> -	do_something_4();			\lnlbl@ds4$
> -	// f(&p->rh) invoked			\lnlbl@cb$
> -	do_something_5();			\lnlbl@ds5$
> -\end{VerbatimL}
> -\end{fcvlabel}
> -\caption{\tco{synchronize_rcu()} vs. \tco{rcu_barrier()}}
> -\label{lst:defer:synchronize-rcu vs. rcu-barrier}
> -\end{listing}
> -
> -	This distinction is illustrated by
> -	\cref{lst:defer:synchronize-rcu vs. rcu-barrier}, which
> -	shows code being executed by a given CPU\@.
> -	For simplicity, assume that no other CPU is executing
> -	\co{rcu_read_lock()}, \co{rcu_read_unlock()}, or
> -	\co{call_rcu()}.
> -
> -
> -\begin{table*}
> +\begin{table}
>  \renewcommand*{\arraystretch}{1.2}
>  \centering
>  \small
> +\tcresizewidth{
>  \begin{fcvref}[ln:defer:synchonize-rcu vs rcu-barrier]
>  \begin{tabular}{lll}
>  \toprule
> -            & \multicolumn{2}{c}{Must Wait Until (in \cref{lst:defer:synchronize-rcu vs. rcu-barrier}):} \\
> +            & \multicolumn{2}{c}{Must Wait Until (in the snippet):} \\
>  \cmidrule{2-3}
>  \multicolumn{1}{c}{Invoked at:} & \multicolumn{1}{c}{\tco{synchronize_rcu()}}
>  					& \multicolumn{1}{c}{\tco{rcu_barrier()}} \\
> @@ -384,12 +359,33 @@ The \apik{rcu_barrier()} primitive does this job.
>  \bottomrule
>  \end{tabular}
>  \end{fcvref}
> +}
> +
> +\begin{fcvlabel}[ln:defer:synchonize-rcu vs rcu-barrier]
> +\begin{VerbatimN}[commandchars=\\\@\$]
> +	do_something_1();			\lnlbl@ds1$
> +	rcu_read_lock();			\lnlbl@rrl$
> +	do_something_2();			\lnlbl@ds2$
> +	call_rcu(&p->rh, f);			\lnlbl@cr$
> +	do_something_3();			\lnlbl@ds3$
> +	rcu_read_unlock();			\lnlbl@rrul$
> +	do_something_4();			\lnlbl@ds4$
> +	// f(&p->rh) invoked			\lnlbl@cb$
> +	do_something_5();			\lnlbl@ds5$
> +\end{VerbatimN}
> +\end{fcvlabel}
>  \caption{\tco{synchronize_rcu()} vs. \tco{rcu_barrier()}}
>  \label{tab:defer:synchonize-rcu vs rcu-barrier}
> -\end{table*}
> +\end{table}
> +
> +	This distinction is illustrated by
> +	\cref{tab:defer:synchonize-rcu vs rcu-barrier}, in which
> +	the snippet at the bottom shows code being executed by a given CPU\@.
> +	For simplicity, assume that no other CPU is executing
> +	\co{rcu_read_lock()}, \co{rcu_read_unlock()}, or
> +	\co{call_rcu()}.
>  
> -	\Cref{tab:defer:synchonize-rcu vs rcu-barrier}
> -	shows how long each primitive must wait if invoked
> +	The table shows how long each primitive must wait if invoked
>  	concurrently with each of the \co{do_something_*()}
>  	functions, with empty cells indicating that no
>  	waiting is necessary.
> -- 
> 2.25.1
> 
> 
