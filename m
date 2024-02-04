Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32EF24A07
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707071189; cv=none; b=G/AOTI2FIlVfJiJI+p7GwB+6qYVV7odI99GwPdLzL6uS7fc54oapAym3FPfUiYrlbnCfjVtPu2JHBL2NnS5amqs9nfkZQLRgZKiwKYujsTiVX9fP4NP91ocysLOQJWHrhQ4kkJv+ipJSKy6OswEQzcT2hpDXx7JQlSwCwgu65XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707071189; c=relaxed/simple;
	bh=9XuQStvNZZ1Ihp2eKIGtyLJPiuM/pQZE7Rt10WtPmUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfMj27MLEgzGdRRPReKlE1CJfT+U7TPIiRXREd1VMB0KeYJCMedPClRF9bXQEHn6ANzwPsHxf+j9CeyFIHWxkjNH61xTwzhjUxt4OXjBTUomHGoW96GsHUT2F4bqy0+xqGtSTfcWWweJuIVwccurGm3l26AyzsDRDk8rJYnIw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTIDINFw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTIDINFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A3FC433B1;
	Sun,  4 Feb 2024 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707071188;
	bh=9XuQStvNZZ1Ihp2eKIGtyLJPiuM/pQZE7Rt10WtPmUE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZTIDINFwDKtgz5MGAdL0H+7AldwSjs4fgCpeY459+WphO1ZrkZ9JYD7S4ShhblB0S
	 UsStkPRWeoKEIdkMf6jY5Y+lSP7p0Tk9kwUFjwrmCGwnoJL529I5Q01yNUi1uwVGOt
	 krgNOOOqO/pCVig7DTg7v+zuocjisOlFpkuOoeHCaKDYAl/moghLBNjuTHEdQ6juH0
	 gbHtQIpdLcdzNEXVFgrlvnRl6RB5uwDQxjMux56qXWfvSVD3dJagAKZgwc/5fACMYt
	 X/YdGQ1U9NyfTVj0xKtjk5rmR8iKAxOvNGT/fL3G+rUrEgI8y/9XNu7QWDIMxzRocT
	 DyoP7frue5K8g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 212AECE1788; Sun,  4 Feb 2024 10:26:22 -0800 (PST)
Date: Sun, 4 Feb 2024 10:26:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] CodeSamples/cpu: Tweak bin_width of coe.eps
Message-ID: <cdeb7713-ec82-42f5-a43e-ffedb1c30c00@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2cffe54f-fb53-4cc2-a5f6-fbc439c1d069@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cffe54f-fb53-4cc2-a5f6-fbc439c1d069@gmail.com>

On Sun, Feb 04, 2024 at 09:13:09AM +0900, Akira Yokosawa wrote:
> bin_width of 40 obscured the spike at time period [38, 40].
> 
> Use bin_width of 2 instead.
> For consistency, use solid boxes in fre.eps and rfe.eps as well.
> Also "set xtic out" to make those tics be easily seen.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you very much!

I also adjusted my commentary about monomodality and trimodality.
I will get these pushed out after I recover from today's flight.
(PDX->LHR->Cambridge.)

							Thanx, Paul

