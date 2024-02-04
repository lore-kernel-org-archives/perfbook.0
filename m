Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87F24A03
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707071212; cv=none; b=G0TsHLd0chEO5TwGzNhMhPZEJwepMkhbIbrIqXI/DGhBfPyrHmbQR+9vYQz1cGUbi+wUJcTIYPanJuJVZJLyg4lHWGjFtcrdElHZOM6g+/pdhe0BebdqbFtYVfTPZ8dNd1iD16jgcv+fit5k4ljhF6+c7kAQGJNWLywwFuTsCf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707071212; c=relaxed/simple;
	bh=SQjHkJuNmOWbpN7+oW5aKLQ5rS4dLSNb4N6P2nAOIJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qn9HVDftNOp6NgQi0j3IxDQpmVF2zUlkb44A90gqYKcGS44Nm2/BDramfMeEMOy0aWAxAv/+QPqJSz/SPVT1gG97413Uny0cWwZIsqHZkbjT1R7MsavMjehROtUoSraBnGahcHJOcdKThFu9JhqxKmKrvXV/rFdkukQ1J3ep7cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYlbjG6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYlbjG6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F61EC433F1;
	Sun,  4 Feb 2024 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707071211;
	bh=SQjHkJuNmOWbpN7+oW5aKLQ5rS4dLSNb4N6P2nAOIJQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cYlbjG6PJ6oCDOPqTB3eCyRugQYmz2AU0vBaU7P7oTuUaCc9Ajw4qr0p+i8zXqeKV
	 fDKbPPBT4Bf3jHgMi2Aits6A7M9m6c4sRU4OvSFmV/Yec1m2SThQ45X+VJWy9ScDAs
	 oT5d3Lrfj02xFCJU+Ltww7FA87y+vs/en92Yfxw4CYcTKSAxT9ES3YRl4ew6F9hS5u
	 FLxiXXuFI4zSAnDn93sYLv8EMtxW3zJZER/wOypv9DYX2oVDKNm62C0bRai9DuhHpt
	 B5wW1HVm8GW7BzjqNrnDsSKZchtgx5mDOvU3a5RLvrLILZOz7lqUNZUm+UYgl/4C1i
	 oxRQlQAsk9Z0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4B5F8CE1788; Sun,  4 Feb 2024 10:26:49 -0800 (PST)
Date: Sun, 4 Feb 2024 10:26:49 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH 0/4] appendix/whymb: Trivial fixups
Message-ID: <13597431-acb9-4523-b453-545bf1070377@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240204164502.15124-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204164502.15124-1-sj38.park@gmail.com>

On Sun, Feb 04, 2024 at 08:44:58AM -0800, SeongJae Park wrote:
> This patchset contains trivial fixups for appendix/toyrcu/, which found
> while doing Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR
> 
> SeongJae Park (4):
>   appendix/whymb: Use \qco{} for quoted code
>   appendix/whymb: Use \co{} for code
>   appendix/whymb: Add '()' for functions
>   appendix/whymb: Add missing unbreakable spaces

Applied, thank you very much!

							Thanx, Paul

>  appendix/whymb/whymemorybarriers.tex | 200 +++++++++++++--------------
>  1 file changed, 100 insertions(+), 100 deletions(-)
> 
> -- 
> 2.17.1
> 
