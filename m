Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjBXTDo (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 24 Feb 2023 14:03:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75491B2F6
        for <perfbook@vger.kernel.org>; Fri, 24 Feb 2023 11:03:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DDED6B81D00
        for <perfbook@vger.kernel.org>; Fri, 24 Feb 2023 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677265415;
        bh=9jh6GpVE22y/K6jf3wVXSGHNurERzwIYpuMiOeQpzvA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=BByeWOdIBiODYAqP7S1z+6B/+ntSNAticoNmpw9XyNNfny2KLT/niESuhcrdCO8UH
         GWM5ATsO3bGUtdqXBE3AFn7AjvUW9Z/gghDIUT8XhNNW6cl3c02ggrJ5ntSnlwzpEp
         kCsqaVTG38tEZRwfgMvDDiAQPEE+Ui+GgwcCMzV+DRJaKx3vgtvZL+JHjHSqRokM57
         F+itPGN8E861jsFQRa681Md7HDoBYuo6cfaWiVHJrcskeFzQ2/YexMaW4uM5LXldpH
         DBO/S2yy7LuItUbFFGJKvvxP5NGGkXgeQRuCKyUaQOm5tOk07qBZY18gGymxys+kTl
         f6ucSNRjzBd6Q==
Date: Fri, 24 Feb 2023 11:03:35 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] formal: Update RCU-test-ratio table as of
 v6.2
