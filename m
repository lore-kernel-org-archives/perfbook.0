Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249C305670
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232428; cv=none; b=uGhwpIOw8/K34nIHa5nvAdKCdYidJYr1WlxfInn4ik5AdIl/8HMS30uFo9qxi74EZgZo9awKIJmcNjbO+VBg5/jxuhWOhahR1WiM6b0erX4xZa74jciGxwp9feX+9hmdyMV5HP48TGff3/foHKo2EvsrOIABo1ulRJrPe3Y2k+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232428; c=relaxed/simple;
	bh=4DpXToGI7nky9xTy1NzhA8WKH8CK8hF060X6phRcu1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwcA+OyRDqfDdAdkflbc84doIc7KnPbn7S/UETHQpMH9hFBJdiPjpigWZ9ko3VEb0Htf2ZieJS+6WfDwTm/1mxaipICPrY+z4kyXSJ9F64gHiPeaxNTg/S7GmDPWC5VmhNbLUEo11/8lJQJ7B1LcMkS+1iJ03wIQ9/yYAedA79Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcYkwEkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcYkwEkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57391F000E9;
	Tue, 23 Jun 2026 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782232426;
	bh=dI3CYb0UESuNnEg1aWt8hchCdKOlvhIIXG0vUaVYrRo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=HcYkwEkHGhYtQmf9c8so6NjXsGOg1v8P8PEB3HdEdeSVW3yw9m/K57T8TNL1kYkOJ
	 BbpBNGwzY12y+9RoK5SOLyirCHErkMthghVm9yPy59cDDh+/fTT0eIXafWQ5tIMDpN
	 dpPaGn/QZTUgcju0y4SbBK0Uk67j1sreyVYVSemmMtnDkm4OIKXUVQTwXM8H51MLTA
	 I2yH9Zt3Kv+kEL5HVnCN3UbPo+YUBuocYNeabBrVPDLy7Og0C4KQ9sODiiJnGIHSGk
	 0UqoyViOzh1yZ6+E86aVX7u2QDJAC9tPZ6BEDtx41hrSTTz8CKSDyYggHrIQc4tp67
	 HcPVEUU6nmMdA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B20F0CE04B1; Tue, 23 Jun 2026 09:33:46 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:33:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/6] 2nd batch for June 2026
Message-ID: <abeb5ab5-9c0f-4948-bfcb-392c7b77c6db@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5365c170-af04-466e-876b-7c220b327591@gmail.com>

On Tue, Jun 23, 2026 at 07:20:19PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I found recently added listings 9.13 and 9.14 can be made
> more consistent with other code snippets.
> 
> Patches 3/6 and 4/6 are my attempts for making them nicer.
> 
> Patch 6/6 is the usual update of rcu-test-ratio.
> 
> The other ones are minor fixes.

Queued and pushed, thank you!  I will use the new three-part table
format in similar changes planned for Section 4.3.4 ("Accessing Shared
Variables"), so I don't feel quite so bad about not having gotten to
that yet.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   runlatex.sh: Cope with missing cleveref.sty
>   Stop loading braket.sty
>   defer/rcuintro: Tweak Listings 9.13 and 9.14 by employing fancyvrb
>   defer/rcuintro: More tweaks for Listings 9.13 and 9.14
>   defer/rcufundamental: Fix typo ("cannot not return")
>   Update rcu-test-ratio for Linux v7.1
> 
>  CodeSamples/formal/data/rcu-test.dat |   1 +
>  defer/rcufundamental.tex             |   4 +-
>  defer/rcuintro.tex                   | 114 +++++++++++++++++----------
>  perfbook-lt.tex                      |   2 +-
>  utilities/runlatex.sh                |   7 +-
>  5 files changed, 82 insertions(+), 46 deletions(-)
> 
> 
> base-commit: d7c24ba666e292263b36954f8d07974422f3e034
> -- 
> 2.43.0
> 
