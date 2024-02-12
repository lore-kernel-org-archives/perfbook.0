Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59173D0A0
	for <perfbook@vger.kernel.org>; Mon, 12 Feb 2024 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707739370; cv=none; b=Q8uzA/x+ShoGhWmxM4y6OYneIsGc6g2WT58MT1DKy9MowbSu/G+Jzy22RYfY+pCpG/ItR85c8ypWJJl1ZGYk1hQ+bs9jELKdXhTbvRGs9SF27bVB8FxEMhXRmkWRiTGN1uZaXHvBEAwWEL9hwZ37udvpGY2fakEVhD/8h9JWeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707739370; c=relaxed/simple;
	bh=LaYSBMTm72I2GrOXakhByN4hLh1nFo4/72DEqnEXJJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6JcMcL3iXbFm+iuw9CVBtw/qK292HNgkSzVeWCZf8ctPbuqEPOPJy8ytPLDgpPrhT8rWyzkgtMO0p3xOTtsqF2xT4Aeg8YmPdFvJw48p9+EzCmjeVknZzxNDPz/gajif/GFTQh2rlnbcfH7QHLpOEsP2gOatYfO0rvabnNi2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Keqahw2L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Keqahw2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE85C433F1;
	Mon, 12 Feb 2024 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707739370;
	bh=LaYSBMTm72I2GrOXakhByN4hLh1nFo4/72DEqnEXJJw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Keqahw2LwrXTLedMqr6eo/M1AenEgurwOpFmf0FeJE5bMXH5X7jjs6b0nf3HQnRIx
	 0W0suslTCn7yeOUT8ccczF7NKFJMOTCDOwH/0UbvkbZJU21J/+NmiXGl7SfYzQwi4q
	 ogerihQFA0wc9LpFQSF6Op6jt4mkyGB6U9mRepJxVpnLPEOGAm21SBf7A41rnJtfEI
	 R149cbw4V3gLeKgDH1KCJWS9jr8bBFBawSby3KD0Jgk7i1EoK23umHrKWey5LTfgob
	 U2ZZE+t2zDu1GWyeFsj3ie3mEzZvamvl6pqJXah/ukO0e9e3iNJFkgUbgej3vIqX7a
	 0lwkgnc5e7UzA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D5318CE1261; Mon, 12 Feb 2024 04:02:49 -0800 (PST)
Date: Mon, 12 Feb 2024 04:02:49 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: memorder: SVG figures incompatible with Ubuntu 20.04's Inkscape
Message-ID: <d2c25f6a-43b7-451e-bc09-139dc265d40d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <6756f12f-ec44-49dd-bf52-e74348a4e4f0@gmail.com>
 <d849b105-a899-4679-90b2-5e655bfabd96@paulmck-laptop>
 <f3a562de-0283-477b-96a4-cd3cdc7050ab@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3a562de-0283-477b-96a4-cd3cdc7050ab@gmail.com>

On Mon, Feb 12, 2024 at 11:26:10AM +0900, Akira Yokosawa wrote:
> On 2024/02/12 8:48, Paul E. McKenney wrote:
> > On Mon, Feb 12, 2024 at 08:30:49AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I just did a test build under Ubuntu 20.04.
> >>
> >> Inkscape 0.92.5 crashes with new SVG figures memorder/*-hopes.svg.
> >>
> >> $ inkscape --export-pdf=/tmp/test.pdf memorder/co-hopes.svg
> >> [usual warnings ...]
> >>
> >> ** (inkscape:9): CRITICAL **: 23:17:05.340: void Inkscape::Extension::Internal::CairoRenderContext::_setFillStyle(const SPStyle*, const Geom::OptRect&): assertion '!style->fill.set || style->fill.isColor() || style->fill.isPaintserver()' failed
> >> **
> >> ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
> >> Bail out! ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
> >>
> >> [...]
> >>
> >>
> >> It looks like those SVG figures are generated from dot, and you
> >> added x-axis and y labels to it.
> >>
> >> Can you share the dot scripts you used?
> >>
> >> Hopefully, Ubuntu 20.04's dot might generate SVGs compatible with
> >> the old inkscape.
> > 
> > I generated them using Ubuntu 22.04 inkscape:
> > 
> > 	$ inkscape --version
> > 	Inkscape 1.1.2 (0a00cf5339, 2022-02-04)
> > 
> > But weren't we having trouble with this combination earlier, back when
> > I was on Ubuntu 20.04?  Now if I can remember what we did about it...  ;-)
> 
> memorder/co-hopes.svg has this head comment:
> 
> <?xml version="1.0" encoding="UTF-8" standalone="no"?>
> <!-- Generated by graphviz version 2.36.0 (20140111.2315)
>  -->
> 
> Where does it come from?

I really did create that in inkscape.  If I had created it in
graphviz:

$ dot -v
dot - graphviz version 2.43.0 (0)

Huh.  What I really did was to grab a random .svg, pull that into
inkscape, and edit it.  So let's see what we have:

$ find . -name '*.svg' -exec grep -l 'Generated by graphviz version' {} \;
./memorder/fr.svg
./memorder/fr-hopes.svg
./memorder/rf.svg
./memorder/rf-hopes.svg
./memorder/co.svg
./memorder/co-hopes.svg
./memorder/co_backup.svg
./memorder/co-hopes_backup.svg

And memorder/co.svg was created in 2017, which might be consistent
with a 2014 graphviz.  Except that why would I use graphviz to create
something like that?  I most definitely recall manually adjusting to
create those colored polygons, and that would not have been the experience
with graphviz.

The original was in LibreOffice.  Maybe I somehow used graphviz to convert
from LibreOffice format to .svg?  Maybe LibreOffice uses graphviz to
do exports?  (But lately I just use control-C/control-V to copy/paste
from LibreOffice to Inkscape, though not always with great results.)

> Anyway, I'll see if I can figure out which element in those SVGs
> make the inkscape crash.

On the other hand, I definitely did something strange to create those
files.  Because I have to hand-edit the .svg file to change font sizes.

If they cause you much more trouble, please let me know.  It might be
best for me to just re-create them from scratch.

							Thanx, Paul
