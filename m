Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B590227EA4
	for <perfbook@vger.kernel.org>; Sat, 27 Jun 2026 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782581197; cv=none; b=E6YbF/+ozRM6El/wNlOoL7raQpev3oZ6usWJ4RRtU7ZTAPlpKqM3xxo/ar2J/yz1mhuc9P542Rb/EjJ3y/RyLN7VLERl17zTNb7df2yXvcQyhi2mLjcaARSiFTYnLsAZcd3GWZuW7yZH2nwrTfzHpDnS8jvRcfRbFSTZdZUc+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782581197; c=relaxed/simple;
	bh=mIhguoWwo7aTmAna7Ouy6FxYLjMVdgO8sWsiEvNEJhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocMcOlETdcHAYZv0amjZTFCDD56fcE+5cq1m/l5CxE5HeCAfChW9OyXNMG7k82MXJCWZbBUIF1a/iAGecFNO6ZaWl4XLFkP5XLBxlDFnEaVCJEulUuOF909Myber1S7xt6V6j0VjhNGgaHHd1RoUz4b2od8hplxpn+UR0kYuESs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWTwBfU5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWTwBfU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00CD1F000E9;
	Sat, 27 Jun 2026 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782581195;
	bh=I5Ie2n7ICPrWK5UrAk8t4FBwmIXGwCcP6QVMU6wYn8o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=ZWTwBfU5wZMuyiExxw6O/Y9OBKz3EM3Ddp0CH2mmDe9LWpVgXzLrT9K2ynWKd5wDu
	 Il7avaLF1Dn15a5cDYUHXTXWSnCDO4rPMbfDU8FkwWPWWAehFuepC0BzmQEkfz11iZ
	 XplOJiYlxpHmCTZI8ULztxvZKynBLiY0jlYbvzik8KVH0CmHcPN5FE4qyW14cuId/r
	 rKJX1tMm/lw5fRjHLXJ1RzI7knBsShmfQijO2do6KlqC6sQdnVEcxfQ6Yslr+kJFPp
	 d+gAEqgAsSX1aGmUggnFw40HuHSBi4ZZrRkanK1E+VWb5qaWOAzRzzwUkMTOm5wCIv
	 oph64IV9cbv3A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5D48CE09ED; Sat, 27 Jun 2026 10:26:35 -0700 (PDT)
Date: Sat, 27 Jun 2026 10:26:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] Define macros for multi-part listings in
 preamble
Message-ID: <0c861958-99e8-4358-b74f-eb25590594f5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>
 <1751fd6b-2c9c-43d3-a4eb-f12513f69cbc@paulmck-laptop>
 <ae86dd51-8b93-43c3-a5d6-edc9fc4ce6f6@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae86dd51-8b93-43c3-a5d6-edc9fc4ce6f6@gmail.com>

On Sat, Jun 27, 2026 at 02:26:14PM +0900, Akira Yokosawa wrote:
> On Fri, 26 Jun 2026 10:59:03 -0700, Paul E. McKenney wrote:
> > On Fri, Jun 26, 2026 at 08:34:47PM +0900, Akira Yokosawa wrote:
> >> Paul said he has a plan to add listings similar to Listings 9.13
> >> and 9.14 [1].
> >>
> >> Move local definitions in rcuintro.tex for such multi-part listings
> >> into preamble so that they can be used elsewhere.  Note that
> >> "VerbatimT" and "adjustwidth" envs have vertical spacing tweaks
> >> applied.
> > 
> > Queued, thank you very much!!!
> > 
> > I queued the following commit on top of these two in order to create
> > the first Tools of the Trade triple listing.  Does this make sense,
> > or is there a better way?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 72f863e04bf56ec4e95e90a789570a2434caf61e
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Fri Jun 26 10:44:49 2026 -0700
> > 
> >     Add definitions of \adjvspace{above,below,bottom}
> 
> I removed those definitions in Patch 1/2 because (new) VerbatimT and
> adjustwidth envs now have those extra vertical spaces on their own.
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 0dc05325..cb8299a5 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -397,6 +397,12 @@
>  {numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
>  \DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
>  {numbers=none,xleftmargin=5pt,xrightmargin=5pt,samepage=true,frame=single}
> +% for multi-part listings with explanation
> +\DefineVerbatimEnvironment{VerbatimT}{Verbatim}%
> +{numbers=left,numbersep=5pt,frame=single,xrightmargin=5pt}
> +\BeforeBeginEnvironment{VerbatimT}{\vspace*{2pt}}
> +\AfterEndEnvironment{VerbatimT}{\vspace*{-1pt}}
> +\AfterEndEnvironment{adjustwidth}{\vspace*{-2pt}}
>  
>  \IfLmttForCode{
>  \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
> 
> >     
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> > index f6d6efc2..3c1e15f1 100644
> > --- a/perfbook-lt.tex
> > +++ b/perfbook-lt.tex
> > @@ -407,6 +407,9 @@
> >  \newcommand{\myfvline}{\arabic{FancyVerbLine}} % redefine on-the-fly
> >  \AtBeginEnvironment{VerbatimT}{%
> >    \renewcommand{\theFancyVerbLine}{\rmfamily\tiny \myfvline}}
> > +\newcommand{\adjvspaceabove}{\vspace*{2pt}}
> > +\newcommand{\adjvspacebelow}{\vspace*{-1pt}}
> > +\newcommand{\adjvspacebottom}{\vspace*{-2pt}}
> >  
> >  \IfLmttForCode{
> >  \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
> 
> I think the easiest way forward for both of us is to keep your
> change without applying my changes.  I'll rebase my changes after
> seeing your new multi-part listing(s) and submit v2.

OK, so I need to revert my addition of \adjvspace{above,below,bottom},
remove them from my toolsoftrade table, change the Verbatim instances
to VerbatimT, then all should be well.  (Hey, I can dream, can't I?)

Let me try that, then please do adjust on top if needed.

							Thanx, Paul
