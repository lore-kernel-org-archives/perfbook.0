Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEB01E86F
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718110007; cv=none; b=ebe56zYW/l5vWO2evEr9z05eL4O++kfvVIsJrgU0kyTyQMkwGsip4qKUd/KZt5r/mSalRXfltHESeLg36u+2yweXEWoUeO4uJ6wcprb9TJJtVyAFtjsqheSZS5NZo91PemaL6YV3960P5FN+g/u3pnryR5Rf3U5aDdIoaFwq7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718110007; c=relaxed/simple;
	bh=wHQiGojVocO6rsNJHywgmn03cxNYIY2erEIDuA+WFfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoQPHKcHF7hGWp3taw8j6okcI/0ZSUZ/o5+pLl6cKdXS40oIaxQ+VLYM/68kYmaaqOL6LpOERDSU5Tf4OTIAKD+dy9qjPSAeRXbDFhYebB+7IbBAjrqnmPNodTUQX1HbgkpHZef7d9z45cJatfwAk43BHcMfNxj1RK4wsogGBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7FoQN6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7FoQN6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012E4C2BD10;
	Tue, 11 Jun 2024 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718110006;
	bh=wHQiGojVocO6rsNJHywgmn03cxNYIY2erEIDuA+WFfE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=f7FoQN6LpoX3E1KJPJWAB8/ORCpJm2kO9UuOcTJlHfxF8xGZ6aapk4P6LWkWBevSS
	 uUtUytwsgWbK/UfJrVidtk4Gu6pBGp5vyR5gIpRNV3EmSoKOvBkSftTofGoF5J27qa
	 eX3KevgL6MXxxWusoqpotry2cVEQqRJmPVb1fAHo0dnaNYLXWR+8kwRBrbfwCE5Qy9
	 rZxAb0iIfoBE6p95/EhinhNc2pqzz6FGQ5kDXd78U6w4cNqJkad+Iepcp7zW8qEw2F
	 BhwvLP5DppsPgKfeojY0ImvXuy2kAq7EgIhknRYu60sdKTgqK6nHNlCoBLi28pp97W
	 DNJlCCbBGDPYA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A732CCE0F84; Tue, 11 Jun 2024 05:46:45 -0700 (PDT)
Date: Tue, 11 Jun 2024 05:46:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/3] Work around backward incompatible changes
 in LaTeX2e 2024-06-01
Message-ID: <18651640-931b-48d5-b985-f5537a5aa121@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <43076436-4692-43b3-8607-5ca85a4fb84b@gmail.com>
 <9f58e8a0-567f-4032-8978-d56dc920a7c3@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f58e8a0-567f-4032-8978-d56dc920a7c3@gmail.com>

On Tue, Jun 11, 2024 at 06:29:15PM +0900, Akira Yokosawa wrote:
> On 2024/06/11 18:06, Akira Yokosawa wrote:
> > Hi Paul,
> 
> I fat-fingered a patch for this series.
> Will send v2 soon.

I know that feeling!  Looking forward to seeing v2.

							Thanx, Paul

> > As I mentioned earlier [1], recent updates in core LaTeX and accompanying
> > changes in the array package broke build of perfbook.
> > 
> > There are two modes of incompatibilities.
> > 
> >   1. arydshln assumes array's internal implementation of a past version of
> >      array, which is no longer true with array >=v2.6.
> > 
> >   2. A "LaTeX Warning:" message in loading parnotes.sty.
> > 
> > Neither arydshln nor parnotes is actively maintained, so here are
> > workarounds made in perfbook-lt.tex.
> > 
> > Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
> > earlier.
> > 
> > Patch 2/3 enables a silence filter for the particular warning.
> > 
> > Patch 3/3 is a follow up change to use date as rollback options of
> > glossaries related packages.  By saying [=2022-10-01] rather than
> > [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
> > well with our custom code for glossaries & indexing.
> > 
> > [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/
> > 
> > Akira Yokosawa (3):
> >   Work around conflict between arydshln and array v2.6
> >   Silence warning msg from LaTeX while loading parnotes package
> >   Use date as rollback options for glossaries related packages
> > 
> >  perfbook-lt.tex | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > 
> > base-commit: ef80c4a3ecb96f115b27f1d60bcf7448074ea2e7
