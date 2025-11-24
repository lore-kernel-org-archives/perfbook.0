Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9852C11DB
	for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004499; cv=none; b=WbWRmQ+ymOeYSG6M5xSGofbDIKU2fDwT1MVHv0j4tsgXFuxeEyEdks6mx/5VqBIdQ9Nlgwd52oFHXy0THGgeS3uTnkxSs5uzlkcl33ZgPQ23EsH0j1jVXljEGrnM4OnmY9iEH2K+UmgTwuV7M5U3nyPqfC3nij43kPTRpcFshhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004499; c=relaxed/simple;
	bh=HcZ+VJv1jQFOuEQxTJrSKWooduAXGymnU/NNeEcmCCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ducfG6HYZcfcYxHP0t5S7pvOuU/MnVISjjcZEnisTWEE8ctg4acFDH+UAeq4cpEx1EBOruxGuqxK/VbPcFSI8JMq1Tb8n/cH1pdSPcAUKWL+emnp3vYJy+2xcSBsEFpV27xdwWhPchbH+0vQJrCmkK6eiHTwcrxiP9qiOdcRavU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RD+SavL5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RD+SavL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC0EC4CEF1;
	Mon, 24 Nov 2025 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764004498;
	bh=HcZ+VJv1jQFOuEQxTJrSKWooduAXGymnU/NNeEcmCCo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RD+SavL5cBCL979dPsUaNtR5Tw/OJ98MRqLv+RcABBYz2XID6vMHLp2Pym0ytLEFv
	 Ra55mNJIbLMsUzPcdl5Km1dAqw/uygL4nAuZX2VY7awN0ds63YMi1voYsSqGzqyD8y
	 4Njsu9r8AAdFRf30WuaeFH3oYibSq/+VaHznSo2met4mLlmIIAMCNVoeS57pP2A2+F
	 HC2JEp4aeO7rqtLnSRP+gJ+KEyJHkazFHdT5f09kyGoK1wo1mPkzJaZKHKEm1hm4Xr
	 /ty/KPGkmVUE+Gnj1iPj9p+iOFxDMoxOYIf6/zKwshwfocZPLy6/DOFuIzaDegssUr
	 cBT+Pxu9NSSqg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0354BCE0C56; Mon, 24 Nov 2025 09:14:58 -0800 (PST)
Date: Mon, 24 Nov 2025 09:14:57 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/3] CodeSamples/formal/herd: Tweaks for new
 litmus tests
Message-ID: <7c5487c4-1ecd-4522-b14e-dd00d4c52319@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>

On Mon, Nov 24, 2025 at 06:10:56PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I see a couple of minor issues in running
> 
>    - make cross-klitmus; cd klitmus; make
>    - make run-herd7
> 
> under CodeSamples/formal/herd/.
> 
> This patch set should resolve those issues.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   CodeSamples/.../herd: Declare non-int reg variables in init block
>   CodeSamples/.../herd/Makefile: Add klitmus7-ready tests
>   CodeSamples/formal/herd/Makefile: Exclude time-consuming test from
>     run-herd7
> 
>  ...-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus |  3 +++
>  ...usync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus |  3 +++
>  .../formal/herd/C-double-check-cas-2.litmus   |  2 ++
>  .../formal/herd/C-double-check-rcu-2.litmus   |  2 ++
>  .../formal/herd/C-double-check-rcu-3.litmus   |  3 +++
>  .../formal/herd/C-double-check-rcu-4.litmus   |  4 ++++
>  CodeSamples/formal/herd/Makefile              | 21 +++++++++++++++----
>  7 files changed, 34 insertions(+), 4 deletions(-)
> 
> 
> base-commit: 11bc82274338c587732236210f9f6aaa5b5c0343
> -- 
> 2.43.0
> 
