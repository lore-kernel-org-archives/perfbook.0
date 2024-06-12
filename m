Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50112DD83
	for <perfbook@vger.kernel.org>; Wed, 12 Jun 2024 23:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718233477; cv=none; b=BAHj22/f4y+40qH0A7gMI9lmUlXqwdvTpwmBnqRYoBIFcB6ymmgyC32354t3CGtJmYygHcKOyDUZrZp6b6ncvQzRgUc+cWL8l3GobGpPB4PhAwbQ8rUNyyC9y6EH0jg3f6nYKNnvTpQh4BoW68ibzM7RLh1UWiNma/WFXQT5KkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718233477; c=relaxed/simple;
	bh=wy0/sUXPYUsxOqmew5ZCzcWKyKStQSF0IFlSb79HOoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I43qhNEJLbXITc+gLgG7pGbgH9FlnOm/2jNUBlMxX3yRnXjCKIpVz7wOKrxsa/Qtce0yM9u034AaTxIM69rEUICdj05tKP22d4usVUL99ltnqaaeVT8qRSPR8LKh1o0UjNDia3YuRkWk3preChzdi9DxNQWXDfdkahAVrQSs7KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ry5yFbkT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ry5yFbkT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25717C116B1;
	Wed, 12 Jun 2024 23:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718233477;
	bh=wy0/sUXPYUsxOqmew5ZCzcWKyKStQSF0IFlSb79HOoo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ry5yFbkTsGcrW4ocC8gVkg67QyKDcTAZvFAskvhz3WlIljvHsbe+6Eh826D6omMdK
	 yGounfZoYwCfJfQ3s37Q7Jlelu9hOF2SaLX/k7YepCPGcXKfhsTxOKOHfA6SKk8xKZ
	 TBUDvTh+qvMI6eGOjKXSxOtkljaTRzEDN4ou+KZ75dLN0+EXve2vE37EAAlE4tbUi1
	 csxw1AneNbp+HyrlWQp6ZxYkljLaQVytisHsh4zLylZcvHZl3aanbisBbTvAS0j3Gf
	 2dKIdl4ZFX6/BOGu1xO+swECM05hsjYBnK9HRU5sApMFtjkQVxU5vFC7tg3ZVf6nh0
	 slKdCs19eC1Sg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C8D91CE0DEA; Wed, 12 Jun 2024 16:04:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 16:04:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook v2 0/3] Work around backward incompatible
 changes in LaTeX2e 2024-06-01
Message-ID: <b538307f-dc77-4015-931c-a3ffed159acf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
 <c461a45b-2722-4412-8bfa-a987613ad182@paulmck-laptop>
 <c342046b-e078-4447-92ef-d692dce09fad@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c342046b-e078-4447-92ef-d692dce09fad@gmail.com>

On Thu, Jun 13, 2024 at 08:01:44AM +0900, Akira Yokosawa wrote:
> On Tue, 11 Jun 2024 05:55:13 -0700, Paul E. McKenney wrote:
> > On Tue, Jun 11, 2024 at 06:34:25PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> As I mentioned earlier [1], recent updates in core LaTeX and accompanying
> >> changes in the array package broke build of perfbook.
> >>
> >> There are two modes of incompatibilities.
> >>
> >>   1. arydshln assumes array's internal implementation of a past version of
> >>      array, which is no longer true with array >=v2.6.
> >>
> >>   2. A "LaTeX Warning:" message in loading parnotes.sty.
> >>
> >> Neither arydshln nor parnotes is actively maintained, so here are
> >> workarounds made in perfbook-lt.tex.
> >>
> >> Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
> >> earlier.
> >>
> >> Patch 2/3 enables a silence filter for the particular warning.
> >>
> >> Patch 3/3 is a follow up change to use date as rollback options of
> >> glossaries related packages.  By saying [=2022-10-01] rather than
> >> [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
> >> well with our custom code for glossaries & indexing.
> >>
> >> [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/
> > 
> > Queued, thank you!
> > 
> > I have to ask...  Longer term, are we going to need to be thinking in
> > terms of avoiding use of these two packages?  (I have no idea whether
> > that even makes any sense, but again, I have to ask.)
> 
> Well, I have faint hope that Frank Mittelbach, the author of
> TLC3 (The LaTeX Companion, 3rd edition) and the maintainer of array
> (among others), might want to update those packages, as the book uses
> arydshln and parnotes in a couple of examples.
> 
> Just hoping. ;-)

Me too!  ;-)

							Thanx, Paul
