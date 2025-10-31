Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5991F181F
	for <perfbook@vger.kernel.org>; Fri, 31 Oct 2025 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761945589; cv=none; b=bJcjkvkivJKmwilQlHRnfOKx+SWuUgllUtU0iZ+MMf6YIh60e99mRZzC+Qc54Mhd0XjRMSOn7RCqMGnx7wbVlErWT/gJl8X7mJ9+jvBq5Ic4zmAlP+VzbBkIyoparMPCBKwTeduIbhkG0L4qm1QJGPqqOxWcDCsnNug1xHTPxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761945589; c=relaxed/simple;
	bh=2mAarLlNYN2J9r01ZE1BnAFRI+wgkpHwwbbsJidhYdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2orxLxPumJMt1hSmMfB7nGpIUPtEaeuu7Z9hkd6wsWa0z7jSuKZU/TPV2IjU4FhFzwEyFG1FIApFFQselYHo1mXaBYCFT36kD/smCak44EiuZgYmPh9lKfyQUDPie+QDi9Sdbyh0FSkzZhIdDlFcHJk/b1KYGmYzoBWANsSOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXVIFMd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXVIFMd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C386C4CEE7;
	Fri, 31 Oct 2025 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761945589;
	bh=2mAarLlNYN2J9r01ZE1BnAFRI+wgkpHwwbbsJidhYdc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=XXVIFMd6vh6PwQBAJaVVcH+h0rf7m96buQG6ItjOEIHuKaaWWKxMghxL9naP17By3
	 j8WQSUXq4rjM1qjmW5hZRp7TCI4TojBNWIzvMLyHY2LbBuScdjd6H0xZQuo/m7wC94
	 l2FIHdxL2anzwjANti4gzUB1z/mC2OMgmr5WEyR2XrC4R/+raNp7OJ92fcZjuZuYhh
	 zdBNK3QlhF6yIxKmAwSpL7fXZPTCWIcxFsBEhBFGLkczyr1Cw9nj8Bi3VeSSUQUjin
	 oLtuw6KwTcdQO+7JqcMVJC3E7WeBhPstWSiC+WARy6smJ4OtzovoKCFYMuXK7R4a/7
	 xQClRR8ykasUQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D5A46CE0DEC; Fri, 31 Oct 2025 14:19:48 -0700 (PDT)
Date: Fri, 31 Oct 2025 14:19:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Hanmiru Kim <hanmiru.kim@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] getrusage: minor typo (runivcsw -> ru_nivcsw)
Message-ID: <1c0a324f-df2e-49c5-88e3-4b458907f0e2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <149D6154-3E78-477C-AA04-C6F28D7228C5@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <149D6154-3E78-477C-AA04-C6F28D7228C5@gmail.com>

On Fri, Oct 31, 2025 at 05:38:50PM +0100, Hanmiru Kim wrote:
> Hello,
> The `getrusage` example listing contains a small typo: the underscore in `ru_nivcsw` was missing. 
> See `man 2 getrusage` to confirm.
> 
> Thank you for this wonderful book!
> I tried sending the patch using `git send-email` first but I couldn't get it to work. I apologise in advance in case you receive two emails.
> 
> Signed-off-by: Han-Miru Kim
> <hanmiru.kim@gmail.com>

Good eyes, queued and pushed, thank you!

							Thanx, Paul

> ---
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index f285ebc1..ccc33ef9 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -2609,7 +2609,7 @@ int runtest(void)
>  		abort();
>  	}
>  	return (ru1.ru_nvcsw == ru2.ru_nvcsw &&
> -	        ru1.runivcsw == ru2.runivcsw);
> +	        ru1.ru_nivcsw == ru2.ru_nivcsw);
>  }
>  \end{VerbatimL}
>  \end{fcvlabel}
> 
> 
