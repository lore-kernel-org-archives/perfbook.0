Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:34388 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351227AbhLFPOH (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 6 Dec 2021 10:14:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89C396131B
        for <perfbook@vger.kernel.org>; Mon,  6 Dec 2021 15:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638803438;
        bh=Sey4EUQ0f6uPWk1XA4j9fPwDK+CJ0vNDR48UeXgPlss=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gAq0PAnGGnF7T18K+n76YMe3BiT+LQvXuwCnynJhexgdXzzBAVaGRLeOcwiPwZT0+
         sln41up6wQwfqhHy8fVf87xt6dTBQDXeEGfRGQawqfKzGEzegUaMXcj2EYl06de/Pc
         q7b4jZEtNPTexUCz+BoFXuMzMP9FG36fke0+4cYoe6Bd0jaM7gUv9IeLiQRX7Ptzbd
         I3TczbKzLZgHgpX25BzRKS7Vvam5rfenoqLyhsli59HUHZU6EYg+k/dznsPMAiHfT5
         dqQNoZ0u7B3+2ddoRlk8kA+IbcHLqe3rWNOd2Vq9mA1U+MFRGJ4dVGXzuDvr9gmrbB
         78lYslws0NkyQ==
Date: Mon, 6 Dec 2021 07:10:37 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2] defer/rcuusage: Move float objects away of section
 titles
Message-ID: <20211206151037.GZ641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <739396e3-6ade-95cf-07dc-098cd8066bde@gmail.com>
 <cc2aa713-25e1-8daf-a381-609b7d217bfb@gmail.com>
 <2cfde3b7-6135-744f-6e33-aed442d864df@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cfde3b7-6135-744f-6e33-aed442d864df@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 06, 2021 at 12:57:06PM +0900, Akira Yokosawa wrote:
> On Mon, 6 Dec 2021 12:03:00 +0900, Akira Yokosawa wrote:
> > Float objects are treated as page/column break candidates.
> > They can cause widowed section titles.

I queued and pushed both, thank you!

> Paul,
> 
> I see there remain quite a lot of similar patterns in LaTeX code
> of perfbook.
> 
> So I'm thinking of adding patterns in cleverefcheck.pl to find
> float objects next to headings (\section, \subsection, etc.).
> 
> Does this sound reasonable to you?

That sounds most excellent!  Especially given that I apparently am having
some trouble keeping all of the usage rules in my head.  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Move a pair of such objects in recently added contents.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  defer/rcuusage.tex | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> > 
> > diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> > index 01342fda..9f2a428e 100644
> > --- a/defer/rcuusage.tex
> > +++ b/defer/rcuusage.tex
> > @@ -6,6 +6,14 @@
> >  \label{sec:defer:RCU Usage}
> >  \OriginallyPublished{Section}{sec:defer:RCU Usage}{RCU Usage}{Linux Weekly News}{PaulEMcKenney2008WhatIsRCUUsage}
> >  
> > +This section answers the question ``What is RCU?'' from the viewpoint
> > +of the uses to which RCU can be put.
> > +Because RCU is most frequently used to replace some existing mechanism,
> > +we look at it primarily in terms of its relationship to such mechanisms,
> > +as listed in \cref{tab:defer:RCU Usage}.
> > +Following the sections listed in this table,
> > +\cref{sec:defer:RCU Usage Summary} provides a summary.
> > +
> >  \begin{table}
> >  \renewcommand*{\arraystretch}{1.2}
> >  \centering
> > @@ -40,14 +48,6 @@ Quasi multi-version concurrency control (MVCC) &
> >  \label{tab:defer:RCU Usage}
> >  \end{table}
> >  
> > -This section answers the question ``What is RCU?'' from the viewpoint
> > -of the uses to which RCU can be put.
> > -Because RCU is most frequently used to replace some existing mechanism,
> > -we look at it primarily in terms of its relationship to such mechanisms,
> > -as listed in \cref{tab:defer:RCU Usage}.
> > -Following the sections listed in this table,
> > -\cref{sec:defer:RCU Usage Summary} provides a summary.
> > -
> >  \subsubsection{RCU for Pre-BSD Routing}
> >  \label{sec:defer:RCU for Pre-BSD Routing}
> >  
> > @@ -414,13 +414,6 @@ was shown in the previous sections.
> >  \subsubsection{Phased State Change}
> >  \label{sec:defer:Phased State Change}
> >  
> > -\begin{figure}
> > -\centering
> > -\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
> > -\caption{Phased State Change for Maintenance Operation}
> > -\label{fig:defer:Phased State Change for Maintenance Operation}
> > -\end{figure}
> > -
> >  \Cref{fig:defer:Phased State Change for Maintenance Operation}
> >  shows a timeline for an example phased state change to efficiently
> >  handle maintenance operations.
> > @@ -431,6 +424,13 @@ operations must be undertaken carefully, taking into account added
> >  complexities due to their running concurrently with that maintenance
> >  operation.
> >  
> > +\begin{figure}
> > +\centering
> > +\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
> > +\caption{Phased State Change for Maintenance Operation}
> > +\label{fig:defer:Phased State Change for Maintenance Operation}
> > +\end{figure}
> > +
> >  In the figure, these apparently conflicting requirements are resolved by
> >  having a prepare phase prior to the maintenance operation and a cleanup
> >  phase after it, during which the common-case operations can proceed
> > 
