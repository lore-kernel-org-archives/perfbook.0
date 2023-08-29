Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236870AbjH2Obf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 29 Aug 2023 10:31:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385F7CC
        for <perfbook@vger.kernel.org>; Tue, 29 Aug 2023 07:31:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B037D62220
        for <perfbook@vger.kernel.org>; Tue, 29 Aug 2023 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693319487;
        bh=h32H4COCI0Cj+cVF1FnyosxIk+nvL4pLYXC8s8j3LXg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PgAaLJBtpSgEloHTKeFRnH5dYu3Y27XVJT+LI2VlAtvSd4jIHhQ56ZXFRBx2Of9VV
         wvXyUg6pO9Rh0whpLlC7lfEVCri9XtFfpHwqr1JHXevCYTy/mJ5ECD6JZ69AIaI8+p
         L1iUYS8OObyCxl8Gjti1oesvy/CC8ee4+srwcmcRRmLjLJS5oDTfFLmdOEPAfqAwZv
         hDwczn4S3eZ8Vgvf9jYNh5Uyxyrq6SE5mNqfchR130XXas4EVzA4VilNz1T/oSEo/T
         at7gfvwKU5hsF/DqTCQBgjRmxetcu2uWi7ItEzPH/WgRAnAuIa+wGvlpOu2ixb0vmy
         TnbuevF5etUhg==
