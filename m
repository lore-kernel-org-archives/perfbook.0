Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9E163
	for <perfbook@vger.kernel.org>; Thu,  4 Sep 2025 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952659; cv=none; b=VDOYY32ipbFi1XjcbNF7dk9CUq6VvjfRUvAL9XvD6pK/WRLy1dbr42lwMCEuYHtb163xYLt0TSwxrOHEi7/2B/KlmgUHSFX1McZvyjnXpOEumK1d5G3CLkMFjv40RARSd85vmbLre3R2T48Mfyl/XhuW+h3yFb4DpRgTYyP+U+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952659; c=relaxed/simple;
	bh=nFlMYrQcBUot2YXW8XbiDfe9NxxEgU7vuH74wqLPo0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8CbnERRIJeqSIkyc+FYXDg3zwaPG4KinGAFhQZGlw143ZYIOzHQYWSUhBLMeOxhzWkGxBhRoaPTOtPA6308jZH/RaGpFqYgoogOPguE7ApmN/mrWvKCMKznDIEgrfcO2upapV3Adwuq/4JfkIRPf1Uay+1RkSBdQn82O+56g/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOreKLJY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOreKLJY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5827EC4CEE7;
	Thu,  4 Sep 2025 02:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756952659;
	bh=nFlMYrQcBUot2YXW8XbiDfe9NxxEgU7vuH74wqLPo0w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=iOreKLJY+ubA8fEZ4Ivsg8tA8D6CBXxzEmHj4KE+2hqdEvJTLNiwKQi4sOktEIktA
	 939frfjWfgCI91wLqAGZr3zhkn8Yyk1vOJH4tZ6pSuoBUiKooBJQGEWd1ycp+/ie50
	 ZSHGKS8O2LgyY5QyVi2RKIAQaCTlWmUosZvl6dHTbrTS9ZbrqVzys6mcxqFv/fi7Ad
	 hICOMo7I/83av/fPUJmTFsKwhLNUD67p/gj3ylOTErs/9XrAWeAkaJLfK1pPVYruv6
	 4cz8udaXIgPg4Sh2h5F353IqMpGsPjA0LZhwsSf5q595MS7BMw/XNRRlMNPv2Yu6mS
	 9x48F/TPhZh6w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DE798CE09CC; Wed,  3 Sep 2025 19:24:18 -0700 (PDT)
Date: Wed, 3 Sep 2025 19:24:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: Fwd: arXiv endorsement request from Zhouyi Zhou
Message-ID: <c6ddbea0-314f-4c19-aac0-b3675a1496ae@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202509031002.583A2Ihb104424@lib-arxiv-031.serverfarm.cornell.edu>
 <CAABZP2wNTanif4emXSf92KvGn4rD7nX3XCrE7i5iprAN+K2Z+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABZP2wNTanif4emXSf92KvGn4rD7nX3XCrE7i5iprAN+K2Z+w@mail.gmail.com>

On Wed, Sep 03, 2025 at 06:42:10PM +0800, Zhouyi Zhou wrote:
> Dear Paul and RCUers,
> 
> Our company wants to submit a paper titled "Towards Deterministic Sub-0.5
> µs Response on Linux through Interrupt Isolation" to arXiv, but since this
> is the first time we submit to arXiv, we need an endorsement, can you
> endorse me if convenient?
> 
> Following is the abstract of the paper, we can also provide the full
> content of the paper if you need.

Hello, Zhouyi, and I would of course be happy to help in any way that
I can.  Please do send me the full paper.  A quick skim of the abstract
suggests that you are doing something similar to isolcpus and nohz_full,
along with control of interrupts.

The interrupt latency of 0.5 microseconds is of course quite a bit better
than I have heard of anyone doing on x86, which is constrained by corner
cases involving paging and other issues.  I would expect people to ask
how long you ran your experiments, given that there have been people who
achieved excellent numbers by running their experiments for too short
a time for some of the aforementioned corner cases to arise.

My main concern is whether or not I am "someone who's registered as
an endorser for the cs.OS (Operating Systems) subject class of arXiv".
But I guess I will find out when I attempt to endorse you.  ;-)

Again, please do send me a copy of the full paper.

							Thanx, Paul

> Thank you in advance
> Zhouyi
> --
> Real-time responsiveness in Linux is often constrained by interrupt
> contention and timer
> handling overhead, making it challenging to achieve sub-microsecond latency.
> This work introduces an interrupt isolation approach that centralizes and
> minimizes timer
> interrupt interference across CPU cores. By enabling a dedicated API to
> selectively invoke
> timer handling routines and suppress non-critical inter-processor
> interrupts,
> our design significantly reduces jitter and response latency. Experiments
> conducted on an ARM-based multicore
> platform demonstrate that the proposed mechanism consistently achieves
> sub-0.5 µs response
> times, outperforming conventional Linux PREEMPT-RT configurations. These
> results highlight
> the potential of interrupt isolation as a lightweight and effective
> strategy for
> deterministic real-time workloads in general-purpose operating systems.
> ---
> ---------- Forwarded message ---------
> From: <help@arxiv.org>
> Date: Wed, Sep 3, 2025 at 6:02 PM
> Subject: arXiv endorsement request from Zhouyi Zhou
> To: <zhouzhouyi@gmail.com>
> 
> 
> (Zhouyi Zhou should forward this email to someone who's registered as an
> endorser for the cs.OS (Operating Systems) subject class of arXiv.)
> 
> Zhouyi Zhou requests your endorsement to submit an article to the cs.OS
> section of arXiv. To tell us that you would (or would not) like to
> endorse this person, please visit the following URL:
> 
> https://arxiv.org/auth/endorse?x=TNW38B
> 
> If that URL does not work for you, please visit
> 
> http://arxiv.org/auth/endorse.php
> 
> and enter the following six-digit alphanumeric string:
> 
> Endorsement Code: TNW38B
