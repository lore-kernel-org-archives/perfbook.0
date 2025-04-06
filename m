Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56AC55E69
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743963499; cv=none; b=BKtkDDZkDQaKogyo5fJfM90Go6PQEgvVrqIG4HzN73AIJ+K8YG0n/wqrxImo5p+jlBR2iRMEZV0iEEGEOU4YNaDS1Qgj3DsSRqnWPrZj4rzTYQQN+Ujj7tDAFBF8e41RcZuXjmZApu3wesIVVB/2FTZRQAQynW10SzB/1/7f2eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743963499; c=relaxed/simple;
	bh=kg8rNL52rWnf7IrcRarkmBdRvmiGx4Ckj1d52TbtEXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Min07LaTC9Cr3Y9jltPt5DLoCCphVA32BcKBW4CkDWuGnJu8J56hilL00URnhGxlp3hFxGrpTEqmzO57nI7FaGd3vRL3v7KSoK6YjeJZJQ2hKZeo9IM+QlVhCzeenfhzRBuz+wcMXG6a+VHV3bV98l0ZfYZl/7b0GYWXO3MDbYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UW/tHXQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UW/tHXQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B7AC4CEE3;
	Sun,  6 Apr 2025 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743963498;
	bh=kg8rNL52rWnf7IrcRarkmBdRvmiGx4Ckj1d52TbtEXg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UW/tHXQBo6gjVL8DYZI7dzJ0TG9s+/5Dy0A/GyQBSRo1JyNT27LnVTlX+gIw6X2t/
	 kpyHLGTGw4jxU1nJeDwnp7hKQ+hmJCufXOtmNcwKZnskO/Nwnf4WLKQk5mt4xhMvut
	 UHqyT3WfliAcOe+weQ6I7eGizdixgptSDPbvWka1QFgCTyMW4Hrv9dMZ+xSG+NV7Z8
	 DsAOdbijxQjMX/RYdF4VUB//V2zd6P1dyjNr31nCimkcq8JIkIBcsLf/Gsi8qYLGQn
	 zln0FXHiOtI116YTW1oO9UHZq31/u4FLv1GRLcW9Wai+zB0bTS1P/VbvnaBJghBfyw
	 1AmMPV/iPyxJA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B8EFBCE0841; Sun,  6 Apr 2025 11:18:17 -0700 (PDT)
Date: Sun, 6 Apr 2025 11:18:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/3] Add index markers
Message-ID: <6024be8c-5207-4711-85f6-05892d49cec1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>

On Sun, Apr 06, 2025 at 07:28:45PM +0900, Akira Yokosawa wrote:
> Subject: [PATCH -perfbook 0/3] Add index markers
> 
> Add index markers for the following terms/acronym:
> 
>   - Linux kernel memory consistency model (LKMM)
>   - thermal throttling
>   - multicopy atomicity
> 
> For "multicopy atomicity", instances of closely related adjective
> forms are marked as well. See Patch 3/3.

Queued and pushed, thank you very much!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   memorder: Add index marker for "LKMM" as acronym
>   cpu, SMPdesign, debugging: Add index markers for "thermal throttling"
>   memorder: Add index markers for "multicopy atomicity"
> 
>  SMPdesign/criteria.tex  |  2 +-
>  cpu/overview.tex        |  2 +-
>  debugging/debugging.tex |  2 +-
>  memorder/memorder.tex   | 36 +++++++++++++++++++++---------------
>  4 files changed, 24 insertions(+), 18 deletions(-)
> 
> 
> base-commit: dd844c5b3fcf839a409027967e05ccc3a8dbdd5c
> -- 
> 2.34.1
> 
