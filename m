Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73515CE
	for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 23:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707695284; cv=none; b=GDoCBBDuxHVpi66qNC2NrO2ylxxDRcYxbbWU+qTpEkJz4/Or91d0Vx0Pud8oTXo+aC5KzshttDLH5rYz7kWKhkuquC3UCoGVK4VlnmgL2S4nlYhqejdL9E1gwA7/20LgDTxYMidPz//RfMTCCARjWNcubGQ3dVonXgu9gaEi3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707695284; c=relaxed/simple;
	bh=vIv7T1WJ3LAwFta+tz4eCbdM0L4MFPMHpHOuNAmRWuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYrL4Tx8E1CxDTY3/T5NyHuXJbj1D3CGk0hu1BMA3AwIqLaeDpQIiKx22kz/gCv4CQeRlYQGeZOg3MwnYcK1Udha1Mz5bus4NevL3n6bK0O01KwZijthpSl+nIQXsYjavDKIHiUtxqmKVhUOWyW1geL31lOilDriWY/jPkL/jVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYlUK44r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYlUK44r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D10C433C7;
	Sun, 11 Feb 2024 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707695284;
	bh=vIv7T1WJ3LAwFta+tz4eCbdM0L4MFPMHpHOuNAmRWuE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uYlUK44r92QTQFrg9MyrX1zfpcTPSFws5xKWnWYl7mwVjhI1If/+uat58Jgl41ZLU
	 KWAT4S518uKxosjk/LpB3IXxyDEyShRGpozAAOUXl/8K8poZkeimmih4LRmWjfprPY
	 rfaMN0uMytLhwhTDBJRYAfU8XWeZhQ02xn3owACTVfhb0DNCrVTtKPkq06UnhEwkak
	 AUxJw2VWa2u1yZwsPNcTq98coKznqScDp+xTl8ggm1HAmeJn87BLc1Pzz0jQz3fixE
	 hUazPfpA6k7iDc0l5nWJeGqWyylxQoW91iqqLBW4QBJicFfAXj9cc0ry7GS/DwQigN
	 tE4mfbKoTAHUg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 81700CE0D0D; Sun, 11 Feb 2024 15:48:03 -0800 (PST)
Date: Sun, 11 Feb 2024 15:48:03 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: memorder: SVG figures incompatible with Ubuntu 20.04's Inkscape
Message-ID: <d849b105-a899-4679-90b2-5e655bfabd96@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <6756f12f-ec44-49dd-bf52-e74348a4e4f0@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6756f12f-ec44-49dd-bf52-e74348a4e4f0@gmail.com>

On Mon, Feb 12, 2024 at 08:30:49AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I just did a test build under Ubuntu 20.04.
> 
> Inkscape 0.92.5 crashes with new SVG figures memorder/*-hopes.svg.
> 
> $ inkscape --export-pdf=/tmp/test.pdf memorder/co-hopes.svg
> [usual warnings ...]
> 
> ** (inkscape:9): CRITICAL **: 23:17:05.340: void Inkscape::Extension::Internal::CairoRenderContext::_setFillStyle(const SPStyle*, const Geom::OptRect&): assertion '!style->fill.set || style->fill.isColor() || style->fill.isPaintserver()' failed
> **
> ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
> Bail out! ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
> 
> [...]
> 
> 
> It looks like those SVG figures are generated from dot, and you
> added x-axis and y labels to it.
> 
> Can you share the dot scripts you used?
> 
> Hopefully, Ubuntu 20.04's dot might generate SVGs compatible with
> the old inkscape.

I generated them using Ubuntu 22.04 inkscape:

	$ inkscape --version
	Inkscape 1.1.2 (0a00cf5339, 2022-02-04)

But weren't we having trouble with this combination earlier, back when
I was on Ubuntu 20.04?  Now if I can remember what we did about it...  ;-)

							Thanx, Paul