Date: Tue, 29 Aug 2023 07:31:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Update plot of RCU-test-ratio as of v6.5
Message-ID: <386d3c34-09c7-4609-bfc2-c1ffba62b950@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <84be9d9c-fcb4-76ea-fdf6-fcd355c894f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84be9d9c-fcb4-76ea-fdf6-fcd355c894f1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 29, 2023 at 06:31:51PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/RCU-test-ratio.eps | 1295 ++++++++++----------
>  CodeSamples/formal/data/rcu-test.dat       |    1 +
>  2 files changed, 662 insertions(+), 634 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index d2c802173b14..fc7eda80e39e 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
>  %%Creator: gnuplot 5.2 patchlevel 8
> -%%CreationDate: Tue Jun 27 19:02:14 2023
> +%%CreationDate: Mon Aug 28 18:02:46 2023
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 654 320
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.2 patchlevel 8)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Tue Jun 27 19:02:14 2023)
> +  /CreationDate (Mon Aug 28 18:02:46 2023)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -2009,21 +2009,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -890 768 M
> +889 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -937 768 M
> +935 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -984 768 M
> +982 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1031 768 M
> +1029 768 M
>  stroke
> -1031 696 M
> +1029 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.16)]
>  ] -40.0 MRshow
> @@ -2032,21 +2032,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1079 768 M
> +1076 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1126 768 M
> +1123 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1173 768 M
> +1169 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1221 768 M
> +1216 768 M
>  stroke
> -1221 696 M
> +1216 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.20)]
>  ] -40.0 MRshow
> @@ -2055,21 +2055,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1268 768 M
> +1263 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1315 768 M
> +1310 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1362 768 M
> +1357 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1410 768 M
> +1403 768 M
>  stroke
> -1410 696 M
> +1403 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.24)]
>  ] -40.0 MRshow
> @@ -2078,21 +2078,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1457 768 M
> +1450 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1504 768 M
> +1497 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1552 768 M
> +1544 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1599 768 M
> +1590 768 M
>  stroke
> -1599 696 M
> +1590 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.28)]
>  ] -40.0 MRshow
> @@ -2101,21 +2101,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1646 768 M
> +1637 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1693 768 M
> +1684 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1741 768 M
> +1731 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1788 768 M
> +1778 768 M
>  stroke
> -1788 696 M
> +1778 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.32)]
>  ] -40.0 MRshow
> @@ -2124,21 +2124,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1835 768 M
> +1824 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1883 768 M
> +1871 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1930 768 M
> +1918 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1977 768 M
> +1965 768 M
>  stroke
> -1977 696 M
> +1965 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.36)]
>  ] -40.0 MRshow
> @@ -2147,21 +2147,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2024 768 M
> +2012 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2072 768 M
> +2058 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2119 768 M
> +2105 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2166 768 M
> +2152 768 M
>  stroke
> -2166 696 M
> +2152 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.0)]
>  ] -40.0 MRshow
> @@ -2170,21 +2170,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2214 768 M
> +2199 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2261 768 M
> +2246 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2308 768 M
> +2292 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2355 768 M
> +2339 768 M
>  stroke
> -2355 696 M
> +2339 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.4)]
>  ] -40.0 MRshow
> @@ -2193,21 +2193,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2403 768 M
> +2386 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2450 768 M
> +2433 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2497 768 M
> +2480 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2545 768 M
> +2526 768 M
>  stroke
> -2545 696 M
> +2526 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.8)]
>  ] -40.0 MRshow
> @@ -2216,21 +2216,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2592 768 M
> +2573 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2639 768 M
> +2620 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2686 768 M
> +2667 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2734 768 M
> +2713 768 M
>  stroke
> -2734 696 M
> +2713 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.12)]
>  ] -40.0 MRshow
> @@ -2239,21 +2239,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2781 768 M
> +2760 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2828 768 M
> +2807 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2876 768 M
> +2854 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2923 768 M
> +2901 768 M
>  stroke
> -2923 696 M
> +2901 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.16)]
>  ] -40.0 MRshow
> @@ -2262,21 +2262,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2970 768 M
> +2947 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3017 768 M
> +2994 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3065 768 M
> +3041 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3112 768 M
> +3088 768 M
>  stroke
> -3112 696 M
> +3088 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.0)]
>  ] -40.0 MRshow
> @@ -2285,21 +2285,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3159 768 M
> +3135 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3206 768 M
> +3181 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3254 768 M
> +3228 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3301 768 M
> +3275 768 M
>  stroke
> -3301 696 M
> +3275 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.4)]
>  ] -40.0 MRshow
> @@ -2308,21 +2308,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3348 768 M
> +3322 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3396 768 M
> +3369 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3443 768 M
> +3415 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3490 768 M
> +3462 768 M
>  stroke
> -3490 696 M
> +3462 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.8)]
>  ] -40.0 MRshow
> @@ -2331,21 +2331,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3537 768 M
> +3509 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3585 768 M
> +3556 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3632 768 M
> +3603 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3679 768 M
> +3649 768 M
>  stroke
> -3679 696 M
> +3649 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.12)]
>  ] -40.0 MRshow
> @@ -2354,21 +2354,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3727 768 M
> +3696 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3774 768 M
> +3743 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3821 768 M
> +3790 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3868 768 M
> +3836 768 M
>  stroke
> -3868 696 M
> +3836 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.16)]
>  ] -40.0 MRshow
> @@ -2377,25 +2377,25 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3916 768 M
> +3883 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3963 768 M
> +3930 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4010 768 M
> +3977 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4058 768 M
> +4024 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4105 768 M
> +4070 768 M
>  stroke
> -4105 696 M
> +4070 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.0)]
>  ] -40.0 MRshow
> @@ -2404,21 +2404,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4152 768 M
> +4117 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4199 768 M
> +4164 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4247 768 M
> +4211 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4294 768 M
> +4258 768 M
>  stroke
> -4294 696 M
> +4258 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.4)]
>  ] -40.0 MRshow
> @@ -2427,21 +2427,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4341 768 M
> +4304 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4389 768 M
> +4351 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4436 768 M
> +4398 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4483 768 M
> +4445 768 M
>  stroke
> -4483 696 M
> +4445 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.8)]
>  ] -40.0 MRshow
> @@ -2450,21 +2450,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4530 768 M
> +4492 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4578 768 M
> +4538 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4625 768 M
> +4585 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4672 768 M
> +4632 768 M
>  stroke
> -4672 696 M
> +4632 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.12)]
>  ] -40.0 MRshow
> @@ -2473,21 +2473,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4720 768 M
> +4679 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4767 768 M
> +4726 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4814 768 M
> +4772 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4861 768 M
> +4819 768 M
>  stroke
> -4861 696 M
> +4819 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.16)]
>  ] -40.0 MRshow
> @@ -2496,21 +2496,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4909 768 M
> +4866 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4956 768 M
> +4913 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5003 768 M
> +4959 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5051 768 M
> +5006 768 M
>  stroke
> -5051 696 M
> +5006 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.0)]
>  ] -40.0 MRshow
> @@ -2519,21 +2519,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -5098 768 M
> +5053 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5145 768 M
> +5100 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5192 768 M
> +5147 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5240 768 M
> +5193 768 M
>  stroke
> -5240 696 M
> +5193 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.4)]
>  ] -40.0 MRshow
> @@ -2542,6 +2542,10 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> +5240 768 M
> +stroke
> +LTb
> +LCb setrgbcolor
>  5287 768 M
>  63 0 V
>  stroke
> @@ -2660,9 +2664,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 826 768 34 41 BoxColFill
> +0.180 825 768 34 41 BoxColFill
>  LCb setrgbcolor
> -826 768 N
> +825 768 N
>  0 40 V
>  33 0 V
>  0 -40 V
> @@ -2671,9 +2675,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 873 768 34 41 BoxColFill
> +0.180 872 768 34 41 BoxColFill
>  LCb setrgbcolor
> -873 768 N
> +872 768 N
>  0 40 V
>  33 0 V
>  0 -40 V
> @@ -2682,9 +2686,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 920 768 34 54 BoxColFill
> +0.180 919 768 34 54 BoxColFill
>  LCb setrgbcolor
> -920 768 N
> +919 768 N
>  0 53 V
>  33 0 V
>  0 -53 V
> @@ -2693,9 +2697,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 968 768 34 57 BoxColFill
> +0.180 966 768 34 57 BoxColFill
>  LCb setrgbcolor
> -968 768 N
> +966 768 N
>  0 56 V
>  33 0 V
>  0 -56 V
> @@ -2704,20 +2708,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1015 768 34 47 BoxColFill
> +0.180 1013 768 33 47 BoxColFill
>  LCb setrgbcolor
> -1015 768 N
> +1013 768 N
>  0 46 V
> -33 0 V
> +32 0 V
>  0 -46 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1062 768 34 48 BoxColFill
> +0.180 1059 768 34 48 BoxColFill
>  LCb setrgbcolor
> -1062 768 N
> +1059 768 N
>  0 47 V
>  33 0 V
>  0 -47 V
> @@ -2726,20 +2730,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1109 768 35 49 BoxColFill
> +0.180 1106 768 34 49 BoxColFill
>  LCb setrgbcolor
> -1109 768 N
> +1106 768 N
>  0 48 V
> -34 0 V
> +33 0 V
>  0 -48 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1157 768 34 65 BoxColFill
> +0.180 1153 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1157 768 N
> +1153 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2748,9 +2752,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1204 768 34 65 BoxColFill
> +0.180 1200 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1204 768 N
> +1200 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2759,20 +2763,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1251 768 34 65 BoxColFill
> +0.180 1247 768 33 65 BoxColFill
>  LCb setrgbcolor
> -1251 768 N
> +1247 768 N
>  0 64 V
> -33 0 V
> +32 0 V
>  0 -64 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1299 768 34 65 BoxColFill
> +0.180 1293 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1299 768 N
> +1293 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2781,9 +2785,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1346 768 34 65 BoxColFill
> +0.180 1340 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1346 768 N
> +1340 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2792,9 +2796,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1393 768 34 67 BoxColFill
> +0.180 1387 768 34 67 BoxColFill
>  LCb setrgbcolor
> -1393 768 N
> +1387 768 N
>  0 66 V
>  33 0 V
>  0 -66 V
> @@ -2803,20 +2807,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1440 768 35 164 BoxColFill
> +0.180 1434 768 33 164 BoxColFill
>  LCb setrgbcolor
> -1440 768 N
> +1434 768 N
>  0 163 V
> -34 0 V
> +32 0 V
>  0 -163 V
> --34 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1488 768 34 164 BoxColFill
> +0.180 1480 768 34 164 BoxColFill
>  LCb setrgbcolor
> -1488 768 N
> +1480 768 N
>  0 163 V
>  33 0 V
>  0 -163 V
> @@ -2825,9 +2829,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1535 768 34 207 BoxColFill
> +0.180 1527 768 34 207 BoxColFill
>  LCb setrgbcolor
> -1535 768 N
> +1527 768 N
>  0 206 V
>  33 0 V
>  0 -206 V
> @@ -2836,9 +2840,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1582 768 34 217 BoxColFill
> +0.180 1574 768 34 217 BoxColFill
>  LCb setrgbcolor
> -1582 768 N
> +1574 768 N
>  0 216 V
>  33 0 V
>  0 -216 V
> @@ -2847,9 +2851,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1630 768 34 337 BoxColFill
> +0.180 1621 768 34 337 BoxColFill
>  LCb setrgbcolor
> -1630 768 N
> +1621 768 N
>  0 336 V
>  33 0 V
>  0 -336 V
> @@ -2858,20 +2862,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1677 768 34 339 BoxColFill
> +0.180 1668 768 33 339 BoxColFill
>  LCb setrgbcolor
> -1677 768 N
> +1668 768 N
>  0 338 V
> -33 0 V
> +32 0 V
>  0 -338 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1724 768 34 344 BoxColFill
> +0.180 1714 768 34 344 BoxColFill
>  LCb setrgbcolor
> -1724 768 N
> +1714 768 N
>  0 343 V
>  33 0 V
>  0 -343 V
> @@ -2880,20 +2884,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1771 768 35 234 BoxColFill
> +0.180 1761 768 34 234 BoxColFill
>  LCb setrgbcolor
> -1771 768 N
> +1761 768 N
>  0 233 V
> -34 0 V
> +33 0 V
>  0 -233 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1819 768 34 273 BoxColFill
> +0.180 1808 768 34 273 BoxColFill
>  LCb setrgbcolor
> -1819 768 N
> +1808 768 N
>  0 272 V
>  33 0 V
>  0 -272 V
> @@ -2902,9 +2906,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1866 768 34 304 BoxColFill
> +0.180 1855 768 34 304 BoxColFill
>  LCb setrgbcolor
> -1866 768 N
> +1855 768 N
>  0 303 V
>  33 0 V
>  0 -303 V
> @@ -2913,20 +2917,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1913 768 34 316 BoxColFill
> +0.180 1902 768 33 316 BoxColFill
>  LCb setrgbcolor
> -1913 768 N
> +1902 768 N
>  0 315 V
> -33 0 V
> +32 0 V
>  0 -315 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1961 768 34 329 BoxColFill
> +0.180 1948 768 34 329 BoxColFill
>  LCb setrgbcolor
> -1961 768 N
> +1948 768 N
>  0 328 V
>  33 0 V
>  0 -328 V
> @@ -2935,9 +2939,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2008 768 34 370 BoxColFill
> +0.180 1995 768 34 370 BoxColFill
>  LCb setrgbcolor
> -2008 768 N
> +1995 768 N
>  0 369 V
>  33 0 V
>  0 -369 V
> @@ -2946,9 +2950,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2055 768 34 407 BoxColFill
> +0.180 2042 768 34 407 BoxColFill
>  LCb setrgbcolor
> -2055 768 N
> +2042 768 N
>  0 406 V
>  33 0 V
>  0 -406 V
> @@ -2957,31 +2961,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2102 768 35 408 BoxColFill
> +0.180 2089 768 34 408 BoxColFill
>  LCb setrgbcolor
> -2102 768 N
> +2089 768 N
>  0 407 V
> -34 0 V
> +33 0 V
>  0 -407 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2150 768 34 469 BoxColFill
> +0.180 2136 768 33 469 BoxColFill
>  LCb setrgbcolor
> -2150 768 N
> +2136 768 N
>  0 468 V
> -33 0 V
> +32 0 V
>  0 -468 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2197 768 34 469 BoxColFill
> +0.180 2182 768 34 469 BoxColFill
>  LCb setrgbcolor
> -2197 768 N
> +2182 768 N
>  0 468 V
>  33 0 V
>  0 -468 V
> @@ -2990,9 +2994,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2244 768 34 478 BoxColFill
> +0.180 2229 768 34 478 BoxColFill
>  LCb setrgbcolor
> -2244 768 N
> +2229 768 N
>  0 477 V
>  33 0 V
>  0 -477 V
> @@ -3001,9 +3005,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2292 768 34 506 BoxColFill
> +0.180 2276 768 34 506 BoxColFill
>  LCb setrgbcolor
> -2292 768 N
> +2276 768 N
>  0 505 V
>  33 0 V
>  0 -505 V
> @@ -3012,9 +3016,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2339 768 34 534 BoxColFill
> +0.180 2323 768 34 534 BoxColFill
>  LCb setrgbcolor
> -2339 768 N
> +2323 768 N
>  0 533 V
>  33 0 V
>  0 -533 V
> @@ -3023,20 +3027,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2386 768 34 566 BoxColFill
> +0.180 2370 768 33 566 BoxColFill
>  LCb setrgbcolor
> -2386 768 N
> +2370 768 N
>  0 565 V
> -33 0 V
> +32 0 V
>  0 -565 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2433 768 34 567 BoxColFill
> +0.180 2416 768 34 567 BoxColFill
>  LCb setrgbcolor
> -2433 768 N
> +2416 768 N
>  0 566 V
>  33 0 V
>  0 -566 V
> @@ -3045,9 +3049,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2481 768 34 569 BoxColFill
> +0.180 2463 768 34 569 BoxColFill
>  LCb setrgbcolor
> -2481 768 N
> +2463 768 N
>  0 568 V
>  33 0 V
>  0 -568 V
> @@ -3056,9 +3060,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2528 768 34 601 BoxColFill
> +0.180 2510 768 34 601 BoxColFill
>  LCb setrgbcolor
> -2528 768 N
> +2510 768 N
>  0 600 V
>  33 0 V
>  0 -600 V
> @@ -3067,20 +3071,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2575 768 34 611 BoxColFill
> +0.180 2557 768 33 611 BoxColFill
>  LCb setrgbcolor
> -2575 768 N
> +2557 768 N
>  0 610 V
> -33 0 V
> +32 0 V
>  0 -610 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2623 768 34 613 BoxColFill
> +0.180 2603 768 34 613 BoxColFill
>  LCb setrgbcolor
> -2623 768 N
> +2603 768 N
>  0 612 V
>  33 0 V
>  0 -612 V
> @@ -3089,9 +3093,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2670 768 34 557 BoxColFill
> +0.180 2650 768 34 557 BoxColFill
>  LCb setrgbcolor
> -2670 768 N
> +2650 768 N
>  0 556 V
>  33 0 V
>  0 -556 V
> @@ -3100,9 +3104,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2717 768 34 578 BoxColFill
> +0.180 2697 768 34 578 BoxColFill
>  LCb setrgbcolor
> -2717 768 N
> +2697 768 N
>  0 577 V
>  33 0 V
>  0 -577 V
> @@ -3111,9 +3115,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2764 768 34 589 BoxColFill
> +0.180 2744 768 34 589 BoxColFill
>  LCb setrgbcolor
> -2764 768 N
> +2744 768 N
>  0 588 V
>  33 0 V
>  0 -588 V
> @@ -3122,20 +3126,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2812 768 34 599 BoxColFill
> +0.180 2791 768 33 599 BoxColFill
>  LCb setrgbcolor
> -2812 768 N
> +2791 768 N
>  0 598 V
> -33 0 V
> +32 0 V
>  0 -598 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2859 768 34 603 BoxColFill
> +0.180 2837 768 34 603 BoxColFill
>  LCb setrgbcolor
> -2859 768 N
> +2837 768 N
>  0 602 V
>  33 0 V
>  0 -602 V
> @@ -3144,9 +3148,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2906 768 34 614 BoxColFill
> +0.180 2884 768 34 614 BoxColFill
>  LCb setrgbcolor
> -2906 768 N
> +2884 768 N
>  0 613 V
>  33 0 V
>  0 -613 V
> @@ -3155,9 +3159,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2954 768 34 626 BoxColFill
> +0.180 2931 768 34 626 BoxColFill
>  LCb setrgbcolor
> -2954 768 N
> +2931 768 N
>  0 625 V
>  33 0 V
>  0 -625 V
> @@ -3166,9 +3170,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3001 768 34 657 BoxColFill
> +0.180 2978 768 34 657 BoxColFill
>  LCb setrgbcolor
> -3001 768 N
> +2978 768 N
>  0 656 V
>  33 0 V
>  0 -656 V
> @@ -3177,20 +3181,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3048 768 34 664 BoxColFill
> +0.180 3025 768 33 664 BoxColFill
>  LCb setrgbcolor
> -3048 768 N
> +3025 768 N
>  0 663 V
> -33 0 V
> +32 0 V
>  0 -663 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3095 768 34 662 BoxColFill
> +0.180 3071 768 34 662 BoxColFill
>  LCb setrgbcolor
> -3095 768 N
> +3071 768 N
>  0 661 V
>  33 0 V
>  0 -661 V
> @@ -3199,9 +3203,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3143 768 34 674 BoxColFill
> +0.180 3118 768 34 674 BoxColFill
>  LCb setrgbcolor
> -3143 768 N
> +3118 768 N
>  0 673 V
>  33 0 V
>  0 -673 V
> @@ -3210,9 +3214,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3190 768 34 675 BoxColFill
> +0.180 3165 768 34 675 BoxColFill
>  LCb setrgbcolor
> -3190 768 N
> +3165 768 N
>  0 674 V
>  33 0 V
>  0 -674 V
> @@ -3221,9 +3225,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3237 768 34 683 BoxColFill
> +0.180 3212 768 34 683 BoxColFill
>  LCb setrgbcolor
> -3237 768 N
> +3212 768 N
>  0 682 V
>  33 0 V
>  0 -682 V
> @@ -3232,20 +3236,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3285 768 34 716 BoxColFill
> +0.180 3259 768 33 716 BoxColFill
>  LCb setrgbcolor
> -3285 768 N
> +3259 768 N
>  0 715 V
> -33 0 V
> +32 0 V
>  0 -715 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3332 768 34 724 BoxColFill
> +0.180 3305 768 34 724 BoxColFill
>  LCb setrgbcolor
> -3332 768 N
> +3305 768 N
>  0 723 V
>  33 0 V
>  0 -723 V
> @@ -3254,9 +3258,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3379 768 34 729 BoxColFill
> +0.180 3352 768 34 729 BoxColFill
>  LCb setrgbcolor
> -3379 768 N
> +3352 768 N
>  0 728 V
>  33 0 V
>  0 -728 V
> @@ -3265,9 +3269,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3426 768 34 737 BoxColFill
> +0.180 3399 768 34 737 BoxColFill
>  LCb setrgbcolor
> -3426 768 N
> +3399 768 N
>  0 736 V
>  33 0 V
>  0 -736 V
> @@ -3276,9 +3280,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3474 768 34 741 BoxColFill
> +0.180 3446 768 34 741 BoxColFill
>  LCb setrgbcolor
> -3474 768 N
> +3446 768 N
>  0 740 V
>  33 0 V
>  0 -740 V
> @@ -3287,20 +3291,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3521 768 34 745 BoxColFill
> +0.180 3493 768 33 745 BoxColFill
>  LCb setrgbcolor
> -3521 768 N
> +3493 768 N
>  0 744 V
> -33 0 V
> +32 0 V
>  0 -744 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3568 768 34 748 BoxColFill
> +0.180 3539 768 34 748 BoxColFill
>  LCb setrgbcolor
> -3568 768 N
> +3539 768 N
>  0 747 V
>  33 0 V
>  0 -747 V
> @@ -3309,9 +3313,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3616 768 34 759 BoxColFill
> +0.180 3586 768 34 759 BoxColFill
>  LCb setrgbcolor
> -3616 768 N
> +3586 768 N
>  0 758 V
>  33 0 V
>  0 -758 V
> @@ -3320,9 +3324,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3663 768 34 887 BoxColFill
> +0.180 3633 768 34 887 BoxColFill
>  LCb setrgbcolor
> -3663 768 N
> +3633 768 N
>  0 886 V
>  33 0 V
>  0 -886 V
> @@ -3331,20 +3335,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3710 768 34 786 BoxColFill
> +0.180 3680 768 33 786 BoxColFill
>  LCb setrgbcolor
> -3710 768 N
> +3680 768 N
>  0 785 V
> -33 0 V
> +32 0 V
>  0 -785 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3757 768 34 781 BoxColFill
> +0.180 3726 768 34 781 BoxColFill
>  LCb setrgbcolor
> -3757 768 N
> +3726 768 N
>  0 780 V
>  33 0 V
>  0 -780 V
> @@ -3353,9 +3357,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3805 768 34 785 BoxColFill
> +0.180 3773 768 34 785 BoxColFill
>  LCb setrgbcolor
> -3805 768 N
> +3773 768 N
>  0 784 V
>  33 0 V
>  0 -784 V
> @@ -3364,9 +3368,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3852 768 34 781 BoxColFill
> +0.180 3820 768 34 781 BoxColFill
>  LCb setrgbcolor
> -3852 768 N
> +3820 768 N
>  0 780 V
>  33 0 V
>  0 -780 V
> @@ -3375,9 +3379,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3899 768 34 780 BoxColFill
> +0.180 3867 768 34 780 BoxColFill
>  LCb setrgbcolor
> -3899 768 N
> +3867 768 N
>  0 779 V
>  33 0 V
>  0 -779 V
> @@ -3386,20 +3390,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3946 768 35 779 BoxColFill
> +0.180 3914 768 33 779 BoxColFill
>  LCb setrgbcolor
> -3946 768 N
> +3914 768 N
>  0 778 V
> -34 0 V
> +32 0 V
>  0 -778 V
> --34 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3994 768 34 791 BoxColFill
> +0.180 3960 768 34 791 BoxColFill
>  LCb setrgbcolor
> -3994 768 N
> +3960 768 N
>  0 790 V
>  33 0 V
>  0 -790 V
> @@ -3408,9 +3412,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4041 768 34 767 BoxColFill
> +0.180 4007 768 34 767 BoxColFill
>  LCb setrgbcolor
> -4041 768 N
> +4007 768 N
>  0 766 V
>  33 0 V
>  0 -766 V
> @@ -3419,9 +3423,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4088 768 34 772 BoxColFill
> +0.180 4054 768 34 772 BoxColFill
>  LCb setrgbcolor
> -4088 768 N
> +4054 768 N
>  0 771 V
>  33 0 V
>  0 -771 V
> @@ -3430,9 +3434,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4136 768 34 750 BoxColFill
> +0.180 4101 768 34 750 BoxColFill
>  LCb setrgbcolor
> -4136 768 N
> +4101 768 N
>  0 749 V
>  33 0 V
>  0 -749 V
> @@ -3441,20 +3445,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4183 768 34 748 BoxColFill
> +0.180 4148 768 33 748 BoxColFill
>  LCb setrgbcolor
> -4183 768 N
> +4148 768 N
>  0 747 V
> -33 0 V
> +32 0 V
>  0 -747 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4230 768 34 754 BoxColFill
> +0.180 4194 768 34 754 BoxColFill
>  LCb setrgbcolor
> -4230 768 N
> +4194 768 N
>  0 753 V
>  33 0 V
>  0 -753 V
> @@ -3463,20 +3467,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4277 768 35 781 BoxColFill
> +0.180 4241 768 34 781 BoxColFill
>  LCb setrgbcolor
> -4277 768 N
> +4241 768 N
>  0 780 V
> -34 0 V
> +33 0 V
>  0 -780 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4325 768 34 784 BoxColFill
> +0.180 4288 768 34 784 BoxColFill
>  LCb setrgbcolor
> -4325 768 N
> +4288 768 N
>  0 783 V
>  33 0 V
>  0 -783 V
> @@ -3485,9 +3489,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4372 768 34 796 BoxColFill
> +0.180 4335 768 34 796 BoxColFill
>  LCb setrgbcolor
> -4372 768 N
> +4335 768 N
>  0 795 V
>  33 0 V
>  0 -795 V
> @@ -3496,20 +3500,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4419 768 34 812 BoxColFill
> +0.180 4382 768 33 812 BoxColFill
>  LCb setrgbcolor
> -4419 768 N
> +4382 768 N
>  0 811 V
> -33 0 V
> +32 0 V
>  0 -811 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4467 768 34 884 BoxColFill
> +0.180 4428 768 34 884 BoxColFill
>  LCb setrgbcolor
> -4467 768 N
> +4428 768 N
>  0 883 V
>  33 0 V
>  0 -883 V
> @@ -3518,9 +3522,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4514 768 34 896 BoxColFill
> +0.180 4475 768 34 896 BoxColFill
>  LCb setrgbcolor
> -4514 768 N
> +4475 768 N
>  0 895 V
>  33 0 V
>  0 -895 V
> @@ -3529,9 +3533,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4561 768 34 905 BoxColFill
> +0.180 4522 768 34 905 BoxColFill
>  LCb setrgbcolor
> -4561 768 N
> +4522 768 N
>  0 904 V
>  33 0 V
>  0 -904 V
> @@ -3540,31 +3544,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4608 768 35 910 BoxColFill
> +0.180 4569 768 34 910 BoxColFill
>  LCb setrgbcolor
> -4608 768 N
> +4569 768 N
>  0 909 V
> -34 0 V
> +33 0 V
>  0 -909 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4656 768 34 962 BoxColFill
> +0.180 4616 768 33 962 BoxColFill
>  LCb setrgbcolor
> -4656 768 N
> +4616 768 N
>  0 961 V
> -33 0 V
> +32 0 V
>  0 -961 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4703 768 34 974 BoxColFill
> +0.180 4662 768 34 974 BoxColFill
>  LCb setrgbcolor
> -4703 768 N
> +4662 768 N
>  0 973 V
>  33 0 V
>  0 -973 V
> @@ -3573,9 +3577,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4750 768 34 982 BoxColFill
> +0.180 4709 768 34 982 BoxColFill
>  LCb setrgbcolor
> -4750 768 N
> +4709 768 N
>  0 981 V
>  33 0 V
>  0 -981 V
> @@ -3584,9 +3588,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4798 768 34 982 BoxColFill
> +0.180 4756 768 34 982 BoxColFill
>  LCb setrgbcolor
> -4798 768 N
> +4756 768 N
>  0 981 V
>  33 0 V
>  0 -981 V
> @@ -3595,20 +3599,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4845 768 34 982 BoxColFill
> +0.180 4803 768 33 982 BoxColFill
>  LCb setrgbcolor
> -4845 768 N
> +4803 768 N
>  0 981 V
> -33 0 V
> +32 0 V
>  0 -981 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4892 768 34 994 BoxColFill
> +0.180 4849 768 34 994 BoxColFill
>  LCb setrgbcolor
> -4892 768 N
> +4849 768 N
>  0 993 V
>  33 0 V
>  0 -993 V
> @@ -3617,20 +3621,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4939 768 35 1000 BoxColFill
> +0.180 4896 768 34 1000 BoxColFill
>  LCb setrgbcolor
> -4939 768 N
> +4896 768 N
>  0 999 V
> -34 0 V
> +33 0 V
>  0 -999 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4987 768 34 1032 BoxColFill
> +0.180 4943 768 34 1032 BoxColFill
>  LCb setrgbcolor
> -4987 768 N
> +4943 768 N
>  0 1031 V
>  33 0 V
>  0 -1031 V
> @@ -3639,9 +3643,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5034 768 34 1034 BoxColFill
> +0.180 4990 768 34 1034 BoxColFill
>  LCb setrgbcolor
> -5034 768 N
> +4990 768 N
>  0 1033 V
>  33 0 V
>  0 -1033 V
> @@ -3650,20 +3654,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5081 768 34 1054 BoxColFill
> +0.180 5037 768 33 1054 BoxColFill
>  LCb setrgbcolor
> -5081 768 N
> +5037 768 N
>  0 1053 V
> -33 0 V
> +32 0 V
>  0 -1053 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5129 768 34 1073 BoxColFill
> +0.180 5083 768 34 1073 BoxColFill
>  LCb setrgbcolor
> -5129 768 N
> +5083 768 N
>  0 1072 V
>  33 0 V
>  0 -1072 V
> @@ -3672,9 +3676,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5176 768 34 1093 BoxColFill
> +0.180 5130 768 34 1093 BoxColFill
>  LCb setrgbcolor
> -5176 768 N
> +5130 768 N
>  0 1092 V
>  33 0 V
>  0 -1092 V
> @@ -3683,9 +3687,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5223 768 34 1111 BoxColFill
> +0.180 5177 768 34 1111 BoxColFill
>  LCb setrgbcolor
> -5223 768 N
> +5177 768 N
>  0 1110 V
>  33 0 V
>  0 -1110 V
> @@ -3694,6 +3698,17 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> +0.180 5224 768 34 1116 BoxColFill
> +LCb setrgbcolor
> +5224 768 N
> +0 1115 V
> +33 0 V
> +0 -1115 V
> +-33 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
>  % End plot #1
>  % Begin plot #2
>  1.000 UL
> @@ -3718,36 +3733,36 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 826 808 34 1 BoxColFill
> +0.180 825 808 34 1 BoxColFill
>  LCb setrgbcolor
> -826 808 N
> +825 808 N
>  33 0 V
>  -33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 873 808 34 1 BoxColFill
> +0.180 872 808 34 1 BoxColFill
>  LCb setrgbcolor
> -873 808 N
> +872 808 N
>  33 0 V
>  -33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 920 821 34 1 BoxColFill
> +0.180 919 821 34 1 BoxColFill
>  LCb setrgbcolor
> -920 821 N
> +919 821 N
>  33 0 V
>  -33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 968 824 34 27 BoxColFill
> +0.180 966 824 34 27 BoxColFill
>  LCb setrgbcolor
> -968 824 N
> +966 824 N
>  0 26 V
>  33 0 V
>  0 -26 V
> @@ -3756,20 +3771,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1015 814 34 32 BoxColFill
> +0.180 1013 814 33 32 BoxColFill
>  LCb setrgbcolor
> -1015 814 N
> +1013 814 N
>  0 31 V
> -33 0 V
> +32 0 V
>  0 -31 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1062 815 34 32 BoxColFill
> +0.180 1059 815 34 32 BoxColFill
>  LCb setrgbcolor
> -1062 815 N
> +1059 815 N
>  0 31 V
>  33 0 V
>  0 -31 V
> @@ -3778,20 +3793,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1109 816 35 38 BoxColFill
> +0.180 1106 816 34 38 BoxColFill
>  LCb setrgbcolor
> -1109 816 N
> +1106 816 N
>  0 37 V
> -34 0 V
> +33 0 V
>  0 -37 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1157 832 34 53 BoxColFill
> +0.180 1153 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1157 832 N
> +1153 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3800,9 +3815,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1204 832 34 53 BoxColFill
> +0.180 1200 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1204 832 N
> +1200 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3811,20 +3826,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1251 832 34 53 BoxColFill
> +0.180 1247 832 33 53 BoxColFill
>  LCb setrgbcolor
> -1251 832 N
> +1247 832 N
>  0 52 V
> -33 0 V
> +32 0 V
>  0 -52 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1299 832 34 53 BoxColFill
> +0.180 1293 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1299 832 N
> +1293 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3833,9 +3848,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1346 832 34 53 BoxColFill
> +0.180 1340 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1346 832 N
> +1340 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3844,9 +3859,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1393 834 34 52 BoxColFill
> +0.180 1387 834 34 52 BoxColFill
>  LCb setrgbcolor
> -1393 834 N
> +1387 834 N
>  0 51 V
>  33 0 V
>  0 -51 V
> @@ -3855,20 +3870,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1440 931 35 53 BoxColFill
> +0.180 1434 931 33 53 BoxColFill
>  LCb setrgbcolor
> -1440 931 N
> +1434 931 N
>  0 52 V
> -34 0 V
> +32 0 V
>  0 -52 V
> --34 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1488 931 34 52 BoxColFill
> +0.180 1480 931 34 52 BoxColFill
>  LCb setrgbcolor
> -1488 931 N
> +1480 931 N
>  0 51 V
>  33 0 V
>  0 -51 V
> @@ -3877,9 +3892,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1535 974 34 61 BoxColFill
> +0.180 1527 974 34 61 BoxColFill
>  LCb setrgbcolor
> -1535 974 N
> +1527 974 N
>  0 60 V
>  33 0 V
>  0 -60 V
> @@ -3888,9 +3903,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1582 984 34 61 BoxColFill
> +0.180 1574 984 34 61 BoxColFill
>  LCb setrgbcolor
> -1582 984 N
> +1574 984 N
>  0 60 V
>  33 0 V
>  0 -60 V
> @@ -3899,9 +3914,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1630 1104 34 64 BoxColFill
> +0.180 1621 1104 34 64 BoxColFill
>  LCb setrgbcolor
> -1630 1104 N
> +1621 1104 N
>  0 63 V
>  33 0 V
>  0 -63 V
> @@ -3910,20 +3925,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1677 1106 34 65 BoxColFill
> +0.180 1668 1106 33 65 BoxColFill
>  LCb setrgbcolor
> -1677 1106 N
> +1668 1106 N
>  0 64 V
> -33 0 V
> +32 0 V
>  0 -64 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1724 1111 34 65 BoxColFill
> +0.180 1714 1111 34 65 BoxColFill
>  LCb setrgbcolor
> -1724 1111 N
> +1714 1111 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -3932,20 +3947,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1771 1001 35 66 BoxColFill
> +0.180 1761 1001 34 66 BoxColFill
>  LCb setrgbcolor
> -1771 1001 N
> +1761 1001 N
>  0 65 V
> -34 0 V
> +33 0 V
>  0 -65 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1819 1040 34 68 BoxColFill
> +0.180 1808 1040 34 68 BoxColFill
>  LCb setrgbcolor
> -1819 1040 N
> +1808 1040 N
>  0 67 V
>  33 0 V
>  0 -67 V
> @@ -3954,9 +3969,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1866 1071 34 73 BoxColFill
> +0.180 1855 1071 34 73 BoxColFill
>  LCb setrgbcolor
> -1866 1071 N
> +1855 1071 N
>  0 72 V
>  33 0 V
>  0 -72 V
> @@ -3965,20 +3980,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1913 1083 34 73 BoxColFill
> +0.180 1902 1083 33 73 BoxColFill
>  LCb setrgbcolor
> -1913 1083 N
> +1902 1083 N
>  0 72 V
> -33 0 V
> +32 0 V
>  0 -72 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1961 1096 34 72 BoxColFill
> +0.180 1948 1096 34 72 BoxColFill
>  LCb setrgbcolor
> -1961 1096 N
> +1948 1096 N
>  0 71 V
>  33 0 V
>  0 -71 V
> @@ -3987,9 +4002,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2008 1137 34 73 BoxColFill
> +0.180 1995 1137 34 73 BoxColFill
>  LCb setrgbcolor
> -2008 1137 N
> +1995 1137 N
>  0 72 V
>  33 0 V
>  0 -72 V
> @@ -3998,9 +4013,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2055 1174 34 85 BoxColFill
> +0.180 2042 1174 34 85 BoxColFill
>  LCb setrgbcolor
> -2055 1174 N
> +2042 1174 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -4009,31 +4024,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2102 1175 35 85 BoxColFill
> +0.180 2089 1175 34 85 BoxColFill
>  LCb setrgbcolor
> -2102 1175 N
> +2089 1175 N
>  0 84 V
> -34 0 V
> +33 0 V
>  0 -84 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2150 1236 34 86 BoxColFill
> +0.180 2136 1236 33 86 BoxColFill
>  LCb setrgbcolor
> -2150 1236 N
> +2136 1236 N
>  0 85 V
> -33 0 V
> +32 0 V
>  0 -85 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2197 1236 34 86 BoxColFill
> +0.180 2182 1236 34 86 BoxColFill
>  LCb setrgbcolor
> -2197 1236 N
> +2182 1236 N
>  0 85 V
>  33 0 V
>  0 -85 V
> @@ -4042,9 +4057,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2244 1245 34 85 BoxColFill
> +0.180 2229 1245 34 85 BoxColFill
>  LCb setrgbcolor
> -2244 1245 N
> +2229 1245 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -4053,9 +4068,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2292 1273 34 95 BoxColFill
> +0.180 2276 1273 34 95 BoxColFill
>  LCb setrgbcolor
> -2292 1273 N
> +2276 1273 N
>  0 94 V
>  33 0 V
>  0 -94 V
> @@ -4064,9 +4079,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2339 1301 34 100 BoxColFill
> +0.180 2323 1301 34 100 BoxColFill
>  LCb setrgbcolor
> -2339 1301 N
> +2323 1301 N
>  0 99 V
>  33 0 V
>  0 -99 V
> @@ -4075,20 +4090,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2386 1333 34 112 BoxColFill
> +0.180 2370 1333 33 112 BoxColFill
>  LCb setrgbcolor
> -2386 1333 N
> +2370 1333 N
>  0 111 V
> -33 0 V
> +32 0 V
>  0 -111 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2433 1334 34 113 BoxColFill
> +0.180 2416 1334 34 113 BoxColFill
>  LCb setrgbcolor
> -2433 1334 N
> +2416 1334 N
>  0 112 V
>  33 0 V
>  0 -112 V
> @@ -4097,9 +4112,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2481 1336 34 114 BoxColFill
> +0.180 2463 1336 34 114 BoxColFill
>  LCb setrgbcolor
> -2481 1336 N
> +2463 1336 N
>  0 113 V
>  33 0 V
>  0 -113 V
> @@ -4108,9 +4123,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2528 1368 34 113 BoxColFill
> +0.180 2510 1368 34 113 BoxColFill
>  LCb setrgbcolor
> -2528 1368 N
> +2510 1368 N
>  0 112 V
>  33 0 V
>  0 -112 V
> @@ -4119,20 +4134,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2575 1378 34 116 BoxColFill
> +0.180 2557 1378 33 116 BoxColFill
>  LCb setrgbcolor
> -2575 1378 N
> +2557 1378 N
>  0 115 V
> -33 0 V
> +32 0 V
>  0 -115 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2623 1380 34 116 BoxColFill
> +0.180 2603 1380 34 116 BoxColFill
>  LCb setrgbcolor
> -2623 1380 N
> +2603 1380 N
>  0 115 V
>  33 0 V
>  0 -115 V
> @@ -4141,9 +4156,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2670 1324 34 114 BoxColFill
> +0.180 2650 1324 34 114 BoxColFill
>  LCb setrgbcolor
> -2670 1324 N
> +2650 1324 N
>  0 113 V
>  33 0 V
>  0 -113 V
> @@ -4152,9 +4167,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2717 1345 34 112 BoxColFill
> +0.180 2697 1345 34 112 BoxColFill
>  LCb setrgbcolor
> -2717 1345 N
> +2697 1345 N
>  0 111 V
>  33 0 V
>  0 -111 V
> @@ -4163,9 +4178,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2764 1356 34 112 BoxColFill
> +0.180 2744 1356 34 112 BoxColFill
>  LCb setrgbcolor
> -2764 1356 N
> +2744 1356 N
>  0 111 V
>  33 0 V
>  0 -111 V
> @@ -4174,20 +4189,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2812 1366 34 179 BoxColFill
> +0.180 2791 1366 33 179 BoxColFill
>  LCb setrgbcolor
> -2812 1366 N
> +2791 1366 N
>  0 178 V
> -33 0 V
> +32 0 V
>  0 -178 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2859 1370 34 202 BoxColFill
> +0.180 2837 1370 34 202 BoxColFill
>  LCb setrgbcolor
> -2859 1370 N
> +2837 1370 N
>  0 201 V
>  33 0 V
>  0 -201 V
> @@ -4196,9 +4211,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2906 1381 34 212 BoxColFill
> +0.180 2884 1381 34 212 BoxColFill
>  LCb setrgbcolor
> -2906 1381 N
> +2884 1381 N
>  0 211 V
>  33 0 V
>  0 -211 V
> @@ -4207,9 +4222,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2954 1393 34 213 BoxColFill
> +0.180 2931 1393 34 213 BoxColFill
>  LCb setrgbcolor
> -2954 1393 N
> +2931 1393 N
>  0 212 V
>  33 0 V
>  0 -212 V
> @@ -4218,9 +4233,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3001 1424 34 221 BoxColFill
> +0.180 2978 1424 34 221 BoxColFill
>  LCb setrgbcolor
> -3001 1424 N
> +2978 1424 N
>  0 220 V
>  33 0 V
>  0 -220 V
> @@ -4229,20 +4244,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3048 1431 34 220 BoxColFill
> +0.180 3025 1431 33 220 BoxColFill
>  LCb setrgbcolor
> -3048 1431 N
> +3025 1431 N
>  0 219 V
> -33 0 V
> +32 0 V
>  0 -219 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3095 1429 34 221 BoxColFill
> +0.180 3071 1429 34 221 BoxColFill
>  LCb setrgbcolor
> -3095 1429 N
> +3071 1429 N
>  0 220 V
>  33 0 V
>  0 -220 V
> @@ -4251,9 +4266,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3143 1441 34 224 BoxColFill
> +0.180 3118 1441 34 224 BoxColFill
>  LCb setrgbcolor
> -3143 1441 N
> +3118 1441 N
>  0 223 V
>  33 0 V
>  0 -223 V
> @@ -4262,9 +4277,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3190 1442 34 226 BoxColFill
> +0.180 3165 1442 34 226 BoxColFill
>  LCb setrgbcolor
> -3190 1442 N
> +3165 1442 N
>  0 225 V
>  33 0 V
>  0 -225 V
> @@ -4273,9 +4288,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3237 1450 34 227 BoxColFill
> +0.180 3212 1450 34 227 BoxColFill
>  LCb setrgbcolor
> -3237 1450 N
> +3212 1450 N
>  0 226 V
>  33 0 V
>  0 -226 V
> @@ -4284,20 +4299,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3285 1483 34 227 BoxColFill
> +0.180 3259 1483 33 227 BoxColFill
>  LCb setrgbcolor
> -3285 1483 N
> +3259 1483 N
>  0 226 V
> -33 0 V
> +32 0 V
>  0 -226 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3332 1491 34 230 BoxColFill
> +0.180 3305 1491 34 230 BoxColFill
>  LCb setrgbcolor
> -3332 1491 N
> +3305 1491 N
>  0 229 V
>  33 0 V
>  0 -229 V
> @@ -4306,9 +4321,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3379 1496 34 230 BoxColFill
> +0.180 3352 1496 34 230 BoxColFill
>  LCb setrgbcolor
> -3379 1496 N
> +3352 1496 N
>  0 229 V
>  33 0 V
>  0 -229 V
> @@ -4317,9 +4332,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3426 1504 34 285 BoxColFill
> +0.180 3399 1504 34 285 BoxColFill
>  LCb setrgbcolor
> -3426 1504 N
> +3399 1504 N
>  0 284 V
>  33 0 V
>  0 -284 V
> @@ -4328,9 +4343,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3474 1508 34 288 BoxColFill
> +0.180 3446 1508 34 288 BoxColFill
>  LCb setrgbcolor
> -3474 1508 N
> +3446 1508 N
>  0 287 V
>  33 0 V
>  0 -287 V
> @@ -4339,20 +4354,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3521 1512 34 287 BoxColFill
> +0.180 3493 1512 33 287 BoxColFill
>  LCb setrgbcolor
> -3521 1512 N
> +3493 1512 N
>  0 286 V
> -33 0 V
> +32 0 V
>  0 -286 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3568 1515 34 288 BoxColFill
> +0.180 3539 1515 34 288 BoxColFill
>  LCb setrgbcolor
> -3568 1515 N
> +3539 1515 N
>  0 287 V
>  33 0 V
>  0 -287 V
> @@ -4361,9 +4376,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3616 1526 34 289 BoxColFill
> +0.180 3586 1526 34 289 BoxColFill
>  LCb setrgbcolor
> -3616 1526 N
> +3586 1526 N
>  0 288 V
>  33 0 V
>  0 -288 V
> @@ -4372,9 +4387,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3663 1654 34 290 BoxColFill
> +0.180 3633 1654 34 290 BoxColFill
>  LCb setrgbcolor
> -3663 1654 N
> +3633 1654 N
>  0 289 V
>  33 0 V
>  0 -289 V
> @@ -4383,20 +4398,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3710 1553 34 294 BoxColFill
> +0.180 3680 1553 33 294 BoxColFill
>  LCb setrgbcolor
> -3710 1553 N
> +3680 1553 N
>  0 293 V
> -33 0 V
> +32 0 V
>  0 -293 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3757 1548 34 297 BoxColFill
> +0.180 3726 1548 34 297 BoxColFill
>  LCb setrgbcolor
> -3757 1548 N
> +3726 1548 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4405,9 +4420,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3805 1552 34 297 BoxColFill
> +0.180 3773 1552 34 297 BoxColFill
>  LCb setrgbcolor
> -3805 1552 N
> +3773 1552 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4416,9 +4431,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3852 1548 34 294 BoxColFill
> +0.180 3820 1548 34 294 BoxColFill
>  LCb setrgbcolor
> -3852 1548 N
> +3820 1548 N
>  0 293 V
>  33 0 V
>  0 -293 V
> @@ -4427,9 +4442,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3899 1547 34 297 BoxColFill
> +0.180 3867 1547 34 297 BoxColFill
>  LCb setrgbcolor
> -3899 1547 N
> +3867 1547 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4438,20 +4453,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3946 1546 35 299 BoxColFill
> +0.180 3914 1546 33 299 BoxColFill
>  LCb setrgbcolor
> -3946 1546 N
> +3914 1546 N
>  0 298 V
> -34 0 V
> +32 0 V
>  0 -298 V
> --34 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3994 1558 34 310 BoxColFill
> +0.180 3960 1558 34 310 BoxColFill
>  LCb setrgbcolor
> -3994 1558 N
> +3960 1558 N
>  0 309 V
>  33 0 V
>  0 -309 V
> @@ -4460,9 +4475,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4041 1534 34 315 BoxColFill
> +0.180 4007 1534 34 315 BoxColFill
>  LCb setrgbcolor
> -4041 1534 N
> +4007 1534 N
>  0 314 V
>  33 0 V
>  0 -314 V
> @@ -4471,9 +4486,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4088 1539 34 443 BoxColFill
> +0.180 4054 1539 34 443 BoxColFill
>  LCb setrgbcolor
> -4088 1539 N
> +4054 1539 N
>  0 442 V
>  33 0 V
>  0 -442 V
> @@ -4482,9 +4497,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4136 1517 34 329 BoxColFill
> +0.180 4101 1517 34 329 BoxColFill
>  LCb setrgbcolor
> -4136 1517 N
> +4101 1517 N
>  0 328 V
>  33 0 V
>  0 -328 V
> @@ -4493,20 +4508,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4183 1515 34 315 BoxColFill
> +0.180 4148 1515 33 315 BoxColFill
>  LCb setrgbcolor
> -4183 1515 N
> +4148 1515 N
>  0 314 V
> -33 0 V
> +32 0 V
>  0 -314 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4230 1521 34 322 BoxColFill
> +0.180 4194 1521 34 322 BoxColFill
>  LCb setrgbcolor
> -4230 1521 N
> +4194 1521 N
>  0 321 V
>  33 0 V
>  0 -321 V
> @@ -4515,20 +4530,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4277 1548 35 322 BoxColFill
> +0.180 4241 1548 34 322 BoxColFill
>  LCb setrgbcolor
> -4277 1548 N
> +4241 1548 N
>  0 321 V
> -34 0 V
> +33 0 V
>  0 -321 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4325 1551 34 323 BoxColFill
> +0.180 4288 1551 34 323 BoxColFill
>  LCb setrgbcolor
> -4325 1551 N
> +4288 1551 N
>  0 322 V
>  33 0 V
>  0 -322 V
> @@ -4537,9 +4552,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4372 1563 34 331 BoxColFill
> +0.180 4335 1563 34 331 BoxColFill
>  LCb setrgbcolor
> -4372 1563 N
> +4335 1563 N
>  0 330 V
>  33 0 V
>  0 -330 V
> @@ -4548,20 +4563,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4419 1579 34 335 BoxColFill
> +0.180 4382 1579 33 335 BoxColFill
>  LCb setrgbcolor
> -4419 1579 N
> +4382 1579 N
>  0 334 V
> -33 0 V
> +32 0 V
>  0 -334 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4467 1651 34 344 BoxColFill
> +0.180 4428 1651 34 344 BoxColFill
>  LCb setrgbcolor
> -4467 1651 N
> +4428 1651 N
>  0 343 V
>  33 0 V
>  0 -343 V
> @@ -4570,9 +4585,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4514 1663 34 404 BoxColFill
> +0.180 4475 1663 34 404 BoxColFill
>  LCb setrgbcolor
> -4514 1663 N
> +4475 1663 N
>  0 403 V
>  33 0 V
>  0 -403 V
> @@ -4581,9 +4596,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4561 1672 34 411 BoxColFill
> +0.180 4522 1672 34 411 BoxColFill
>  LCb setrgbcolor
> -4561 1672 N
> +4522 1672 N
>  0 410 V
>  33 0 V
>  0 -410 V
> @@ -4592,31 +4607,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4608 1677 35 417 BoxColFill
> +0.180 4569 1677 34 417 BoxColFill
>  LCb setrgbcolor
> -4608 1677 N
> +4569 1677 N
>  0 416 V
> -34 0 V
> +33 0 V
>  0 -416 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4656 1729 34 468 BoxColFill
> +0.180 4616 1729 33 468 BoxColFill
>  LCb setrgbcolor
> -4656 1729 N
> +4616 1729 N
>  0 467 V
> -33 0 V
> +32 0 V
>  0 -467 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4703 1741 34 496 BoxColFill
> +0.180 4662 1741 34 496 BoxColFill
>  LCb setrgbcolor
> -4703 1741 N
> +4662 1741 N
>  0 495 V
>  33 0 V
>  0 -495 V
> @@ -4625,9 +4640,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4750 1749 34 518 BoxColFill
> +0.180 4709 1749 34 518 BoxColFill
>  LCb setrgbcolor
> -4750 1749 N
> +4709 1749 N
>  0 517 V
>  33 0 V
>  0 -517 V
> @@ -4636,9 +4651,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4798 1749 34 536 BoxColFill
> +0.180 4756 1749 34 536 BoxColFill
>  LCb setrgbcolor
> -4798 1749 N
> +4756 1749 N
>  0 535 V
>  33 0 V
>  0 -535 V
> @@ -4647,20 +4662,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4845 1749 34 537 BoxColFill
> +0.180 4803 1749 33 537 BoxColFill
>  LCb setrgbcolor
> -4845 1749 N
> +4803 1749 N
>  0 536 V
> -33 0 V
> +32 0 V
>  0 -536 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4892 1761 34 544 BoxColFill
> +0.180 4849 1761 34 544 BoxColFill
>  LCb setrgbcolor
> -4892 1761 N
> +4849 1761 N
>  0 543 V
>  33 0 V
>  0 -543 V
> @@ -4669,20 +4684,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4939 1767 35 546 BoxColFill
> +0.180 4896 1767 34 546 BoxColFill
>  LCb setrgbcolor
> -4939 1767 N
> +4896 1767 N
>  0 545 V
> -34 0 V
> +33 0 V
>  0 -545 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4987 1799 34 553 BoxColFill
> +0.180 4943 1799 34 553 BoxColFill
>  LCb setrgbcolor
> -4987 1799 N
> +4943 1799 N
>  0 552 V
>  33 0 V
>  0 -552 V
> @@ -4691,9 +4706,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5034 1801 34 556 BoxColFill
> +0.180 4990 1801 34 556 BoxColFill
>  LCb setrgbcolor
> -5034 1801 N
> +4990 1801 N
>  0 555 V
>  33 0 V
>  0 -555 V
> @@ -4702,20 +4717,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5081 1821 34 566 BoxColFill
> +0.180 5037 1821 33 566 BoxColFill
>  LCb setrgbcolor
> -5081 1821 N
> +5037 1821 N
>  0 565 V
> -33 0 V
> +32 0 V
>  0 -565 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5129 1840 34 581 BoxColFill
> +0.180 5083 1840 34 581 BoxColFill
>  LCb setrgbcolor
> -5129 1840 N
> +5083 1840 N
>  0 580 V
>  33 0 V
>  0 -580 V
> @@ -4724,9 +4739,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5176 1860 34 594 BoxColFill
> +0.180 5130 1860 34 594 BoxColFill
>  LCb setrgbcolor
> -5176 1860 N
> +5130 1860 N
>  0 593 V
>  33 0 V
>  0 -593 V
> @@ -4735,9 +4750,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5223 1878 34 609 BoxColFill
> +0.180 5177 1878 34 609 BoxColFill
>  LCb setrgbcolor
> -5223 1878 N
> +5177 1878 N
> +0 608 V
> +33 0 V
> +0 -608 V
> +-33 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 5224 1883 34 609 BoxColFill
> +LCb setrgbcolor
> +5224 1883 N
>  0 608 V
>  33 0 V
>  0 -608 V
> @@ -4762,99 +4788,100 @@ LTb
>  3153 2217 M
>  351 0 V
>  842 768 M
> -48 0 V
>  47 0 V
> +46 0 V
>  47 1167 V
>  47 290 V
> -48 -7 V
> +47 -7 V
>  47 130 V
> -47 44 V
> -48 3 V
> +46 44 V
> +47 3 V
>  47 0 V
>  47 -7 V
>  47 0 V
> -48 -25 V
> +46 -25 V
>  47 -725 V
>  47 3 V
> -48 -58 V
> -47 -29 V
> +47 -58 V
> +46 -29 V
>  47 -210 V
>  47 0 V
> -48 -7 V
> +47 -7 V
>  47 225 V
> -47 -76 V
> -48 -26 V
> +46 -76 V
> +47 -26 V
>  47 -22 V
>  47 -21 V
>  47 -58 V
> -48 36 V
> +46 36 V
>  47 -4 V
>  47 -69 V
> -48 0 V
> +47 0 V
>  47 -10 V
> -47 29 V
> +46 29 V
>  47 -4 V
> -48 25 V
> +47 25 V
>  47 4 V
>  47 7 V
> -48 -32 V
> +46 -32 V
>  47 0 V
>  47 0 V
>  47 39 V
> -48 -29 V
> +46 -29 V
>  47 -7 V
>  47 254 V
> -48 76 V
> +47 76 V
>  47 22 V
> -47 -11 V
> +46 -11 V
>  47 -7 V
> -48 -11 V
> +47 -11 V
>  47 11 V
>  47 -11 V
> -47 7 V
> -48 -4 V
> +46 7 V
> +47 -4 V
>  47 -32 V
>  47 0 V
> -48 -4 V
> -47 141 V
> +47 -4 V
> +46 141 V
>  47 8 V
>  47 -8 V
> -48 -3 V
> +47 -3 V
>  47 -7 V
> -47 -105 V
> -48 94 V
> +46 -105 V
> +47 94 V
>  47 11 V
>  47 -4 V
> -47 0 V
> -48 4 V
> +46 0 V
> +47 4 V
>  47 7 V
>  47 14 V
> -48 33 V
> -47 268 V
> +47 33 V
> +46 268 V
>  47 -214 V
>  47 -32 V
> -48 7 V
> +47 7 V
>  47 -22 V
> -47 -3 V
> -48 7 V
> +46 -3 V
> +47 7 V
>  47 -4 V
>  47 -43 V
>  47 108 V
> -48 8 V
> +46 8 V
>  47 7 V
>  47 47 V
> -48 36 V
> -47 29 V
> +47 36 V
>  47 29 V
> +46 29 V
>  47 4 V
> -48 -4 V
> +47 -4 V
> +47 0 V
> +46 -14 V
>  47 0 V
> -47 -14 V
> -48 0 V
>  47 0 V
>  47 7 V
>  47 4 V
> -48 7 V
> +46 7 V
> +47 -4 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index 8b4feec7df51..d3b02680b994 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -92,3 +92,4 @@ v6.0  19954 10716 30670 34.9
>  ""    20699 11212 31911 35.1
>  ""    21087 11457 32544 35.2
>  v6.4  21444 11748 33192 35.4
> +""    21530 11753 33283 35.3
> 
> base-commit: d62de8c1c711ec7eb77de40e99a37d7bb0784bb2
> -- 
> 2.25.1
> 
