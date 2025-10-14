Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE72FFFB1
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760456364; cv=none; b=C9yGIO9r6TMH4nbIufONFPNh60UHoZaWF5XTt7FdoHzgq+YU511HozzxsFLMCQBTs8btgq7Wcw9Q1tXWxwyP37zPKQSsIxWnjTtATGodIHhaDe+7grus5ZnzI7q43HIGrOr7jz8xkE9dCwK2NnLC8jojWSgrmjlVkdidH/8bqKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760456364; c=relaxed/simple;
	bh=JbI0SZVDr7Qj7pb+CoRDkU9Zsm9hRvcmKtFgQ1vX95w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q18w1P09PMGYYl9r0CpyUedaqmXCd74yPXPc4zwKwzv06Suu90CKxYqJR+B906VGfZ2ZRhn3/ynZ60/eo8HJTolUl8ZXyoGfhnuneZ05Yt+xhiRJh+CoNlo5mXXwlybuo2Z4jQAx4RT5okux3xTQWY0oDXSPYGbmuc8J4JtQys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCIq1m4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCIq1m4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE17C4CEE7;
	Tue, 14 Oct 2025 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760456364;
	bh=JbI0SZVDr7Qj7pb+CoRDkU9Zsm9hRvcmKtFgQ1vX95w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=VCIq1m4rvZK+ZjmNUuLQnjLUiJJVpyuvbIJ3AQrOZ+cY6HKj0FRSGebbpsNCd6xWX
	 6La98yeN1Dat/rLSXc7deUabkCGU9JO7+SLs09+T1T+dognm/xVqm5oxFhOkQhhIKR
	 PBW6RchjdGPkUf8AjKn3SjK6DpLo1tGr8F4rU+61zKySHoIruwf4pdJivISMo32AyG
	 7lF3u1ejkJWj6UzyexxuMzx/FyW+IJu4PHfXzN8KkURE6Nfih4v6Xxi6N4EqiDAVuH
	 3RDMxD72bKj5HEaoNJTrYDwgLGmptsK4vhpagRP0xmXJpeoN6eYhPVF+GC0OCubj0O
	 COL6gz9v/GbiQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C6BA2CE0CB5; Tue, 14 Oct 2025 08:39:23 -0700 (PDT)
Date: Tue, 14 Oct 2025 08:39:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/5] Misc updates and tweaks
Message-ID: <ad8ae685-6bc2-41d3-8b2d-1621d86b49c3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>

On Tue, Oct 14, 2025 at 11:58:54AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is a random collection of misc updates.
> 
> Patch 1/5 improves the look of new snippet added recently.
> Patch 2/5 avoids build error of ubuntu:questing based container images.
> Patch 3/5 takes care of pre-v3.0 siunitx (Ubuntu focal).
> Patch 4/5 prevents page/column break in a short VerbatimN snippet.
> Patch 5/5 avoids the use of plain "-" as a minus sign.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> --
> Akira Yokosawa (5):
>   intro: Use "VerbatimU" env for non-float code snippet
>   docker: Remove "-A" option from localedef
>   Provide \qty{} and \unit{} for siunitx < v3.0
>   cpu/overhead: Add "samepage=true" option to short VerbatimN env
>   intro: Say \co{-1} for constant -1
> 
>  cpu/overview.tex  | 2 +-
>  docker/Dockerfile | 2 +-
>  intro/intro.tex   | 8 +++-----
>  perfbook-lt.tex   | 2 ++
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> 
> base-commit: f8c73ec9c6006b74bc2d9a87b1379c74b7541e37
> -- 
> 2.43.0
> 
