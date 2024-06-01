Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E90E546
	for <perfbook@vger.kernel.org>; Sat,  1 Jun 2024 04:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717216675; cv=none; b=cbBY19n7ngFlqUTHyC/xERlohIx0aFFHdloF3Kmhc3jz5oBdgKrqf1Jh2tVLAiwgOREGdkHa3iuUkm2Zbw4TQEYz7fM4lQjfj8JTRJukI6GRHf41Q8W4z1v5PiETjMaZs/mn36oju012CysygWnL19cINOSVztNGS+X4Su/1Vww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717216675; c=relaxed/simple;
	bh=howPko/lt24Q+yhg7XrDI05lHNOCCkPXK68qig/iGy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWNrNx0GEcO3Bf9QJMmAMkOlhmASaGUVUMr/Dk/SUyoKcHNwYEdBSngwpMOx90Ko+BZ/UJxeyG6U1UzMPOa/ms1zgyY+iX+szh8AzQeazYdc49pHrqXXIt16SZKYtDcjjQ5jYqsWfA1NYQOr4/uiOyqbLV5ZV6LR7YTAuhrli7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEgDw7VO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEgDw7VO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A712C116B1;
	Sat,  1 Jun 2024 04:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717216675;
	bh=howPko/lt24Q+yhg7XrDI05lHNOCCkPXK68qig/iGy0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=IEgDw7VOlRKkchqZ30UQQOd4uycgNqANyAQyGzCUBmlRSHvZ55a7yUiJ8OVRUHZtT
	 jJh7BinymfQyOaaSTHW8R1v31RzE46EJFOOM4k4G0AJv8di7Nh+ZOwXau6zBkXj01A
	 mM8w8SWR/x1DcFisVbpp/FZ8Xap3ivwR7WWHrmdhEMZpYkIqIdbsybJicv9JC1EneC
	 nya6BydR4RlGt6VeMua2eld5NnsCr7TOeFZKaHm2exQLS3/g2s90gqJPawal1+KIoX
	 xSbKRCEwbMPc3m5QFSgx2YopwgKSOqBx6Zbza74FTsV1jhsA9BV4bJw3ZYoYvQ9T0u
	 jULxGvSvSQsBw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A9E26CE3ED6; Fri, 31 May 2024 21:37:54 -0700 (PDT)
Date: Fri, 31 May 2024 21:37:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/formal: Add data for Linux
 v6.9 to rcu-test.dat
Message-ID: <b0600a36-b87f-4845-972b-828ba648beda@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bb58334a-c475-47db-87fc-d24b8ebf80cc@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb58334a-c475-47db-87fc-d24b8ebf80cc@gmail.com>

On Sat, Jun 01, 2024 at 11:50:37AM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/rcu-test.dat | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index c0ac6fda..12aa01fc 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -96,3 +96,4 @@ v6.4  21444 11748 33192 35.4
>  ""    21651 12009 33660 35.7
>  ""    21957 12064 34021 35.5
>  v6.8  22018 12071 34089 35.4
> +""    22108 12076 34184 35.3
> 
> base-commit: 43ebeda6629d8203e510b518dacf2863b32b5a85
> -- 
> 2.34.1
> 
