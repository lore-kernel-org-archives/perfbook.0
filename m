Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5C2E630
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0Tx+Co5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AAAC433C7;
	Fri,  5 Jan 2024 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704468771;
	bh=gGIG42XJ0B5W1edLy7A8eEmugF/SqHD6H//DlGN5lBQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=I0Tx+Co5f0rV4svC0MdPtwNQ9fT5gALHNG6xj53yianP7T/6kDeTIjkpsdPb1wsHe
	 lqTeCKYDEXX/OQclAF+8sAbQpWmRZS+/ArHuAjqEE/bDoTEqy3YL6U7nOxroe7BBKs
	 GQbjfWt3+Pt+w0938qSJ1UDktw+93eiAn9NbcQD5OT64kZ4JkP3JNZVw9iNcKCNwGn
	 Gim1EFdRLY4gDDVgRkgGp4wJdnHPynlMSQmeN9CMrlPRlW/ji1OPVdh+yctoUsN1aM
	 6IPg+fCu0DrbEhpqrOzRwPxynzB9RDME3TStjY7SK24uu22+MXcZhyDccQAndDk9hs
	 B2IaVvoTS2u0Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 33981CE1342; Fri,  5 Jan 2024 07:32:51 -0800 (PST)
Date: Fri, 5 Jan 2024 07:32:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH -perfbook 0/8] Use rsvg-convert for SVG --> PDF conversion
Message-ID: <eaa779a8-8393-4250-b5a2-492128d92147@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
 <e7070cb8-e9b2-4cf5-8bdf-b844765eedff@paulmck-laptop>
 <da8d5b92-96d4-45b9-bf99-92f113a29fd8@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da8d5b92-96d4-45b9-bf99-92f113a29fd8@gmail.com>

On Fri, Jan 05, 2024 at 11:51:55PM +0900, Akira Yokosawa wrote:
> On Fri, 5 Jan 2024 05:31:36 -0800, Paul E. McKenney wrote:
> > On Fri, Jan 05, 2024 at 06:44:47PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> [Cc 0/8 and 8/8 to Leo, Patch 8/8 touches gitlab-ci.yml]
> >>
> >> Frequent crashes of Inkscape I encountered in 2023, which was mitigated
> >> in commit f307e19f2be0 ("Prevent inkscape from interacting with desktop
> >> manager"), made me look into alternative SVG --> PDF converters.
> >>
> >> It turns out that recent versions of rsvg-convert work reasonably well
> >> for perfbook.  By "recent versions", I mean 2.52.5 and 2.57.x.
> >> rsvg-convert is a light-weight CLI command and is much faster than inkscape.
> >>
> >> Sequential SVG --> PDF conversion time I get from
> >> "make cleanfigs-svg; env time make figs":
> >>
> >>                 elapsed
> >> Inkscape:        21.45s
> >> rsvg-convert:     6.05s
> >>
> >> So patches 1/8--4/8 add rules in Makefile for using rsvg-convert if it
> >> is recent enough.
> >>
> >> One caveat: There is a SVG cartoon drawn by an ancient version of Inkscape,
> >> for which very recent versions of rsvg-convert produce distorted background
> >> of outlined text.
> >>
> >> Patch 5/8 retouches the cartoon and put a SVG compatible with librsvg as
> >> cartoons/r-2023-Memory-barriers.svg.
> >>
> >> Patches 6/8 and 7/8 adjust FAQ-BUILD and Dockerfiles accordingly.
> >>
> >> Patch 8/8 updates gitlab-ci.yml.  It needs an explicit ACK or Tested-by:
> >> from Leo before applying.
> >>
> >> Finally, this series wouldn't affect those of you who don't have
> >> rsvg-convert.
> > 
> > It does seem to deal well with rsvg-convert v2.52.5, so queued.
> > Especially given that I was having difficulty with inkscape's conversions
> > to PDF for another document.  I overcame these (I kid you not!) by
> > hand-editing one of perfbook's .svg files.
> 
> Hmm...
> 
> I remember hand-editing defer/RCUusecases.svg.  Let me see ...
> 
> Yes, it was commit 25238915b129 ("defer: Retouch SVG files for browser
> compatibility (2nd attempt)").
> 
> Which perfbook's SVG file did you need to hand-edit?

They were {co,fr,rf}.svg in the memorder directory.

But first, I should hasten to add that there is a good chance that
I was confused and used the wrong inkscape command-line arguments
and environment variables, as opposed to having -really- needed to
hand-edit the document.  I used my usual lazy approach of sticking
with the first thing that gave reasonable results instead of carefully
analyzing the problem.  In this case, that was hand-edit the .svg files
in the perfbook directory, use perfbook's "make" to generate the .pdfs,
and move the .pdfs to the other document's directory.

So it is just as likely to be me being confused as it is that the files
themselves have any real problem.

							Thanx, Paul

>         Thanks, Akira
> 
> 
> > 
> > So thank you very much!
> > 
> > Again, queued, and I will be pushing this out shortly.
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >> --
> >> Akira Yokosawa (8):
> >>   Makefile: Add rules to use rsvg-convert for SVG --> PDF conversion
> >>   Makefile: Don't use rsvg-convert < 2.57
> >>   Makefile: Allow rsvg-convert 2.52
> >>   Makefile: Use rsvg-convert anyway if no inkscape is found
> >>   cartoons: Retouch r-2014-Memory-barrier.svg
> >>   FAQ-BUILD: List package for rsvg-convert in package lists
> >>   docker: Add packages for rsvg-convert
> >>   gitlab-ci.yml: Install librsvg instead of inkscape
> >>
> >>  FAQ-BUILD.txt                      |   23 +-
> >>  Makefile                           |   48 +-
> >>  cartoons/r-2023-Memory-barrier.svg | 1130 ++++++++++++++++++++++++++++
> >>  cpu/overview.tex                   |    2 +-
> >>  docker/Dockerfile                  |    4 +-
> >>  docker/Dockerfile.fedora           |    7 +-
> >>  utilities/gitlab-ci.yml            |    2 +-
> >>  7 files changed, 1198 insertions(+), 18 deletions(-)
> >>  create mode 100644 cartoons/r-2023-Memory-barrier.svg
> >>
> >>
> >> base-commit: 1ea46c6d43475fbdf97404dec28a58036d505bc3
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
