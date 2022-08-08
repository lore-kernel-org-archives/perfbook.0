Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiHHP4i (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 8 Aug 2022 11:56:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C3AB1DD
        for <perfbook@vger.kernel.org>; Mon,  8 Aug 2022 08:56:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B14060FB3
        for <perfbook@vger.kernel.org>; Mon,  8 Aug 2022 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659974193;
        bh=k2b9Ycz8EWQudAUGeoOD3KjB2CrptaPiUXMq85awvwY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gh/yMibMmtHzKsM0ZaJWF6nrHq0suOJmjWeWGfyA5LnqCSOdz5+Opy7AdTh+Y4rJI
         QREnLliS0aF0IhJSt+gP8v7r/92QlU5a/PPmXdqRz2s79Ct5xFBqpwICJzVinoEf32
         w9M1eAmJEDmOAUc7GqwSq/tUNObx1frLSNYN10ruCDvbO213EUON0GCOxnHLbE0pWw
         9CIqfCTI2qOww1jtlnNTy9sCMSLfU5t3IbSNmcae55HskcN86CRzgVcgZ4YUs06Uoy
         Furnt6TwUTU4GbxwGebR6D+oXPCevF48LLO5BRLsqqi4W732LyB1fyns97NYCvXMI1
         M0vKMuvf2mmGg==
Date: Mon, 8 Aug 2022 08:56:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] formal: Update RCU-test-ratio table as of v5.19
Message-ID: <20220808155633.GF2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <79a69f8a-bde3-d4b3-7a75-bc5bff52d7c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a69f8a-bde3-d4b3-7a75-bc5bff52d7c8@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 08, 2022 at 06:31:53PM +0900, Akira Yokosawa wrote:
> Routine update of Figure 12.4.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you very much!

Looks like the main addition was resizing SRCU automatically.

							Thanx, Paul

