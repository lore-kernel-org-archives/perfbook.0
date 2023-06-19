Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjFST5X (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 19 Jun 2023 15:57:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F123106
        for <perfbook@vger.kernel.org>; Mon, 19 Jun 2023 12:57:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CCFE60E16
        for <perfbook@vger.kernel.org>; Mon, 19 Jun 2023 19:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687204641;
        bh=oAJVohW3J+P1Rqkd9O4oDk8NBibJFvlox7lpTr81dR0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oxGhlEsIudENmwMn+y+EnzFZ5ts4obAbrgZRsygnrH+Sfq4Q2YDvoKG2qGXAIHF5c
         wtD2BlNAWGF7eGuyaVPI8Rfhn0tZAY5HVz6lBMj/h6vzYTifqL+I2bkrlDBjirnqAl
         I60o1+yY8QDRqV6lqWOfGwJa5EOq/DVxmt6JKZJ4pmpiSick+Bh7mvyIV4inTWJZBv
         yWkD8JRGsF/gPy/BOxC/nlc2Fp0MNbaMl7Y0ajTwEPywYvRxRppAPkLS6FG5Ah2kF8
         6DZBdI52V9IECVBN6vCEspXPYQX+YAxS6kSHtBj7XUamAeHxgF/t/YvO+EIb8SEc3o
         nOS4Fj8rt0h7Q==
Date: Mon, 19 Jun 2023 12:57:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] appendix/questions: Address potential orphaned
 epigraph
Message-ID: <d131b39d-8372-4ab8-9d64-6400b736d2a1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <d52b2618-3c84-63f1-cf39-ccec9d789a0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d52b2618-3c84-63f1-cf39-ccec9d789a0e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 19, 2023 at 11:58:41PM +0900, Akira Yokosawa wrote:
> Commit 3566689d0c01 ("questions: Add section-level epigraphs")
> added an epigraph just above a figure environment.
> This makes cleverefcheck.pl complain:
> 
>     ./appendix/questions/time.tex:11:\begin{figure}
>     ^^^ environment next to epigraph ^^^
> 
> Move the figure environment bottom of the first paragraph in the
> section and prevent the epigraph from (potentially) ending up in
> the bottom of a column/page.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> You might have wondered what cleverefcheck.pl complained about.
> At the moment, there is no epigraph actually orphaned, but
> let's just silence the complaint.

Now I know.  ;-)

Queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
>  appendix/questions/time.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/appendix/questions/time.tex b/appendix/questions/time.tex
> index a4ce11ed5bb0..49961966525a 100644
> --- a/appendix/questions/time.tex
> +++ b/appendix/questions/time.tex
> @@ -8,13 +8,6 @@
>  \epigraph{Time is a game played beautifully by children.}
>  	 {Heraclitus}
>  
> -\begin{figure}
> -\centering
> -\resizebox{2.6in}{!}{\includegraphics{cartoons/r-2014-What-time-is-it}}
> -\caption{What Time Is It?}
> -\ContributedBy{Figure}{fig:app:questions:What Time Is It?}{Melissa Broussard}
> -\end{figure}
> -
>  A key issue with timekeeping on multicore computer systems is illustrated
>  by \cref{fig:app:questions:What Time Is It?}.
>  One problem is that it takes time to read out the time.
> @@ -27,6 +20,13 @@ protocol (NTP) adjustments, and so on.
>  So does the time eventually returned correspond to the beginning of
>  the resulting time interval, the end, or somewhere in between?
>  
> +\begin{figure}
> +\centering
> +\resizebox{2.6in}{!}{\includegraphics{cartoons/r-2014-What-time-is-it}}
> +\caption{What Time Is It?}
> +\ContributedBy{Figure}{fig:app:questions:What Time Is It?}{Melissa Broussard}
> +\end{figure}
> +
>  Worse yet, the thread reading the time might be interrupted or preempted.
>  Furthermore, there will likely be some computation between reading out
>  the time and the actual use of the time that has been read out.
> 
> base-commit: 3566689d0c01e93c1c0552ddff95b6d4b04ca2ed
> -- 
> 2.25.1
> 
