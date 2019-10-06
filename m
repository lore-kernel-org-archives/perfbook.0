Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729808AbfJFRdn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 6 Oct 2019 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570383222;
        bh=NoxaTlVdM2VaxjWgGka4Elig1KFwbTcC4p7xnFKK3ok=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=1lNvPbOaTt2L0maeONqBCX4exFd9ZYGKRR/vSrJpZJBjoEQdDIhZ5XvQckRHvlGe8
         FesAzJGJisGL4hYdd7jOHG+pj+0350O7hz04jYaXpsM1wPTc4yVJDfsD8enXOXJEvT
         pk4A0MNYpx5XRQKrDebXMu+8MoCVPrs80ZwN9MGI=
Date: Sun, 6 Oct 2019 10:33:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 3/3] Define '\clnrefthro' for 'lines~m through~n'
Message-ID: <20191006173341.GR2689@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
 <708a3814-d2e2-bb46-9b42-8dfaa3cbe3f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <708a3814-d2e2-bb46-9b42-8dfaa3cbe3f9@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 07, 2019 at 12:33:32AM +0900, Akira Yokosawa wrote:
> >From 7a614253ca281565945b077b75a463d44b698968 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 7 Oct 2019 00:05:19 +0900
> Subject: [PATCH 3/3] Define '\clnrefthro' for 'lines~m through~n'
> 
> Use the macro in a matching pattern in dyntickrcu.tex
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> I failed to update the title of this patch before generating the
> cover letter. This patch has the amended title. Manual submission of
> patches by a mailer helped this time. ;-)
> 
> Please ignore the discrepancy of the titles.

Not a problem!

Queued and pushed, thank you very much!

							Thanx, Paul

>         Thanks, Akira
> --
>  formal/dyntickrcu.tex | 2 +-
>  perfbook.tex          | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index 7b7c3909..7f0c6ac2 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -293,7 +293,7 @@ void rcu_irq_exit(void)
>  \Clnref{chk_flg} checks to see if the \co{rcu_update_flag} is
>  non-zero, returning immediately (via falling off the end of the
>  function) if not.
> -Otherwise, lines~\lnref{dec_flg} through~\lnref{vrf_even:e} come into play.
> +Otherwise, \clnrefthro{dec_flg}{vrf_even:e} come into play.
>  \Clnref{dec_flg} decrements \co{rcu_update_flag}, returning
>  if the result is not zero.
>  \Clnref{verify} verifies that we are indeed leaving the outermost
> diff --git a/perfbook.tex b/perfbook.tex
> index 06019496..e40b1292 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -205,6 +205,8 @@
>  \newcommand{\Clnref}[1]{\clnrefp{#1}{Line}}
>  \newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}
>  \newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}--\lnref{#2}}
> +\newcommand{\clnrefthro}[2]{lines~\lnref{#1} through~\lnref{#2}}
> +\newcommand{\Clnrefthro}[2]{Lines~\lnref{#1} through~\lnref{#2}}
>  
>  \begin{document}
>  
> -- 
> 2.17.1
> 
