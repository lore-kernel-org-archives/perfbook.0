Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4686DFC19
	for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707678069; cv=none; b=oK0avt7OJk2HQ8eBK9JopwDJha/rWbcCpFIWqCgR69qUDswqOn3Y6iD/eGC5KtIResYDj+1U4Rq8kmFgDZ0qiKev1MDQbJXnKChJhQESol7/tV87qnbpJGBJAIcMEsZZstL4a0Aq7tPipQnA7JA0mgiucT8PvuMQlGnIglzun3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707678069; c=relaxed/simple;
	bh=H2DqNsgw+be+IXHX4AOh8dPjWimvP1TTBt60upEdRuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISP0jMdX+EkdaERT+vFLTI6d30VKKPYNxWcBaV1ElajcnxdJTnLRMPkH4DfkDi7z21KeMoMZ9TsqsITJfdY+6TYYMJNMLmIY/AFYPVNwiHJnGA/tHg/aodTfgJ0jzdLwCuqK4G9mjMZq5LNIrpc9uR3OjxGE0VkpcZ+KQXGEMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3OBLN06; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3OBLN06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A0BC433F1;
	Sun, 11 Feb 2024 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707678069;
	bh=H2DqNsgw+be+IXHX4AOh8dPjWimvP1TTBt60upEdRuQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=e3OBLN06ZBwQqkVgPrjjKJgicmQ9BJ5hn66ePbmQPdXLuogeVTEegzi71u66NuGOE
	 MzO0u5jJwLYcXKDRIqAqSdBbxGdZZyGBM8vLfy3Gdcf84HM+BDmtPDiyP/dzYG1RFL
	 4JHzTIVAT5JlsG0zyuu84cSZ/xbnCTefEL3OQ/WC0NA10XUw2DEn1uh+EcZp4j5kCQ
	 VrsStd37ErrAhInNa5DoPAkPaJcezyzrHWLxk/kCF8DHaQr2fPdfTqow/4wjWcsd5+
	 xLWZtGjXXzfOaeXJZc1hXyHegZwlldhiPb7KvV29oqr0GS893/grqNcRdaDf0IkjfL
	 rc/pmfYaItz9g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A4A96CE0D03; Sun, 11 Feb 2024 11:01:08 -0800 (PST)
Date: Sun, 11 Feb 2024 11:01:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] FAQ: Update Korean translation progress
Message-ID: <c29f1387-50d3-4e73-91ae-69903341b70e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240211175355.4986-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240211175355.4986-1-sj38.park@gmail.com>

On Sun, Feb 11, 2024 at 09:53:54AM -0800, SeongJae Park wrote:
> I started the translation of perfbook since October 2015.  The
> translation was done by June 2017, and I continued wordsmithing, merging
> the upstream changes, and further translating.  Following the upstream's
> fast speed of the change and keeping the translation consistent was
> quite challenging.
> 
> In Mar 2021, I therefore decided to stop updating existing translation
> and start the translation of the 2nd edition from the scratch.  Applying
> upstream changes were minimized to only simple fixes, usually what I
> fixed on my local repo first and sent patches upstream.
> 
> After about three years, I just completed the Korean translation of the
> 2nd edition.  Hence updating the Korean translation progress on FAQ.
> 
> It was a very fun and informative journey.  Huge appreciate to Paul and
> the community for making the great book and letting me get the fun.
> 
> I have no plan for the future.  I don't know if I will continue merging
> upstream changes and further translating it, or if I will restart the
> translation after the third edition is released.  I sometimes feel
> translation is already an area that AI can do better than me.  But I
> sure I would repeatedly read this book again and again, and some day, I
> might try to translate it again.  But at the moment, I'd like to take a
> time to congrats myself :)
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Congratulations, thank you, and I have queued and pushed this patch.
(Only to github, not yet to kernel.org due to technical difficulties at
my end that should be resolved within a few days.)

							Thanx, Paul

> ---
>  FAQ.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/FAQ.txt b/FAQ.txt
> index eb242a36..9e0021f9 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -136,10 +136,15 @@
>  
>  		https://sites.google.com/view/kandamotohiro2/perfbook
>  
> -		SeongJae Park has started work on a Korean translation:
> +		SeongJae Park has Korean translations of the first two editions
> +		of this book.  The translation of the first edition contains
> +		some of later-first edition changes, though[*]:
>  
>  		https://github.com/sjp38/perfbook-ko_KR
>  
> +		[*] Refer to 'Translation Strategy and Editions' section of
> +		https://github.com/sjp38/perfbook-ko_KR-pdf/blob/master/README
> +
>  7.	I am working on a translation.  What do I need to do to get my
>  	name of the list in #6 above?
>  
> -- 
> 2.17.1
> 
