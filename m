Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A0917C213
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718110514; cv=none; b=WqmRAm6bfzHlNZDio7AKbDJy3WSyB1cqqWsgkHUDAsjXWP4cX9non2Sy2al0v04fOisj1Pyk6yKbhOu1olTeGKj5IFf6ho2UcyU3Zbv7EF9tiIrSoivS4ScJ/es5Z459oZymFZiSSCaQ38NpICYI2ymk65rYsWsC8w5H5T0xudI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718110514; c=relaxed/simple;
	bh=oFaR4vJS4zqAI83YA2H58ywKchTJ+XXyDga6rNwTrp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWpE1oUqUaAons0jfukne7scikAzrOJkZUqhNBivHlNUbELkh6mlezjHqbFAKiDLJ2ET0lCdZLsTXSN10AQ4pzuW+UbG/FLZejFKmS1Z/pbmYEdwQhlA8IdY7/nbYs7WqNqixfAeA0jsNebnvoISqY28B1o1W1AspwOnTj9zFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COGsEu5s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COGsEu5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603B8C3277B;
	Tue, 11 Jun 2024 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718110514;
	bh=oFaR4vJS4zqAI83YA2H58ywKchTJ+XXyDga6rNwTrp4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=COGsEu5smEXyYtQ5aIDtvzQ7RCe2RZP7rvXsySA0gjO33tY7yHc/HyaEkuncTGBm1
	 5jVsxN+FKLNoefZB8VkgdCoyGH9OIj7ydQ4nlvu1qAu9+l+vu7OjSeH8/Ek5h1ORMg
	 Gd7OoakqsJ0ZNklJiBrJfBlgLIPjjDiD46fh+pQGiaT21Y+NazVeb1jrwtJSNX4r59
	 /MsNEn/grKhw0s/Cpp+C5IKZn2xXBOUFLjN1c+SijpVsf1WSNfreAuVMbcbhszpPM9
	 31UQ3zEA/bupN6lSK4Xyc1Pugj4Ujh3rkQ64OvHKZYeqGEb21vcA8udTTecKZN6Ujc
	 GLHQKFS5s3hnA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EBCECCE0F84; Tue, 11 Jun 2024 05:55:13 -0700 (PDT)
Date: Tue, 11 Jun 2024 05:55:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook v2 0/3] Work around backward incompatible
 changes in LaTeX2e 2024-06-01
Message-ID: <c461a45b-2722-4412-8bfa-a987613ad182@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>

On Tue, Jun 11, 2024 at 06:34:25PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> As I mentioned earlier [1], recent updates in core LaTeX and accompanying
> changes in the array package broke build of perfbook.
> 
> There are two modes of incompatibilities.
> 
>   1. arydshln assumes array's internal implementation of a past version of
>      array, which is no longer true with array >=v2.6.
> 
>   2. A "LaTeX Warning:" message in loading parnotes.sty.
> 
> Neither arydshln nor parnotes is actively maintained, so here are
> workarounds made in perfbook-lt.tex.
> 
> Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
> earlier.
> 
> Patch 2/3 enables a silence filter for the particular warning.
> 
> Patch 3/3 is a follow up change to use date as rollback options of
> glossaries related packages.  By saying [=2022-10-01] rather than
> [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
> well with our custom code for glossaries & indexing.
> 
> [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/

Queued, thank you!

I have to ask...  Longer term, are we going to need to be thinking in
terms of avoiding use of these two packages?  (I have no idea whether
that even makes any sense, but again, I have to ask.)

							Thanx, Paul

> Akira Yokosawa (3):
>   Work around conflict between arydshln and array v2.6
>   Silence warning msg from LaTeX while loading parnotes package
>   Use date as rollback options for glossaries related packages
> 
>  perfbook-lt.tex | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> 
> base-commit: ef80c4a3ecb96f115b27f1d60bcf7448074ea2e7
> -- 
> 2.34.1
> 
