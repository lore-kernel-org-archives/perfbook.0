Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjFKQa6 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Jun 2023 12:30:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30140E6D
        for <perfbook@vger.kernel.org>; Sun, 11 Jun 2023 09:30:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B98BA614BD
        for <perfbook@vger.kernel.org>; Sun, 11 Jun 2023 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686501052;
        bh=Jqqnv9o6CD8QlCa4TTLnAGMvCl3hJU9rNDqwpoB+s4U=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DtlCmCjrqxHCAgDoDO1axzXBIbOSU7pePMLU/dPEz8BorlXbZMzJFRTyc1latvApI
         3JDPr1BUeQKmddoumNBFGFcK5EIYZ5f/hr5dWNBy3+F7FIQg7rIvfSkkOZOq44gP5M
         lZzNKWr8IhyJmNTtsI7fYYw5x0p5akdmdo0Z9VxbV+iDVPkphyiZUCHgPNSymnFzxy
         EU7vS63MmbHxRfwkpzvxjonQvWm7dJ03y4OewgdCs6xGo2ch6pA8vgPnNN9usQ+UmL
         hQvMlsxJYeAzRA6iQqz2NjLVoazfUQUTqjkVXl+DOP9uM+HVn5bhrXZNUSQVGs4eJQ
         H/K/ae1zw5NfA==
Date: Sun, 11 Jun 2023 09:30:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer/rcuapi: Tweak Table E.3
Message-ID: <978b6957-318a-40bf-8135-9322bd5a1c6c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <40ba8e60-0d3c-163d-e82c-801700aca13a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40ba8e60-0d3c-163d-e82c-801700aca13a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Mon, Jun 12, 2023 at 12:21:26AM +0900, Akira Yokosawa wrote:
> Table E.3 is not intuitive enough to be understood on its own.
> Make it self explanatory by adding references to Listing E.3 and
> line counts.
> 
> Reorder header rows and use \cmidrule for better representation
> of table structure as well.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

Heh!!!

Part of the problem is that we have a Listing E.3 and a Table E.3 on
the next page.  Maybe we need to find an excuse to add either another
figure or another table somewhere earlier in Section E.3.  Or somehow
force the listing and table to be on the same page.  Or change the first
sentence of the third paragraph of the QQ answer to start "Table E.3
(not to be confused with Listing E.3) shows how long...".  Or something
else, given that all of these have ugly side-effects.  Thoughts?

But in the meantime, I am doing a release.  The previous release is old
enough to be causing confusion.  I really need to just schedule these and
be done with my current bad habit of "I will release as soon as I finish
X."  With X then taking weeks or months longer than I expected.  :-/

							Thanx, Paul

> ---
> Hi Paul,
> 
> I'm not sure if this is actually an improvement, but looking at
> the line labels you put in the code snippet, I'm guessing this might
> be along the line of what you had in mind.
> 
> What do you think?
> 
>         Thanks, Akira
> --
>  defer/rcuapi.tex | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index 3f5877f3264f..eea7259776d1 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -367,18 +367,23 @@ The \apik{rcu_barrier()} primitive does this job.
>  \renewcommand*{\arraystretch}{1.2}
>  \centering
>  \small
> +\begin{fcvref}[ln:defer:synchonize-rcu vs rcu-barrier]
>  \begin{tabular}{lll}
>  \toprule
> -            & \tco{synchronize_rcu()} & \tco{rcu_barrier()} \\
> -Invoked at: & \multicolumn{2}{c}{Must Wait Until:} \\
> -\midrule
> +            & \multicolumn{2}{c}{Must Wait Until (in \cref{lst:defer:synchronize-rcu vs. rcu-barrier}):} \\
> +\cmidrule{2-3}
> +\multicolumn{1}{c}{Invoked at:} & \multicolumn{1}{c}{\tco{synchronize_rcu()}}
> +					& \multicolumn{1}{c}{\tco{rcu_barrier()}} \\
> +\cmidrule(r){1-1} \cmidrule{2-3}
>  \tco{do_something_1()} & 			 & \\
> -\tco{do_something_2()} & \tco{rcu_read_unlock()} & \\
> -\tco{do_something_3()} & \tco{rcu_read_unlock()} & \tco{f(&p->rh)} \\
> -\tco{do_something_4()} &			 & \tco{f(&p->rh)} \\
> +\tco{do_something_2()} & \tco{rcu_read_unlock()} (\clnref{rrul}) & \\
> +\tco{do_something_3()} & \tco{rcu_read_unlock()} (\clnref{rrul})
> +						 & \tco{f(&p->rh)} (\clnref{cb}) \\
> +\tco{do_something_4()} &			 & \tco{f(&p->rh)} (\clnref{cb}) \\
>  \tco{do_something_5()} & 			 & \\
>  \bottomrule
>  \end{tabular}
> +\end{fcvref}
>  \caption{\tco{synchronize_rcu()} vs. \tco{rcu_barrier()}}
>  \label{tab:defer:synchonize-rcu vs rcu-barrier}
>  \end{table*}
> -- 
> 2.25.1
> 
