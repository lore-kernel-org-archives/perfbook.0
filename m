Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232804AbhFQPMq (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 17 Jun 2021 11:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623942638;
        bh=nuWSOsCFtCze31gj5MtZA/wojEmXHdeiCJVPuUHjaoA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CnxB57S6iXifo+tpqjOnRoN7U2WDWjYbnwKC/I3vNWlm6kY3DUiMzUqfLVGcL/kl8
         AJSJ+PgtkSSSOdHIxZPIGVZGQKq9oepfh/2MZeGcVHYVeKqJ5YbVfgFYU8Ms/Ald4n
         cArdYq1GjgDqM5pUhDjREsNQQEB/QS1ObH/js4/Bs/e/l4OcZddpjgm9KenL0Ldkj0
         7T5EjkTmxXEircIDI02jwLvb2z45NRUia/1uhZmu/ZwdFAHCbRcoLiQJEw4xMkSKOh
         8+SgUM2xsQFsJG1sWyI6O2qwGLuT4mufo0RePWD4xvCiB1rdN5aMPvQZW6E6vZaedl
         FBANglvEJP6ig==
Date: Thu, 17 Jun 2021 08:10:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC PATCH -perfbook] intro, cpu: Use inline enumerate list
Message-ID: <20210617151038.GY4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <8b362a1e-71f6-2528-d990-e4283a36fda0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b362a1e-71f6-2528-d990-e4283a36fda0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 17, 2021 at 08:22:27PM +0900, Akira Yokosawa wrote:
> The "enumitem" package provides inline list option.
> Inline enumerate list can be applied to the pattern of:
> 
>     ... two basic reasons:
>     (1)~The finite speed of light and
>     (2)~The atomic nature of matter ...
> 
> as follows:
> 
>     ... two basic reasons:
>     \begin{enumerate*}[(1)]
>     \item The finite speed of light and
>     \item The atomic nature of matter ...
>     \end{enumerate*}
> 
> Violation to this pattern can be caught by a perl regex for:
> 
>     o A lower-case word appears behind "\item".
> 
> The check script will be updated in a later patch.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

This looks good, thank you!  I have pulled it in.

							Thanx, Paul

> ---
> Hi Paul,
> 
> I said earlier:
> 
> >>>  Stephen Hawking is said to have claimed that semiconductor manufacturers
> >>> -have but two fundamental problems: (1) the finite speed of light and
> >>> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
> >>> +have but two fundamental problems:
> >>> +(1)~The finite speed of light and
> >>> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.
> >> 
> >> I should have capitalized the "the" in this last line.  I did so before
> >> applying your patch.
> >
> > Well, I'm afraid this pattern is well beyond the capability of the dumb
> > perl script.  (Hint: It only looks at the next input line of colon.)
> 
> , but it turned out that it is possible to detect if we use the inline
> enumerate list instead.
> 
> Does this change look reasonable to you? 
> It won't affect the look of the resulting PDF.
> 
>         Thanks, Akira
> --
>  cpu/hwfreelunch.tex | 6 ++++--
>  intro/intro.tex     | 8 +++++---
>  perfbook-lt.tex     | 4 +++-
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
> index 59079a9d..b0d91758 100644
> --- a/cpu/hwfreelunch.tex
> +++ b/cpu/hwfreelunch.tex
> @@ -168,8 +168,10 @@ That said, they may be necessary steps on the path to the late Jim Gray's
>  
>  Stephen Hawking is said to have claimed that semiconductor manufacturers
>  have but two fundamental problems:
> -(1)~The finite speed of light and
> -(2)~The atomic nature of matter~\cite{BryanGardiner2007}.
> +\begin{enumerate*}[(1)]
> +\item The finite speed of light and
> +\item The atomic nature of matter~\cite{BryanGardiner2007}.
> +\end{enumerate*}
>  It is possible that semiconductor manufacturers are approaching these
>  limits, but there are nevertheless a few avenues of research and
>  development focused on working around these fundamental limits.
> diff --git a/intro/intro.tex b/intro/intro.tex
> index 28c0bf50..93d78dd9 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -24,11 +24,13 @@ invariably become easier over time.
>  For example, the once-rare ability to drive a car is now
>  commonplace in many countries.
>  This dramatic change came about for two basic reasons:
> -(1)~Cars became cheaper and more readily available, so that
> -more people had the opportunity to learn to drive,
> -and (2)~Cars became easier to operate due to automatic transmissions,
> +\begin{enumerate*}[(1)]
> +\item Cars became cheaper and more readily available, so that
> +more people had the opportunity to learn to drive, and
> +\item Cars became easier to operate due to automatic transmissions,
>  automatic chokes, automatic starters, greatly improved reliability,
>  and a host of other technological improvements.
> +\end{enumerate*}
>  
>  The same is true for many other technologies, including computers.
>  It is no longer necessary to operate a keypunch in order to program.
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 9e30a1a4..62959e04 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -39,7 +39,7 @@
>  \usepackage{graphicx}
>  \usepackage{rotating}
>  \usepackage{setspace}
> -\usepackage[shortlabels]{enumitem}
> +\usepackage[shortlabels,inline]{enumitem}
>  \setlist[description]{style=unboxed}
>  \newlist{sequence}{enumerate}{10}
>  \setlist[sequence]{label*=\arabic*}
> @@ -308,6 +308,8 @@
>  \crefname{sublisting}{Listing}{Listings}
>  \crefname{sequencei}{step}{steps}
>  \Crefname{sequencei}{Step}{Steps}
> +\crefname{enumi}{item}{items}
> +\Crefname{enumi}{Item}{Items}
>  \crefname{page}{page}{pages}
>  \Crefname{page}{Page}{Pages}
>  \Crefformat{equation}{Equation~#2#1#3}
> -- 
> 2.17.1
> 
