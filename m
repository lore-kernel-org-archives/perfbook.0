Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1D16EB42
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735486578; cv=none; b=R15V64zxxE8oTT3xjeRQik2vvYf65C6Wgtz6W5loSrprZw1QYWgmaUgML07yWyr15X5eq7oE+7fcaSL9nXLNr9NtLUvNMXuzVmRPzfUOQsh4MjaZ6NBMz8jo27Nz/HspJZzomuSvwV9mKUxbZurd2Nc7Y1k5+zIWOQiWfG9FVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735486578; c=relaxed/simple;
	bh=vjoqt+R646XPe/NcZBoS9xmNDcHtViWk7UKc9mjAhcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8Kt407W9r+uRz7DbvNrI8ES7hbbqdwm8zGitJwETVkXrjOcGuwqBja/3T/IML+HjqYQcp117kCieZag399b6nHpri4KBOei2ml2awOOmw03gGqOrDwL2STwgn85FLN1BNteHvI90SjUc+p8B3NL/PbfvSDZYzPPsDcxdt8wOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/XSa7e2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/XSa7e2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B60C4CED1;
	Sun, 29 Dec 2024 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735486577;
	bh=vjoqt+R646XPe/NcZBoS9xmNDcHtViWk7UKc9mjAhcg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=f/XSa7e2SNJeS1AhAZPrHpFVuO425c2dAR/6S6Q/qzmzWxy/Beu+CWY6WXBcV1gXG
	 3213FEl/UhQxc66XY31vaOcySlRtMng/VzPW3tURPR3/Bv2sGbJhwoXB8rINOpUjH5
	 2b8VRLIJu6lQIhbGFdKRfyEekcnqAHzc42LEALPxFgqAgRSvLPUhQXPjTRhpVz+rC6
	 gVvBH0SXE7DO1x+/CqIOh5nz3ArUtvz0v+/IC/LvUHXvTTRAzfI7xW7BF1bebeYglY
	 FKdFD54O5IBVVmE1YSOTncWBzs93k8f2QUYj1NKh59Yf/hzwjmlaj+YT1+UegIjwaB
	 5yf2T/L9GiMLQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 71AF3CE0E5E; Sun, 29 Dec 2024 07:36:17 -0800 (PST)
Date: Sun, 29 Dec 2024 07:36:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>,
	perfbook@vger.kernel.org
Subject: Re: [PATCH v4] CodeSamples: Fix liburcu-signal support deprecation
Message-ID: <e7f37b7e-dab5-4de9-bd36-aabaa8cdedc7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <50dd7b4054a31ea2fe7f8cf61cb285162bea8107.camel@gmail.com>
 <dc7b5ba8-eb2b-4777-a12a-3bd762194f6c@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc7b5ba8-eb2b-4777-a12a-3bd762194f6c@gmail.com>

On Sun, Dec 29, 2024 at 07:28:04PM +0900, Akira Yokosawa wrote:
> On 2024/12/29 11:29, Leonardo Brás wrote:
> > Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
> > deprecating[2] support for liburcu-signal:
> > 
> > %%%
> >    * Deprecation of liburcu-signal
> > 
> > Users can migrate to liburcu-memb with a kernel implementing the
> > membarrier(2) system call to have similar read-side performance without
> > requiring use of a reserved signal, and with improved grace period
> > performance.
> > %%%
> > 
> > So, in order to avoid breaking builds with liburcu >=0.15 while keeping
> > support for older systems without sys_membarrier(), check for the existance
> > of liburcu-signal before adding it to the build command.
> 
> Thank you!  This is elegant.
> Tested OK against Ubuntu 20.04 LTS, Ubuntu 24.04, and Fedora 41.
> 
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> Filling in missing link tags from v2 so that Paul can apply.
> 
> Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
> Link: https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.html [2]
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Tested-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, and thank you both!

							Thanx, Paul

> > ---
> >  CodeSamples/datastruct/Issaquah/Makefile  |  5 ++--
> >  CodeSamples/datastruct/existence/Makefile | 34 ++++++++++++-----------
> >  CodeSamples/datastruct/hash/Makefile      |  7 +++--
> >  CodeSamples/datastruct/skiplist/Makefile  |  5 ++--
> >  CodeSamples/defer/Makefile                |  7 +++--
> >  5 files changed, 32 insertions(+), 26 deletions(-)
> > 
> 
>         Thanks, Akira
> 
