Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A601ABED0
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724937626; cv=none; b=oLjq3lo/PMKXRQuIYClk4X0EPCwJXbCmgX6GwLQKLBI7PC5IHXx1vxBnY6brVBvRrdwcxYSLVF9cbiko9i+BFESL7yjnh3/HOeqR1EWVWgHWuB0pTKWPTWfYaz8OYuPnyv1j7I6HAP3idrg3yrltYZwM3irl+CRxohz7K8vYBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724937626; c=relaxed/simple;
	bh=z8ptMXPJHAW+OhnYYeRyCeKYVTV+TpJDePlP4kff+pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAU//TLOOQrZJJ0a2VEU59v2jj12+fkkHZeJ4yCAIHXUvXj6MDOPYin4ZpbK33COy70DsnZuzKv6ZnV43R/A3iWwRMUrtI/cMS9kmnvmQ3fI+QXX3w7cKxKE9Dja4CMijfsuSWwl3jCWSgTQqX4LujuOo4PrQiAzCm62xDlu8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQN2+YeO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQN2+YeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47737C4CED2;
	Thu, 29 Aug 2024 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724937626;
	bh=z8ptMXPJHAW+OhnYYeRyCeKYVTV+TpJDePlP4kff+pc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=oQN2+YeOFqnntqAN6ddw8IYYELJ4Q8gPztPQOLAf3bnEJW9dUL/Ia+lCA9Hgdzx0L
	 wc8Wy9lQHGHw5Nuyd/rPR++FFLPKSYtw6BbC180np5/tzAU6x0pxW3X+NLTxy+ACe1
	 nh5r1CCNvtTpqFNtLFmZoSBYmAS1dkgV/FzLc/HIDSb/3mSmL80BrKQeWkxuIvzoSO
	 GHcaKI9gFNlwYkvD5Rm4z2zDP2HySJyXHh4OF7cqZSa1IABT89fZoYENVk0TmdDOPJ
	 /SdyZHTUeeU+2eHeyQObD6ZkR2Pr494VJFmfioy+3mviGY/aKcg6t3ulSQrd4CshCR
	 bcQ9ncN63emNQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BA436CE0D9C; Thu, 29 Aug 2024 06:20:25 -0700 (PDT)
Date: Thu, 29 Aug 2024 06:20:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/5] bib: URL updates
Message-ID: <1f6a6ff6-5e82-4c1f-93d3-674e8ee58102@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>

On Thu, Aug 29, 2024 at 10:49:54AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> As I mentioned in the off-list message to you, it looks like some
> (or most) of citeseerx URLs have stopped working for a while, probably
> due to configuration errors.
> 
> Patch 1/5 replaces such URLs with (hopefully) more robust ones
> or DOIs.
> 
> Patches 2/5--4/5 take care of URLs related to "Synthesis OS" and
> add a lay summary article of LWN's in bib/os.bib.
> 
> Patch 5/5 employs underline-style hyperlink marker in bibliography
> pages for 2c builds.  It avoids visual interference caused by
> the current light-blue-border style.

Queued and pushed, thank you very much!

> There remain quite a few URLs under bib/ who need updates.
> I'm going to take care of them.

And on behalf of perfbook's readers, thank you in advance!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   bib: Replace citeseer{x} URLs
>   bib/os: Update URLs of papers related to Synthesis OS
>   bib/os: Add LWN's KHB article on Synthesis by Valerie (Feb 2008)
>   defer: Cite Valerie's KHB article
>   Use underline for url links in 2c builds' bibliography
> 
>  bib/RCU.bib      |  2 +-
>  bib/WFS.bib      |  4 +---
>  bib/hw.bib       |  2 +-
>  bib/os.bib       | 28 +++++++++++++++++++++-------
>  bib/syncrefs.bib |  2 +-
>  defer/defer.tex  |  3 ++-
>  perfbook-lt.tex  |  2 +-
>  7 files changed, 28 insertions(+), 15 deletions(-)
> 
> 
> base-commit: 971b39e51a1f3b808fe49088b9e3f3ef0c137aca
> -- 
> 2.34.1
> 
