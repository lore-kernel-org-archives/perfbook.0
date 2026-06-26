Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DE3A8722
	for <perfbook@vger.kernel.org>; Fri, 26 Jun 2026 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496744; cv=none; b=ZSq0CvTXNDgnB2vWaILum44Q3BVBSURcSzDJT41CYxqIRymLTHoT6GVHWm9WvIXuu8WoVTAf4BlrYgafnIUb+FLleINxWkOQl6oGPPXH2zuBea7h3wULE5+nqtSddnuLC4fJJ5+o6e+mzgS1WqI+1yByPDRnbLAV2m7ZwlLORbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496744; c=relaxed/simple;
	bh=RorxExJoAO7nVgaITRIKvZTG/dPTFIyBejAR4PCJfRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9+djot/VXuU4ym2TOkQsridAN1Ma1lECkUSviB3gUfKqU28SYZ+jzOn+7I7sKRn96+auE10LoPVYjsM5ekm88b3wcuCLzNla4oGQ1wgmNc8cg1G7FMRQ9LF6DsHdA7olwIFfk0B5amOZGkM36L5IF+daQ2qNi4VA9kHCJmoDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hU/RSRfR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hU/RSRfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37251F000E9;
	Fri, 26 Jun 2026 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782496743;
	bh=bIMIyLgV17hOV/YIt4aO2BcPn5ECDh4tpkvkjSdOLKE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=hU/RSRfRjtIvYN8LeE/ROYd5TsKmufjsld/NgANDJgWnfjHZsNVQcP8/cIFf4KZpl
	 yVvHVKge0z6qagN+OKtMFbfNTqqthJk7iH02+/OyXECqb59hiOIXbDW6+4KgPwW2bG
	 qO6I61l48dOWMeHzV3VXcbPd4j39IDwUJiR490TBXFb/smCJ25qnXTg2Lk0irEFDvU
	 SVGm9fhqCyaG8/efl0k5nTFA1rLX4uVSE71J8fm4gu4zypH2QzdFMVcl1zjvcwQmx0
	 KRJzb0cJornYDn4dzwkPof0CKMJza2ozhQDo6ejY+Nu1afmfzSKBQkTsUD7xgM0Dy2
	 gY5Sef7d3+wqg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8EE18CE0A6F; Fri, 26 Jun 2026 10:59:03 -0700 (PDT)
Date: Fri, 26 Jun 2026 10:59:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] Define macros for multi-part listings in
 preamble
Message-ID: <1751fd6b-2c9c-43d3-a4eb-f12513f69cbc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>

On Fri, Jun 26, 2026 at 08:34:47PM +0900, Akira Yokosawa wrote:
> Paul said he has a plan to add listings similar to Listings 9.13
> and 9.14 [1].
> 
> Move local definitions in rcuintro.tex for such multi-part listings
> into preamble so that they can be used elsewhere.  Note that
> "VerbatimT" and "adjustwidth" envs have vertical spacing tweaks
> applied.

Queued, thank you very much!!!

I queued the following commit on top of these two in order to create
the first Tools of the Trade triple listing.  Does this make sense,
or is there a better way?

							Thanx, Paul

------------------------------------------------------------------------

commit 72f863e04bf56ec4e95e90a789570a2434caf61e
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Fri Jun 26 10:44:49 2026 -0700

    Add definitions of \adjvspace{above,below,bottom}
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index f6d6efc2..3c1e15f1 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -407,6 +407,9 @@
 \newcommand{\myfvline}{\arabic{FancyVerbLine}} % redefine on-the-fly
 \AtBeginEnvironment{VerbatimT}{%
   \renewcommand{\theFancyVerbLine}{\rmfamily\tiny \myfvline}}
+\newcommand{\adjvspaceabove}{\vspace*{2pt}}
+\newcommand{\adjvspacebelow}{\vspace*{-1pt}}
+\newcommand{\adjvspacebottom}{\vspace*{-2pt}}
 
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
