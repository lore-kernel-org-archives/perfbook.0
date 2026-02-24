Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C83A9DAB
	for <perfbook@vger.kernel.org>; Tue, 24 Feb 2026 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958440; cv=none; b=pA8ltYUXVXL9iFLdWE8dT0nVMKVnJOxBhGLKMtQEpmSi4FgUi01M9cZDskYXbYH8Old6euNY5XF2FKayUVm3rTMmUaDOo8zGbF2rG6qIE4sR2n2aMGDenFkMftrl/gSIZz1reAzuez+LrVsxbqJ3D6LMm0I7a+hlcDX8AIyhgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958440; c=relaxed/simple;
	bh=gV7KQZATBu1uoQ1oRL32iiUHfh3EzBukb3e757Wx8mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cinbum14gLvLcK8iTOTnRNSdyt4ZVwun3vxcaK8uD3HDSjq07q/Uyc5B/Z9UTwqH8wErQ/R/tBgeKXzOxa1jZhmx2lntUHBFKOY9SAi9uT8OX/bcGDZYhK8CIu1jfvWXubg9xbCSp7HRF+Nsfx2ggyEKkIiYEl43JNpvTABZpVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCMJRr96; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCMJRr96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D36C116D0;
	Tue, 24 Feb 2026 18:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771958439;
	bh=gV7KQZATBu1uoQ1oRL32iiUHfh3EzBukb3e757Wx8mA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DCMJRr96L0bg8RANF07nKfa9n0rmRAxM8vdjt+lqywsN2/ieNAelMeCw2rVKmOAZ8
	 prE2fHlx1BRxDMdNX5pxHLfnKb0T3r75QyASwbYOoUKnov8lXFDCb4G4a5zpFcIS+U
	 yOQ7zBVgNUyJQw1SWXPZWRhTlgpNp4zFQfJ3l6zVd+FXNAHLJyhUMQiEPY+le+n2nd
	 szk4Caj9ZdSKKDwxIgysxCvhsT5FGOPmIXE9mTqvlZLgY3bULQWlIO9nE1S1DGJ8Ux
	 AU5S994S68r/wzk+4bUL+7Ha0UYyBqegY2FN5bPMfubkic7J98aJmK3WxxBbLfVI2J
	 DWm/Y18JHvsjA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4907BCE0964; Tue, 24 Feb 2026 10:40:39 -0800 (PST)
Date: Tue, 24 Feb 2026 10:40:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] defer/whichtochoose: Fix incomplete RCU object reference
Message-ID: <0222fd40-1e88-4887-9402-636673f33c65@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260224151712.2743076-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224151712.2743076-1-kunwu.chan@linux.dev>

On Tue, Feb 24, 2026 at 11:17:12PM +0800, Kunwu Chan wrote:
> Replace the incomplete phrase "all other RCU" with the more precise
> "all other RCU-deferred objects", clarifying that what gets blocked

I made this be "all other RCU-protected objects", but otherwise took
all five patches as-is.

Good eyes, and thank you very much!

							Thanx, Paul

> from being freed are objects awaiting RCU grace-period reclamation,
> not RCU itself.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
> ---
>  defer/whichtochoose.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
> index 139c9636..ff4545bc 100644
> --- a/defer/whichtochoose.tex
> +++ b/defer/whichtochoose.tex
> @@ -118,8 +118,8 @@ The ``Duration of Protection'' row describes constraints (if any) on how
>  long a period of time a user may protect a given object.
>  Reference counting and hazard pointers can both protect objects for
>  extended time periods with no untoward side effects, but
> -maintaining an RCU reference to even one object prevents all other RCU
> -from being freed.
> +maintaining an RCU reference to even one object prevents all other
> +RCU-deferred objects from being freed.
>  RCU readers must therefore be relatively short in order to avoid running
>  the system out of memory, with special-purpose implementations such
>  as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this rule.
> -- 
> 2.25.1
> 