> ---
>  CodeSamples/cpu/data/coe.eps                  | 1993 ++++++++++++-----
>  CodeSamples/cpu/data/fre.eps                  |  964 ++------
>  .../coe.eps                                   | 1993 ++++++++++++-----
>  .../fre.eps                                   |  964 ++------
>  .../plots.sh                                  |   19 +-
>  .../rfe.eps                                   | 1183 ++--------
>  CodeSamples/cpu/data/rfe.eps                  | 1183 ++--------
>  7 files changed, 3703 insertions(+), 4596 deletions(-)
> 
> diff --git a/CodeSamples/cpu/data/coe.eps b/CodeSamples/cpu/data/coe.eps
> index a4bad25f..219b91fa 100644
> --- a/CodeSamples/cpu/data/coe.eps
> +++ b/CodeSamples/cpu/data/coe.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: coe.eps
>  %%Creator: gnuplot 5.4 patchlevel 2
> -%%CreationDate: Tue Jan 30 09:04:30 2024
> +%%CreationDate: Sun Feb  4 08:55:38 2024
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 327 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jan 30 09:04:30 2024)
> +  /CreationDate (Sun Feb  4 08:55:38 2024)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1917,12 +1917,12 @@ BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 256 M
> +440 319 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 256 M
> +392 319 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -1930,154 +1930,178 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 500 M
> +440 494 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 500 M
> +392 494 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.05)]
> +] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
> +1.000 UL
> +LTb
> +LCb setrgbcolor
> +440 669 M
> +63 0 V
> +2124 0 R
> +-63 0 V
> +stroke
> +392 669 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.1)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 744 M
> +440 844 M
> +63 0 V
> +2124 0 R
> +-63 0 V
> +stroke
> +392 844 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.15)]
> +] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
> +1.000 UL
> +LTb
> +LCb setrgbcolor
> +440 1020 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 744 M
> +392 1020 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.2)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 988 M
> +440 1195 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 988 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
> +392 1195 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.25)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 1232 M
> +440 1370 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 1232 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.4)]
> +392 1370 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 1476 M
> +440 1545 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 1476 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.5)]
> +392 1545 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.35)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 1720 M
> +440 1720 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 1720 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.6)]
> +392 1720 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.4)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 256 M
> -0 63 V
> -0 1401 R
> +440 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -392 176 M
> +440 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-2500)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -765 256 M
> -0 63 V
> -0 1401 R
> +805 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -765 176 M
> +805 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-2000)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1137 256 M
> -0 63 V
> -0 1401 R
> +1169 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -1137 176 M
> +1169 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-1500)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1510 256 M
> -0 63 V
> -0 1401 R
> +1534 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -1510 176 M
> +1534 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-1000)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1882 256 M
> -0 63 V
> -0 1401 R
> +1898 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -1882 176 M
> +1898 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-500)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2255 256 M
> -0 63 V
> -0 1401 R
> +2263 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -2255 176 M
> +2263 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2627 256 M
> -0 63 V
> -0 1401 R
> +2627 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2627 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 500)]
> @@ -2089,23 +2113,23 @@ LCb setrgbcolor
>  1.000 UL
>  LTa
>  LCb setrgbcolor
> -2255 256 M
> -0 1464 V
> +2263 319 M
> +0 1401 V
>  stroke
>  LTB
>  LCb setrgbcolor
> -392 1720 N
> -392 256 L
> -2235 0 V
> -0 1464 V
> --2235 0 V
> +440 1720 N
> +440 319 L
> +2187 0 V
> +0 1401 V
> +-2187 0 V
>  Z stroke
>  1.000 UP
>  1.000 UL
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -76 988 M
> +76 1019 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Frequency \(arb. unit\))]
>  ] -26.7 MCshow
> @@ -2113,7 +2137,7 @@ grestore
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  LTb
>  LCb setrgbcolor
> -1509 56 M
> +1533 56 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Store-to-Store Latency \(Timestamp Periods\))]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2122,456 +2146,1389 @@ LTb
>  1.000 UL
>  LTb
>  0.58 0.00 0.83 C
> -392 256 N
> -0 8 V
> -30 0 V
> -0 -8 V
> --30 0 V
> -Z stroke
> -422 256 N
> -0 4 V
> -30 0 V
> -0 -4 V
> --30 0 V
> -Z stroke
> -452 256 N
> -0 4 V
> -29 0 V
> -0 -4 V
> --29 0 V
> -Z stroke
> -481 256 N
> -0 11 V
> -30 0 V
> -0 -11 V
> --30 0 V
> -Z stroke
> -511 256 N
> -0 14 V
> -30 0 V
> -0 -14 V
> --30 0 V
> -Z stroke
> -541 256 N
> -0 15 V
> -30 0 V
> -0 -15 V
> --30 0 V
> -Z stroke
> -571 256 N
> -0 13 V
> -30 0 V
> -0 -13 V
> --30 0 V
> -Z stroke
> -601 256 N
> -0 13 V
> -29 0 V
> -0 -13 V
> --29 0 V
> -Z stroke
> -630 256 N
> -0 13 V
> -30 0 V
> -0 -13 V
> --30 0 V
> -Z stroke
> -660 256 N
> -0 20 V
> -30 0 V
> -0 -20 V
> --30 0 V
> -Z stroke
> -690 256 N
> -0 23 V
> -30 0 V
> -0 -23 V
> --30 0 V
> -Z stroke
> -720 256 N
> -0 28 V
> -30 0 V
> -0 -28 V
> --30 0 V
> -Z stroke
> -750 256 N
> -0 30 V
> -29 0 V
> -0 -30 V
> --29 0 V
> -Z stroke
> -779 256 N
> -0 40 V
> -30 0 V
> -0 -40 V
> --30 0 V
> -Z stroke
> -809 256 N
> -0 35 V
> -30 0 V
> -0 -35 V
> --30 0 V
> -Z stroke
> -839 256 N
> -0 36 V
> -30 0 V
> -0 -36 V
> --30 0 V
> -Z stroke
> -869 256 N
> -0 61 V
> -30 0 V
> -0 -61 V
> --30 0 V
> -Z stroke
> -899 256 N
> -0 44 V
> -29 0 V
> -0 -44 V
> --29 0 V
> -Z stroke
> -928 256 N
> -0 65 V
> -30 0 V
> -0 -65 V
> --30 0 V
> -Z stroke
> -958 256 N
> -0 70 V
> -30 0 V
> -0 -70 V
> --30 0 V
> -Z stroke
> -988 256 N
> -0 88 V
> -30 0 V
> -0 -88 V
> --30 0 V
> -Z stroke
> -1018 256 N
> -0 96 V
> -30 0 V
> -0 -96 V
> --30 0 V
> -Z stroke
> -1048 256 N
> -0 128 V
> -29 0 V
> -0 -128 V
> --29 0 V
> -Z stroke
> -1077 256 N
> -0 157 V
> -30 0 V
> -0 -157 V
> --30 0 V
> -Z stroke
> -1107 256 N
> -0 168 V
> -30 0 V
> -0 -168 V
> --30 0 V
> -Z stroke
> -1137 256 N
> -0 187 V
> -30 0 V
> -0 -187 V
> --30 0 V
> -Z stroke
> -1167 256 N
> -0 219 V
> -30 0 V
> -0 -219 V
> --30 0 V
> -Z stroke
> -1197 256 N
> -0 272 V
> -29 0 V
> -0 -272 V
> --29 0 V
> -Z stroke
> -1226 256 N
> -0 292 V
> -30 0 V
> -0 -292 V
> --30 0 V
> -Z stroke
> -1256 256 N
> -0 352 V
> -30 0 V
> -0 -352 V
> --30 0 V
> -Z stroke
> -1286 256 N
> -0 382 V
> -30 0 V
> -0 -382 V
> --30 0 V
> -Z stroke
> -1316 256 N
> -0 450 V
> -30 0 V
> -0 -450 V
> --30 0 V
> -Z stroke
> -1346 256 N
> -0 477 V
> -29 0 V
> -0 -477 V
> --29 0 V
> -Z stroke
> -1375 256 N
> -0 594 V
> -30 0 V
> -0 -594 V
> --30 0 V
> -Z stroke
> -1405 256 N
> -0 667 V
> -30 0 V
> -0 -667 V
> --30 0 V
> -Z stroke
> -1435 256 N
> -0 736 V
> -30 0 V
> -0 -736 V
> --30 0 V
> -Z stroke
> -1465 256 N
> -0 833 V
> -30 0 V
> -0 -833 V
> --30 0 V
> -Z stroke
> -1495 256 N
> -0 914 V
> -29 0 V
> -0 -914 V
> --29 0 V
> -Z stroke
> -1524 256 N
> -0 966 V
> -30 0 V
> -0 -966 V
> --30 0 V
> -Z stroke
> -1554 256 N
> -0 1063 V
> -30 0 V
> -0 -1063 V
> --30 0 V
> -Z stroke
> -1584 256 N
> -0 1063 V
> -30 0 V
> -0 -1063 V
> --30 0 V
> -Z stroke
> -1614 256 N
> -0 1124 V
> -30 0 V
> -0 -1124 V
> --30 0 V
> -Z stroke
> -1644 256 N
> -0 1185 V
> -29 0 V
> -0 -1185 V
> --29 0 V
> -Z stroke
> -1673 256 N
> -0 1218 V
> -30 0 V
> -0 -1218 V
> --30 0 V
> -Z stroke
> -1703 256 N
> -0 1252 V
> -30 0 V
> -0 -1252 V
> --30 0 V
> -Z stroke
> -1733 256 N
> -0 1205 V
> -30 0 V
> -0 -1205 V
> --30 0 V
> -Z stroke
> -1763 256 N
> -0 1272 V
> -30 0 V
> -0 -1272 V
> --30 0 V
> -Z stroke
> -1793 256 N
> -0 1243 V
> -29 0 V
> -0 -1243 V
> --29 0 V
> -Z stroke
> -1822 256 N
> -0 1199 V
> -30 0 V
> -0 -1199 V
> --30 0 V
> -Z stroke
> -1852 256 N
> -0 1156 V
> -30 0 V
> -0 -1156 V
> --30 0 V
> -Z stroke
> -1882 256 N
> -0 1147 V
> -30 0 V
> -0 -1147 V
> --30 0 V
> -Z stroke
> -1912 256 N
> -0 1143 V
> -30 0 V
> -0 -1143 V
> --30 0 V
> -Z stroke
> -1942 256 N
> -0 1086 V
> -29 0 V
> -0 -1086 V
> --29 0 V
> -Z stroke
> -1971 256 N
> -0 1016 V
> -30 0 V
> -0 -1016 V
> --30 0 V
> -Z stroke
> -2001 256 N
> -0 972 V
> -30 0 V
> -0 -972 V
> --30 0 V
> -Z stroke
> -2031 256 N
> -0 925 V
> -30 0 V
> -0 -925 V
> --30 0 V
> -Z stroke
> -2061 256 N
> -0 854 V
> -30 0 V
> -0 -854 V
> --30 0 V
> -Z stroke
> -2091 256 N
> -0 821 V
> -29 0 V
> -0 -821 V
> --29 0 V
> -Z stroke
> -2120 256 N
> -0 717 V
> -30 0 V
> -0 -717 V
> --30 0 V
> -Z stroke
> -2150 256 N
> -0 617 V
> -30 0 V
> -0 -617 V
> --30 0 V
> -Z stroke
> -2180 256 N
> -0 559 V
> -30 0 V
> -0 -559 V
> --30 0 V
> -Z stroke
> -2210 256 N
> -0 454 V
> -30 0 V
> -0 -454 V
> --30 0 V
> -Z stroke
> -2240 256 N
> -0 387 V
> -29 0 V
> -0 -387 V
> --29 0 V
> -Z stroke
> -2269 256 N
> -0 332 V
> -30 0 V
> -0 -332 V
> --30 0 V
> -Z stroke
> -2299 256 N
> -0 175 V
> -30 0 V
> -0 -175 V
> --30 0 V
> -Z stroke
> -2329 256 N
> -0 111 V
> -30 0 V
> -0 -111 V
> --30 0 V
> -Z stroke
> -2359 256 N
> -0 70 V
> -30 0 V
> -0 -70 V
> --30 0 V
> -Z stroke
> -2389 256 N
> -0 46 V
> -29 0 V
> -0 -46 V
> --29 0 V
> -Z stroke
> -2418 256 N
> -0 40 V
> -30 0 V
> -0 -40 V
> --30 0 V
> -Z stroke
> -2448 256 N
> -0 34 V
> -30 0 V
> -0 -34 V
> --30 0 V
> -Z stroke
> -2478 256 N
> -0 29 V
> -30 0 V
> -0 -29 V
> --30 0 V
> -Z stroke
> -2508 256 N
> -0 18 V
> -30 0 V
> -0 -18 V
> --30 0 V
> -Z stroke
> -2538 256 N
> -0 23 V
> -29 0 V
> -0 -23 V
> --29 0 V
> -Z stroke
> -2567 256 N
> -0 12 V
> -30 0 V
> -0 -12 V
> --30 0 V
> -Z stroke
> -2597 256 N
> -0 11 V
> -30 0 V
> -0 -11 V
> --30 0 V
> -Z stroke
> +1.000 441 319 2 10 BoxColFill
> +1.000 443 319 1 10 BoxColFill
> +1.000 447 319 2 10 BoxColFill
> +1.000 448 319 2 19 BoxColFill
> +1.000 453 319 1 10 BoxColFill
> +1.000 454 319 2 19 BoxColFill
> +1.000 456 319 1 19 BoxColFill
> +1.000 457 319 2 19 BoxColFill
> +1.000 459 319 1 19 BoxColFill
> +1.000 463 319 2 10 BoxColFill
> +1.000 466 319 2 10 BoxColFill
> +1.000 469 319 2 19 BoxColFill
> +1.000 478 319 1 10 BoxColFill
> +1.000 483 319 2 10 BoxColFill
> +1.000 485 319 2 10 BoxColFill
> +1.000 489 319 2 10 BoxColFill
> +1.000 498 319 2 10 BoxColFill
> +1.000 501 319 2 10 BoxColFill
> +1.000 504 319 2 10 BoxColFill
> +1.000 520 319 2 10 BoxColFill
> +1.000 523 319 1 19 BoxColFill
> +1.000 524 319 2 10 BoxColFill
> +1.000 526 319 1 10 BoxColFill
> +1.000 534 319 2 10 BoxColFill
> +1.000 545 319 1 19 BoxColFill
> +1.000 546 319 2 10 BoxColFill
> +1.000 548 319 1 10 BoxColFill
> +1.000 549 319 2 10 BoxColFill
> +1.000 550 319 2 10 BoxColFill
> +1.000 552 319 2 19 BoxColFill
> +1.000 558 319 1 10 BoxColFill
> +1.000 561 319 1 10 BoxColFill
> +1.000 562 319 2 10 BoxColFill
> +1.000 564 319 1 10 BoxColFill
> +1.000 565 319 2 10 BoxColFill
> +1.000 566 319 2 28 BoxColFill
> +1.000 569 319 2 10 BoxColFill
> +1.000 572 319 2 10 BoxColFill
> +1.000 575 319 2 10 BoxColFill
> +1.000 578 319 2 19 BoxColFill
> +1.000 580 319 1 10 BoxColFill
> +1.000 581 319 2 10 BoxColFill
> +1.000 584 319 2 19 BoxColFill
> +1.000 585 319 2 10 BoxColFill
> +1.000 587 319 2 10 BoxColFill
> +1.000 588 319 2 28 BoxColFill
> +1.000 590 319 2 10 BoxColFill
> +1.000 591 319 2 10 BoxColFill
> +1.000 593 319 1 10 BoxColFill
> +1.000 596 319 1 10 BoxColFill
> +1.000 597 319 2 19 BoxColFill
> +1.000 599 319 1 28 BoxColFill
> +1.000 600 319 2 19 BoxColFill
> +1.000 601 319 2 19 BoxColFill
> +1.000 606 319 2 10 BoxColFill
> +1.000 609 319 1 10 BoxColFill
> +1.000 610 319 2 10 BoxColFill
> +1.000 612 319 1 28 BoxColFill
> +1.000 613 319 2 10 BoxColFill
> +1.000 615 319 1 19 BoxColFill
> +1.000 616 319 2 19 BoxColFill
> +1.000 618 319 1 10 BoxColFill
> +1.000 620 319 2 10 BoxColFill
> +1.000 622 319 2 10 BoxColFill
> +1.000 625 319 2 28 BoxColFill
> +1.000 626 319 2 28 BoxColFill
> +1.000 628 319 1 10 BoxColFill
> +1.000 629 319 2 10 BoxColFill
> +1.000 631 319 1 10 BoxColFill
> +1.000 632 319 2 19 BoxColFill
> +1.000 634 319 1 10 BoxColFill
> +1.000 635 319 2 10 BoxColFill
> +1.000 636 319 2 28 BoxColFill
> +1.000 639 319 2 10 BoxColFill
> +1.000 641 319 2 10 BoxColFill
> +1.000 645 319 2 28 BoxColFill
> +1.000 648 319 2 19 BoxColFill
> +1.000 650 319 1 19 BoxColFill
> +1.000 653 319 1 10 BoxColFill
> +1.000 655 319 2 10 BoxColFill
> +1.000 657 319 2 10 BoxColFill
> +1.000 660 319 2 36 BoxColFill
> +1.000 666 319 1 19 BoxColFill
> +1.000 669 319 1 19 BoxColFill
> +1.000 674 319 2 10 BoxColFill
> +1.000 676 319 2 19 BoxColFill
> +1.000 677 319 2 10 BoxColFill
> +1.000 679 319 1 10 BoxColFill
> +1.000 680 319 2 10 BoxColFill
> +1.000 682 319 1 19 BoxColFill
> +1.000 683 319 2 10 BoxColFill
> +1.000 685 319 1 10 BoxColFill
> +1.000 686 319 2 28 BoxColFill
> +1.000 687 319 2 10 BoxColFill
> +1.000 689 319 2 10 BoxColFill
> +1.000 693 319 2 10 BoxColFill
> +1.000 695 319 2 10 BoxColFill
> +1.000 696 319 2 10 BoxColFill
> +1.000 698 319 1 10 BoxColFill
> +1.000 701 319 1 10 BoxColFill
> +1.000 704 319 1 28 BoxColFill
> +1.000 705 319 2 10 BoxColFill
> +1.000 706 319 2 10 BoxColFill
> +1.000 709 319 2 19 BoxColFill
> +1.000 711 319 2 10 BoxColFill
> +1.000 712 319 2 10 BoxColFill
> +1.000 714 319 1 28 BoxColFill
> +1.000 715 319 2 19 BoxColFill
> +1.000 717 319 1 19 BoxColFill
> +1.000 720 319 1 19 BoxColFill
> +1.000 722 319 2 10 BoxColFill
> +1.000 724 319 2 28 BoxColFill
> +1.000 725 319 2 10 BoxColFill
> +1.000 727 319 2 19 BoxColFill
> +1.000 728 319 2 28 BoxColFill
> +1.000 731 319 2 10 BoxColFill
> +1.000 733 319 1 36 BoxColFill
> +1.000 734 319 2 10 BoxColFill
> +1.000 736 319 1 10 BoxColFill
> +1.000 737 319 2 28 BoxColFill
> +1.000 739 319 1 45 BoxColFill
> +1.000 741 319 2 19 BoxColFill
> +1.000 743 319 2 10 BoxColFill
> +1.000 744 319 2 10 BoxColFill
> +1.000 746 319 2 19 BoxColFill
> +1.000 747 319 2 28 BoxColFill
> +1.000 749 319 1 10 BoxColFill
> +1.000 750 319 2 10 BoxColFill
> +1.000 753 319 2 45 BoxColFill
> +1.000 755 319 1 10 BoxColFill
> +1.000 757 319 2 19 BoxColFill
> +1.000 759 319 2 28 BoxColFill
> +1.000 760 319 2 19 BoxColFill
> +1.000 762 319 2 10 BoxColFill
> +1.000 763 319 2 28 BoxColFill
> +1.000 765 319 1 36 BoxColFill
> +1.000 766 319 2 10 BoxColFill
> +1.000 768 319 1 10 BoxColFill
> +1.000 769 319 2 19 BoxColFill
> +1.000 771 319 1 36 BoxColFill
> +1.000 772 319 2 19 BoxColFill
> +1.000 776 319 2 45 BoxColFill
> +1.000 778 319 2 19 BoxColFill
> +1.000 779 319 2 19 BoxColFill
> +1.000 781 319 2 10 BoxColFill
> +1.000 782 319 2 10 BoxColFill
> +1.000 784 319 1 10 BoxColFill
> +1.000 785 319 2 28 BoxColFill
> +1.000 787 319 1 28 BoxColFill
> +1.000 788 319 2 36 BoxColFill
> +1.000 790 319 1 19 BoxColFill
> +1.000 791 319 2 28 BoxColFill
> +1.000 792 319 2 36 BoxColFill
> +1.000 794 319 2 19 BoxColFill
> +1.000 795 319 2 28 BoxColFill
> +1.000 797 319 2 19 BoxColFill
> +1.000 798 319 2 19 BoxColFill
> +1.000 800 319 1 10 BoxColFill
> +1.000 801 319 2 28 BoxColFill
> +1.000 803 319 1 19 BoxColFill
> +1.000 804 319 2 10 BoxColFill
> +1.000 807 319 2 10 BoxColFill
> +1.000 810 319 2 10 BoxColFill
> +1.000 811 319 2 19 BoxColFill
> +1.000 813 319 2 19 BoxColFill
> +1.000 814 319 2 36 BoxColFill
> +1.000 816 319 2 28 BoxColFill
> +1.000 817 319 2 10 BoxColFill
> +1.000 819 319 1 19 BoxColFill
> +1.000 820 319 2 36 BoxColFill
> +1.000 822 319 1 28 BoxColFill
> +1.000 823 319 2 10 BoxColFill
> +1.000 825 319 1 54 BoxColFill
> +1.000 826 319 2 36 BoxColFill
> +1.000 827 319 2 28 BoxColFill
> +1.000 829 319 2 19 BoxColFill
> +1.000 830 319 2 54 BoxColFill
> +1.000 832 319 2 19 BoxColFill
> +1.000 833 319 2 45 BoxColFill
> +1.000 835 319 1 36 BoxColFill
> +1.000 836 319 2 19 BoxColFill
> +1.000 838 319 1 28 BoxColFill
> +1.000 839 319 2 10 BoxColFill
> +1.000 841 319 1 28 BoxColFill
> +1.000 844 319 1 19 BoxColFill
> +1.000 845 319 2 54 BoxColFill
> +1.000 846 319 2 10 BoxColFill
> +1.000 848 319 2 36 BoxColFill
> +1.000 849 319 2 19 BoxColFill
> +1.000 851 319 2 10 BoxColFill
> +1.000 852 319 2 45 BoxColFill
> +1.000 854 319 1 45 BoxColFill
> +1.000 855 319 2 36 BoxColFill
> +1.000 857 319 1 63 BoxColFill
> +1.000 858 319 2 19 BoxColFill
> +1.000 860 319 1 28 BoxColFill
> +1.000 861 319 2 45 BoxColFill
> +1.000 862 319 2 28 BoxColFill
> +1.000 865 319 2 10 BoxColFill
> +1.000 867 319 2 19 BoxColFill
> +1.000 868 319 2 45 BoxColFill
> +1.000 870 319 1 10 BoxColFill
> +1.000 871 319 2 10 BoxColFill
> +1.000 873 319 1 36 BoxColFill
> +1.000 874 319 2 36 BoxColFill
> +1.000 876 319 1 19 BoxColFill
> +1.000 877 319 2 19 BoxColFill
> +1.000 878 319 2 45 BoxColFill
> +1.000 880 319 2 63 BoxColFill
> +1.000 881 319 2 19 BoxColFill
> +1.000 883 319 2 10 BoxColFill
> +1.000 884 319 2 36 BoxColFill
> +1.000 886 319 2 19 BoxColFill
> +1.000 887 319 2 28 BoxColFill
> +1.000 889 319 1 36 BoxColFill
> +1.000 890 319 2 28 BoxColFill
> +1.000 892 319 1 19 BoxColFill
> +1.000 893 319 2 19 BoxColFill
> +1.000 895 319 1 36 BoxColFill
> +1.000 896 319 2 10 BoxColFill
> +1.000 897 319 2 36 BoxColFill
> +1.000 899 319 2 10 BoxColFill
> +1.000 900 319 2 45 BoxColFill
> +1.000 902 319 2 45 BoxColFill
> +1.000 903 319 2 45 BoxColFill
> +1.000 905 319 1 36 BoxColFill
> +1.000 906 319 2 36 BoxColFill
> +1.000 908 319 1 10 BoxColFill
> +1.000 909 319 2 19 BoxColFill
> +1.000 911 319 1 19 BoxColFill
> +1.000 912 319 2 19 BoxColFill
> +1.000 913 319 2 19 BoxColFill
> +1.000 915 319 2 10 BoxColFill
> +1.000 916 319 2 45 BoxColFill
> +1.000 918 319 2 63 BoxColFill
> +1.000 921 319 2 36 BoxColFill
> +1.000 922 319 2 36 BoxColFill
> +1.000 924 319 1 45 BoxColFill
> +1.000 925 319 2 63 BoxColFill
> +1.000 927 319 1 72 BoxColFill
> +1.000 928 319 2 28 BoxColFill
> +1.000 930 319 1 90 BoxColFill
> +1.000 931 319 2 19 BoxColFill
> +1.000 932 319 2 28 BoxColFill
> +1.000 934 319 2 45 BoxColFill
> +1.000 935 319 2 45 BoxColFill
> +1.000 937 319 2 54 BoxColFill
> +1.000 938 319 2 10 BoxColFill
> +1.000 940 319 1 54 BoxColFill
> +1.000 941 319 2 28 BoxColFill
> +1.000 943 319 1 45 BoxColFill
> +1.000 944 319 2 45 BoxColFill
> +1.000 946 319 1 45 BoxColFill
> +1.000 947 319 2 54 BoxColFill
> +1.000 948 319 2 45 BoxColFill
> +1.000 950 319 2 19 BoxColFill
> +1.000 951 319 2 28 BoxColFill
> +1.000 953 319 2 54 BoxColFill
> +1.000 954 319 2 28 BoxColFill
> +1.000 956 319 1 19 BoxColFill
> +1.000 957 319 2 36 BoxColFill
> +1.000 959 319 1 19 BoxColFill
> +1.000 960 319 2 19 BoxColFill
> +1.000 962 319 1 45 BoxColFill
> +1.000 963 319 2 28 BoxColFill
> +1.000 965 319 1 36 BoxColFill
> +1.000 966 319 2 36 BoxColFill
> +1.000 967 319 2 36 BoxColFill
> +1.000 969 319 2 10 BoxColFill
> +1.000 970 319 2 54 BoxColFill
> +1.000 972 319 2 54 BoxColFill
> +1.000 973 319 2 28 BoxColFill
> +1.000 975 319 1 45 BoxColFill
> +1.000 976 319 2 10 BoxColFill
> +1.000 978 319 1 54 BoxColFill
> +1.000 979 319 2 36 BoxColFill
> +1.000 981 319 1 28 BoxColFill
> +1.000 982 319 2 36 BoxColFill
> +1.000 983 319 2 45 BoxColFill
> +1.000 985 319 2 54 BoxColFill
> +1.000 986 319 2 45 BoxColFill
> +1.000 988 319 2 72 BoxColFill
> +1.000 989 319 2 28 BoxColFill
> +1.000 991 319 1 45 BoxColFill
> +1.000 992 319 2 28 BoxColFill
> +1.000 994 319 1 54 BoxColFill
> +1.000 995 319 2 63 BoxColFill
> +1.000 997 319 1 90 BoxColFill
> +1.000 998 319 2 28 BoxColFill
> +1.000 1000 319 1 63 BoxColFill
> +1.000 1001 319 2 45 BoxColFill
> +1.000 1002 319 2 45 BoxColFill
> +1.000 1004 319 2 36 BoxColFill
> +1.000 1005 319 2 72 BoxColFill
> +1.000 1007 319 2 45 BoxColFill
> +1.000 1008 319 2 19 BoxColFill
> +1.000 1010 319 1 63 BoxColFill
> +1.000 1011 319 2 36 BoxColFill
> +1.000 1013 319 1 63 BoxColFill
> +1.000 1014 319 2 36 BoxColFill
> +1.000 1016 319 1 63 BoxColFill
> +1.000 1017 319 2 45 BoxColFill
> +1.000 1018 319 2 45 BoxColFill
> +1.000 1020 319 2 90 BoxColFill
> +1.000 1021 319 2 45 BoxColFill
> +1.000 1023 319 2 54 BoxColFill
> +1.000 1024 319 2 28 BoxColFill
> +1.000 1026 319 1 72 BoxColFill
> +1.000 1029 319 1 90 BoxColFill
> +1.000 1030 319 2 54 BoxColFill
> +1.000 1032 319 1 36 BoxColFill
> +1.000 1033 319 2 72 BoxColFill
> +1.000 1034 319 2 63 BoxColFill
> +1.000 1036 319 2 54 BoxColFill
> +1.000 1037 319 2 36 BoxColFill
> +1.000 1039 319 2 90 BoxColFill
> +1.000 1040 319 2 90 BoxColFill
> +1.000 1042 319 2 54 BoxColFill
> +1.000 1043 319 2 54 BoxColFill
> +1.000 1045 319 1 72 BoxColFill
> +1.000 1046 319 2 36 BoxColFill
> +1.000 1048 319 1 28 BoxColFill
> +1.000 1049 319 2 45 BoxColFill
> +1.000 1051 319 1 72 BoxColFill
> +1.000 1052 319 2 54 BoxColFill
> +1.000 1053 319 2 90 BoxColFill
> +1.000 1055 319 2 72 BoxColFill
> +1.000 1056 319 2 90 BoxColFill
> +1.000 1058 319 2 81 BoxColFill
> +1.000 1059 319 2 63 BoxColFill
> +1.000 1061 319 1 72 BoxColFill
> +1.000 1062 319 2 72 BoxColFill
> +1.000 1064 319 1 72 BoxColFill
> +1.000 1065 319 2 36 BoxColFill
> +1.000 1067 319 1 90 BoxColFill
> +1.000 1068 319 2 90 BoxColFill
> +1.000 1069 319 2 63 BoxColFill
> +1.000 1071 319 2 45 BoxColFill
> +1.000 1072 319 2 45 BoxColFill
> +1.000 1074 319 2 72 BoxColFill
> +1.000 1075 319 2 63 BoxColFill
> +1.000 1077 319 2 99 BoxColFill
> +1.000 1078 319 2 54 BoxColFill
> +1.000 1080 319 1 45 BoxColFill
> +1.000 1081 319 2 99 BoxColFill
> +1.000 1083 319 1 81 BoxColFill
> +1.000 1084 319 2 116 BoxColFill
> +1.000 1086 319 1 45 BoxColFill
> +1.000 1087 319 2 28 BoxColFill
> +1.000 1088 319 2 63 BoxColFill
> +1.000 1090 319 2 28 BoxColFill
> +1.000 1091 319 2 45 BoxColFill
> +1.000 1093 319 2 107 BoxColFill
> +1.000 1094 319 2 125 BoxColFill
> +1.000 1096 319 1 81 BoxColFill
> +1.000 1097 319 2 116 BoxColFill
> +1.000 1099 319 1 90 BoxColFill
> +1.000 1100 319 2 107 BoxColFill
> +1.000 1102 319 1 81 BoxColFill
> +1.000 1103 319 2 63 BoxColFill
> +1.000 1104 319 2 107 BoxColFill
> +1.000 1106 319 2 134 BoxColFill
> +1.000 1107 319 2 72 BoxColFill
> +1.000 1109 319 2 99 BoxColFill
> +1.000 1110 319 2 63 BoxColFill
> +1.000 1112 319 2 116 BoxColFill
> +1.000 1113 319 2 107 BoxColFill
> +1.000 1115 319 1 116 BoxColFill
> +1.000 1116 319 2 45 BoxColFill
> +1.000 1118 319 1 54 BoxColFill
> +1.000 1119 319 2 107 BoxColFill
> +1.000 1121 319 1 72 BoxColFill
> +1.000 1122 319 2 125 BoxColFill
> +1.000 1123 319 2 107 BoxColFill
> +1.000 1125 319 2 90 BoxColFill
> +1.000 1126 319 2 54 BoxColFill
> +1.000 1128 319 2 99 BoxColFill
> +1.000 1129 319 2 116 BoxColFill
> +1.000 1131 319 1 99 BoxColFill
> +1.000 1132 319 2 161 BoxColFill
> +1.000 1134 319 1 107 BoxColFill
> +1.000 1135 319 2 116 BoxColFill
> +1.000 1137 319 1 107 BoxColFill
> +1.000 1138 319 2 90 BoxColFill
> +1.000 1139 319 2 125 BoxColFill
> +1.000 1141 319 2 107 BoxColFill
> +1.000 1142 319 2 125 BoxColFill
> +1.000 1144 319 2 187 BoxColFill
> +1.000 1145 319 2 134 BoxColFill
> +1.000 1147 319 1 107 BoxColFill
> +1.000 1148 319 2 143 BoxColFill
> +1.000 1150 319 1 116 BoxColFill
> +1.000 1151 319 2 90 BoxColFill
> +1.000 1153 319 1 99 BoxColFill
> +1.000 1154 319 2 116 BoxColFill
> +1.000 1156 319 1 196 BoxColFill
> +1.000 1157 319 2 107 BoxColFill
> +1.000 1158 319 2 134 BoxColFill
> +1.000 1160 319 2 116 BoxColFill
> +1.000 1161 319 2 99 BoxColFill
> +1.000 1163 319 2 99 BoxColFill
> +1.000 1164 319 2 152 BoxColFill
> +1.000 1166 319 1 134 BoxColFill
> +1.000 1167 319 2 63 BoxColFill
> +1.000 1169 319 1 116 BoxColFill
> +1.000 1170 319 2 196 BoxColFill
> +1.000 1172 319 1 99 BoxColFill
> +1.000 1173 319 2 81 BoxColFill
> +1.000 1174 319 2 99 BoxColFill
> +1.000 1176 319 2 125 BoxColFill
> +1.000 1177 319 2 116 BoxColFill
> +1.000 1179 319 2 99 BoxColFill
> +1.000 1180 319 2 161 BoxColFill
> +1.000 1182 319 1 125 BoxColFill
> +1.000 1183 319 2 178 BoxColFill
> +1.000 1185 319 1 116 BoxColFill
> +1.000 1186 319 2 90 BoxColFill
> +1.000 1188 319 1 99 BoxColFill
> +1.000 1189 319 2 134 BoxColFill
> +1.000 1191 319 1 125 BoxColFill
> +1.000 1192 319 2 143 BoxColFill
> +1.000 1193 319 2 90 BoxColFill
> +1.000 1195 319 2 99 BoxColFill
> +1.000 1196 319 2 196 BoxColFill
> +1.000 1198 319 2 134 BoxColFill
> +1.000 1199 319 2 178 BoxColFill
> +1.000 1201 319 1 125 BoxColFill
> +1.000 1202 319 2 90 BoxColFill
> +1.000 1204 319 1 125 BoxColFill
> +1.000 1205 319 2 143 BoxColFill
> +1.000 1207 319 1 223 BoxColFill
> +1.000 1208 319 2 143 BoxColFill
> +1.000 1209 319 2 107 BoxColFill
> +1.000 1211 319 2 169 BoxColFill
> +1.000 1212 319 2 134 BoxColFill
> +1.000 1214 319 2 187 BoxColFill
> +1.000 1215 319 2 187 BoxColFill
> +1.000 1217 319 1 152 BoxColFill
> +1.000 1218 319 2 161 BoxColFill
> +1.000 1220 319 1 116 BoxColFill
> +1.000 1221 319 2 125 BoxColFill
> +1.000 1223 319 1 143 BoxColFill
> +1.000 1224 319 2 161 BoxColFill
> +1.000 1225 319 2 214 BoxColFill
> +1.000 1227 319 2 232 BoxColFill
> +1.000 1228 319 2 152 BoxColFill
> +1.000 1230 319 2 178 BoxColFill
> +1.000 1231 319 2 116 BoxColFill
> +1.000 1233 319 2 152 BoxColFill
> +1.000 1234 319 2 196 BoxColFill
> +1.000 1236 319 1 143 BoxColFill
> +1.000 1237 319 2 187 BoxColFill
> +1.000 1239 319 1 134 BoxColFill
> +1.000 1240 319 2 90 BoxColFill
> +1.000 1242 319 1 81 BoxColFill
> +1.000 1243 319 2 125 BoxColFill
> +1.000 1244 319 2 196 BoxColFill
> +1.000 1246 319 2 276 BoxColFill
> +1.000 1247 319 2 258 BoxColFill
> +1.000 1249 319 2 143 BoxColFill
> +1.000 1250 319 2 178 BoxColFill
> +1.000 1252 319 1 240 BoxColFill
> +1.000 1253 319 2 178 BoxColFill
> +1.000 1255 319 1 223 BoxColFill
> +1.000 1256 319 2 249 BoxColFill
> +1.000 1258 319 1 205 BoxColFill
> +1.000 1259 319 2 205 BoxColFill
> +1.000 1260 319 2 240 BoxColFill
> +1.000 1262 319 2 196 BoxColFill
> +1.000 1263 319 2 187 BoxColFill
> +1.000 1265 319 2 161 BoxColFill
> +1.000 1266 319 2 249 BoxColFill
> +1.000 1268 319 2 152 BoxColFill
> +1.000 1269 319 2 178 BoxColFill
> +1.000 1271 319 1 152 BoxColFill
> +1.000 1272 319 2 223 BoxColFill
> +1.000 1274 319 1 161 BoxColFill
> +1.000 1275 319 2 187 BoxColFill
> +1.000 1277 319 1 232 BoxColFill
> +1.000 1278 319 2 152 BoxColFill
> +1.000 1279 319 2 187 BoxColFill
> +1.000 1281 319 2 232 BoxColFill
> +1.000 1282 319 2 240 BoxColFill
> +1.000 1284 319 2 258 BoxColFill
> +1.000 1285 319 2 178 BoxColFill
> +1.000 1287 319 1 152 BoxColFill
> +1.000 1288 319 2 258 BoxColFill
> +1.000 1290 319 1 187 BoxColFill
> +1.000 1291 319 2 134 BoxColFill
> +1.000 1293 319 1 267 BoxColFill
> +1.000 1294 319 2 249 BoxColFill
> +1.000 1295 319 2 249 BoxColFill
> +1.000 1297 319 2 240 BoxColFill
> +1.000 1298 319 2 276 BoxColFill
> +1.000 1300 319 2 178 BoxColFill
> +1.000 1301 319 2 311 BoxColFill
> +1.000 1303 319 2 302 BoxColFill
> +1.000 1304 319 2 223 BoxColFill
> +1.000 1306 319 1 223 BoxColFill
> +1.000 1307 319 2 161 BoxColFill
> +1.000 1309 319 1 196 BoxColFill
> +1.000 1310 319 2 294 BoxColFill
> +1.000 1312 319 1 329 BoxColFill
> +1.000 1313 319 2 267 BoxColFill
> +1.000 1314 319 2 214 BoxColFill
> +1.000 1316 319 2 240 BoxColFill
> +1.000 1317 319 2 276 BoxColFill
> +1.000 1319 319 2 285 BoxColFill
> +1.000 1320 319 2 329 BoxColFill
> +1.000 1322 319 1 294 BoxColFill
> +1.000 1323 319 2 249 BoxColFill
> +1.000 1325 319 1 214 BoxColFill
> +1.000 1326 319 2 267 BoxColFill
> +1.000 1328 319 1 223 BoxColFill
> +1.000 1329 319 2 294 BoxColFill
> +1.000 1330 319 2 276 BoxColFill
> +1.000 1332 319 2 294 BoxColFill
> +1.000 1333 319 2 338 BoxColFill
> +1.000 1335 319 2 276 BoxColFill
> +1.000 1336 319 2 223 BoxColFill
> +1.000 1338 319 1 223 BoxColFill
> +1.000 1339 319 2 285 BoxColFill
> +1.000 1341 319 1 302 BoxColFill
> +1.000 1342 319 2 249 BoxColFill
> +1.000 1344 319 1 276 BoxColFill
> +1.000 1345 319 2 161 BoxColFill
> +1.000 1347 319 1 285 BoxColFill
> +1.000 1348 319 2 373 BoxColFill
> +1.000 1349 319 2 320 BoxColFill
> +1.000 1351 319 2 258 BoxColFill
> +1.000 1352 319 2 356 BoxColFill
> +1.000 1354 319 2 232 BoxColFill
> +1.000 1355 319 2 267 BoxColFill
> +1.000 1357 319 1 214 BoxColFill
> +1.000 1358 319 2 249 BoxColFill
> +1.000 1360 319 1 276 BoxColFill
> +1.000 1361 319 2 302 BoxColFill
> +1.000 1363 319 1 365 BoxColFill
> +1.000 1364 319 2 285 BoxColFill
> +1.000 1365 319 2 329 BoxColFill
> +1.000 1367 319 2 365 BoxColFill
> +1.000 1368 319 2 391 BoxColFill
> +1.000 1370 319 2 311 BoxColFill
> +1.000 1371 319 2 249 BoxColFill
> +1.000 1373 319 1 294 BoxColFill
> +1.000 1374 319 2 285 BoxColFill
> +1.000 1376 319 1 276 BoxColFill
> +1.000 1377 319 2 347 BoxColFill
> +1.000 1379 319 1 347 BoxColFill
> +1.000 1380 319 2 329 BoxColFill
> +1.000 1382 319 1 418 BoxColFill
> +1.000 1383 319 2 320 BoxColFill
> +1.000 1384 319 2 365 BoxColFill
> +1.000 1386 319 2 382 BoxColFill
> +1.000 1387 319 2 320 BoxColFill
> +1.000 1389 319 2 267 BoxColFill
> +1.000 1390 319 2 258 BoxColFill
> +1.000 1392 319 1 311 BoxColFill
> +1.000 1393 319 2 409 BoxColFill
> +1.000 1395 319 1 444 BoxColFill
> +1.000 1396 319 2 356 BoxColFill
> +1.000 1398 319 1 311 BoxColFill
> +1.000 1399 319 2 365 BoxColFill
> +1.000 1400 319 2 276 BoxColFill
> +1.000 1402 319 2 391 BoxColFill
> +1.000 1403 319 2 302 BoxColFill
> +1.000 1405 319 2 365 BoxColFill
> +1.000 1406 319 2 320 BoxColFill
> +1.000 1408 319 1 356 BoxColFill
> +1.000 1409 319 2 320 BoxColFill
> +1.000 1411 319 1 391 BoxColFill
> +1.000 1412 319 2 365 BoxColFill
> +1.000 1414 319 1 347 BoxColFill
> +1.000 1415 319 2 400 BoxColFill
> +1.000 1416 319 2 533 BoxColFill
> +1.000 1418 319 2 356 BoxColFill
> +1.000 1419 319 2 276 BoxColFill
> +1.000 1421 319 2 276 BoxColFill
> +1.000 1422 319 2 444 BoxColFill
> +1.000 1424 319 2 427 BoxColFill
> +1.000 1425 319 2 480 BoxColFill
> +1.000 1427 319 1 400 BoxColFill
> +1.000 1428 319 2 453 BoxColFill
> +1.000 1430 319 1 498 BoxColFill
> +1.000 1431 319 2 435 BoxColFill
> +1.000 1433 319 1 435 BoxColFill
> +1.000 1434 319 2 453 BoxColFill
> +1.000 1435 319 2 471 BoxColFill
> +1.000 1437 319 2 373 BoxColFill
> +1.000 1438 319 2 453 BoxColFill
> +1.000 1440 319 2 489 BoxColFill
> +1.000 1441 319 2 462 BoxColFill
> +1.000 1443 319 1 347 BoxColFill
> +1.000 1444 319 2 489 BoxColFill
> +1.000 1446 319 1 524 BoxColFill
> +1.000 1447 319 2 435 BoxColFill
> +1.000 1449 319 1 444 BoxColFill
> +1.000 1450 319 2 551 BoxColFill
> +1.000 1451 319 2 498 BoxColFill
> +1.000 1453 319 2 453 BoxColFill
> +1.000 1454 319 2 489 BoxColFill
> +1.000 1456 319 2 462 BoxColFill
> +1.000 1457 319 2 444 BoxColFill
> +1.000 1459 319 2 427 BoxColFill
> +1.000 1460 319 2 631 BoxColFill
> +1.000 1462 319 1 400 BoxColFill
> +1.000 1463 319 2 515 BoxColFill
> +1.000 1465 319 1 480 BoxColFill
> +1.000 1466 319 2 444 BoxColFill
> +1.000 1468 319 1 365 BoxColFill
> +1.000 1469 319 2 498 BoxColFill
> +1.000 1470 319 2 418 BoxColFill
> +1.000 1472 319 2 524 BoxColFill
> +1.000 1473 319 2 586 BoxColFill
> +1.000 1475 319 2 435 BoxColFill
> +1.000 1476 319 2 586 BoxColFill
> +1.000 1478 319 1 595 BoxColFill
> +1.000 1479 319 2 551 BoxColFill
> +1.000 1481 319 1 471 BoxColFill
> +1.000 1482 319 2 400 BoxColFill
> +1.000 1484 319 1 489 BoxColFill
> +1.000 1485 319 2 622 BoxColFill
> +1.000 1486 319 2 489 BoxColFill
> +1.000 1488 319 2 480 BoxColFill
> +1.000 1489 319 2 560 BoxColFill
> +1.000 1491 319 2 577 BoxColFill
> +1.000 1492 319 2 524 BoxColFill
> +1.000 1494 319 1 577 BoxColFill
> +1.000 1495 319 2 551 BoxColFill
> +1.000 1497 319 1 524 BoxColFill
> +1.000 1498 319 2 639 BoxColFill
> +1.000 1500 319 1 568 BoxColFill
> +1.000 1501 319 2 471 BoxColFill
> +1.000 1503 319 1 480 BoxColFill
> +1.000 1504 319 2 560 BoxColFill
> +1.000 1505 319 2 586 BoxColFill
> +1.000 1507 319 2 577 BoxColFill
> +1.000 1508 319 2 684 BoxColFill
> +1.000 1510 319 2 506 BoxColFill
> +1.000 1511 319 2 693 BoxColFill
> +1.000 1513 319 1 764 BoxColFill
> +1.000 1514 319 2 595 BoxColFill
> +1.000 1516 319 1 498 BoxColFill
> +1.000 1517 319 2 719 BoxColFill
> +1.000 1519 319 1 595 BoxColFill
> +1.000 1520 319 2 551 BoxColFill
> +1.000 1521 319 2 542 BoxColFill
> +1.000 1523 319 2 666 BoxColFill
> +1.000 1524 319 2 604 BoxColFill
> +1.000 1526 319 2 524 BoxColFill
> +1.000 1527 319 2 675 BoxColFill
> +1.000 1529 319 1 533 BoxColFill
> +1.000 1530 319 2 524 BoxColFill
> +1.000 1532 319 1 586 BoxColFill
> +1.000 1533 319 2 489 BoxColFill
> +1.000 1535 319 1 684 BoxColFill
> +1.000 1536 319 2 560 BoxColFill
> +1.000 1538 319 1 471 BoxColFill
> +1.000 1539 319 2 719 BoxColFill
> +1.000 1540 319 2 710 BoxColFill
> +1.000 1542 319 2 719 BoxColFill
> +1.000 1543 319 2 613 BoxColFill
> +1.000 1545 319 2 551 BoxColFill
> +1.000 1546 319 2 675 BoxColFill
> +1.000 1548 319 1 631 BoxColFill
> +1.000 1549 319 2 506 BoxColFill
> +1.000 1551 319 1 613 BoxColFill
> +1.000 1552 319 2 772 BoxColFill
> +1.000 1554 319 1 932 BoxColFill
> +1.000 1555 319 2 719 BoxColFill
> +1.000 1556 319 2 746 BoxColFill
> +1.000 1558 319 2 790 BoxColFill
> +1.000 1559 319 2 577 BoxColFill
> +1.000 1561 319 2 666 BoxColFill
> +1.000 1562 319 2 622 BoxColFill
> +1.000 1564 319 1 719 BoxColFill
> +1.000 1565 319 2 648 BoxColFill
> +1.000 1567 319 1 639 BoxColFill
> +1.000 1568 319 2 577 BoxColFill
> +1.000 1570 319 1 781 BoxColFill
> +1.000 1571 319 2 702 BoxColFill
> +1.000 1573 319 1 639 BoxColFill
> +1.000 1574 319 2 666 BoxColFill
> +1.000 1575 319 2 675 BoxColFill
> +1.000 1577 319 2 684 BoxColFill
> +1.000 1578 319 2 675 BoxColFill
> +1.000 1580 319 2 790 BoxColFill
> +1.000 1581 319 2 648 BoxColFill
> +1.000 1583 319 1 808 BoxColFill
> +1.000 1584 319 2 710 BoxColFill
> +1.000 1586 319 1 702 BoxColFill
> +1.000 1587 319 2 702 BoxColFill
> +1.000 1589 319 1 888 BoxColFill
> +1.000 1590 319 2 613 BoxColFill
> +1.000 1591 319 2 666 BoxColFill
> +1.000 1593 319 2 808 BoxColFill
> +1.000 1594 319 2 897 BoxColFill
> +1.000 1596 319 2 808 BoxColFill
> +1.000 1597 319 2 799 BoxColFill
> +1.000 1599 319 1 666 BoxColFill
> +1.000 1600 319 2 586 BoxColFill
> +1.000 1602 319 1 622 BoxColFill
> +1.000 1603 319 2 799 BoxColFill
> +1.000 1605 319 1 808 BoxColFill
> +1.000 1606 319 2 577 BoxColFill
> +1.000 1607 319 2 808 BoxColFill
> +1.000 1609 319 2 790 BoxColFill
> +1.000 1610 319 2 843 BoxColFill
> +1.000 1612 319 2 817 BoxColFill
> +1.000 1613 319 2 746 BoxColFill
> +1.000 1615 319 2 888 BoxColFill
> +1.000 1616 319 2 702 BoxColFill
> +1.000 1618 319 1 843 BoxColFill
> +1.000 1619 319 2 808 BoxColFill
> +1.000 1621 319 1 817 BoxColFill
> +1.000 1622 319 2 843 BoxColFill
> +1.000 1624 319 1 568 BoxColFill
> +1.000 1625 319 2 728 BoxColFill
> +1.000 1626 319 2 790 BoxColFill
> +1.000 1628 319 2 781 BoxColFill
> +1.000 1629 319 2 737 BoxColFill
> +1.000 1631 319 2 755 BoxColFill
> +1.000 1632 319 2 755 BoxColFill
> +1.000 1634 319 1 941 BoxColFill
> +1.000 1635 319 2 817 BoxColFill
> +1.000 1637 319 1 577 BoxColFill
> +1.000 1638 319 2 648 BoxColFill
> +1.000 1640 319 1 941 BoxColFill
> +1.000 1641 319 2 905 BoxColFill
> +1.000 1642 319 2 737 BoxColFill
> +1.000 1644 319 2 675 BoxColFill
> +1.000 1645 319 2 843 BoxColFill
> +1.000 1647 319 2 799 BoxColFill
> +1.000 1648 319 2 622 BoxColFill
> +1.000 1650 319 2 772 BoxColFill
> +1.000 1651 319 2 843 BoxColFill
> +1.000 1653 319 1 728 BoxColFill
> +1.000 1654 319 2 799 BoxColFill
> +1.000 1656 319 1 817 BoxColFill
> +1.000 1657 319 2 666 BoxColFill
> +1.000 1659 319 1 799 BoxColFill
> +1.000 1660 319 2 914 BoxColFill
> +1.000 1661 319 2 790 BoxColFill
> +1.000 1663 319 2 772 BoxColFill
> +1.000 1664 319 2 932 BoxColFill
> +1.000 1666 319 2 648 BoxColFill
> +1.000 1667 319 2 852 BoxColFill
> +1.000 1669 319 1 870 BoxColFill
> +1.000 1670 319 2 870 BoxColFill
> +1.000 1672 319 1 755 BoxColFill
> +1.000 1673 319 2 870 BoxColFill
> +1.000 1675 319 1 941 BoxColFill
> +1.000 1676 319 2 728 BoxColFill
> +1.000 1677 319 2 781 BoxColFill
> +1.000 1679 319 2 781 BoxColFill
> +1.000 1680 319 2 790 BoxColFill
> +1.000 1682 319 2 808 BoxColFill
> +1.000 1683 319 2 888 BoxColFill
> +1.000 1685 319 1 826 BoxColFill
> +1.000 1686 319 2 923 BoxColFill
> +1.000 1688 319 1 808 BoxColFill
> +1.000 1689 319 2 835 BoxColFill
> +1.000 1691 319 1 861 BoxColFill
> +1.000 1692 319 2 808 BoxColFill
> +1.000 1694 319 1 852 BoxColFill
> +1.000 1695 319 2 1030 BoxColFill
> +1.000 1696 319 2 843 BoxColFill
> +1.000 1698 319 2 728 BoxColFill
> +1.000 1699 319 2 923 BoxColFill
> +1.000 1701 319 2 888 BoxColFill
> +1.000 1702 319 2 772 BoxColFill
> +1.000 1704 319 1 923 BoxColFill
> +1.000 1705 319 2 932 BoxColFill
> +1.000 1707 319 1 817 BoxColFill
> +1.000 1708 319 2 781 BoxColFill
> +1.000 1710 319 1 781 BoxColFill
> +1.000 1711 319 2 879 BoxColFill
> +1.000 1712 319 2 914 BoxColFill
> +1.000 1714 319 2 923 BoxColFill
> +1.000 1715 319 2 755 BoxColFill
> +1.000 1717 319 2 835 BoxColFill
> +1.000 1718 319 2 950 BoxColFill
> +1.000 1720 319 1 950 BoxColFill
> +1.000 1721 319 2 870 BoxColFill
> +1.000 1723 319 1 959 BoxColFill
> +1.000 1724 319 2 897 BoxColFill
> +1.000 1726 319 1 888 BoxColFill
> +1.000 1727 319 2 914 BoxColFill
> +1.000 1729 319 1 985 BoxColFill
> +1.000 1730 319 2 719 BoxColFill
> +1.000 1731 319 2 897 BoxColFill
> +1.000 1733 319 2 879 BoxColFill
> +1.000 1734 319 2 808 BoxColFill
> +1.000 1736 319 2 914 BoxColFill
> +1.000 1737 319 2 879 BoxColFill
> +1.000 1739 319 1 923 BoxColFill
> +1.000 1740 319 2 861 BoxColFill
> +1.000 1742 319 1 1012 BoxColFill
> +1.000 1743 319 2 923 BoxColFill
> +1.000 1745 319 1 879 BoxColFill
> +1.000 1746 319 2 968 BoxColFill
> +1.000 1747 319 2 861 BoxColFill
> +1.000 1749 319 2 861 BoxColFill
> +1.000 1750 319 2 737 BoxColFill
> +1.000 1752 319 2 843 BoxColFill
> +1.000 1753 319 2 932 BoxColFill
> +1.000 1755 319 1 1074 BoxColFill
> +1.000 1756 319 2 852 BoxColFill
> +1.000 1758 319 1 879 BoxColFill
> +1.000 1759 319 2 976 BoxColFill
> +1.000 1761 319 1 950 BoxColFill
> +1.000 1762 319 2 950 BoxColFill
> +1.000 1763 319 2 888 BoxColFill
> +1.000 1765 319 2 737 BoxColFill
> +1.000 1766 319 2 861 BoxColFill
> +1.000 1768 319 2 808 BoxColFill
> +1.000 1769 319 2 870 BoxColFill
> +1.000 1771 319 2 905 BoxColFill
> +1.000 1772 319 2 861 BoxColFill
> +1.000 1774 319 1 852 BoxColFill
> +1.000 1775 319 2 932 BoxColFill
> +1.000 1777 319 1 923 BoxColFill
> +1.000 1778 319 2 781 BoxColFill
> +1.000 1780 319 1 852 BoxColFill
> +1.000 1781 319 2 852 BoxColFill
> +1.000 1782 319 2 852 BoxColFill
> +1.000 1784 319 2 923 BoxColFill
> +1.000 1785 319 2 888 BoxColFill
> +1.000 1787 319 2 941 BoxColFill
> +1.000 1788 319 2 852 BoxColFill
> +1.000 1790 319 1 772 BoxColFill
> +1.000 1791 319 2 879 BoxColFill
> +1.000 1793 319 1 941 BoxColFill
> +1.000 1794 319 2 764 BoxColFill
> +1.000 1796 319 1 826 BoxColFill
> +1.000 1797 319 2 905 BoxColFill
> +1.000 1798 319 2 905 BoxColFill
> +1.000 1800 319 2 950 BoxColFill
> +1.000 1801 319 2 870 BoxColFill
> +1.000 1803 319 2 923 BoxColFill
> +1.000 1804 319 2 950 BoxColFill
> +1.000 1806 319 2 817 BoxColFill
> +1.000 1807 319 2 808 BoxColFill
> +1.000 1809 319 1 1003 BoxColFill
> +1.000 1810 319 2 968 BoxColFill
> +1.000 1812 319 1 959 BoxColFill
> +1.000 1813 319 2 941 BoxColFill
> +1.000 1815 319 1 1065 BoxColFill
> +1.000 1816 319 2 852 BoxColFill
> +1.000 1817 319 2 959 BoxColFill
> +1.000 1819 319 2 905 BoxColFill
> +1.000 1820 319 2 1154 BoxColFill
> +1.000 1822 319 2 710 BoxColFill
> +1.000 1823 319 2 808 BoxColFill
> +1.000 1825 319 1 994 BoxColFill
> +1.000 1826 319 2 994 BoxColFill
> +1.000 1828 319 1 923 BoxColFill
> +1.000 1829 319 2 1056 BoxColFill
> +1.000 1831 319 1 843 BoxColFill
> +1.000 1832 319 2 1038 BoxColFill
> +1.000 1833 319 2 888 BoxColFill
> +1.000 1835 319 2 817 BoxColFill
> +1.000 1836 319 2 790 BoxColFill
> +1.000 1838 319 2 852 BoxColFill
> +1.000 1839 319 2 1092 BoxColFill
> +1.000 1841 319 2 843 BoxColFill
> +1.000 1842 319 2 781 BoxColFill
> +1.000 1844 319 1 985 BoxColFill
> +1.000 1845 319 2 764 BoxColFill
> +1.000 1847 319 1 861 BoxColFill
> +1.000 1848 319 2 737 BoxColFill
> +1.000 1850 319 1 817 BoxColFill
> +1.000 1851 319 2 941 BoxColFill
> +1.000 1852 319 2 843 BoxColFill
> +1.000 1854 319 2 1003 BoxColFill
> +1.000 1855 319 2 914 BoxColFill
> +1.000 1857 319 2 959 BoxColFill
> +1.000 1858 319 2 852 BoxColFill
> +1.000 1860 319 1 799 BoxColFill
> +1.000 1861 319 2 914 BoxColFill
> +1.000 1863 319 1 799 BoxColFill
> +1.000 1864 319 2 914 BoxColFill
> +1.000 1866 319 1 905 BoxColFill
> +1.000 1867 319 2 835 BoxColFill
> +1.000 1868 319 2 888 BoxColFill
> +1.000 1870 319 2 790 BoxColFill
> +1.000 1871 319 2 843 BoxColFill
> +1.000 1873 319 2 755 BoxColFill
> +1.000 1874 319 2 781 BoxColFill
> +1.000 1876 319 1 914 BoxColFill
> +1.000 1877 319 2 817 BoxColFill
> +1.000 1879 319 1 985 BoxColFill
> +1.000 1880 319 2 702 BoxColFill
> +1.000 1882 319 1 861 BoxColFill
> +1.000 1883 319 2 772 BoxColFill
> +1.000 1885 319 1 861 BoxColFill
> +1.000 1886 319 2 852 BoxColFill
> +1.000 1887 319 2 684 BoxColFill
> +1.000 1889 319 2 772 BoxColFill
> +1.000 1890 319 2 781 BoxColFill
> +1.000 1892 319 2 923 BoxColFill
> +1.000 1893 319 2 888 BoxColFill
> +1.000 1895 319 1 905 BoxColFill
> +1.000 1896 319 2 790 BoxColFill
> +1.000 1898 319 1 817 BoxColFill
> +1.000 1899 319 2 826 BoxColFill
> +1.000 1901 319 1 719 BoxColFill
> +1.000 1902 319 2 923 BoxColFill
> +1.000 1903 319 2 799 BoxColFill
> +1.000 1905 319 2 968 BoxColFill
> +1.000 1906 319 2 1021 BoxColFill
> +1.000 1908 319 2 799 BoxColFill
> +1.000 1909 319 2 835 BoxColFill
> +1.000 1911 319 1 675 BoxColFill
> +1.000 1912 319 2 808 BoxColFill
> +1.000 1914 319 1 817 BoxColFill
> +1.000 1915 319 2 879 BoxColFill
> +1.000 1917 319 1 1030 BoxColFill
> +1.000 1918 319 2 826 BoxColFill
> +1.000 1920 319 1 755 BoxColFill
> +1.000 1921 319 2 755 BoxColFill
> +1.000 1922 319 2 746 BoxColFill
> +1.000 1924 319 2 879 BoxColFill
> +1.000 1925 319 2 728 BoxColFill
> +1.000 1927 319 2 728 BoxColFill
> +1.000 1928 319 2 861 BoxColFill
> +1.000 1930 319 1 772 BoxColFill
> +1.000 1931 319 2 985 BoxColFill
> +1.000 1933 319 1 799 BoxColFill
> +1.000 1934 319 2 826 BoxColFill
> +1.000 1936 319 1 905 BoxColFill
> +1.000 1937 319 2 737 BoxColFill
> +1.000 1938 319 2 799 BoxColFill
> +1.000 1940 319 2 852 BoxColFill
> +1.000 1941 319 2 702 BoxColFill
> +1.000 1943 319 2 914 BoxColFill
> +1.000 1944 319 2 781 BoxColFill
> +1.000 1946 319 1 835 BoxColFill
> +1.000 1947 319 2 764 BoxColFill
> +1.000 1949 319 1 755 BoxColFill
> +1.000 1950 319 2 755 BoxColFill
> +1.000 1952 319 1 799 BoxColFill
> +1.000 1953 319 2 817 BoxColFill
> +1.000 1954 319 2 950 BoxColFill
> +1.000 1956 319 2 710 BoxColFill
> +1.000 1957 319 2 923 BoxColFill
> +1.000 1959 319 2 861 BoxColFill
> +1.000 1960 319 2 799 BoxColFill
> +1.000 1962 319 2 941 BoxColFill
> +1.000 1963 319 2 888 BoxColFill
> +1.000 1965 319 1 1030 BoxColFill
> +1.000 1966 319 2 852 BoxColFill
> +1.000 1968 319 1 702 BoxColFill
> +1.000 1969 319 2 657 BoxColFill
> +1.000 1971 319 1 861 BoxColFill
> +1.000 1972 319 2 843 BoxColFill
> +1.000 1973 319 2 772 BoxColFill
> +1.000 1975 319 2 710 BoxColFill
> +1.000 1976 319 2 772 BoxColFill
> +1.000 1978 319 2 976 BoxColFill
> +1.000 1979 319 2 772 BoxColFill
> +1.000 1981 319 1 817 BoxColFill
> +1.000 1982 319 2 826 BoxColFill
> +1.000 1984 319 1 976 BoxColFill
> +1.000 1985 319 2 826 BoxColFill
> +1.000 1987 319 1 772 BoxColFill
> +1.000 1988 319 2 684 BoxColFill
> +1.000 1989 319 2 631 BoxColFill
> +1.000 1991 319 2 737 BoxColFill
> +1.000 1992 319 2 772 BoxColFill
> +1.000 1994 319 2 755 BoxColFill
> +1.000 1995 319 2 755 BoxColFill
> +1.000 1997 319 2 684 BoxColFill
> +1.000 1998 319 2 666 BoxColFill
> +1.000 2000 319 1 728 BoxColFill
> +1.000 2001 319 2 648 BoxColFill
> +1.000 2003 319 1 843 BoxColFill
> +1.000 2004 319 2 702 BoxColFill
> +1.000 2006 319 1 577 BoxColFill
> +1.000 2007 319 2 631 BoxColFill
> +1.000 2008 319 2 817 BoxColFill
> +1.000 2010 319 2 905 BoxColFill
> +1.000 2011 319 2 719 BoxColFill
> +1.000 2013 319 2 790 BoxColFill
> +1.000 2014 319 2 551 BoxColFill
> +1.000 2016 319 1 843 BoxColFill
> +1.000 2017 319 2 746 BoxColFill
> +1.000 2019 319 1 932 BoxColFill
> +1.000 2020 319 2 799 BoxColFill
> +1.000 2022 319 1 728 BoxColFill
> +1.000 2023 319 2 675 BoxColFill
> +1.000 2024 319 2 737 BoxColFill
> +1.000 2026 319 2 631 BoxColFill
> +1.000 2027 319 2 595 BoxColFill
> +1.000 2029 319 2 755 BoxColFill
> +1.000 2030 319 2 622 BoxColFill
> +1.000 2032 319 2 675 BoxColFill
> +1.000 2033 319 2 737 BoxColFill
> +1.000 2035 319 1 702 BoxColFill
> +1.000 2036 319 2 666 BoxColFill
> +1.000 2038 319 1 639 BoxColFill
> +1.000 2039 319 2 577 BoxColFill
> +1.000 2041 319 1 808 BoxColFill
> +1.000 2042 319 2 648 BoxColFill
> +1.000 2043 319 2 648 BoxColFill
> +1.000 2045 319 2 772 BoxColFill
> +1.000 2046 319 2 719 BoxColFill
> +1.000 2048 319 2 560 BoxColFill
> +1.000 2049 319 2 755 BoxColFill
> +1.000 2051 319 1 631 BoxColFill
> +1.000 2052 319 2 799 BoxColFill
> +1.000 2054 319 1 843 BoxColFill
> +1.000 2055 319 2 693 BoxColFill
> +1.000 2057 319 1 728 BoxColFill
> +1.000 2058 319 2 781 BoxColFill
> +1.000 2059 319 2 631 BoxColFill
> +1.000 2061 319 2 622 BoxColFill
> +1.000 2062 319 2 595 BoxColFill
> +1.000 2064 319 2 781 BoxColFill
> +1.000 2065 319 2 666 BoxColFill
> +1.000 2067 319 1 622 BoxColFill
> +1.000 2068 319 2 684 BoxColFill
> +1.000 2070 319 1 631 BoxColFill
> +1.000 2071 319 2 817 BoxColFill
> +1.000 2073 319 1 737 BoxColFill
> +1.000 2074 319 2 693 BoxColFill
> +1.000 2076 319 1 693 BoxColFill
> +1.000 2077 319 2 728 BoxColFill
> +1.000 2078 319 2 613 BoxColFill
> +1.000 2080 319 2 489 BoxColFill
> +1.000 2081 319 2 639 BoxColFill
> +1.000 2083 319 2 577 BoxColFill
> +1.000 2084 319 2 568 BoxColFill
> +1.000 2086 319 1 728 BoxColFill
> +1.000 2087 319 2 595 BoxColFill
> +1.000 2089 319 1 542 BoxColFill
> +1.000 2090 319 2 799 BoxColFill
> +1.000 2092 319 1 684 BoxColFill
> +1.000 2093 319 2 684 BoxColFill
> +1.000 2094 319 2 577 BoxColFill
> +1.000 2096 319 2 568 BoxColFill
> +1.000 2097 319 2 506 BoxColFill
> +1.000 2099 319 2 542 BoxColFill
> +1.000 2100 319 2 586 BoxColFill
> +1.000 2102 319 1 781 BoxColFill
> +1.000 2103 319 2 568 BoxColFill
> +1.000 2105 319 1 648 BoxColFill
> +1.000 2106 319 2 604 BoxColFill
> +1.000 2108 319 1 728 BoxColFill
> +1.000 2109 319 2 604 BoxColFill
> +1.000 2111 319 1 533 BoxColFill
> +1.000 2112 319 2 657 BoxColFill
> +1.000 2113 319 2 489 BoxColFill
> +1.000 2115 319 2 577 BoxColFill
> +1.000 2116 319 2 498 BoxColFill
> +1.000 2118 319 2 719 BoxColFill
> +1.000 2119 319 2 595 BoxColFill
> +1.000 2121 319 1 657 BoxColFill
> +1.000 2122 319 2 498 BoxColFill
> +1.000 2124 319 1 746 BoxColFill
> +1.000 2125 319 2 622 BoxColFill
> +1.000 2127 319 1 657 BoxColFill
> +1.000 2128 319 2 648 BoxColFill
> +1.000 2129 319 2 480 BoxColFill
> +1.000 2131 319 2 462 BoxColFill
> +1.000 2132 319 2 666 BoxColFill
> +1.000 2134 319 2 666 BoxColFill
> +1.000 2135 319 2 515 BoxColFill
> +1.000 2137 319 1 551 BoxColFill
> +1.000 2138 319 2 560 BoxColFill
> +1.000 2140 319 1 542 BoxColFill
> +1.000 2141 319 2 524 BoxColFill
> +1.000 2143 319 1 666 BoxColFill
> +1.000 2144 319 2 533 BoxColFill
> +1.000 2145 319 2 506 BoxColFill
> +1.000 2147 319 2 462 BoxColFill
> +1.000 2148 319 2 506 BoxColFill
> +1.000 2150 319 2 568 BoxColFill
> +1.000 2151 319 2 471 BoxColFill
> +1.000 2153 319 2 462 BoxColFill
> +1.000 2154 319 2 365 BoxColFill
> +1.000 2156 319 1 489 BoxColFill
> +1.000 2157 319 2 684 BoxColFill
> +1.000 2159 319 1 622 BoxColFill
> +1.000 2160 319 2 489 BoxColFill
> +1.000 2162 319 1 533 BoxColFill
> +1.000 2163 319 2 435 BoxColFill
> +1.000 2164 319 2 480 BoxColFill
> +1.000 2166 319 2 524 BoxColFill
> +1.000 2167 319 2 551 BoxColFill
> +1.000 2169 319 2 693 BoxColFill
> +1.000 2170 319 2 595 BoxColFill
> +1.000 2172 319 1 365 BoxColFill
> +1.000 2173 319 2 515 BoxColFill
> +1.000 2175 319 1 515 BoxColFill
> +1.000 2176 319 2 444 BoxColFill
> +1.000 2178 319 1 480 BoxColFill
> +1.000 2179 319 2 409 BoxColFill
> +1.000 2180 319 2 453 BoxColFill
> +1.000 2182 319 2 435 BoxColFill
> +1.000 2183 319 2 533 BoxColFill
> +1.000 2185 319 2 409 BoxColFill
> +1.000 2186 319 2 480 BoxColFill
> +1.000 2188 319 2 506 BoxColFill
> +1.000 2189 319 2 365 BoxColFill
> +1.000 2191 319 1 444 BoxColFill
> +1.000 2192 319 2 568 BoxColFill
> +1.000 2194 319 1 409 BoxColFill
> +1.000 2195 319 2 462 BoxColFill
> +1.000 2197 319 1 400 BoxColFill
> +1.000 2198 319 2 365 BoxColFill
> +1.000 2199 319 2 391 BoxColFill
> +1.000 2201 319 2 347 BoxColFill
> +1.000 2202 319 2 462 BoxColFill
> +1.000 2204 319 2 498 BoxColFill
> +1.000 2205 319 2 498 BoxColFill
> +1.000 2207 319 1 365 BoxColFill
> +1.000 2208 319 2 391 BoxColFill
> +1.000 2210 319 1 471 BoxColFill
> +1.000 2211 319 2 418 BoxColFill
> +1.000 2213 319 1 409 BoxColFill
> +1.000 2214 319 2 338 BoxColFill
> +1.000 2215 319 2 382 BoxColFill
> +1.000 2217 319 2 444 BoxColFill
> +1.000 2218 319 2 435 BoxColFill
> +1.000 2220 319 2 382 BoxColFill
> +1.000 2221 319 2 302 BoxColFill
> +1.000 2223 319 1 356 BoxColFill
> +1.000 2224 319 2 400 BoxColFill
> +1.000 2226 319 1 453 BoxColFill
> +1.000 2227 319 2 365 BoxColFill
> +1.000 2229 319 1 338 BoxColFill
> +1.000 2230 319 2 365 BoxColFill
> +1.000 2232 319 1 435 BoxColFill
> +1.000 2233 319 2 329 BoxColFill
> +1.000 2234 319 2 311 BoxColFill
> +1.000 2236 319 2 347 BoxColFill
> +1.000 2237 319 2 471 BoxColFill
> +1.000 2239 319 2 249 BoxColFill
> +1.000 2240 319 2 338 BoxColFill
> +1.000 2242 319 1 373 BoxColFill
> +1.000 2243 319 2 232 BoxColFill
> +1.000 2245 319 1 356 BoxColFill
> +1.000 2246 319 2 365 BoxColFill
> +1.000 2248 319 1 347 BoxColFill
> +1.000 2249 319 2 435 BoxColFill
> +1.000 2250 319 2 365 BoxColFill
> +1.000 2252 319 2 196 BoxColFill
> +1.000 2253 319 2 329 BoxColFill
> +1.000 2255 319 2 329 BoxColFill
> +1.000 2256 319 2 356 BoxColFill
> +1.000 2258 319 1 285 BoxColFill
> +1.000 2259 319 2 258 BoxColFill
> +1.000 2261 319 1 267 BoxColFill
> +1.000 2262 319 2 187 BoxColFill
> +1.000 2264 319 1 329 BoxColFill
> +1.000 2265 319 2 302 BoxColFill
> +1.000 2267 319 1 249 BoxColFill
> +1.000 2268 319 2 249 BoxColFill
> +1.000 2269 319 2 205 BoxColFill
> +1.000 2271 319 2 267 BoxColFill
> +1.000 2272 319 2 276 BoxColFill
> +1.000 2274 319 2 240 BoxColFill
> +1.000 2275 319 2 205 BoxColFill
> +1.000 2277 319 1 391 BoxColFill
> +1.000 2278 319 2 240 BoxColFill
> +1.000 2280 319 1 258 BoxColFill
> +1.000 2281 319 2 205 BoxColFill
> +1.000 2283 319 1 240 BoxColFill
> +1.000 2284 319 2 249 BoxColFill
> +1.000 2285 319 2 178 BoxColFill
> +1.000 2287 319 2 267 BoxColFill
> +1.000 2288 319 2 267 BoxColFill
> +1.000 2290 319 2 764 BoxColFill
> +1.000 2291 319 2 1242 BoxColFill
> +1.000 2293 319 1 276 BoxColFill
> +1.000 2294 319 2 134 BoxColFill
> +1.000 2296 319 1 90 BoxColFill
> +1.000 2297 319 2 249 BoxColFill
> +1.000 2299 319 1 240 BoxColFill
> +1.000 2300 319 2 134 BoxColFill
> +1.000 2302 319 1 152 BoxColFill
> +1.000 2303 319 2 169 BoxColFill
> +1.000 2304 319 2 187 BoxColFill
> +1.000 2306 319 2 196 BoxColFill
> +1.000 2307 319 2 187 BoxColFill
> +1.000 2309 319 2 214 BoxColFill
> +1.000 2310 319 2 223 BoxColFill
> +1.000 2312 319 1 187 BoxColFill
> +1.000 2313 319 2 125 BoxColFill
> +1.000 2315 319 1 125 BoxColFill
> +1.000 2316 319 2 196 BoxColFill
> +1.000 2318 319 1 205 BoxColFill
> +1.000 2319 319 2 258 BoxColFill
> +1.000 2320 319 2 178 BoxColFill
> +1.000 2322 319 2 187 BoxColFill
> +1.000 2323 319 2 152 BoxColFill
> +1.000 2325 319 2 169 BoxColFill
> +1.000 2326 319 2 134 BoxColFill
> +1.000 2328 319 1 161 BoxColFill
> +1.000 2329 319 2 125 BoxColFill
> +1.000 2331 319 1 161 BoxColFill
> +1.000 2332 319 2 187 BoxColFill
> +1.000 2334 319 1 143 BoxColFill
> +1.000 2335 319 2 63 BoxColFill
> +1.000 2336 319 2 72 BoxColFill
> +1.000 2338 319 2 90 BoxColFill
> +1.000 2339 319 2 99 BoxColFill
> +1.000 2341 319 2 99 BoxColFill
> +1.000 2342 319 2 72 BoxColFill
> +1.000 2344 319 2 125 BoxColFill
> +1.000 2345 319 2 125 BoxColFill
> +1.000 2347 319 1 143 BoxColFill
> +1.000 2348 319 2 45 BoxColFill
> +1.000 2350 319 1 107 BoxColFill
> +1.000 2351 319 2 107 BoxColFill
> +1.000 2353 319 1 107 BoxColFill
> +1.000 2354 319 2 72 BoxColFill
> +1.000 2355 319 2 161 BoxColFill
> +1.000 2357 319 2 72 BoxColFill
> +1.000 2358 319 2 116 BoxColFill
> +1.000 2360 319 2 45 BoxColFill
> +1.000 2361 319 2 99 BoxColFill
> +1.000 2363 319 1 36 BoxColFill
> +1.000 2364 319 2 45 BoxColFill
> +1.000 2366 319 1 63 BoxColFill
> +1.000 2367 319 2 90 BoxColFill
> +1.000 2369 319 1 81 BoxColFill
> +1.000 2370 319 2 63 BoxColFill
> +1.000 2371 319 2 90 BoxColFill
> +1.000 2373 319 2 72 BoxColFill
> +1.000 2374 319 2 63 BoxColFill
> +1.000 2376 319 2 72 BoxColFill
> +1.000 2377 319 2 45 BoxColFill
> +1.000 2379 319 2 81 BoxColFill
> +1.000 2380 319 2 54 BoxColFill
> +1.000 2382 319 1 63 BoxColFill
> +1.000 2383 319 2 19 BoxColFill
> +1.000 2385 319 1 45 BoxColFill
> +1.000 2386 319 2 54 BoxColFill
> +1.000 2388 319 1 54 BoxColFill
> +1.000 2389 319 2 45 BoxColFill
> +1.000 2390 319 2 28 BoxColFill
> +1.000 2392 319 2 54 BoxColFill
> +1.000 2393 319 2 28 BoxColFill
> +1.000 2395 319 2 81 BoxColFill
> +1.000 2396 319 2 36 BoxColFill
> +1.000 2398 319 1 28 BoxColFill
> +1.000 2399 319 2 28 BoxColFill
> +1.000 2401 319 1 54 BoxColFill
> +1.000 2402 319 2 36 BoxColFill
> +1.000 2404 319 1 116 BoxColFill
> +1.000 2405 319 2 54 BoxColFill
> +1.000 2406 319 2 63 BoxColFill
> +1.000 2408 319 2 28 BoxColFill
> +1.000 2409 319 2 36 BoxColFill
> +1.000 2411 319 2 36 BoxColFill
> +1.000 2412 319 2 28 BoxColFill
> +1.000 2414 319 1 28 BoxColFill
> +1.000 2415 319 2 45 BoxColFill
> +1.000 2417 319 1 28 BoxColFill
> +1.000 2418 319 2 28 BoxColFill
> +1.000 2420 319 1 19 BoxColFill
> +1.000 2421 319 2 72 BoxColFill
> +1.000 2423 319 1 36 BoxColFill
> +1.000 2424 319 2 10 BoxColFill
> +1.000 2425 319 2 10 BoxColFill
> +1.000 2427 319 2 63 BoxColFill
> +1.000 2428 319 2 36 BoxColFill
> +1.000 2430 319 2 28 BoxColFill
> +1.000 2431 319 2 19 BoxColFill
> +1.000 2433 319 1 63 BoxColFill
> +1.000 2434 319 2 28 BoxColFill
> +1.000 2436 319 1 36 BoxColFill
> +1.000 2437 319 2 19 BoxColFill
> +1.000 2439 319 1 19 BoxColFill
> +1.000 2440 319 2 28 BoxColFill
> +1.000 2441 319 2 19 BoxColFill
> +1.000 2443 319 2 10 BoxColFill
> +1.000 2444 319 2 19 BoxColFill
> +1.000 2446 319 2 19 BoxColFill
> +1.000 2447 319 2 63 BoxColFill
> +1.000 2449 319 1 28 BoxColFill
> +1.000 2450 319 2 19 BoxColFill
> +1.000 2452 319 1 28 BoxColFill
> +1.000 2453 319 2 54 BoxColFill
> +1.000 2455 319 1 45 BoxColFill
> +1.000 2456 319 2 45 BoxColFill
> +1.000 2458 319 1 28 BoxColFill
> +1.000 2459 319 2 45 BoxColFill
> +1.000 2462 319 2 36 BoxColFill
> +1.000 2463 319 2 45 BoxColFill
> +1.000 2465 319 2 28 BoxColFill
> +1.000 2466 319 2 28 BoxColFill
> +1.000 2468 319 1 28 BoxColFill
> +1.000 2469 319 2 72 BoxColFill
> +1.000 2471 319 1 36 BoxColFill
> +1.000 2472 319 2 28 BoxColFill
> +1.000 2474 319 1 36 BoxColFill
> +1.000 2475 319 2 10 BoxColFill
> +1.000 2476 319 2 36 BoxColFill
> +1.000 2478 319 2 36 BoxColFill
> +1.000 2479 319 2 10 BoxColFill
> +1.000 2481 319 2 10 BoxColFill
> +1.000 2482 319 2 28 BoxColFill
> +1.000 2485 319 2 10 BoxColFill
> +1.000 2487 319 1 19 BoxColFill
> +1.000 2488 319 2 19 BoxColFill
> +1.000 2490 319 1 28 BoxColFill
> +1.000 2491 319 2 28 BoxColFill
> +1.000 2492 319 2 19 BoxColFill
> +1.000 2494 319 2 28 BoxColFill
> +1.000 2495 319 2 10 BoxColFill
> +1.000 2497 319 2 36 BoxColFill
> +1.000 2498 319 2 28 BoxColFill
> +1.000 2500 319 2 10 BoxColFill
> +1.000 2501 319 2 19 BoxColFill
> +1.000 2503 319 1 10 BoxColFill
> +1.000 2504 319 2 45 BoxColFill
> +1.000 2506 319 1 10 BoxColFill
> +1.000 2509 319 1 19 BoxColFill
> +1.000 2510 319 2 36 BoxColFill
> +1.000 2511 319 2 19 BoxColFill
> +1.000 2513 319 2 10 BoxColFill
> +1.000 2514 319 2 19 BoxColFill
> +1.000 2516 319 2 19 BoxColFill
> +1.000 2517 319 2 28 BoxColFill
> +1.000 2519 319 1 45 BoxColFill
> +1.000 2520 319 2 54 BoxColFill
> +1.000 2522 319 1 10 BoxColFill
> +1.000 2523 319 2 10 BoxColFill
> +1.000 2525 319 1 19 BoxColFill
> +1.000 2526 319 2 19 BoxColFill
> +1.000 2527 319 2 10 BoxColFill
> +1.000 2529 319 2 10 BoxColFill
> +1.000 2532 319 2 36 BoxColFill
> +1.000 2533 319 2 19 BoxColFill
> +1.000 2535 319 2 19 BoxColFill
> +1.000 2536 319 2 19 BoxColFill
> +1.000 2538 319 1 19 BoxColFill
> +1.000 2541 319 1 10 BoxColFill
> +1.000 2542 319 2 19 BoxColFill
> +1.000 2544 319 1 28 BoxColFill
> +1.000 2545 319 2 10 BoxColFill
> +1.000 2546 319 2 10 BoxColFill
> +1.000 2548 319 2 19 BoxColFill
> +1.000 2552 319 2 10 BoxColFill
> +1.000 2554 319 1 10 BoxColFill
> +1.000 2557 319 1 10 BoxColFill
> +1.000 2558 319 2 28 BoxColFill
> +1.000 2560 319 1 10 BoxColFill
> +1.000 2561 319 2 10 BoxColFill
> +1.000 2562 319 2 54 BoxColFill
> +1.000 2564 319 2 36 BoxColFill
> +1.000 2565 319 2 10 BoxColFill
> +1.000 2567 319 2 19 BoxColFill
> +1.000 2571 319 2 36 BoxColFill
> +1.000 2573 319 1 19 BoxColFill
> +1.000 2574 319 2 19 BoxColFill
> +1.000 2576 319 1 19 BoxColFill
> +1.000 2577 319 2 19 BoxColFill
> +1.000 2580 319 2 28 BoxColFill
> +1.000 2581 319 2 28 BoxColFill
> +1.000 2584 319 2 10 BoxColFill
> +1.000 2586 319 2 10 BoxColFill
> +1.000 2589 319 1 10 BoxColFill
> +1.000 2590 319 2 19 BoxColFill
> +1.000 2592 319 1 28 BoxColFill
> +1.000 2595 319 1 10 BoxColFill
> +1.000 2596 319 2 10 BoxColFill
> +1.000 2597 319 2 10 BoxColFill
> +1.000 2599 319 2 10 BoxColFill
> +1.000 2600 319 2 19 BoxColFill
> +1.000 2602 319 2 10 BoxColFill
> +1.000 2603 319 2 19 BoxColFill
> +1.000 2606 319 2 10 BoxColFill
> +1.000 2609 319 2 10 BoxColFill
> +1.000 2612 319 2 10 BoxColFill
> +1.000 2615 319 2 10 BoxColFill
> +1.000 2619 319 2 10 BoxColFill
> +1.000 2621 319 2 19 BoxColFill
> +1.000 2622 319 2 10 BoxColFill
> +1.000 2624 319 1 10 BoxColFill
>  % End plot #1
>  2.000 UL
>  LTb
> @@ -2579,11 +3536,11 @@ LCb setrgbcolor
>  1.000 UL
>  LTB
>  LCb setrgbcolor
> -392 1720 N
> -392 256 L
> -2235 0 V
> -0 1464 V
> --2235 0 V
> +440 1720 N
> +440 319 L
> +2187 0 V
> +0 1401 V
> +-2187 0 V
>  Z stroke
>  1.000 UP
>  1.000 UL
> diff --git a/CodeSamples/cpu/data/fre.eps b/CodeSamples/cpu/data/fre.eps
> index bc17dfba..00600638 100644
> --- a/CodeSamples/cpu/data/fre.eps
> +++ b/CodeSamples/cpu/data/fre.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: fre.eps
>  %%Creator: gnuplot 5.4 patchlevel 2
> -%%CreationDate: Tue Jan 30 09:04:30 2024
> +%%CreationDate: Sun Feb  4 08:55:38 2024
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 327 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jan 30 09:04:30 2024)
> +  /CreationDate (Sun Feb  4 08:55:38 2024)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1917,12 +1917,12 @@ BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> +440 319 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 256 M
> +392 319 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -1930,72 +1930,72 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 465 M
> +440 519 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 465 M
> +392 519 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.05)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 674 M
> +440 719 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 674 M
> +392 719 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.1)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 883 M
> +440 919 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 883 M
> +392 919 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.15)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1093 M
> +440 1120 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1093 M
> +392 1120 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.2)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1302 M
> +440 1320 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1302 M
> +392 1320 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.25)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1511 M
> +440 1520 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1511 M
> +392 1520 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2014,10 +2014,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> -0 63 V
> -0 1401 R
> +440 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  440 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-200)]
> @@ -2026,10 +2026,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -877 256 M
> -0 63 V
> -0 1401 R
> +877 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  877 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-150)]
> @@ -2038,10 +2038,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1315 256 M
> -0 63 V
> -0 1401 R
> +1315 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1315 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-100)]
> @@ -2050,10 +2050,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1752 256 M
> -0 63 V
> -0 1401 R
> +1752 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1752 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-50)]
> @@ -2062,10 +2062,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2190 256 M
> -0 63 V
> -0 1401 R
> +2190 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2190 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
> @@ -2074,10 +2074,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2627 256 M
> -0 63 V
> -0 1401 R
> +2627 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2627 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 50)]
> @@ -2089,15 +2089,15 @@ LCb setrgbcolor
>  1.000 UL
>  LTa
>  LCb setrgbcolor
> -2190 256 M
> -0 1464 V
> +2190 319 M
> +0 1401 V
>  stroke
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> @@ -2105,7 +2105,7 @@ Z stroke
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -76 988 M
> +76 1019 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Frequency \(arb. unit\))]
>  ] -26.7 MCshow
> @@ -2122,762 +2122,132 @@ LTb
>  1.000 UL
>  LTb
>  0.58 0.00 0.83 C
> -440 256 N
> -0 5 V
> -9 0 V
> -0 -5 V
> --9 0 V
> -Z stroke
> -449 256 N
> -0 4 V
> -17 0 V
> -0 -4 V
> --17 0 V
> -Z stroke
> -466 256 N
> -0 2 V
> -18 0 V
> -0 -2 V
> --18 0 V
> -Z stroke
> -484 256 N
> -0 11 V
> -17 0 V
> -0 -11 V
> --17 0 V
> -Z stroke
> -501 256 N
> -0 7 V
> -18 0 V
> -0 -7 V
> --18 0 V
> -Z stroke
> -519 256 N
> -0 7 V
> -17 0 V
> -0 -7 V
> --17 0 V
> -Z stroke
> -536 256 N
> -0 16 V
> -18 0 V
> -0 -16 V
> --18 0 V
> -Z stroke
> -554 256 N
> -0 31 V
> -17 0 V
> -0 -31 V
> --17 0 V
> -Z stroke
> -571 256 N
> -0 30 V
> -18 0 V
> -0 -30 V
> --18 0 V
> -Z stroke
> -589 256 N
> -0 52 V
> -17 0 V
> -0 -52 V
> --17 0 V
> -Z stroke
> -606 256 N
> -0 62 V
> -18 0 V
> -0 -62 V
> --18 0 V
> -Z stroke
> -624 256 N
> -0 79 V
> -17 0 V
> -0 -79 V
> --17 0 V
> -Z stroke
> -641 256 N
> -0 116 V
> -18 0 V
> -0 -116 V
> --18 0 V
> -Z stroke
> -659 256 N
> -0 143 V
> -17 0 V
> -0 -143 V
> --17 0 V
> -Z stroke
> -676 256 N
> -0 125 V
> -18 0 V
> -0 -125 V
> --18 0 V
> -Z stroke
> -694 256 N
> -0 183 V
> -17 0 V
> -0 -183 V
> --17 0 V
> -Z stroke
> -711 256 N
> -0 224 V
> -18 0 V
> -0 -224 V
> --18 0 V
> -Z stroke
> -729 256 N
> -0 266 V
> -17 0 V
> -0 -266 V
> --17 0 V
> -Z stroke
> -746 256 N
> -0 295 V
> -18 0 V
> -0 -295 V
> --18 0 V
> -Z stroke
> -764 256 N
> -0 331 V
> -17 0 V
> -0 -331 V
> --17 0 V
> -Z stroke
> -781 256 N
> -0 379 V
> -18 0 V
> -0 -379 V
> --18 0 V
> -Z stroke
> -799 256 N
> -0 393 V
> -17 0 V
> -0 -393 V
> --17 0 V
> -Z stroke
> -816 256 N
> -0 428 V
> -18 0 V
> -0 -428 V
> --18 0 V
> -Z stroke
> -834 256 N
> -0 490 V
> -17 0 V
> -0 -490 V
> --17 0 V
> -Z stroke
> -851 256 N
> -0 520 V
> -18 0 V
> -0 -520 V
> --18 0 V
> -Z stroke
> -869 256 N
> -0 550 V
> -17 0 V
> -0 -550 V
> --17 0 V
> -Z stroke
> -886 256 N
> -0 542 V
> -18 0 V
> -0 -542 V
> --18 0 V
> -Z stroke
> -904 256 N
> -0 589 V
> -17 0 V
> -0 -589 V
> --17 0 V
> -Z stroke
> -921 256 N
> -0 639 V
> -18 0 V
> -0 -639 V
> --18 0 V
> -Z stroke
> -939 256 N
> -0 608 V
> -17 0 V
> -0 -608 V
> --17 0 V
> -Z stroke
> -956 256 N
> -0 684 V
> -18 0 V
> -0 -684 V
> --18 0 V
> -Z stroke
> -974 256 N
> -0 659 V
> -17 0 V
> -0 -659 V
> --17 0 V
> -Z stroke
> -991 256 N
> -0 644 V
> -18 0 V
> -0 -644 V
> --18 0 V
> -Z stroke
> -1009 256 N
> -0 645 V
> -17 0 V
> -0 -645 V
> --17 0 V
> -Z stroke
> -1026 256 N
> -0 678 V
> -18 0 V
> -0 -678 V
> --18 0 V
> -Z stroke
> -1044 256 N
> -0 738 V
> -17 0 V
> -0 -738 V
> --17 0 V
> -Z stroke
> -1061 256 N
> -0 683 V
> -18 0 V
> -0 -683 V
> --18 0 V
> -Z stroke
> -1079 256 N
> -0 685 V
> -17 0 V
> -0 -685 V
> --17 0 V
> -Z stroke
> -1096 256 N
> -0 625 V
> -18 0 V
> -0 -625 V
> --18 0 V
> -Z stroke
> -1114 256 N
> -0 679 V
> -17 0 V
> -0 -679 V
> --17 0 V
> -Z stroke
> -1131 256 N
> -0 657 V
> -18 0 V
> -0 -657 V
> --18 0 V
> -Z stroke
> -1149 256 N
> -0 711 V
> -17 0 V
> -0 -711 V
> --17 0 V
> -Z stroke
> -1166 256 N
> -0 722 V
> -18 0 V
> -0 -722 V
> --18 0 V
> -Z stroke
> -1184 256 N
> -0 644 V
> -17 0 V
> -0 -644 V
> --17 0 V
> -Z stroke
> -1201 256 N
> -0 646 V
> -18 0 V
> -0 -646 V
> --18 0 V
> -Z stroke
> -1219 256 N
> -0 683 V
> -17 0 V
> -0 -683 V
> --17 0 V
> -Z stroke
> -1236 256 N
> -0 693 V
> -18 0 V
> -0 -693 V
> --18 0 V
> -Z stroke
> -1254 256 N
> -0 733 V
> -17 0 V
> -0 -733 V
> --17 0 V
> -Z stroke
> -1271 256 N
> -0 824 V
> -18 0 V
> -0 -824 V
> --18 0 V
> -Z stroke
> -1289 256 N
> -0 798 V
> -17 0 V
> -0 -798 V
> --17 0 V
> -Z stroke
> -1306 256 N
> -0 816 V
> -18 0 V
> -0 -816 V
> --18 0 V
> -Z stroke
> -1324 256 N
> -0 877 V
> -17 0 V
> -0 -877 V
> --17 0 V
> -Z stroke
> -1341 256 N
> -0 939 V
> -18 0 V
> -0 -939 V
> --18 0 V
> -Z stroke
> -1359 256 N
> -0 971 V
> -17 0 V
> -0 -971 V
> --17 0 V
> -Z stroke
> -1376 256 N
> -0 957 V
> -18 0 V
> -0 -957 V
> --18 0 V
> -Z stroke
> -1394 256 N
> -0 1096 V
> -17 0 V
> -0 -1096 V
> --17 0 V
> -Z stroke
> -1411 256 N
> -0 1117 V
> -18 0 V
> -0 -1117 V
> --18 0 V
> -Z stroke
> -1429 256 N
> -0 1182 V
> -17 0 V
> -0 -1182 V
> --17 0 V
> -Z stroke
> -1446 256 N
> -0 1272 V
> -18 0 V
> -0 -1272 V
> --18 0 V
> -Z stroke
> -1464 256 N
> -0 1308 V
> -17 0 V
> -0 -1308 V
> --17 0 V
> -Z stroke
> -1481 256 N
> -0 1352 V
> -18 0 V
> -0 -1352 V
> --18 0 V
> -Z stroke
> -1499 256 N
> -0 1329 V
> -17 0 V
> -0 -1329 V
> --17 0 V
> -Z stroke
> -1516 256 N
> -0 1420 V
> -18 0 V
> -0 -1420 V
> --18 0 V
> -Z stroke
> -1534 256 N
> -0 1380 V
> -17 0 V
> -0 -1380 V
> --17 0 V
> -Z stroke
> -1551 256 N
> -0 1379 V
> -17 0 V
> -0 -1379 V
> --17 0 V
> -Z stroke
> -1568 256 N
> -0 1417 V
> -18 0 V
> -0 -1417 V
> --18 0 V
> -Z stroke
> -1586 256 N
> -0 1370 V
> -17 0 V
> -0 -1370 V
> --17 0 V
> -Z stroke
> -1603 256 N
> -0 1434 V
> -18 0 V
> -0 -1434 V
> --18 0 V
> -Z stroke
> -1621 256 N
> -0 1414 V
> -17 0 V
> -0 -1414 V
> --17 0 V
> -Z stroke
> -1638 256 N
> -0 1278 V
> -18 0 V
> -0 -1278 V
> --18 0 V
> -Z stroke
> -1656 256 N
> -0 1285 V
> -17 0 V
> -0 -1285 V
> --17 0 V
> -Z stroke
> -1673 256 N
> -0 1240 V
> -18 0 V
> -0 -1240 V
> --18 0 V
> -Z stroke
> -1691 256 N
> -0 1189 V
> -17 0 V
> -0 -1189 V
> --17 0 V
> -Z stroke
> -1708 256 N
> -0 1169 V
> -18 0 V
> -0 -1169 V
> --18 0 V
> -Z stroke
> -1726 256 N
> -0 1104 V
> -17 0 V
> -0 -1104 V
> --17 0 V
> -Z stroke
> -1743 256 N
> -0 1055 V
> -18 0 V
> -0 -1055 V
> --18 0 V
> -Z stroke
> -1761 256 N
> -0 981 V
> -17 0 V
> -0 -981 V
> --17 0 V
> -Z stroke
> -1778 256 N
> -0 919 V
> -18 0 V
> -0 -919 V
> --18 0 V
> -Z stroke
> -1796 256 N
> -0 909 V
> -17 0 V
> -0 -909 V
> --17 0 V
> -Z stroke
> -1813 256 N
> -0 831 V
> -18 0 V
> -0 -831 V
> --18 0 V
> -Z stroke
> -1831 256 N
> -0 784 V
> -17 0 V
> -0 -784 V
> --17 0 V
> -Z stroke
> -1848 256 N
> -0 712 V
> -18 0 V
> -0 -712 V
> --18 0 V
> -Z stroke
> -1866 256 N
> -0 743 V
> -17 0 V
> -0 -743 V
> --17 0 V
> -Z stroke
> -1883 256 N
> -0 689 V
> -18 0 V
> -0 -689 V
> --18 0 V
> -Z stroke
> -1901 256 N
> -0 640 V
> -17 0 V
> -0 -640 V
> --17 0 V
> -Z stroke
> -1918 256 N
> -0 668 V
> -18 0 V
> -0 -668 V
> --18 0 V
> -Z stroke
> -1936 256 N
> -0 667 V
> -17 0 V
> -0 -667 V
> --17 0 V
> -Z stroke
> -1953 256 N
> -0 746 V
> -18 0 V
> -0 -746 V
> --18 0 V
> -Z stroke
> -1971 256 N
> -0 700 V
> -17 0 V
> -0 -700 V
> --17 0 V
> -Z stroke
> -1988 256 N
> -0 784 V
> -18 0 V
> -0 -784 V
> --18 0 V
> -Z stroke
> -2006 256 N
> -0 780 V
> -17 0 V
> -0 -780 V
> --17 0 V
> -Z stroke
> -2023 256 N
> -0 854 V
> -18 0 V
> -0 -854 V
> --18 0 V
> -Z stroke
> -2041 256 N
> -0 906 V
> -17 0 V
> -0 -906 V
> --17 0 V
> -Z stroke
> -2058 256 N
> -0 900 V
> -18 0 V
> -0 -900 V
> --18 0 V
> -Z stroke
> -2076 256 N
> -0 888 V
> -17 0 V
> -0 -888 V
> --17 0 V
> -Z stroke
> -2093 256 N
> -0 994 V
> -18 0 V
> -0 -994 V
> --18 0 V
> -Z stroke
> -2111 256 N
> -0 935 V
> -17 0 V
> -0 -935 V
> --17 0 V
> -Z stroke
> -2128 256 N
> -0 908 V
> -18 0 V
> -0 -908 V
> --18 0 V
> -Z stroke
> -2146 256 N
> -0 927 V
> -17 0 V
> -0 -927 V
> --17 0 V
> -Z stroke
> -2163 256 N
> -0 758 V
> -18 0 V
> -0 -758 V
> --18 0 V
> -Z stroke
> -2181 256 N
> -0 855 V
> -17 0 V
> -0 -855 V
> --17 0 V
> -Z stroke
> -2198 256 N
> -0 852 V
> -18 0 V
> -0 -852 V
> --18 0 V
> -Z stroke
> -2216 256 N
> -0 830 V
> -17 0 V
> -0 -830 V
> --17 0 V
> -Z stroke
> -2233 256 N
> -0 808 V
> -18 0 V
> -0 -808 V
> --18 0 V
> -Z stroke
> -2251 256 N
> -0 820 V
> -17 0 V
> -0 -820 V
> --17 0 V
> -Z stroke
> -2268 256 N
> -0 752 V
> -18 0 V
> -0 -752 V
> --18 0 V
> -Z stroke
> -2286 256 N
> -0 729 V
> -17 0 V
> -0 -729 V
> --17 0 V
> -Z stroke
> -2303 256 N
> -0 711 V
> -18 0 V
> -0 -711 V
> --18 0 V
> -Z stroke
> -2321 256 N
> -0 671 V
> -17 0 V
> -0 -671 V
> --17 0 V
> -Z stroke
> -2338 256 N
> -0 626 V
> -18 0 V
> -0 -626 V
> --18 0 V
> -Z stroke
> -2356 256 N
> -0 528 V
> -17 0 V
> -0 -528 V
> --17 0 V
> -Z stroke
> -2373 256 N
> -0 455 V
> -18 0 V
> -0 -455 V
> --18 0 V
> -Z stroke
> -2391 256 N
> -0 468 V
> -17 0 V
> -0 -468 V
> --17 0 V
> -Z stroke
> -2408 256 N
> -0 326 V
> -18 0 V
> -0 -326 V
> --18 0 V
> -Z stroke
> -2426 256 N
> -0 268 V
> -17 0 V
> -0 -268 V
> --17 0 V
> -Z stroke
> -2443 256 N
> -0 211 V
> -18 0 V
> -0 -211 V
> --18 0 V
> -Z stroke
> -2461 256 N
> -0 160 V
> -17 0 V
> -0 -160 V
> --17 0 V
> -Z stroke
> -2478 256 N
> -0 139 V
> -18 0 V
> -0 -139 V
> --18 0 V
> -Z stroke
> -2496 256 N
> -0 179 V
> -17 0 V
> -0 -179 V
> --17 0 V
> -Z stroke
> -2513 256 N
> -0 95 V
> -18 0 V
> -0 -95 V
> --18 0 V
> -Z stroke
> -2531 256 N
> -0 43 V
> -17 0 V
> -0 -43 V
> --17 0 V
> -Z stroke
> -2548 256 N
> -0 36 V
> -18 0 V
> -0 -36 V
> --18 0 V
> -Z stroke
> -2566 256 N
> -0 33 V
> -17 0 V
> -0 -33 V
> --17 0 V
> -Z stroke
> -2583 256 N
> -0 35 V
> -18 0 V
> -0 -35 V
> --18 0 V
> -Z stroke
> -2601 256 N
> -0 16 V
> -17 0 V
> -0 -16 V
> --17 0 V
> -Z stroke
> -2618 256 N
> -0 19 V
> -9 0 V
> -0 -19 V
> --9 0 V
> -Z stroke
> +1.000 440 319 5 6 BoxColFill
> +1.000 453 319 10 5 BoxColFill
> +1.000 471 319 9 3 BoxColFill
> +1.000 488 319 10 11 BoxColFill
> +1.000 506 319 9 8 BoxColFill
> +1.000 523 319 10 8 BoxColFill
> +1.000 541 319 9 16 BoxColFill
> +1.000 558 319 10 30 BoxColFill
> +1.000 576 319 9 29 BoxColFill
> +1.000 593 319 10 51 BoxColFill
> +1.000 611 319 9 61 BoxColFill
> +1.000 628 319 10 77 BoxColFill
> +1.000 646 319 9 112 BoxColFill
> +1.000 663 319 10 138 BoxColFill
> +1.000 681 319 9 121 BoxColFill
> +1.000 698 319 10 176 BoxColFill
> +1.000 716 319 9 216 BoxColFill
> +1.000 733 319 10 255 BoxColFill
> +1.000 751 319 9 284 BoxColFill
> +1.000 768 319 10 318 BoxColFill
> +1.000 786 319 9 364 BoxColFill
> +1.000 803 319 10 377 BoxColFill
> +1.000 821 319 9 410 BoxColFill
> +1.000 838 319 10 470 BoxColFill
> +1.000 856 319 9 499 BoxColFill
> +1.000 873 319 10 527 BoxColFill
> +1.000 891 319 9 520 BoxColFill
> +1.000 908 319 10 564 BoxColFill
> +1.000 926 319 9 612 BoxColFill
> +1.000 943 319 10 583 BoxColFill
> +1.000 961 319 9 656 BoxColFill
> +1.000 978 319 10 631 BoxColFill
> +1.000 995 319 10 617 BoxColFill
> +1.000 1013 319 10 618 BoxColFill
> +1.000 1030 319 10 650 BoxColFill
> +1.000 1048 319 10 707 BoxColFill
> +1.000 1065 319 10 655 BoxColFill
> +1.000 1083 319 10 657 BoxColFill
> +1.000 1100 319 10 599 BoxColFill
> +1.000 1118 319 10 651 BoxColFill
> +1.000 1135 319 10 629 BoxColFill
> +1.000 1153 319 10 681 BoxColFill
> +1.000 1170 319 10 692 BoxColFill
> +1.000 1188 319 10 617 BoxColFill
> +1.000 1205 319 10 619 BoxColFill
> +1.000 1223 319 10 655 BoxColFill
> +1.000 1240 319 10 664 BoxColFill
> +1.000 1258 319 10 702 BoxColFill
> +1.000 1275 319 10 789 BoxColFill
> +1.000 1293 319 10 765 BoxColFill
> +1.000 1310 319 10 782 BoxColFill
> +1.000 1328 319 10 840 BoxColFill
> +1.000 1345 319 10 900 BoxColFill
> +1.000 1363 319 10 930 BoxColFill
> +1.000 1380 319 10 917 BoxColFill
> +1.000 1398 319 10 1050 BoxColFill
> +1.000 1415 319 10 1070 BoxColFill
> +1.000 1433 319 10 1132 BoxColFill
> +1.000 1450 319 10 1218 BoxColFill
> +1.000 1468 319 10 1253 BoxColFill
> +1.000 1485 319 10 1295 BoxColFill
> +1.000 1503 319 10 1273 BoxColFill
> +1.000 1520 319 10 1360 BoxColFill
> +1.000 1538 319 10 1321 BoxColFill
> +1.000 1555 319 10 1320 BoxColFill
> +1.000 1573 319 10 1357 BoxColFill
> +1.000 1590 319 10 1312 BoxColFill
> +1.000 1608 319 10 1373 BoxColFill
> +1.000 1625 319 10 1354 BoxColFill
> +1.000 1643 319 10 1224 BoxColFill
> +1.000 1660 319 10 1230 BoxColFill
> +1.000 1678 319 10 1188 BoxColFill
> +1.000 1695 319 10 1139 BoxColFill
> +1.000 1713 319 10 1120 BoxColFill
> +1.000 1730 319 10 1058 BoxColFill
> +1.000 1748 319 10 1010 BoxColFill
> +1.000 1765 319 10 939 BoxColFill
> +1.000 1783 319 10 881 BoxColFill
> +1.000 1800 319 10 870 BoxColFill
> +1.000 1818 319 10 797 BoxColFill
> +1.000 1835 319 10 751 BoxColFill
> +1.000 1853 319 10 682 BoxColFill
> +1.000 1870 319 10 712 BoxColFill
> +1.000 1888 319 10 661 BoxColFill
> +1.000 1905 319 10 613 BoxColFill
> +1.000 1923 319 10 640 BoxColFill
> +1.000 1940 319 10 639 BoxColFill
> +1.000 1958 319 10 714 BoxColFill
> +1.000 1975 319 10 671 BoxColFill
> +1.000 1993 319 10 751 BoxColFill
> +1.000 2010 319 10 748 BoxColFill
> +1.000 2028 319 10 818 BoxColFill
> +1.000 2045 319 10 868 BoxColFill
> +1.000 2063 319 10 862 BoxColFill
> +1.000 2080 319 10 851 BoxColFill
> +1.000 2098 319 9 953 BoxColFill
> +1.000 2115 319 10 896 BoxColFill
> +1.000 2133 319 9 869 BoxColFill
> +1.000 2150 319 10 888 BoxColFill
> +1.000 2168 319 9 727 BoxColFill
> +1.000 2185 319 10 819 BoxColFill
> +1.000 2203 319 9 817 BoxColFill
> +1.000 2220 319 10 795 BoxColFill
> +1.000 2238 319 9 774 BoxColFill
> +1.000 2255 319 10 785 BoxColFill
> +1.000 2273 319 9 721 BoxColFill
> +1.000 2290 319 10 698 BoxColFill
> +1.000 2308 319 9 681 BoxColFill
> +1.000 2325 319 10 643 BoxColFill
> +1.000 2343 319 9 600 BoxColFill
> +1.000 2360 319 10 507 BoxColFill
> +1.000 2378 319 9 437 BoxColFill
> +1.000 2395 319 10 449 BoxColFill
> +1.000 2413 319 9 313 BoxColFill
> +1.000 2430 319 10 257 BoxColFill
> +1.000 2448 319 9 203 BoxColFill
> +1.000 2465 319 10 154 BoxColFill
> +1.000 2483 319 9 134 BoxColFill
> +1.000 2500 319 10 172 BoxColFill
> +1.000 2518 319 9 92 BoxColFill
> +1.000 2535 319 10 43 BoxColFill
> +1.000 2553 319 9 35 BoxColFill
> +1.000 2570 319 10 32 BoxColFill
> +1.000 2588 319 9 34 BoxColFill
> +1.000 2605 319 10 16 BoxColFill
> +1.000 2623 319 5 19 BoxColFill
>  % End plot #1
>  2.000 UL
>  LTb
> @@ -2886,9 +2256,9 @@ LCb setrgbcolor
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> diff --git a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/coe.eps b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/coe.eps
> index a4bad25f..219b91fa 100644
> --- a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/coe.eps
> +++ b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/coe.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: coe.eps
>  %%Creator: gnuplot 5.4 patchlevel 2
> -%%CreationDate: Tue Jan 30 09:04:30 2024
> +%%CreationDate: Sun Feb  4 08:55:38 2024
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 327 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jan 30 09:04:30 2024)
> +  /CreationDate (Sun Feb  4 08:55:38 2024)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1917,12 +1917,12 @@ BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 256 M
> +440 319 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 256 M
> +392 319 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -1930,154 +1930,178 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 500 M
> +440 494 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 500 M
> +392 494 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.05)]
> +] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
> +1.000 UL
> +LTb
> +LCb setrgbcolor
> +440 669 M
> +63 0 V
> +2124 0 R
> +-63 0 V
> +stroke
> +392 669 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.1)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 744 M
> +440 844 M
> +63 0 V
> +2124 0 R
> +-63 0 V
> +stroke
> +392 844 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.15)]
> +] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
> +1.000 UL
> +LTb
> +LCb setrgbcolor
> +440 1020 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 744 M
> +392 1020 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.2)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 988 M
> +440 1195 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 988 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
> +392 1195 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.25)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 1232 M
> +440 1370 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 1232 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.4)]
> +392 1370 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 1476 M
> +440 1545 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 1476 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.5)]
> +392 1545 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.35)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 1720 M
> +440 1720 M
>  63 0 V
> -2172 0 R
> +2124 0 R
>  -63 0 V
>  stroke
> -344 1720 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.6)]
> +392 1720 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.4)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -392 256 M
> -0 63 V
> -0 1401 R
> +440 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -392 176 M
> +440 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-2500)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -765 256 M
> -0 63 V
> -0 1401 R
> +805 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -765 176 M
> +805 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-2000)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1137 256 M
> -0 63 V
> -0 1401 R
> +1169 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -1137 176 M
> +1169 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-1500)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1510 256 M
> -0 63 V
> -0 1401 R
> +1534 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -1510 176 M
> +1534 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-1000)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1882 256 M
> -0 63 V
> -0 1401 R
> +1898 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -1882 176 M
> +1898 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-500)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2255 256 M
> -0 63 V
> -0 1401 R
> +2263 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
> -2255 176 M
> +2263 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2627 256 M
> -0 63 V
> -0 1401 R
> +2627 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2627 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 500)]
> @@ -2089,23 +2113,23 @@ LCb setrgbcolor
>  1.000 UL
>  LTa
>  LCb setrgbcolor
> -2255 256 M
> -0 1464 V
> +2263 319 M
> +0 1401 V
>  stroke
>  LTB
>  LCb setrgbcolor
> -392 1720 N
> -392 256 L
> -2235 0 V
> -0 1464 V
> --2235 0 V
> +440 1720 N
> +440 319 L
> +2187 0 V
> +0 1401 V
> +-2187 0 V
>  Z stroke
>  1.000 UP
>  1.000 UL
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -76 988 M
> +76 1019 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Frequency \(arb. unit\))]
>  ] -26.7 MCshow
> @@ -2113,7 +2137,7 @@ grestore
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  LTb
>  LCb setrgbcolor
> -1509 56 M
> +1533 56 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Store-to-Store Latency \(Timestamp Periods\))]
>  ] -26.7 MCshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2122,456 +2146,1389 @@ LTb
>  1.000 UL
>  LTb
>  0.58 0.00 0.83 C
> -392 256 N
> -0 8 V
> -30 0 V
> -0 -8 V
> --30 0 V
> -Z stroke
> -422 256 N
> -0 4 V
> -30 0 V
> -0 -4 V
> --30 0 V
> -Z stroke
> -452 256 N
> -0 4 V
> -29 0 V
> -0 -4 V
> --29 0 V
> -Z stroke
> -481 256 N
> -0 11 V
> -30 0 V
> -0 -11 V
> --30 0 V
> -Z stroke
> -511 256 N
> -0 14 V
> -30 0 V
> -0 -14 V
> --30 0 V
> -Z stroke
> -541 256 N
> -0 15 V
> -30 0 V
> -0 -15 V
> --30 0 V
> -Z stroke
> -571 256 N
> -0 13 V
> -30 0 V
> -0 -13 V
> --30 0 V
> -Z stroke
> -601 256 N
> -0 13 V
> -29 0 V
> -0 -13 V
> --29 0 V
> -Z stroke
> -630 256 N
> -0 13 V
> -30 0 V
> -0 -13 V
> --30 0 V
> -Z stroke
> -660 256 N
> -0 20 V
> -30 0 V
> -0 -20 V
> --30 0 V
> -Z stroke
> -690 256 N
> -0 23 V
> -30 0 V
> -0 -23 V
> --30 0 V
> -Z stroke
> -720 256 N
> -0 28 V
> -30 0 V
> -0 -28 V
> --30 0 V
> -Z stroke
> -750 256 N
> -0 30 V
> -29 0 V
> -0 -30 V
> --29 0 V
> -Z stroke
> -779 256 N
> -0 40 V
> -30 0 V
> -0 -40 V
> --30 0 V
> -Z stroke
> -809 256 N
> -0 35 V
> -30 0 V
> -0 -35 V
> --30 0 V
> -Z stroke
> -839 256 N
> -0 36 V
> -30 0 V
> -0 -36 V
> --30 0 V
> -Z stroke
> -869 256 N
> -0 61 V
> -30 0 V
> -0 -61 V
> --30 0 V
> -Z stroke
> -899 256 N
> -0 44 V
> -29 0 V
> -0 -44 V
> --29 0 V
> -Z stroke
> -928 256 N
> -0 65 V
> -30 0 V
> -0 -65 V
> --30 0 V
> -Z stroke
> -958 256 N
> -0 70 V
> -30 0 V
> -0 -70 V
> --30 0 V
> -Z stroke
> -988 256 N
> -0 88 V
> -30 0 V
> -0 -88 V
> --30 0 V
> -Z stroke
> -1018 256 N
> -0 96 V
> -30 0 V
> -0 -96 V
> --30 0 V
> -Z stroke
> -1048 256 N
> -0 128 V
> -29 0 V
> -0 -128 V
> --29 0 V
> -Z stroke
> -1077 256 N
> -0 157 V
> -30 0 V
> -0 -157 V
> --30 0 V
> -Z stroke
> -1107 256 N
> -0 168 V
> -30 0 V
> -0 -168 V
> --30 0 V
> -Z stroke
> -1137 256 N
> -0 187 V
> -30 0 V
> -0 -187 V
> --30 0 V
> -Z stroke
> -1167 256 N
> -0 219 V
> -30 0 V
> -0 -219 V
> --30 0 V
> -Z stroke
> -1197 256 N
> -0 272 V
> -29 0 V
> -0 -272 V
> --29 0 V
> -Z stroke
> -1226 256 N
> -0 292 V
> -30 0 V
> -0 -292 V
> --30 0 V
> -Z stroke
> -1256 256 N
> -0 352 V
> -30 0 V
> -0 -352 V
> --30 0 V
> -Z stroke
> -1286 256 N
> -0 382 V
> -30 0 V
> -0 -382 V
> --30 0 V
> -Z stroke
> -1316 256 N
> -0 450 V
> -30 0 V
> -0 -450 V
> --30 0 V
> -Z stroke
> -1346 256 N
> -0 477 V
> -29 0 V
> -0 -477 V
> --29 0 V
> -Z stroke
> -1375 256 N
> -0 594 V
> -30 0 V
> -0 -594 V
> --30 0 V
> -Z stroke
> -1405 256 N
> -0 667 V
> -30 0 V
> -0 -667 V
> --30 0 V
> -Z stroke
> -1435 256 N
> -0 736 V
> -30 0 V
> -0 -736 V
> --30 0 V
> -Z stroke
> -1465 256 N
> -0 833 V
> -30 0 V
> -0 -833 V
> --30 0 V
> -Z stroke
> -1495 256 N
> -0 914 V
> -29 0 V
> -0 -914 V
> --29 0 V
> -Z stroke
> -1524 256 N
> -0 966 V
> -30 0 V
> -0 -966 V
> --30 0 V
> -Z stroke
> -1554 256 N
> -0 1063 V
> -30 0 V
> -0 -1063 V
> --30 0 V
> -Z stroke
> -1584 256 N
> -0 1063 V
> -30 0 V
> -0 -1063 V
> --30 0 V
> -Z stroke
> -1614 256 N
> -0 1124 V
> -30 0 V
> -0 -1124 V
> --30 0 V
> -Z stroke
> -1644 256 N
> -0 1185 V
> -29 0 V
> -0 -1185 V
> --29 0 V
> -Z stroke
> -1673 256 N
> -0 1218 V
> -30 0 V
> -0 -1218 V
> --30 0 V
> -Z stroke
> -1703 256 N
> -0 1252 V
> -30 0 V
> -0 -1252 V
> --30 0 V
> -Z stroke
> -1733 256 N
> -0 1205 V
> -30 0 V
> -0 -1205 V
> --30 0 V
> -Z stroke
> -1763 256 N
> -0 1272 V
> -30 0 V
> -0 -1272 V
> --30 0 V
> -Z stroke
> -1793 256 N
> -0 1243 V
> -29 0 V
> -0 -1243 V
> --29 0 V
> -Z stroke
> -1822 256 N
> -0 1199 V
> -30 0 V
> -0 -1199 V
> --30 0 V
> -Z stroke
> -1852 256 N
> -0 1156 V
> -30 0 V
> -0 -1156 V
> --30 0 V
> -Z stroke
> -1882 256 N
> -0 1147 V
> -30 0 V
> -0 -1147 V
> --30 0 V
> -Z stroke
> -1912 256 N
> -0 1143 V
> -30 0 V
> -0 -1143 V
> --30 0 V
> -Z stroke
> -1942 256 N
> -0 1086 V
> -29 0 V
> -0 -1086 V
> --29 0 V
> -Z stroke
> -1971 256 N
> -0 1016 V
> -30 0 V
> -0 -1016 V
> --30 0 V
> -Z stroke
> -2001 256 N
> -0 972 V
> -30 0 V
> -0 -972 V
> --30 0 V
> -Z stroke
> -2031 256 N
> -0 925 V
> -30 0 V
> -0 -925 V
> --30 0 V
> -Z stroke
> -2061 256 N
> -0 854 V
> -30 0 V
> -0 -854 V
> --30 0 V
> -Z stroke
> -2091 256 N
> -0 821 V
> -29 0 V
> -0 -821 V
> --29 0 V
> -Z stroke
> -2120 256 N
> -0 717 V
> -30 0 V
> -0 -717 V
> --30 0 V
> -Z stroke
> -2150 256 N
> -0 617 V
> -30 0 V
> -0 -617 V
> --30 0 V
> -Z stroke
> -2180 256 N
> -0 559 V
> -30 0 V
> -0 -559 V
> --30 0 V
> -Z stroke
> -2210 256 N
> -0 454 V
> -30 0 V
> -0 -454 V
> --30 0 V
> -Z stroke
> -2240 256 N
> -0 387 V
> -29 0 V
> -0 -387 V
> --29 0 V
> -Z stroke
> -2269 256 N
> -0 332 V
> -30 0 V
> -0 -332 V
> --30 0 V
> -Z stroke
> -2299 256 N
> -0 175 V
> -30 0 V
> -0 -175 V
> --30 0 V
> -Z stroke
> -2329 256 N
> -0 111 V
> -30 0 V
> -0 -111 V
> --30 0 V
> -Z stroke
> -2359 256 N
> -0 70 V
> -30 0 V
> -0 -70 V
> --30 0 V
> -Z stroke
> -2389 256 N
> -0 46 V
> -29 0 V
> -0 -46 V
> --29 0 V
> -Z stroke
> -2418 256 N
> -0 40 V
> -30 0 V
> -0 -40 V
> --30 0 V
> -Z stroke
> -2448 256 N
> -0 34 V
> -30 0 V
> -0 -34 V
> --30 0 V
> -Z stroke
> -2478 256 N
> -0 29 V
> -30 0 V
> -0 -29 V
> --30 0 V
> -Z stroke
> -2508 256 N
> -0 18 V
> -30 0 V
> -0 -18 V
> --30 0 V
> -Z stroke
> -2538 256 N
> -0 23 V
> -29 0 V
> -0 -23 V
> --29 0 V
> -Z stroke
> -2567 256 N
> -0 12 V
> -30 0 V
> -0 -12 V
> --30 0 V
> -Z stroke
> -2597 256 N
> -0 11 V
> -30 0 V
> -0 -11 V
> --30 0 V
> -Z stroke
> +1.000 441 319 2 10 BoxColFill
> +1.000 443 319 1 10 BoxColFill
> +1.000 447 319 2 10 BoxColFill
> +1.000 448 319 2 19 BoxColFill
> +1.000 453 319 1 10 BoxColFill
> +1.000 454 319 2 19 BoxColFill
> +1.000 456 319 1 19 BoxColFill
> +1.000 457 319 2 19 BoxColFill
> +1.000 459 319 1 19 BoxColFill
> +1.000 463 319 2 10 BoxColFill
> +1.000 466 319 2 10 BoxColFill
> +1.000 469 319 2 19 BoxColFill
> +1.000 478 319 1 10 BoxColFill
> +1.000 483 319 2 10 BoxColFill
> +1.000 485 319 2 10 BoxColFill
> +1.000 489 319 2 10 BoxColFill
> +1.000 498 319 2 10 BoxColFill
> +1.000 501 319 2 10 BoxColFill
> +1.000 504 319 2 10 BoxColFill
> +1.000 520 319 2 10 BoxColFill
> +1.000 523 319 1 19 BoxColFill
> +1.000 524 319 2 10 BoxColFill
> +1.000 526 319 1 10 BoxColFill
> +1.000 534 319 2 10 BoxColFill
> +1.000 545 319 1 19 BoxColFill
> +1.000 546 319 2 10 BoxColFill
> +1.000 548 319 1 10 BoxColFill
> +1.000 549 319 2 10 BoxColFill
> +1.000 550 319 2 10 BoxColFill
> +1.000 552 319 2 19 BoxColFill
> +1.000 558 319 1 10 BoxColFill
> +1.000 561 319 1 10 BoxColFill
> +1.000 562 319 2 10 BoxColFill
> +1.000 564 319 1 10 BoxColFill
> +1.000 565 319 2 10 BoxColFill
> +1.000 566 319 2 28 BoxColFill
> +1.000 569 319 2 10 BoxColFill
> +1.000 572 319 2 10 BoxColFill
> +1.000 575 319 2 10 BoxColFill
> +1.000 578 319 2 19 BoxColFill
> +1.000 580 319 1 10 BoxColFill
> +1.000 581 319 2 10 BoxColFill
> +1.000 584 319 2 19 BoxColFill
> +1.000 585 319 2 10 BoxColFill
> +1.000 587 319 2 10 BoxColFill
> +1.000 588 319 2 28 BoxColFill
> +1.000 590 319 2 10 BoxColFill
> +1.000 591 319 2 10 BoxColFill
> +1.000 593 319 1 10 BoxColFill
> +1.000 596 319 1 10 BoxColFill
> +1.000 597 319 2 19 BoxColFill
> +1.000 599 319 1 28 BoxColFill
> +1.000 600 319 2 19 BoxColFill
> +1.000 601 319 2 19 BoxColFill
> +1.000 606 319 2 10 BoxColFill
> +1.000 609 319 1 10 BoxColFill
> +1.000 610 319 2 10 BoxColFill
> +1.000 612 319 1 28 BoxColFill
> +1.000 613 319 2 10 BoxColFill
> +1.000 615 319 1 19 BoxColFill
> +1.000 616 319 2 19 BoxColFill
> +1.000 618 319 1 10 BoxColFill
> +1.000 620 319 2 10 BoxColFill
> +1.000 622 319 2 10 BoxColFill
> +1.000 625 319 2 28 BoxColFill
> +1.000 626 319 2 28 BoxColFill
> +1.000 628 319 1 10 BoxColFill
> +1.000 629 319 2 10 BoxColFill
> +1.000 631 319 1 10 BoxColFill
> +1.000 632 319 2 19 BoxColFill
> +1.000 634 319 1 10 BoxColFill
> +1.000 635 319 2 10 BoxColFill
> +1.000 636 319 2 28 BoxColFill
> +1.000 639 319 2 10 BoxColFill
> +1.000 641 319 2 10 BoxColFill
> +1.000 645 319 2 28 BoxColFill
> +1.000 648 319 2 19 BoxColFill
> +1.000 650 319 1 19 BoxColFill
> +1.000 653 319 1 10 BoxColFill
> +1.000 655 319 2 10 BoxColFill
> +1.000 657 319 2 10 BoxColFill
> +1.000 660 319 2 36 BoxColFill
> +1.000 666 319 1 19 BoxColFill
> +1.000 669 319 1 19 BoxColFill
> +1.000 674 319 2 10 BoxColFill
> +1.000 676 319 2 19 BoxColFill
> +1.000 677 319 2 10 BoxColFill
> +1.000 679 319 1 10 BoxColFill
> +1.000 680 319 2 10 BoxColFill
> +1.000 682 319 1 19 BoxColFill
> +1.000 683 319 2 10 BoxColFill
> +1.000 685 319 1 10 BoxColFill
> +1.000 686 319 2 28 BoxColFill
> +1.000 687 319 2 10 BoxColFill
> +1.000 689 319 2 10 BoxColFill
> +1.000 693 319 2 10 BoxColFill
> +1.000 695 319 2 10 BoxColFill
> +1.000 696 319 2 10 BoxColFill
> +1.000 698 319 1 10 BoxColFill
> +1.000 701 319 1 10 BoxColFill
> +1.000 704 319 1 28 BoxColFill
> +1.000 705 319 2 10 BoxColFill
> +1.000 706 319 2 10 BoxColFill
> +1.000 709 319 2 19 BoxColFill
> +1.000 711 319 2 10 BoxColFill
> +1.000 712 319 2 10 BoxColFill
> +1.000 714 319 1 28 BoxColFill
> +1.000 715 319 2 19 BoxColFill
> +1.000 717 319 1 19 BoxColFill
> +1.000 720 319 1 19 BoxColFill
> +1.000 722 319 2 10 BoxColFill
> +1.000 724 319 2 28 BoxColFill
> +1.000 725 319 2 10 BoxColFill
> +1.000 727 319 2 19 BoxColFill
> +1.000 728 319 2 28 BoxColFill
> +1.000 731 319 2 10 BoxColFill
> +1.000 733 319 1 36 BoxColFill
> +1.000 734 319 2 10 BoxColFill
> +1.000 736 319 1 10 BoxColFill
> +1.000 737 319 2 28 BoxColFill
> +1.000 739 319 1 45 BoxColFill
> +1.000 741 319 2 19 BoxColFill
> +1.000 743 319 2 10 BoxColFill
> +1.000 744 319 2 10 BoxColFill
> +1.000 746 319 2 19 BoxColFill
> +1.000 747 319 2 28 BoxColFill
> +1.000 749 319 1 10 BoxColFill
> +1.000 750 319 2 10 BoxColFill
> +1.000 753 319 2 45 BoxColFill
> +1.000 755 319 1 10 BoxColFill
> +1.000 757 319 2 19 BoxColFill
> +1.000 759 319 2 28 BoxColFill
> +1.000 760 319 2 19 BoxColFill
> +1.000 762 319 2 10 BoxColFill
> +1.000 763 319 2 28 BoxColFill
> +1.000 765 319 1 36 BoxColFill
> +1.000 766 319 2 10 BoxColFill
> +1.000 768 319 1 10 BoxColFill
> +1.000 769 319 2 19 BoxColFill
> +1.000 771 319 1 36 BoxColFill
> +1.000 772 319 2 19 BoxColFill
> +1.000 776 319 2 45 BoxColFill
> +1.000 778 319 2 19 BoxColFill
> +1.000 779 319 2 19 BoxColFill
> +1.000 781 319 2 10 BoxColFill
> +1.000 782 319 2 10 BoxColFill
> +1.000 784 319 1 10 BoxColFill
> +1.000 785 319 2 28 BoxColFill
> +1.000 787 319 1 28 BoxColFill
> +1.000 788 319 2 36 BoxColFill
> +1.000 790 319 1 19 BoxColFill
> +1.000 791 319 2 28 BoxColFill
> +1.000 792 319 2 36 BoxColFill
> +1.000 794 319 2 19 BoxColFill
> +1.000 795 319 2 28 BoxColFill
> +1.000 797 319 2 19 BoxColFill
> +1.000 798 319 2 19 BoxColFill
> +1.000 800 319 1 10 BoxColFill
> +1.000 801 319 2 28 BoxColFill
> +1.000 803 319 1 19 BoxColFill
> +1.000 804 319 2 10 BoxColFill
> +1.000 807 319 2 10 BoxColFill
> +1.000 810 319 2 10 BoxColFill
> +1.000 811 319 2 19 BoxColFill
> +1.000 813 319 2 19 BoxColFill
> +1.000 814 319 2 36 BoxColFill
> +1.000 816 319 2 28 BoxColFill
> +1.000 817 319 2 10 BoxColFill
> +1.000 819 319 1 19 BoxColFill
> +1.000 820 319 2 36 BoxColFill
> +1.000 822 319 1 28 BoxColFill
> +1.000 823 319 2 10 BoxColFill
> +1.000 825 319 1 54 BoxColFill
> +1.000 826 319 2 36 BoxColFill
> +1.000 827 319 2 28 BoxColFill
> +1.000 829 319 2 19 BoxColFill
> +1.000 830 319 2 54 BoxColFill
> +1.000 832 319 2 19 BoxColFill
> +1.000 833 319 2 45 BoxColFill
> +1.000 835 319 1 36 BoxColFill
> +1.000 836 319 2 19 BoxColFill
> +1.000 838 319 1 28 BoxColFill
> +1.000 839 319 2 10 BoxColFill
> +1.000 841 319 1 28 BoxColFill
> +1.000 844 319 1 19 BoxColFill
> +1.000 845 319 2 54 BoxColFill
> +1.000 846 319 2 10 BoxColFill
> +1.000 848 319 2 36 BoxColFill
> +1.000 849 319 2 19 BoxColFill
> +1.000 851 319 2 10 BoxColFill
> +1.000 852 319 2 45 BoxColFill
> +1.000 854 319 1 45 BoxColFill
> +1.000 855 319 2 36 BoxColFill
> +1.000 857 319 1 63 BoxColFill
> +1.000 858 319 2 19 BoxColFill
> +1.000 860 319 1 28 BoxColFill
> +1.000 861 319 2 45 BoxColFill
> +1.000 862 319 2 28 BoxColFill
> +1.000 865 319 2 10 BoxColFill
> +1.000 867 319 2 19 BoxColFill
> +1.000 868 319 2 45 BoxColFill
> +1.000 870 319 1 10 BoxColFill
> +1.000 871 319 2 10 BoxColFill
> +1.000 873 319 1 36 BoxColFill
> +1.000 874 319 2 36 BoxColFill
> +1.000 876 319 1 19 BoxColFill
> +1.000 877 319 2 19 BoxColFill
> +1.000 878 319 2 45 BoxColFill
> +1.000 880 319 2 63 BoxColFill
> +1.000 881 319 2 19 BoxColFill
> +1.000 883 319 2 10 BoxColFill
> +1.000 884 319 2 36 BoxColFill
> +1.000 886 319 2 19 BoxColFill
> +1.000 887 319 2 28 BoxColFill
> +1.000 889 319 1 36 BoxColFill
> +1.000 890 319 2 28 BoxColFill
> +1.000 892 319 1 19 BoxColFill
> +1.000 893 319 2 19 BoxColFill
> +1.000 895 319 1 36 BoxColFill
> +1.000 896 319 2 10 BoxColFill
> +1.000 897 319 2 36 BoxColFill
> +1.000 899 319 2 10 BoxColFill
> +1.000 900 319 2 45 BoxColFill
> +1.000 902 319 2 45 BoxColFill
> +1.000 903 319 2 45 BoxColFill
> +1.000 905 319 1 36 BoxColFill
> +1.000 906 319 2 36 BoxColFill
> +1.000 908 319 1 10 BoxColFill
> +1.000 909 319 2 19 BoxColFill
> +1.000 911 319 1 19 BoxColFill
> +1.000 912 319 2 19 BoxColFill
> +1.000 913 319 2 19 BoxColFill
> +1.000 915 319 2 10 BoxColFill
> +1.000 916 319 2 45 BoxColFill
> +1.000 918 319 2 63 BoxColFill
> +1.000 921 319 2 36 BoxColFill
> +1.000 922 319 2 36 BoxColFill
> +1.000 924 319 1 45 BoxColFill
> +1.000 925 319 2 63 BoxColFill
> +1.000 927 319 1 72 BoxColFill
> +1.000 928 319 2 28 BoxColFill
> +1.000 930 319 1 90 BoxColFill
> +1.000 931 319 2 19 BoxColFill
> +1.000 932 319 2 28 BoxColFill
> +1.000 934 319 2 45 BoxColFill
> +1.000 935 319 2 45 BoxColFill
> +1.000 937 319 2 54 BoxColFill
> +1.000 938 319 2 10 BoxColFill
> +1.000 940 319 1 54 BoxColFill
> +1.000 941 319 2 28 BoxColFill
> +1.000 943 319 1 45 BoxColFill
> +1.000 944 319 2 45 BoxColFill
> +1.000 946 319 1 45 BoxColFill
> +1.000 947 319 2 54 BoxColFill
> +1.000 948 319 2 45 BoxColFill
> +1.000 950 319 2 19 BoxColFill
> +1.000 951 319 2 28 BoxColFill
> +1.000 953 319 2 54 BoxColFill
> +1.000 954 319 2 28 BoxColFill
> +1.000 956 319 1 19 BoxColFill
> +1.000 957 319 2 36 BoxColFill
> +1.000 959 319 1 19 BoxColFill
> +1.000 960 319 2 19 BoxColFill
> +1.000 962 319 1 45 BoxColFill
> +1.000 963 319 2 28 BoxColFill
> +1.000 965 319 1 36 BoxColFill
> +1.000 966 319 2 36 BoxColFill
> +1.000 967 319 2 36 BoxColFill
> +1.000 969 319 2 10 BoxColFill
> +1.000 970 319 2 54 BoxColFill
> +1.000 972 319 2 54 BoxColFill
> +1.000 973 319 2 28 BoxColFill
> +1.000 975 319 1 45 BoxColFill
> +1.000 976 319 2 10 BoxColFill
> +1.000 978 319 1 54 BoxColFill
> +1.000 979 319 2 36 BoxColFill
> +1.000 981 319 1 28 BoxColFill
> +1.000 982 319 2 36 BoxColFill
> +1.000 983 319 2 45 BoxColFill
> +1.000 985 319 2 54 BoxColFill
> +1.000 986 319 2 45 BoxColFill
> +1.000 988 319 2 72 BoxColFill
> +1.000 989 319 2 28 BoxColFill
> +1.000 991 319 1 45 BoxColFill
> +1.000 992 319 2 28 BoxColFill
> +1.000 994 319 1 54 BoxColFill
> +1.000 995 319 2 63 BoxColFill
> +1.000 997 319 1 90 BoxColFill
> +1.000 998 319 2 28 BoxColFill
> +1.000 1000 319 1 63 BoxColFill
> +1.000 1001 319 2 45 BoxColFill
> +1.000 1002 319 2 45 BoxColFill
> +1.000 1004 319 2 36 BoxColFill
> +1.000 1005 319 2 72 BoxColFill
> +1.000 1007 319 2 45 BoxColFill
> +1.000 1008 319 2 19 BoxColFill
> +1.000 1010 319 1 63 BoxColFill
> +1.000 1011 319 2 36 BoxColFill
> +1.000 1013 319 1 63 BoxColFill
> +1.000 1014 319 2 36 BoxColFill
> +1.000 1016 319 1 63 BoxColFill
> +1.000 1017 319 2 45 BoxColFill
> +1.000 1018 319 2 45 BoxColFill
> +1.000 1020 319 2 90 BoxColFill
> +1.000 1021 319 2 45 BoxColFill
> +1.000 1023 319 2 54 BoxColFill
> +1.000 1024 319 2 28 BoxColFill
> +1.000 1026 319 1 72 BoxColFill
> +1.000 1029 319 1 90 BoxColFill
> +1.000 1030 319 2 54 BoxColFill
> +1.000 1032 319 1 36 BoxColFill
> +1.000 1033 319 2 72 BoxColFill
> +1.000 1034 319 2 63 BoxColFill
> +1.000 1036 319 2 54 BoxColFill
> +1.000 1037 319 2 36 BoxColFill
> +1.000 1039 319 2 90 BoxColFill
> +1.000 1040 319 2 90 BoxColFill
> +1.000 1042 319 2 54 BoxColFill
> +1.000 1043 319 2 54 BoxColFill
> +1.000 1045 319 1 72 BoxColFill
> +1.000 1046 319 2 36 BoxColFill
> +1.000 1048 319 1 28 BoxColFill
> +1.000 1049 319 2 45 BoxColFill
> +1.000 1051 319 1 72 BoxColFill
> +1.000 1052 319 2 54 BoxColFill
> +1.000 1053 319 2 90 BoxColFill
> +1.000 1055 319 2 72 BoxColFill
> +1.000 1056 319 2 90 BoxColFill
> +1.000 1058 319 2 81 BoxColFill
> +1.000 1059 319 2 63 BoxColFill
> +1.000 1061 319 1 72 BoxColFill
> +1.000 1062 319 2 72 BoxColFill
> +1.000 1064 319 1 72 BoxColFill
> +1.000 1065 319 2 36 BoxColFill
> +1.000 1067 319 1 90 BoxColFill
> +1.000 1068 319 2 90 BoxColFill
> +1.000 1069 319 2 63 BoxColFill
> +1.000 1071 319 2 45 BoxColFill
> +1.000 1072 319 2 45 BoxColFill
> +1.000 1074 319 2 72 BoxColFill
> +1.000 1075 319 2 63 BoxColFill
> +1.000 1077 319 2 99 BoxColFill
> +1.000 1078 319 2 54 BoxColFill
> +1.000 1080 319 1 45 BoxColFill
> +1.000 1081 319 2 99 BoxColFill
> +1.000 1083 319 1 81 BoxColFill
> +1.000 1084 319 2 116 BoxColFill
> +1.000 1086 319 1 45 BoxColFill
> +1.000 1087 319 2 28 BoxColFill
> +1.000 1088 319 2 63 BoxColFill
> +1.000 1090 319 2 28 BoxColFill
> +1.000 1091 319 2 45 BoxColFill
> +1.000 1093 319 2 107 BoxColFill
> +1.000 1094 319 2 125 BoxColFill
> +1.000 1096 319 1 81 BoxColFill
> +1.000 1097 319 2 116 BoxColFill
> +1.000 1099 319 1 90 BoxColFill
> +1.000 1100 319 2 107 BoxColFill
> +1.000 1102 319 1 81 BoxColFill
> +1.000 1103 319 2 63 BoxColFill
> +1.000 1104 319 2 107 BoxColFill
> +1.000 1106 319 2 134 BoxColFill
> +1.000 1107 319 2 72 BoxColFill
> +1.000 1109 319 2 99 BoxColFill
> +1.000 1110 319 2 63 BoxColFill
> +1.000 1112 319 2 116 BoxColFill
> +1.000 1113 319 2 107 BoxColFill
> +1.000 1115 319 1 116 BoxColFill
> +1.000 1116 319 2 45 BoxColFill
> +1.000 1118 319 1 54 BoxColFill
> +1.000 1119 319 2 107 BoxColFill
> +1.000 1121 319 1 72 BoxColFill
> +1.000 1122 319 2 125 BoxColFill
> +1.000 1123 319 2 107 BoxColFill
> +1.000 1125 319 2 90 BoxColFill
> +1.000 1126 319 2 54 BoxColFill
> +1.000 1128 319 2 99 BoxColFill
> +1.000 1129 319 2 116 BoxColFill
> +1.000 1131 319 1 99 BoxColFill
> +1.000 1132 319 2 161 BoxColFill
> +1.000 1134 319 1 107 BoxColFill
> +1.000 1135 319 2 116 BoxColFill
> +1.000 1137 319 1 107 BoxColFill
> +1.000 1138 319 2 90 BoxColFill
> +1.000 1139 319 2 125 BoxColFill
> +1.000 1141 319 2 107 BoxColFill
> +1.000 1142 319 2 125 BoxColFill
> +1.000 1144 319 2 187 BoxColFill
> +1.000 1145 319 2 134 BoxColFill
> +1.000 1147 319 1 107 BoxColFill
> +1.000 1148 319 2 143 BoxColFill
> +1.000 1150 319 1 116 BoxColFill
> +1.000 1151 319 2 90 BoxColFill
> +1.000 1153 319 1 99 BoxColFill
> +1.000 1154 319 2 116 BoxColFill
> +1.000 1156 319 1 196 BoxColFill
> +1.000 1157 319 2 107 BoxColFill
> +1.000 1158 319 2 134 BoxColFill
> +1.000 1160 319 2 116 BoxColFill
> +1.000 1161 319 2 99 BoxColFill
> +1.000 1163 319 2 99 BoxColFill
> +1.000 1164 319 2 152 BoxColFill
> +1.000 1166 319 1 134 BoxColFill
> +1.000 1167 319 2 63 BoxColFill
> +1.000 1169 319 1 116 BoxColFill
> +1.000 1170 319 2 196 BoxColFill
> +1.000 1172 319 1 99 BoxColFill
> +1.000 1173 319 2 81 BoxColFill
> +1.000 1174 319 2 99 BoxColFill
> +1.000 1176 319 2 125 BoxColFill
> +1.000 1177 319 2 116 BoxColFill
> +1.000 1179 319 2 99 BoxColFill
> +1.000 1180 319 2 161 BoxColFill
> +1.000 1182 319 1 125 BoxColFill
> +1.000 1183 319 2 178 BoxColFill
> +1.000 1185 319 1 116 BoxColFill
> +1.000 1186 319 2 90 BoxColFill
> +1.000 1188 319 1 99 BoxColFill
> +1.000 1189 319 2 134 BoxColFill
> +1.000 1191 319 1 125 BoxColFill
> +1.000 1192 319 2 143 BoxColFill
> +1.000 1193 319 2 90 BoxColFill
> +1.000 1195 319 2 99 BoxColFill
> +1.000 1196 319 2 196 BoxColFill
> +1.000 1198 319 2 134 BoxColFill
> +1.000 1199 319 2 178 BoxColFill
> +1.000 1201 319 1 125 BoxColFill
> +1.000 1202 319 2 90 BoxColFill
> +1.000 1204 319 1 125 BoxColFill
> +1.000 1205 319 2 143 BoxColFill
> +1.000 1207 319 1 223 BoxColFill
> +1.000 1208 319 2 143 BoxColFill
> +1.000 1209 319 2 107 BoxColFill
> +1.000 1211 319 2 169 BoxColFill
> +1.000 1212 319 2 134 BoxColFill
> +1.000 1214 319 2 187 BoxColFill
> +1.000 1215 319 2 187 BoxColFill
> +1.000 1217 319 1 152 BoxColFill
> +1.000 1218 319 2 161 BoxColFill
> +1.000 1220 319 1 116 BoxColFill
> +1.000 1221 319 2 125 BoxColFill
> +1.000 1223 319 1 143 BoxColFill
> +1.000 1224 319 2 161 BoxColFill
> +1.000 1225 319 2 214 BoxColFill
> +1.000 1227 319 2 232 BoxColFill
> +1.000 1228 319 2 152 BoxColFill
> +1.000 1230 319 2 178 BoxColFill
> +1.000 1231 319 2 116 BoxColFill
> +1.000 1233 319 2 152 BoxColFill
> +1.000 1234 319 2 196 BoxColFill
> +1.000 1236 319 1 143 BoxColFill
> +1.000 1237 319 2 187 BoxColFill
> +1.000 1239 319 1 134 BoxColFill
> +1.000 1240 319 2 90 BoxColFill
> +1.000 1242 319 1 81 BoxColFill
> +1.000 1243 319 2 125 BoxColFill
> +1.000 1244 319 2 196 BoxColFill
> +1.000 1246 319 2 276 BoxColFill
> +1.000 1247 319 2 258 BoxColFill
> +1.000 1249 319 2 143 BoxColFill
> +1.000 1250 319 2 178 BoxColFill
> +1.000 1252 319 1 240 BoxColFill
> +1.000 1253 319 2 178 BoxColFill
> +1.000 1255 319 1 223 BoxColFill
> +1.000 1256 319 2 249 BoxColFill
> +1.000 1258 319 1 205 BoxColFill
> +1.000 1259 319 2 205 BoxColFill
> +1.000 1260 319 2 240 BoxColFill
> +1.000 1262 319 2 196 BoxColFill
> +1.000 1263 319 2 187 BoxColFill
> +1.000 1265 319 2 161 BoxColFill
> +1.000 1266 319 2 249 BoxColFill
> +1.000 1268 319 2 152 BoxColFill
> +1.000 1269 319 2 178 BoxColFill
> +1.000 1271 319 1 152 BoxColFill
> +1.000 1272 319 2 223 BoxColFill
> +1.000 1274 319 1 161 BoxColFill
> +1.000 1275 319 2 187 BoxColFill
> +1.000 1277 319 1 232 BoxColFill
> +1.000 1278 319 2 152 BoxColFill
> +1.000 1279 319 2 187 BoxColFill
> +1.000 1281 319 2 232 BoxColFill
> +1.000 1282 319 2 240 BoxColFill
> +1.000 1284 319 2 258 BoxColFill
> +1.000 1285 319 2 178 BoxColFill
> +1.000 1287 319 1 152 BoxColFill
> +1.000 1288 319 2 258 BoxColFill
> +1.000 1290 319 1 187 BoxColFill
> +1.000 1291 319 2 134 BoxColFill
> +1.000 1293 319 1 267 BoxColFill
> +1.000 1294 319 2 249 BoxColFill
> +1.000 1295 319 2 249 BoxColFill
> +1.000 1297 319 2 240 BoxColFill
> +1.000 1298 319 2 276 BoxColFill
> +1.000 1300 319 2 178 BoxColFill
> +1.000 1301 319 2 311 BoxColFill
> +1.000 1303 319 2 302 BoxColFill
> +1.000 1304 319 2 223 BoxColFill
> +1.000 1306 319 1 223 BoxColFill
> +1.000 1307 319 2 161 BoxColFill
> +1.000 1309 319 1 196 BoxColFill
> +1.000 1310 319 2 294 BoxColFill
> +1.000 1312 319 1 329 BoxColFill
> +1.000 1313 319 2 267 BoxColFill
> +1.000 1314 319 2 214 BoxColFill
> +1.000 1316 319 2 240 BoxColFill
> +1.000 1317 319 2 276 BoxColFill
> +1.000 1319 319 2 285 BoxColFill
> +1.000 1320 319 2 329 BoxColFill
> +1.000 1322 319 1 294 BoxColFill
> +1.000 1323 319 2 249 BoxColFill
> +1.000 1325 319 1 214 BoxColFill
> +1.000 1326 319 2 267 BoxColFill
> +1.000 1328 319 1 223 BoxColFill
> +1.000 1329 319 2 294 BoxColFill
> +1.000 1330 319 2 276 BoxColFill
> +1.000 1332 319 2 294 BoxColFill
> +1.000 1333 319 2 338 BoxColFill
> +1.000 1335 319 2 276 BoxColFill
> +1.000 1336 319 2 223 BoxColFill
> +1.000 1338 319 1 223 BoxColFill
> +1.000 1339 319 2 285 BoxColFill
> +1.000 1341 319 1 302 BoxColFill
> +1.000 1342 319 2 249 BoxColFill
> +1.000 1344 319 1 276 BoxColFill
> +1.000 1345 319 2 161 BoxColFill
> +1.000 1347 319 1 285 BoxColFill
> +1.000 1348 319 2 373 BoxColFill
> +1.000 1349 319 2 320 BoxColFill
> +1.000 1351 319 2 258 BoxColFill
> +1.000 1352 319 2 356 BoxColFill
> +1.000 1354 319 2 232 BoxColFill
> +1.000 1355 319 2 267 BoxColFill
> +1.000 1357 319 1 214 BoxColFill
> +1.000 1358 319 2 249 BoxColFill
> +1.000 1360 319 1 276 BoxColFill
> +1.000 1361 319 2 302 BoxColFill
> +1.000 1363 319 1 365 BoxColFill
> +1.000 1364 319 2 285 BoxColFill
> +1.000 1365 319 2 329 BoxColFill
> +1.000 1367 319 2 365 BoxColFill
> +1.000 1368 319 2 391 BoxColFill
> +1.000 1370 319 2 311 BoxColFill
> +1.000 1371 319 2 249 BoxColFill
> +1.000 1373 319 1 294 BoxColFill
> +1.000 1374 319 2 285 BoxColFill
> +1.000 1376 319 1 276 BoxColFill
> +1.000 1377 319 2 347 BoxColFill
> +1.000 1379 319 1 347 BoxColFill
> +1.000 1380 319 2 329 BoxColFill
> +1.000 1382 319 1 418 BoxColFill
> +1.000 1383 319 2 320 BoxColFill
> +1.000 1384 319 2 365 BoxColFill
> +1.000 1386 319 2 382 BoxColFill
> +1.000 1387 319 2 320 BoxColFill
> +1.000 1389 319 2 267 BoxColFill
> +1.000 1390 319 2 258 BoxColFill
> +1.000 1392 319 1 311 BoxColFill
> +1.000 1393 319 2 409 BoxColFill
> +1.000 1395 319 1 444 BoxColFill
> +1.000 1396 319 2 356 BoxColFill
> +1.000 1398 319 1 311 BoxColFill
> +1.000 1399 319 2 365 BoxColFill
> +1.000 1400 319 2 276 BoxColFill
> +1.000 1402 319 2 391 BoxColFill
> +1.000 1403 319 2 302 BoxColFill
> +1.000 1405 319 2 365 BoxColFill
> +1.000 1406 319 2 320 BoxColFill
> +1.000 1408 319 1 356 BoxColFill
> +1.000 1409 319 2 320 BoxColFill
> +1.000 1411 319 1 391 BoxColFill
> +1.000 1412 319 2 365 BoxColFill
> +1.000 1414 319 1 347 BoxColFill
> +1.000 1415 319 2 400 BoxColFill
> +1.000 1416 319 2 533 BoxColFill
> +1.000 1418 319 2 356 BoxColFill
> +1.000 1419 319 2 276 BoxColFill
> +1.000 1421 319 2 276 BoxColFill
> +1.000 1422 319 2 444 BoxColFill
> +1.000 1424 319 2 427 BoxColFill
> +1.000 1425 319 2 480 BoxColFill
> +1.000 1427 319 1 400 BoxColFill
> +1.000 1428 319 2 453 BoxColFill
> +1.000 1430 319 1 498 BoxColFill
> +1.000 1431 319 2 435 BoxColFill
> +1.000 1433 319 1 435 BoxColFill
> +1.000 1434 319 2 453 BoxColFill
> +1.000 1435 319 2 471 BoxColFill
> +1.000 1437 319 2 373 BoxColFill
> +1.000 1438 319 2 453 BoxColFill
> +1.000 1440 319 2 489 BoxColFill
> +1.000 1441 319 2 462 BoxColFill
> +1.000 1443 319 1 347 BoxColFill
> +1.000 1444 319 2 489 BoxColFill
> +1.000 1446 319 1 524 BoxColFill
> +1.000 1447 319 2 435 BoxColFill
> +1.000 1449 319 1 444 BoxColFill
> +1.000 1450 319 2 551 BoxColFill
> +1.000 1451 319 2 498 BoxColFill
> +1.000 1453 319 2 453 BoxColFill
> +1.000 1454 319 2 489 BoxColFill
> +1.000 1456 319 2 462 BoxColFill
> +1.000 1457 319 2 444 BoxColFill
> +1.000 1459 319 2 427 BoxColFill
> +1.000 1460 319 2 631 BoxColFill
> +1.000 1462 319 1 400 BoxColFill
> +1.000 1463 319 2 515 BoxColFill
> +1.000 1465 319 1 480 BoxColFill
> +1.000 1466 319 2 444 BoxColFill
> +1.000 1468 319 1 365 BoxColFill
> +1.000 1469 319 2 498 BoxColFill
> +1.000 1470 319 2 418 BoxColFill
> +1.000 1472 319 2 524 BoxColFill
> +1.000 1473 319 2 586 BoxColFill
> +1.000 1475 319 2 435 BoxColFill
> +1.000 1476 319 2 586 BoxColFill
> +1.000 1478 319 1 595 BoxColFill
> +1.000 1479 319 2 551 BoxColFill
> +1.000 1481 319 1 471 BoxColFill
> +1.000 1482 319 2 400 BoxColFill
> +1.000 1484 319 1 489 BoxColFill
> +1.000 1485 319 2 622 BoxColFill
> +1.000 1486 319 2 489 BoxColFill
> +1.000 1488 319 2 480 BoxColFill
> +1.000 1489 319 2 560 BoxColFill
> +1.000 1491 319 2 577 BoxColFill
> +1.000 1492 319 2 524 BoxColFill
> +1.000 1494 319 1 577 BoxColFill
> +1.000 1495 319 2 551 BoxColFill
> +1.000 1497 319 1 524 BoxColFill
> +1.000 1498 319 2 639 BoxColFill
> +1.000 1500 319 1 568 BoxColFill
> +1.000 1501 319 2 471 BoxColFill
> +1.000 1503 319 1 480 BoxColFill
> +1.000 1504 319 2 560 BoxColFill
> +1.000 1505 319 2 586 BoxColFill
> +1.000 1507 319 2 577 BoxColFill
> +1.000 1508 319 2 684 BoxColFill
> +1.000 1510 319 2 506 BoxColFill
> +1.000 1511 319 2 693 BoxColFill
> +1.000 1513 319 1 764 BoxColFill
> +1.000 1514 319 2 595 BoxColFill
> +1.000 1516 319 1 498 BoxColFill
> +1.000 1517 319 2 719 BoxColFill
> +1.000 1519 319 1 595 BoxColFill
> +1.000 1520 319 2 551 BoxColFill
> +1.000 1521 319 2 542 BoxColFill
> +1.000 1523 319 2 666 BoxColFill
> +1.000 1524 319 2 604 BoxColFill
> +1.000 1526 319 2 524 BoxColFill
> +1.000 1527 319 2 675 BoxColFill
> +1.000 1529 319 1 533 BoxColFill
> +1.000 1530 319 2 524 BoxColFill
> +1.000 1532 319 1 586 BoxColFill
> +1.000 1533 319 2 489 BoxColFill
> +1.000 1535 319 1 684 BoxColFill
> +1.000 1536 319 2 560 BoxColFill
> +1.000 1538 319 1 471 BoxColFill
> +1.000 1539 319 2 719 BoxColFill
> +1.000 1540 319 2 710 BoxColFill
> +1.000 1542 319 2 719 BoxColFill
> +1.000 1543 319 2 613 BoxColFill
> +1.000 1545 319 2 551 BoxColFill
> +1.000 1546 319 2 675 BoxColFill
> +1.000 1548 319 1 631 BoxColFill
> +1.000 1549 319 2 506 BoxColFill
> +1.000 1551 319 1 613 BoxColFill
> +1.000 1552 319 2 772 BoxColFill
> +1.000 1554 319 1 932 BoxColFill
> +1.000 1555 319 2 719 BoxColFill
> +1.000 1556 319 2 746 BoxColFill
> +1.000 1558 319 2 790 BoxColFill
> +1.000 1559 319 2 577 BoxColFill
> +1.000 1561 319 2 666 BoxColFill
> +1.000 1562 319 2 622 BoxColFill
> +1.000 1564 319 1 719 BoxColFill
> +1.000 1565 319 2 648 BoxColFill
> +1.000 1567 319 1 639 BoxColFill
> +1.000 1568 319 2 577 BoxColFill
> +1.000 1570 319 1 781 BoxColFill
> +1.000 1571 319 2 702 BoxColFill
> +1.000 1573 319 1 639 BoxColFill
> +1.000 1574 319 2 666 BoxColFill
> +1.000 1575 319 2 675 BoxColFill
> +1.000 1577 319 2 684 BoxColFill
> +1.000 1578 319 2 675 BoxColFill
> +1.000 1580 319 2 790 BoxColFill
> +1.000 1581 319 2 648 BoxColFill
> +1.000 1583 319 1 808 BoxColFill
> +1.000 1584 319 2 710 BoxColFill
> +1.000 1586 319 1 702 BoxColFill
> +1.000 1587 319 2 702 BoxColFill
> +1.000 1589 319 1 888 BoxColFill
> +1.000 1590 319 2 613 BoxColFill
> +1.000 1591 319 2 666 BoxColFill
> +1.000 1593 319 2 808 BoxColFill
> +1.000 1594 319 2 897 BoxColFill
> +1.000 1596 319 2 808 BoxColFill
> +1.000 1597 319 2 799 BoxColFill
> +1.000 1599 319 1 666 BoxColFill
> +1.000 1600 319 2 586 BoxColFill
> +1.000 1602 319 1 622 BoxColFill
> +1.000 1603 319 2 799 BoxColFill
> +1.000 1605 319 1 808 BoxColFill
> +1.000 1606 319 2 577 BoxColFill
> +1.000 1607 319 2 808 BoxColFill
> +1.000 1609 319 2 790 BoxColFill
> +1.000 1610 319 2 843 BoxColFill
> +1.000 1612 319 2 817 BoxColFill
> +1.000 1613 319 2 746 BoxColFill
> +1.000 1615 319 2 888 BoxColFill
> +1.000 1616 319 2 702 BoxColFill
> +1.000 1618 319 1 843 BoxColFill
> +1.000 1619 319 2 808 BoxColFill
> +1.000 1621 319 1 817 BoxColFill
> +1.000 1622 319 2 843 BoxColFill
> +1.000 1624 319 1 568 BoxColFill
> +1.000 1625 319 2 728 BoxColFill
> +1.000 1626 319 2 790 BoxColFill
> +1.000 1628 319 2 781 BoxColFill
> +1.000 1629 319 2 737 BoxColFill
> +1.000 1631 319 2 755 BoxColFill
> +1.000 1632 319 2 755 BoxColFill
> +1.000 1634 319 1 941 BoxColFill
> +1.000 1635 319 2 817 BoxColFill
> +1.000 1637 319 1 577 BoxColFill
> +1.000 1638 319 2 648 BoxColFill
> +1.000 1640 319 1 941 BoxColFill
> +1.000 1641 319 2 905 BoxColFill
> +1.000 1642 319 2 737 BoxColFill
> +1.000 1644 319 2 675 BoxColFill
> +1.000 1645 319 2 843 BoxColFill
> +1.000 1647 319 2 799 BoxColFill
> +1.000 1648 319 2 622 BoxColFill
> +1.000 1650 319 2 772 BoxColFill
> +1.000 1651 319 2 843 BoxColFill
> +1.000 1653 319 1 728 BoxColFill
> +1.000 1654 319 2 799 BoxColFill
> +1.000 1656 319 1 817 BoxColFill
> +1.000 1657 319 2 666 BoxColFill
> +1.000 1659 319 1 799 BoxColFill
> +1.000 1660 319 2 914 BoxColFill
> +1.000 1661 319 2 790 BoxColFill
> +1.000 1663 319 2 772 BoxColFill
> +1.000 1664 319 2 932 BoxColFill
> +1.000 1666 319 2 648 BoxColFill
> +1.000 1667 319 2 852 BoxColFill
> +1.000 1669 319 1 870 BoxColFill
> +1.000 1670 319 2 870 BoxColFill
> +1.000 1672 319 1 755 BoxColFill
> +1.000 1673 319 2 870 BoxColFill
> +1.000 1675 319 1 941 BoxColFill
> +1.000 1676 319 2 728 BoxColFill
> +1.000 1677 319 2 781 BoxColFill
> +1.000 1679 319 2 781 BoxColFill
> +1.000 1680 319 2 790 BoxColFill
> +1.000 1682 319 2 808 BoxColFill
> +1.000 1683 319 2 888 BoxColFill
> +1.000 1685 319 1 826 BoxColFill
> +1.000 1686 319 2 923 BoxColFill
> +1.000 1688 319 1 808 BoxColFill
> +1.000 1689 319 2 835 BoxColFill
> +1.000 1691 319 1 861 BoxColFill
> +1.000 1692 319 2 808 BoxColFill
> +1.000 1694 319 1 852 BoxColFill
> +1.000 1695 319 2 1030 BoxColFill
> +1.000 1696 319 2 843 BoxColFill
> +1.000 1698 319 2 728 BoxColFill
> +1.000 1699 319 2 923 BoxColFill
> +1.000 1701 319 2 888 BoxColFill
> +1.000 1702 319 2 772 BoxColFill
> +1.000 1704 319 1 923 BoxColFill
> +1.000 1705 319 2 932 BoxColFill
> +1.000 1707 319 1 817 BoxColFill
> +1.000 1708 319 2 781 BoxColFill
> +1.000 1710 319 1 781 BoxColFill
> +1.000 1711 319 2 879 BoxColFill
> +1.000 1712 319 2 914 BoxColFill
> +1.000 1714 319 2 923 BoxColFill
> +1.000 1715 319 2 755 BoxColFill
> +1.000 1717 319 2 835 BoxColFill
> +1.000 1718 319 2 950 BoxColFill
> +1.000 1720 319 1 950 BoxColFill
> +1.000 1721 319 2 870 BoxColFill
> +1.000 1723 319 1 959 BoxColFill
> +1.000 1724 319 2 897 BoxColFill
> +1.000 1726 319 1 888 BoxColFill
> +1.000 1727 319 2 914 BoxColFill
> +1.000 1729 319 1 985 BoxColFill
> +1.000 1730 319 2 719 BoxColFill
> +1.000 1731 319 2 897 BoxColFill
> +1.000 1733 319 2 879 BoxColFill
> +1.000 1734 319 2 808 BoxColFill
> +1.000 1736 319 2 914 BoxColFill
> +1.000 1737 319 2 879 BoxColFill
> +1.000 1739 319 1 923 BoxColFill
> +1.000 1740 319 2 861 BoxColFill
> +1.000 1742 319 1 1012 BoxColFill
> +1.000 1743 319 2 923 BoxColFill
> +1.000 1745 319 1 879 BoxColFill
> +1.000 1746 319 2 968 BoxColFill
> +1.000 1747 319 2 861 BoxColFill
> +1.000 1749 319 2 861 BoxColFill
> +1.000 1750 319 2 737 BoxColFill
> +1.000 1752 319 2 843 BoxColFill
> +1.000 1753 319 2 932 BoxColFill
> +1.000 1755 319 1 1074 BoxColFill
> +1.000 1756 319 2 852 BoxColFill
> +1.000 1758 319 1 879 BoxColFill
> +1.000 1759 319 2 976 BoxColFill
> +1.000 1761 319 1 950 BoxColFill
> +1.000 1762 319 2 950 BoxColFill
> +1.000 1763 319 2 888 BoxColFill
> +1.000 1765 319 2 737 BoxColFill
> +1.000 1766 319 2 861 BoxColFill
> +1.000 1768 319 2 808 BoxColFill
> +1.000 1769 319 2 870 BoxColFill
> +1.000 1771 319 2 905 BoxColFill
> +1.000 1772 319 2 861 BoxColFill
> +1.000 1774 319 1 852 BoxColFill
> +1.000 1775 319 2 932 BoxColFill
> +1.000 1777 319 1 923 BoxColFill
> +1.000 1778 319 2 781 BoxColFill
> +1.000 1780 319 1 852 BoxColFill
> +1.000 1781 319 2 852 BoxColFill
> +1.000 1782 319 2 852 BoxColFill
> +1.000 1784 319 2 923 BoxColFill
> +1.000 1785 319 2 888 BoxColFill
> +1.000 1787 319 2 941 BoxColFill
> +1.000 1788 319 2 852 BoxColFill
> +1.000 1790 319 1 772 BoxColFill
> +1.000 1791 319 2 879 BoxColFill
> +1.000 1793 319 1 941 BoxColFill
> +1.000 1794 319 2 764 BoxColFill
> +1.000 1796 319 1 826 BoxColFill
> +1.000 1797 319 2 905 BoxColFill
> +1.000 1798 319 2 905 BoxColFill
> +1.000 1800 319 2 950 BoxColFill
> +1.000 1801 319 2 870 BoxColFill
> +1.000 1803 319 2 923 BoxColFill
> +1.000 1804 319 2 950 BoxColFill
> +1.000 1806 319 2 817 BoxColFill
> +1.000 1807 319 2 808 BoxColFill
> +1.000 1809 319 1 1003 BoxColFill
> +1.000 1810 319 2 968 BoxColFill
> +1.000 1812 319 1 959 BoxColFill
> +1.000 1813 319 2 941 BoxColFill
> +1.000 1815 319 1 1065 BoxColFill
> +1.000 1816 319 2 852 BoxColFill
> +1.000 1817 319 2 959 BoxColFill
> +1.000 1819 319 2 905 BoxColFill
> +1.000 1820 319 2 1154 BoxColFill
> +1.000 1822 319 2 710 BoxColFill
> +1.000 1823 319 2 808 BoxColFill
> +1.000 1825 319 1 994 BoxColFill
> +1.000 1826 319 2 994 BoxColFill
> +1.000 1828 319 1 923 BoxColFill
> +1.000 1829 319 2 1056 BoxColFill
> +1.000 1831 319 1 843 BoxColFill
> +1.000 1832 319 2 1038 BoxColFill
> +1.000 1833 319 2 888 BoxColFill
> +1.000 1835 319 2 817 BoxColFill
> +1.000 1836 319 2 790 BoxColFill
> +1.000 1838 319 2 852 BoxColFill
> +1.000 1839 319 2 1092 BoxColFill
> +1.000 1841 319 2 843 BoxColFill
> +1.000 1842 319 2 781 BoxColFill
> +1.000 1844 319 1 985 BoxColFill
> +1.000 1845 319 2 764 BoxColFill
> +1.000 1847 319 1 861 BoxColFill
> +1.000 1848 319 2 737 BoxColFill
> +1.000 1850 319 1 817 BoxColFill
> +1.000 1851 319 2 941 BoxColFill
> +1.000 1852 319 2 843 BoxColFill
> +1.000 1854 319 2 1003 BoxColFill
> +1.000 1855 319 2 914 BoxColFill
> +1.000 1857 319 2 959 BoxColFill
> +1.000 1858 319 2 852 BoxColFill
> +1.000 1860 319 1 799 BoxColFill
> +1.000 1861 319 2 914 BoxColFill
> +1.000 1863 319 1 799 BoxColFill
> +1.000 1864 319 2 914 BoxColFill
> +1.000 1866 319 1 905 BoxColFill
> +1.000 1867 319 2 835 BoxColFill
> +1.000 1868 319 2 888 BoxColFill
> +1.000 1870 319 2 790 BoxColFill
> +1.000 1871 319 2 843 BoxColFill
> +1.000 1873 319 2 755 BoxColFill
> +1.000 1874 319 2 781 BoxColFill
> +1.000 1876 319 1 914 BoxColFill
> +1.000 1877 319 2 817 BoxColFill
> +1.000 1879 319 1 985 BoxColFill
> +1.000 1880 319 2 702 BoxColFill
> +1.000 1882 319 1 861 BoxColFill
> +1.000 1883 319 2 772 BoxColFill
> +1.000 1885 319 1 861 BoxColFill
> +1.000 1886 319 2 852 BoxColFill
> +1.000 1887 319 2 684 BoxColFill
> +1.000 1889 319 2 772 BoxColFill
> +1.000 1890 319 2 781 BoxColFill
> +1.000 1892 319 2 923 BoxColFill
> +1.000 1893 319 2 888 BoxColFill
> +1.000 1895 319 1 905 BoxColFill
> +1.000 1896 319 2 790 BoxColFill
> +1.000 1898 319 1 817 BoxColFill
> +1.000 1899 319 2 826 BoxColFill
> +1.000 1901 319 1 719 BoxColFill
> +1.000 1902 319 2 923 BoxColFill
> +1.000 1903 319 2 799 BoxColFill
> +1.000 1905 319 2 968 BoxColFill
> +1.000 1906 319 2 1021 BoxColFill
> +1.000 1908 319 2 799 BoxColFill
> +1.000 1909 319 2 835 BoxColFill
> +1.000 1911 319 1 675 BoxColFill
> +1.000 1912 319 2 808 BoxColFill
> +1.000 1914 319 1 817 BoxColFill
> +1.000 1915 319 2 879 BoxColFill
> +1.000 1917 319 1 1030 BoxColFill
> +1.000 1918 319 2 826 BoxColFill
> +1.000 1920 319 1 755 BoxColFill
> +1.000 1921 319 2 755 BoxColFill
> +1.000 1922 319 2 746 BoxColFill
> +1.000 1924 319 2 879 BoxColFill
> +1.000 1925 319 2 728 BoxColFill
> +1.000 1927 319 2 728 BoxColFill
> +1.000 1928 319 2 861 BoxColFill
> +1.000 1930 319 1 772 BoxColFill
> +1.000 1931 319 2 985 BoxColFill
> +1.000 1933 319 1 799 BoxColFill
> +1.000 1934 319 2 826 BoxColFill
> +1.000 1936 319 1 905 BoxColFill
> +1.000 1937 319 2 737 BoxColFill
> +1.000 1938 319 2 799 BoxColFill
> +1.000 1940 319 2 852 BoxColFill
> +1.000 1941 319 2 702 BoxColFill
> +1.000 1943 319 2 914 BoxColFill
> +1.000 1944 319 2 781 BoxColFill
> +1.000 1946 319 1 835 BoxColFill
> +1.000 1947 319 2 764 BoxColFill
> +1.000 1949 319 1 755 BoxColFill
> +1.000 1950 319 2 755 BoxColFill
> +1.000 1952 319 1 799 BoxColFill
> +1.000 1953 319 2 817 BoxColFill
> +1.000 1954 319 2 950 BoxColFill
> +1.000 1956 319 2 710 BoxColFill
> +1.000 1957 319 2 923 BoxColFill
> +1.000 1959 319 2 861 BoxColFill
> +1.000 1960 319 2 799 BoxColFill
> +1.000 1962 319 2 941 BoxColFill
> +1.000 1963 319 2 888 BoxColFill
> +1.000 1965 319 1 1030 BoxColFill
> +1.000 1966 319 2 852 BoxColFill
> +1.000 1968 319 1 702 BoxColFill
> +1.000 1969 319 2 657 BoxColFill
> +1.000 1971 319 1 861 BoxColFill
> +1.000 1972 319 2 843 BoxColFill
> +1.000 1973 319 2 772 BoxColFill
> +1.000 1975 319 2 710 BoxColFill
> +1.000 1976 319 2 772 BoxColFill
> +1.000 1978 319 2 976 BoxColFill
> +1.000 1979 319 2 772 BoxColFill
> +1.000 1981 319 1 817 BoxColFill
> +1.000 1982 319 2 826 BoxColFill
> +1.000 1984 319 1 976 BoxColFill
> +1.000 1985 319 2 826 BoxColFill
> +1.000 1987 319 1 772 BoxColFill
> +1.000 1988 319 2 684 BoxColFill
> +1.000 1989 319 2 631 BoxColFill
> +1.000 1991 319 2 737 BoxColFill
> +1.000 1992 319 2 772 BoxColFill
> +1.000 1994 319 2 755 BoxColFill
> +1.000 1995 319 2 755 BoxColFill
> +1.000 1997 319 2 684 BoxColFill
> +1.000 1998 319 2 666 BoxColFill
> +1.000 2000 319 1 728 BoxColFill
> +1.000 2001 319 2 648 BoxColFill
> +1.000 2003 319 1 843 BoxColFill
> +1.000 2004 319 2 702 BoxColFill
> +1.000 2006 319 1 577 BoxColFill
> +1.000 2007 319 2 631 BoxColFill
> +1.000 2008 319 2 817 BoxColFill
> +1.000 2010 319 2 905 BoxColFill
> +1.000 2011 319 2 719 BoxColFill
> +1.000 2013 319 2 790 BoxColFill
> +1.000 2014 319 2 551 BoxColFill
> +1.000 2016 319 1 843 BoxColFill
> +1.000 2017 319 2 746 BoxColFill
> +1.000 2019 319 1 932 BoxColFill
> +1.000 2020 319 2 799 BoxColFill
> +1.000 2022 319 1 728 BoxColFill
> +1.000 2023 319 2 675 BoxColFill
> +1.000 2024 319 2 737 BoxColFill
> +1.000 2026 319 2 631 BoxColFill
> +1.000 2027 319 2 595 BoxColFill
> +1.000 2029 319 2 755 BoxColFill
> +1.000 2030 319 2 622 BoxColFill
> +1.000 2032 319 2 675 BoxColFill
> +1.000 2033 319 2 737 BoxColFill
> +1.000 2035 319 1 702 BoxColFill
> +1.000 2036 319 2 666 BoxColFill
> +1.000 2038 319 1 639 BoxColFill
> +1.000 2039 319 2 577 BoxColFill
> +1.000 2041 319 1 808 BoxColFill
> +1.000 2042 319 2 648 BoxColFill
> +1.000 2043 319 2 648 BoxColFill
> +1.000 2045 319 2 772 BoxColFill
> +1.000 2046 319 2 719 BoxColFill
> +1.000 2048 319 2 560 BoxColFill
> +1.000 2049 319 2 755 BoxColFill
> +1.000 2051 319 1 631 BoxColFill
> +1.000 2052 319 2 799 BoxColFill
> +1.000 2054 319 1 843 BoxColFill
> +1.000 2055 319 2 693 BoxColFill
> +1.000 2057 319 1 728 BoxColFill
> +1.000 2058 319 2 781 BoxColFill
> +1.000 2059 319 2 631 BoxColFill
> +1.000 2061 319 2 622 BoxColFill
> +1.000 2062 319 2 595 BoxColFill
> +1.000 2064 319 2 781 BoxColFill
> +1.000 2065 319 2 666 BoxColFill
> +1.000 2067 319 1 622 BoxColFill
> +1.000 2068 319 2 684 BoxColFill
> +1.000 2070 319 1 631 BoxColFill
> +1.000 2071 319 2 817 BoxColFill
> +1.000 2073 319 1 737 BoxColFill
> +1.000 2074 319 2 693 BoxColFill
> +1.000 2076 319 1 693 BoxColFill
> +1.000 2077 319 2 728 BoxColFill
> +1.000 2078 319 2 613 BoxColFill
> +1.000 2080 319 2 489 BoxColFill
> +1.000 2081 319 2 639 BoxColFill
> +1.000 2083 319 2 577 BoxColFill
> +1.000 2084 319 2 568 BoxColFill
> +1.000 2086 319 1 728 BoxColFill
> +1.000 2087 319 2 595 BoxColFill
> +1.000 2089 319 1 542 BoxColFill
> +1.000 2090 319 2 799 BoxColFill
> +1.000 2092 319 1 684 BoxColFill
> +1.000 2093 319 2 684 BoxColFill
> +1.000 2094 319 2 577 BoxColFill
> +1.000 2096 319 2 568 BoxColFill
> +1.000 2097 319 2 506 BoxColFill
> +1.000 2099 319 2 542 BoxColFill
> +1.000 2100 319 2 586 BoxColFill
> +1.000 2102 319 1 781 BoxColFill
> +1.000 2103 319 2 568 BoxColFill
> +1.000 2105 319 1 648 BoxColFill
> +1.000 2106 319 2 604 BoxColFill
> +1.000 2108 319 1 728 BoxColFill
> +1.000 2109 319 2 604 BoxColFill
> +1.000 2111 319 1 533 BoxColFill
> +1.000 2112 319 2 657 BoxColFill
> +1.000 2113 319 2 489 BoxColFill
> +1.000 2115 319 2 577 BoxColFill
> +1.000 2116 319 2 498 BoxColFill
> +1.000 2118 319 2 719 BoxColFill
> +1.000 2119 319 2 595 BoxColFill
> +1.000 2121 319 1 657 BoxColFill
> +1.000 2122 319 2 498 BoxColFill
> +1.000 2124 319 1 746 BoxColFill
> +1.000 2125 319 2 622 BoxColFill
> +1.000 2127 319 1 657 BoxColFill
> +1.000 2128 319 2 648 BoxColFill
> +1.000 2129 319 2 480 BoxColFill
> +1.000 2131 319 2 462 BoxColFill
> +1.000 2132 319 2 666 BoxColFill
> +1.000 2134 319 2 666 BoxColFill
> +1.000 2135 319 2 515 BoxColFill
> +1.000 2137 319 1 551 BoxColFill
> +1.000 2138 319 2 560 BoxColFill
> +1.000 2140 319 1 542 BoxColFill
> +1.000 2141 319 2 524 BoxColFill
> +1.000 2143 319 1 666 BoxColFill
> +1.000 2144 319 2 533 BoxColFill
> +1.000 2145 319 2 506 BoxColFill
> +1.000 2147 319 2 462 BoxColFill
> +1.000 2148 319 2 506 BoxColFill
> +1.000 2150 319 2 568 BoxColFill
> +1.000 2151 319 2 471 BoxColFill
> +1.000 2153 319 2 462 BoxColFill
> +1.000 2154 319 2 365 BoxColFill
> +1.000 2156 319 1 489 BoxColFill
> +1.000 2157 319 2 684 BoxColFill
> +1.000 2159 319 1 622 BoxColFill
> +1.000 2160 319 2 489 BoxColFill
> +1.000 2162 319 1 533 BoxColFill
> +1.000 2163 319 2 435 BoxColFill
> +1.000 2164 319 2 480 BoxColFill
> +1.000 2166 319 2 524 BoxColFill
> +1.000 2167 319 2 551 BoxColFill
> +1.000 2169 319 2 693 BoxColFill
> +1.000 2170 319 2 595 BoxColFill
> +1.000 2172 319 1 365 BoxColFill
> +1.000 2173 319 2 515 BoxColFill
> +1.000 2175 319 1 515 BoxColFill
> +1.000 2176 319 2 444 BoxColFill
> +1.000 2178 319 1 480 BoxColFill
> +1.000 2179 319 2 409 BoxColFill
> +1.000 2180 319 2 453 BoxColFill
> +1.000 2182 319 2 435 BoxColFill
> +1.000 2183 319 2 533 BoxColFill
> +1.000 2185 319 2 409 BoxColFill
> +1.000 2186 319 2 480 BoxColFill
> +1.000 2188 319 2 506 BoxColFill
> +1.000 2189 319 2 365 BoxColFill
> +1.000 2191 319 1 444 BoxColFill
> +1.000 2192 319 2 568 BoxColFill
> +1.000 2194 319 1 409 BoxColFill
> +1.000 2195 319 2 462 BoxColFill
> +1.000 2197 319 1 400 BoxColFill
> +1.000 2198 319 2 365 BoxColFill
> +1.000 2199 319 2 391 BoxColFill
> +1.000 2201 319 2 347 BoxColFill
> +1.000 2202 319 2 462 BoxColFill
> +1.000 2204 319 2 498 BoxColFill
> +1.000 2205 319 2 498 BoxColFill
> +1.000 2207 319 1 365 BoxColFill
> +1.000 2208 319 2 391 BoxColFill
> +1.000 2210 319 1 471 BoxColFill
> +1.000 2211 319 2 418 BoxColFill
> +1.000 2213 319 1 409 BoxColFill
> +1.000 2214 319 2 338 BoxColFill
> +1.000 2215 319 2 382 BoxColFill
> +1.000 2217 319 2 444 BoxColFill
> +1.000 2218 319 2 435 BoxColFill
> +1.000 2220 319 2 382 BoxColFill
> +1.000 2221 319 2 302 BoxColFill
> +1.000 2223 319 1 356 BoxColFill
> +1.000 2224 319 2 400 BoxColFill
> +1.000 2226 319 1 453 BoxColFill
> +1.000 2227 319 2 365 BoxColFill
> +1.000 2229 319 1 338 BoxColFill
> +1.000 2230 319 2 365 BoxColFill
> +1.000 2232 319 1 435 BoxColFill
> +1.000 2233 319 2 329 BoxColFill
> +1.000 2234 319 2 311 BoxColFill
> +1.000 2236 319 2 347 BoxColFill
> +1.000 2237 319 2 471 BoxColFill
> +1.000 2239 319 2 249 BoxColFill
> +1.000 2240 319 2 338 BoxColFill
> +1.000 2242 319 1 373 BoxColFill
> +1.000 2243 319 2 232 BoxColFill
> +1.000 2245 319 1 356 BoxColFill
> +1.000 2246 319 2 365 BoxColFill
> +1.000 2248 319 1 347 BoxColFill
> +1.000 2249 319 2 435 BoxColFill
> +1.000 2250 319 2 365 BoxColFill
> +1.000 2252 319 2 196 BoxColFill
> +1.000 2253 319 2 329 BoxColFill
> +1.000 2255 319 2 329 BoxColFill
> +1.000 2256 319 2 356 BoxColFill
> +1.000 2258 319 1 285 BoxColFill
> +1.000 2259 319 2 258 BoxColFill
> +1.000 2261 319 1 267 BoxColFill
> +1.000 2262 319 2 187 BoxColFill
> +1.000 2264 319 1 329 BoxColFill
> +1.000 2265 319 2 302 BoxColFill
> +1.000 2267 319 1 249 BoxColFill
> +1.000 2268 319 2 249 BoxColFill
> +1.000 2269 319 2 205 BoxColFill
> +1.000 2271 319 2 267 BoxColFill
> +1.000 2272 319 2 276 BoxColFill
> +1.000 2274 319 2 240 BoxColFill
> +1.000 2275 319 2 205 BoxColFill
> +1.000 2277 319 1 391 BoxColFill
> +1.000 2278 319 2 240 BoxColFill
> +1.000 2280 319 1 258 BoxColFill
> +1.000 2281 319 2 205 BoxColFill
> +1.000 2283 319 1 240 BoxColFill
> +1.000 2284 319 2 249 BoxColFill
> +1.000 2285 319 2 178 BoxColFill
> +1.000 2287 319 2 267 BoxColFill
> +1.000 2288 319 2 267 BoxColFill
> +1.000 2290 319 2 764 BoxColFill
> +1.000 2291 319 2 1242 BoxColFill
> +1.000 2293 319 1 276 BoxColFill
> +1.000 2294 319 2 134 BoxColFill
> +1.000 2296 319 1 90 BoxColFill
> +1.000 2297 319 2 249 BoxColFill
> +1.000 2299 319 1 240 BoxColFill
> +1.000 2300 319 2 134 BoxColFill
> +1.000 2302 319 1 152 BoxColFill
> +1.000 2303 319 2 169 BoxColFill
> +1.000 2304 319 2 187 BoxColFill
> +1.000 2306 319 2 196 BoxColFill
> +1.000 2307 319 2 187 BoxColFill
> +1.000 2309 319 2 214 BoxColFill
> +1.000 2310 319 2 223 BoxColFill
> +1.000 2312 319 1 187 BoxColFill
> +1.000 2313 319 2 125 BoxColFill
> +1.000 2315 319 1 125 BoxColFill
> +1.000 2316 319 2 196 BoxColFill
> +1.000 2318 319 1 205 BoxColFill
> +1.000 2319 319 2 258 BoxColFill
> +1.000 2320 319 2 178 BoxColFill
> +1.000 2322 319 2 187 BoxColFill
> +1.000 2323 319 2 152 BoxColFill
> +1.000 2325 319 2 169 BoxColFill
> +1.000 2326 319 2 134 BoxColFill
> +1.000 2328 319 1 161 BoxColFill
> +1.000 2329 319 2 125 BoxColFill
> +1.000 2331 319 1 161 BoxColFill
> +1.000 2332 319 2 187 BoxColFill
> +1.000 2334 319 1 143 BoxColFill
> +1.000 2335 319 2 63 BoxColFill
> +1.000 2336 319 2 72 BoxColFill
> +1.000 2338 319 2 90 BoxColFill
> +1.000 2339 319 2 99 BoxColFill
> +1.000 2341 319 2 99 BoxColFill
> +1.000 2342 319 2 72 BoxColFill
> +1.000 2344 319 2 125 BoxColFill
> +1.000 2345 319 2 125 BoxColFill
> +1.000 2347 319 1 143 BoxColFill
> +1.000 2348 319 2 45 BoxColFill
> +1.000 2350 319 1 107 BoxColFill
> +1.000 2351 319 2 107 BoxColFill
> +1.000 2353 319 1 107 BoxColFill
> +1.000 2354 319 2 72 BoxColFill
> +1.000 2355 319 2 161 BoxColFill
> +1.000 2357 319 2 72 BoxColFill
> +1.000 2358 319 2 116 BoxColFill
> +1.000 2360 319 2 45 BoxColFill
> +1.000 2361 319 2 99 BoxColFill
> +1.000 2363 319 1 36 BoxColFill
> +1.000 2364 319 2 45 BoxColFill
> +1.000 2366 319 1 63 BoxColFill
> +1.000 2367 319 2 90 BoxColFill
> +1.000 2369 319 1 81 BoxColFill
> +1.000 2370 319 2 63 BoxColFill
> +1.000 2371 319 2 90 BoxColFill
> +1.000 2373 319 2 72 BoxColFill
> +1.000 2374 319 2 63 BoxColFill
> +1.000 2376 319 2 72 BoxColFill
> +1.000 2377 319 2 45 BoxColFill
> +1.000 2379 319 2 81 BoxColFill
> +1.000 2380 319 2 54 BoxColFill
> +1.000 2382 319 1 63 BoxColFill
> +1.000 2383 319 2 19 BoxColFill
> +1.000 2385 319 1 45 BoxColFill
> +1.000 2386 319 2 54 BoxColFill
> +1.000 2388 319 1 54 BoxColFill
> +1.000 2389 319 2 45 BoxColFill
> +1.000 2390 319 2 28 BoxColFill
> +1.000 2392 319 2 54 BoxColFill
> +1.000 2393 319 2 28 BoxColFill
> +1.000 2395 319 2 81 BoxColFill
> +1.000 2396 319 2 36 BoxColFill
> +1.000 2398 319 1 28 BoxColFill
> +1.000 2399 319 2 28 BoxColFill
> +1.000 2401 319 1 54 BoxColFill
> +1.000 2402 319 2 36 BoxColFill
> +1.000 2404 319 1 116 BoxColFill
> +1.000 2405 319 2 54 BoxColFill
> +1.000 2406 319 2 63 BoxColFill
> +1.000 2408 319 2 28 BoxColFill
> +1.000 2409 319 2 36 BoxColFill
> +1.000 2411 319 2 36 BoxColFill
> +1.000 2412 319 2 28 BoxColFill
> +1.000 2414 319 1 28 BoxColFill
> +1.000 2415 319 2 45 BoxColFill
> +1.000 2417 319 1 28 BoxColFill
> +1.000 2418 319 2 28 BoxColFill
> +1.000 2420 319 1 19 BoxColFill
> +1.000 2421 319 2 72 BoxColFill
> +1.000 2423 319 1 36 BoxColFill
> +1.000 2424 319 2 10 BoxColFill
> +1.000 2425 319 2 10 BoxColFill
> +1.000 2427 319 2 63 BoxColFill
> +1.000 2428 319 2 36 BoxColFill
> +1.000 2430 319 2 28 BoxColFill
> +1.000 2431 319 2 19 BoxColFill
> +1.000 2433 319 1 63 BoxColFill
> +1.000 2434 319 2 28 BoxColFill
> +1.000 2436 319 1 36 BoxColFill
> +1.000 2437 319 2 19 BoxColFill
> +1.000 2439 319 1 19 BoxColFill
> +1.000 2440 319 2 28 BoxColFill
> +1.000 2441 319 2 19 BoxColFill
> +1.000 2443 319 2 10 BoxColFill
> +1.000 2444 319 2 19 BoxColFill
> +1.000 2446 319 2 19 BoxColFill
> +1.000 2447 319 2 63 BoxColFill
> +1.000 2449 319 1 28 BoxColFill
> +1.000 2450 319 2 19 BoxColFill
> +1.000 2452 319 1 28 BoxColFill
> +1.000 2453 319 2 54 BoxColFill
> +1.000 2455 319 1 45 BoxColFill
> +1.000 2456 319 2 45 BoxColFill
> +1.000 2458 319 1 28 BoxColFill
> +1.000 2459 319 2 45 BoxColFill
> +1.000 2462 319 2 36 BoxColFill
> +1.000 2463 319 2 45 BoxColFill
> +1.000 2465 319 2 28 BoxColFill
> +1.000 2466 319 2 28 BoxColFill
> +1.000 2468 319 1 28 BoxColFill
> +1.000 2469 319 2 72 BoxColFill
> +1.000 2471 319 1 36 BoxColFill
> +1.000 2472 319 2 28 BoxColFill
> +1.000 2474 319 1 36 BoxColFill
> +1.000 2475 319 2 10 BoxColFill
> +1.000 2476 319 2 36 BoxColFill
> +1.000 2478 319 2 36 BoxColFill
> +1.000 2479 319 2 10 BoxColFill
> +1.000 2481 319 2 10 BoxColFill
> +1.000 2482 319 2 28 BoxColFill
> +1.000 2485 319 2 10 BoxColFill
> +1.000 2487 319 1 19 BoxColFill
> +1.000 2488 319 2 19 BoxColFill
> +1.000 2490 319 1 28 BoxColFill
> +1.000 2491 319 2 28 BoxColFill
> +1.000 2492 319 2 19 BoxColFill
> +1.000 2494 319 2 28 BoxColFill
> +1.000 2495 319 2 10 BoxColFill
> +1.000 2497 319 2 36 BoxColFill
> +1.000 2498 319 2 28 BoxColFill
> +1.000 2500 319 2 10 BoxColFill
> +1.000 2501 319 2 19 BoxColFill
> +1.000 2503 319 1 10 BoxColFill
> +1.000 2504 319 2 45 BoxColFill
> +1.000 2506 319 1 10 BoxColFill
> +1.000 2509 319 1 19 BoxColFill
> +1.000 2510 319 2 36 BoxColFill
> +1.000 2511 319 2 19 BoxColFill
> +1.000 2513 319 2 10 BoxColFill
> +1.000 2514 319 2 19 BoxColFill
> +1.000 2516 319 2 19 BoxColFill
> +1.000 2517 319 2 28 BoxColFill
> +1.000 2519 319 1 45 BoxColFill
> +1.000 2520 319 2 54 BoxColFill
> +1.000 2522 319 1 10 BoxColFill
> +1.000 2523 319 2 10 BoxColFill
> +1.000 2525 319 1 19 BoxColFill
> +1.000 2526 319 2 19 BoxColFill
> +1.000 2527 319 2 10 BoxColFill
> +1.000 2529 319 2 10 BoxColFill
> +1.000 2532 319 2 36 BoxColFill
> +1.000 2533 319 2 19 BoxColFill
> +1.000 2535 319 2 19 BoxColFill
> +1.000 2536 319 2 19 BoxColFill
> +1.000 2538 319 1 19 BoxColFill
> +1.000 2541 319 1 10 BoxColFill
> +1.000 2542 319 2 19 BoxColFill
> +1.000 2544 319 1 28 BoxColFill
> +1.000 2545 319 2 10 BoxColFill
> +1.000 2546 319 2 10 BoxColFill
> +1.000 2548 319 2 19 BoxColFill
> +1.000 2552 319 2 10 BoxColFill
> +1.000 2554 319 1 10 BoxColFill
> +1.000 2557 319 1 10 BoxColFill
> +1.000 2558 319 2 28 BoxColFill
> +1.000 2560 319 1 10 BoxColFill
> +1.000 2561 319 2 10 BoxColFill
> +1.000 2562 319 2 54 BoxColFill
> +1.000 2564 319 2 36 BoxColFill
> +1.000 2565 319 2 10 BoxColFill
> +1.000 2567 319 2 19 BoxColFill
> +1.000 2571 319 2 36 BoxColFill
> +1.000 2573 319 1 19 BoxColFill
> +1.000 2574 319 2 19 BoxColFill
> +1.000 2576 319 1 19 BoxColFill
> +1.000 2577 319 2 19 BoxColFill
> +1.000 2580 319 2 28 BoxColFill
> +1.000 2581 319 2 28 BoxColFill
> +1.000 2584 319 2 10 BoxColFill
> +1.000 2586 319 2 10 BoxColFill
> +1.000 2589 319 1 10 BoxColFill
> +1.000 2590 319 2 19 BoxColFill
> +1.000 2592 319 1 28 BoxColFill
> +1.000 2595 319 1 10 BoxColFill
> +1.000 2596 319 2 10 BoxColFill
> +1.000 2597 319 2 10 BoxColFill
> +1.000 2599 319 2 10 BoxColFill
> +1.000 2600 319 2 19 BoxColFill
> +1.000 2602 319 2 10 BoxColFill
> +1.000 2603 319 2 19 BoxColFill
> +1.000 2606 319 2 10 BoxColFill
> +1.000 2609 319 2 10 BoxColFill
> +1.000 2612 319 2 10 BoxColFill
> +1.000 2615 319 2 10 BoxColFill
> +1.000 2619 319 2 10 BoxColFill
> +1.000 2621 319 2 19 BoxColFill
> +1.000 2622 319 2 10 BoxColFill
> +1.000 2624 319 1 10 BoxColFill
>  % End plot #1
>  2.000 UL
>  LTb
> @@ -2579,11 +3536,11 @@ LCb setrgbcolor
>  1.000 UL
>  LTB
>  LCb setrgbcolor
> -392 1720 N
> -392 256 L
> -2235 0 V
> -0 1464 V
> --2235 0 V
> +440 1720 N
> +440 319 L
> +2187 0 V
> +0 1401 V
> +-2187 0 V
>  Z stroke
>  1.000 UP
>  1.000 UL
> diff --git a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/fre.eps b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/fre.eps
> index bc17dfba..00600638 100644
> --- a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/fre.eps
> +++ b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/fre.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: fre.eps
>  %%Creator: gnuplot 5.4 patchlevel 2
> -%%CreationDate: Tue Jan 30 09:04:30 2024
> +%%CreationDate: Sun Feb  4 08:55:38 2024
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 327 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jan 30 09:04:30 2024)
> +  /CreationDate (Sun Feb  4 08:55:38 2024)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1917,12 +1917,12 @@ BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> +440 319 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 256 M
> +392 319 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -1930,72 +1930,72 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 465 M
> +440 519 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 465 M
> +392 519 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.05)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 674 M
> +440 719 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 674 M
> +392 719 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.1)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 883 M
> +440 919 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 883 M
> +392 919 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.15)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1093 M
> +440 1120 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1093 M
> +392 1120 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.2)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1302 M
> +440 1320 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1302 M
> +392 1320 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.25)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1511 M
> +440 1520 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1511 M
> +392 1520 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2014,10 +2014,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> -0 63 V
> -0 1401 R
> +440 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  440 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-200)]
> @@ -2026,10 +2026,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -877 256 M
> -0 63 V
> -0 1401 R
> +877 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  877 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-150)]
> @@ -2038,10 +2038,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1315 256 M
> -0 63 V
> -0 1401 R
> +1315 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1315 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-100)]
> @@ -2050,10 +2050,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1752 256 M
> -0 63 V
> -0 1401 R
> +1752 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1752 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (-50)]
> @@ -2062,10 +2062,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2190 256 M
> -0 63 V
> -0 1401 R
> +2190 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2190 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
> @@ -2074,10 +2074,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2627 256 M
> -0 63 V
> -0 1401 R
> +2627 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2627 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 50)]
> @@ -2089,15 +2089,15 @@ LCb setrgbcolor
>  1.000 UL
>  LTa
>  LCb setrgbcolor
> -2190 256 M
> -0 1464 V
> +2190 319 M
> +0 1401 V
>  stroke
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> @@ -2105,7 +2105,7 @@ Z stroke
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -76 988 M
> +76 1019 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Frequency \(arb. unit\))]
>  ] -26.7 MCshow
> @@ -2122,762 +2122,132 @@ LTb
>  1.000 UL
>  LTb
>  0.58 0.00 0.83 C
> -440 256 N
> -0 5 V
> -9 0 V
> -0 -5 V
> --9 0 V
> -Z stroke
> -449 256 N
> -0 4 V
> -17 0 V
> -0 -4 V
> --17 0 V
> -Z stroke
> -466 256 N
> -0 2 V
> -18 0 V
> -0 -2 V
> --18 0 V
> -Z stroke
> -484 256 N
> -0 11 V
> -17 0 V
> -0 -11 V
> --17 0 V
> -Z stroke
> -501 256 N
> -0 7 V
> -18 0 V
> -0 -7 V
> --18 0 V
> -Z stroke
> -519 256 N
> -0 7 V
> -17 0 V
> -0 -7 V
> --17 0 V
> -Z stroke
> -536 256 N
> -0 16 V
> -18 0 V
> -0 -16 V
> --18 0 V
> -Z stroke
> -554 256 N
> -0 31 V
> -17 0 V
> -0 -31 V
> --17 0 V
> -Z stroke
> -571 256 N
> -0 30 V
> -18 0 V
> -0 -30 V
> --18 0 V
> -Z stroke
> -589 256 N
> -0 52 V
> -17 0 V
> -0 -52 V
> --17 0 V
> -Z stroke
> -606 256 N
> -0 62 V
> -18 0 V
> -0 -62 V
> --18 0 V
> -Z stroke
> -624 256 N
> -0 79 V
> -17 0 V
> -0 -79 V
> --17 0 V
> -Z stroke
> -641 256 N
> -0 116 V
> -18 0 V
> -0 -116 V
> --18 0 V
> -Z stroke
> -659 256 N
> -0 143 V
> -17 0 V
> -0 -143 V
> --17 0 V
> -Z stroke
> -676 256 N
> -0 125 V
> -18 0 V
> -0 -125 V
> --18 0 V
> -Z stroke
> -694 256 N
> -0 183 V
> -17 0 V
> -0 -183 V
> --17 0 V
> -Z stroke
> -711 256 N
> -0 224 V
> -18 0 V
> -0 -224 V
> --18 0 V
> -Z stroke
> -729 256 N
> -0 266 V
> -17 0 V
> -0 -266 V
> --17 0 V
> -Z stroke
> -746 256 N
> -0 295 V
> -18 0 V
> -0 -295 V
> --18 0 V
> -Z stroke
> -764 256 N
> -0 331 V
> -17 0 V
> -0 -331 V
> --17 0 V
> -Z stroke
> -781 256 N
> -0 379 V
> -18 0 V
> -0 -379 V
> --18 0 V
> -Z stroke
> -799 256 N
> -0 393 V
> -17 0 V
> -0 -393 V
> --17 0 V
> -Z stroke
> -816 256 N
> -0 428 V
> -18 0 V
> -0 -428 V
> --18 0 V
> -Z stroke
> -834 256 N
> -0 490 V
> -17 0 V
> -0 -490 V
> --17 0 V
> -Z stroke
> -851 256 N
> -0 520 V
> -18 0 V
> -0 -520 V
> --18 0 V
> -Z stroke
> -869 256 N
> -0 550 V
> -17 0 V
> -0 -550 V
> --17 0 V
> -Z stroke
> -886 256 N
> -0 542 V
> -18 0 V
> -0 -542 V
> --18 0 V
> -Z stroke
> -904 256 N
> -0 589 V
> -17 0 V
> -0 -589 V
> --17 0 V
> -Z stroke
> -921 256 N
> -0 639 V
> -18 0 V
> -0 -639 V
> --18 0 V
> -Z stroke
> -939 256 N
> -0 608 V
> -17 0 V
> -0 -608 V
> --17 0 V
> -Z stroke
> -956 256 N
> -0 684 V
> -18 0 V
> -0 -684 V
> --18 0 V
> -Z stroke
> -974 256 N
> -0 659 V
> -17 0 V
> -0 -659 V
> --17 0 V
> -Z stroke
> -991 256 N
> -0 644 V
> -18 0 V
> -0 -644 V
> --18 0 V
> -Z stroke
> -1009 256 N
> -0 645 V
> -17 0 V
> -0 -645 V
> --17 0 V
> -Z stroke
> -1026 256 N
> -0 678 V
> -18 0 V
> -0 -678 V
> --18 0 V
> -Z stroke
> -1044 256 N
> -0 738 V
> -17 0 V
> -0 -738 V
> --17 0 V
> -Z stroke
> -1061 256 N
> -0 683 V
> -18 0 V
> -0 -683 V
> --18 0 V
> -Z stroke
> -1079 256 N
> -0 685 V
> -17 0 V
> -0 -685 V
> --17 0 V
> -Z stroke
> -1096 256 N
> -0 625 V
> -18 0 V
> -0 -625 V
> --18 0 V
> -Z stroke
> -1114 256 N
> -0 679 V
> -17 0 V
> -0 -679 V
> --17 0 V
> -Z stroke
> -1131 256 N
> -0 657 V
> -18 0 V
> -0 -657 V
> --18 0 V
> -Z stroke
> -1149 256 N
> -0 711 V
> -17 0 V
> -0 -711 V
> --17 0 V
> -Z stroke
> -1166 256 N
> -0 722 V
> -18 0 V
> -0 -722 V
> --18 0 V
> -Z stroke
> -1184 256 N
> -0 644 V
> -17 0 V
> -0 -644 V
> --17 0 V
> -Z stroke
> -1201 256 N
> -0 646 V
> -18 0 V
> -0 -646 V
> --18 0 V
> -Z stroke
> -1219 256 N
> -0 683 V
> -17 0 V
> -0 -683 V
> --17 0 V
> -Z stroke
> -1236 256 N
> -0 693 V
> -18 0 V
> -0 -693 V
> --18 0 V
> -Z stroke
> -1254 256 N
> -0 733 V
> -17 0 V
> -0 -733 V
> --17 0 V
> -Z stroke
> -1271 256 N
> -0 824 V
> -18 0 V
> -0 -824 V
> --18 0 V
> -Z stroke
> -1289 256 N
> -0 798 V
> -17 0 V
> -0 -798 V
> --17 0 V
> -Z stroke
> -1306 256 N
> -0 816 V
> -18 0 V
> -0 -816 V
> --18 0 V
> -Z stroke
> -1324 256 N
> -0 877 V
> -17 0 V
> -0 -877 V
> --17 0 V
> -Z stroke
> -1341 256 N
> -0 939 V
> -18 0 V
> -0 -939 V
> --18 0 V
> -Z stroke
> -1359 256 N
> -0 971 V
> -17 0 V
> -0 -971 V
> --17 0 V
> -Z stroke
> -1376 256 N
> -0 957 V
> -18 0 V
> -0 -957 V
> --18 0 V
> -Z stroke
> -1394 256 N
> -0 1096 V
> -17 0 V
> -0 -1096 V
> --17 0 V
> -Z stroke
> -1411 256 N
> -0 1117 V
> -18 0 V
> -0 -1117 V
> --18 0 V
> -Z stroke
> -1429 256 N
> -0 1182 V
> -17 0 V
> -0 -1182 V
> --17 0 V
> -Z stroke
> -1446 256 N
> -0 1272 V
> -18 0 V
> -0 -1272 V
> --18 0 V
> -Z stroke
> -1464 256 N
> -0 1308 V
> -17 0 V
> -0 -1308 V
> --17 0 V
> -Z stroke
> -1481 256 N
> -0 1352 V
> -18 0 V
> -0 -1352 V
> --18 0 V
> -Z stroke
> -1499 256 N
> -0 1329 V
> -17 0 V
> -0 -1329 V
> --17 0 V
> -Z stroke
> -1516 256 N
> -0 1420 V
> -18 0 V
> -0 -1420 V
> --18 0 V
> -Z stroke
> -1534 256 N
> -0 1380 V
> -17 0 V
> -0 -1380 V
> --17 0 V
> -Z stroke
> -1551 256 N
> -0 1379 V
> -17 0 V
> -0 -1379 V
> --17 0 V
> -Z stroke
> -1568 256 N
> -0 1417 V
> -18 0 V
> -0 -1417 V
> --18 0 V
> -Z stroke
> -1586 256 N
> -0 1370 V
> -17 0 V
> -0 -1370 V
> --17 0 V
> -Z stroke
> -1603 256 N
> -0 1434 V
> -18 0 V
> -0 -1434 V
> --18 0 V
> -Z stroke
> -1621 256 N
> -0 1414 V
> -17 0 V
> -0 -1414 V
> --17 0 V
> -Z stroke
> -1638 256 N
> -0 1278 V
> -18 0 V
> -0 -1278 V
> --18 0 V
> -Z stroke
> -1656 256 N
> -0 1285 V
> -17 0 V
> -0 -1285 V
> --17 0 V
> -Z stroke
> -1673 256 N
> -0 1240 V
> -18 0 V
> -0 -1240 V
> --18 0 V
> -Z stroke
> -1691 256 N
> -0 1189 V
> -17 0 V
> -0 -1189 V
> --17 0 V
> -Z stroke
> -1708 256 N
> -0 1169 V
> -18 0 V
> -0 -1169 V
> --18 0 V
> -Z stroke
> -1726 256 N
> -0 1104 V
> -17 0 V
> -0 -1104 V
> --17 0 V
> -Z stroke
> -1743 256 N
> -0 1055 V
> -18 0 V
> -0 -1055 V
> --18 0 V
> -Z stroke
> -1761 256 N
> -0 981 V
> -17 0 V
> -0 -981 V
> --17 0 V
> -Z stroke
> -1778 256 N
> -0 919 V
> -18 0 V
> -0 -919 V
> --18 0 V
> -Z stroke
> -1796 256 N
> -0 909 V
> -17 0 V
> -0 -909 V
> --17 0 V
> -Z stroke
> -1813 256 N
> -0 831 V
> -18 0 V
> -0 -831 V
> --18 0 V
> -Z stroke
> -1831 256 N
> -0 784 V
> -17 0 V
> -0 -784 V
> --17 0 V
> -Z stroke
> -1848 256 N
> -0 712 V
> -18 0 V
> -0 -712 V
> --18 0 V
> -Z stroke
> -1866 256 N
> -0 743 V
> -17 0 V
> -0 -743 V
> --17 0 V
> -Z stroke
> -1883 256 N
> -0 689 V
> -18 0 V
> -0 -689 V
> --18 0 V
> -Z stroke
> -1901 256 N
> -0 640 V
> -17 0 V
> -0 -640 V
> --17 0 V
> -Z stroke
> -1918 256 N
> -0 668 V
> -18 0 V
> -0 -668 V
> --18 0 V
> -Z stroke
> -1936 256 N
> -0 667 V
> -17 0 V
> -0 -667 V
> --17 0 V
> -Z stroke
> -1953 256 N
> -0 746 V
> -18 0 V
> -0 -746 V
> --18 0 V
> -Z stroke
> -1971 256 N
> -0 700 V
> -17 0 V
> -0 -700 V
> --17 0 V
> -Z stroke
> -1988 256 N
> -0 784 V
> -18 0 V
> -0 -784 V
> --18 0 V
> -Z stroke
> -2006 256 N
> -0 780 V
> -17 0 V
> -0 -780 V
> --17 0 V
> -Z stroke
> -2023 256 N
> -0 854 V
> -18 0 V
> -0 -854 V
> --18 0 V
> -Z stroke
> -2041 256 N
> -0 906 V
> -17 0 V
> -0 -906 V
> --17 0 V
> -Z stroke
> -2058 256 N
> -0 900 V
> -18 0 V
> -0 -900 V
> --18 0 V
> -Z stroke
> -2076 256 N
> -0 888 V
> -17 0 V
> -0 -888 V
> --17 0 V
> -Z stroke
> -2093 256 N
> -0 994 V
> -18 0 V
> -0 -994 V
> --18 0 V
> -Z stroke
> -2111 256 N
> -0 935 V
> -17 0 V
> -0 -935 V
> --17 0 V
> -Z stroke
> -2128 256 N
> -0 908 V
> -18 0 V
> -0 -908 V
> --18 0 V
> -Z stroke
> -2146 256 N
> -0 927 V
> -17 0 V
> -0 -927 V
> --17 0 V
> -Z stroke
> -2163 256 N
> -0 758 V
> -18 0 V
> -0 -758 V
> --18 0 V
> -Z stroke
> -2181 256 N
> -0 855 V
> -17 0 V
> -0 -855 V
> --17 0 V
> -Z stroke
> -2198 256 N
> -0 852 V
> -18 0 V
> -0 -852 V
> --18 0 V
> -Z stroke
> -2216 256 N
> -0 830 V
> -17 0 V
> -0 -830 V
> --17 0 V
> -Z stroke
> -2233 256 N
> -0 808 V
> -18 0 V
> -0 -808 V
> --18 0 V
> -Z stroke
> -2251 256 N
> -0 820 V
> -17 0 V
> -0 -820 V
> --17 0 V
> -Z stroke
> -2268 256 N
> -0 752 V
> -18 0 V
> -0 -752 V
> --18 0 V
> -Z stroke
> -2286 256 N
> -0 729 V
> -17 0 V
> -0 -729 V
> --17 0 V
> -Z stroke
> -2303 256 N
> -0 711 V
> -18 0 V
> -0 -711 V
> --18 0 V
> -Z stroke
> -2321 256 N
> -0 671 V
> -17 0 V
> -0 -671 V
> --17 0 V
> -Z stroke
> -2338 256 N
> -0 626 V
> -18 0 V
> -0 -626 V
> --18 0 V
> -Z stroke
> -2356 256 N
> -0 528 V
> -17 0 V
> -0 -528 V
> --17 0 V
> -Z stroke
> -2373 256 N
> -0 455 V
> -18 0 V
> -0 -455 V
> --18 0 V
> -Z stroke
> -2391 256 N
> -0 468 V
> -17 0 V
> -0 -468 V
> --17 0 V
> -Z stroke
> -2408 256 N
> -0 326 V
> -18 0 V
> -0 -326 V
> --18 0 V
> -Z stroke
> -2426 256 N
> -0 268 V
> -17 0 V
> -0 -268 V
> --17 0 V
> -Z stroke
> -2443 256 N
> -0 211 V
> -18 0 V
> -0 -211 V
> --18 0 V
> -Z stroke
> -2461 256 N
> -0 160 V
> -17 0 V
> -0 -160 V
> --17 0 V
> -Z stroke
> -2478 256 N
> -0 139 V
> -18 0 V
> -0 -139 V
> --18 0 V
> -Z stroke
> -2496 256 N
> -0 179 V
> -17 0 V
> -0 -179 V
> --17 0 V
> -Z stroke
> -2513 256 N
> -0 95 V
> -18 0 V
> -0 -95 V
> --18 0 V
> -Z stroke
> -2531 256 N
> -0 43 V
> -17 0 V
> -0 -43 V
> --17 0 V
> -Z stroke
> -2548 256 N
> -0 36 V
> -18 0 V
> -0 -36 V
> --18 0 V
> -Z stroke
> -2566 256 N
> -0 33 V
> -17 0 V
> -0 -33 V
> --17 0 V
> -Z stroke
> -2583 256 N
> -0 35 V
> -18 0 V
> -0 -35 V
> --18 0 V
> -Z stroke
> -2601 256 N
> -0 16 V
> -17 0 V
> -0 -16 V
> --17 0 V
> -Z stroke
> -2618 256 N
> -0 19 V
> -9 0 V
> -0 -19 V
> --9 0 V
> -Z stroke
> +1.000 440 319 5 6 BoxColFill
> +1.000 453 319 10 5 BoxColFill
> +1.000 471 319 9 3 BoxColFill
> +1.000 488 319 10 11 BoxColFill
> +1.000 506 319 9 8 BoxColFill
> +1.000 523 319 10 8 BoxColFill
> +1.000 541 319 9 16 BoxColFill
> +1.000 558 319 10 30 BoxColFill
> +1.000 576 319 9 29 BoxColFill
> +1.000 593 319 10 51 BoxColFill
> +1.000 611 319 9 61 BoxColFill
> +1.000 628 319 10 77 BoxColFill
> +1.000 646 319 9 112 BoxColFill
> +1.000 663 319 10 138 BoxColFill
> +1.000 681 319 9 121 BoxColFill
> +1.000 698 319 10 176 BoxColFill
> +1.000 716 319 9 216 BoxColFill
> +1.000 733 319 10 255 BoxColFill
> +1.000 751 319 9 284 BoxColFill
> +1.000 768 319 10 318 BoxColFill
> +1.000 786 319 9 364 BoxColFill
> +1.000 803 319 10 377 BoxColFill
> +1.000 821 319 9 410 BoxColFill
> +1.000 838 319 10 470 BoxColFill
> +1.000 856 319 9 499 BoxColFill
> +1.000 873 319 10 527 BoxColFill
> +1.000 891 319 9 520 BoxColFill
> +1.000 908 319 10 564 BoxColFill
> +1.000 926 319 9 612 BoxColFill
> +1.000 943 319 10 583 BoxColFill
> +1.000 961 319 9 656 BoxColFill
> +1.000 978 319 10 631 BoxColFill
> +1.000 995 319 10 617 BoxColFill
> +1.000 1013 319 10 618 BoxColFill
> +1.000 1030 319 10 650 BoxColFill
> +1.000 1048 319 10 707 BoxColFill
> +1.000 1065 319 10 655 BoxColFill
> +1.000 1083 319 10 657 BoxColFill
> +1.000 1100 319 10 599 BoxColFill
> +1.000 1118 319 10 651 BoxColFill
> +1.000 1135 319 10 629 BoxColFill
> +1.000 1153 319 10 681 BoxColFill
> +1.000 1170 319 10 692 BoxColFill
> +1.000 1188 319 10 617 BoxColFill
> +1.000 1205 319 10 619 BoxColFill
> +1.000 1223 319 10 655 BoxColFill
> +1.000 1240 319 10 664 BoxColFill
> +1.000 1258 319 10 702 BoxColFill
> +1.000 1275 319 10 789 BoxColFill
> +1.000 1293 319 10 765 BoxColFill
> +1.000 1310 319 10 782 BoxColFill
> +1.000 1328 319 10 840 BoxColFill
> +1.000 1345 319 10 900 BoxColFill
> +1.000 1363 319 10 930 BoxColFill
> +1.000 1380 319 10 917 BoxColFill
> +1.000 1398 319 10 1050 BoxColFill
> +1.000 1415 319 10 1070 BoxColFill
> +1.000 1433 319 10 1132 BoxColFill
> +1.000 1450 319 10 1218 BoxColFill
> +1.000 1468 319 10 1253 BoxColFill
> +1.000 1485 319 10 1295 BoxColFill
> +1.000 1503 319 10 1273 BoxColFill
> +1.000 1520 319 10 1360 BoxColFill
> +1.000 1538 319 10 1321 BoxColFill
> +1.000 1555 319 10 1320 BoxColFill
> +1.000 1573 319 10 1357 BoxColFill
> +1.000 1590 319 10 1312 BoxColFill
> +1.000 1608 319 10 1373 BoxColFill
> +1.000 1625 319 10 1354 BoxColFill
> +1.000 1643 319 10 1224 BoxColFill
> +1.000 1660 319 10 1230 BoxColFill
> +1.000 1678 319 10 1188 BoxColFill
> +1.000 1695 319 10 1139 BoxColFill
> +1.000 1713 319 10 1120 BoxColFill
> +1.000 1730 319 10 1058 BoxColFill
> +1.000 1748 319 10 1010 BoxColFill
> +1.000 1765 319 10 939 BoxColFill
> +1.000 1783 319 10 881 BoxColFill
> +1.000 1800 319 10 870 BoxColFill
> +1.000 1818 319 10 797 BoxColFill
> +1.000 1835 319 10 751 BoxColFill
> +1.000 1853 319 10 682 BoxColFill
> +1.000 1870 319 10 712 BoxColFill
> +1.000 1888 319 10 661 BoxColFill
> +1.000 1905 319 10 613 BoxColFill
> +1.000 1923 319 10 640 BoxColFill
> +1.000 1940 319 10 639 BoxColFill
> +1.000 1958 319 10 714 BoxColFill
> +1.000 1975 319 10 671 BoxColFill
> +1.000 1993 319 10 751 BoxColFill
> +1.000 2010 319 10 748 BoxColFill
> +1.000 2028 319 10 818 BoxColFill
> +1.000 2045 319 10 868 BoxColFill
> +1.000 2063 319 10 862 BoxColFill
> +1.000 2080 319 10 851 BoxColFill
> +1.000 2098 319 9 953 BoxColFill
> +1.000 2115 319 10 896 BoxColFill
> +1.000 2133 319 9 869 BoxColFill
> +1.000 2150 319 10 888 BoxColFill
> +1.000 2168 319 9 727 BoxColFill
> +1.000 2185 319 10 819 BoxColFill
> +1.000 2203 319 9 817 BoxColFill
> +1.000 2220 319 10 795 BoxColFill
> +1.000 2238 319 9 774 BoxColFill
> +1.000 2255 319 10 785 BoxColFill
> +1.000 2273 319 9 721 BoxColFill
> +1.000 2290 319 10 698 BoxColFill
> +1.000 2308 319 9 681 BoxColFill
> +1.000 2325 319 10 643 BoxColFill
> +1.000 2343 319 9 600 BoxColFill
> +1.000 2360 319 10 507 BoxColFill
> +1.000 2378 319 9 437 BoxColFill
> +1.000 2395 319 10 449 BoxColFill
> +1.000 2413 319 9 313 BoxColFill
> +1.000 2430 319 10 257 BoxColFill
> +1.000 2448 319 9 203 BoxColFill
> +1.000 2465 319 10 154 BoxColFill
> +1.000 2483 319 9 134 BoxColFill
> +1.000 2500 319 10 172 BoxColFill
> +1.000 2518 319 9 92 BoxColFill
> +1.000 2535 319 10 43 BoxColFill
> +1.000 2553 319 9 35 BoxColFill
> +1.000 2570 319 10 32 BoxColFill
> +1.000 2588 319 9 34 BoxColFill
> +1.000 2605 319 10 16 BoxColFill
> +1.000 2623 319 5 19 BoxColFill
>  % End plot #1
>  2.000 UL
>  LTb
> @@ -2886,9 +2256,9 @@ LCb setrgbcolor
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> diff --git a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/plots.sh b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/plots.sh
> index dc55f3d5..98e40bfb 100644
> --- a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/plots.sh
> +++ b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/plots.sh
> @@ -124,11 +124,12 @@ set yrange [0:]
>  set nokey
>  #set border 3
>  set yzeroaxis
> -set boxwidth 40
> -#set style fill solid 1.0 noborder
> -bin_width = 40
> +set boxwidth 1
> +set style fill solid 1.0 noborder
> +set xtics out
> +bin_width = 2
>  bin(x) = bin_width * floor(x/bin_width)
> -plot "< perl expand.pl coe.dat" using (bin(column(1))):(20./N) smooth frequency with boxes
> +plot "< perl expand.pl coe.dat" using (bin(column(1))):(200./N) smooth frequency with boxes
>  ---EOF---
>  
>  gnuplot << ---EOF---
> @@ -145,8 +146,9 @@ set xrange [-200:50]
>  set yrange [0:]
>  set nokey
>  set yzeroaxis
> -set boxwidth 2
> -#set style fill solid 1.0 noborder
> +set boxwidth 1
> +set style fill solid 1.0 noborder
> +set xtics out
>  bin_width = 2
>  bin(x) = bin_width * floor(x/bin_width)
>  plot "< perl expand.pl fre.dat" using (bin(column(1))):(20./N) smooth frequency with boxes
> @@ -166,8 +168,9 @@ set xrange [0:350]
>  set yrange [0:]
>  set nokey
>  set yzeroaxis
> -set boxwidth 2
> -#set style fill solid 1.0 noborder
> +set boxwidth 1
> +set style fill solid 1.0 noborder
> +set xtics out
>  bin_width = 2
>  bin(x) = bin_width * floor(x/bin_width)
>  plot "< perl expand.pl rfe.dat" using (bin(column(1))):(20./N) smooth frequency with boxes
> diff --git a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/rfe.eps b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/rfe.eps
> index a0302af5..ff5f77f2 100644
> --- a/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/rfe.eps
> +++ b/CodeSamples/cpu/data/kerneltest054.05.atn6.2024.01.22-12.28.01/rfe.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: rfe.eps
>  %%Creator: gnuplot 5.4 patchlevel 2
> -%%CreationDate: Tue Jan 30 09:04:30 2024
> +%%CreationDate: Sun Feb  4 08:55:38 2024
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 327 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jan 30 09:04:30 2024)
> +  /CreationDate (Sun Feb  4 08:55:38 2024)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1917,12 +1917,12 @@ BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> +440 319 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 256 M
> +392 319 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -1930,84 +1930,84 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 439 M
> +440 494 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 439 M
> +392 494 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.05)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 622 M
> +440 669 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 622 M
> +392 669 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.1)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 805 M
> +440 844 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 805 M
> +392 844 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.15)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 988 M
> +440 1020 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 988 M
> +392 1020 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.2)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1171 M
> +440 1195 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1171 M
> +392 1195 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.25)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1354 M
> +440 1370 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1354 M
> +392 1370 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1537 M
> +440 1545 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1537 M
> +392 1545 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.35)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2026,10 +2026,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> -0 63 V
> -0 1401 R
> +440 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  440 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
> @@ -2038,10 +2038,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -752 256 M
> -0 63 V
> -0 1401 R
> +752 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  752 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 50)]
> @@ -2050,10 +2050,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1065 256 M
> -0 63 V
> -0 1401 R
> +1065 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1065 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 100)]
> @@ -2062,10 +2062,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1377 256 M
> -0 63 V
> -0 1401 R
> +1377 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1377 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 150)]
> @@ -2074,10 +2074,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1690 256 M
> -0 63 V
> -0 1401 R
> +1690 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1690 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 200)]
> @@ -2086,10 +2086,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2002 256 M
> -0 63 V
> -0 1401 R
> +2002 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2002 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 250)]
> @@ -2098,10 +2098,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2315 256 M
> -0 63 V
> -0 1401 R
> +2315 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2315 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 300)]
> @@ -2110,10 +2110,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2627 256 M
> -0 63 V
> -0 1401 R
> +2627 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2627 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 350)]
> @@ -2125,15 +2125,15 @@ LCb setrgbcolor
>  1.000 UL
>  LTa
>  LCb setrgbcolor
> -440 256 M
> -0 1464 V
> +440 319 M
> +0 1401 V
>  stroke
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> @@ -2141,7 +2141,7 @@ Z stroke
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -76 988 M
> +76 1019 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Frequency \(arb. unit\))]
>  ] -26.7 MCshow
> @@ -2158,936 +2158,161 @@ LTb
>  1.000 UL
>  LTb
>  0.58 0.00 0.83 C
> -559 256 N
> -0 1 V
> -12 0 V
> -0 -1 V
> --12 0 V
> -Z stroke
> -646 256 N
> -0 5 V
> -13 0 V
> -0 -5 V
> --13 0 V
> -Z stroke
> -659 256 N
> -0 9 V
> -12 0 V
> -0 -9 V
> --12 0 V
> -Z stroke
> -671 256 N
> -0 12 V
> -13 0 V
> -0 -12 V
> --13 0 V
> -Z stroke
> -684 256 N
> -0 5 V
> -12 0 V
> -0 -5 V
> --12 0 V
> -Z stroke
> -696 256 N
> -0 12 V
> -13 0 V
> -0 -12 V
> --13 0 V
> -Z stroke
> -709 256 N
> -0 35 V
> -12 0 V
> -0 -35 V
> --12 0 V
> -Z stroke
> -721 256 N
> -0 16 V
> -13 0 V
> -0 -16 V
> --13 0 V
> -Z stroke
> -734 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -796 256 N
> -0 1 V
> -13 0 V
> -0 -1 V
> --13 0 V
> -Z stroke
> -809 256 N
> -0 44 V
> -12 0 V
> -0 -44 V
> --12 0 V
> -Z stroke
> -821 256 N
> -0 53 V
> -13 0 V
> -0 -53 V
> --13 0 V
> -Z stroke
> -834 256 N
> -0 13 V
> -12 0 V
> -0 -13 V
> --12 0 V
> -Z stroke
> -846 256 N
> -0 29 V
> -13 0 V
> -0 -29 V
> --13 0 V
> -Z stroke
> -859 256 N
> -0 51 V
> -12 0 V
> -0 -51 V
> --12 0 V
> -Z stroke
> -871 256 N
> -0 65 V
> -13 0 V
> -0 -65 V
> --13 0 V
> -Z stroke
> -884 256 N
> -0 32 V
> -12 0 V
> -0 -32 V
> --12 0 V
> -Z stroke
> -896 256 N
> -0 13 V
> -13 0 V
> -0 -13 V
> --13 0 V
> -Z stroke
> -909 256 N
> -0 14 V
> -12 0 V
> -0 -14 V
> --12 0 V
> -Z stroke
> -921 256 N
> -0 16 V
> -13 0 V
> -0 -16 V
> --13 0 V
> -Z stroke
> -934 256 N
> -0 21 V
> -12 0 V
> -0 -21 V
> --12 0 V
> -Z stroke
> -946 256 N
> -0 33 V
> -13 0 V
> -0 -33 V
> --13 0 V
> -Z stroke
> -959 256 N
> -0 50 V
> -12 0 V
> -0 -50 V
> --12 0 V
> -Z stroke
> -971 256 N
> -0 121 V
> -13 0 V
> -0 -121 V
> --13 0 V
> -Z stroke
> -984 256 N
> -0 124 V
> -12 0 V
> -0 -124 V
> --12 0 V
> -Z stroke
> -996 256 N
> -0 158 V
> -13 0 V
> -0 -158 V
> --13 0 V
> -Z stroke
> -1009 256 N
> -0 202 V
> -12 0 V
> -0 -202 V
> --12 0 V
> -Z stroke
> -1021 256 N
> -0 261 V
> -13 0 V
> -0 -261 V
> --13 0 V
> -Z stroke
> -1034 256 N
> -0 341 V
> -12 0 V
> -0 -341 V
> --12 0 V
> -Z stroke
> -1046 256 N
> -0 401 V
> -13 0 V
> -0 -401 V
> --13 0 V
> -Z stroke
> -1059 256 N
> -0 471 V
> -12 0 V
> -0 -471 V
> --12 0 V
> -Z stroke
> -1071 256 N
> -0 560 V
> -13 0 V
> -0 -560 V
> --13 0 V
> -Z stroke
> -1084 256 N
> -0 606 V
> -12 0 V
> -0 -606 V
> --12 0 V
> -Z stroke
> -1096 256 N
> -0 701 V
> -13 0 V
> -0 -701 V
> --13 0 V
> -Z stroke
> -1109 256 N
> -0 733 V
> -12 0 V
> -0 -733 V
> --12 0 V
> -Z stroke
> -1121 256 N
> -0 897 V
> -13 0 V
> -0 -897 V
> --13 0 V
> -Z stroke
> -1134 256 N
> -0 1038 V
> -12 0 V
> -0 -1038 V
> --12 0 V
> -Z stroke
> -1146 256 N
> -0 964 V
> -13 0 V
> -0 -964 V
> --13 0 V
> -Z stroke
> -1159 256 N
> -0 997 V
> -12 0 V
> -0 -997 V
> --12 0 V
> -Z stroke
> -1171 256 N
> -0 962 V
> -13 0 V
> -0 -962 V
> --13 0 V
> -Z stroke
> -1184 256 N
> -0 1114 V
> -12 0 V
> -0 -1114 V
> --12 0 V
> -Z stroke
> -1196 256 N
> -0 1006 V
> -13 0 V
> -0 -1006 V
> --13 0 V
> -Z stroke
> -1209 256 N
> -0 991 V
> -12 0 V
> -0 -991 V
> --12 0 V
> -Z stroke
> -1221 256 N
> -0 925 V
> -13 0 V
> -0 -925 V
> --13 0 V
> -Z stroke
> -1234 256 N
> -0 851 V
> -12 0 V
> -0 -851 V
> --12 0 V
> -Z stroke
> -1246 256 N
> -0 811 V
> -13 0 V
> -0 -811 V
> --13 0 V
> -Z stroke
> -1259 256 N
> -0 764 V
> -12 0 V
> -0 -764 V
> --12 0 V
> -Z stroke
> -1271 256 N
> -0 685 V
> -13 0 V
> -0 -685 V
> --13 0 V
> -Z stroke
> -1284 256 N
> -0 664 V
> -12 0 V
> -0 -664 V
> --12 0 V
> -Z stroke
> -1296 256 N
> -0 573 V
> -13 0 V
> -0 -573 V
> --13 0 V
> -Z stroke
> -1309 256 N
> -0 566 V
> -12 0 V
> -0 -566 V
> --12 0 V
> -Z stroke
> -1321 256 N
> -0 519 V
> -13 0 V
> -0 -519 V
> --13 0 V
> -Z stroke
> -1334 256 N
> -0 470 V
> -12 0 V
> -0 -470 V
> --12 0 V
> -Z stroke
> -1346 256 N
> -0 448 V
> -13 0 V
> -0 -448 V
> --13 0 V
> -Z stroke
> -1359 256 N
> -0 440 V
> -12 0 V
> -0 -440 V
> --12 0 V
> -Z stroke
> -1371 256 N
> -0 419 V
> -13 0 V
> -0 -419 V
> --13 0 V
> -Z stroke
> -1384 256 N
> -0 423 V
> -12 0 V
> -0 -423 V
> --12 0 V
> -Z stroke
> -1396 256 N
> -0 483 V
> -13 0 V
> -0 -483 V
> --13 0 V
> -Z stroke
> -1409 256 N
> -0 490 V
> -12 0 V
> -0 -490 V
> --12 0 V
> -Z stroke
> -1421 256 N
> -0 542 V
> -13 0 V
> -0 -542 V
> --13 0 V
> -Z stroke
> -1434 256 N
> -0 620 V
> -12 0 V
> -0 -620 V
> --12 0 V
> -Z stroke
> -1446 256 N
> -0 732 V
> -13 0 V
> -0 -732 V
> --13 0 V
> -Z stroke
> -1459 256 N
> -0 752 V
> -12 0 V
> -0 -752 V
> --12 0 V
> -Z stroke
> -1471 256 N
> -0 853 V
> -13 0 V
> -0 -853 V
> --13 0 V
> -Z stroke
> -1484 256 N
> -0 948 V
> -12 0 V
> -0 -948 V
> --12 0 V
> -Z stroke
> -1496 256 N
> -0 1054 V
> -13 0 V
> -0 -1054 V
> --13 0 V
> -Z stroke
> -1509 256 N
> -0 1112 V
> -12 0 V
> -0 -1112 V
> --12 0 V
> -Z stroke
> -1521 256 N
> -0 1232 V
> -13 0 V
> -0 -1232 V
> --13 0 V
> -Z stroke
> -1534 256 N
> -0 1254 V
> -12 0 V
> -0 -1254 V
> --12 0 V
> -Z stroke
> -1546 256 N
> -0 1267 V
> -12 0 V
> -0 -1267 V
> --12 0 V
> -Z stroke
> -1558 256 N
> -0 1365 V
> -13 0 V
> -0 -1365 V
> --13 0 V
> -Z stroke
> -1571 256 N
> -0 1348 V
> -12 0 V
> -0 -1348 V
> --12 0 V
> -Z stroke
> -1583 256 N
> -0 1415 V
> -13 0 V
> -0 -1415 V
> --13 0 V
> -Z stroke
> -1596 256 N
> -0 1407 V
> -12 0 V
> -0 -1407 V
> --12 0 V
> -Z stroke
> -1608 256 N
> -0 1318 V
> -13 0 V
> -0 -1318 V
> --13 0 V
> -Z stroke
> -1621 256 N
> -0 1318 V
> -12 0 V
> -0 -1318 V
> --12 0 V
> -Z stroke
> -1633 256 N
> -0 1357 V
> -13 0 V
> -0 -1357 V
> --13 0 V
> -Z stroke
> -1646 256 N
> -0 1228 V
> -12 0 V
> -0 -1228 V
> --12 0 V
> -Z stroke
> -1658 256 N
> -0 1227 V
> -13 0 V
> -0 -1227 V
> --13 0 V
> -Z stroke
> -1671 256 N
> -0 1186 V
> -12 0 V
> -0 -1186 V
> --12 0 V
> -Z stroke
> -1683 256 N
> -0 1153 V
> -13 0 V
> -0 -1153 V
> --13 0 V
> -Z stroke
> -1696 256 N
> -0 974 V
> -12 0 V
> -0 -974 V
> --12 0 V
> -Z stroke
> -1708 256 N
> -0 928 V
> -13 0 V
> -0 -928 V
> --13 0 V
> -Z stroke
> -1721 256 N
> -0 964 V
> -12 0 V
> -0 -964 V
> --12 0 V
> -Z stroke
> -1733 256 N
> -0 848 V
> -13 0 V
> -0 -848 V
> --13 0 V
> -Z stroke
> -1746 256 N
> -0 810 V
> -12 0 V
> -0 -810 V
> --12 0 V
> -Z stroke
> -1758 256 N
> -0 758 V
> -13 0 V
> -0 -758 V
> --13 0 V
> -Z stroke
> -1771 256 N
> -0 680 V
> -12 0 V
> -0 -680 V
> --12 0 V
> -Z stroke
> -1783 256 N
> -0 590 V
> -13 0 V
> -0 -590 V
> --13 0 V
> -Z stroke
> -1796 256 N
> -0 600 V
> -12 0 V
> -0 -600 V
> --12 0 V
> -Z stroke
> -1808 256 N
> -0 528 V
> -13 0 V
> -0 -528 V
> --13 0 V
> -Z stroke
> -1821 256 N
> -0 549 V
> -12 0 V
> -0 -549 V
> --12 0 V
> -Z stroke
> -1833 256 N
> -0 522 V
> -13 0 V
> -0 -522 V
> --13 0 V
> -Z stroke
> -1846 256 N
> -0 546 V
> -12 0 V
> -0 -546 V
> --12 0 V
> -Z stroke
> -1858 256 N
> -0 501 V
> -13 0 V
> -0 -501 V
> --13 0 V
> -Z stroke
> -1871 256 N
> -0 491 V
> -12 0 V
> -0 -491 V
> --12 0 V
> -Z stroke
> -1883 256 N
> -0 544 V
> -13 0 V
> -0 -544 V
> --13 0 V
> -Z stroke
> -1896 256 N
> -0 551 V
> -12 0 V
> -0 -551 V
> --12 0 V
> -Z stroke
> -1908 256 N
> -0 611 V
> -13 0 V
> -0 -611 V
> --13 0 V
> -Z stroke
> -1921 256 N
> -0 655 V
> -12 0 V
> -0 -655 V
> --12 0 V
> -Z stroke
> -1933 256 N
> -0 687 V
> -13 0 V
> -0 -687 V
> --13 0 V
> -Z stroke
> -1946 256 N
> -0 730 V
> -12 0 V
> -0 -730 V
> --12 0 V
> -Z stroke
> -1958 256 N
> -0 705 V
> -13 0 V
> -0 -705 V
> --13 0 V
> -Z stroke
> -1971 256 N
> -0 766 V
> -12 0 V
> -0 -766 V
> --12 0 V
> -Z stroke
> -1983 256 N
> -0 766 V
> -13 0 V
> -0 -766 V
> --13 0 V
> -Z stroke
> -1996 256 N
> -0 755 V
> -12 0 V
> -0 -755 V
> --12 0 V
> -Z stroke
> -2008 256 N
> -0 796 V
> -13 0 V
> -0 -796 V
> --13 0 V
> -Z stroke
> -2021 256 N
> -0 691 V
> -12 0 V
> -0 -691 V
> --12 0 V
> -Z stroke
> -2033 256 N
> -0 739 V
> -13 0 V
> -0 -739 V
> --13 0 V
> -Z stroke
> -2046 256 N
> -0 652 V
> -12 0 V
> -0 -652 V
> --12 0 V
> -Z stroke
> -2058 256 N
> -0 658 V
> -13 0 V
> -0 -658 V
> --13 0 V
> -Z stroke
> -2071 256 N
> -0 594 V
> -12 0 V
> -0 -594 V
> --12 0 V
> -Z stroke
> -2083 256 N
> -0 590 V
> -13 0 V
> -0 -590 V
> --13 0 V
> -Z stroke
> -2096 256 N
> -0 476 V
> -12 0 V
> -0 -476 V
> --12 0 V
> -Z stroke
> -2108 256 N
> -0 410 V
> -13 0 V
> -0 -410 V
> --13 0 V
> -Z stroke
> -2121 256 N
> -0 393 V
> -12 0 V
> -0 -393 V
> --12 0 V
> -Z stroke
> -2133 256 N
> -0 321 V
> -13 0 V
> -0 -321 V
> --13 0 V
> -Z stroke
> -2146 256 N
> -0 306 V
> -12 0 V
> -0 -306 V
> --12 0 V
> -Z stroke
> -2158 256 N
> -0 252 V
> -13 0 V
> -0 -252 V
> --13 0 V
> -Z stroke
> -2171 256 N
> -0 216 V
> -12 0 V
> -0 -216 V
> --12 0 V
> -Z stroke
> -2183 256 N
> -0 168 V
> -13 0 V
> -0 -168 V
> --13 0 V
> -Z stroke
> -2196 256 N
> -0 147 V
> -12 0 V
> -0 -147 V
> --12 0 V
> -Z stroke
> -2208 256 N
> -0 117 V
> -13 0 V
> -0 -117 V
> --13 0 V
> -Z stroke
> -2221 256 N
> -0 90 V
> -12 0 V
> -0 -90 V
> --12 0 V
> -Z stroke
> -2233 256 N
> -0 77 V
> -13 0 V
> -0 -77 V
> --13 0 V
> -Z stroke
> -2246 256 N
> -0 66 V
> -12 0 V
> -0 -66 V
> --12 0 V
> -Z stroke
> -2258 256 N
> -0 42 V
> -13 0 V
> -0 -42 V
> --13 0 V
> -Z stroke
> -2271 256 N
> -0 37 V
> -12 0 V
> -0 -37 V
> --12 0 V
> -Z stroke
> -2283 256 N
> -0 22 V
> -13 0 V
> -0 -22 V
> --13 0 V
> -Z stroke
> -2296 256 N
> -0 21 V
> -12 0 V
> -0 -21 V
> --12 0 V
> -Z stroke
> -2308 256 N
> -0 16 V
> -13 0 V
> -0 -16 V
> --13 0 V
> -Z stroke
> -2321 256 N
> -0 18 V
> -12 0 V
> -0 -18 V
> --12 0 V
> -Z stroke
> -2333 256 N
> -0 7 V
> -13 0 V
> -0 -7 V
> --13 0 V
> -Z stroke
> -2346 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2358 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2371 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2383 256 N
> -0 2 V
> -13 0 V
> -0 -2 V
> --13 0 V
> -Z stroke
> -2396 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2408 256 N
> -0 4 V
> -13 0 V
> -0 -4 V
> --13 0 V
> -Z stroke
> -2421 256 N
> -0 2 V
> -12 0 V
> -0 -2 V
> --12 0 V
> -Z stroke
> -2433 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2446 256 N
> -0 3 V
> -12 0 V
> -0 -3 V
> --12 0 V
> -Z stroke
> -2458 256 N
> -0 4 V
> -13 0 V
> -0 -4 V
> --13 0 V
> -Z stroke
> -2471 256 N
> -0 5 V
> -12 0 V
> -0 -5 V
> --12 0 V
> -Z stroke
> -2483 256 N
> -0 1 V
> -13 0 V
> -0 -1 V
> --13 0 V
> -Z stroke
> -2508 256 N
> -0 6 V
> -13 0 V
> -0 -6 V
> --13 0 V
> -Z stroke
> -2521 256 N
> -0 3 V
> -12 0 V
> -0 -3 V
> --12 0 V
> -Z stroke
> -2533 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2546 256 N
> -0 4 V
> -12 0 V
> -0 -4 V
> --12 0 V
> -Z stroke
> -2558 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2571 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2583 256 N
> -0 2 V
> -13 0 V
> -0 -2 V
> --13 0 V
> -Z stroke
> -2596 256 N
> -0 1 V
> -12 0 V
> -0 -1 V
> --12 0 V
> -Z stroke
> -2608 256 N
> -0 2 V
> -13 0 V
> -0 -2 V
> --13 0 V
> -Z stroke
> -2621 256 N
> -0 3 V
> -6 0 V
> -0 -3 V
> --6 0 V
> -Z stroke
> +1.000 562 319 7 2 BoxColFill
> +1.000 649 319 8 5 BoxColFill
> +1.000 662 319 7 10 BoxColFill
> +1.000 674 319 8 13 BoxColFill
> +1.000 687 319 7 5 BoxColFill
> +1.000 699 319 8 13 BoxColFill
> +1.000 712 319 7 35 BoxColFill
> +1.000 724 319 8 16 BoxColFill
> +1.000 737 319 7 6 BoxColFill
> +1.000 799 319 8 2 BoxColFill
> +1.000 812 319 7 43 BoxColFill
> +1.000 824 319 8 52 BoxColFill
> +1.000 837 319 7 13 BoxColFill
> +1.000 849 319 8 28 BoxColFill
> +1.000 862 319 7 50 BoxColFill
> +1.000 874 319 8 63 BoxColFill
> +1.000 887 319 7 31 BoxColFill
> +1.000 899 319 8 13 BoxColFill
> +1.000 912 319 7 14 BoxColFill
> +1.000 924 319 8 16 BoxColFill
> +1.000 937 319 7 21 BoxColFill
> +1.000 949 319 8 33 BoxColFill
> +1.000 962 319 7 49 BoxColFill
> +1.000 974 319 8 117 BoxColFill
> +1.000 987 319 7 120 BoxColFill
> +1.000 999 319 7 152 BoxColFill
> +1.000 1012 319 7 194 BoxColFill
> +1.000 1024 319 7 251 BoxColFill
> +1.000 1037 319 7 327 BoxColFill
> +1.000 1049 319 7 385 BoxColFill
> +1.000 1062 319 7 451 BoxColFill
> +1.000 1074 319 7 537 BoxColFill
> +1.000 1087 319 7 581 BoxColFill
> +1.000 1099 319 7 672 BoxColFill
> +1.000 1112 319 7 702 BoxColFill
> +1.000 1124 319 7 859 BoxColFill
> +1.000 1137 319 7 994 BoxColFill
> +1.000 1149 319 7 923 BoxColFill
> +1.000 1162 319 7 955 BoxColFill
> +1.000 1174 319 7 921 BoxColFill
> +1.000 1187 319 7 1067 BoxColFill
> +1.000 1199 319 7 964 BoxColFill
> +1.000 1212 319 7 949 BoxColFill
> +1.000 1224 319 7 886 BoxColFill
> +1.000 1237 319 7 815 BoxColFill
> +1.000 1249 319 7 777 BoxColFill
> +1.000 1262 319 7 733 BoxColFill
> +1.000 1274 319 7 656 BoxColFill
> +1.000 1287 319 7 637 BoxColFill
> +1.000 1299 319 7 549 BoxColFill
> +1.000 1312 319 7 543 BoxColFill
> +1.000 1324 319 7 498 BoxColFill
> +1.000 1337 319 7 451 BoxColFill
> +1.000 1349 319 7 429 BoxColFill
> +1.000 1362 319 7 422 BoxColFill
> +1.000 1374 319 7 402 BoxColFill
> +1.000 1387 319 7 406 BoxColFill
> +1.000 1399 319 7 463 BoxColFill
> +1.000 1412 319 7 470 BoxColFill
> +1.000 1424 319 7 520 BoxColFill
> +1.000 1437 319 7 594 BoxColFill
> +1.000 1449 319 7 702 BoxColFill
> +1.000 1462 319 7 721 BoxColFill
> +1.000 1474 319 7 818 BoxColFill
> +1.000 1487 319 7 908 BoxColFill
> +1.000 1499 319 7 1009 BoxColFill
> +1.000 1512 319 7 1065 BoxColFill
> +1.000 1524 319 7 1180 BoxColFill
> +1.000 1537 319 7 1201 BoxColFill
> +1.000 1549 319 7 1213 BoxColFill
> +1.000 1562 319 7 1307 BoxColFill
> +1.000 1574 319 7 1291 BoxColFill
> +1.000 1587 319 7 1355 BoxColFill
> +1.000 1599 319 7 1348 BoxColFill
> +1.000 1612 319 7 1262 BoxColFill
> +1.000 1624 319 7 1262 BoxColFill
> +1.000 1637 319 7 1300 BoxColFill
> +1.000 1649 319 7 1176 BoxColFill
> +1.000 1662 319 7 1175 BoxColFill
> +1.000 1674 319 7 1136 BoxColFill
> +1.000 1687 319 7 1104 BoxColFill
> +1.000 1699 319 7 933 BoxColFill
> +1.000 1712 319 7 889 BoxColFill
> +1.000 1724 319 7 923 BoxColFill
> +1.000 1737 319 7 812 BoxColFill
> +1.000 1749 319 7 776 BoxColFill
> +1.000 1762 319 7 726 BoxColFill
> +1.000 1774 319 7 652 BoxColFill
> +1.000 1787 319 7 566 BoxColFill
> +1.000 1799 319 7 576 BoxColFill
> +1.000 1812 319 7 506 BoxColFill
> +1.000 1824 319 7 526 BoxColFill
> +1.000 1837 319 7 500 BoxColFill
> +1.000 1849 319 7 523 BoxColFill
> +1.000 1862 319 7 481 BoxColFill
> +1.000 1874 319 7 471 BoxColFill
> +1.000 1887 319 7 521 BoxColFill
> +1.000 1899 319 7 529 BoxColFill
> +1.000 1912 319 7 585 BoxColFill
> +1.000 1924 319 7 628 BoxColFill
> +1.000 1937 319 7 658 BoxColFill
> +1.000 1949 319 7 700 BoxColFill
> +1.000 1962 319 7 676 BoxColFill
> +1.000 1974 319 7 734 BoxColFill
> +1.000 1987 319 7 734 BoxColFill
> +1.000 1999 319 7 724 BoxColFill
> +1.000 2012 319 7 763 BoxColFill
> +1.000 2024 319 7 662 BoxColFill
> +1.000 2037 319 7 709 BoxColFill
> +1.000 2049 319 7 625 BoxColFill
> +1.000 2062 319 7 631 BoxColFill
> +1.000 2074 319 7 569 BoxColFill
> +1.000 2086 319 8 566 BoxColFill
> +1.000 2099 319 7 457 BoxColFill
> +1.000 2111 319 8 393 BoxColFill
> +1.000 2124 319 7 377 BoxColFill
> +1.000 2136 319 8 308 BoxColFill
> +1.000 2149 319 7 294 BoxColFill
> +1.000 2161 319 8 242 BoxColFill
> +1.000 2174 319 7 208 BoxColFill
> +1.000 2186 319 8 161 BoxColFill
> +1.000 2199 319 7 142 BoxColFill
> +1.000 2211 319 8 113 BoxColFill
> +1.000 2224 319 7 87 BoxColFill
> +1.000 2236 319 8 75 BoxColFill
> +1.000 2249 319 7 64 BoxColFill
> +1.000 2261 319 8 41 BoxColFill
> +1.000 2274 319 7 36 BoxColFill
> +1.000 2286 319 8 22 BoxColFill
> +1.000 2299 319 7 21 BoxColFill
> +1.000 2311 319 8 16 BoxColFill
> +1.000 2324 319 7 18 BoxColFill
> +1.000 2336 319 8 8 BoxColFill
> +1.000 2349 319 7 7 BoxColFill
> +1.000 2361 319 8 4 BoxColFill
> +1.000 2374 319 7 7 BoxColFill
> +1.000 2386 319 8 3 BoxColFill
> +1.000 2399 319 7 7 BoxColFill
> +1.000 2411 319 8 5 BoxColFill
> +1.000 2424 319 7 3 BoxColFill
> +1.000 2436 319 8 4 BoxColFill
> +1.000 2449 319 7 4 BoxColFill
> +1.000 2461 319 8 5 BoxColFill
> +1.000 2474 319 7 5 BoxColFill
> +1.000 2486 319 8 2 BoxColFill
> +1.000 2511 319 8 7 BoxColFill
> +1.000 2524 319 7 4 BoxColFill
> +1.000 2536 319 8 4 BoxColFill
> +1.000 2549 319 7 5 BoxColFill
> +1.000 2561 319 8 4 BoxColFill
> +1.000 2574 319 7 6 BoxColFill
> +1.000 2586 319 8 3 BoxColFill
> +1.000 2599 319 7 2 BoxColFill
> +1.000 2611 319 8 3 BoxColFill
> +1.000 2624 319 4 4 BoxColFill
>  % End plot #1
>  2.000 UL
>  LTb
> @@ -3096,9 +2321,9 @@ LCb setrgbcolor
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> diff --git a/CodeSamples/cpu/data/rfe.eps b/CodeSamples/cpu/data/rfe.eps
> index a0302af5..ff5f77f2 100644
> --- a/CodeSamples/cpu/data/rfe.eps
> +++ b/CodeSamples/cpu/data/rfe.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: rfe.eps
>  %%Creator: gnuplot 5.4 patchlevel 2
> -%%CreationDate: Tue Jan 30 09:04:30 2024
> +%%CreationDate: Sun Feb  4 08:55:38 2024
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 327 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jan 30 09:04:30 2024)
> +  /CreationDate (Sun Feb  4 08:55:38 2024)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1917,12 +1917,12 @@ BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> +440 319 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 256 M
> +392 319 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -1930,84 +1930,84 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 439 M
> +440 494 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 439 M
> +392 494 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.05)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 622 M
> +440 669 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 622 M
> +392 669 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.1)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 805 M
> +440 844 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 805 M
> +392 844 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.15)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 988 M
> +440 1020 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 988 M
> +392 1020 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.2)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1171 M
> +440 1195 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1171 M
> +392 1195 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.25)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1354 M
> +440 1370 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1354 M
> +392 1370 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.3)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 1537 M
> +440 1545 M
>  63 0 V
>  2124 0 R
>  -63 0 V
>  stroke
> -392 1537 M
> +392 1545 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0.35)]
>  ] -26.7 MRshow
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2026,10 +2026,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -440 256 M
> -0 63 V
> -0 1401 R
> +440 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  440 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
> @@ -2038,10 +2038,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -752 256 M
> -0 63 V
> -0 1401 R
> +752 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  752 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 50)]
> @@ -2050,10 +2050,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1065 256 M
> -0 63 V
> -0 1401 R
> +1065 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1065 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 100)]
> @@ -2062,10 +2062,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1377 256 M
> -0 63 V
> -0 1401 R
> +1377 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1377 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 150)]
> @@ -2074,10 +2074,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1690 256 M
> -0 63 V
> -0 1401 R
> +1690 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  1690 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 200)]
> @@ -2086,10 +2086,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2002 256 M
> -0 63 V
> -0 1401 R
> +2002 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2002 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 250)]
> @@ -2098,10 +2098,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2315 256 M
> -0 63 V
> -0 1401 R
> +2315 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2315 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 300)]
> @@ -2110,10 +2110,10 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2627 256 M
> -0 63 V
> -0 1401 R
> +2627 319 M
>  0 -63 V
> +0 1464 R
> +0 63 V
>  stroke
>  2627 176 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 350)]
> @@ -2125,15 +2125,15 @@ LCb setrgbcolor
>  1.000 UL
>  LTa
>  LCb setrgbcolor
> -440 256 M
> -0 1464 V
> +440 319 M
> +0 1401 V
>  stroke
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> @@ -2141,7 +2141,7 @@ Z stroke
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -76 988 M
> +76 1019 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Frequency \(arb. unit\))]
>  ] -26.7 MCshow
> @@ -2158,936 +2158,161 @@ LTb
>  1.000 UL
>  LTb
>  0.58 0.00 0.83 C
> -559 256 N
> -0 1 V
> -12 0 V
> -0 -1 V
> --12 0 V
> -Z stroke
> -646 256 N
> -0 5 V
> -13 0 V
> -0 -5 V
> --13 0 V
> -Z stroke
> -659 256 N
> -0 9 V
> -12 0 V
> -0 -9 V
> --12 0 V
> -Z stroke
> -671 256 N
> -0 12 V
> -13 0 V
> -0 -12 V
> --13 0 V
> -Z stroke
> -684 256 N
> -0 5 V
> -12 0 V
> -0 -5 V
> --12 0 V
> -Z stroke
> -696 256 N
> -0 12 V
> -13 0 V
> -0 -12 V
> --13 0 V
> -Z stroke
> -709 256 N
> -0 35 V
> -12 0 V
> -0 -35 V
> --12 0 V
> -Z stroke
> -721 256 N
> -0 16 V
> -13 0 V
> -0 -16 V
> --13 0 V
> -Z stroke
> -734 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -796 256 N
> -0 1 V
> -13 0 V
> -0 -1 V
> --13 0 V
> -Z stroke
> -809 256 N
> -0 44 V
> -12 0 V
> -0 -44 V
> --12 0 V
> -Z stroke
> -821 256 N
> -0 53 V
> -13 0 V
> -0 -53 V
> --13 0 V
> -Z stroke
> -834 256 N
> -0 13 V
> -12 0 V
> -0 -13 V
> --12 0 V
> -Z stroke
> -846 256 N
> -0 29 V
> -13 0 V
> -0 -29 V
> --13 0 V
> -Z stroke
> -859 256 N
> -0 51 V
> -12 0 V
> -0 -51 V
> --12 0 V
> -Z stroke
> -871 256 N
> -0 65 V
> -13 0 V
> -0 -65 V
> --13 0 V
> -Z stroke
> -884 256 N
> -0 32 V
> -12 0 V
> -0 -32 V
> --12 0 V
> -Z stroke
> -896 256 N
> -0 13 V
> -13 0 V
> -0 -13 V
> --13 0 V
> -Z stroke
> -909 256 N
> -0 14 V
> -12 0 V
> -0 -14 V
> --12 0 V
> -Z stroke
> -921 256 N
> -0 16 V
> -13 0 V
> -0 -16 V
> --13 0 V
> -Z stroke
> -934 256 N
> -0 21 V
> -12 0 V
> -0 -21 V
> --12 0 V
> -Z stroke
> -946 256 N
> -0 33 V
> -13 0 V
> -0 -33 V
> --13 0 V
> -Z stroke
> -959 256 N
> -0 50 V
> -12 0 V
> -0 -50 V
> --12 0 V
> -Z stroke
> -971 256 N
> -0 121 V
> -13 0 V
> -0 -121 V
> --13 0 V
> -Z stroke
> -984 256 N
> -0 124 V
> -12 0 V
> -0 -124 V
> --12 0 V
> -Z stroke
> -996 256 N
> -0 158 V
> -13 0 V
> -0 -158 V
> --13 0 V
> -Z stroke
> -1009 256 N
> -0 202 V
> -12 0 V
> -0 -202 V
> --12 0 V
> -Z stroke
> -1021 256 N
> -0 261 V
> -13 0 V
> -0 -261 V
> --13 0 V
> -Z stroke
> -1034 256 N
> -0 341 V
> -12 0 V
> -0 -341 V
> --12 0 V
> -Z stroke
> -1046 256 N
> -0 401 V
> -13 0 V
> -0 -401 V
> --13 0 V
> -Z stroke
> -1059 256 N
> -0 471 V
> -12 0 V
> -0 -471 V
> --12 0 V
> -Z stroke
> -1071 256 N
> -0 560 V
> -13 0 V
> -0 -560 V
> --13 0 V
> -Z stroke
> -1084 256 N
> -0 606 V
> -12 0 V
> -0 -606 V
> --12 0 V
> -Z stroke
> -1096 256 N
> -0 701 V
> -13 0 V
> -0 -701 V
> --13 0 V
> -Z stroke
> -1109 256 N
> -0 733 V
> -12 0 V
> -0 -733 V
> --12 0 V
> -Z stroke
> -1121 256 N
> -0 897 V
> -13 0 V
> -0 -897 V
> --13 0 V
> -Z stroke
> -1134 256 N
> -0 1038 V
> -12 0 V
> -0 -1038 V
> --12 0 V
> -Z stroke
> -1146 256 N
> -0 964 V
> -13 0 V
> -0 -964 V
> --13 0 V
> -Z stroke
> -1159 256 N
> -0 997 V
> -12 0 V
> -0 -997 V
> --12 0 V
> -Z stroke
> -1171 256 N
> -0 962 V
> -13 0 V
> -0 -962 V
> --13 0 V
> -Z stroke
> -1184 256 N
> -0 1114 V
> -12 0 V
> -0 -1114 V
> --12 0 V
> -Z stroke
> -1196 256 N
> -0 1006 V
> -13 0 V
> -0 -1006 V
> --13 0 V
> -Z stroke
> -1209 256 N
> -0 991 V
> -12 0 V
> -0 -991 V
> --12 0 V
> -Z stroke
> -1221 256 N
> -0 925 V
> -13 0 V
> -0 -925 V
> --13 0 V
> -Z stroke
> -1234 256 N
> -0 851 V
> -12 0 V
> -0 -851 V
> --12 0 V
> -Z stroke
> -1246 256 N
> -0 811 V
> -13 0 V
> -0 -811 V
> --13 0 V
> -Z stroke
> -1259 256 N
> -0 764 V
> -12 0 V
> -0 -764 V
> --12 0 V
> -Z stroke
> -1271 256 N
> -0 685 V
> -13 0 V
> -0 -685 V
> --13 0 V
> -Z stroke
> -1284 256 N
> -0 664 V
> -12 0 V
> -0 -664 V
> --12 0 V
> -Z stroke
> -1296 256 N
> -0 573 V
> -13 0 V
> -0 -573 V
> --13 0 V
> -Z stroke
> -1309 256 N
> -0 566 V
> -12 0 V
> -0 -566 V
> --12 0 V
> -Z stroke
> -1321 256 N
> -0 519 V
> -13 0 V
> -0 -519 V
> --13 0 V
> -Z stroke
> -1334 256 N
> -0 470 V
> -12 0 V
> -0 -470 V
> --12 0 V
> -Z stroke
> -1346 256 N
> -0 448 V
> -13 0 V
> -0 -448 V
> --13 0 V
> -Z stroke
> -1359 256 N
> -0 440 V
> -12 0 V
> -0 -440 V
> --12 0 V
> -Z stroke
> -1371 256 N
> -0 419 V
> -13 0 V
> -0 -419 V
> --13 0 V
> -Z stroke
> -1384 256 N
> -0 423 V
> -12 0 V
> -0 -423 V
> --12 0 V
> -Z stroke
> -1396 256 N
> -0 483 V
> -13 0 V
> -0 -483 V
> --13 0 V
> -Z stroke
> -1409 256 N
> -0 490 V
> -12 0 V
> -0 -490 V
> --12 0 V
> -Z stroke
> -1421 256 N
> -0 542 V
> -13 0 V
> -0 -542 V
> --13 0 V
> -Z stroke
> -1434 256 N
> -0 620 V
> -12 0 V
> -0 -620 V
> --12 0 V
> -Z stroke
> -1446 256 N
> -0 732 V
> -13 0 V
> -0 -732 V
> --13 0 V
> -Z stroke
> -1459 256 N
> -0 752 V
> -12 0 V
> -0 -752 V
> --12 0 V
> -Z stroke
> -1471 256 N
> -0 853 V
> -13 0 V
> -0 -853 V
> --13 0 V
> -Z stroke
> -1484 256 N
> -0 948 V
> -12 0 V
> -0 -948 V
> --12 0 V
> -Z stroke
> -1496 256 N
> -0 1054 V
> -13 0 V
> -0 -1054 V
> --13 0 V
> -Z stroke
> -1509 256 N
> -0 1112 V
> -12 0 V
> -0 -1112 V
> --12 0 V
> -Z stroke
> -1521 256 N
> -0 1232 V
> -13 0 V
> -0 -1232 V
> --13 0 V
> -Z stroke
> -1534 256 N
> -0 1254 V
> -12 0 V
> -0 -1254 V
> --12 0 V
> -Z stroke
> -1546 256 N
> -0 1267 V
> -12 0 V
> -0 -1267 V
> --12 0 V
> -Z stroke
> -1558 256 N
> -0 1365 V
> -13 0 V
> -0 -1365 V
> --13 0 V
> -Z stroke
> -1571 256 N
> -0 1348 V
> -12 0 V
> -0 -1348 V
> --12 0 V
> -Z stroke
> -1583 256 N
> -0 1415 V
> -13 0 V
> -0 -1415 V
> --13 0 V
> -Z stroke
> -1596 256 N
> -0 1407 V
> -12 0 V
> -0 -1407 V
> --12 0 V
> -Z stroke
> -1608 256 N
> -0 1318 V
> -13 0 V
> -0 -1318 V
> --13 0 V
> -Z stroke
> -1621 256 N
> -0 1318 V
> -12 0 V
> -0 -1318 V
> --12 0 V
> -Z stroke
> -1633 256 N
> -0 1357 V
> -13 0 V
> -0 -1357 V
> --13 0 V
> -Z stroke
> -1646 256 N
> -0 1228 V
> -12 0 V
> -0 -1228 V
> --12 0 V
> -Z stroke
> -1658 256 N
> -0 1227 V
> -13 0 V
> -0 -1227 V
> --13 0 V
> -Z stroke
> -1671 256 N
> -0 1186 V
> -12 0 V
> -0 -1186 V
> --12 0 V
> -Z stroke
> -1683 256 N
> -0 1153 V
> -13 0 V
> -0 -1153 V
> --13 0 V
> -Z stroke
> -1696 256 N
> -0 974 V
> -12 0 V
> -0 -974 V
> --12 0 V
> -Z stroke
> -1708 256 N
> -0 928 V
> -13 0 V
> -0 -928 V
> --13 0 V
> -Z stroke
> -1721 256 N
> -0 964 V
> -12 0 V
> -0 -964 V
> --12 0 V
> -Z stroke
> -1733 256 N
> -0 848 V
> -13 0 V
> -0 -848 V
> --13 0 V
> -Z stroke
> -1746 256 N
> -0 810 V
> -12 0 V
> -0 -810 V
> --12 0 V
> -Z stroke
> -1758 256 N
> -0 758 V
> -13 0 V
> -0 -758 V
> --13 0 V
> -Z stroke
> -1771 256 N
> -0 680 V
> -12 0 V
> -0 -680 V
> --12 0 V
> -Z stroke
> -1783 256 N
> -0 590 V
> -13 0 V
> -0 -590 V
> --13 0 V
> -Z stroke
> -1796 256 N
> -0 600 V
> -12 0 V
> -0 -600 V
> --12 0 V
> -Z stroke
> -1808 256 N
> -0 528 V
> -13 0 V
> -0 -528 V
> --13 0 V
> -Z stroke
> -1821 256 N
> -0 549 V
> -12 0 V
> -0 -549 V
> --12 0 V
> -Z stroke
> -1833 256 N
> -0 522 V
> -13 0 V
> -0 -522 V
> --13 0 V
> -Z stroke
> -1846 256 N
> -0 546 V
> -12 0 V
> -0 -546 V
> --12 0 V
> -Z stroke
> -1858 256 N
> -0 501 V
> -13 0 V
> -0 -501 V
> --13 0 V
> -Z stroke
> -1871 256 N
> -0 491 V
> -12 0 V
> -0 -491 V
> --12 0 V
> -Z stroke
> -1883 256 N
> -0 544 V
> -13 0 V
> -0 -544 V
> --13 0 V
> -Z stroke
> -1896 256 N
> -0 551 V
> -12 0 V
> -0 -551 V
> --12 0 V
> -Z stroke
> -1908 256 N
> -0 611 V
> -13 0 V
> -0 -611 V
> --13 0 V
> -Z stroke
> -1921 256 N
> -0 655 V
> -12 0 V
> -0 -655 V
> --12 0 V
> -Z stroke
> -1933 256 N
> -0 687 V
> -13 0 V
> -0 -687 V
> --13 0 V
> -Z stroke
> -1946 256 N
> -0 730 V
> -12 0 V
> -0 -730 V
> --12 0 V
> -Z stroke
> -1958 256 N
> -0 705 V
> -13 0 V
> -0 -705 V
> --13 0 V
> -Z stroke
> -1971 256 N
> -0 766 V
> -12 0 V
> -0 -766 V
> --12 0 V
> -Z stroke
> -1983 256 N
> -0 766 V
> -13 0 V
> -0 -766 V
> --13 0 V
> -Z stroke
> -1996 256 N
> -0 755 V
> -12 0 V
> -0 -755 V
> --12 0 V
> -Z stroke
> -2008 256 N
> -0 796 V
> -13 0 V
> -0 -796 V
> --13 0 V
> -Z stroke
> -2021 256 N
> -0 691 V
> -12 0 V
> -0 -691 V
> --12 0 V
> -Z stroke
> -2033 256 N
> -0 739 V
> -13 0 V
> -0 -739 V
> --13 0 V
> -Z stroke
> -2046 256 N
> -0 652 V
> -12 0 V
> -0 -652 V
> --12 0 V
> -Z stroke
> -2058 256 N
> -0 658 V
> -13 0 V
> -0 -658 V
> --13 0 V
> -Z stroke
> -2071 256 N
> -0 594 V
> -12 0 V
> -0 -594 V
> --12 0 V
> -Z stroke
> -2083 256 N
> -0 590 V
> -13 0 V
> -0 -590 V
> --13 0 V
> -Z stroke
> -2096 256 N
> -0 476 V
> -12 0 V
> -0 -476 V
> --12 0 V
> -Z stroke
> -2108 256 N
> -0 410 V
> -13 0 V
> -0 -410 V
> --13 0 V
> -Z stroke
> -2121 256 N
> -0 393 V
> -12 0 V
> -0 -393 V
> --12 0 V
> -Z stroke
> -2133 256 N
> -0 321 V
> -13 0 V
> -0 -321 V
> --13 0 V
> -Z stroke
> -2146 256 N
> -0 306 V
> -12 0 V
> -0 -306 V
> --12 0 V
> -Z stroke
> -2158 256 N
> -0 252 V
> -13 0 V
> -0 -252 V
> --13 0 V
> -Z stroke
> -2171 256 N
> -0 216 V
> -12 0 V
> -0 -216 V
> --12 0 V
> -Z stroke
> -2183 256 N
> -0 168 V
> -13 0 V
> -0 -168 V
> --13 0 V
> -Z stroke
> -2196 256 N
> -0 147 V
> -12 0 V
> -0 -147 V
> --12 0 V
> -Z stroke
> -2208 256 N
> -0 117 V
> -13 0 V
> -0 -117 V
> --13 0 V
> -Z stroke
> -2221 256 N
> -0 90 V
> -12 0 V
> -0 -90 V
> --12 0 V
> -Z stroke
> -2233 256 N
> -0 77 V
> -13 0 V
> -0 -77 V
> --13 0 V
> -Z stroke
> -2246 256 N
> -0 66 V
> -12 0 V
> -0 -66 V
> --12 0 V
> -Z stroke
> -2258 256 N
> -0 42 V
> -13 0 V
> -0 -42 V
> --13 0 V
> -Z stroke
> -2271 256 N
> -0 37 V
> -12 0 V
> -0 -37 V
> --12 0 V
> -Z stroke
> -2283 256 N
> -0 22 V
> -13 0 V
> -0 -22 V
> --13 0 V
> -Z stroke
> -2296 256 N
> -0 21 V
> -12 0 V
> -0 -21 V
> --12 0 V
> -Z stroke
> -2308 256 N
> -0 16 V
> -13 0 V
> -0 -16 V
> --13 0 V
> -Z stroke
> -2321 256 N
> -0 18 V
> -12 0 V
> -0 -18 V
> --12 0 V
> -Z stroke
> -2333 256 N
> -0 7 V
> -13 0 V
> -0 -7 V
> --13 0 V
> -Z stroke
> -2346 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2358 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2371 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2383 256 N
> -0 2 V
> -13 0 V
> -0 -2 V
> --13 0 V
> -Z stroke
> -2396 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2408 256 N
> -0 4 V
> -13 0 V
> -0 -4 V
> --13 0 V
> -Z stroke
> -2421 256 N
> -0 2 V
> -12 0 V
> -0 -2 V
> --12 0 V
> -Z stroke
> -2433 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2446 256 N
> -0 3 V
> -12 0 V
> -0 -3 V
> --12 0 V
> -Z stroke
> -2458 256 N
> -0 4 V
> -13 0 V
> -0 -4 V
> --13 0 V
> -Z stroke
> -2471 256 N
> -0 5 V
> -12 0 V
> -0 -5 V
> --12 0 V
> -Z stroke
> -2483 256 N
> -0 1 V
> -13 0 V
> -0 -1 V
> --13 0 V
> -Z stroke
> -2508 256 N
> -0 6 V
> -13 0 V
> -0 -6 V
> --13 0 V
> -Z stroke
> -2521 256 N
> -0 3 V
> -12 0 V
> -0 -3 V
> --12 0 V
> -Z stroke
> -2533 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2546 256 N
> -0 4 V
> -12 0 V
> -0 -4 V
> --12 0 V
> -Z stroke
> -2558 256 N
> -0 3 V
> -13 0 V
> -0 -3 V
> --13 0 V
> -Z stroke
> -2571 256 N
> -0 6 V
> -12 0 V
> -0 -6 V
> --12 0 V
> -Z stroke
> -2583 256 N
> -0 2 V
> -13 0 V
> -0 -2 V
> --13 0 V
> -Z stroke
> -2596 256 N
> -0 1 V
> -12 0 V
> -0 -1 V
> --12 0 V
> -Z stroke
> -2608 256 N
> -0 2 V
> -13 0 V
> -0 -2 V
> --13 0 V
> -Z stroke
> -2621 256 N
> -0 3 V
> -6 0 V
> -0 -3 V
> --6 0 V
> -Z stroke
> +1.000 562 319 7 2 BoxColFill
> +1.000 649 319 8 5 BoxColFill
> +1.000 662 319 7 10 BoxColFill
> +1.000 674 319 8 13 BoxColFill
> +1.000 687 319 7 5 BoxColFill
> +1.000 699 319 8 13 BoxColFill
> +1.000 712 319 7 35 BoxColFill
> +1.000 724 319 8 16 BoxColFill
> +1.000 737 319 7 6 BoxColFill
> +1.000 799 319 8 2 BoxColFill
> +1.000 812 319 7 43 BoxColFill
> +1.000 824 319 8 52 BoxColFill
> +1.000 837 319 7 13 BoxColFill
> +1.000 849 319 8 28 BoxColFill
> +1.000 862 319 7 50 BoxColFill
> +1.000 874 319 8 63 BoxColFill
> +1.000 887 319 7 31 BoxColFill
> +1.000 899 319 8 13 BoxColFill
> +1.000 912 319 7 14 BoxColFill
> +1.000 924 319 8 16 BoxColFill
> +1.000 937 319 7 21 BoxColFill
> +1.000 949 319 8 33 BoxColFill
> +1.000 962 319 7 49 BoxColFill
> +1.000 974 319 8 117 BoxColFill
> +1.000 987 319 7 120 BoxColFill
> +1.000 999 319 7 152 BoxColFill
> +1.000 1012 319 7 194 BoxColFill
> +1.000 1024 319 7 251 BoxColFill
> +1.000 1037 319 7 327 BoxColFill
> +1.000 1049 319 7 385 BoxColFill
> +1.000 1062 319 7 451 BoxColFill
> +1.000 1074 319 7 537 BoxColFill
> +1.000 1087 319 7 581 BoxColFill
> +1.000 1099 319 7 672 BoxColFill
> +1.000 1112 319 7 702 BoxColFill
> +1.000 1124 319 7 859 BoxColFill
> +1.000 1137 319 7 994 BoxColFill
> +1.000 1149 319 7 923 BoxColFill
> +1.000 1162 319 7 955 BoxColFill
> +1.000 1174 319 7 921 BoxColFill
> +1.000 1187 319 7 1067 BoxColFill
> +1.000 1199 319 7 964 BoxColFill
> +1.000 1212 319 7 949 BoxColFill
> +1.000 1224 319 7 886 BoxColFill
> +1.000 1237 319 7 815 BoxColFill
> +1.000 1249 319 7 777 BoxColFill
> +1.000 1262 319 7 733 BoxColFill
> +1.000 1274 319 7 656 BoxColFill
> +1.000 1287 319 7 637 BoxColFill
> +1.000 1299 319 7 549 BoxColFill
> +1.000 1312 319 7 543 BoxColFill
> +1.000 1324 319 7 498 BoxColFill
> +1.000 1337 319 7 451 BoxColFill
> +1.000 1349 319 7 429 BoxColFill
> +1.000 1362 319 7 422 BoxColFill
> +1.000 1374 319 7 402 BoxColFill
> +1.000 1387 319 7 406 BoxColFill
> +1.000 1399 319 7 463 BoxColFill
> +1.000 1412 319 7 470 BoxColFill
> +1.000 1424 319 7 520 BoxColFill
> +1.000 1437 319 7 594 BoxColFill
> +1.000 1449 319 7 702 BoxColFill
> +1.000 1462 319 7 721 BoxColFill
> +1.000 1474 319 7 818 BoxColFill
> +1.000 1487 319 7 908 BoxColFill
> +1.000 1499 319 7 1009 BoxColFill
> +1.000 1512 319 7 1065 BoxColFill
> +1.000 1524 319 7 1180 BoxColFill
> +1.000 1537 319 7 1201 BoxColFill
> +1.000 1549 319 7 1213 BoxColFill
> +1.000 1562 319 7 1307 BoxColFill
> +1.000 1574 319 7 1291 BoxColFill
> +1.000 1587 319 7 1355 BoxColFill
> +1.000 1599 319 7 1348 BoxColFill
> +1.000 1612 319 7 1262 BoxColFill
> +1.000 1624 319 7 1262 BoxColFill
> +1.000 1637 319 7 1300 BoxColFill
> +1.000 1649 319 7 1176 BoxColFill
> +1.000 1662 319 7 1175 BoxColFill
> +1.000 1674 319 7 1136 BoxColFill
> +1.000 1687 319 7 1104 BoxColFill
> +1.000 1699 319 7 933 BoxColFill
> +1.000 1712 319 7 889 BoxColFill
> +1.000 1724 319 7 923 BoxColFill
> +1.000 1737 319 7 812 BoxColFill
> +1.000 1749 319 7 776 BoxColFill
> +1.000 1762 319 7 726 BoxColFill
> +1.000 1774 319 7 652 BoxColFill
> +1.000 1787 319 7 566 BoxColFill
> +1.000 1799 319 7 576 BoxColFill
> +1.000 1812 319 7 506 BoxColFill
> +1.000 1824 319 7 526 BoxColFill
> +1.000 1837 319 7 500 BoxColFill
> +1.000 1849 319 7 523 BoxColFill
> +1.000 1862 319 7 481 BoxColFill
> +1.000 1874 319 7 471 BoxColFill
> +1.000 1887 319 7 521 BoxColFill
> +1.000 1899 319 7 529 BoxColFill
> +1.000 1912 319 7 585 BoxColFill
> +1.000 1924 319 7 628 BoxColFill
> +1.000 1937 319 7 658 BoxColFill
> +1.000 1949 319 7 700 BoxColFill
> +1.000 1962 319 7 676 BoxColFill
> +1.000 1974 319 7 734 BoxColFill
> +1.000 1987 319 7 734 BoxColFill
> +1.000 1999 319 7 724 BoxColFill
> +1.000 2012 319 7 763 BoxColFill
> +1.000 2024 319 7 662 BoxColFill
> +1.000 2037 319 7 709 BoxColFill
> +1.000 2049 319 7 625 BoxColFill
> +1.000 2062 319 7 631 BoxColFill
> +1.000 2074 319 7 569 BoxColFill
> +1.000 2086 319 8 566 BoxColFill
> +1.000 2099 319 7 457 BoxColFill
> +1.000 2111 319 8 393 BoxColFill
> +1.000 2124 319 7 377 BoxColFill
> +1.000 2136 319 8 308 BoxColFill
> +1.000 2149 319 7 294 BoxColFill
> +1.000 2161 319 8 242 BoxColFill
> +1.000 2174 319 7 208 BoxColFill
> +1.000 2186 319 8 161 BoxColFill
> +1.000 2199 319 7 142 BoxColFill
> +1.000 2211 319 8 113 BoxColFill
> +1.000 2224 319 7 87 BoxColFill
> +1.000 2236 319 8 75 BoxColFill
> +1.000 2249 319 7 64 BoxColFill
> +1.000 2261 319 8 41 BoxColFill
> +1.000 2274 319 7 36 BoxColFill
> +1.000 2286 319 8 22 BoxColFill
> +1.000 2299 319 7 21 BoxColFill
> +1.000 2311 319 8 16 BoxColFill
> +1.000 2324 319 7 18 BoxColFill
> +1.000 2336 319 8 8 BoxColFill
> +1.000 2349 319 7 7 BoxColFill
> +1.000 2361 319 8 4 BoxColFill
> +1.000 2374 319 7 7 BoxColFill
> +1.000 2386 319 8 3 BoxColFill
> +1.000 2399 319 7 7 BoxColFill
> +1.000 2411 319 8 5 BoxColFill
> +1.000 2424 319 7 3 BoxColFill
> +1.000 2436 319 8 4 BoxColFill
> +1.000 2449 319 7 4 BoxColFill
> +1.000 2461 319 8 5 BoxColFill
> +1.000 2474 319 7 5 BoxColFill
> +1.000 2486 319 8 2 BoxColFill
> +1.000 2511 319 8 7 BoxColFill
> +1.000 2524 319 7 4 BoxColFill
> +1.000 2536 319 8 4 BoxColFill
> +1.000 2549 319 7 5 BoxColFill
> +1.000 2561 319 8 4 BoxColFill
> +1.000 2574 319 7 6 BoxColFill
> +1.000 2586 319 8 3 BoxColFill
> +1.000 2599 319 7 2 BoxColFill
> +1.000 2611 319 8 3 BoxColFill
> +1.000 2624 319 4 4 BoxColFill
>  % End plot #1
>  2.000 UL
>  LTb
> @@ -3096,9 +2321,9 @@ LCb setrgbcolor
>  LTB
>  LCb setrgbcolor
>  440 1720 N
> -440 256 L
> +440 319 L
>  2187 0 V
> -0 1464 V
> +0 1401 V
>  -2187 0 V
>  Z stroke
>  1.000 UP
> 
> base-commit: 80bfc1ebe32b3621f68403d7118996cd6d6ba304
> -- 
> 2.34.1
> 
