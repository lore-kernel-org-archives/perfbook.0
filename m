Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506625B08A
	for <perfbook@vger.kernel.org>; Thu,  1 Oct 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790896657; cv=none; b=rRvNhEds6Jm0aEI2oKS6VOoMwLIA0D11YdsM/0Q0tFVrAsV1Kej1fGe9Sr5EHvqw9QtWJSLrvWVhpNqoUUmpZmx/D8bMfubcdKyM+gmgzltW9AsVgoIhzkaKFJUX8aAzejd6jNajtCgnmU3cQAbIVDE/8S2Pk3G05ZPJbYmpS54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790896657; c=relaxed/simple;
	bh=DtwhcMPQROLO72bDDHHFllZCBRA5VlNnDxaGI8WW5Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsY+8q6GufsZ2WqknXJtdfTPeQD+Z78+cNt11ps0j6SaqoJSsijP+VTfHRz6r77B3/LKHFVyKZvI6A2q6H4Q9mNm0X3kNTKNwxCerJAz9tSrz3XW7PKeTVkBX6+ketElnkcI+l+N3VPHroztBuPkUYGbldvSQ+j1qWxoPwwaYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVEddRTI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVEddRTI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CF51F000FF;
	Thu,  1 Oct 2026 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790896655;
	bh=qXjEkA2dz6OZfdKukx9Rk27NwBSU15wE2FDc6HqfQxQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=TVEddRTIkPJcKxtxfTupwHNlr0yzCOAdVD2EVpPMPzCKHH/eKvGSX2pWfW8PPIek+
	 75AthHEWWDdyqcAjrDVFd84JuUJ/nmX1I1KUUf2snP71c31d4a+Ohc9YcmFnXqGRwB
	 8naQvRQCPfX39/xYeOwBedzJ5EgDrMtK6ZVOJkf3ihJy66lljhcdRW1VPMg6Uq3H2V
	 xUc1kiWjrhoWbmNavAUR18WKKLJg7cF45KXLaQJw/L247ZQN9vWbD0Y4lcU/Jx7Df3
	 g4Dv4ufVf4pNYOHmp4AsOS0Ezbp7QZgifHjVfoQF50gFNBRaUC51IhsO7af0ORmJVu
	 3zeFiE4p5YOTg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 28A06CE0AD8; Thu,  1 Oct 2026 16:17:35 -0700 (PDT)
Date: Thu, 1 Oct 2026 16:17:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] datastruct/hash: Simplify hashtorture initial insertion
Message-ID: <0657a451-57fc-4e67-8bdd-43f3e1b3a7ff@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260819032432.862450-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819032432.862450-1-kunwu.chan@linux.dev>

On Wed, Aug 19, 2026 at 11:24:32AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@gmail.com>
> 
> Commit 1314f0a0 ("datastruct/hash: Speed up hashtorture initial
> insertions") replaced random element placement with a linear scan
> guarded by:
> 
>         if (elperupdater / 2 - j <= elperupdater - i || random() % 2)
> 
> The left disjunct is always true along the loop execution.  The loop
> maintains the invariant i == j, starting from i == j == 0.  The guard
> therefore reduces to elperupdater / 2 <= elperupdater, and each forced
> insertion increments both i and j.  Thus random() % 2 is never
> evaluated, and the loop has inserted the first elperupdater / 2
> elements consecutively since 2020.
> 
> Simplify both perftest_updater_init() and zoo_updater_init() to plain
> for loops, drop the unused counter j and random.h include, and update
> the comment to describe the actual deterministic behavior.
> 
> This does not change the test behavior exercised since 2020.  The
> randomized initial population was the only stochastic element in this
> initialization path, while the concurrent update loop is a deterministic
> round-robin over each updater's elements.  The perfbook description of
> hashtorture ("RCU-Protected Hash Table Validation") lists invariant
> verification, concurrent-corruption detection, resize correctness,
> and performance-data collection as the documented coverage; none is
> described as depending on the initial key distribution.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>

Queued and pushed, thank you!!!  And please accept my apologies for the
delay, hopefully better late than never.

							Thanx, Paul

> ---
>  CodeSamples/datastruct/hash/hashtorture.h | 41 ++++++++---------------
>  1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
> index 4bd8e247..4fbb7623 100644
> --- a/CodeSamples/datastruct/hash/hashtorture.h
> +++ b/CodeSamples/datastruct/hash/hashtorture.h
> @@ -815,27 +815,20 @@ void *perftest_reader(void *arg)
>  	return NULL;
>  }
>  
> -/* Pre-load specified updater's portion of hash table. */
> +/* Pre-load the first half of this updater's elements into the hash table. */
>  void perftest_updater_init(int mylowkey, struct testhe *thep)
>  {
>  	long i;
> -	long j;
>  
> -	i = j = 0;
> -	while (j < elperupdater / 2) {
> +	for (i = 0; i < elperupdater / 2; i++) {
>  		thep[i].data = i + mylowkey;
>  		thep[i].in_table = 0;
> -		if (elperupdater / 2 - j <= elperupdater - i || random() % 2) {
> -			perftest_add(&thep[i]);
> -			BUG_ON(!perftest_lookup(thep[i].data));
> -			j++;
> -		}
> -		i++;
> +		perftest_add(&thep[i]);
> +		BUG_ON(!perftest_lookup(thep[i].data));
>  	}
> -	while (i < elperupdater) {
> +	for (i = elperupdater / 2; i < elperupdater; i++) {
>  		thep[i].data = i + mylowkey;
>  		thep[i].in_table = 0;
> -		i++;
>  	}
>  }
>  
> @@ -1132,26 +1125,20 @@ void *zoo_reader(void *arg)
>  	return NULL;
>  }
>  
> -/* Pre-load specified updater's portion of hash table. */
> +/* Pre-load the first half of this updater's elements into the hash table. */
>  void zoo_updater_init(int mylowkey, struct zoo_he **zheplist)
>  {
>  	long i;
> -	long j;
>  	struct zoo_he *zhep;
>  
> -	i = j = 0;
> -	while (j < elperupdater / 2) {
> -		if (elperupdater / 2 - j <= elperupdater - i || random() % 2) {
> -			zhep = malloc(sizeof(*zhep));
> -			BUG_ON(!zhep);
> -			strcpy(zhep->name,
> -			       &zoo_names[ZOO_NAMELEN * (i + mylowkey)]);
> -			zoo_add(zhep);
> -			zheplist[i] = zhep;
> -			BUG_ON(!zoo_lookup(zhep->name));
> -			j++;
> -		}
> -		i++;
> +	for (i = 0; i < elperupdater / 2; i++) {
> +		zhep = malloc(sizeof(*zhep));
> +		BUG_ON(!zhep);
> +		strcpy(zhep->name,
> +		       &zoo_names[ZOO_NAMELEN * (i + mylowkey)]);
> +		zoo_add(zhep);
> +		zheplist[i] = zhep;
> +		BUG_ON(!zoo_lookup(zhep->name));
>  	}
>  }
>  
> -- 
> 2.43.0
> 
