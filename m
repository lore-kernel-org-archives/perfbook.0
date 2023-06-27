Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjF0PAN (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 27 Jun 2023 11:00:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02390185
        for <perfbook@vger.kernel.org>; Tue, 27 Jun 2023 08:00:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70EBC611B4
        for <perfbook@vger.kernel.org>; Tue, 27 Jun 2023 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687878006;
        bh=Gpt8B1gj1waIowaW0ew4Lfc6thIPKpqCOC4EvH3Avt0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZYWs/eZNuEMd/sIuh368VhdB4dWx2ZVfuQmTydZCMpouIMTtOrACCqWWU0bCEPx5t
         8pTApUYNkT18rLAgIKjsKrHI7A+2kxa6xh0dkZoRnjIQj6KgNQdjsYIPS5goXZ6RpQ
         PSZTy9BdzEtaChWN1wGYxorxSPUiT5ewL5MgSW9Dmjqt4zHcQThtDcKXXkg5u8D+kN
         4FS3YAJqM1d3U9FBLIimX1WZHnvVqyjmGWwQHMESK928bMSoON6NOORAd/kuN1IXm/
         T6q8jKcHHBWgqi06KfFexTGrSanBCVce7Az7BIPeyrTL49cEaKTkATrcOsEHUTTsrt
         lvfby93E0RhJw==
Date: Tue, 27 Jun 2023 08:00:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Update plot of RCU-test-ratio as of v6.4
Message-ID: <c2b8a76e-ccc7-4fd3-8981-b8b4e75276b5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <51b88a66-c9b1-03d3-5454-b13575a731e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b88a66-c9b1-03d3-5454-b13575a731e1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 27, 2023 at 07:16:25PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/RCU-test-ratio.eps | 1483 ++++++++++----------
>  CodeSamples/formal/data/rcu-test.dat       |    3 +-
>  2 files changed, 757 insertions(+), 729 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index fb2828e36c5f..d2c802173b14 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
>  %%Creator: gnuplot 5.2 patchlevel 8
> -%%CreationDate: Wed May  3 17:12:30 2023
> +%%CreationDate: Tue Jun 27 19:02:14 2023
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 654 320
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.2 patchlevel 8)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Wed May  3 17:12:30 2023)
> +  /CreationDate (Tue Jun 27 19:02:14 2023)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1998,9 +1998,9 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -843 768 M
> +842 768 M
>  stroke
> -843 696 M
> +842 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.12)]
>  ] -40.0 MRshow
> @@ -2009,21 +2009,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -891 768 M
> +890 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -938 768 M
> +937 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -986 768 M
> +984 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1034 768 M
> +1031 768 M
>  stroke
> -1034 696 M
> +1031 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.16)]
>  ] -40.0 MRshow
> @@ -2032,21 +2032,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1082 768 M
> +1079 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1130 768 M
> +1126 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1177 768 M
> +1173 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1225 768 M
> +1221 768 M
>  stroke
> -1225 696 M
> +1221 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.20)]
>  ] -40.0 MRshow
> @@ -2055,21 +2055,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1273 768 M
> +1268 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1321 768 M
> +1315 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1368 768 M
> +1362 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1416 768 M
> +1410 768 M
>  stroke
> -1416 696 M
> +1410 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.24)]
>  ] -40.0 MRshow
> @@ -2078,21 +2078,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1464 768 M
> +1457 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1512 768 M
> +1504 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1560 768 M
> +1552 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1607 768 M
> +1599 768 M
>  stroke
> -1607 696 M
> +1599 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.28)]
>  ] -40.0 MRshow
> @@ -2101,21 +2101,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1655 768 M
> +1646 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1703 768 M
> +1693 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1751 768 M
> +1741 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1799 768 M
> +1788 768 M
>  stroke
> -1799 696 M
> +1788 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.32)]
>  ] -40.0 MRshow
> @@ -2124,21 +2124,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1846 768 M
> +1835 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1894 768 M
> +1883 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1942 768 M
> +1930 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1990 768 M
> +1977 768 M
>  stroke
> -1990 696 M
> +1977 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.36)]
>  ] -40.0 MRshow
> @@ -2147,21 +2147,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2037 768 M
> +2024 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2085 768 M
> +2072 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2133 768 M
> +2119 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2181 768 M
> +2166 768 M
>  stroke
> -2181 696 M
> +2166 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.0)]
>  ] -40.0 MRshow
> @@ -2170,21 +2170,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2229 768 M
> +2214 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2276 768 M
> +2261 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2324 768 M
> +2308 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2372 768 M
> +2355 768 M
>  stroke
> -2372 696 M
> +2355 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.4)]
>  ] -40.0 MRshow
> @@ -2193,21 +2193,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2420 768 M
> +2403 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2468 768 M
> +2450 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2515 768 M
> +2497 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2563 768 M
> +2545 768 M
>  stroke
> -2563 696 M
> +2545 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.8)]
>  ] -40.0 MRshow
> @@ -2216,21 +2216,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2611 768 M
> +2592 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2659 768 M
> +2639 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2706 768 M
> +2686 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2754 768 M
> +2734 768 M
>  stroke
> -2754 696 M
> +2734 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.12)]
>  ] -40.0 MRshow
> @@ -2239,21 +2239,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2802 768 M
> +2781 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2850 768 M
> +2828 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2898 768 M
> +2876 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2945 768 M
> +2923 768 M
>  stroke
> -2945 696 M
> +2923 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.16)]
>  ] -40.0 MRshow
> @@ -2262,21 +2262,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2993 768 M
> +2970 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3041 768 M
> +3017 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3089 768 M
> +3065 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3137 768 M
> +3112 768 M
>  stroke
> -3137 696 M
> +3112 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.0)]
>  ] -40.0 MRshow
> @@ -2285,21 +2285,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3184 768 M
> +3159 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3232 768 M
> +3206 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3280 768 M
> +3254 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3328 768 M
> +3301 768 M
>  stroke
> -3328 696 M
> +3301 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.4)]
>  ] -40.0 MRshow
> @@ -2308,21 +2308,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3376 768 M
> +3348 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3423 768 M
> +3396 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3471 768 M
> +3443 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3519 768 M
> +3490 768 M
>  stroke
> -3519 696 M
> +3490 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.8)]
>  ] -40.0 MRshow
> @@ -2331,21 +2331,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3567 768 M
> +3537 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3614 768 M
> +3585 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3662 768 M
> +3632 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3710 768 M
> +3679 768 M
>  stroke
> -3710 696 M
> +3679 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.12)]
>  ] -40.0 MRshow
> @@ -2354,21 +2354,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3758 768 M
> +3727 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3806 768 M
> +3774 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3853 768 M
> +3821 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3901 768 M
> +3868 768 M
>  stroke
> -3901 696 M
> +3868 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.16)]
>  ] -40.0 MRshow
> @@ -2377,25 +2377,25 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3949 768 M
> +3916 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3997 768 M
> +3963 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4045 768 M
> +4010 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4092 768 M
> +4058 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4140 768 M
> +4105 768 M
>  stroke
> -4140 696 M
> +4105 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.0)]
>  ] -40.0 MRshow
> @@ -2404,21 +2404,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4188 768 M
> +4152 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4236 768 M
> +4199 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4283 768 M
> +4247 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4331 768 M
> +4294 768 M
>  stroke
> -4331 696 M
> +4294 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.4)]
>  ] -40.0 MRshow
> @@ -2427,21 +2427,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4379 768 M
> +4341 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4427 768 M
> +4389 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4475 768 M
> +4436 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4522 768 M
> +4483 768 M
>  stroke
> -4522 696 M
> +4483 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.8)]
>  ] -40.0 MRshow
> @@ -2450,21 +2450,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4570 768 M
> +4530 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4618 768 M
> +4578 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4666 768 M
> +4625 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4714 768 M
> +4672 768 M
>  stroke
> -4714 696 M
> +4672 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.12)]
>  ] -40.0 MRshow
> @@ -2473,21 +2473,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4761 768 M
> +4720 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4809 768 M
> +4767 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4857 768 M
> +4814 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4905 768 M
> +4861 768 M
>  stroke
> -4905 696 M
> +4861 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.16)]
>  ] -40.0 MRshow
> @@ -2496,21 +2496,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4952 768 M
> +4909 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5000 768 M
> +4956 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5048 768 M
> +5003 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5096 768 M
> +5051 768 M
>  stroke
> -5096 696 M
> +5051 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.0)]
>  ] -40.0 MRshow
> @@ -2519,19 +2519,23 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -5144 768 M
> +5098 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5191 768 M
> +5145 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5239 768 M
> +5192 768 M
>  stroke
> -5239 696 M
> +LTb
> +LCb setrgbcolor
> +5240 768 M
> +stroke
> +5240 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
> -[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.3)]
> +[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.4)]
>  ] -40.0 MRshow
>  grestore
>  /NimbusSanL-Regu findfont 120 scalefont setfont
> @@ -2656,20 +2660,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 826 768 35 41 BoxColFill
> +0.180 826 768 34 41 BoxColFill
>  LCb setrgbcolor
>  826 768 N
>  0 40 V
> -34 0 V
> +33 0 V
>  0 -40 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 874 768 34 41 BoxColFill
> +0.180 873 768 34 41 BoxColFill
>  LCb setrgbcolor
> -874 768 N
> +873 768 N
>  0 40 V
>  33 0 V
>  0 -40 V
> @@ -2678,9 +2682,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 922 768 34 54 BoxColFill
> +0.180 920 768 34 54 BoxColFill
>  LCb setrgbcolor
> -922 768 N
> +920 768 N
>  0 53 V
>  33 0 V
>  0 -53 V
> @@ -2689,31 +2693,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 969 768 35 57 BoxColFill
> +0.180 968 768 34 57 BoxColFill
>  LCb setrgbcolor
> -969 768 N
> +968 768 N
>  0 56 V
> -34 0 V
> +33 0 V
>  0 -56 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1017 768 35 47 BoxColFill
> +0.180 1015 768 34 47 BoxColFill
>  LCb setrgbcolor
> -1017 768 N
> +1015 768 N
>  0 46 V
> -34 0 V
> +33 0 V
>  0 -46 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1065 768 34 48 BoxColFill
> +0.180 1062 768 34 48 BoxColFill
>  LCb setrgbcolor
> -1065 768 N
> +1062 768 N
>  0 47 V
>  33 0 V
>  0 -47 V
> @@ -2722,20 +2726,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1113 768 34 49 BoxColFill
> +0.180 1109 768 35 49 BoxColFill
>  LCb setrgbcolor
> -1113 768 N
> +1109 768 N
>  0 48 V
> -33 0 V
> +34 0 V
>  0 -48 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1161 768 34 65 BoxColFill
> +0.180 1157 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1161 768 N
> +1157 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2744,31 +2748,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1208 768 35 65 BoxColFill
> +0.180 1204 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1208 768 N
> +1204 768 N
>  0 64 V
> -34 0 V
> +33 0 V
>  0 -64 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1256 768 35 65 BoxColFill
> +0.180 1251 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1256 768 N
> +1251 768 N
>  0 64 V
> -34 0 V
> +33 0 V
>  0 -64 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1304 768 34 65 BoxColFill
> +0.180 1299 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1304 768 N
> +1299 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2777,9 +2781,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1352 768 34 65 BoxColFill
> +0.180 1346 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1352 768 N
> +1346 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2788,9 +2792,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1400 768 34 67 BoxColFill
> +0.180 1393 768 34 67 BoxColFill
>  LCb setrgbcolor
> -1400 768 N
> +1393 768 N
>  0 66 V
>  33 0 V
>  0 -66 V
> @@ -2799,9 +2803,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1447 768 35 164 BoxColFill
> +0.180 1440 768 35 164 BoxColFill
>  LCb setrgbcolor
> -1447 768 N
> +1440 768 N
>  0 163 V
>  34 0 V
>  0 -163 V
> @@ -2810,20 +2814,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1495 768 35 164 BoxColFill
> +0.180 1488 768 34 164 BoxColFill
>  LCb setrgbcolor
> -1495 768 N
> +1488 768 N
>  0 163 V
> -34 0 V
> +33 0 V
>  0 -163 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1543 768 34 207 BoxColFill
> +0.180 1535 768 34 207 BoxColFill
>  LCb setrgbcolor
> -1543 768 N
> +1535 768 N
>  0 206 V
>  33 0 V
>  0 -206 V
> @@ -2832,9 +2836,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1591 768 34 217 BoxColFill
> +0.180 1582 768 34 217 BoxColFill
>  LCb setrgbcolor
> -1591 768 N
> +1582 768 N
>  0 216 V
>  33 0 V
>  0 -216 V
> @@ -2843,31 +2847,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1638 768 35 337 BoxColFill
> +0.180 1630 768 34 337 BoxColFill
>  LCb setrgbcolor
> -1638 768 N
> +1630 768 N
>  0 336 V
> -34 0 V
> +33 0 V
>  0 -336 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1686 768 35 339 BoxColFill
> +0.180 1677 768 34 339 BoxColFill
>  LCb setrgbcolor
> -1686 768 N
> +1677 768 N
>  0 338 V
> -34 0 V
> +33 0 V
>  0 -338 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1734 768 34 344 BoxColFill
> +0.180 1724 768 34 344 BoxColFill
>  LCb setrgbcolor
> -1734 768 N
> +1724 768 N
>  0 343 V
>  33 0 V
>  0 -343 V
> @@ -2876,20 +2880,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1782 768 34 234 BoxColFill
> +0.180 1771 768 35 234 BoxColFill
>  LCb setrgbcolor
> -1782 768 N
> +1771 768 N
>  0 233 V
> -33 0 V
> +34 0 V
>  0 -233 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1830 768 34 273 BoxColFill
> +0.180 1819 768 34 273 BoxColFill
>  LCb setrgbcolor
> -1830 768 N
> +1819 768 N
>  0 272 V
>  33 0 V
>  0 -272 V
> @@ -2898,31 +2902,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1877 768 35 304 BoxColFill
> +0.180 1866 768 34 304 BoxColFill
>  LCb setrgbcolor
> -1877 768 N
> +1866 768 N
>  0 303 V
> -34 0 V
> +33 0 V
>  0 -303 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1925 768 35 316 BoxColFill
> +0.180 1913 768 34 316 BoxColFill
>  LCb setrgbcolor
> -1925 768 N
> +1913 768 N
>  0 315 V
> -34 0 V
> +33 0 V
>  0 -315 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1973 768 34 329 BoxColFill
> +0.180 1961 768 34 329 BoxColFill
>  LCb setrgbcolor
> -1973 768 N
> +1961 768 N
>  0 328 V
>  33 0 V
>  0 -328 V
> @@ -2931,9 +2935,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2021 768 34 370 BoxColFill
> +0.180 2008 768 34 370 BoxColFill
>  LCb setrgbcolor
> -2021 768 N
> +2008 768 N
>  0 369 V
>  33 0 V
>  0 -369 V
> @@ -2942,9 +2946,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2069 768 34 407 BoxColFill
> +0.180 2055 768 34 407 BoxColFill
>  LCb setrgbcolor
> -2069 768 N
> +2055 768 N
>  0 406 V
>  33 0 V
>  0 -406 V
> @@ -2953,9 +2957,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2116 768 35 408 BoxColFill
> +0.180 2102 768 35 408 BoxColFill
>  LCb setrgbcolor
> -2116 768 N
> +2102 768 N
>  0 407 V
>  34 0 V
>  0 -407 V
> @@ -2964,20 +2968,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2164 768 35 469 BoxColFill
> +0.180 2150 768 34 469 BoxColFill
>  LCb setrgbcolor
> -2164 768 N
> +2150 768 N
>  0 468 V
> -34 0 V
> +33 0 V
>  0 -468 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2212 768 34 469 BoxColFill
> +0.180 2197 768 34 469 BoxColFill
>  LCb setrgbcolor
> -2212 768 N
> +2197 768 N
>  0 468 V
>  33 0 V
>  0 -468 V
> @@ -2986,9 +2990,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2260 768 34 478 BoxColFill
> +0.180 2244 768 34 478 BoxColFill
>  LCb setrgbcolor
> -2260 768 N
> +2244 768 N
>  0 477 V
>  33 0 V
>  0 -477 V
> @@ -2997,31 +3001,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2307 768 35 506 BoxColFill
> +0.180 2292 768 34 506 BoxColFill
>  LCb setrgbcolor
> -2307 768 N
> +2292 768 N
>  0 505 V
> -34 0 V
> +33 0 V
>  0 -505 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2355 768 35 534 BoxColFill
> +0.180 2339 768 34 534 BoxColFill
>  LCb setrgbcolor
> -2355 768 N
> +2339 768 N
>  0 533 V
> -34 0 V
> +33 0 V
>  0 -533 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2403 768 34 566 BoxColFill
> +0.180 2386 768 34 566 BoxColFill
>  LCb setrgbcolor
> -2403 768 N
> +2386 768 N
>  0 565 V
>  33 0 V
>  0 -565 V
> @@ -3030,9 +3034,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2451 768 34 567 BoxColFill
> +0.180 2433 768 34 567 BoxColFill
>  LCb setrgbcolor
> -2451 768 N
> +2433 768 N
>  0 566 V
>  33 0 V
>  0 -566 V
> @@ -3041,9 +3045,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2499 768 34 569 BoxColFill
> +0.180 2481 768 34 569 BoxColFill
>  LCb setrgbcolor
> -2499 768 N
> +2481 768 N
>  0 568 V
>  33 0 V
>  0 -568 V
> @@ -3052,31 +3056,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2546 768 35 601 BoxColFill
> +0.180 2528 768 34 601 BoxColFill
>  LCb setrgbcolor
> -2546 768 N
> +2528 768 N
>  0 600 V
> -34 0 V
> +33 0 V
>  0 -600 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2594 768 35 611 BoxColFill
> +0.180 2575 768 34 611 BoxColFill
>  LCb setrgbcolor
> -2594 768 N
> +2575 768 N
>  0 610 V
> -34 0 V
> +33 0 V
>  0 -610 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2642 768 34 613 BoxColFill
> +0.180 2623 768 34 613 BoxColFill
>  LCb setrgbcolor
> -2642 768 N
> +2623 768 N
>  0 612 V
>  33 0 V
>  0 -612 V
> @@ -3085,9 +3089,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2690 768 34 557 BoxColFill
> +0.180 2670 768 34 557 BoxColFill
>  LCb setrgbcolor
> -2690 768 N
> +2670 768 N
>  0 556 V
>  33 0 V
>  0 -556 V
> @@ -3096,9 +3100,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2738 768 34 578 BoxColFill
> +0.180 2717 768 34 578 BoxColFill
>  LCb setrgbcolor
> -2738 768 N
> +2717 768 N
>  0 577 V
>  33 0 V
>  0 -577 V
> @@ -3107,31 +3111,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2785 768 35 589 BoxColFill
> +0.180 2764 768 34 589 BoxColFill
>  LCb setrgbcolor
> -2785 768 N
> +2764 768 N
>  0 588 V
> -34 0 V
> +33 0 V
>  0 -588 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2833 768 35 599 BoxColFill
> +0.180 2812 768 34 599 BoxColFill
>  LCb setrgbcolor
> -2833 768 N
> +2812 768 N
>  0 598 V
> -34 0 V
> +33 0 V
>  0 -598 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2881 768 34 603 BoxColFill
> +0.180 2859 768 34 603 BoxColFill
>  LCb setrgbcolor
> -2881 768 N
> +2859 768 N
>  0 602 V
>  33 0 V
>  0 -602 V
> @@ -3140,9 +3144,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2929 768 34 614 BoxColFill
> +0.180 2906 768 34 614 BoxColFill
>  LCb setrgbcolor
> -2929 768 N
> +2906 768 N
>  0 613 V
>  33 0 V
>  0 -613 V
> @@ -3151,42 +3155,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2976 768 35 626 BoxColFill
> +0.180 2954 768 34 626 BoxColFill
>  LCb setrgbcolor
> -2976 768 N
> +2954 768 N
>  0 625 V
> -34 0 V
> +33 0 V
>  0 -625 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3024 768 35 657 BoxColFill
> +0.180 3001 768 34 657 BoxColFill
>  LCb setrgbcolor
> -3024 768 N
> +3001 768 N
>  0 656 V
> -34 0 V
> +33 0 V
>  0 -656 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3072 768 35 664 BoxColFill
> +0.180 3048 768 34 664 BoxColFill
>  LCb setrgbcolor
> -3072 768 N
> +3048 768 N
>  0 663 V
> -34 0 V
> +33 0 V
>  0 -663 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3120 768 34 662 BoxColFill
> +0.180 3095 768 34 662 BoxColFill
>  LCb setrgbcolor
> -3120 768 N
> +3095 768 N
>  0 661 V
>  33 0 V
>  0 -661 V
> @@ -3195,9 +3199,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3168 768 34 674 BoxColFill
> +0.180 3143 768 34 674 BoxColFill
>  LCb setrgbcolor
> -3168 768 N
> +3143 768 N
>  0 673 V
>  33 0 V
>  0 -673 V
> @@ -3206,31 +3210,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3215 768 35 675 BoxColFill
> +0.180 3190 768 34 675 BoxColFill
>  LCb setrgbcolor
> -3215 768 N
> +3190 768 N
>  0 674 V
> -34 0 V
> +33 0 V
>  0 -674 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3263 768 35 683 BoxColFill
> +0.180 3237 768 34 683 BoxColFill
>  LCb setrgbcolor
> -3263 768 N
> +3237 768 N
>  0 682 V
> -34 0 V
> +33 0 V
>  0 -682 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3311 768 34 716 BoxColFill
> +0.180 3285 768 34 716 BoxColFill
>  LCb setrgbcolor
> -3311 768 N
> +3285 768 N
>  0 715 V
>  33 0 V
>  0 -715 V
> @@ -3239,9 +3243,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3359 768 34 724 BoxColFill
> +0.180 3332 768 34 724 BoxColFill
>  LCb setrgbcolor
> -3359 768 N
> +3332 768 N
>  0 723 V
>  33 0 V
>  0 -723 V
> @@ -3250,9 +3254,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3407 768 34 729 BoxColFill
> +0.180 3379 768 34 729 BoxColFill
>  LCb setrgbcolor
> -3407 768 N
> +3379 768 N
>  0 728 V
>  33 0 V
>  0 -728 V
> @@ -3261,31 +3265,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3454 768 35 737 BoxColFill
> +0.180 3426 768 34 737 BoxColFill
>  LCb setrgbcolor
> -3454 768 N
> +3426 768 N
>  0 736 V
> -34 0 V
> +33 0 V
>  0 -736 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3502 768 35 741 BoxColFill
> +0.180 3474 768 34 741 BoxColFill
>  LCb setrgbcolor
> -3502 768 N
> +3474 768 N
>  0 740 V
> -34 0 V
> +33 0 V
>  0 -740 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3550 768 34 745 BoxColFill
> +0.180 3521 768 34 745 BoxColFill
>  LCb setrgbcolor
> -3550 768 N
> +3521 768 N
>  0 744 V
>  33 0 V
>  0 -744 V
> @@ -3294,9 +3298,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3598 768 34 748 BoxColFill
> +0.180 3568 768 34 748 BoxColFill
>  LCb setrgbcolor
> -3598 768 N
> +3568 768 N
>  0 747 V
>  33 0 V
>  0 -747 V
> @@ -3305,9 +3309,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3646 768 34 759 BoxColFill
> +0.180 3616 768 34 759 BoxColFill
>  LCb setrgbcolor
> -3646 768 N
> +3616 768 N
>  0 758 V
>  33 0 V
>  0 -758 V
> @@ -3316,31 +3320,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3693 768 35 887 BoxColFill
> +0.180 3663 768 34 887 BoxColFill
>  LCb setrgbcolor
> -3693 768 N
> +3663 768 N
>  0 886 V
> -34 0 V
> +33 0 V
>  0 -886 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3741 768 35 786 BoxColFill
> +0.180 3710 768 34 786 BoxColFill
>  LCb setrgbcolor
> -3741 768 N
> +3710 768 N
>  0 785 V
> -34 0 V
> +33 0 V
>  0 -785 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3789 768 34 781 BoxColFill
> +0.180 3757 768 34 781 BoxColFill
>  LCb setrgbcolor
> -3789 768 N
> +3757 768 N
>  0 780 V
>  33 0 V
>  0 -780 V
> @@ -3349,9 +3353,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3837 768 34 785 BoxColFill
> +0.180 3805 768 34 785 BoxColFill
>  LCb setrgbcolor
> -3837 768 N
> +3805 768 N
>  0 784 V
>  33 0 V
>  0 -784 V
> @@ -3360,42 +3364,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3884 768 35 781 BoxColFill
> +0.180 3852 768 34 781 BoxColFill
>  LCb setrgbcolor
> -3884 768 N
> +3852 768 N
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
> -0.180 3932 768 35 780 BoxColFill
> +0.180 3899 768 34 780 BoxColFill
>  LCb setrgbcolor
> -3932 768 N
> +3899 768 N
>  0 779 V
> -34 0 V
> +33 0 V
>  0 -779 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3980 768 34 779 BoxColFill
> +0.180 3946 768 35 779 BoxColFill
>  LCb setrgbcolor
> -3980 768 N
> +3946 768 N
>  0 778 V
> -33 0 V
> +34 0 V
>  0 -778 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4028 768 34 791 BoxColFill
> +0.180 3994 768 34 791 BoxColFill
>  LCb setrgbcolor
> -4028 768 N
> +3994 768 N
>  0 790 V
>  33 0 V
>  0 -790 V
> @@ -3404,9 +3408,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4076 768 34 767 BoxColFill
> +0.180 4041 768 34 767 BoxColFill
>  LCb setrgbcolor
> -4076 768 N
> +4041 768 N
>  0 766 V
>  33 0 V
>  0 -766 V
> @@ -3415,31 +3419,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4123 768 35 772 BoxColFill
> +0.180 4088 768 34 772 BoxColFill
>  LCb setrgbcolor
> -4123 768 N
> +4088 768 N
>  0 771 V
> -34 0 V
> +33 0 V
>  0 -771 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4171 768 35 750 BoxColFill
> +0.180 4136 768 34 750 BoxColFill
>  LCb setrgbcolor
> -4171 768 N
> +4136 768 N
>  0 749 V
> -34 0 V
> +33 0 V
>  0 -749 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4219 768 34 748 BoxColFill
> +0.180 4183 768 34 748 BoxColFill
>  LCb setrgbcolor
> -4219 768 N
> +4183 768 N
>  0 747 V
>  33 0 V
>  0 -747 V
> @@ -3448,9 +3452,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4267 768 34 754 BoxColFill
> +0.180 4230 768 34 754 BoxColFill
>  LCb setrgbcolor
> -4267 768 N
> +4230 768 N
>  0 753 V
>  33 0 V
>  0 -753 V
> @@ -3459,42 +3463,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4315 768 34 781 BoxColFill
> +0.180 4277 768 35 781 BoxColFill
>  LCb setrgbcolor
> -4315 768 N
> +4277 768 N
>  0 780 V
> -33 0 V
> +34 0 V
>  0 -780 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4362 768 35 784 BoxColFill
> +0.180 4325 768 34 784 BoxColFill
>  LCb setrgbcolor
> -4362 768 N
> +4325 768 N
>  0 783 V
> -34 0 V
> +33 0 V
>  0 -783 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4410 768 35 796 BoxColFill
> +0.180 4372 768 34 796 BoxColFill
>  LCb setrgbcolor
> -4410 768 N
> +4372 768 N
>  0 795 V
> -34 0 V
> +33 0 V
>  0 -795 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4458 768 34 812 BoxColFill
> +0.180 4419 768 34 812 BoxColFill
>  LCb setrgbcolor
> -4458 768 N
> +4419 768 N
>  0 811 V
>  33 0 V
>  0 -811 V
> @@ -3503,9 +3507,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4506 768 34 884 BoxColFill
> +0.180 4467 768 34 884 BoxColFill
>  LCb setrgbcolor
> -4506 768 N
> +4467 768 N
>  0 883 V
>  33 0 V
>  0 -883 V
> @@ -3514,42 +3518,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4553 768 35 896 BoxColFill
> +0.180 4514 768 34 896 BoxColFill
>  LCb setrgbcolor
> -4553 768 N
> +4514 768 N
>  0 895 V
> -34 0 V
> +33 0 V
>  0 -895 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4601 768 35 905 BoxColFill
> +0.180 4561 768 34 905 BoxColFill
>  LCb setrgbcolor
> -4601 768 N
> +4561 768 N
>  0 904 V
> -34 0 V
> +33 0 V
>  0 -904 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4649 768 34 910 BoxColFill
> +0.180 4608 768 35 910 BoxColFill
>  LCb setrgbcolor
> -4649 768 N
> +4608 768 N
>  0 909 V
> -33 0 V
> +34 0 V
>  0 -909 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4697 768 34 962 BoxColFill
> +0.180 4656 768 34 962 BoxColFill
>  LCb setrgbcolor
> -4697 768 N
> +4656 768 N
>  0 961 V
>  33 0 V
>  0 -961 V
> @@ -3558,9 +3562,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4745 768 34 974 BoxColFill
> +0.180 4703 768 34 974 BoxColFill
>  LCb setrgbcolor
> -4745 768 N
> +4703 768 N
>  0 973 V
>  33 0 V
>  0 -973 V
> @@ -3569,31 +3573,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4792 768 35 982 BoxColFill
> +0.180 4750 768 34 982 BoxColFill
>  LCb setrgbcolor
> -4792 768 N
> +4750 768 N
>  0 981 V
> -34 0 V
> +33 0 V
>  0 -981 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4840 768 35 982 BoxColFill
> +0.180 4798 768 34 982 BoxColFill
>  LCb setrgbcolor
> -4840 768 N
> +4798 768 N
>  0 981 V
> -34 0 V
> +33 0 V
>  0 -981 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4888 768 34 982 BoxColFill
> +0.180 4845 768 34 982 BoxColFill
>  LCb setrgbcolor
> -4888 768 N
> +4845 768 N
>  0 981 V
>  33 0 V
>  0 -981 V
> @@ -3602,9 +3606,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4936 768 34 994 BoxColFill
> +0.180 4892 768 34 994 BoxColFill
>  LCb setrgbcolor
> -4936 768 N
> +4892 768 N
>  0 993 V
>  33 0 V
>  0 -993 V
> @@ -3613,42 +3617,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4984 768 34 1000 BoxColFill
> +0.180 4939 768 35 1000 BoxColFill
>  LCb setrgbcolor
> -4984 768 N
> +4939 768 N
>  0 999 V
> -33 0 V
> +34 0 V
>  0 -999 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5031 768 35 1032 BoxColFill
> +0.180 4987 768 34 1032 BoxColFill
>  LCb setrgbcolor
> -5031 768 N
> +4987 768 N
>  0 1031 V
> -34 0 V
> +33 0 V
>  0 -1031 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5079 768 35 1034 BoxColFill
> +0.180 5034 768 34 1034 BoxColFill
>  LCb setrgbcolor
> -5079 768 N
> +5034 768 N
>  0 1033 V
> -34 0 V
> +33 0 V
>  0 -1033 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5127 768 34 1054 BoxColFill
> +0.180 5081 768 34 1054 BoxColFill
>  LCb setrgbcolor
> -5127 768 N
> +5081 768 N
>  0 1053 V
>  33 0 V
>  0 -1053 V
> @@ -3657,9 +3661,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5175 768 34 1073 BoxColFill
> +0.180 5129 768 34 1073 BoxColFill
>  LCb setrgbcolor
> -5175 768 N
> +5129 768 N
>  0 1072 V
>  33 0 V
>  0 -1072 V
> @@ -3668,13 +3672,24 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5222 768 35 1093 BoxColFill
> +0.180 5176 768 34 1093 BoxColFill
>  LCb setrgbcolor
> -5222 768 N
> +5176 768 N
>  0 1092 V
> -34 0 V
> +33 0 V
>  0 -1092 V
> --34 0 V
> +-33 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 5223 768 34 1111 BoxColFill
> +LCb setrgbcolor
> +5223 768 N
> +0 1110 V
> +33 0 V
> +0 -1110 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
> @@ -3703,58 +3718,58 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 826 808 35 1 BoxColFill
> +0.180 826 808 34 1 BoxColFill
>  LCb setrgbcolor
>  826 808 N
> -34 0 V
> --34 0 V
> +33 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 874 808 34 1 BoxColFill
> +0.180 873 808 34 1 BoxColFill
>  LCb setrgbcolor
> -874 808 N
> +873 808 N
>  33 0 V
>  -33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 922 821 34 1 BoxColFill
> +0.180 920 821 34 1 BoxColFill
>  LCb setrgbcolor
> -922 821 N
> +920 821 N
>  33 0 V
>  -33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 969 824 35 27 BoxColFill
> +0.180 968 824 34 27 BoxColFill
>  LCb setrgbcolor
> -969 824 N
> +968 824 N
>  0 26 V
> -34 0 V
> +33 0 V
>  0 -26 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1017 814 35 32 BoxColFill
> +0.180 1015 814 34 32 BoxColFill
>  LCb setrgbcolor
> -1017 814 N
> +1015 814 N
>  0 31 V
> -34 0 V
> +33 0 V
>  0 -31 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1065 815 34 32 BoxColFill
> +0.180 1062 815 34 32 BoxColFill
>  LCb setrgbcolor
> -1065 815 N
> +1062 815 N
>  0 31 V
>  33 0 V
>  0 -31 V
> @@ -3763,20 +3778,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1113 816 34 38 BoxColFill
> +0.180 1109 816 35 38 BoxColFill
>  LCb setrgbcolor
> -1113 816 N
> +1109 816 N
>  0 37 V
> -33 0 V
> +34 0 V
>  0 -37 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1161 832 34 53 BoxColFill
> +0.180 1157 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1161 832 N
> +1157 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3785,31 +3800,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1208 832 35 53 BoxColFill
> +0.180 1204 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1208 832 N
> +1204 832 N
>  0 52 V
> -34 0 V
> +33 0 V
>  0 -52 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1256 832 35 53 BoxColFill
> +0.180 1251 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1256 832 N
> +1251 832 N
>  0 52 V
> -34 0 V
> +33 0 V
>  0 -52 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1304 832 34 53 BoxColFill
> +0.180 1299 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1304 832 N
> +1299 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3818,9 +3833,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1352 832 34 53 BoxColFill
> +0.180 1346 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1352 832 N
> +1346 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3829,9 +3844,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1400 834 34 52 BoxColFill
> +0.180 1393 834 34 52 BoxColFill
>  LCb setrgbcolor
> -1400 834 N
> +1393 834 N
>  0 51 V
>  33 0 V
>  0 -51 V
> @@ -3840,9 +3855,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1447 931 35 53 BoxColFill
> +0.180 1440 931 35 53 BoxColFill
>  LCb setrgbcolor
> -1447 931 N
> +1440 931 N
>  0 52 V
>  34 0 V
>  0 -52 V
> @@ -3851,20 +3866,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1495 931 35 52 BoxColFill
> +0.180 1488 931 34 52 BoxColFill
>  LCb setrgbcolor
> -1495 931 N
> +1488 931 N
>  0 51 V
> -34 0 V
> +33 0 V
>  0 -51 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1543 974 34 61 BoxColFill
> +0.180 1535 974 34 61 BoxColFill
>  LCb setrgbcolor
> -1543 974 N
> +1535 974 N
>  0 60 V
>  33 0 V
>  0 -60 V
> @@ -3873,9 +3888,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1591 984 34 61 BoxColFill
> +0.180 1582 984 34 61 BoxColFill
>  LCb setrgbcolor
> -1591 984 N
> +1582 984 N
>  0 60 V
>  33 0 V
>  0 -60 V
> @@ -3884,31 +3899,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1638 1104 35 64 BoxColFill
> +0.180 1630 1104 34 64 BoxColFill
>  LCb setrgbcolor
> -1638 1104 N
> +1630 1104 N
>  0 63 V
> -34 0 V
> +33 0 V
>  0 -63 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1686 1106 35 65 BoxColFill
> +0.180 1677 1106 34 65 BoxColFill
>  LCb setrgbcolor
> -1686 1106 N
> +1677 1106 N
>  0 64 V
> -34 0 V
> +33 0 V
>  0 -64 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1734 1111 34 65 BoxColFill
> +0.180 1724 1111 34 65 BoxColFill
>  LCb setrgbcolor
> -1734 1111 N
> +1724 1111 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -3917,20 +3932,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1782 1001 34 66 BoxColFill
> +0.180 1771 1001 35 66 BoxColFill
>  LCb setrgbcolor
> -1782 1001 N
> +1771 1001 N
>  0 65 V
> -33 0 V
> +34 0 V
>  0 -65 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1830 1040 34 68 BoxColFill
> +0.180 1819 1040 34 68 BoxColFill
>  LCb setrgbcolor
> -1830 1040 N
> +1819 1040 N
>  0 67 V
>  33 0 V
>  0 -67 V
> @@ -3939,31 +3954,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1877 1071 35 73 BoxColFill
> +0.180 1866 1071 34 73 BoxColFill
>  LCb setrgbcolor
> -1877 1071 N
> +1866 1071 N
>  0 72 V
> -34 0 V
> +33 0 V
>  0 -72 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1925 1083 35 73 BoxColFill
> +0.180 1913 1083 34 73 BoxColFill
>  LCb setrgbcolor
> -1925 1083 N
> +1913 1083 N
>  0 72 V
> -34 0 V
> +33 0 V
>  0 -72 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1973 1096 34 72 BoxColFill
> +0.180 1961 1096 34 72 BoxColFill
>  LCb setrgbcolor
> -1973 1096 N
> +1961 1096 N
>  0 71 V
>  33 0 V
>  0 -71 V
> @@ -3972,9 +3987,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2021 1137 34 73 BoxColFill
> +0.180 2008 1137 34 73 BoxColFill
>  LCb setrgbcolor
> -2021 1137 N
> +2008 1137 N
>  0 72 V
>  33 0 V
>  0 -72 V
> @@ -3983,9 +3998,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2069 1174 34 85 BoxColFill
> +0.180 2055 1174 34 85 BoxColFill
>  LCb setrgbcolor
> -2069 1174 N
> +2055 1174 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -3994,9 +4009,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2116 1175 35 85 BoxColFill
> +0.180 2102 1175 35 85 BoxColFill
>  LCb setrgbcolor
> -2116 1175 N
> +2102 1175 N
>  0 84 V
>  34 0 V
>  0 -84 V
> @@ -4005,20 +4020,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2164 1236 35 86 BoxColFill
> +0.180 2150 1236 34 86 BoxColFill
>  LCb setrgbcolor
> -2164 1236 N
> +2150 1236 N
>  0 85 V
> -34 0 V
> +33 0 V
>  0 -85 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2212 1236 34 86 BoxColFill
> +0.180 2197 1236 34 86 BoxColFill
>  LCb setrgbcolor
> -2212 1236 N
> +2197 1236 N
>  0 85 V
>  33 0 V
>  0 -85 V
> @@ -4027,9 +4042,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2260 1245 34 85 BoxColFill
> +0.180 2244 1245 34 85 BoxColFill
>  LCb setrgbcolor
> -2260 1245 N
> +2244 1245 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -4038,31 +4053,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2307 1273 35 95 BoxColFill
> +0.180 2292 1273 34 95 BoxColFill
>  LCb setrgbcolor
> -2307 1273 N
> +2292 1273 N
>  0 94 V
> -34 0 V
> +33 0 V
>  0 -94 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2355 1301 35 100 BoxColFill
> +0.180 2339 1301 34 100 BoxColFill
>  LCb setrgbcolor
> -2355 1301 N
> +2339 1301 N
>  0 99 V
> -34 0 V
> +33 0 V
>  0 -99 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2403 1333 34 112 BoxColFill
> +0.180 2386 1333 34 112 BoxColFill
>  LCb setrgbcolor
> -2403 1333 N
> +2386 1333 N
>  0 111 V
>  33 0 V
>  0 -111 V
> @@ -4071,9 +4086,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2451 1334 34 113 BoxColFill
> +0.180 2433 1334 34 113 BoxColFill
>  LCb setrgbcolor
> -2451 1334 N
> +2433 1334 N
>  0 112 V
>  33 0 V
>  0 -112 V
> @@ -4082,9 +4097,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2499 1336 34 114 BoxColFill
> +0.180 2481 1336 34 114 BoxColFill
>  LCb setrgbcolor
> -2499 1336 N
> +2481 1336 N
>  0 113 V
>  33 0 V
>  0 -113 V
> @@ -4093,31 +4108,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2546 1368 35 113 BoxColFill
> +0.180 2528 1368 34 113 BoxColFill
>  LCb setrgbcolor
> -2546 1368 N
> +2528 1368 N
>  0 112 V
> -34 0 V
> +33 0 V
>  0 -112 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2594 1378 35 116 BoxColFill
> +0.180 2575 1378 34 116 BoxColFill
>  LCb setrgbcolor
> -2594 1378 N
> +2575 1378 N
>  0 115 V
> -34 0 V
> +33 0 V
>  0 -115 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2642 1380 34 116 BoxColFill
> +0.180 2623 1380 34 116 BoxColFill
>  LCb setrgbcolor
> -2642 1380 N
> +2623 1380 N
>  0 115 V
>  33 0 V
>  0 -115 V
> @@ -4126,9 +4141,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2690 1324 34 114 BoxColFill
> +0.180 2670 1324 34 114 BoxColFill
>  LCb setrgbcolor
> -2690 1324 N
> +2670 1324 N
>  0 113 V
>  33 0 V
>  0 -113 V
> @@ -4137,9 +4152,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2738 1345 34 112 BoxColFill
> +0.180 2717 1345 34 112 BoxColFill
>  LCb setrgbcolor
> -2738 1345 N
> +2717 1345 N
>  0 111 V
>  33 0 V
>  0 -111 V
> @@ -4148,31 +4163,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2785 1356 35 112 BoxColFill
> +0.180 2764 1356 34 112 BoxColFill
>  LCb setrgbcolor
> -2785 1356 N
> +2764 1356 N
>  0 111 V
> -34 0 V
> +33 0 V
>  0 -111 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2833 1366 35 179 BoxColFill
> +0.180 2812 1366 34 179 BoxColFill
>  LCb setrgbcolor
> -2833 1366 N
> +2812 1366 N
>  0 178 V
> -34 0 V
> +33 0 V
>  0 -178 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2881 1370 34 202 BoxColFill
> +0.180 2859 1370 34 202 BoxColFill
>  LCb setrgbcolor
> -2881 1370 N
> +2859 1370 N
>  0 201 V
>  33 0 V
>  0 -201 V
> @@ -4181,9 +4196,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2929 1381 34 212 BoxColFill
> +0.180 2906 1381 34 212 BoxColFill
>  LCb setrgbcolor
> -2929 1381 N
> +2906 1381 N
>  0 211 V
>  33 0 V
>  0 -211 V
> @@ -4192,42 +4207,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2976 1393 35 213 BoxColFill
> +0.180 2954 1393 34 213 BoxColFill
>  LCb setrgbcolor
> -2976 1393 N
> +2954 1393 N
>  0 212 V
> -34 0 V
> +33 0 V
>  0 -212 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3024 1424 35 221 BoxColFill
> +0.180 3001 1424 34 221 BoxColFill
>  LCb setrgbcolor
> -3024 1424 N
> +3001 1424 N
>  0 220 V
> -34 0 V
> +33 0 V
>  0 -220 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3072 1431 35 220 BoxColFill
> +0.180 3048 1431 34 220 BoxColFill
>  LCb setrgbcolor
> -3072 1431 N
> +3048 1431 N
>  0 219 V
> -34 0 V
> +33 0 V
>  0 -219 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3120 1429 34 221 BoxColFill
> +0.180 3095 1429 34 221 BoxColFill
>  LCb setrgbcolor
> -3120 1429 N
> +3095 1429 N
>  0 220 V
>  33 0 V
>  0 -220 V
> @@ -4236,9 +4251,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3168 1441 34 224 BoxColFill
> +0.180 3143 1441 34 224 BoxColFill
>  LCb setrgbcolor
> -3168 1441 N
> +3143 1441 N
>  0 223 V
>  33 0 V
>  0 -223 V
> @@ -4247,31 +4262,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3215 1442 35 226 BoxColFill
> +0.180 3190 1442 34 226 BoxColFill
>  LCb setrgbcolor
> -3215 1442 N
> +3190 1442 N
>  0 225 V
> -34 0 V
> +33 0 V
>  0 -225 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3263 1450 35 227 BoxColFill
> +0.180 3237 1450 34 227 BoxColFill
>  LCb setrgbcolor
> -3263 1450 N
> +3237 1450 N
>  0 226 V
> -34 0 V
> +33 0 V
>  0 -226 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3311 1483 34 227 BoxColFill
> +0.180 3285 1483 34 227 BoxColFill
>  LCb setrgbcolor
> -3311 1483 N
> +3285 1483 N
>  0 226 V
>  33 0 V
>  0 -226 V
> @@ -4280,9 +4295,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3359 1491 34 230 BoxColFill
> +0.180 3332 1491 34 230 BoxColFill
>  LCb setrgbcolor
> -3359 1491 N
> +3332 1491 N
>  0 229 V
>  33 0 V
>  0 -229 V
> @@ -4291,9 +4306,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3407 1496 34 230 BoxColFill
> +0.180 3379 1496 34 230 BoxColFill
>  LCb setrgbcolor
> -3407 1496 N
> +3379 1496 N
>  0 229 V
>  33 0 V
>  0 -229 V
> @@ -4302,31 +4317,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3454 1504 35 285 BoxColFill
> +0.180 3426 1504 34 285 BoxColFill
>  LCb setrgbcolor
> -3454 1504 N
> +3426 1504 N
>  0 284 V
> -34 0 V
> +33 0 V
>  0 -284 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3502 1508 35 288 BoxColFill
> +0.180 3474 1508 34 288 BoxColFill
>  LCb setrgbcolor
> -3502 1508 N
> +3474 1508 N
>  0 287 V
> -34 0 V
> +33 0 V
>  0 -287 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3550 1512 34 287 BoxColFill
> +0.180 3521 1512 34 287 BoxColFill
>  LCb setrgbcolor
> -3550 1512 N
> +3521 1512 N
>  0 286 V
>  33 0 V
>  0 -286 V
> @@ -4335,9 +4350,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3598 1515 34 288 BoxColFill
> +0.180 3568 1515 34 288 BoxColFill
>  LCb setrgbcolor
> -3598 1515 N
> +3568 1515 N
>  0 287 V
>  33 0 V
>  0 -287 V
> @@ -4346,9 +4361,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3646 1526 34 289 BoxColFill
> +0.180 3616 1526 34 289 BoxColFill
>  LCb setrgbcolor
> -3646 1526 N
> +3616 1526 N
>  0 288 V
>  33 0 V
>  0 -288 V
> @@ -4357,31 +4372,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3693 1654 35 290 BoxColFill
> +0.180 3663 1654 34 290 BoxColFill
>  LCb setrgbcolor
> -3693 1654 N
> +3663 1654 N
>  0 289 V
> -34 0 V
> +33 0 V
>  0 -289 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3741 1553 35 294 BoxColFill
> +0.180 3710 1553 34 294 BoxColFill
>  LCb setrgbcolor
> -3741 1553 N
> +3710 1553 N
>  0 293 V
> -34 0 V
> +33 0 V
>  0 -293 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3789 1548 34 297 BoxColFill
> +0.180 3757 1548 34 297 BoxColFill
>  LCb setrgbcolor
> -3789 1548 N
> +3757 1548 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4390,9 +4405,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3837 1552 34 297 BoxColFill
> +0.180 3805 1552 34 297 BoxColFill
>  LCb setrgbcolor
> -3837 1552 N
> +3805 1552 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4401,42 +4416,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3884 1548 35 294 BoxColFill
> +0.180 3852 1548 34 294 BoxColFill
>  LCb setrgbcolor
> -3884 1548 N
> +3852 1548 N
>  0 293 V
> -34 0 V
> +33 0 V
>  0 -293 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3932 1547 35 297 BoxColFill
> +0.180 3899 1547 34 297 BoxColFill
>  LCb setrgbcolor
> -3932 1547 N
> +3899 1547 N
>  0 296 V
> -34 0 V
> +33 0 V
>  0 -296 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3980 1546 34 299 BoxColFill
> +0.180 3946 1546 35 299 BoxColFill
>  LCb setrgbcolor
> -3980 1546 N
> +3946 1546 N
>  0 298 V
> -33 0 V
> +34 0 V
>  0 -298 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4028 1558 34 310 BoxColFill
> +0.180 3994 1558 34 310 BoxColFill
>  LCb setrgbcolor
> -4028 1558 N
> +3994 1558 N
>  0 309 V
>  33 0 V
>  0 -309 V
> @@ -4445,9 +4460,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4076 1534 34 315 BoxColFill
> +0.180 4041 1534 34 315 BoxColFill
>  LCb setrgbcolor
> -4076 1534 N
> +4041 1534 N
>  0 314 V
>  33 0 V
>  0 -314 V
> @@ -4456,31 +4471,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4123 1539 35 443 BoxColFill
> +0.180 4088 1539 34 443 BoxColFill
>  LCb setrgbcolor
> -4123 1539 N
> +4088 1539 N
>  0 442 V
> -34 0 V
> +33 0 V
>  0 -442 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4171 1517 35 329 BoxColFill
> +0.180 4136 1517 34 329 BoxColFill
>  LCb setrgbcolor
> -4171 1517 N
> +4136 1517 N
>  0 328 V
> -34 0 V
> +33 0 V
>  0 -328 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4219 1515 34 315 BoxColFill
> +0.180 4183 1515 34 315 BoxColFill
>  LCb setrgbcolor
> -4219 1515 N
> +4183 1515 N
>  0 314 V
>  33 0 V
>  0 -314 V
> @@ -4489,9 +4504,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4267 1521 34 322 BoxColFill
> +0.180 4230 1521 34 322 BoxColFill
>  LCb setrgbcolor
> -4267 1521 N
> +4230 1521 N
>  0 321 V
>  33 0 V
>  0 -321 V
> @@ -4500,42 +4515,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4315 1548 34 322 BoxColFill
> +0.180 4277 1548 35 322 BoxColFill
>  LCb setrgbcolor
> -4315 1548 N
> +4277 1548 N
>  0 321 V
> -33 0 V
> +34 0 V
>  0 -321 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4362 1551 35 323 BoxColFill
> +0.180 4325 1551 34 323 BoxColFill
>  LCb setrgbcolor
> -4362 1551 N
> +4325 1551 N
>  0 322 V
> -34 0 V
> +33 0 V
>  0 -322 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4410 1563 35 331 BoxColFill
> +0.180 4372 1563 34 331 BoxColFill
>  LCb setrgbcolor
> -4410 1563 N
> +4372 1563 N
>  0 330 V
> -34 0 V
> +33 0 V
>  0 -330 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4458 1579 34 335 BoxColFill
> +0.180 4419 1579 34 335 BoxColFill
>  LCb setrgbcolor
> -4458 1579 N
> +4419 1579 N
>  0 334 V
>  33 0 V
>  0 -334 V
> @@ -4544,9 +4559,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4506 1651 34 344 BoxColFill
> +0.180 4467 1651 34 344 BoxColFill
>  LCb setrgbcolor
> -4506 1651 N
> +4467 1651 N
>  0 343 V
>  33 0 V
>  0 -343 V
> @@ -4555,42 +4570,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4553 1663 35 404 BoxColFill
> +0.180 4514 1663 34 404 BoxColFill
>  LCb setrgbcolor
> -4553 1663 N
> +4514 1663 N
>  0 403 V
> -34 0 V
> +33 0 V
>  0 -403 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4601 1672 35 411 BoxColFill
> +0.180 4561 1672 34 411 BoxColFill
>  LCb setrgbcolor
> -4601 1672 N
> +4561 1672 N
>  0 410 V
> -34 0 V
> +33 0 V
>  0 -410 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4649 1677 34 417 BoxColFill
> +0.180 4608 1677 35 417 BoxColFill
>  LCb setrgbcolor
> -4649 1677 N
> +4608 1677 N
>  0 416 V
> -33 0 V
> +34 0 V
>  0 -416 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4697 1729 34 468 BoxColFill
> +0.180 4656 1729 34 468 BoxColFill
>  LCb setrgbcolor
> -4697 1729 N
> +4656 1729 N
>  0 467 V
>  33 0 V
>  0 -467 V
> @@ -4599,9 +4614,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4745 1741 34 496 BoxColFill
> +0.180 4703 1741 34 496 BoxColFill
>  LCb setrgbcolor
> -4745 1741 N
> +4703 1741 N
>  0 495 V
>  33 0 V
>  0 -495 V
> @@ -4610,31 +4625,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4792 1749 35 518 BoxColFill
> +0.180 4750 1749 34 518 BoxColFill
>  LCb setrgbcolor
> -4792 1749 N
> +4750 1749 N
>  0 517 V
> -34 0 V
> +33 0 V
>  0 -517 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4840 1749 35 536 BoxColFill
> +0.180 4798 1749 34 536 BoxColFill
>  LCb setrgbcolor
> -4840 1749 N
> +4798 1749 N
>  0 535 V
> -34 0 V
> +33 0 V
>  0 -535 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4888 1749 34 537 BoxColFill
> +0.180 4845 1749 34 537 BoxColFill
>  LCb setrgbcolor
> -4888 1749 N
> +4845 1749 N
>  0 536 V
>  33 0 V
>  0 -536 V
> @@ -4643,9 +4658,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4936 1761 34 544 BoxColFill
> +0.180 4892 1761 34 544 BoxColFill
>  LCb setrgbcolor
> -4936 1761 N
> +4892 1761 N
>  0 543 V
>  33 0 V
>  0 -543 V
> @@ -4654,42 +4669,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4984 1767 34 546 BoxColFill
> +0.180 4939 1767 35 546 BoxColFill
>  LCb setrgbcolor
> -4984 1767 N
> +4939 1767 N
>  0 545 V
> -33 0 V
> +34 0 V
>  0 -545 V
> --33 0 V
> +-34 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5031 1799 35 553 BoxColFill
> +0.180 4987 1799 34 553 BoxColFill
>  LCb setrgbcolor
> -5031 1799 N
> +4987 1799 N
>  0 552 V
> -34 0 V
> +33 0 V
>  0 -552 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5079 1801 35 556 BoxColFill
> +0.180 5034 1801 34 556 BoxColFill
>  LCb setrgbcolor
> -5079 1801 N
> +5034 1801 N
>  0 555 V
> -34 0 V
> +33 0 V
>  0 -555 V
> --34 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5127 1821 34 566 BoxColFill
> +0.180 5081 1821 34 566 BoxColFill
>  LCb setrgbcolor
> -5127 1821 N
> +5081 1821 N
>  0 565 V
>  33 0 V
>  0 -565 V
> @@ -4698,9 +4713,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5175 1840 34 581 BoxColFill
> +0.180 5129 1840 34 581 BoxColFill
>  LCb setrgbcolor
> -5175 1840 N
> +5129 1840 N
>  0 580 V
>  33 0 V
>  0 -580 V
> @@ -4709,13 +4724,24 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5222 1860 35 594 BoxColFill
> +0.180 5176 1860 34 594 BoxColFill
>  LCb setrgbcolor
> -5222 1860 N
> +5176 1860 N
>  0 593 V
> -34 0 V
> +33 0 V
>  0 -593 V
> --34 0 V
> +-33 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 5223 1878 34 609 BoxColFill
> +LCb setrgbcolor
> +5223 1878 N
> +0 608 V
> +33 0 V
> +0 -608 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
> @@ -4735,99 +4761,100 @@ LTb
>  0.55 0.00 0.00 C
>  3153 2217 M
>  351 0 V
> -843 768 M
> +842 768 M
>  48 0 V
>  47 0 V
> -48 1167 V
> -48 290 V
> +47 1167 V
> +47 290 V
>  48 -7 V
> -48 130 V
> +47 130 V
>  47 44 V
>  48 3 V
> -48 0 V
> -48 -7 V
> +47 0 V
> +47 -7 V
>  47 0 V
>  48 -25 V
> -48 -725 V
> -48 3 V
> +47 -725 V
> +47 3 V
>  48 -58 V
>  47 -29 V
> -48 -210 V
> -48 0 V
> +47 -210 V
> +47 0 V
>  48 -7 V
> -48 225 V
> +47 225 V
>  47 -76 V
>  48 -26 V
> -48 -22 V
> -48 -21 V
> +47 -22 V
> +47 -21 V
>  47 -58 V
>  48 36 V
> -48 -4 V
> -48 -69 V
> +47 -4 V
> +47 -69 V
>  48 0 V
>  47 -10 V
> -48 29 V
> -48 -4 V
> +47 29 V
> +47 -4 V
>  48 25 V
> -48 4 V
> +47 4 V
>  47 7 V
>  48 -32 V
> -48 0 V
> -48 0 V
> +47 0 V
> +47 0 V
>  47 39 V
>  48 -29 V
> -48 -7 V
> -48 254 V
> +47 -7 V
> +47 254 V
>  48 76 V
>  47 22 V
> +47 -11 V
> +47 -7 V
>  48 -11 V
> -48 -7 V
> -48 -11 V
> -48 11 V
> +47 11 V
>  47 -11 V
> -48 7 V
> +47 7 V
>  48 -4 V
> -48 -32 V
> -48 0 V
> -47 -4 V
> -48 141 V
> -48 8 V
> -48 -8 V
> -47 -3 V
> -48 -7 V
> -48 -105 V
> +47 -32 V
> +47 0 V
> +48 -4 V
> +47 141 V
> +47 8 V
> +47 -8 V
> +48 -3 V
> +47 -7 V
> +47 -105 V
>  48 94 V
> -48 11 V
> +47 11 V
>  47 -4 V
> -48 0 V
> +47 0 V
>  48 4 V
> -48 7 V
> -48 14 V
> -47 33 V
> -48 268 V
> -48 -214 V
> -48 -32 V
>  47 7 V
> -48 -22 V
> -48 -3 V
> +47 14 V
> +48 33 V
> +47 268 V
> +47 -214 V
> +47 -32 V
>  48 7 V
> -48 -4 V
> -47 -43 V
> -48 108 V
> -48 8 V
> +47 -22 V
> +47 -3 V
>  48 7 V
> -48 47 V
> -47 36 V
> -48 29 V
> -48 29 V
> -48 4 V
>  47 -4 V
> +47 -43 V
> +47 108 V
> +48 8 V
> +47 7 V
> +47 47 V
> +48 36 V
> +47 29 V
> +47 29 V
> +47 4 V
> +48 -4 V
> +47 0 V
> +47 -14 V
>  48 0 V
> -48 -14 V
> -48 0 V
> -48 0 V
> +47 0 V
>  47 7 V
> -48 4 V
> +47 4 V
> +48 7 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index 49878e8fa034..8b4feec7df51 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -90,4 +90,5 @@ v5.16 18947 10362 29309 35.4
>  v6.0  19954 10716 30670 34.9
>  ""    20336 10922 31258 34.9
>  ""    20699 11212 31911 35.1
> -v6.3  21087 11457 32544 35.2
> +""    21087 11457 32544 35.2
> +v6.4  21444 11748 33192 35.4
> 
> base-commit: 15378039320d96764433d8f5bb6e292b952005d0
> -- 
> 2.25.1
> 
