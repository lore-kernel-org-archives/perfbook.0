Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiJFNIE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 6 Oct 2022 09:08:04 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B0BA8CE1
        for <perfbook@vger.kernel.org>; Thu,  6 Oct 2022 06:07:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4D02BCE16B2
        for <perfbook@vger.kernel.org>; Thu,  6 Oct 2022 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665061644;
        bh=j8H6TzCTngT2AWr/0GSrJpIcGeag3IATz/uXt3e0uEc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UshvF9/1nSqf7kcb03+WeQ/7zPJbE1ah3W+GoEJkJYe6r8Dif3dnSLmtJOb6skI8d
         Fp5Etas4s/SLzctV7QVYck95CZJCud2Oy189TBcm1MjbkUiDPLuG6iCksI8qWhbV9U
         96IJuLeOZJEYZ3nkCgI9SFHB4pd5nVKE78KR5wX3NtoRzJwdrydvE9iUG4Z9EHrpZ+
         xXQlOwtezdOHjP1vOmAhlgABWVjNcypivirsIKb67ZirejKatQLbtqYqwG2EsfbkOn
         pkUxK5G7IiiJG7dxxn8KioHRXxn27ThGfwNpGmTHgx9YxtMKkxlugZD9yLbgF2ANHE
         RPIUTcO29nYSg==
Date: Thu, 6 Oct 2022 06:07:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] formal: Update RCU-test-ratio table as of v6.0
Message-ID: <20221006130724.GV4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f2e090c9-7388-6033-3bb9-be08f7a19a0d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2e090c9-7388-6033-3bb9-be08f7a19a0d@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 05, 2022 at 10:50:19PM +0900, Akira Yokosawa wrote:
> Routine update of Figure 12.4.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

Nothing really significant to add, as this sizes didn't change all
that much.

							Thanx, Paul