Message-ID: <20230224190335.GS2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <ffb3543d-658f-9aa5-d094-f5bdd449e7bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffb3543d-658f-9aa5-d094-f5bdd449e7bc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Feb 24, 2023 at 06:24:56PM +0900, Akira Yokosawa wrote:
> Regular update of Figure 12.4.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/RCU-test-ratio.eps | 1385 ++++++++++----------
>  CodeSamples/formal/data/rcu-test.dat       |    1 +
>  2 files changed, 707 insertions(+), 679 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index 7b075c605f91..fda03a84cbd7 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
>  %%Creator: gnuplot 5.2 patchlevel 8
> -%%CreationDate: Mon Dec 19 18:13:51 2022
> +%%CreationDate: Thu Feb 23 22:38:30 2023
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 453 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.2 patchlevel 8)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Mon Dec 19 18:13:51 2022)
> +  /CreationDate (Thu Feb 23 22:38:30 2023)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -2013,17 +2013,17 @@ LCb setrgbcolor
>  stroke
>  LTb
>  LCb setrgbcolor
> -647 512 M
> +646 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -679 512 M
> +678 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -711 512 M
> +710 512 M
>  stroke
> -711 464 M
> +710 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
>  ] -26.7 MRshow
> @@ -2032,21 +2032,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -744 512 M
> +742 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -776 512 M
> +773 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -808 512 M
> +805 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -840 512 M
> +837 512 M
>  stroke
> -840 464 M
> +837 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
>  ] -26.7 MRshow
> @@ -2055,21 +2055,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -872 512 M
> +869 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -904 512 M
> +900 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -936 512 M
> +932 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -968 512 M
> +964 512 M
>  stroke
> -968 464 M
> +964 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
>  ] -26.7 MRshow
> @@ -2078,21 +2078,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1000 512 M
> +996 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1032 512 M
> +1027 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1065 512 M
> +1059 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1097 512 M
> +1091 512 M
>  stroke
> -1097 464 M
> +1091 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
>  ] -26.7 MRshow
> @@ -2101,21 +2101,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1129 512 M
> +1123 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1161 512 M
> +1154 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1193 512 M
> +1186 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1225 512 M
> +1218 512 M
>  stroke
> -1225 464 M
> +1218 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
>  ] -26.7 MRshow
> @@ -2124,21 +2124,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1257 512 M
> +1250 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1289 512 M
> +1281 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1321 512 M
> +1313 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1353 512 M
> +1345 512 M
>  stroke
> -1353 464 M
> +1345 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
>  ] -26.7 MRshow
> @@ -2147,21 +2147,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1386 512 M
> +1377 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1418 512 M
> +1408 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1450 512 M
> +1440 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1482 512 M
> +1472 512 M
>  stroke
> -1482 464 M
> +1472 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
>  ] -26.7 MRshow
> @@ -2170,21 +2170,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1514 512 M
> +1504 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1546 512 M
> +1535 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1578 512 M
> +1567 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1610 512 M
> +1599 512 M
>  stroke
> -1610 464 M
> +1599 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
>  ] -26.7 MRshow
> @@ -2193,21 +2193,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1642 512 M
> +1631 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1674 512 M
> +1662 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1707 512 M
> +1694 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1739 512 M
> +1726 512 M
>  stroke
> -1739 464 M
> +1726 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
>  ] -26.7 MRshow
> @@ -2216,21 +2216,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1771 512 M
> +1758 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1803 512 M
> +1789 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1835 512 M
> +1821 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1867 512 M
> +1853 512 M
>  stroke
> -1867 464 M
> +1853 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
>  ] -26.7 MRshow
> @@ -2239,21 +2239,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1899 512 M
> +1885 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1931 512 M
> +1916 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1963 512 M
> +1948 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1995 512 M
> +1980 512 M
>  stroke
> -1995 464 M
> +1980 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
>  ] -26.7 MRshow
> @@ -2262,21 +2262,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2028 512 M
> +2012 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2060 512 M
> +2043 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2092 512 M
> +2075 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2124 512 M
> +2107 512 M
>  stroke
> -2124 464 M
> +2107 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
>  ] -26.7 MRshow
> @@ -2285,21 +2285,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2156 512 M
> +2139 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2188 512 M
> +2170 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2220 512 M
> +2202 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2252 512 M
> +2234 512 M
>  stroke
> -2252 464 M
> +2234 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
>  ] -26.7 MRshow
> @@ -2308,21 +2308,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2284 512 M
> +2266 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2316 512 M
> +2297 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2348 512 M
> +2329 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2381 512 M
> +2361 512 M
>  stroke
> -2381 464 M
> +2361 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
>  ] -26.7 MRshow
> @@ -2331,21 +2331,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2413 512 M
> +2393 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2445 512 M
> +2424 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2477 512 M
> +2456 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2509 512 M
> +2488 512 M
>  stroke
> -2509 464 M
> +2488 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
>  ] -26.7 MRshow
> @@ -2354,21 +2354,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2541 512 M
> +2520 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2573 512 M
> +2551 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2605 512 M
> +2583 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2637 512 M
> +2615 512 M
>  stroke
> -2637 464 M
> +2615 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
>  ] -26.7 MRshow
> @@ -2377,25 +2377,25 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2669 512 M
> +2647 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2702 512 M
> +2678 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2734 512 M
> +2710 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2766 512 M
> +2742 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2798 512 M
> +2774 512 M
>  stroke
> -2798 464 M
> +2774 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
>  ] -26.7 MRshow
> @@ -2404,21 +2404,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2830 512 M
> +2805 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2862 512 M
> +2837 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2894 512 M
> +2869 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2926 512 M
> +2901 512 M
>  stroke
> -2926 464 M
> +2901 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
>  ] -26.7 MRshow
> @@ -2427,21 +2427,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2958 512 M
> +2932 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2990 512 M
> +2964 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3023 512 M
> +2996 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3055 512 M
> +3028 512 M
>  stroke
> -3055 464 M
> +3028 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
>  ] -26.7 MRshow
> @@ -2450,21 +2450,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3087 512 M
> +3059 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3119 512 M
> +3091 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3151 512 M
> +3123 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3183 512 M
> +3155 512 M
>  stroke
> -3183 464 M
> +3155 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
>  ] -26.7 MRshow
> @@ -2473,21 +2473,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3215 512 M
> +3186 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3247 512 M
> +3218 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3279 512 M
> +3250 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3311 512 M
> +3282 512 M
>  stroke
> -3311 464 M
> +3282 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.16)]
>  ] -26.7 MRshow
> @@ -2496,21 +2496,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3344 512 M
> +3313 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3376 512 M
> +3345 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3408 512 M
> +3377 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3440 512 M
> +3409 512 M
>  stroke
> -3440 464 M
> +3409 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v6.0)]
>  ] -26.7 MRshow
> @@ -2519,6 +2519,10 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> +3440 512 M
> +stroke
> +LTb
> +LCb setrgbcolor
>  3472 512 M
>  stroke
>  LTb
> @@ -2652,53 +2656,53 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 604 512 23 28 BoxColFill
> +0.180 603 512 24 28 BoxColFill
>  LCb setrgbcolor
> -604 512 N
> +603 512 N
>  0 27 V
> -22 0 V
> +23 0 V
>  0 -27 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 636 512 24 36 BoxColFill
> +0.180 635 512 23 36 BoxColFill
>  LCb setrgbcolor
> -636 512 N
> +635 512 N
>  0 35 V
> -23 0 V
> +22 0 V
>  0 -35 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 668 512 24 38 BoxColFill
> +0.180 667 512 23 38 BoxColFill
>  LCb setrgbcolor
> -668 512 N
> +667 512 N
>  0 37 V
> -23 0 V
> +22 0 V
>  0 -37 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 700 512 24 32 BoxColFill
> +0.180 699 512 23 32 BoxColFill
>  LCb setrgbcolor
> -700 512 N
> +699 512 N
>  0 31 V
> -23 0 V
> +22 0 V
>  0 -31 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 732 512 24 32 BoxColFill
> +0.180 730 512 24 32 BoxColFill
>  LCb setrgbcolor
> -732 512 N
> +730 512 N
>  0 31 V
>  23 0 V
>  0 -31 V
> @@ -2707,20 +2711,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 764 512 24 33 BoxColFill
> +0.180 762 512 23 33 BoxColFill
>  LCb setrgbcolor
> -764 512 N
> +762 512 N
>  0 32 V
> -23 0 V
> +22 0 V
>  0 -32 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 797 512 23 44 BoxColFill
> +0.180 794 512 23 44 BoxColFill
>  LCb setrgbcolor
> -797 512 N
> +794 512 N
>  0 43 V
>  22 0 V
>  0 -43 V
> @@ -2729,9 +2733,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 829 512 23 44 BoxColFill
> +0.180 826 512 23 44 BoxColFill
>  LCb setrgbcolor
> -829 512 N
> +826 512 N
>  0 43 V
>  22 0 V
>  0 -43 V
> @@ -2740,20 +2744,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 861 512 23 44 BoxColFill
> +0.180 857 512 24 44 BoxColFill
>  LCb setrgbcolor
> -861 512 N
> +857 512 N
>  0 43 V
> -22 0 V
> +23 0 V
>  0 -43 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 893 512 23 44 BoxColFill
> +0.180 889 512 23 44 BoxColFill
>  LCb setrgbcolor
> -893 512 N
> +889 512 N
>  0 43 V
>  22 0 V
>  0 -43 V
> @@ -2762,9 +2766,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 925 512 23 44 BoxColFill
> +0.180 921 512 23 44 BoxColFill
>  LCb setrgbcolor
> -925 512 N
> +921 512 N
>  0 43 V
>  22 0 V
>  0 -43 V
> @@ -2773,20 +2777,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 957 512 24 45 BoxColFill
> +0.180 953 512 23 45 BoxColFill
>  LCb setrgbcolor
> -957 512 N
> +953 512 N
>  0 44 V
> -23 0 V
> +22 0 V
>  0 -44 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 989 512 24 110 BoxColFill
> +0.180 984 512 24 110 BoxColFill
>  LCb setrgbcolor
> -989 512 N
> +984 512 N
>  0 109 V
>  23 0 V
>  0 -109 V
> @@ -2795,53 +2799,53 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1021 512 24 109 BoxColFill
> +0.180 1016 512 23 109 BoxColFill
>  LCb setrgbcolor
> -1021 512 N
> +1016 512 N
>  0 108 V
> -23 0 V
> +22 0 V
>  0 -108 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1053 512 24 138 BoxColFill
> +0.180 1048 512 23 138 BoxColFill
>  LCb setrgbcolor
> -1053 512 N
> +1048 512 N
>  0 137 V
> -23 0 V
> +22 0 V
>  0 -137 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1085 512 24 145 BoxColFill
> +0.180 1080 512 23 145 BoxColFill
>  LCb setrgbcolor
> -1085 512 N
> +1080 512 N
>  0 144 V
> -23 0 V
> +22 0 V
>  0 -144 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1118 512 23 225 BoxColFill
> +0.180 1111 512 24 225 BoxColFill
>  LCb setrgbcolor
> -1118 512 N
> +1111 512 N
>  0 224 V
> -22 0 V
> +23 0 V
>  0 -224 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1150 512 23 226 BoxColFill
> +0.180 1143 512 23 226 BoxColFill
>  LCb setrgbcolor
> -1150 512 N
> +1143 512 N
>  0 225 V
>  22 0 V
>  0 -225 V
> @@ -2850,9 +2854,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1182 512 23 230 BoxColFill
> +0.180 1175 512 23 230 BoxColFill
>  LCb setrgbcolor
> -1182 512 N
> +1175 512 N
>  0 229 V
>  22 0 V
>  0 -229 V
> @@ -2861,9 +2865,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1214 512 23 156 BoxColFill
> +0.180 1207 512 23 156 BoxColFill
>  LCb setrgbcolor
> -1214 512 N
> +1207 512 N
>  0 155 V
>  22 0 V
>  0 -155 V
> @@ -2872,20 +2876,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1246 512 23 183 BoxColFill
> +0.180 1238 512 24 183 BoxColFill
>  LCb setrgbcolor
> -1246 512 N
> +1238 512 N
>  0 182 V
> -22 0 V
> +23 0 V
>  0 -182 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1278 512 23 203 BoxColFill
> +0.180 1270 512 23 203 BoxColFill
>  LCb setrgbcolor
> -1278 512 N
> +1270 512 N
>  0 202 V
>  22 0 V
>  0 -202 V
> @@ -2894,31 +2898,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1310 512 24 211 BoxColFill
> +0.180 1302 512 23 211 BoxColFill
>  LCb setrgbcolor
> -1310 512 N
> +1302 512 N
>  0 210 V
> -23 0 V
> +22 0 V
>  0 -210 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1342 512 24 220 BoxColFill
> +0.180 1334 512 23 220 BoxColFill
>  LCb setrgbcolor
> -1342 512 N
> +1334 512 N
>  0 219 V
> -23 0 V
> +22 0 V
>  0 -219 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1374 512 24 247 BoxColFill
> +0.180 1365 512 24 247 BoxColFill
>  LCb setrgbcolor
> -1374 512 N
> +1365 512 N
>  0 246 V
>  23 0 V
>  0 -246 V
> @@ -2927,20 +2931,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1406 512 24 271 BoxColFill
> +0.180 1397 512 23 271 BoxColFill
>  LCb setrgbcolor
> -1406 512 N
> +1397 512 N
>  0 270 V
> -23 0 V
> +22 0 V
>  0 -270 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1439 512 23 272 BoxColFill
> +0.180 1429 512 23 272 BoxColFill
>  LCb setrgbcolor
> -1439 512 N
> +1429 512 N
>  0 271 V
>  22 0 V
>  0 -271 V
> @@ -2949,9 +2953,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1471 512 23 313 BoxColFill
> +0.180 1461 512 23 313 BoxColFill
>  LCb setrgbcolor
> -1471 512 N
> +1461 512 N
>  0 312 V
>  22 0 V
>  0 -312 V
> @@ -2960,20 +2964,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1503 512 23 313 BoxColFill
> +0.180 1492 512 24 313 BoxColFill
>  LCb setrgbcolor
> -1503 512 N
> +1492 512 N
>  0 312 V
> -22 0 V
> +23 0 V
>  0 -312 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1535 512 23 319 BoxColFill
> +0.180 1524 512 23 319 BoxColFill
>  LCb setrgbcolor
> -1535 512 N
> +1524 512 N
>  0 318 V
>  22 0 V
>  0 -318 V
> @@ -2982,9 +2986,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1567 512 23 337 BoxColFill
> +0.180 1556 512 23 337 BoxColFill
>  LCb setrgbcolor
> -1567 512 N
> +1556 512 N
>  0 336 V
>  22 0 V
>  0 -336 V
> @@ -2993,9 +2997,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1599 512 23 356 BoxColFill
> +0.180 1588 512 23 356 BoxColFill
>  LCb setrgbcolor
> -1599 512 N
> +1588 512 N
>  0 355 V
>  22 0 V
>  0 -355 V
> @@ -3004,9 +3008,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1631 512 24 378 BoxColFill
> +0.180 1619 512 24 378 BoxColFill
>  LCb setrgbcolor
> -1631 512 N
> +1619 512 N
>  0 377 V
>  23 0 V
>  0 -377 V
> @@ -3015,42 +3019,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1663 512 24 378 BoxColFill
> +0.180 1651 512 23 378 BoxColFill
>  LCb setrgbcolor
> -1663 512 N
> +1651 512 N
>  0 377 V
> -23 0 V
> +22 0 V
>  0 -377 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1695 512 24 380 BoxColFill
> +0.180 1683 512 23 380 BoxColFill
>  LCb setrgbcolor
> -1695 512 N
> +1683 512 N
>  0 379 V
> -23 0 V
> +22 0 V
>  0 -379 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1727 512 24 401 BoxColFill
> +0.180 1715 512 23 401 BoxColFill
>  LCb setrgbcolor
> -1727 512 N
> +1715 512 N
>  0 400 V
> -23 0 V
> +22 0 V
>  0 -400 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1759 512 24 408 BoxColFill
> +0.180 1746 512 24 408 BoxColFill
>  LCb setrgbcolor
> -1759 512 N
> +1746 512 N
>  0 407 V
>  23 0 V
>  0 -407 V
> @@ -3059,9 +3063,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1792 512 23 409 BoxColFill
> +0.180 1778 512 23 409 BoxColFill
>  LCb setrgbcolor
> -1792 512 N
> +1778 512 N
>  0 408 V
>  22 0 V
>  0 -408 V
> @@ -3070,9 +3074,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1824 512 23 372 BoxColFill
> +0.180 1810 512 23 372 BoxColFill
>  LCb setrgbcolor
> -1824 512 N
> +1810 512 N
>  0 371 V
>  22 0 V
>  0 -371 V
> @@ -3081,9 +3085,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1856 512 23 386 BoxColFill
> +0.180 1842 512 23 386 BoxColFill
>  LCb setrgbcolor
> -1856 512 N
> +1842 512 N
>  0 385 V
>  22 0 V
>  0 -385 V
> @@ -3092,20 +3096,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1888 512 23 393 BoxColFill
> +0.180 1873 512 24 393 BoxColFill
>  LCb setrgbcolor
> -1888 512 N
> +1873 512 N
>  0 392 V
> -22 0 V
> +23 0 V
>  0 -392 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1920 512 23 400 BoxColFill
> +0.180 1905 512 23 400 BoxColFill
>  LCb setrgbcolor
> -1920 512 N
> +1905 512 N
>  0 399 V
>  22 0 V
>  0 -399 V
> @@ -3114,64 +3118,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1952 512 24 402 BoxColFill
> +0.180 1937 512 23 402 BoxColFill
>  LCb setrgbcolor
> -1952 512 N
> +1937 512 N
>  0 401 V
> -23 0 V
> +22 0 V
>  0 -401 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1984 512 24 410 BoxColFill
> +0.180 1969 512 23 410 BoxColFill
>  LCb setrgbcolor
> -1984 512 N
> +1969 512 N
>  0 409 V
> -23 0 V
> +22 0 V
>  0 -409 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2016 512 24 418 BoxColFill
> +0.180 2001 512 23 418 BoxColFill
>  LCb setrgbcolor
> -2016 512 N
> +2001 512 N
>  0 417 V
> -23 0 V
> +22 0 V
>  0 -417 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2048 512 24 439 BoxColFill
> +0.180 2032 512 23 439 BoxColFill
>  LCb setrgbcolor
> -2048 512 N
> +2032 512 N
>  0 438 V
> -23 0 V
> +22 0 V
>  0 -438 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2080 512 24 443 BoxColFill
> +0.180 2064 512 23 443 BoxColFill
>  LCb setrgbcolor
> -2080 512 N
> +2064 512 N
>  0 442 V
> -23 0 V
> +22 0 V
>  0 -442 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2113 512 23 442 BoxColFill
> +0.180 2096 512 23 442 BoxColFill
>  LCb setrgbcolor
> -2113 512 N
> +2096 512 N
>  0 441 V
>  22 0 V
>  0 -441 V
> @@ -3180,9 +3184,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2145 512 23 450 BoxColFill
> +0.180 2128 512 23 450 BoxColFill
>  LCb setrgbcolor
> -2145 512 N
> +2128 512 N
>  0 449 V
>  22 0 V
>  0 -449 V
> @@ -3191,20 +3195,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2177 512 23 451 BoxColFill
> +0.180 2159 512 24 451 BoxColFill
>  LCb setrgbcolor
> -2177 512 N
> +2159 512 N
>  0 450 V
> -22 0 V
> +23 0 V
>  0 -450 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2209 512 23 456 BoxColFill
> +0.180 2191 512 23 456 BoxColFill
>  LCb setrgbcolor
> -2209 512 N
> +2191 512 N
>  0 455 V
>  22 0 V
>  0 -455 V
> @@ -3213,9 +3217,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2241 512 23 478 BoxColFill
> +0.180 2223 512 23 478 BoxColFill
>  LCb setrgbcolor
> -2241 512 N
> +2223 512 N
>  0 477 V
>  22 0 V
>  0 -477 V
> @@ -3224,20 +3228,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2273 512 24 483 BoxColFill
> +0.180 2255 512 23 483 BoxColFill
>  LCb setrgbcolor
> -2273 512 N
> +2255 512 N
>  0 482 V
> -23 0 V
> +22 0 V
>  0 -482 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2305 512 24 487 BoxColFill
> +0.180 2286 512 24 487 BoxColFill
>  LCb setrgbcolor
> -2305 512 N
> +2286 512 N
>  0 486 V
>  23 0 V
>  0 -486 V
> @@ -3246,53 +3250,53 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2337 512 24 492 BoxColFill
> +0.180 2318 512 23 492 BoxColFill
>  LCb setrgbcolor
> -2337 512 N
> +2318 512 N
>  0 491 V
> -23 0 V
> +22 0 V
>  0 -491 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2369 512 24 495 BoxColFill
> +0.180 2350 512 23 495 BoxColFill
>  LCb setrgbcolor
> -2369 512 N
> +2350 512 N
>  0 494 V
> -23 0 V
> +22 0 V
>  0 -494 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2401 512 24 497 BoxColFill
> +0.180 2382 512 23 497 BoxColFill
>  LCb setrgbcolor
> -2401 512 N
> +2382 512 N
>  0 496 V
> -23 0 V
> +22 0 V
>  0 -496 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2434 512 23 500 BoxColFill
> +0.180 2413 512 24 500 BoxColFill
>  LCb setrgbcolor
> -2434 512 N
> +2413 512 N
>  0 499 V
> -22 0 V
> +23 0 V
>  0 -499 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2466 512 23 507 BoxColFill
> +0.180 2445 512 23 507 BoxColFill
>  LCb setrgbcolor
> -2466 512 N
> +2445 512 N
>  0 506 V
>  22 0 V
>  0 -506 V
> @@ -3301,9 +3305,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2498 512 23 592 BoxColFill
> +0.180 2477 512 23 592 BoxColFill
>  LCb setrgbcolor
> -2498 512 N
> +2477 512 N
>  0 591 V
>  22 0 V
>  0 -591 V
> @@ -3312,9 +3316,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2530 512 23 536 BoxColFill
> +0.180 2509 512 23 536 BoxColFill
>  LCb setrgbcolor
> -2530 512 N
> +2509 512 N
>  0 535 V
>  22 0 V
>  0 -535 V
> @@ -3323,20 +3327,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2562 512 23 533 BoxColFill
> +0.180 2540 512 24 533 BoxColFill
>  LCb setrgbcolor
> -2562 512 N
> +2540 512 N
>  0 532 V
> -22 0 V
> +23 0 V
>  0 -532 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2594 512 23 535 BoxColFill
> +0.180 2572 512 23 535 BoxColFill
>  LCb setrgbcolor
> -2594 512 N
> +2572 512 N
>  0 534 V
>  22 0 V
>  0 -534 V
> @@ -3345,31 +3349,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2626 512 24 532 BoxColFill
> +0.180 2604 512 23 532 BoxColFill
>  LCb setrgbcolor
> -2626 512 N
> +2604 512 N
>  0 531 V
> -23 0 V
> +22 0 V
>  0 -531 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2658 512 24 532 BoxColFill
> +0.180 2636 512 23 532 BoxColFill
>  LCb setrgbcolor
> -2658 512 N
> +2636 512 N
>  0 531 V
> -23 0 V
> +22 0 V
>  0 -531 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2690 512 24 531 BoxColFill
> +0.180 2667 512 24 531 BoxColFill
>  LCb setrgbcolor
> -2690 512 N
> +2667 512 N
>  0 530 V
>  23 0 V
>  0 -530 V
> @@ -3378,20 +3382,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2722 512 24 539 BoxColFill
> +0.180 2699 512 23 539 BoxColFill
>  LCb setrgbcolor
> -2722 512 N
> +2699 512 N
>  0 538 V
> -23 0 V
> +22 0 V
>  0 -538 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2755 512 23 523 BoxColFill
> +0.180 2731 512 23 523 BoxColFill
>  LCb setrgbcolor
> -2755 512 N
> +2731 512 N
>  0 522 V
>  22 0 V
>  0 -522 V
> @@ -3400,9 +3404,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2787 512 23 527 BoxColFill
> +0.180 2763 512 23 527 BoxColFill
>  LCb setrgbcolor
> -2787 512 N
> +2763 512 N
>  0 526 V
>  22 0 V
>  0 -526 V
> @@ -3411,20 +3415,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2819 512 23 511 BoxColFill
> +0.180 2794 512 24 511 BoxColFill
>  LCb setrgbcolor
> -2819 512 N
> +2794 512 N
>  0 510 V
> -22 0 V
> +23 0 V
>  0 -510 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2851 512 23 509 BoxColFill
> +0.180 2826 512 23 509 BoxColFill
>  LCb setrgbcolor
> -2851 512 N
> +2826 512 N
>  0 508 V
>  22 0 V
>  0 -508 V
> @@ -3433,9 +3437,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2883 512 23 514 BoxColFill
> +0.180 2858 512 23 514 BoxColFill
>  LCb setrgbcolor
> -2883 512 N
> +2858 512 N
>  0 513 V
>  22 0 V
>  0 -513 V
> @@ -3444,9 +3448,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2915 512 23 532 BoxColFill
> +0.180 2890 512 23 532 BoxColFill
>  LCb setrgbcolor
> -2915 512 N
> +2890 512 N
>  0 531 V
>  22 0 V
>  0 -531 V
> @@ -3455,9 +3459,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2947 512 24 534 BoxColFill
> +0.180 2921 512 24 534 BoxColFill
>  LCb setrgbcolor
> -2947 512 N
> +2921 512 N
>  0 533 V
>  23 0 V
>  0 -533 V
> @@ -3466,42 +3470,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2979 512 24 542 BoxColFill
> +0.180 2953 512 23 542 BoxColFill
>  LCb setrgbcolor
> -2979 512 N
> +2953 512 N
>  0 541 V
> -23 0 V
> +22 0 V
>  0 -541 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3011 512 24 553 BoxColFill
> +0.180 2985 512 23 553 BoxColFill
>  LCb setrgbcolor
> -3011 512 N
> +2985 512 N
>  0 552 V
> -23 0 V
> +22 0 V
>  0 -552 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3043 512 24 602 BoxColFill
> +0.180 3017 512 23 602 BoxColFill
>  LCb setrgbcolor
> -3043 512 N
> +3017 512 N
>  0 601 V
> -23 0 V
> +22 0 V
>  0 -601 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3075 512 24 611 BoxColFill
> +0.180 3048 512 24 611 BoxColFill
>  LCb setrgbcolor
> -3075 512 N
> +3048 512 N
>  0 610 V
>  23 0 V
>  0 -610 V
> @@ -3510,9 +3514,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3108 512 23 618 BoxColFill
> +0.180 3080 512 23 618 BoxColFill
>  LCb setrgbcolor
> -3108 512 N
> +3080 512 N
>  0 617 V
>  22 0 V
>  0 -617 V
> @@ -3521,9 +3525,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3140 512 23 621 BoxColFill
> +0.180 3112 512 23 621 BoxColFill
>  LCb setrgbcolor
> -3140 512 N
> +3112 512 N
>  0 620 V
>  22 0 V
>  0 -620 V
> @@ -3532,9 +3536,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3172 512 23 656 BoxColFill
> +0.180 3144 512 23 656 BoxColFill
>  LCb setrgbcolor
> -3172 512 N
> +3144 512 N
>  0 655 V
>  22 0 V
>  0 -655 V
> @@ -3543,20 +3547,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3204 512 23 664 BoxColFill
> +0.180 3175 512 24 664 BoxColFill
>  LCb setrgbcolor
> -3204 512 N
> +3175 512 N
>  0 663 V
> -22 0 V
> +23 0 V
>  0 -663 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3236 512 23 669 BoxColFill
> +0.180 3207 512 23 669 BoxColFill
>  LCb setrgbcolor
> -3236 512 N
> +3207 512 N
>  0 668 V
>  22 0 V
>  0 -668 V
> @@ -3565,31 +3569,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3268 512 24 669 BoxColFill
> +0.180 3239 512 23 669 BoxColFill
>  LCb setrgbcolor
> -3268 512 N
> +3239 512 N
>  0 668 V
> -23 0 V
> +22 0 V
>  0 -668 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3300 512 24 669 BoxColFill
> +0.180 3271 512 23 669 BoxColFill
>  LCb setrgbcolor
> -3300 512 N
> +3271 512 N
>  0 668 V
> -23 0 V
> +22 0 V
>  0 -668 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3332 512 24 677 BoxColFill
> +0.180 3302 512 24 677 BoxColFill
>  LCb setrgbcolor
> -3332 512 N
> +3302 512 N
>  0 676 V
>  23 0 V
>  0 -676 V
> @@ -3598,31 +3602,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3364 512 24 680 BoxColFill
> +0.180 3334 512 23 680 BoxColFill
>  LCb setrgbcolor
> -3364 512 N
> +3334 512 N
>  0 679 V
> -23 0 V
> +22 0 V
>  0 -679 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3396 512 24 704 BoxColFill
> +0.180 3366 512 23 704 BoxColFill
>  LCb setrgbcolor
> -3396 512 N
> +3366 512 N
>  0 703 V
> -23 0 V
> +22 0 V
>  0 -703 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3429 512 23 706 BoxColFill
> +0.180 3398 512 23 706 BoxColFill
>  LCb setrgbcolor
> -3429 512 N
> +3398 512 N
>  0 705 V
>  22 0 V
>  0 -705 V
> @@ -3631,12 +3635,23 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3461 512 23 719 BoxColFill
> +0.180 3429 512 24 719 BoxColFill
>  LCb setrgbcolor
> -3461 512 N
> +3429 512 N
>  0 718 V
> -22 0 V
> +23 0 V
>  0 -718 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 3461 512 23 732 BoxColFill
> +LCb setrgbcolor
> +3461 512 N
> +0 731 V
> +22 0 V
> +0 -731 V
>  -22 0 V
>  Z stroke
>  1.000 UL
> @@ -3675,49 +3690,49 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 604 539 23 1 BoxColFill
> +0.180 603 539 24 1 BoxColFill
>  LCb setrgbcolor
> -604 539 N
> -22 0 V
> --22 0 V
> +603 539 N
> +23 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 636 547 24 1 BoxColFill
> +0.180 635 547 23 1 BoxColFill
>  LCb setrgbcolor
> -636 547 N
> -23 0 V
> --23 0 V
> +635 547 N
> +22 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 668 549 24 19 BoxColFill
> +0.180 667 549 23 19 BoxColFill
>  LCb setrgbcolor
> -668 549 N
> +667 549 N
>  0 18 V
> -23 0 V
> +22 0 V
>  0 -18 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 700 543 24 21 BoxColFill
> +0.180 699 543 23 21 BoxColFill
>  LCb setrgbcolor
> -700 543 N
> +699 543 N
>  0 20 V
> -23 0 V
> +22 0 V
>  0 -20 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 732 543 24 22 BoxColFill
> +0.180 730 543 24 22 BoxColFill
>  LCb setrgbcolor
> -732 543 N
> +730 543 N
>  0 21 V
>  23 0 V
>  0 -21 V
> @@ -3726,20 +3741,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 764 544 24 26 BoxColFill
> +0.180 762 544 23 26 BoxColFill
>  LCb setrgbcolor
> -764 544 N
> +762 544 N
>  0 25 V
> -23 0 V
> +22 0 V
>  0 -25 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 797 555 23 35 BoxColFill
> +0.180 794 555 23 35 BoxColFill
>  LCb setrgbcolor
> -797 555 N
> +794 555 N
>  0 34 V
>  22 0 V
>  0 -34 V
> @@ -3748,9 +3763,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 829 555 23 35 BoxColFill
> +0.180 826 555 23 35 BoxColFill
>  LCb setrgbcolor
> -829 555 N
> +826 555 N
>  0 34 V
>  22 0 V
>  0 -34 V
> @@ -3759,20 +3774,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 861 555 23 35 BoxColFill
> +0.180 857 555 24 35 BoxColFill
>  LCb setrgbcolor
> -861 555 N
> +857 555 N
>  0 34 V
> -22 0 V
> +23 0 V
>  0 -34 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 893 555 23 35 BoxColFill
> +0.180 889 555 23 35 BoxColFill
>  LCb setrgbcolor
> -893 555 N
> +889 555 N
>  0 34 V
>  22 0 V
>  0 -34 V
> @@ -3781,9 +3796,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 925 555 23 35 BoxColFill
> +0.180 921 555 23 35 BoxColFill
>  LCb setrgbcolor
> -925 555 N
> +921 555 N
>  0 34 V
>  22 0 V
>  0 -34 V
> @@ -3792,20 +3807,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 957 556 24 35 BoxColFill
> +0.180 953 556 23 35 BoxColFill
>  LCb setrgbcolor
> -957 556 N
> +953 556 N
>  0 34 V
> -23 0 V
> +22 0 V
>  0 -34 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 989 621 24 35 BoxColFill
> +0.180 984 621 24 35 BoxColFill
>  LCb setrgbcolor
> -989 621 N
> +984 621 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3814,53 +3829,53 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1021 620 24 36 BoxColFill
> +0.180 1016 620 23 36 BoxColFill
>  LCb setrgbcolor
> -1021 620 N
> +1016 620 N
>  0 35 V
> -23 0 V
> +22 0 V
>  0 -35 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1053 649 24 41 BoxColFill
> +0.180 1048 649 23 41 BoxColFill
>  LCb setrgbcolor
> -1053 649 N
> +1048 649 N
>  0 40 V
> -23 0 V
> +22 0 V
>  0 -40 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1085 656 24 41 BoxColFill
> +0.180 1080 656 23 41 BoxColFill
>  LCb setrgbcolor
> -1085 656 N
> +1080 656 N
>  0 40 V
> -23 0 V
> +22 0 V
>  0 -40 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1118 736 23 43 BoxColFill
> +0.180 1111 736 24 43 BoxColFill
>  LCb setrgbcolor
> -1118 736 N
> +1111 736 N
>  0 42 V
> -22 0 V
> +23 0 V
>  0 -42 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1150 737 23 44 BoxColFill
> +0.180 1143 737 23 44 BoxColFill
>  LCb setrgbcolor
> -1150 737 N
> +1143 737 N
>  0 43 V
>  22 0 V
>  0 -43 V
> @@ -3869,9 +3884,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1182 741 23 44 BoxColFill
> +0.180 1175 741 23 44 BoxColFill
>  LCb setrgbcolor
> -1182 741 N
> +1175 741 N
>  0 43 V
>  22 0 V
>  0 -43 V
> @@ -3880,9 +3895,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1214 667 23 45 BoxColFill
> +0.180 1207 667 23 45 BoxColFill
>  LCb setrgbcolor
> -1214 667 N
> +1207 667 N
>  0 44 V
>  22 0 V
>  0 -44 V
> @@ -3891,20 +3906,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1246 694 23 45 BoxColFill
> +0.180 1238 694 24 45 BoxColFill
>  LCb setrgbcolor
> -1246 694 N
> +1238 694 N
>  0 44 V
> -22 0 V
> +23 0 V
>  0 -44 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1278 714 23 49 BoxColFill
> +0.180 1270 714 23 49 BoxColFill
>  LCb setrgbcolor
> -1278 714 N
> +1270 714 N
>  0 48 V
>  22 0 V
>  0 -48 V
> @@ -3913,31 +3928,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1310 722 24 49 BoxColFill
> +0.180 1302 722 23 49 BoxColFill
>  LCb setrgbcolor
> -1310 722 N
> +1302 722 N
>  0 48 V
> -23 0 V
> +22 0 V
>  0 -48 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1342 731 24 48 BoxColFill
> +0.180 1334 731 23 48 BoxColFill
>  LCb setrgbcolor
> -1342 731 N
> +1334 731 N
>  0 47 V
> -23 0 V
> +22 0 V
>  0 -47 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1374 758 24 49 BoxColFill
> +0.180 1365 758 24 49 BoxColFill
>  LCb setrgbcolor
> -1374 758 N
> +1365 758 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3946,20 +3961,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1406 782 24 58 BoxColFill
> +0.180 1397 782 23 58 BoxColFill
>  LCb setrgbcolor
> -1406 782 N
> +1397 782 N
>  0 57 V
> -23 0 V
> +22 0 V
>  0 -57 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1439 783 23 58 BoxColFill
> +0.180 1429 783 23 58 BoxColFill
>  LCb setrgbcolor
> -1439 783 N
> +1429 783 N
>  0 57 V
>  22 0 V
>  0 -57 V
> @@ -3968,9 +3983,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1471 824 23 57 BoxColFill
> +0.180 1461 824 23 57 BoxColFill
>  LCb setrgbcolor
> -1471 824 N
> +1461 824 N
>  0 56 V
>  22 0 V
>  0 -56 V
> @@ -3979,20 +3994,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1503 824 23 57 BoxColFill
> +0.180 1492 824 24 57 BoxColFill
>  LCb setrgbcolor
> -1503 824 N
> +1492 824 N
>  0 56 V
> -22 0 V
> +23 0 V
>  0 -56 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1535 830 23 57 BoxColFill
> +0.180 1524 830 23 57 BoxColFill
>  LCb setrgbcolor
> -1535 830 N
> +1524 830 N
>  0 56 V
>  22 0 V
>  0 -56 V
> @@ -4001,9 +4016,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1567 848 23 65 BoxColFill
> +0.180 1556 848 23 65 BoxColFill
>  LCb setrgbcolor
> -1567 848 N
> +1556 848 N
>  0 64 V
>  22 0 V
>  0 -64 V
> @@ -4012,9 +4027,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1599 867 23 67 BoxColFill
> +0.180 1588 867 23 67 BoxColFill
>  LCb setrgbcolor
> -1599 867 N
> +1588 867 N
>  0 66 V
>  22 0 V
>  0 -66 V
> @@ -4023,9 +4038,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1631 889 24 75 BoxColFill
> +0.180 1619 889 24 75 BoxColFill
>  LCb setrgbcolor
> -1631 889 N
> +1619 889 N
>  0 74 V
>  23 0 V
>  0 -74 V
> @@ -4034,42 +4049,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1663 889 24 76 BoxColFill
> +0.180 1651 889 23 76 BoxColFill
>  LCb setrgbcolor
> -1663 889 N
> +1651 889 N
>  0 75 V
> -23 0 V
> +22 0 V
>  0 -75 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1695 891 24 76 BoxColFill
> +0.180 1683 891 23 76 BoxColFill
>  LCb setrgbcolor
> -1695 891 N
> +1683 891 N
>  0 75 V
> -23 0 V
> +22 0 V
>  0 -75 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1727 912 24 76 BoxColFill
> +0.180 1715 912 23 76 BoxColFill
>  LCb setrgbcolor
> -1727 912 N
> +1715 912 N
>  0 75 V
> -23 0 V
> +22 0 V
>  0 -75 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1759 919 24 77 BoxColFill
> +0.180 1746 919 24 77 BoxColFill
>  LCb setrgbcolor
> -1759 919 N
> +1746 919 N
>  0 76 V
>  23 0 V
>  0 -76 V
> @@ -4078,9 +4093,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1792 920 23 78 BoxColFill
> +0.180 1778 920 23 78 BoxColFill
>  LCb setrgbcolor
> -1792 920 N
> +1778 920 N
>  0 77 V
>  22 0 V
>  0 -77 V
> @@ -4089,9 +4104,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1824 883 23 76 BoxColFill
> +0.180 1810 883 23 76 BoxColFill
>  LCb setrgbcolor
> -1824 883 N
> +1810 883 N
>  0 75 V
>  22 0 V
>  0 -75 V
> @@ -4100,9 +4115,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1856 897 23 75 BoxColFill
> +0.180 1842 897 23 75 BoxColFill
>  LCb setrgbcolor
> -1856 897 N
> +1842 897 N
>  0 74 V
>  22 0 V
>  0 -74 V
> @@ -4111,20 +4126,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1888 904 23 75 BoxColFill
> +0.180 1873 904 24 75 BoxColFill
>  LCb setrgbcolor
> -1888 904 N
> +1873 904 N
>  0 74 V
> -22 0 V
> +23 0 V
>  0 -74 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1920 911 23 119 BoxColFill
> +0.180 1905 911 23 119 BoxColFill
>  LCb setrgbcolor
> -1920 911 N
> +1905 911 N
>  0 118 V
>  22 0 V
>  0 -118 V
> @@ -4133,64 +4148,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1952 913 24 135 BoxColFill
> +0.180 1937 913 23 135 BoxColFill
>  LCb setrgbcolor
> -1952 913 N
> +1937 913 N
>  0 134 V
> -23 0 V
> +22 0 V
>  0 -134 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1984 921 24 141 BoxColFill
> +0.180 1969 921 23 141 BoxColFill
>  LCb setrgbcolor
> -1984 921 N
> +1969 921 N
>  0 140 V
> -23 0 V
> +22 0 V
>  0 -140 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2016 929 24 142 BoxColFill
> +0.180 2001 929 23 142 BoxColFill
>  LCb setrgbcolor
> -2016 929 N
> +2001 929 N
>  0 141 V
> -23 0 V
> +22 0 V
>  0 -141 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2048 950 24 147 BoxColFill
> +0.180 2032 950 23 147 BoxColFill
>  LCb setrgbcolor
> -2048 950 N
> +2032 950 N
>  0 146 V
> -23 0 V
> +22 0 V
>  0 -146 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2080 954 24 147 BoxColFill
> +0.180 2064 954 23 147 BoxColFill
>  LCb setrgbcolor
> -2080 954 N
> +2064 954 N
>  0 146 V
> -23 0 V
> +22 0 V
>  0 -146 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2113 953 23 148 BoxColFill
> +0.180 2096 953 23 148 BoxColFill
>  LCb setrgbcolor
> -2113 953 N
> +2096 953 N
>  0 147 V
>  22 0 V
>  0 -147 V
> @@ -4199,9 +4214,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2145 961 23 149 BoxColFill
> +0.180 2128 961 23 149 BoxColFill
>  LCb setrgbcolor
> -2145 961 N
> +2128 961 N
>  0 148 V
>  22 0 V
>  0 -148 V
> @@ -4210,20 +4225,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2177 962 23 151 BoxColFill
> +0.180 2159 962 24 151 BoxColFill
>  LCb setrgbcolor
> -2177 962 N
> +2159 962 N
>  0 150 V
> -22 0 V
> +23 0 V
>  0 -150 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2209 967 23 151 BoxColFill
> +0.180 2191 967 23 151 BoxColFill
>  LCb setrgbcolor
> -2209 967 N
> +2191 967 N
>  0 150 V
>  22 0 V
>  0 -150 V
> @@ -4232,9 +4247,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2241 989 23 151 BoxColFill
> +0.180 2223 989 23 151 BoxColFill
>  LCb setrgbcolor
> -2241 989 N
> +2223 989 N
>  0 150 V
>  22 0 V
>  0 -150 V
> @@ -4243,20 +4258,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2273 994 24 154 BoxColFill
> +0.180 2255 994 23 154 BoxColFill
>  LCb setrgbcolor
> -2273 994 N
> +2255 994 N
>  0 153 V
> -23 0 V
> +22 0 V
>  0 -153 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2305 998 24 154 BoxColFill
> +0.180 2286 998 24 154 BoxColFill
>  LCb setrgbcolor
> -2305 998 N
> +2286 998 N
>  0 153 V
>  23 0 V
>  0 -153 V
> @@ -4265,53 +4280,53 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2337 1003 24 190 BoxColFill
> +0.180 2318 1003 23 190 BoxColFill
>  LCb setrgbcolor
> -2337 1003 N
> +2318 1003 N
>  0 189 V
> -23 0 V
> +22 0 V
>  0 -189 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2369 1006 24 192 BoxColFill
> +0.180 2350 1006 23 192 BoxColFill
>  LCb setrgbcolor
> -2369 1006 N
> +2350 1006 N
>  0 191 V
> -23 0 V
> +22 0 V
>  0 -191 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2401 1008 24 192 BoxColFill
> +0.180 2382 1008 23 192 BoxColFill
>  LCb setrgbcolor
> -2401 1008 N
> +2382 1008 N
>  0 191 V
> -23 0 V
> +22 0 V
>  0 -191 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2434 1011 23 192 BoxColFill
> +0.180 2413 1011 24 192 BoxColFill
>  LCb setrgbcolor
> -2434 1011 N
> +2413 1011 N
>  0 191 V
> -22 0 V
> +23 0 V
>  0 -191 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2466 1018 23 192 BoxColFill
> +0.180 2445 1018 23 192 BoxColFill
>  LCb setrgbcolor
> -2466 1018 N
> +2445 1018 N
>  0 191 V
>  22 0 V
>  0 -191 V
> @@ -4320,9 +4335,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2498 1103 23 194 BoxColFill
> +0.180 2477 1103 23 194 BoxColFill
>  LCb setrgbcolor
> -2498 1103 N
> +2477 1103 N
>  0 193 V
>  22 0 V
>  0 -193 V
> @@ -4331,9 +4346,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2530 1047 23 197 BoxColFill
> +0.180 2509 1047 23 197 BoxColFill
>  LCb setrgbcolor
> -2530 1047 N
> +2509 1047 N
>  0 196 V
>  22 0 V
>  0 -196 V
> @@ -4342,20 +4357,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2562 1044 23 198 BoxColFill
> +0.180 2540 1044 24 198 BoxColFill
>  LCb setrgbcolor
> -2562 1044 N
> +2540 1044 N
>  0 197 V
> -22 0 V
> +23 0 V
>  0 -197 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2594 1046 23 199 BoxColFill
> +0.180 2572 1046 23 199 BoxColFill
>  LCb setrgbcolor
> -2594 1046 N
> +2572 1046 N
>  0 198 V
>  22 0 V
>  0 -198 V
> @@ -4364,31 +4379,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2626 1043 24 197 BoxColFill
> +0.180 2604 1043 23 197 BoxColFill
>  LCb setrgbcolor
> -2626 1043 N
> +2604 1043 N
>  0 196 V
> -23 0 V
> +22 0 V
>  0 -196 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2658 1043 24 198 BoxColFill
> +0.180 2636 1043 23 198 BoxColFill
>  LCb setrgbcolor
> -2658 1043 N
> +2636 1043 N
>  0 197 V
> -23 0 V
> +22 0 V
>  0 -197 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2690 1042 24 200 BoxColFill
> +0.180 2667 1042 24 200 BoxColFill
>  LCb setrgbcolor
> -2690 1042 N
> +2667 1042 N
>  0 199 V
>  23 0 V
>  0 -199 V
> @@ -4397,20 +4412,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2722 1050 24 207 BoxColFill
> +0.180 2699 1050 23 207 BoxColFill
>  LCb setrgbcolor
> -2722 1050 N
> +2699 1050 N
>  0 206 V
> -23 0 V
> +22 0 V
>  0 -206 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2755 1034 23 210 BoxColFill
> +0.180 2731 1034 23 210 BoxColFill
>  LCb setrgbcolor
> -2755 1034 N
> +2731 1034 N
>  0 209 V
>  22 0 V
>  0 -209 V
> @@ -4419,9 +4434,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2787 1038 23 295 BoxColFill
> +0.180 2763 1038 23 295 BoxColFill
>  LCb setrgbcolor
> -2787 1038 N
> +2763 1038 N
>  0 294 V
>  22 0 V
>  0 -294 V
> @@ -4430,20 +4445,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2819 1022 23 220 BoxColFill
> +0.180 2794 1022 24 220 BoxColFill
>  LCb setrgbcolor
> -2819 1022 N
> +2794 1022 N
>  0 219 V
> -22 0 V
> +23 0 V
>  0 -219 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2851 1020 23 211 BoxColFill
> +0.180 2826 1020 23 211 BoxColFill
>  LCb setrgbcolor
> -2851 1020 N
> +2826 1020 N
>  0 210 V
>  22 0 V
>  0 -210 V
> @@ -4452,9 +4467,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2883 1025 23 214 BoxColFill
> +0.180 2858 1025 23 214 BoxColFill
>  LCb setrgbcolor
> -2883 1025 N
> +2858 1025 N
>  0 213 V
>  22 0 V
>  0 -213 V
> @@ -4463,9 +4478,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2915 1043 23 215 BoxColFill
> +0.180 2890 1043 23 215 BoxColFill
>  LCb setrgbcolor
> -2915 1043 N
> +2890 1043 N
>  0 214 V
>  22 0 V
>  0 -214 V
> @@ -4474,9 +4489,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2947 1045 24 216 BoxColFill
> +0.180 2921 1045 24 216 BoxColFill
>  LCb setrgbcolor
> -2947 1045 N
> +2921 1045 N
>  0 215 V
>  23 0 V
>  0 -215 V
> @@ -4485,42 +4500,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2979 1053 24 221 BoxColFill
> +0.180 2953 1053 23 221 BoxColFill
>  LCb setrgbcolor
> -2979 1053 N
> +2953 1053 N
>  0 220 V
> -23 0 V
> +22 0 V
>  0 -220 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3011 1064 24 224 BoxColFill
> +0.180 2985 1064 23 224 BoxColFill
>  LCb setrgbcolor
> -3011 1064 N
> +2985 1064 N
>  0 223 V
> -23 0 V
> +22 0 V
>  0 -223 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3043 1113 24 230 BoxColFill
> +0.180 3017 1113 23 230 BoxColFill
>  LCb setrgbcolor
> -3043 1113 N
> +3017 1113 N
>  0 229 V
> -23 0 V
> +22 0 V
>  0 -229 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3075 1122 24 270 BoxColFill
> +0.180 3048 1122 24 270 BoxColFill
>  LCb setrgbcolor
> -3075 1122 N
> +3048 1122 N
>  0 269 V
>  23 0 V
>  0 -269 V
> @@ -4529,9 +4544,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3108 1129 23 274 BoxColFill
> +0.180 3080 1129 23 274 BoxColFill
>  LCb setrgbcolor
> -3108 1129 N
> +3080 1129 N
>  0 273 V
>  22 0 V
>  0 -273 V
> @@ -4540,9 +4555,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3140 1132 23 279 BoxColFill
> +0.180 3112 1132 23 279 BoxColFill
>  LCb setrgbcolor
> -3140 1132 N
> +3112 1132 N
>  0 278 V
>  22 0 V
>  0 -278 V
> @@ -4551,9 +4566,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3172 1167 23 312 BoxColFill
> +0.180 3144 1167 23 312 BoxColFill
>  LCb setrgbcolor
> -3172 1167 N
> +3144 1167 N
>  0 311 V
>  22 0 V
>  0 -311 V
> @@ -4562,20 +4577,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3204 1175 23 331 BoxColFill
> +0.180 3175 1175 24 331 BoxColFill
>  LCb setrgbcolor
> -3204 1175 N
> +3175 1175 N
>  0 330 V
> -22 0 V
> +23 0 V
>  0 -330 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3236 1180 23 346 BoxColFill
> +0.180 3207 1180 23 346 BoxColFill
>  LCb setrgbcolor
> -3236 1180 N
> +3207 1180 N
>  0 345 V
>  22 0 V
>  0 -345 V
> @@ -4584,31 +4599,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3268 1180 24 358 BoxColFill
> +0.180 3239 1180 23 358 BoxColFill
>  LCb setrgbcolor
> -3268 1180 N
> +3239 1180 N
>  0 357 V
> -23 0 V
> +22 0 V
>  0 -357 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3300 1180 24 359 BoxColFill
> +0.180 3271 1180 23 359 BoxColFill
>  LCb setrgbcolor
> -3300 1180 N
> +3271 1180 N
>  0 358 V
> -23 0 V
> +22 0 V
>  0 -358 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3332 1188 24 362 BoxColFill
> +0.180 3302 1188 24 362 BoxColFill
>  LCb setrgbcolor
> -3332 1188 N
> +3302 1188 N
>  0 361 V
>  23 0 V
>  0 -361 V
> @@ -4617,31 +4632,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3364 1191 24 365 BoxColFill
> +0.180 3334 1191 23 365 BoxColFill
>  LCb setrgbcolor
> -3364 1191 N
> +3334 1191 N
>  0 364 V
> -23 0 V
> +22 0 V
>  0 -364 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3396 1215 24 368 BoxColFill
> +0.180 3366 1215 23 368 BoxColFill
>  LCb setrgbcolor
> -3396 1215 N
> +3366 1215 N
>  0 367 V
> -23 0 V
> +22 0 V
>  0 -367 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3429 1217 23 371 BoxColFill
> +0.180 3398 1217 23 371 BoxColFill
>  LCb setrgbcolor
> -3429 1217 N
> +3398 1217 N
>  0 370 V
>  22 0 V
>  0 -370 V
> @@ -4650,12 +4665,23 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3461 1230 23 378 BoxColFill
> +0.180 3429 1230 24 378 BoxColFill
>  LCb setrgbcolor
> -3461 1230 N
> +3429 1230 N
>  0 377 V
> -22 0 V
> +23 0 V
>  0 -377 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 3461 1243 23 388 BoxColFill
> +LCb setrgbcolor
> +3461 1243 N
> +0 387 V
> +22 0 V
> +0 -387 V
>  -22 0 V
>  Z stroke
>  1.000 UL
> @@ -4678,95 +4704,96 @@ LTb
>  255 0 V
>  583 512 M
>  32 0 V
> -32 0 V
> +31 0 V
>  32 778 V
>  32 193 V
> -33 -5 V
> -32 87 V
> +32 -5 V
> +31 87 V
>  32 29 V
>  32 3 V
>  32 0 V
> -32 -5 V
> +31 -5 V
>  32 0 V
>  32 -17 V
>  32 -483 V
> -32 2 V
> -33 -38 V
> +31 2 V
> +32 -38 V
>  32 -20 V
>  32 -140 V
> -32 0 V
> +31 0 V
>  32 -5 V
>  32 150 V
>  32 -51 V
> -32 -17 V
> +31 -17 V
>  32 -14 V
>  32 -15 V
> -33 -38 V
> -32 24 V
> +32 -38 V
> +31 24 V
>  32 -2 V
>  32 -46 V
>  32 0 V
> -32 -8 V
> +31 -8 V
>  32 20 V
>  32 -3 V
>  32 17 V
> -32 3 V
> -33 4 V
> +31 3 V
> +32 4 V
>  32 -21 V
>  32 0 V
> -32 0 V
> +31 0 V
>  32 26 V
>  32 -19 V
>  32 -5 V
> -32 169 V
> +31 169 V
>  32 51 V
>  32 14 V
> -33 -7 V
>  32 -7 V
> +31 -7 V
>  32 -5 V
>  32 5 V
>  32 -5 V
> -32 5 V
> +31 5 V
>  32 -2 V
>  32 -22 V
>  32 0 V
> -32 -3 V
> +31 -3 V
>  32 95 V
> -33 2 V
> +32 2 V
>  32 -2 V
> -32 -3 V
> +31 -3 V
>  32 -5 V
>  32 -70 V
>  32 53 V
> -32 8 V
> +31 8 V
>  32 -3 V
>  32 -2 V
>  32 2 V
> -33 5 V
> +31 5 V
>  32 12 V
>  32 22 V
>  32 176 V
> -32 -142 V
> +31 -142 V
>  32 -20 V
>  32 5 V
>  32 -14 V
> -32 -3 V
> +31 -3 V
>  32 5 V
> -33 -2 V
> +32 -2 V
>  32 -29 V
> -32 72 V
> +31 72 V
>  32 3 V
>  32 5 V
>  32 31 V
> -32 24 V
> +31 24 V
>  32 19 V
>  32 20 V
>  32 2 V
> -33 0 V
> +31 0 V
>  32 -2 V
>  32 -10 V
>  32 0 V
> -32 0 V
> +31 0 V
> +32 5 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index d315a33207eb..7f8f52b5f56f 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -89,3 +89,4 @@ v5.16 19359 10362 29721 34.9
>  ""    20354 10656 31010 34.4
>  v6.0  20422 10716 31138 34.4
>  ""    20804 10922 31726 34.4
> +""    21170 11212 32382 34.6
> 
> base-commit: abc4079e97a352bc9e4dfea87a64b175030ce0b6
> -- 
> 2.25.1
> 
