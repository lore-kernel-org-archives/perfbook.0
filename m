Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD614F7C
	for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltN6exSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A92CC433C7;
	Fri, 29 Dec 2023 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703891140;
	bh=suzCUUPEmsPU9VLnCcYy17I1dB14Z27BaE13iuPbXtE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ltN6exSbtyZTMJ0UzHi8RWbopl5MKZvGcEykYhtiKCZmpc6JDFt9TeK04LW6C23GX
	 Mlo+U1c6R6R/vSKIGZuzed50ns/XZmkiZ8zUynGX3NFgKjG/u6BPxTQzFb9kCGhdXG
	 SogqYapfwghalJwVwZVxPdtMgNiCnBsWIhkRCuAqjnmnpMwWRIkR8PY0NxZHzt4sop
	 jSMnkX8TLd1uUBRUhskzv4cCnX+axLbCm/Q74X58wCc9zWqCgSPzzA1coeIgsepXee
	 rCmRf/isioKPpxJbOSI1KbX7WBak9H3ZpiLJg92NzdH/Lq+Mfy2tH5IytjKwuMTxEC
	 HZ6+L2ctiTHRg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D6624CE095F; Fri, 29 Dec 2023 15:05:39 -0800 (PST)
Date: Fri, 29 Dec 2023 15:05:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook v5] howto: make 'git archive' in answer to
 QQ1.3 explicit
Message-ID: <fa4a0526-afce-4604-b36a-850123c37663@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1703674798-26270-1-git-send-email-zhouzhouyi@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1703674798-26270-1-git-send-email-zhouzhouyi@gmail.com>

On Wed, Dec 27, 2023 at 06:59:58PM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> Make "git archive" in answer to Quick Quiz 1.3 more explicit by
> adding a footnote, so that a first-time reader, who have never
> read Section 1.5, can easily know how to clone the Git repo and
> build PDFs.
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>

Queued, and thank you both!!!

							Thanx, Paul

> ---
>  howto/howto.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 55270cba..8d678644 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -226,7 +226,9 @@ Here are a few possible strategies:
>  	only a blank sheet of paper.
>  \item	If you find the Quick Quizzes distracting but impossible
>  	to ignore, you can always clone the \LaTeX{} source for
> -	this book from the git archive.
> +	this book from the git archive.\footnote{
> +		See \cref{sec:howto:Whose Book Is This?}
> +		for instructions to do this.}
>  	You can then run the command \co{make nq}, which will
>  	produce a \co{perfbook-nq.pdf}.
>  	This PDF contains unobtrusive boxed tags where the Quick Quizzes
> -- 
> 2.34.1
> 
> 