> ---
>  CodeSamples/formal/data/RCU-test-ratio.eps | 1185 ++++++++++----------
>  CodeSamples/formal/data/rcu-test.dat       |    3 +-
>  2 files changed, 608 insertions(+), 580 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index 6a76a7247f0a..0439d42475e7 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
>  %%Creator: gnuplot 5.2 patchlevel 8
> -%%CreationDate: Mon May 23 08:39:12 2022
> +%%CreationDate: Mon Aug  8 18:09:51 2022
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 453 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.2 patchlevel 8)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Mon May 23 08:39:12 2022)
> +  /CreationDate (Mon Aug  8 18:09:51 2022)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -2013,17 +2013,17 @@ LCb setrgbcolor
>  stroke
>  LTb
>  LCb setrgbcolor
> -651 512 M
> +649 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -684 512 M
> +682 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -717 512 M
> +715 512 M
>  stroke
> -717 464 M
> +715 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
>  ] -26.7 MRshow
> @@ -2032,21 +2032,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -750 512 M
> +748 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -783 512 M
> +781 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -816 512 M
> +813 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -850 512 M
> +846 512 M
>  stroke
> -850 464 M
> +846 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
>  ] -26.7 MRshow
> @@ -2055,21 +2055,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -883 512 M
> +879 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -916 512 M
> +912 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -949 512 M
> +945 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -982 512 M
> +978 512 M
>  stroke
> -982 464 M
> +978 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
>  ] -26.7 MRshow
> @@ -2078,21 +2078,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1016 512 M
> +1010 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1049 512 M
> +1043 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1082 512 M
> +1076 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1115 512 M
> +1109 512 M
>  stroke
> -1115 464 M
> +1109 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
>  ] -26.7 MRshow
> @@ -2101,21 +2101,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1148 512 M
> +1142 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1181 512 M
> +1174 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1215 512 M
> +1207 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1248 512 M
> +1240 512 M
>  stroke
> -1248 464 M
> +1240 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
>  ] -26.7 MRshow
> @@ -2124,21 +2124,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1281 512 M
> +1273 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1314 512 M
> +1306 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1347 512 M
> +1338 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1380 512 M
> +1371 512 M
>  stroke
> -1380 464 M
> +1371 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
>  ] -26.7 MRshow
> @@ -2147,21 +2147,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1414 512 M
> +1404 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1447 512 M
> +1437 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1480 512 M
> +1470 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1513 512 M
> +1503 512 M
>  stroke
> -1513 464 M
> +1503 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
>  ] -26.7 MRshow
> @@ -2170,21 +2170,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1546 512 M
> +1535 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1580 512 M
> +1568 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1613 512 M
> +1601 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1646 512 M
> +1634 512 M
>  stroke
> -1646 464 M
> +1634 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
>  ] -26.7 MRshow
> @@ -2193,21 +2193,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1679 512 M
> +1667 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1712 512 M
> +1699 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1745 512 M
> +1732 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1779 512 M
> +1765 512 M
>  stroke
> -1779 464 M
> +1765 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
>  ] -26.7 MRshow
> @@ -2216,21 +2216,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1812 512 M
> +1798 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1845 512 M
> +1831 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1878 512 M
> +1863 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1911 512 M
> +1896 512 M
>  stroke
> -1911 464 M
> +1896 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
>  ] -26.7 MRshow
> @@ -2239,21 +2239,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1945 512 M
> +1929 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1978 512 M
> +1962 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2011 512 M
> +1995 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2044 512 M
> +2028 512 M
>  stroke
> -2044 464 M
> +2028 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
>  ] -26.7 MRshow
> @@ -2262,21 +2262,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2077 512 M
> +2060 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2110 512 M
> +2093 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2144 512 M
> +2126 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2177 512 M
> +2159 512 M
>  stroke
> -2177 464 M
> +2159 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
>  ] -26.7 MRshow
> @@ -2285,21 +2285,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2210 512 M
> +2192 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2243 512 M
> +2224 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2276 512 M
> +2257 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2310 512 M
> +2290 512 M
>  stroke
> -2310 464 M
> +2290 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
>  ] -26.7 MRshow
> @@ -2308,21 +2308,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2343 512 M
> +2323 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2376 512 M
> +2356 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2409 512 M
> +2388 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2442 512 M
> +2421 512 M
>  stroke
> -2442 464 M
> +2421 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
>  ] -26.7 MRshow
> @@ -2331,21 +2331,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2475 512 M
> +2454 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2509 512 M
> +2487 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2542 512 M
> +2520 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2575 512 M
> +2552 512 M
>  stroke
> -2575 464 M
> +2552 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
>  ] -26.7 MRshow
> @@ -2354,21 +2354,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2608 512 M
> +2585 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2641 512 M
> +2618 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2675 512 M
> +2651 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2708 512 M
> +2684 512 M
>  stroke
> -2708 464 M
> +2684 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
>  ] -26.7 MRshow
> @@ -2377,25 +2377,25 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2741 512 M
> +2717 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2774 512 M
> +2749 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2807 512 M
> +2782 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2840 512 M
> +2815 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2874 512 M
> +2848 512 M
>  stroke
> -2874 464 M
> +2848 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
>  ] -26.7 MRshow
> @@ -2404,21 +2404,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2907 512 M
> +2881 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2940 512 M
> +2913 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2973 512 M
> +2946 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3006 512 M
> +2979 512 M
>  stroke
> -3006 464 M
> +2979 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
>  ] -26.7 MRshow
> @@ -2427,21 +2427,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3039 512 M
> +3012 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3073 512 M
> +3045 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3106 512 M
> +3077 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3139 512 M
> +3110 512 M
>  stroke
> -3139 464 M
> +3110 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
>  ] -26.7 MRshow
> @@ -2450,21 +2450,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3172 512 M
> +3143 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3205 512 M
> +3176 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3239 512 M
> +3209 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3272 512 M
> +3242 512 M
>  stroke
> -3272 464 M
> +3242 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
>  ] -26.7 MRshow
> @@ -2473,21 +2473,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3305 512 M
> +3274 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3338 512 M
> +3307 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3371 512 M
> +3340 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3404 512 M
> +3373 512 M
>  stroke
> -3404 464 M
> +3373 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.16)]
>  ] -26.7 MRshow
> @@ -2496,6 +2496,10 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> +3406 512 M
> +stroke
> +LTb
> +LCb setrgbcolor
>  3438 512 M
>  stroke
>  LTb
> @@ -2504,7 +2508,7 @@ LCb setrgbcolor
>  stroke
>  3471 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.18)]
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.19)]
>  ] -26.7 MRshow
>  grestore
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2629,9 +2633,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 573 512 24 28 BoxColFill
> +0.180 572 512 24 28 BoxColFill
>  LCb setrgbcolor
> -573 512 N
> +572 512 N
>  0 27 V
>  23 0 V
>  0 -27 V
> @@ -2640,9 +2644,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 606 512 24 28 BoxColFill
> +0.180 605 512 24 28 BoxColFill
>  LCb setrgbcolor
> -606 512 N
> +605 512 N
>  0 27 V
>  23 0 V
>  0 -27 V
> @@ -2651,9 +2655,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 639 512 24 36 BoxColFill
> +0.180 638 512 24 36 BoxColFill
>  LCb setrgbcolor
> -639 512 N
> +638 512 N
>  0 35 V
>  23 0 V
>  0 -35 V
> @@ -2662,9 +2666,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 672 512 24 38 BoxColFill
> +0.180 671 512 24 38 BoxColFill
>  LCb setrgbcolor
> -672 512 N
> +671 512 N
>  0 37 V
>  23 0 V
>  0 -37 V
> @@ -2673,31 +2677,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 705 512 25 32 BoxColFill
> +0.180 704 512 24 32 BoxColFill
>  LCb setrgbcolor
> -705 512 N
> +704 512 N
>  0 31 V
> -24 0 V
> +23 0 V
>  0 -31 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 738 512 25 32 BoxColFill
> +0.180 736 512 24 32 BoxColFill
>  LCb setrgbcolor
> -738 512 N
> +736 512 N
>  0 31 V
> -24 0 V
> +23 0 V
>  0 -31 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 772 512 24 33 BoxColFill
> +0.180 769 512 24 33 BoxColFill
>  LCb setrgbcolor
> -772 512 N
> +769 512 N
>  0 32 V
>  23 0 V
>  0 -32 V
> @@ -2706,9 +2710,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 805 512 24 44 BoxColFill
> +0.180 802 512 24 44 BoxColFill
>  LCb setrgbcolor
> -805 512 N
> +802 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2717,9 +2721,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 838 512 24 44 BoxColFill
> +0.180 835 512 24 44 BoxColFill
>  LCb setrgbcolor
> -838 512 N
> +835 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2728,9 +2732,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 871 512 24 44 BoxColFill
> +0.180 868 512 24 44 BoxColFill
>  LCb setrgbcolor
> -871 512 N
> +868 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2739,20 +2743,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 904 512 25 44 BoxColFill
> +0.180 900 512 24 44 BoxColFill
>  LCb setrgbcolor
> -904 512 N
> +900 512 N
>  0 43 V
> -24 0 V
> +23 0 V
>  0 -43 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 938 512 24 44 BoxColFill
> +0.180 933 512 24 44 BoxColFill
>  LCb setrgbcolor
> -938 512 N
> +933 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2761,9 +2765,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 971 512 24 45 BoxColFill
> +0.180 966 512 24 45 BoxColFill
>  LCb setrgbcolor
> -971 512 N
> +966 512 N
>  0 44 V
>  23 0 V
>  0 -44 V
> @@ -2772,9 +2776,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1004 512 24 110 BoxColFill
> +0.180 999 512 24 110 BoxColFill
>  LCb setrgbcolor
> -1004 512 N
> +999 512 N
>  0 109 V
>  23 0 V
>  0 -109 V
> @@ -2783,9 +2787,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1037 512 24 109 BoxColFill
> +0.180 1032 512 24 109 BoxColFill
>  LCb setrgbcolor
> -1037 512 N
> +1032 512 N
>  0 108 V
>  23 0 V
>  0 -108 V
> @@ -2794,9 +2798,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1070 512 24 138 BoxColFill
> +0.180 1064 512 24 138 BoxColFill
>  LCb setrgbcolor
> -1070 512 N
> +1064 512 N
>  0 137 V
>  23 0 V
>  0 -137 V
> @@ -2805,20 +2809,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1103 512 25 145 BoxColFill
> +0.180 1097 512 24 145 BoxColFill
>  LCb setrgbcolor
> -1103 512 N
> +1097 512 N
>  0 144 V
> -24 0 V
> +23 0 V
>  0 -144 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1137 512 24 225 BoxColFill
> +0.180 1130 512 24 225 BoxColFill
>  LCb setrgbcolor
> -1137 512 N
> +1130 512 N
>  0 224 V
>  23 0 V
>  0 -224 V
> @@ -2827,9 +2831,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1170 512 24 226 BoxColFill
> +0.180 1163 512 24 226 BoxColFill
>  LCb setrgbcolor
> -1170 512 N
> +1163 512 N
>  0 225 V
>  23 0 V
>  0 -225 V
> @@ -2838,9 +2842,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1203 512 24 230 BoxColFill
> +0.180 1196 512 24 230 BoxColFill
>  LCb setrgbcolor
> -1203 512 N
> +1196 512 N
>  0 229 V
>  23 0 V
>  0 -229 V
> @@ -2849,9 +2853,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1236 512 24 156 BoxColFill
> +0.180 1229 512 24 156 BoxColFill
>  LCb setrgbcolor
> -1236 512 N
> +1229 512 N
>  0 155 V
>  23 0 V
>  0 -155 V
> @@ -2860,20 +2864,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1269 512 25 183 BoxColFill
> +0.180 1261 512 24 183 BoxColFill
>  LCb setrgbcolor
> -1269 512 N
> +1261 512 N
>  0 182 V
> -24 0 V
> +23 0 V
>  0 -182 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1303 512 24 203 BoxColFill
> +0.180 1294 512 24 203 BoxColFill
>  LCb setrgbcolor
> -1303 512 N
> +1294 512 N
>  0 202 V
>  23 0 V
>  0 -202 V
> @@ -2882,9 +2886,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1336 512 24 211 BoxColFill
> +0.180 1327 512 24 211 BoxColFill
>  LCb setrgbcolor
> -1336 512 N
> +1327 512 N
>  0 210 V
>  23 0 V
>  0 -210 V
> @@ -2893,9 +2897,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1369 512 24 220 BoxColFill
> +0.180 1360 512 24 220 BoxColFill
>  LCb setrgbcolor
> -1369 512 N
> +1360 512 N
>  0 219 V
>  23 0 V
>  0 -219 V
> @@ -2904,9 +2908,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1402 512 24 247 BoxColFill
> +0.180 1393 512 24 247 BoxColFill
>  LCb setrgbcolor
> -1402 512 N
> +1393 512 N
>  0 246 V
>  23 0 V
>  0 -246 V
> @@ -2915,9 +2919,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1435 512 24 271 BoxColFill
> +0.180 1425 512 24 271 BoxColFill
>  LCb setrgbcolor
> -1435 512 N
> +1425 512 N
>  0 270 V
>  23 0 V
>  0 -270 V
> @@ -2926,20 +2930,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1468 512 25 272 BoxColFill
> +0.180 1458 512 24 272 BoxColFill
>  LCb setrgbcolor
> -1468 512 N
> +1458 512 N
>  0 271 V
> -24 0 V
> +23 0 V
>  0 -271 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1502 512 24 313 BoxColFill
> +0.180 1491 512 24 313 BoxColFill
>  LCb setrgbcolor
> -1502 512 N
> +1491 512 N
>  0 312 V
>  23 0 V
>  0 -312 V
> @@ -2948,9 +2952,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1535 512 24 313 BoxColFill
> +0.180 1524 512 24 313 BoxColFill
>  LCb setrgbcolor
> -1535 512 N
> +1524 512 N
>  0 312 V
>  23 0 V
>  0 -312 V
> @@ -2959,9 +2963,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1568 512 24 319 BoxColFill
> +0.180 1557 512 24 319 BoxColFill
>  LCb setrgbcolor
> -1568 512 N
> +1557 512 N
>  0 318 V
>  23 0 V
>  0 -318 V
> @@ -2970,9 +2974,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1601 512 24 337 BoxColFill
> +0.180 1589 512 24 337 BoxColFill
>  LCb setrgbcolor
> -1601 512 N
> +1589 512 N
>  0 336 V
>  23 0 V
>  0 -336 V
> @@ -2981,31 +2985,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1634 512 25 356 BoxColFill
> +0.180 1622 512 24 356 BoxColFill
>  LCb setrgbcolor
> -1634 512 N
> +1622 512 N
>  0 355 V
> -24 0 V
> +23 0 V
>  0 -355 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1667 512 25 378 BoxColFill
> +0.180 1655 512 24 378 BoxColFill
>  LCb setrgbcolor
> -1667 512 N
> +1655 512 N
>  0 377 V
> -24 0 V
> +23 0 V
>  0 -377 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1701 512 24 378 BoxColFill
> +0.180 1688 512 24 378 BoxColFill
>  LCb setrgbcolor
> -1701 512 N
> +1688 512 N
>  0 377 V
>  23 0 V
>  0 -377 V
> @@ -3014,9 +3018,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1734 512 24 380 BoxColFill
> +0.180 1721 512 24 380 BoxColFill
>  LCb setrgbcolor
> -1734 512 N
> +1721 512 N
>  0 379 V
>  23 0 V
>  0 -379 V
> @@ -3025,20 +3029,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1767 512 24 401 BoxColFill
> +0.180 1754 512 23 401 BoxColFill
>  LCb setrgbcolor
> -1767 512 N
> +1754 512 N
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
> -0.180 1800 512 24 408 BoxColFill
> +0.180 1786 512 24 408 BoxColFill
>  LCb setrgbcolor
> -1800 512 N
> +1786 512 N
>  0 407 V
>  23 0 V
>  0 -407 V
> @@ -3047,20 +3051,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1833 512 25 409 BoxColFill
> +0.180 1819 512 24 409 BoxColFill
>  LCb setrgbcolor
> -1833 512 N
> +1819 512 N
>  0 408 V
> -24 0 V
> +23 0 V
>  0 -408 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1867 512 24 372 BoxColFill
> +0.180 1852 512 24 372 BoxColFill
>  LCb setrgbcolor
> -1867 512 N
> +1852 512 N
>  0 371 V
>  23 0 V
>  0 -371 V
> @@ -3069,9 +3073,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1900 512 24 386 BoxColFill
> +0.180 1885 512 24 386 BoxColFill
>  LCb setrgbcolor
> -1900 512 N
> +1885 512 N
>  0 385 V
>  23 0 V
>  0 -385 V
> @@ -3080,9 +3084,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1933 512 24 393 BoxColFill
> +0.180 1918 512 24 393 BoxColFill
>  LCb setrgbcolor
> -1933 512 N
> +1918 512 N
>  0 392 V
>  23 0 V
>  0 -392 V
> @@ -3091,9 +3095,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1966 512 24 400 BoxColFill
> +0.180 1950 512 24 400 BoxColFill
>  LCb setrgbcolor
> -1966 512 N
> +1950 512 N
>  0 399 V
>  23 0 V
>  0 -399 V
> @@ -3102,31 +3106,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1999 512 25 402 BoxColFill
> +0.180 1983 512 24 402 BoxColFill
>  LCb setrgbcolor
> -1999 512 N
> +1983 512 N
>  0 401 V
> -24 0 V
> +23 0 V
>  0 -401 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2032 512 25 410 BoxColFill
> +0.180 2016 512 24 410 BoxColFill
>  LCb setrgbcolor
> -2032 512 N
> +2016 512 N
>  0 409 V
> -24 0 V
> +23 0 V
>  0 -409 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2066 512 24 418 BoxColFill
> +0.180 2049 512 24 418 BoxColFill
>  LCb setrgbcolor
> -2066 512 N
> +2049 512 N
>  0 417 V
>  23 0 V
>  0 -417 V
> @@ -3135,9 +3139,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2099 512 24 439 BoxColFill
> +0.180 2082 512 24 439 BoxColFill
>  LCb setrgbcolor
> -2099 512 N
> +2082 512 N
>  0 438 V
>  23 0 V
>  0 -438 V
> @@ -3146,9 +3150,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2132 512 24 443 BoxColFill
> +0.180 2114 512 24 443 BoxColFill
>  LCb setrgbcolor
> -2132 512 N
> +2114 512 N
>  0 442 V
>  23 0 V
>  0 -442 V
> @@ -3157,9 +3161,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2165 512 24 442 BoxColFill
> +0.180 2147 512 24 442 BoxColFill
>  LCb setrgbcolor
> -2165 512 N
> +2147 512 N
>  0 441 V
>  23 0 V
>  0 -441 V
> @@ -3168,20 +3172,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2198 512 25 450 BoxColFill
> +0.180 2180 512 24 450 BoxColFill
>  LCb setrgbcolor
> -2198 512 N
> +2180 512 N
>  0 449 V
> -24 0 V
> +23 0 V
>  0 -449 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2232 512 24 451 BoxColFill
> +0.180 2213 512 24 451 BoxColFill
>  LCb setrgbcolor
> -2232 512 N
> +2213 512 N
>  0 450 V
>  23 0 V
>  0 -450 V
> @@ -3190,9 +3194,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2265 512 24 456 BoxColFill
> +0.180 2246 512 24 456 BoxColFill
>  LCb setrgbcolor
> -2265 512 N
> +2246 512 N
>  0 455 V
>  23 0 V
>  0 -455 V
> @@ -3201,20 +3205,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2298 512 24 478 BoxColFill
> +0.180 2279 512 23 478 BoxColFill
>  LCb setrgbcolor
> -2298 512 N
> +2279 512 N
>  0 477 V
> -23 0 V
> +22 0 V
>  0 -477 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2331 512 24 483 BoxColFill
> +0.180 2311 512 24 483 BoxColFill
>  LCb setrgbcolor
> -2331 512 N
> +2311 512 N
>  0 482 V
>  23 0 V
>  0 -482 V
> @@ -3223,31 +3227,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2364 512 25 487 BoxColFill
> +0.180 2344 512 24 487 BoxColFill
>  LCb setrgbcolor
> -2364 512 N
> +2344 512 N
>  0 486 V
> -24 0 V
> +23 0 V
>  0 -486 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2397 512 25 492 BoxColFill
> +0.180 2377 512 24 492 BoxColFill
>  LCb setrgbcolor
> -2397 512 N
> +2377 512 N
>  0 491 V
> -24 0 V
> +23 0 V
>  0 -491 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2431 512 24 495 BoxColFill
> +0.180 2410 512 24 495 BoxColFill
>  LCb setrgbcolor
> -2431 512 N
> +2410 512 N
>  0 494 V
>  23 0 V
>  0 -494 V
> @@ -3256,9 +3260,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2464 512 24 497 BoxColFill
> +0.180 2443 512 24 497 BoxColFill
>  LCb setrgbcolor
> -2464 512 N
> +2443 512 N
>  0 496 V
>  23 0 V
>  0 -496 V
> @@ -3267,9 +3271,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2497 512 24 500 BoxColFill
> +0.180 2475 512 24 500 BoxColFill
>  LCb setrgbcolor
> -2497 512 N
> +2475 512 N
>  0 499 V
>  23 0 V
>  0 -499 V
> @@ -3278,9 +3282,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2530 512 24 507 BoxColFill
> +0.180 2508 512 24 507 BoxColFill
>  LCb setrgbcolor
> -2530 512 N
> +2508 512 N
>  0 506 V
>  23 0 V
>  0 -506 V
> @@ -3289,20 +3293,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2563 512 25 592 BoxColFill
> +0.180 2541 512 24 592 BoxColFill
>  LCb setrgbcolor
> -2563 512 N
> +2541 512 N
>  0 591 V
> -24 0 V
> +23 0 V
>  0 -591 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2597 512 24 536 BoxColFill
> +0.180 2574 512 24 536 BoxColFill
>  LCb setrgbcolor
> -2597 512 N
> +2574 512 N
>  0 535 V
>  23 0 V
>  0 -535 V
> @@ -3311,9 +3315,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2630 512 24 533 BoxColFill
> +0.180 2607 512 24 533 BoxColFill
>  LCb setrgbcolor
> -2630 512 N
> +2607 512 N
>  0 532 V
>  23 0 V
>  0 -532 V
> @@ -3322,9 +3326,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2663 512 24 535 BoxColFill
> +0.180 2639 512 24 535 BoxColFill
>  LCb setrgbcolor
> -2663 512 N
> +2639 512 N
>  0 534 V
>  23 0 V
>  0 -534 V
> @@ -3333,9 +3337,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2696 512 24 532 BoxColFill
> +0.180 2672 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2696 512 N
> +2672 512 N
>  0 531 V
>  23 0 V
>  0 -531 V
> @@ -3344,9 +3348,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2729 512 24 532 BoxColFill
> +0.180 2705 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2729 512 N
> +2705 512 N
>  0 531 V
>  23 0 V
>  0 -531 V
> @@ -3355,20 +3359,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2762 512 25 531 BoxColFill
> +0.180 2738 512 24 531 BoxColFill
>  LCb setrgbcolor
> -2762 512 N
> +2738 512 N
>  0 530 V
> -24 0 V
> +23 0 V
>  0 -530 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2796 512 24 539 BoxColFill
> +0.180 2771 512 24 539 BoxColFill
>  LCb setrgbcolor
> -2796 512 N
> +2771 512 N
>  0 538 V
>  23 0 V
>  0 -538 V
> @@ -3377,9 +3381,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2829 512 24 523 BoxColFill
> +0.180 2803 512 24 523 BoxColFill
>  LCb setrgbcolor
> -2829 512 N
> +2803 512 N
>  0 522 V
>  23 0 V
>  0 -522 V
> @@ -3388,9 +3392,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2862 512 24 527 BoxColFill
> +0.180 2836 512 24 527 BoxColFill
>  LCb setrgbcolor
> -2862 512 N
> +2836 512 N
>  0 526 V
>  23 0 V
>  0 -526 V
> @@ -3399,9 +3403,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2895 512 24 511 BoxColFill
> +0.180 2869 512 24 511 BoxColFill
>  LCb setrgbcolor
> -2895 512 N
> +2869 512 N
>  0 510 V
>  23 0 V
>  0 -510 V
> @@ -3410,20 +3414,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2928 512 25 509 BoxColFill
> +0.180 2902 512 24 509 BoxColFill
>  LCb setrgbcolor
> -2928 512 N
> +2902 512 N
>  0 508 V
> -24 0 V
> +23 0 V
>  0 -508 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2962 512 24 514 BoxColFill
> +0.180 2935 512 24 514 BoxColFill
>  LCb setrgbcolor
> -2962 512 N
> +2935 512 N
>  0 513 V
>  23 0 V
>  0 -513 V
> @@ -3432,9 +3436,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2995 512 24 532 BoxColFill
> +0.180 2968 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2995 512 N
> +2968 512 N
>  0 531 V
>  23 0 V
>  0 -531 V
> @@ -3443,9 +3447,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3028 512 24 534 BoxColFill
> +0.180 3000 512 24 534 BoxColFill
>  LCb setrgbcolor
> -3028 512 N
> +3000 512 N
>  0 533 V
>  23 0 V
>  0 -533 V
> @@ -3454,9 +3458,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3061 512 24 542 BoxColFill
> +0.180 3033 512 24 542 BoxColFill
>  LCb setrgbcolor
> -3061 512 N
> +3033 512 N
>  0 541 V
>  23 0 V
>  0 -541 V
> @@ -3465,9 +3469,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3094 512 24 553 BoxColFill
> +0.180 3066 512 24 553 BoxColFill
>  LCb setrgbcolor
> -3094 512 N
> +3066 512 N
>  0 552 V
>  23 0 V
>  0 -552 V
> @@ -3476,20 +3480,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3127 512 25 602 BoxColFill
> +0.180 3099 512 24 602 BoxColFill
>  LCb setrgbcolor
> -3127 512 N
> +3099 512 N
>  0 601 V
> -24 0 V
> +23 0 V
>  0 -601 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3161 512 24 611 BoxColFill
> +0.180 3132 512 24 611 BoxColFill
>  LCb setrgbcolor
> -3161 512 N
> +3132 512 N
>  0 610 V
>  23 0 V
>  0 -610 V
> @@ -3498,9 +3502,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3194 512 24 618 BoxColFill
> +0.180 3164 512 24 618 BoxColFill
>  LCb setrgbcolor
> -3194 512 N
> +3164 512 N
>  0 617 V
>  23 0 V
>  0 -617 V
> @@ -3509,9 +3513,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3227 512 24 621 BoxColFill
> +0.180 3197 512 24 621 BoxColFill
>  LCb setrgbcolor
> -3227 512 N
> +3197 512 N
>  0 620 V
>  23 0 V
>  0 -620 V
> @@ -3520,9 +3524,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3260 512 24 656 BoxColFill
> +0.180 3230 512 24 656 BoxColFill
>  LCb setrgbcolor
> -3260 512 N
> +3230 512 N
>  0 655 V
>  23 0 V
>  0 -655 V
> @@ -3531,31 +3535,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3293 512 25 664 BoxColFill
> +0.180 3263 512 24 664 BoxColFill
>  LCb setrgbcolor
> -3293 512 N
> +3263 512 N
>  0 663 V
> -24 0 V
> +23 0 V
>  0 -663 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3326 512 25 669 BoxColFill
> +0.180 3296 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3326 512 N
> +3296 512 N
>  0 668 V
> -24 0 V
> +23 0 V
>  0 -668 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3360 512 24 669 BoxColFill
> +0.180 3328 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3360 512 N
> +3328 512 N
>  0 668 V
>  23 0 V
>  0 -668 V
> @@ -3564,9 +3568,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3393 512 24 669 BoxColFill
> +0.180 3361 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3393 512 N
> +3361 512 N
>  0 668 V
>  23 0 V
>  0 -668 V
> @@ -3575,9 +3579,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3426 512 24 677 BoxColFill
> +0.180 3394 512 24 677 BoxColFill
>  LCb setrgbcolor
> -3426 512 N
> +3394 512 N
>  0 676 V
>  23 0 V
>  0 -676 V
> @@ -3586,9 +3590,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3459 512 24 680 BoxColFill
> +0.180 3427 512 24 680 BoxColFill
>  LCb setrgbcolor
> -3459 512 N
> +3427 512 N
>  0 679 V
>  23 0 V
>  0 -679 V
> @@ -3597,6 +3601,17 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> +0.180 3460 512 24 704 BoxColFill
> +LCb setrgbcolor
> +3460 512 N
> +0 703 V
> +23 0 V
> +0 -703 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
>  % End plot #1
>  % Begin plot #2
>  1.000 UL
> @@ -3621,36 +3636,36 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 573 539 24 1 BoxColFill
> +0.180 572 539 24 1 BoxColFill
>  LCb setrgbcolor
> -573 539 N
> +572 539 N
>  23 0 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 606 539 24 1 BoxColFill
> +0.180 605 539 24 1 BoxColFill
>  LCb setrgbcolor
> -606 539 N
> +605 539 N
>  23 0 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 639 547 24 1 BoxColFill
> +0.180 638 547 24 1 BoxColFill
>  LCb setrgbcolor
> -639 547 N
> +638 547 N
>  23 0 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 672 549 24 19 BoxColFill
> +0.180 671 549 24 19 BoxColFill
>  LCb setrgbcolor
> -672 549 N
> +671 549 N
>  0 18 V
>  23 0 V
>  0 -18 V
> @@ -3659,31 +3674,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 705 543 25 21 BoxColFill
> +0.180 704 543 24 21 BoxColFill
>  LCb setrgbcolor
> -705 543 N
> +704 543 N
>  0 20 V
> -24 0 V
> +23 0 V
>  0 -20 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 738 543 25 22 BoxColFill
> +0.180 736 543 24 22 BoxColFill
>  LCb setrgbcolor
> -738 543 N
> +736 543 N
>  0 21 V
> -24 0 V
> +23 0 V
>  0 -21 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 772 544 24 26 BoxColFill
> +0.180 769 544 24 26 BoxColFill
>  LCb setrgbcolor
> -772 544 N
> +769 544 N
>  0 25 V
>  23 0 V
>  0 -25 V
> @@ -3692,9 +3707,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 805 555 24 35 BoxColFill
> +0.180 802 555 24 35 BoxColFill
>  LCb setrgbcolor
> -805 555 N
> +802 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3703,9 +3718,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 838 555 24 35 BoxColFill
> +0.180 835 555 24 35 BoxColFill
>  LCb setrgbcolor
> -838 555 N
> +835 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3714,9 +3729,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 871 555 24 35 BoxColFill
> +0.180 868 555 24 35 BoxColFill
>  LCb setrgbcolor
> -871 555 N
> +868 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3725,20 +3740,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 904 555 25 35 BoxColFill
> +0.180 900 555 24 35 BoxColFill
>  LCb setrgbcolor
> -904 555 N
> +900 555 N
>  0 34 V
> -24 0 V
> +23 0 V
>  0 -34 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 938 555 24 35 BoxColFill
> +0.180 933 555 24 35 BoxColFill
>  LCb setrgbcolor
> -938 555 N
> +933 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3747,9 +3762,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 971 556 24 35 BoxColFill
> +0.180 966 556 24 35 BoxColFill
>  LCb setrgbcolor
> -971 556 N
> +966 556 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3758,9 +3773,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1004 621 24 35 BoxColFill
> +0.180 999 621 24 35 BoxColFill
>  LCb setrgbcolor
> -1004 621 N
> +999 621 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3769,9 +3784,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1037 620 24 36 BoxColFill
> +0.180 1032 620 24 36 BoxColFill
>  LCb setrgbcolor
> -1037 620 N
> +1032 620 N
>  0 35 V
>  23 0 V
>  0 -35 V
> @@ -3780,9 +3795,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1070 649 24 41 BoxColFill
> +0.180 1064 649 24 41 BoxColFill
>  LCb setrgbcolor
> -1070 649 N
> +1064 649 N
>  0 40 V
>  23 0 V
>  0 -40 V
> @@ -3791,20 +3806,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1103 656 25 41 BoxColFill
> +0.180 1097 656 24 41 BoxColFill
>  LCb setrgbcolor
> -1103 656 N
> +1097 656 N
>  0 40 V
> -24 0 V
> +23 0 V
>  0 -40 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1137 736 24 43 BoxColFill
> +0.180 1130 736 24 43 BoxColFill
>  LCb setrgbcolor
> -1137 736 N
> +1130 736 N
>  0 42 V
>  23 0 V
>  0 -42 V
> @@ -3813,9 +3828,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1170 737 24 44 BoxColFill
> +0.180 1163 737 24 44 BoxColFill
>  LCb setrgbcolor
> -1170 737 N
> +1163 737 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -3824,9 +3839,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1203 741 24 44 BoxColFill
> +0.180 1196 741 24 44 BoxColFill
>  LCb setrgbcolor
> -1203 741 N
> +1196 741 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -3835,9 +3850,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1236 667 24 45 BoxColFill
> +0.180 1229 667 24 45 BoxColFill
>  LCb setrgbcolor
> -1236 667 N
> +1229 667 N
>  0 44 V
>  23 0 V
>  0 -44 V
> @@ -3846,20 +3861,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1269 694 25 45 BoxColFill
> +0.180 1261 694 24 45 BoxColFill
>  LCb setrgbcolor
> -1269 694 N
> +1261 694 N
>  0 44 V
> -24 0 V
> +23 0 V
>  0 -44 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1303 714 24 49 BoxColFill
> +0.180 1294 714 24 49 BoxColFill
>  LCb setrgbcolor
> -1303 714 N
> +1294 714 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3868,9 +3883,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1336 722 24 49 BoxColFill
> +0.180 1327 722 24 49 BoxColFill
>  LCb setrgbcolor
> -1336 722 N
> +1327 722 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3879,9 +3894,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1369 731 24 48 BoxColFill
> +0.180 1360 731 24 48 BoxColFill
>  LCb setrgbcolor
> -1369 731 N
> +1360 731 N
>  0 47 V
>  23 0 V
>  0 -47 V
> @@ -3890,9 +3905,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1402 758 24 49 BoxColFill
> +0.180 1393 758 24 49 BoxColFill
>  LCb setrgbcolor
> -1402 758 N
> +1393 758 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3901,9 +3916,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1435 782 24 58 BoxColFill
> +0.180 1425 782 24 58 BoxColFill
>  LCb setrgbcolor
> -1435 782 N
> +1425 782 N
>  0 57 V
>  23 0 V
>  0 -57 V
> @@ -3912,20 +3927,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1468 783 25 58 BoxColFill
> +0.180 1458 783 24 58 BoxColFill
>  LCb setrgbcolor
> -1468 783 N
> +1458 783 N
>  0 57 V
> -24 0 V
> +23 0 V
>  0 -57 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1502 824 24 57 BoxColFill
> +0.180 1491 824 24 57 BoxColFill
>  LCb setrgbcolor
> -1502 824 N
> +1491 824 N
>  0 56 V
>  23 0 V
>  0 -56 V
> @@ -3934,9 +3949,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1535 824 24 57 BoxColFill
> +0.180 1524 824 24 57 BoxColFill
>  LCb setrgbcolor
> -1535 824 N
> +1524 824 N
>  0 56 V
>  23 0 V
>  0 -56 V
> @@ -3945,9 +3960,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1568 830 24 57 BoxColFill
> +0.180 1557 830 24 57 BoxColFill
>  LCb setrgbcolor
> -1568 830 N
> +1557 830 N
>  0 56 V
>  23 0 V
>  0 -56 V
> @@ -3956,9 +3971,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1601 848 24 65 BoxColFill
> +0.180 1589 848 24 65 BoxColFill
>  LCb setrgbcolor
> -1601 848 N
> +1589 848 N
>  0 64 V
>  23 0 V
>  0 -64 V
> @@ -3967,31 +3982,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1634 867 25 67 BoxColFill
> +0.180 1622 867 24 67 BoxColFill
>  LCb setrgbcolor
> -1634 867 N
> +1622 867 N
>  0 66 V
> -24 0 V
> +23 0 V
>  0 -66 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1667 889 25 75 BoxColFill
> +0.180 1655 889 24 75 BoxColFill
>  LCb setrgbcolor
> -1667 889 N
> +1655 889 N
>  0 74 V
> -24 0 V
> +23 0 V
>  0 -74 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1701 889 24 76 BoxColFill
> +0.180 1688 889 24 76 BoxColFill
>  LCb setrgbcolor
> -1701 889 N
> +1688 889 N
>  0 75 V
>  23 0 V
>  0 -75 V
> @@ -4000,9 +4015,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1734 891 24 76 BoxColFill
> +0.180 1721 891 24 76 BoxColFill
>  LCb setrgbcolor
> -1734 891 N
> +1721 891 N
>  0 75 V
>  23 0 V
>  0 -75 V
> @@ -4011,20 +4026,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1767 912 24 76 BoxColFill
> +0.180 1754 912 23 76 BoxColFill
>  LCb setrgbcolor
> -1767 912 N
> +1754 912 N
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
> -0.180 1800 919 24 77 BoxColFill
> +0.180 1786 919 24 77 BoxColFill
>  LCb setrgbcolor
> -1800 919 N
> +1786 919 N
>  0 76 V
>  23 0 V
>  0 -76 V
> @@ -4033,20 +4048,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1833 920 25 78 BoxColFill
> +0.180 1819 920 24 78 BoxColFill
>  LCb setrgbcolor
> -1833 920 N
> +1819 920 N
>  0 77 V
> -24 0 V
> +23 0 V
>  0 -77 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1867 883 24 76 BoxColFill
> +0.180 1852 883 24 76 BoxColFill
>  LCb setrgbcolor
> -1867 883 N
> +1852 883 N
>  0 75 V
>  23 0 V
>  0 -75 V
> @@ -4055,9 +4070,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1900 897 24 75 BoxColFill
> +0.180 1885 897 24 75 BoxColFill
>  LCb setrgbcolor
> -1900 897 N
> +1885 897 N
>  0 74 V
>  23 0 V
>  0 -74 V
> @@ -4066,9 +4081,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1933 904 24 75 BoxColFill
> +0.180 1918 904 24 75 BoxColFill
>  LCb setrgbcolor
> -1933 904 N
> +1918 904 N
>  0 74 V
>  23 0 V
>  0 -74 V
> @@ -4077,9 +4092,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1966 911 24 119 BoxColFill
> +0.180 1950 911 24 119 BoxColFill
>  LCb setrgbcolor
> -1966 911 N
> +1950 911 N
>  0 118 V
>  23 0 V
>  0 -118 V
> @@ -4088,31 +4103,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1999 913 25 135 BoxColFill
> +0.180 1983 913 24 135 BoxColFill
>  LCb setrgbcolor
> -1999 913 N
> +1983 913 N
>  0 134 V
> -24 0 V
> +23 0 V
>  0 -134 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2032 921 25 141 BoxColFill
> +0.180 2016 921 24 141 BoxColFill
>  LCb setrgbcolor
> -2032 921 N
> +2016 921 N
>  0 140 V
> -24 0 V
> +23 0 V
>  0 -140 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2066 929 24 142 BoxColFill
> +0.180 2049 929 24 142 BoxColFill
>  LCb setrgbcolor
> -2066 929 N
> +2049 929 N
>  0 141 V
>  23 0 V
>  0 -141 V
> @@ -4121,9 +4136,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2099 950 24 147 BoxColFill
> +0.180 2082 950 24 147 BoxColFill
>  LCb setrgbcolor
> -2099 950 N
> +2082 950 N
>  0 146 V
>  23 0 V
>  0 -146 V
> @@ -4132,9 +4147,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2132 954 24 147 BoxColFill
> +0.180 2114 954 24 147 BoxColFill
>  LCb setrgbcolor
> -2132 954 N
> +2114 954 N
>  0 146 V
>  23 0 V
>  0 -146 V
> @@ -4143,9 +4158,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2165 953 24 148 BoxColFill
> +0.180 2147 953 24 148 BoxColFill
>  LCb setrgbcolor
> -2165 953 N
> +2147 953 N
>  0 147 V
>  23 0 V
>  0 -147 V
> @@ -4154,20 +4169,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2198 961 25 149 BoxColFill
> +0.180 2180 961 24 149 BoxColFill
>  LCb setrgbcolor
> -2198 961 N
> +2180 961 N
>  0 148 V
> -24 0 V
> +23 0 V
>  0 -148 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2232 962 24 151 BoxColFill
> +0.180 2213 962 24 151 BoxColFill
>  LCb setrgbcolor
> -2232 962 N
> +2213 962 N
>  0 150 V
>  23 0 V
>  0 -150 V
> @@ -4176,9 +4191,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2265 967 24 151 BoxColFill
> +0.180 2246 967 24 151 BoxColFill
>  LCb setrgbcolor
> -2265 967 N
> +2246 967 N
>  0 150 V
>  23 0 V
>  0 -150 V
> @@ -4187,20 +4202,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2298 989 24 151 BoxColFill
> +0.180 2279 989 23 151 BoxColFill
>  LCb setrgbcolor
> -2298 989 N
> +2279 989 N
>  0 150 V
> -23 0 V
> +22 0 V
>  0 -150 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2331 994 24 154 BoxColFill
> +0.180 2311 994 24 154 BoxColFill
>  LCb setrgbcolor
> -2331 994 N
> +2311 994 N
>  0 153 V
>  23 0 V
>  0 -153 V
> @@ -4209,31 +4224,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2364 998 25 154 BoxColFill
> +0.180 2344 998 24 154 BoxColFill
>  LCb setrgbcolor
> -2364 998 N
> +2344 998 N
>  0 153 V
> -24 0 V
> +23 0 V
>  0 -153 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2397 1003 25 190 BoxColFill
> +0.180 2377 1003 24 190 BoxColFill
>  LCb setrgbcolor
> -2397 1003 N
> +2377 1003 N
>  0 189 V
> -24 0 V
> +23 0 V
>  0 -189 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2431 1006 24 192 BoxColFill
> +0.180 2410 1006 24 192 BoxColFill
>  LCb setrgbcolor
> -2431 1006 N
> +2410 1006 N
>  0 191 V
>  23 0 V
>  0 -191 V
> @@ -4242,9 +4257,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2464 1008 24 192 BoxColFill
> +0.180 2443 1008 24 192 BoxColFill
>  LCb setrgbcolor
> -2464 1008 N
> +2443 1008 N
>  0 191 V
>  23 0 V
>  0 -191 V
> @@ -4253,9 +4268,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2497 1011 24 192 BoxColFill
> +0.180 2475 1011 24 192 BoxColFill
>  LCb setrgbcolor
> -2497 1011 N
> +2475 1011 N
>  0 191 V
>  23 0 V
>  0 -191 V
> @@ -4264,9 +4279,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2530 1018 24 192 BoxColFill
> +0.180 2508 1018 24 192 BoxColFill
>  LCb setrgbcolor
> -2530 1018 N
> +2508 1018 N
>  0 191 V
>  23 0 V
>  0 -191 V
> @@ -4275,20 +4290,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2563 1103 25 194 BoxColFill
> +0.180 2541 1103 24 194 BoxColFill
>  LCb setrgbcolor
> -2563 1103 N
> +2541 1103 N
>  0 193 V
> -24 0 V
> +23 0 V
>  0 -193 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2597 1047 24 197 BoxColFill
> +0.180 2574 1047 24 197 BoxColFill
>  LCb setrgbcolor
> -2597 1047 N
> +2574 1047 N
>  0 196 V
>  23 0 V
>  0 -196 V
> @@ -4297,9 +4312,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2630 1044 24 198 BoxColFill
> +0.180 2607 1044 24 198 BoxColFill
>  LCb setrgbcolor
> -2630 1044 N
> +2607 1044 N
>  0 197 V
>  23 0 V
>  0 -197 V
> @@ -4308,9 +4323,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2663 1046 24 199 BoxColFill
> +0.180 2639 1046 24 199 BoxColFill
>  LCb setrgbcolor
> -2663 1046 N
> +2639 1046 N
>  0 198 V
>  23 0 V
>  0 -198 V
> @@ -4319,9 +4334,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2696 1043 24 197 BoxColFill
> +0.180 2672 1043 24 197 BoxColFill
>  LCb setrgbcolor
> -2696 1043 N
> +2672 1043 N
>  0 196 V
>  23 0 V
>  0 -196 V
> @@ -4330,9 +4345,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2729 1043 24 198 BoxColFill
> +0.180 2705 1043 24 198 BoxColFill
>  LCb setrgbcolor
> -2729 1043 N
> +2705 1043 N
>  0 197 V
>  23 0 V
>  0 -197 V
> @@ -4341,20 +4356,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2762 1042 25 200 BoxColFill
> +0.180 2738 1042 24 200 BoxColFill
>  LCb setrgbcolor
> -2762 1042 N
> +2738 1042 N
>  0 199 V
> -24 0 V
> +23 0 V
>  0 -199 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2796 1050 24 207 BoxColFill
> +0.180 2771 1050 24 207 BoxColFill
>  LCb setrgbcolor
> -2796 1050 N
> +2771 1050 N
>  0 206 V
>  23 0 V
>  0 -206 V
> @@ -4363,9 +4378,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2829 1034 24 210 BoxColFill
> +0.180 2803 1034 24 210 BoxColFill
>  LCb setrgbcolor
> -2829 1034 N
> +2803 1034 N
>  0 209 V
>  23 0 V
>  0 -209 V
> @@ -4374,9 +4389,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2862 1038 24 295 BoxColFill
> +0.180 2836 1038 24 295 BoxColFill
>  LCb setrgbcolor
> -2862 1038 N
> +2836 1038 N
>  0 294 V
>  23 0 V
>  0 -294 V
> @@ -4385,9 +4400,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2895 1022 24 220 BoxColFill
> +0.180 2869 1022 24 220 BoxColFill
>  LCb setrgbcolor
> -2895 1022 N
> +2869 1022 N
>  0 219 V
>  23 0 V
>  0 -219 V
> @@ -4396,20 +4411,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2928 1020 25 211 BoxColFill
> +0.180 2902 1020 24 211 BoxColFill
>  LCb setrgbcolor
> -2928 1020 N
> +2902 1020 N
>  0 210 V
> -24 0 V
> +23 0 V
>  0 -210 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2962 1025 24 214 BoxColFill
> +0.180 2935 1025 24 214 BoxColFill
>  LCb setrgbcolor
> -2962 1025 N
> +2935 1025 N
>  0 213 V
>  23 0 V
>  0 -213 V
> @@ -4418,9 +4433,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2995 1043 24 215 BoxColFill
> +0.180 2968 1043 24 215 BoxColFill
>  LCb setrgbcolor
> -2995 1043 N
> +2968 1043 N
>  0 214 V
>  23 0 V
>  0 -214 V
> @@ -4429,9 +4444,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3028 1045 24 216 BoxColFill
> +0.180 3000 1045 24 216 BoxColFill
>  LCb setrgbcolor
> -3028 1045 N
> +3000 1045 N
>  0 215 V
>  23 0 V
>  0 -215 V
> @@ -4440,9 +4455,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3061 1053 24 221 BoxColFill
> +0.180 3033 1053 24 221 BoxColFill
>  LCb setrgbcolor
> -3061 1053 N
> +3033 1053 N
>  0 220 V
>  23 0 V
>  0 -220 V
> @@ -4451,9 +4466,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3094 1064 24 224 BoxColFill
> +0.180 3066 1064 24 224 BoxColFill
>  LCb setrgbcolor
> -3094 1064 N
> +3066 1064 N
>  0 223 V
>  23 0 V
>  0 -223 V
> @@ -4462,20 +4477,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3127 1113 25 230 BoxColFill
> +0.180 3099 1113 24 230 BoxColFill
>  LCb setrgbcolor
> -3127 1113 N
> +3099 1113 N
>  0 229 V
> -24 0 V
> +23 0 V
>  0 -229 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3161 1122 24 270 BoxColFill
> +0.180 3132 1122 24 270 BoxColFill
>  LCb setrgbcolor
> -3161 1122 N
> +3132 1122 N
>  0 269 V
>  23 0 V
>  0 -269 V
> @@ -4484,9 +4499,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3194 1129 24 274 BoxColFill
> +0.180 3164 1129 24 274 BoxColFill
>  LCb setrgbcolor
> -3194 1129 N
> +3164 1129 N
>  0 273 V
>  23 0 V
>  0 -273 V
> @@ -4495,9 +4510,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3227 1132 24 279 BoxColFill
> +0.180 3197 1132 24 279 BoxColFill
>  LCb setrgbcolor
> -3227 1132 N
> +3197 1132 N
>  0 278 V
>  23 0 V
>  0 -278 V
> @@ -4506,9 +4521,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3260 1167 24 312 BoxColFill
> +0.180 3230 1167 24 312 BoxColFill
>  LCb setrgbcolor
> -3260 1167 N
> +3230 1167 N
>  0 311 V
>  23 0 V
>  0 -311 V
> @@ -4517,31 +4532,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3293 1175 25 331 BoxColFill
> +0.180 3263 1175 24 331 BoxColFill
>  LCb setrgbcolor
> -3293 1175 N
> +3263 1175 N
>  0 330 V
> -24 0 V
> +23 0 V
>  0 -330 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3326 1180 25 346 BoxColFill
> +0.180 3296 1180 24 346 BoxColFill
>  LCb setrgbcolor
> -3326 1180 N
> +3296 1180 N
>  0 345 V
> -24 0 V
> +23 0 V
>  0 -345 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3360 1180 24 358 BoxColFill
> +0.180 3328 1180 24 358 BoxColFill
>  LCb setrgbcolor
> -3360 1180 N
> +3328 1180 N
>  0 357 V
>  23 0 V
>  0 -357 V
> @@ -4550,9 +4565,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3393 1180 24 359 BoxColFill
> +0.180 3361 1180 24 359 BoxColFill
>  LCb setrgbcolor
> -3393 1180 N
> +3361 1180 N
>  0 358 V
>  23 0 V
>  0 -358 V
> @@ -4561,9 +4576,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3426 1188 24 362 BoxColFill
> +0.180 3394 1188 24 362 BoxColFill
>  LCb setrgbcolor
> -3426 1188 N
> +3394 1188 N
>  0 361 V
>  23 0 V
>  0 -361 V
> @@ -4572,9 +4587,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3459 1191 24 365 BoxColFill
> +0.180 3427 1191 24 365 BoxColFill
>  LCb setrgbcolor
> -3459 1191 N
> +3427 1191 N
>  0 364 V
>  23 0 V
>  0 -364 V
> @@ -4583,6 +4598,17 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> +0.180 3460 1215 24 368 BoxColFill
> +LCb setrgbcolor
> +3460 1215 N
> +0 367 V
> +23 0 V
> +0 -367 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
>  % End plot #2
>  % Begin plot #3
>  1.000 UL
> @@ -4600,92 +4626,93 @@ LTb
>  255 0 V
>  584 512 M
>  33 0 V
> -34 0 V
> +32 0 V
>  33 778 V
>  33 193 V
>  33 -5 V
>  33 87 V
> -33 29 V
> -34 3 V
> +32 29 V
> +33 3 V
>  33 0 V
>  33 -5 V
>  33 0 V
>  33 -17 V
> -34 -483 V
> +32 -483 V
>  33 2 V
>  33 -38 V
>  33 -20 V
>  33 -140 V
> -33 0 V
> -34 -5 V
> +32 0 V
> +33 -5 V
>  33 150 V
>  33 -51 V
>  33 -17 V
> -33 -14 V
> +32 -14 V
>  33 -15 V
> -34 -38 V
> +33 -38 V
>  33 24 V
>  33 -2 V
>  33 -46 V
> -33 0 V
> -34 -8 V
> +32 0 V
> +33 -8 V
>  33 20 V
>  33 -3 V
>  33 17 V
> -33 3 V
> +32 3 V
>  33 4 V
> -34 -21 V
> +33 -21 V
>  33 0 V
>  33 0 V
> -33 26 V
> +32 26 V
>  33 -19 V
> -34 -5 V
> +33 -5 V
>  33 169 V
>  33 51 V
>  33 14 V
> +32 -7 V
>  33 -7 V
> -33 -7 V
> -34 -5 V
> -33 5 V
>  33 -5 V
>  33 5 V
> +33 -5 V
> +32 5 V
>  33 -2 V
> -34 -22 V
> +33 -22 V
>  33 0 V
>  33 -3 V
> -33 95 V
> +32 95 V
>  33 2 V
>  33 -2 V
> -34 -3 V
> +33 -3 V
>  33 -5 V
> -33 -70 V
> +32 -70 V
>  33 53 V
>  33 8 V
> -34 -3 V
> +33 -3 V
>  33 -2 V
>  33 2 V
> -33 5 V
> +32 5 V
>  33 12 V
>  33 22 V
> -34 176 V
> +33 176 V
>  33 -142 V
> -33 -20 V
> +32 -20 V
>  33 5 V
>  33 -14 V
>  33 -3 V
> -34 5 V
> -33 -2 V
> +33 5 V
> +32 -2 V
>  33 -29 V
>  33 72 V
>  33 3 V
> -34 5 V
> +33 5 V
>  33 31 V
> -33 24 V
> +32 24 V
>  33 19 V
>  33 20 V
>  33 2 V
> -34 0 V
> -33 -2 V
> +33 0 V
> +32 -2 V
> +33 -10 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index 283dc6845237..36f68acc2faa 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -85,4 +85,5 @@ v5.12 18965 9025 27990 32.2
>  ""    19366 10332 29698 34.8
>  v5.16 19359 10362 29721 34.9
>  ""    19576 10482 30058 34.9
> -v5.18 19683 10526 30209 34.8
> +""    19683 10526 30209 34.8
> +v5.19 20354 10656 31010 34.4
> 
> base-commit: 870679dfd76a0e0939bf0943d8156f485f852179
> -- 
> 2.25.1
> 