> ---
>  CodeSamples/formal/data/RCU-test-ratio.eps | 1237 ++++++++++----------
>  CodeSamples/formal/data/rcu-test.dat       |    3 +-
>  2 files changed, 634 insertions(+), 606 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index 0439d42475e7..ebb7c07ef6d8 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
>  %%Creator: gnuplot 5.2 patchlevel 8
> -%%CreationDate: Mon Aug  8 18:09:51 2022
> +%%CreationDate: Wed Oct  5 22:43:51 2022
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 453 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.2 patchlevel 8)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Mon Aug  8 18:09:51 2022)
> +  /CreationDate (Wed Oct  5 22:43:51 2022)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1998,9 +1998,9 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -584 512 M
> +583 512 M
>  stroke
> -584 464 M
> +583 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.12)]
>  ] -26.7 MRshow
> @@ -2009,21 +2009,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -617 512 M
> +616 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -649 512 M
> +648 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -682 512 M
> +681 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -715 512 M
> +713 512 M
>  stroke
> -715 464 M
> +713 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
>  ] -26.7 MRshow
> @@ -2032,21 +2032,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -748 512 M
> +746 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -781 512 M
> +778 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -813 512 M
> +811 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -846 512 M
> +843 512 M
>  stroke
> -846 464 M
> +843 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
>  ] -26.7 MRshow
> @@ -2055,21 +2055,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -879 512 M
> +876 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -912 512 M
> +908 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -945 512 M
> +940 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -978 512 M
> +973 512 M
>  stroke
> -978 464 M
> +973 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
>  ] -26.7 MRshow
> @@ -2078,21 +2078,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1010 512 M
> +1005 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1043 512 M
> +1038 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1076 512 M
> +1070 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1109 512 M
> +1103 512 M
>  stroke
> -1109 464 M
> +1103 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
>  ] -26.7 MRshow
> @@ -2101,21 +2101,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1142 512 M
> +1135 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1174 512 M
> +1168 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1207 512 M
> +1200 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1240 512 M
> +1232 512 M
>  stroke
> -1240 464 M
> +1232 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
>  ] -26.7 MRshow
> @@ -2124,21 +2124,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1273 512 M
> +1265 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1306 512 M
> +1297 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1338 512 M
> +1330 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1371 512 M
> +1362 512 M
>  stroke
> -1371 464 M
> +1362 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
>  ] -26.7 MRshow
> @@ -2147,21 +2147,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1404 512 M
> +1395 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1437 512 M
> +1427 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1470 512 M
> +1460 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1503 512 M
> +1492 512 M
>  stroke
> -1503 464 M
> +1492 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
>  ] -26.7 MRshow
> @@ -2170,21 +2170,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1535 512 M
> +1525 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1568 512 M
> +1557 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1601 512 M
> +1589 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1634 512 M
> +1622 512 M
>  stroke
> -1634 464 M
> +1622 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
>  ] -26.7 MRshow
> @@ -2193,21 +2193,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1667 512 M
> +1654 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1699 512 M
> +1687 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1732 512 M
> +1719 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1765 512 M
> +1752 512 M
>  stroke
> -1765 464 M
> +1752 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
>  ] -26.7 MRshow
> @@ -2216,21 +2216,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1798 512 M
> +1784 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1831 512 M
> +1817 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1863 512 M
> +1849 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1896 512 M
> +1881 512 M
>  stroke
> -1896 464 M
> +1881 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
>  ] -26.7 MRshow
> @@ -2239,21 +2239,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1929 512 M
> +1914 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1962 512 M
> +1946 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1995 512 M
> +1979 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2028 512 M
> +2011 512 M
>  stroke
> -2028 464 M
> +2011 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
>  ] -26.7 MRshow
> @@ -2262,21 +2262,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2060 512 M
> +2044 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2093 512 M
> +2076 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2126 512 M
> +2109 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2159 512 M
> +2141 512 M
>  stroke
> -2159 464 M
> +2141 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
>  ] -26.7 MRshow
> @@ -2285,21 +2285,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2192 512 M
> +2174 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2224 512 M
> +2206 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2257 512 M
> +2238 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2290 512 M
> +2271 512 M
>  stroke
> -2290 464 M
> +2271 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
>  ] -26.7 MRshow
> @@ -2308,21 +2308,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2323 512 M
> +2303 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2356 512 M
> +2336 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2388 512 M
> +2368 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2421 512 M
> +2401 512 M
>  stroke
> -2421 464 M
> +2401 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
>  ] -26.7 MRshow
> @@ -2331,21 +2331,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2454 512 M
> +2433 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2487 512 M
> +2466 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2520 512 M
> +2498 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2552 512 M
> +2530 512 M
>  stroke
> -2552 464 M
> +2530 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
>  ] -26.7 MRshow
> @@ -2354,21 +2354,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2585 512 M
> +2563 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2618 512 M
> +2595 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2651 512 M
> +2628 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2684 512 M
> +2660 512 M
>  stroke
> -2684 464 M
> +2660 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
>  ] -26.7 MRshow
> @@ -2377,25 +2377,25 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2717 512 M
> +2693 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2749 512 M
> +2725 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2782 512 M
> +2758 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2815 512 M
> +2790 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2848 512 M
> +2823 512 M
>  stroke
> -2848 464 M
> +2823 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
>  ] -26.7 MRshow
> @@ -2404,21 +2404,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2881 512 M
> +2855 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2913 512 M
> +2887 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2946 512 M
> +2920 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2979 512 M
> +2952 512 M
>  stroke
> -2979 464 M
> +2952 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
>  ] -26.7 MRshow
> @@ -2427,21 +2427,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3012 512 M
> +2985 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3045 512 M
> +3017 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3077 512 M
> +3050 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3110 512 M
> +3082 512 M
>  stroke
> -3110 464 M
> +3082 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
>  ] -26.7 MRshow
> @@ -2450,21 +2450,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3143 512 M
> +3115 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3176 512 M
> +3147 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3209 512 M
> +3179 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3242 512 M
> +3212 512 M
>  stroke
> -3242 464 M
> +3212 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
>  ] -26.7 MRshow
> @@ -2473,21 +2473,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3274 512 M
> +3244 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3307 512 M
> +3277 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3340 512 M
> +3309 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3373 512 M
> +3342 512 M
>  stroke
> -3373 464 M
> +3342 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.16)]
>  ] -26.7 MRshow
> @@ -2496,19 +2496,23 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3406 512 M
> +3374 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3438 512 M
> +3407 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3471 512 M
> +3439 512 M
>  stroke
> -3471 464 M
> +LTb
> +LCb setrgbcolor
> +3472 512 M
> +stroke
> +3472 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.19)]
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v6.0)]
>  ] -26.7 MRshow
>  grestore
>  /NimbusSanL-Regu findfont 80 scalefont setfont
> @@ -2644,20 +2648,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 605 512 24 28 BoxColFill
> +0.180 605 512 23 28 BoxColFill
>  LCb setrgbcolor
>  605 512 N
>  0 27 V
> -23 0 V
> +22 0 V
>  0 -27 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 638 512 24 36 BoxColFill
> +0.180 637 512 24 36 BoxColFill
>  LCb setrgbcolor
> -638 512 N
> +637 512 N
>  0 35 V
>  23 0 V
>  0 -35 V
> @@ -2666,9 +2670,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 671 512 24 38 BoxColFill
> +0.180 669 512 24 38 BoxColFill
>  LCb setrgbcolor
> -671 512 N
> +669 512 N
>  0 37 V
>  23 0 V
>  0 -37 V
> @@ -2677,9 +2681,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 704 512 24 32 BoxColFill
> +0.180 702 512 24 32 BoxColFill
>  LCb setrgbcolor
> -704 512 N
> +702 512 N
>  0 31 V
>  23 0 V
>  0 -31 V
> @@ -2688,9 +2692,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 736 512 24 32 BoxColFill
> +0.180 734 512 24 32 BoxColFill
>  LCb setrgbcolor
> -736 512 N
> +734 512 N
>  0 31 V
>  23 0 V
>  0 -31 V
> @@ -2699,9 +2703,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 769 512 24 33 BoxColFill
> +0.180 767 512 24 33 BoxColFill
>  LCb setrgbcolor
> -769 512 N
> +767 512 N
>  0 32 V
>  23 0 V
>  0 -32 V
> @@ -2710,9 +2714,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 802 512 24 44 BoxColFill
> +0.180 799 512 24 44 BoxColFill
>  LCb setrgbcolor
> -802 512 N
> +799 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2721,20 +2725,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 835 512 24 44 BoxColFill
> +0.180 832 512 23 44 BoxColFill
>  LCb setrgbcolor
> -835 512 N
> +832 512 N
>  0 43 V
> -23 0 V
> +22 0 V
>  0 -43 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 868 512 24 44 BoxColFill
> +0.180 864 512 24 44 BoxColFill
>  LCb setrgbcolor
> -868 512 N
> +864 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2743,20 +2747,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 900 512 24 44 BoxColFill
> +0.180 897 512 23 44 BoxColFill
>  LCb setrgbcolor
> -900 512 N
> +897 512 N
>  0 43 V
> -23 0 V
> +22 0 V
>  0 -43 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 933 512 24 44 BoxColFill
> +0.180 929 512 24 44 BoxColFill
>  LCb setrgbcolor
> -933 512 N
> +929 512 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -2765,9 +2769,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 966 512 24 45 BoxColFill
> +0.180 961 512 24 45 BoxColFill
>  LCb setrgbcolor
> -966 512 N
> +961 512 N
>  0 44 V
>  23 0 V
>  0 -44 V
> @@ -2776,9 +2780,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 999 512 24 110 BoxColFill
> +0.180 994 512 24 110 BoxColFill
>  LCb setrgbcolor
> -999 512 N
> +994 512 N
>  0 109 V
>  23 0 V
>  0 -109 V
> @@ -2787,9 +2791,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1032 512 24 109 BoxColFill
> +0.180 1026 512 24 109 BoxColFill
>  LCb setrgbcolor
> -1032 512 N
> +1026 512 N
>  0 108 V
>  23 0 V
>  0 -108 V
> @@ -2798,9 +2802,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1064 512 24 138 BoxColFill
> +0.180 1059 512 24 138 BoxColFill
>  LCb setrgbcolor
> -1064 512 N
> +1059 512 N
>  0 137 V
>  23 0 V
>  0 -137 V
> @@ -2809,9 +2813,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1097 512 24 145 BoxColFill
> +0.180 1091 512 24 145 BoxColFill
>  LCb setrgbcolor
> -1097 512 N
> +1091 512 N
>  0 144 V
>  23 0 V
>  0 -144 V
> @@ -2820,20 +2824,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1130 512 24 225 BoxColFill
> +0.180 1124 512 23 225 BoxColFill
>  LCb setrgbcolor
> -1130 512 N
> +1124 512 N
>  0 224 V
> -23 0 V
> +22 0 V
>  0 -224 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1163 512 24 226 BoxColFill
> +0.180 1156 512 24 226 BoxColFill
>  LCb setrgbcolor
> -1163 512 N
> +1156 512 N
>  0 225 V
>  23 0 V
>  0 -225 V
> @@ -2842,20 +2846,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1196 512 24 230 BoxColFill
> +0.180 1189 512 23 230 BoxColFill
>  LCb setrgbcolor
> -1196 512 N
> +1189 512 N
>  0 229 V
> -23 0 V
> +22 0 V
>  0 -229 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1229 512 24 156 BoxColFill
> +0.180 1221 512 24 156 BoxColFill
>  LCb setrgbcolor
> -1229 512 N
> +1221 512 N
>  0 155 V
>  23 0 V
>  0 -155 V
> @@ -2864,20 +2868,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1261 512 24 183 BoxColFill
> +0.180 1254 512 23 183 BoxColFill
>  LCb setrgbcolor
> -1261 512 N
> +1254 512 N
>  0 182 V
> -23 0 V
> +22 0 V
>  0 -182 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1294 512 24 203 BoxColFill
> +0.180 1286 512 24 203 BoxColFill
>  LCb setrgbcolor
> -1294 512 N
> +1286 512 N
>  0 202 V
>  23 0 V
>  0 -202 V
> @@ -2886,9 +2890,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1327 512 24 211 BoxColFill
> +0.180 1318 512 24 211 BoxColFill
>  LCb setrgbcolor
> -1327 512 N
> +1318 512 N
>  0 210 V
>  23 0 V
>  0 -210 V
> @@ -2897,9 +2901,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1360 512 24 220 BoxColFill
> +0.180 1351 512 24 220 BoxColFill
>  LCb setrgbcolor
> -1360 512 N
> +1351 512 N
>  0 219 V
>  23 0 V
>  0 -219 V
> @@ -2908,9 +2912,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1393 512 24 247 BoxColFill
> +0.180 1383 512 24 247 BoxColFill
>  LCb setrgbcolor
> -1393 512 N
> +1383 512 N
>  0 246 V
>  23 0 V
>  0 -246 V
> @@ -2919,9 +2923,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1425 512 24 271 BoxColFill
> +0.180 1416 512 24 271 BoxColFill
>  LCb setrgbcolor
> -1425 512 N
> +1416 512 N
>  0 270 V
>  23 0 V
>  0 -270 V
> @@ -2930,9 +2934,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1458 512 24 272 BoxColFill
> +0.180 1448 512 24 272 BoxColFill
>  LCb setrgbcolor
> -1458 512 N
> +1448 512 N
>  0 271 V
>  23 0 V
>  0 -271 V
> @@ -2941,20 +2945,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1491 512 24 313 BoxColFill
> +0.180 1481 512 23 313 BoxColFill
>  LCb setrgbcolor
> -1491 512 N
> +1481 512 N
>  0 312 V
> -23 0 V
> +22 0 V
>  0 -312 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1524 512 24 313 BoxColFill
> +0.180 1513 512 24 313 BoxColFill
>  LCb setrgbcolor
> -1524 512 N
> +1513 512 N
>  0 312 V
>  23 0 V
>  0 -312 V
> @@ -2963,20 +2967,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1557 512 24 319 BoxColFill
> +0.180 1546 512 23 319 BoxColFill
>  LCb setrgbcolor
> -1557 512 N
> +1546 512 N
>  0 318 V
> -23 0 V
> +22 0 V
>  0 -318 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1589 512 24 337 BoxColFill
> +0.180 1578 512 24 337 BoxColFill
>  LCb setrgbcolor
> -1589 512 N
> +1578 512 N
>  0 336 V
>  23 0 V
>  0 -336 V
> @@ -2985,20 +2989,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1622 512 24 356 BoxColFill
> +0.180 1611 512 23 356 BoxColFill
>  LCb setrgbcolor
> -1622 512 N
> +1611 512 N
>  0 355 V
> -23 0 V
> +22 0 V
>  0 -355 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1655 512 24 378 BoxColFill
> +0.180 1643 512 24 378 BoxColFill
>  LCb setrgbcolor
> -1655 512 N
> +1643 512 N
>  0 377 V
>  23 0 V
>  0 -377 V
> @@ -3007,9 +3011,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1688 512 24 378 BoxColFill
> +0.180 1675 512 24 378 BoxColFill
>  LCb setrgbcolor
> -1688 512 N
> +1675 512 N
>  0 377 V
>  23 0 V
>  0 -377 V
> @@ -3018,9 +3022,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1721 512 24 380 BoxColFill
> +0.180 1708 512 24 380 BoxColFill
>  LCb setrgbcolor
> -1721 512 N
> +1708 512 N
>  0 379 V
>  23 0 V
>  0 -379 V
> @@ -3029,31 +3033,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1754 512 23 401 BoxColFill
> +0.180 1740 512 24 401 BoxColFill
>  LCb setrgbcolor
> -1754 512 N
> +1740 512 N
>  0 400 V
> -22 0 V
> +23 0 V
>  0 -400 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1786 512 24 408 BoxColFill
> +0.180 1773 512 23 408 BoxColFill
>  LCb setrgbcolor
> -1786 512 N
> +1773 512 N
>  0 407 V
> -23 0 V
> +22 0 V
>  0 -407 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1819 512 24 409 BoxColFill
> +0.180 1805 512 24 409 BoxColFill
>  LCb setrgbcolor
> -1819 512 N
> +1805 512 N
>  0 408 V
>  23 0 V
>  0 -408 V
> @@ -3062,20 +3066,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1852 512 24 372 BoxColFill
> +0.180 1838 512 23 372 BoxColFill
>  LCb setrgbcolor
> -1852 512 N
> +1838 512 N
>  0 371 V
> -23 0 V
> +22 0 V
>  0 -371 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1885 512 24 386 BoxColFill
> +0.180 1870 512 24 386 BoxColFill
>  LCb setrgbcolor
> -1885 512 N
> +1870 512 N
>  0 385 V
>  23 0 V
>  0 -385 V
> @@ -3084,20 +3088,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1918 512 24 393 BoxColFill
> +0.180 1903 512 23 393 BoxColFill
>  LCb setrgbcolor
> -1918 512 N
> +1903 512 N
>  0 392 V
> -23 0 V
> +22 0 V
>  0 -392 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1950 512 24 400 BoxColFill
> +0.180 1935 512 24 400 BoxColFill
>  LCb setrgbcolor
> -1950 512 N
> +1935 512 N
>  0 399 V
>  23 0 V
>  0 -399 V
> @@ -3106,9 +3110,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1983 512 24 402 BoxColFill
> +0.180 1967 512 24 402 BoxColFill
>  LCb setrgbcolor
> -1983 512 N
> +1967 512 N
>  0 401 V
>  23 0 V
>  0 -401 V
> @@ -3117,9 +3121,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2016 512 24 410 BoxColFill
> +0.180 2000 512 24 410 BoxColFill
>  LCb setrgbcolor
> -2016 512 N
> +2000 512 N
>  0 409 V
>  23 0 V
>  0 -409 V
> @@ -3128,9 +3132,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2049 512 24 418 BoxColFill
> +0.180 2032 512 24 418 BoxColFill
>  LCb setrgbcolor
> -2049 512 N
> +2032 512 N
>  0 417 V
>  23 0 V
>  0 -417 V
> @@ -3139,9 +3143,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2082 512 24 439 BoxColFill
> +0.180 2065 512 24 439 BoxColFill
>  LCb setrgbcolor
> -2082 512 N
> +2065 512 N
>  0 438 V
>  23 0 V
>  0 -438 V
> @@ -3150,9 +3154,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2114 512 24 443 BoxColFill
> +0.180 2097 512 24 443 BoxColFill
>  LCb setrgbcolor
> -2114 512 N
> +2097 512 N
>  0 442 V
>  23 0 V
>  0 -442 V
> @@ -3161,20 +3165,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2147 512 24 442 BoxColFill
> +0.180 2130 512 23 442 BoxColFill
>  LCb setrgbcolor
> -2147 512 N
> +2130 512 N
>  0 441 V
> -23 0 V
> +22 0 V
>  0 -441 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2180 512 24 450 BoxColFill
> +0.180 2162 512 24 450 BoxColFill
>  LCb setrgbcolor
> -2180 512 N
> +2162 512 N
>  0 449 V
>  23 0 V
>  0 -449 V
> @@ -3183,20 +3187,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2213 512 24 451 BoxColFill
> +0.180 2195 512 23 451 BoxColFill
>  LCb setrgbcolor
> -2213 512 N
> +2195 512 N
>  0 450 V
> -23 0 V
> +22 0 V
>  0 -450 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2246 512 24 456 BoxColFill
> +0.180 2227 512 24 456 BoxColFill
>  LCb setrgbcolor
> -2246 512 N
> +2227 512 N
>  0 455 V
>  23 0 V
>  0 -455 V
> @@ -3205,9 +3209,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2279 512 23 478 BoxColFill
> +0.180 2260 512 23 478 BoxColFill
>  LCb setrgbcolor
> -2279 512 N
> +2260 512 N
>  0 477 V
>  22 0 V
>  0 -477 V
> @@ -3216,9 +3220,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2311 512 24 483 BoxColFill
> +0.180 2292 512 24 483 BoxColFill
>  LCb setrgbcolor
> -2311 512 N
> +2292 512 N
>  0 482 V
>  23 0 V
>  0 -482 V
> @@ -3227,9 +3231,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2344 512 24 487 BoxColFill
> +0.180 2324 512 24 487 BoxColFill
>  LCb setrgbcolor
> -2344 512 N
> +2324 512 N
>  0 486 V
>  23 0 V
>  0 -486 V
> @@ -3238,9 +3242,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2377 512 24 492 BoxColFill
> +0.180 2357 512 24 492 BoxColFill
>  LCb setrgbcolor
> -2377 512 N
> +2357 512 N
>  0 491 V
>  23 0 V
>  0 -491 V
> @@ -3249,9 +3253,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2410 512 24 495 BoxColFill
> +0.180 2389 512 24 495 BoxColFill
>  LCb setrgbcolor
> -2410 512 N
> +2389 512 N
>  0 494 V
>  23 0 V
>  0 -494 V
> @@ -3260,20 +3264,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2443 512 24 497 BoxColFill
> +0.180 2422 512 23 497 BoxColFill
>  LCb setrgbcolor
> -2443 512 N
> +2422 512 N
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
> -0.180 2475 512 24 500 BoxColFill
> +0.180 2454 512 24 500 BoxColFill
>  LCb setrgbcolor
> -2475 512 N
> +2454 512 N
>  0 499 V
>  23 0 V
>  0 -499 V
> @@ -3282,20 +3286,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2508 512 24 507 BoxColFill
> +0.180 2487 512 23 507 BoxColFill
>  LCb setrgbcolor
> -2508 512 N
> +2487 512 N
>  0 506 V
> -23 0 V
> +22 0 V
>  0 -506 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2541 512 24 592 BoxColFill
> +0.180 2519 512 24 592 BoxColFill
>  LCb setrgbcolor
> -2541 512 N
> +2519 512 N
>  0 591 V
>  23 0 V
>  0 -591 V
> @@ -3304,20 +3308,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2574 512 24 536 BoxColFill
> +0.180 2552 512 23 536 BoxColFill
>  LCb setrgbcolor
> -2574 512 N
> +2552 512 N
>  0 535 V
> -23 0 V
> +22 0 V
>  0 -535 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2607 512 24 533 BoxColFill
> +0.180 2584 512 24 533 BoxColFill
>  LCb setrgbcolor
> -2607 512 N
> +2584 512 N
>  0 532 V
>  23 0 V
>  0 -532 V
> @@ -3326,9 +3330,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2639 512 24 535 BoxColFill
> +0.180 2616 512 24 535 BoxColFill
>  LCb setrgbcolor
> -2639 512 N
> +2616 512 N
>  0 534 V
>  23 0 V
>  0 -534 V
> @@ -3337,9 +3341,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2672 512 24 532 BoxColFill
> +0.180 2649 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2672 512 N
> +2649 512 N
>  0 531 V
>  23 0 V
>  0 -531 V
> @@ -3348,9 +3352,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2705 512 24 532 BoxColFill
> +0.180 2681 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2705 512 N
> +2681 512 N
>  0 531 V
>  23 0 V
>  0 -531 V
> @@ -3359,9 +3363,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2738 512 24 531 BoxColFill
> +0.180 2714 512 24 531 BoxColFill
>  LCb setrgbcolor
> -2738 512 N
> +2714 512 N
>  0 530 V
>  23 0 V
>  0 -530 V
> @@ -3370,9 +3374,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2771 512 24 539 BoxColFill
> +0.180 2746 512 24 539 BoxColFill
>  LCb setrgbcolor
> -2771 512 N
> +2746 512 N
>  0 538 V
>  23 0 V
>  0 -538 V
> @@ -3381,20 +3385,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2803 512 24 523 BoxColFill
> +0.180 2779 512 23 523 BoxColFill
>  LCb setrgbcolor
> -2803 512 N
> +2779 512 N
>  0 522 V
> -23 0 V
> +22 0 V
>  0 -522 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2836 512 24 527 BoxColFill
> +0.180 2811 512 24 527 BoxColFill
>  LCb setrgbcolor
> -2836 512 N
> +2811 512 N
>  0 526 V
>  23 0 V
>  0 -526 V
> @@ -3403,20 +3407,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2869 512 24 511 BoxColFill
> +0.180 2844 512 23 511 BoxColFill
>  LCb setrgbcolor
> -2869 512 N
> +2844 512 N
>  0 510 V
> -23 0 V
> +22 0 V
>  0 -510 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2902 512 24 509 BoxColFill
> +0.180 2876 512 24 509 BoxColFill
>  LCb setrgbcolor
> -2902 512 N
> +2876 512 N
>  0 508 V
>  23 0 V
>  0 -508 V
> @@ -3425,20 +3429,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2935 512 24 514 BoxColFill
> +0.180 2909 512 23 514 BoxColFill
>  LCb setrgbcolor
> -2935 512 N
> +2909 512 N
>  0 513 V
> -23 0 V
> +22 0 V
>  0 -513 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2968 512 24 532 BoxColFill
> +0.180 2941 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2968 512 N
> +2941 512 N
>  0 531 V
>  23 0 V
>  0 -531 V
> @@ -3447,9 +3451,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3000 512 24 534 BoxColFill
> +0.180 2973 512 24 534 BoxColFill
>  LCb setrgbcolor
> -3000 512 N
> +2973 512 N
>  0 533 V
>  23 0 V
>  0 -533 V
> @@ -3458,9 +3462,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3033 512 24 542 BoxColFill
> +0.180 3006 512 24 542 BoxColFill
>  LCb setrgbcolor
> -3033 512 N
> +3006 512 N
>  0 541 V
>  23 0 V
>  0 -541 V
> @@ -3469,9 +3473,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3066 512 24 553 BoxColFill
> +0.180 3038 512 24 553 BoxColFill
>  LCb setrgbcolor
> -3066 512 N
> +3038 512 N
>  0 552 V
>  23 0 V
>  0 -552 V
> @@ -3480,9 +3484,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3099 512 24 602 BoxColFill
> +0.180 3071 512 24 602 BoxColFill
>  LCb setrgbcolor
> -3099 512 N
> +3071 512 N
>  0 601 V
>  23 0 V
>  0 -601 V
> @@ -3491,9 +3495,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3132 512 24 611 BoxColFill
> +0.180 3103 512 24 611 BoxColFill
>  LCb setrgbcolor
> -3132 512 N
> +3103 512 N
>  0 610 V
>  23 0 V
>  0 -610 V
> @@ -3502,20 +3506,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3164 512 24 618 BoxColFill
> +0.180 3136 512 23 618 BoxColFill
>  LCb setrgbcolor
> -3164 512 N
> +3136 512 N
>  0 617 V
> -23 0 V
> +22 0 V
>  0 -617 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3197 512 24 621 BoxColFill
> +0.180 3168 512 24 621 BoxColFill
>  LCb setrgbcolor
> -3197 512 N
> +3168 512 N
>  0 620 V
>  23 0 V
>  0 -620 V
> @@ -3524,20 +3528,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3230 512 24 656 BoxColFill
> +0.180 3201 512 23 656 BoxColFill
>  LCb setrgbcolor
> -3230 512 N
> +3201 512 N
>  0 655 V
> -23 0 V
> +22 0 V
>  0 -655 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3263 512 24 664 BoxColFill
> +0.180 3233 512 24 664 BoxColFill
>  LCb setrgbcolor
> -3263 512 N
> +3233 512 N
>  0 663 V
>  23 0 V
>  0 -663 V
> @@ -3546,9 +3550,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3296 512 24 669 BoxColFill
> +0.180 3265 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3296 512 N
> +3265 512 N
>  0 668 V
>  23 0 V
>  0 -668 V
> @@ -3557,9 +3561,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3328 512 24 669 BoxColFill
> +0.180 3298 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3328 512 N
> +3298 512 N
>  0 668 V
>  23 0 V
>  0 -668 V
> @@ -3568,9 +3572,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3361 512 24 669 BoxColFill
> +0.180 3330 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3361 512 N
> +3330 512 N
>  0 668 V
>  23 0 V
>  0 -668 V
> @@ -3579,9 +3583,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3394 512 24 677 BoxColFill
> +0.180 3363 512 24 677 BoxColFill
>  LCb setrgbcolor
> -3394 512 N
> +3363 512 N
>  0 676 V
>  23 0 V
>  0 -676 V
> @@ -3590,9 +3594,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3427 512 24 680 BoxColFill
> +0.180 3395 512 24 680 BoxColFill
>  LCb setrgbcolor
> -3427 512 N
> +3395 512 N
>  0 679 V
>  23 0 V
>  0 -679 V
> @@ -3601,12 +3605,23 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3460 512 24 704 BoxColFill
> +0.180 3428 512 23 704 BoxColFill
>  LCb setrgbcolor
> -3460 512 N
> +3428 512 N
>  0 703 V
> -23 0 V
> +22 0 V
>  0 -703 V
> +-22 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 3460 512 24 706 BoxColFill
> +LCb setrgbcolor
> +3460 512 N
> +0 705 V
> +23 0 V
> +0 -705 V
>  -23 0 V
>  Z stroke
>  1.000 UL
> @@ -3645,27 +3660,27 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 605 539 24 1 BoxColFill
> +0.180 605 539 23 1 BoxColFill
>  LCb setrgbcolor
>  605 539 N
> -23 0 V
> --23 0 V
> +22 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 638 547 24 1 BoxColFill
> +0.180 637 547 24 1 BoxColFill
>  LCb setrgbcolor
> -638 547 N
> +637 547 N
>  23 0 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 671 549 24 19 BoxColFill
> +0.180 669 549 24 19 BoxColFill
>  LCb setrgbcolor
> -671 549 N
> +669 549 N
>  0 18 V
>  23 0 V
>  0 -18 V
> @@ -3674,9 +3689,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 704 543 24 21 BoxColFill
> +0.180 702 543 24 21 BoxColFill
>  LCb setrgbcolor
> -704 543 N
> +702 543 N
>  0 20 V
>  23 0 V
>  0 -20 V
> @@ -3685,9 +3700,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 736 543 24 22 BoxColFill
> +0.180 734 543 24 22 BoxColFill
>  LCb setrgbcolor
> -736 543 N
> +734 543 N
>  0 21 V
>  23 0 V
>  0 -21 V
> @@ -3696,9 +3711,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 769 544 24 26 BoxColFill
> +0.180 767 544 24 26 BoxColFill
>  LCb setrgbcolor
> -769 544 N
> +767 544 N
>  0 25 V
>  23 0 V
>  0 -25 V
> @@ -3707,9 +3722,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 802 555 24 35 BoxColFill
> +0.180 799 555 24 35 BoxColFill
>  LCb setrgbcolor
> -802 555 N
> +799 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3718,20 +3733,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 835 555 24 35 BoxColFill
> +0.180 832 555 23 35 BoxColFill
>  LCb setrgbcolor
> -835 555 N
> +832 555 N
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
> -0.180 868 555 24 35 BoxColFill
> +0.180 864 555 24 35 BoxColFill
>  LCb setrgbcolor
> -868 555 N
> +864 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3740,20 +3755,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 900 555 24 35 BoxColFill
> +0.180 897 555 23 35 BoxColFill
>  LCb setrgbcolor
> -900 555 N
> +897 555 N
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
> -0.180 933 555 24 35 BoxColFill
> +0.180 929 555 24 35 BoxColFill
>  LCb setrgbcolor
> -933 555 N
> +929 555 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3762,9 +3777,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 966 556 24 35 BoxColFill
> +0.180 961 556 24 35 BoxColFill
>  LCb setrgbcolor
> -966 556 N
> +961 556 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3773,9 +3788,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 999 621 24 35 BoxColFill
> +0.180 994 621 24 35 BoxColFill
>  LCb setrgbcolor
> -999 621 N
> +994 621 N
>  0 34 V
>  23 0 V
>  0 -34 V
> @@ -3784,9 +3799,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1032 620 24 36 BoxColFill
> +0.180 1026 620 24 36 BoxColFill
>  LCb setrgbcolor
> -1032 620 N
> +1026 620 N
>  0 35 V
>  23 0 V
>  0 -35 V
> @@ -3795,9 +3810,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1064 649 24 41 BoxColFill
> +0.180 1059 649 24 41 BoxColFill
>  LCb setrgbcolor
> -1064 649 N
> +1059 649 N
>  0 40 V
>  23 0 V
>  0 -40 V
> @@ -3806,9 +3821,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1097 656 24 41 BoxColFill
> +0.180 1091 656 24 41 BoxColFill
>  LCb setrgbcolor
> -1097 656 N
> +1091 656 N
>  0 40 V
>  23 0 V
>  0 -40 V
> @@ -3817,20 +3832,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1130 736 24 43 BoxColFill
> +0.180 1124 736 23 43 BoxColFill
>  LCb setrgbcolor
> -1130 736 N
> +1124 736 N
>  0 42 V
> -23 0 V
> +22 0 V
>  0 -42 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1163 737 24 44 BoxColFill
> +0.180 1156 737 24 44 BoxColFill
>  LCb setrgbcolor
> -1163 737 N
> +1156 737 N
>  0 43 V
>  23 0 V
>  0 -43 V
> @@ -3839,20 +3854,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1196 741 24 44 BoxColFill
> +0.180 1189 741 23 44 BoxColFill
>  LCb setrgbcolor
> -1196 741 N
> +1189 741 N
>  0 43 V
> -23 0 V
> +22 0 V
>  0 -43 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1229 667 24 45 BoxColFill
> +0.180 1221 667 24 45 BoxColFill
>  LCb setrgbcolor
> -1229 667 N
> +1221 667 N
>  0 44 V
>  23 0 V
>  0 -44 V
> @@ -3861,20 +3876,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1261 694 24 45 BoxColFill
> +0.180 1254 694 23 45 BoxColFill
>  LCb setrgbcolor
> -1261 694 N
> +1254 694 N
>  0 44 V
> -23 0 V
> +22 0 V
>  0 -44 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1294 714 24 49 BoxColFill
> +0.180 1286 714 24 49 BoxColFill
>  LCb setrgbcolor
> -1294 714 N
> +1286 714 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3883,9 +3898,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1327 722 24 49 BoxColFill
> +0.180 1318 722 24 49 BoxColFill
>  LCb setrgbcolor
> -1327 722 N
> +1318 722 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3894,9 +3909,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1360 731 24 48 BoxColFill
> +0.180 1351 731 24 48 BoxColFill
>  LCb setrgbcolor
> -1360 731 N
> +1351 731 N
>  0 47 V
>  23 0 V
>  0 -47 V
> @@ -3905,9 +3920,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1393 758 24 49 BoxColFill
> +0.180 1383 758 24 49 BoxColFill
>  LCb setrgbcolor
> -1393 758 N
> +1383 758 N
>  0 48 V
>  23 0 V
>  0 -48 V
> @@ -3916,9 +3931,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1425 782 24 58 BoxColFill
> +0.180 1416 782 24 58 BoxColFill
>  LCb setrgbcolor
> -1425 782 N
> +1416 782 N
>  0 57 V
>  23 0 V
>  0 -57 V
> @@ -3927,9 +3942,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1458 783 24 58 BoxColFill
> +0.180 1448 783 24 58 BoxColFill
>  LCb setrgbcolor
> -1458 783 N
> +1448 783 N
>  0 57 V
>  23 0 V
>  0 -57 V
> @@ -3938,20 +3953,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1491 824 24 57 BoxColFill
> +0.180 1481 824 23 57 BoxColFill
>  LCb setrgbcolor
> -1491 824 N
> +1481 824 N
>  0 56 V
> -23 0 V
> +22 0 V
>  0 -56 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1524 824 24 57 BoxColFill
> +0.180 1513 824 24 57 BoxColFill
>  LCb setrgbcolor
> -1524 824 N
> +1513 824 N
>  0 56 V
>  23 0 V
>  0 -56 V
> @@ -3960,20 +3975,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1557 830 24 57 BoxColFill
> +0.180 1546 830 23 57 BoxColFill
>  LCb setrgbcolor
> -1557 830 N
> +1546 830 N
>  0 56 V
> -23 0 V
> +22 0 V
>  0 -56 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1589 848 24 65 BoxColFill
> +0.180 1578 848 24 65 BoxColFill
>  LCb setrgbcolor
> -1589 848 N
> +1578 848 N
>  0 64 V
>  23 0 V
>  0 -64 V
> @@ -3982,20 +3997,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1622 867 24 67 BoxColFill
> +0.180 1611 867 23 67 BoxColFill
>  LCb setrgbcolor
> -1622 867 N
> +1611 867 N
>  0 66 V
> -23 0 V
> +22 0 V
>  0 -66 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1655 889 24 75 BoxColFill
> +0.180 1643 889 24 75 BoxColFill
>  LCb setrgbcolor
> -1655 889 N
> +1643 889 N
>  0 74 V
>  23 0 V
>  0 -74 V
> @@ -4004,9 +4019,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1688 889 24 76 BoxColFill
> +0.180 1675 889 24 76 BoxColFill
>  LCb setrgbcolor
> -1688 889 N
> +1675 889 N
>  0 75 V
>  23 0 V
>  0 -75 V
> @@ -4015,9 +4030,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1721 891 24 76 BoxColFill
> +0.180 1708 891 24 76 BoxColFill
>  LCb setrgbcolor
> -1721 891 N
> +1708 891 N
>  0 75 V
>  23 0 V
>  0 -75 V
> @@ -4026,31 +4041,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1754 912 23 76 BoxColFill
> +0.180 1740 912 24 76 BoxColFill
>  LCb setrgbcolor
> -1754 912 N
> +1740 912 N
>  0 75 V
> -22 0 V
> +23 0 V
>  0 -75 V
> --22 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1786 919 24 77 BoxColFill
> +0.180 1773 919 23 77 BoxColFill
>  LCb setrgbcolor
> -1786 919 N
> +1773 919 N
>  0 76 V
> -23 0 V
> +22 0 V
>  0 -76 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1819 920 24 78 BoxColFill
> +0.180 1805 920 24 78 BoxColFill
>  LCb setrgbcolor
> -1819 920 N
> +1805 920 N
>  0 77 V
>  23 0 V
>  0 -77 V
> @@ -4059,20 +4074,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1852 883 24 76 BoxColFill
> +0.180 1838 883 23 76 BoxColFill
>  LCb setrgbcolor
> -1852 883 N
> +1838 883 N
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
> -0.180 1885 897 24 75 BoxColFill
> +0.180 1870 897 24 75 BoxColFill
>  LCb setrgbcolor
> -1885 897 N
> +1870 897 N
>  0 74 V
>  23 0 V
>  0 -74 V
> @@ -4081,20 +4096,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1918 904 24 75 BoxColFill
> +0.180 1903 904 23 75 BoxColFill
>  LCb setrgbcolor
> -1918 904 N
> +1903 904 N
>  0 74 V
> -23 0 V
> +22 0 V
>  0 -74 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1950 911 24 119 BoxColFill
> +0.180 1935 911 24 119 BoxColFill
>  LCb setrgbcolor
> -1950 911 N
> +1935 911 N
>  0 118 V
>  23 0 V
>  0 -118 V
> @@ -4103,9 +4118,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1983 913 24 135 BoxColFill
> +0.180 1967 913 24 135 BoxColFill
>  LCb setrgbcolor
> -1983 913 N
> +1967 913 N
>  0 134 V
>  23 0 V
>  0 -134 V
> @@ -4114,9 +4129,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2016 921 24 141 BoxColFill
> +0.180 2000 921 24 141 BoxColFill
>  LCb setrgbcolor
> -2016 921 N
> +2000 921 N
>  0 140 V
>  23 0 V
>  0 -140 V
> @@ -4125,9 +4140,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2049 929 24 142 BoxColFill
> +0.180 2032 929 24 142 BoxColFill
>  LCb setrgbcolor
> -2049 929 N
> +2032 929 N
>  0 141 V
>  23 0 V
>  0 -141 V
> @@ -4136,9 +4151,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2082 950 24 147 BoxColFill
> +0.180 2065 950 24 147 BoxColFill
>  LCb setrgbcolor
> -2082 950 N
> +2065 950 N
>  0 146 V
>  23 0 V
>  0 -146 V
> @@ -4147,9 +4162,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2114 954 24 147 BoxColFill
> +0.180 2097 954 24 147 BoxColFill
>  LCb setrgbcolor
> -2114 954 N
> +2097 954 N
>  0 146 V
>  23 0 V
>  0 -146 V
> @@ -4158,20 +4173,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2147 953 24 148 BoxColFill
> +0.180 2130 953 23 148 BoxColFill
>  LCb setrgbcolor
> -2147 953 N
> +2130 953 N
>  0 147 V
> -23 0 V
> +22 0 V
>  0 -147 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2180 961 24 149 BoxColFill
> +0.180 2162 961 24 149 BoxColFill
>  LCb setrgbcolor
> -2180 961 N
> +2162 961 N
>  0 148 V
>  23 0 V
>  0 -148 V
> @@ -4180,20 +4195,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2213 962 24 151 BoxColFill
> +0.180 2195 962 23 151 BoxColFill
>  LCb setrgbcolor
> -2213 962 N
> +2195 962 N
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
> -0.180 2246 967 24 151 BoxColFill
> +0.180 2227 967 24 151 BoxColFill
>  LCb setrgbcolor
> -2246 967 N
> +2227 967 N
>  0 150 V
>  23 0 V
>  0 -150 V
> @@ -4202,9 +4217,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2279 989 23 151 BoxColFill
> +0.180 2260 989 23 151 BoxColFill
>  LCb setrgbcolor
> -2279 989 N
> +2260 989 N
>  0 150 V
>  22 0 V
>  0 -150 V
> @@ -4213,9 +4228,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2311 994 24 154 BoxColFill
> +0.180 2292 994 24 154 BoxColFill
>  LCb setrgbcolor
> -2311 994 N
> +2292 994 N
>  0 153 V
>  23 0 V
>  0 -153 V
> @@ -4224,9 +4239,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2344 998 24 154 BoxColFill
> +0.180 2324 998 24 154 BoxColFill
>  LCb setrgbcolor
> -2344 998 N
> +2324 998 N
>  0 153 V
>  23 0 V
>  0 -153 V
> @@ -4235,9 +4250,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2377 1003 24 190 BoxColFill
> +0.180 2357 1003 24 190 BoxColFill
>  LCb setrgbcolor
> -2377 1003 N
> +2357 1003 N
>  0 189 V
>  23 0 V
>  0 -189 V
> @@ -4246,9 +4261,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2410 1006 24 192 BoxColFill
> +0.180 2389 1006 24 192 BoxColFill
>  LCb setrgbcolor
> -2410 1006 N
> +2389 1006 N
>  0 191 V
>  23 0 V
>  0 -191 V
> @@ -4257,20 +4272,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2443 1008 24 192 BoxColFill
> +0.180 2422 1008 23 192 BoxColFill
>  LCb setrgbcolor
> -2443 1008 N
> +2422 1008 N
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
> -0.180 2475 1011 24 192 BoxColFill
> +0.180 2454 1011 24 192 BoxColFill
>  LCb setrgbcolor
> -2475 1011 N
> +2454 1011 N
>  0 191 V
>  23 0 V
>  0 -191 V
> @@ -4279,20 +4294,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2508 1018 24 192 BoxColFill
> +0.180 2487 1018 23 192 BoxColFill
>  LCb setrgbcolor
> -2508 1018 N
> +2487 1018 N
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
> -0.180 2541 1103 24 194 BoxColFill
> +0.180 2519 1103 24 194 BoxColFill
>  LCb setrgbcolor
> -2541 1103 N
> +2519 1103 N
>  0 193 V
>  23 0 V
>  0 -193 V
> @@ -4301,20 +4316,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2574 1047 24 197 BoxColFill
> +0.180 2552 1047 23 197 BoxColFill
>  LCb setrgbcolor
> -2574 1047 N
> +2552 1047 N
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
> -0.180 2607 1044 24 198 BoxColFill
> +0.180 2584 1044 24 198 BoxColFill
>  LCb setrgbcolor
> -2607 1044 N
> +2584 1044 N
>  0 197 V
>  23 0 V
>  0 -197 V
> @@ -4323,9 +4338,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2639 1046 24 199 BoxColFill
> +0.180 2616 1046 24 199 BoxColFill
>  LCb setrgbcolor
> -2639 1046 N
> +2616 1046 N
>  0 198 V
>  23 0 V
>  0 -198 V
> @@ -4334,9 +4349,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2672 1043 24 197 BoxColFill
> +0.180 2649 1043 24 197 BoxColFill
>  LCb setrgbcolor
> -2672 1043 N
> +2649 1043 N
>  0 196 V
>  23 0 V
>  0 -196 V
> @@ -4345,9 +4360,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2705 1043 24 198 BoxColFill
> +0.180 2681 1043 24 198 BoxColFill
>  LCb setrgbcolor
> -2705 1043 N
> +2681 1043 N
>  0 197 V
>  23 0 V
>  0 -197 V
> @@ -4356,9 +4371,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2738 1042 24 200 BoxColFill
> +0.180 2714 1042 24 200 BoxColFill
>  LCb setrgbcolor
> -2738 1042 N
> +2714 1042 N
>  0 199 V
>  23 0 V
>  0 -199 V
> @@ -4367,9 +4382,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2771 1050 24 207 BoxColFill
> +0.180 2746 1050 24 207 BoxColFill
>  LCb setrgbcolor
> -2771 1050 N
> +2746 1050 N
>  0 206 V
>  23 0 V
>  0 -206 V
> @@ -4378,20 +4393,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2803 1034 24 210 BoxColFill
> +0.180 2779 1034 23 210 BoxColFill
>  LCb setrgbcolor
> -2803 1034 N
> +2779 1034 N
>  0 209 V
> -23 0 V
> +22 0 V
>  0 -209 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2836 1038 24 295 BoxColFill
> +0.180 2811 1038 24 295 BoxColFill
>  LCb setrgbcolor
> -2836 1038 N
> +2811 1038 N
>  0 294 V
>  23 0 V
>  0 -294 V
> @@ -4400,20 +4415,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2869 1022 24 220 BoxColFill
> +0.180 2844 1022 23 220 BoxColFill
>  LCb setrgbcolor
> -2869 1022 N
> +2844 1022 N
>  0 219 V
> -23 0 V
> +22 0 V
>  0 -219 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2902 1020 24 211 BoxColFill
> +0.180 2876 1020 24 211 BoxColFill
>  LCb setrgbcolor
> -2902 1020 N
> +2876 1020 N
>  0 210 V
>  23 0 V
>  0 -210 V
> @@ -4422,20 +4437,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2935 1025 24 214 BoxColFill
> +0.180 2909 1025 23 214 BoxColFill
>  LCb setrgbcolor
> -2935 1025 N
> +2909 1025 N
>  0 213 V
> -23 0 V
> +22 0 V
>  0 -213 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2968 1043 24 215 BoxColFill
> +0.180 2941 1043 24 215 BoxColFill
>  LCb setrgbcolor
> -2968 1043 N
> +2941 1043 N
>  0 214 V
>  23 0 V
>  0 -214 V
> @@ -4444,9 +4459,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3000 1045 24 216 BoxColFill
> +0.180 2973 1045 24 216 BoxColFill
>  LCb setrgbcolor
> -3000 1045 N
> +2973 1045 N
>  0 215 V
>  23 0 V
>  0 -215 V
> @@ -4455,9 +4470,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3033 1053 24 221 BoxColFill
> +0.180 3006 1053 24 221 BoxColFill
>  LCb setrgbcolor
> -3033 1053 N
> +3006 1053 N
>  0 220 V
>  23 0 V
>  0 -220 V
> @@ -4466,9 +4481,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3066 1064 24 224 BoxColFill
> +0.180 3038 1064 24 224 BoxColFill
>  LCb setrgbcolor
> -3066 1064 N
> +3038 1064 N
>  0 223 V
>  23 0 V
>  0 -223 V
> @@ -4477,9 +4492,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3099 1113 24 230 BoxColFill
> +0.180 3071 1113 24 230 BoxColFill
>  LCb setrgbcolor
> -3099 1113 N
> +3071 1113 N
>  0 229 V
>  23 0 V
>  0 -229 V
> @@ -4488,9 +4503,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3132 1122 24 270 BoxColFill
> +0.180 3103 1122 24 270 BoxColFill
>  LCb setrgbcolor
> -3132 1122 N
> +3103 1122 N
>  0 269 V
>  23 0 V
>  0 -269 V
> @@ -4499,20 +4514,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3164 1129 24 274 BoxColFill
> +0.180 3136 1129 23 274 BoxColFill
>  LCb setrgbcolor
> -3164 1129 N
> +3136 1129 N
>  0 273 V
> -23 0 V
> +22 0 V
>  0 -273 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3197 1132 24 279 BoxColFill
> +0.180 3168 1132 24 279 BoxColFill
>  LCb setrgbcolor
> -3197 1132 N
> +3168 1132 N
>  0 278 V
>  23 0 V
>  0 -278 V
> @@ -4521,20 +4536,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3230 1167 24 312 BoxColFill
> +0.180 3201 1167 23 312 BoxColFill
>  LCb setrgbcolor
> -3230 1167 N
> +3201 1167 N
>  0 311 V
> -23 0 V
> +22 0 V
>  0 -311 V
> --23 0 V
> +-22 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3263 1175 24 331 BoxColFill
> +0.180 3233 1175 24 331 BoxColFill
>  LCb setrgbcolor
> -3263 1175 N
> +3233 1175 N
>  0 330 V
>  23 0 V
>  0 -330 V
> @@ -4543,9 +4558,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3296 1180 24 346 BoxColFill
> +0.180 3265 1180 24 346 BoxColFill
>  LCb setrgbcolor
> -3296 1180 N
> +3265 1180 N
>  0 345 V
>  23 0 V
>  0 -345 V
> @@ -4554,9 +4569,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3328 1180 24 358 BoxColFill
> +0.180 3298 1180 24 358 BoxColFill
>  LCb setrgbcolor
> -3328 1180 N
> +3298 1180 N
>  0 357 V
>  23 0 V
>  0 -357 V
> @@ -4565,9 +4580,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3361 1180 24 359 BoxColFill
> +0.180 3330 1180 24 359 BoxColFill
>  LCb setrgbcolor
> -3361 1180 N
> +3330 1180 N
>  0 358 V
>  23 0 V
>  0 -358 V
> @@ -4576,9 +4591,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3394 1188 24 362 BoxColFill
> +0.180 3363 1188 24 362 BoxColFill
>  LCb setrgbcolor
> -3394 1188 N
> +3363 1188 N
>  0 361 V
>  23 0 V
>  0 -361 V
> @@ -4587,9 +4602,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3427 1191 24 365 BoxColFill
> +0.180 3395 1191 24 365 BoxColFill
>  LCb setrgbcolor
> -3427 1191 N
> +3395 1191 N
>  0 364 V
>  23 0 V
>  0 -364 V
> @@ -4598,12 +4613,23 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3460 1215 24 368 BoxColFill
> +0.180 3428 1215 23 368 BoxColFill
>  LCb setrgbcolor
> -3460 1215 N
> +3428 1215 N
>  0 367 V
> -23 0 V
> +22 0 V
>  0 -367 V
> +-22 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 3460 1217 24 371 BoxColFill
> +LCb setrgbcolor
> +3460 1217 N
> +0 370 V
> +23 0 V
> +0 -370 V
>  -23 0 V
>  Z stroke
>  1.000 UL
> @@ -4624,95 +4650,96 @@ LTb
>  0.55 0.00 0.00 C
>  2092 1457 M
>  255 0 V
> -584 512 M
> +583 512 M
>  33 0 V
>  32 0 V
>  33 778 V
> -33 193 V
> -33 -5 V
> -33 87 V
> -32 29 V
> -33 3 V
> -33 0 V
> +32 193 V
>  33 -5 V
> +32 87 V
> +33 29 V
> +32 3 V
>  33 0 V
> +32 -5 V
> +32 0 V
>  33 -17 V
>  32 -483 V
>  33 2 V
> -33 -38 V
> +32 -38 V
>  33 -20 V
> -33 -140 V
> -32 0 V
> -33 -5 V
> -33 150 V
> +32 -140 V
> +33 0 V
> +32 -5 V
> +32 150 V
>  33 -51 V
> -33 -17 V
> -32 -14 V
> -33 -15 V
> +32 -17 V
> +33 -14 V
> +32 -15 V
>  33 -38 V
> -33 24 V
> +32 24 V
>  33 -2 V
> -33 -46 V
> -32 0 V
> -33 -8 V
> -33 20 V
> +32 -46 V
> +33 0 V
> +32 -8 V
> +32 20 V
>  33 -3 V
> -33 17 V
> -32 3 V
> -33 4 V
> +32 17 V
> +33 3 V
> +32 4 V
>  33 -21 V
> -33 0 V
> +32 0 V
>  33 0 V
>  32 26 V
> -33 -19 V
> +32 -19 V
>  33 -5 V
> -33 169 V
> +32 169 V
>  33 51 V
> -33 14 V
> -32 -7 V
> +32 14 V
>  33 -7 V
> +32 -7 V
>  33 -5 V
> -33 5 V
> +32 5 V
>  33 -5 V
>  32 5 V
> -33 -2 V
> +32 -2 V
>  33 -22 V
> -33 0 V
> +32 0 V
>  33 -3 V
>  32 95 V
>  33 2 V
> -33 -2 V
> +32 -2 V
>  33 -3 V
> -33 -5 V
> +32 -5 V
>  32 -70 V
>  33 53 V
> -33 8 V
> +32 8 V
>  33 -3 V
> -33 -2 V
> +32 -2 V
>  33 2 V
>  32 5 V
>  33 12 V
> -33 22 V
> +32 22 V
>  33 176 V
> -33 -142 V
> +32 -142 V
>  32 -20 V
>  33 5 V
> -33 -14 V
> +32 -14 V
>  33 -3 V
> -33 5 V
> -32 -2 V
> -33 -29 V
> +32 5 V
> +33 -2 V
> +32 -29 V
>  33 72 V
> -33 3 V
> -33 5 V
> +32 3 V
> +32 5 V
>  33 31 V
>  32 24 V
>  33 19 V
> -33 20 V
> +32 20 V
>  33 2 V
> +32 0 V
> +33 -2 V
> +32 -10 V
>  33 0 V
> -32 -2 V
> -33 -10 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index 36f68acc2faa..08342261a83d 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -86,4 +86,5 @@ v5.12 18965 9025 27990 32.2
>  v5.16 19359 10362 29721 34.9
>  ""    19576 10482 30058 34.9
>  ""    19683 10526 30209 34.8
> -v5.19 20354 10656 31010 34.4
> +""    20354 10656 31010 34.4
> +v6.0  20422 10716 31138 34.4
> 
> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> -- 
> 2.25.1
> 
