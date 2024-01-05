Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E012D609
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2wh+pRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635D3C433C8;
	Fri,  5 Jan 2024 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704461497;
	bh=2E4N2xD6TO0DKC21opRJsWadgqWcjXqfzol4AEqmrqA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=P2wh+pRG/692DtEoQ0rrQ96z7okL9LZUPwbKLO8Yoi72itNo4Ras8qwL0kI8SkGz9
	 mzbduAiXS5pLt8LEXGTArTgCGev7E1e50Fee1bhxPr6AsjoTadahzd9Vl8Iu4miIBo
	 zuAUN83kQlCR6XHS61+8GVNMi5Jp5Ug1PcRqxHmLqhA1EafGsIdQvV+0TILxeJkGn/
	 09pN8jk8+w1PAJSbdkD4jWkSKZ4atvYDiqyylmWveaFhWQar4grJO2x4vma9Q/wYcR
	 kpqhtWuHPFjsfxymqI+R8cGo2B7C4ZOjJ2t/Rbnok1JJ7Gz2+S9buU3WkMS0IhWAeC
	 1El1mIcuImnaQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F06C3CE1777; Fri,  5 Jan 2024 05:31:36 -0800 (PST)
Date: Fri, 5 Jan 2024 05:31:36 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH -perfbook 0/8] Use rsvg-convert for SVG --> PDF conversion
Message-ID: <e7070cb8-e9b2-4cf5-8bdf-b844765eedff@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>

On Fri, Jan 05, 2024 at 06:44:47PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> [Cc 0/8 and 8/8 to Leo, Patch 8/8 touches gitlab-ci.yml]
> 
> Frequent crashes of Inkscape I encountered in 2023, which was mitigated
> in commit f307e19f2be0 ("Prevent inkscape from interacting with desktop
> manager"), made me look into alternative SVG --> PDF converters.
> 
> It turns out that recent versions of rsvg-convert work reasonably well
> for perfbook.  By "recent versions", I mean 2.52.5 and 2.57.x.
> rsvg-convert is a light-weight CLI command and is much faster than inkscape.
> 
> Sequential SVG --> PDF conversion time I get from
> "make cleanfigs-svg; env time make figs":
> 
>                 elapsed
> Inkscape:        21.45s
> rsvg-convert:     6.05s
> 
> So patches 1/8--4/8 add rules in Makefile for using rsvg-convert if it
> is recent enough.
> 
> One caveat: There is a SVG cartoon drawn by an ancient version of Inkscape,
> for which very recent versions of rsvg-convert produce distorted background
> of outlined text.
> 
> Patch 5/8 retouches the cartoon and put a SVG compatible with librsvg as
> cartoons/r-2023-Memory-barriers.svg.
> 
> Patches 6/8 and 7/8 adjust FAQ-BUILD and Dockerfiles accordingly.
> 
> Patch 8/8 updates gitlab-ci.yml.  It needs an explicit ACK or Tested-by:
> from Leo before applying.
> 
> Finally, this series wouldn't affect those of you who don't have
> rsvg-convert.

It does seem to deal well with rsvg-convert v2.52.5, so queued.
Especially given that I was having difficulty with inkscape's conversions
to PDF for another document.  I overcame these (I kid you not!) by
hand-editing one of perfbook's .svg files.

So thank you very much!

Again, queued, and I will be pushing this out shortly.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (8):
>   Makefile: Add rules to use rsvg-convert for SVG --> PDF conversion
>   Makefile: Don't use rsvg-convert < 2.57
>   Makefile: Allow rsvg-convert 2.52
>   Makefile: Use rsvg-convert anyway if no inkscape is found
>   cartoons: Retouch r-2014-Memory-barrier.svg
>   FAQ-BUILD: List package for rsvg-convert in package lists
>   docker: Add packages for rsvg-convert
>   gitlab-ci.yml: Install librsvg instead of inkscape
> 
>  FAQ-BUILD.txt                      |   23 +-
>  Makefile                           |   48 +-
>  cartoons/r-2023-Memory-barrier.svg | 1130 ++++++++++++++++++++++++++++
>  cpu/overview.tex                   |    2 +-
>  docker/Dockerfile                  |    4 +-
>  docker/Dockerfile.fedora           |    7 +-
>  utilities/gitlab-ci.yml            |    2 +-
>  7 files changed, 1198 insertions(+), 18 deletions(-)
>  create mode 100644 cartoons/r-2023-Memory-barrier.svg
> 
> 
> base-commit: 1ea46c6d43475fbdf97404dec28a58036d505bc3
> -- 
> 2.34.1
> 
> 
