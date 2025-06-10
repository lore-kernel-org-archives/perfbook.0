Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E559922DFBB
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557051; cv=none; b=Cq/TbN85oXJEgZR8dZy0KlnLonl+H7Z9ww9vTMglJPEv0yLFuCk6XvWCaGsRoiO+ScO3aIYIRI3dQefCMs3Uyq5iK3HYaoUmDfByAcJbnVIRiWviH89nLsxVCEdzQVYuDletJuhZakRyAf9iWTxXj1mzb/RLrk8sJAyrpgcgxGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557051; c=relaxed/simple;
	bh=FHtZd8YEV9jAn8Rr29TK99JSwOmY2CAYCfOe5SizSvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KApYaOLHnAX1aI3Wn/7r2A28uQQCSIh3BvmW+dklTaQhP81QS5k8RfVg+GkQJgBKSc2WPg3vkz/cTmBQkhP9N6A3Zx3Zd1P4RiXnlZAYq4FXSoyCoEJh/4w7Chs1Uf+w5YuPeSy6aK+qaeuv1fDlI66xy0V/ho3fSQRIt2IA7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVZcumbS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVZcumbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C646CC4CEEF;
	Tue, 10 Jun 2025 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749557050;
	bh=FHtZd8YEV9jAn8Rr29TK99JSwOmY2CAYCfOe5SizSvc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NVZcumbS9VV65tJeSjBEOgR+VhGYrA3yObUwtw7xR1YIDrOpha00/0tx5dthdx7Sv
	 ADPruuF8k9YYTBVjMYqVwGhlXqPPlYECWfcNRq8HQDUSeRARHprtNExrrH1pJdhf6l
	 Hd4C3rR0P+02W4olIw17hY6+aGwXv5CZxcEI6FOE2GDZPIVfOL+dtGB8jKVhvgzXhS
	 Ykliv06IEXKt6G6ckQng6DipA68kqhiCUaGB0php8UmYJ5xUVm8Doye/42ntNRyCLk
	 0RyUAKEeiGtgs/P++LSpnJo2CYoetJQ5nk33/FUfo+e58rWtX6+LSEMSLaNgY1pxy4
	 nSEkWfKRkFrtg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 65063CE10FA; Tue, 10 Jun 2025 05:04:10 -0700 (PDT)
Date: Tue, 10 Jun 2025 05:04:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/5] Misc updates and cleanups
Message-ID: <a7777ea9-8e6f-415b-952e-06140b0e9be5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>

On Tue, Jun 10, 2025 at 07:34:25PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set is a collection of updates/cleanups here and there.
> 
> Patch 1/5 is a routine update of rcu-test.dat.
> Patch 2/5 contains cosmetic changes in formal/dyntickrcu regarding
> non-breakable spaces.
> Patch 3/5 works around missing "awk" command observed in recent fedora-based
> container images.
> Patch 4/5 makes SVG --> PDF conversions more resilient to inkscape crashes
> observed with an old (and possibly a future) release of inkscape.
> Patch 5/5 tweaks shrink ratio of tall code snippets for ebook-size builds.

Queued and pushed, thank you very much!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   CodeSamples/formal: Update rcu-test.dat for v6.15
>   formal/dyntickrcu: Add non-breakable spaces around \co{i} and \co{j}
>   docker/Dockerfile.fedora: Add gawk in package list
>   Makefile: Fall back to rsvg-convert if inkscape crashes
>   toolsoftrade, count: Adjust shrink ratio of tall code snippets for -eb
>     builds
> 
>  CodeSamples/formal/data/rcu-test.dat |  3 ++-
>  Makefile                             | 24 ++++++++++++++----------
>  count/count.tex                      |  2 +-
>  docker/Dockerfile.fedora             |  2 +-
>  formal/dyntickrcu.tex                | 12 ++++++------
>  toolsoftrade/toolsoftrade.tex        |  2 +-
>  6 files changed, 25 insertions(+), 20 deletions(-)
> 
> 
> base-commit: f25caca80f576d06c14c23aaca673528163ca0b9
> -- 
> 2.43.0
> 
