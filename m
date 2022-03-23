Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345482AbiCWXJT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 23 Mar 2022 19:09:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3078490CE9
        for <perfbook@vger.kernel.org>; Wed, 23 Mar 2022 16:07:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91613B8214F
        for <perfbook@vger.kernel.org>; Wed, 23 Mar 2022 23:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648076863;
        bh=RJ6i1UJro3jgmR5Z+rTNDUxiDfAP++BX5UUbgqKlDSg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=lH7FFyYlsad0l1YbF5onkYgFNTrH7JQpwqoGEfR1+zQZtCmIUJ18WbAg63klk6scX
         3Dda1KLJHrqC3eL/9mUZaYnaDwViDswh/YwuXae1CoLns0Nc2gkRvTVfHwjhQ0vBAL
         Sqq1SE9fdVDhzp+hgLQ7+eIG2vYSGLlQL8fK6mP0iZtm9gWZqNphY6qzqUgFS/WEEk
         juiF80l7mgtDQgLEdNxHeCbhnhnH6ES6I1SBSMuYYzJ2fjnvZ0INCG9jKejw6kc8Vj
         /jZDEfMmXamG2WFPFVn5y5TmUhCHefMYFaG+TLOHpNH3ECTYOODTk0CdYiztCKJLGG
         WsiCDr+8njcIQ==
Date: Wed, 23 Mar 2022 16:07:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] formal: Update RCU-test-ratio table as of v5.17
Message-ID: <20220323230742.GR4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <8961925c-68d2-21e8-5c0a-84e1241b6554@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8961925c-68d2-21e8-5c0a-84e1241b6554@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Mar 23, 2022 at 11:37:18AM +0900, Akira Yokosawa wrote:
> Routine update of Figure 12.4.
> Total LOC of RCU + test has exceeded 30000 (30058) in v5.17.
> The range of y-axis (LOC) in plot.sh has been widened to [0,35000].
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/formal/data/RCU-test-ratio.eps | 2303 +++++++++++---------
>  CodeSamples/formal/data/plot.sh            |    2 +-
>  CodeSamples/formal/data/rcu-test.dat       |    3 +-
>  3 files changed, 1284 insertions(+), 1024 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index 6a37da5f..ed7ad849 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
> -%%Creator: gnuplot 5.2 patchlevel 2
> -%%CreationDate: Mon Jan 10 17:24:15 2022
> +%%Creator: gnuplot 5.2 patchlevel 8
> +%%CreationDate: Wed Mar 23 11:07:11 2022
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 453 230
>  %%Orientation: Portrait
> @@ -50,7 +50,7 @@ gnudict begin
>    } if
>  } def
>  %
> -% Gnuplot Prolog Version 5.1 (Oct 2015)
> +% Gnuplot Prolog Version 5.2 (Dec 2017)
>  %
>  %/SuppressPDFMark true def
>  %
> @@ -307,7 +307,7 @@ gnudict begin
>    ColR ColG ColB setrgbcolor} def
>  /BoxColFill {gsave Rec PolyFill} def
>  /PolyFill {gsave Density fill grestore grestore} def
> -/h {rlineto rlineto rlineto gsave closepath fill grestore} bind def
> +/h {rlineto rlineto rlineto closepath gsave fill grestore stroke} bind def
>  %
>  % PostScript Level 1 Pattern Fill routine for rectangles
>  % Usage: x y w h s a XX PatternFill
> @@ -1869,10 +1869,10 @@ systemdict /pdfmark known not {
>  SDict begin [
>    /Title (RCU-test-ratio.eps)
>    /Subject (gnuplot plot)
> -  /Creator (gnuplot 5.2 patchlevel 2)
> +  /Creator (gnuplot 5.2 patchlevel 8)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Mon Jan 10 17:24:15 2022)
> +  /CreationDate (Wed Mar 23 11:07:11 2022)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1923,51 +1923,68 @@ stroke
>  440 512 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
> +/vshift -26 def
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -551 713 M
> +551 685 M
>  -63 0 V
>  stroke
> -440 713 M
> +440 685 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 5000)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -551 915 M
> +551 857 M
>  -63 0 V
>  stroke
> -440 915 M
> +440 857 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 10000)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -551 1116 M
> +551 1030 M
>  -63 0 V
>  stroke
> -440 1116 M
> +440 1030 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 15000)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -551 1317 M
> +551 1202 M
>  -63 0 V
>  stroke
> -440 1317 M
> +440 1202 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 20000)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -551 1519 M
> +551 1375 M
>  -63 0 V
>  stroke
> -440 1519 M
> +440 1375 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 25000)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
> +1.000 UL
> +LTb
> +LCb setrgbcolor
> +551 1547 M
> +-63 0 V
> +stroke
> +440 1547 M
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 30000)]
> +] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -1975,8 +1992,9 @@ LCb setrgbcolor
>  -63 0 V
>  stroke
>  440 1720 M
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 30000)]
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 35000)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -1987,462 +2005,487 @@ currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.12)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -619 512 M
> +618 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -653 512 M
> +652 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -687 512 M
> +685 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -721 512 M
> +719 512 M
>  stroke
> -721 464 M
> +719 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -755 512 M
> +752 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -789 512 M
> +786 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -823 512 M
> +819 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -856 512 M
> +853 512 M
>  stroke
> -856 464 M
> +853 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -890 512 M
> +887 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -924 512 M
> +920 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -958 512 M
> +954 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -992 512 M
> +987 512 M
>  stroke
> -992 464 M
> +987 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1026 512 M
> +1021 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1060 512 M
> +1054 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1094 512 M
> +1088 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1128 512 M
> +1121 512 M
>  stroke
> -1128 464 M
> +1121 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1162 512 M
> +1155 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1196 512 M
> +1189 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1230 512 M
> +1222 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1264 512 M
> +1256 512 M
>  stroke
> -1264 464 M
> +1256 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1298 512 M
> +1289 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1332 512 M
> +1323 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1366 512 M
> +1356 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1400 512 M
> +1390 512 M
>  stroke
> -1400 464 M
> +1390 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1434 512 M
> +1423 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1467 512 M
> +1457 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1501 512 M
> +1491 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1535 512 M
> +1524 512 M
>  stroke
> -1535 464 M
> +1524 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1569 512 M
> +1558 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1603 512 M
> +1591 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1637 512 M
> +1625 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1671 512 M
> +1658 512 M
>  stroke
> -1671 464 M
> +1658 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1705 512 M
> +1692 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1739 512 M
> +1725 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1773 512 M
> +1759 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1807 512 M
> +1793 512 M
>  stroke
> -1807 464 M
> +1793 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1841 512 M
> +1826 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1875 512 M
> +1860 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1909 512 M
> +1893 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1943 512 M
> +1927 512 M
>  stroke
> -1943 464 M
> +1927 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1977 512 M
> +1960 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2011 512 M
> +1994 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2044 512 M
> +2028 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2078 512 M
> +2061 512 M
>  stroke
> -2078 464 M
> +2061 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2112 512 M
> +2095 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2146 512 M
> +2128 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2180 512 M
> +2162 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2214 512 M
> +2195 512 M
>  stroke
> -2214 464 M
> +2195 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2248 512 M
> +2229 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2282 512 M
> +2262 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2316 512 M
> +2296 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2350 512 M
> +2330 512 M
>  stroke
> -2350 464 M
> +2330 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2384 512 M
> +2363 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2418 512 M
> +2397 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2452 512 M
> +2430 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2486 512 M
> +2464 512 M
>  stroke
> -2486 464 M
> +2464 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2520 512 M
> +2497 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2554 512 M
> +2531 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2588 512 M
> +2564 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2621 512 M
> +2598 512 M
>  stroke
> -2621 464 M
> +2598 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2655 512 M
> +2632 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2689 512 M
> +2665 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2723 512 M
> +2699 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2757 512 M
> +2732 512 M
>  stroke
> -2757 464 M
> +2732 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2791 512 M
> +2766 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2825 512 M
> +2799 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2859 512 M
> +2833 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2893 512 M
> +2866 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2927 512 M
> +2900 512 M
>  stroke
> -2927 464 M
> +2900 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2961 512 M
> +2934 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2995 512 M
> +2967 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3029 512 M
> +3001 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3063 512 M
> +3034 512 M
>  stroke
> -3063 464 M
> +3034 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3097 512 M
> +3068 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3131 512 M
> +3101 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3165 512 M
> +3135 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3199 512 M
> +3168 512 M
>  stroke
> -3199 464 M
> +3168 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3232 512 M
> +3202 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3266 512 M
> +3236 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3300 512 M
> +3269 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3334 512 M
> +3303 512 M
>  stroke
> -3334 464 M
> +3303 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3368 512 M
> +3336 512 M
> +stroke
> +LTb
> +LCb setrgbcolor
> +3370 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3402 512 M
> +3403 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3436 512 M
> +3437 512 M
>  stroke
>  LTb
>  LCb setrgbcolor
> @@ -2450,9 +2493,10 @@ LCb setrgbcolor
>  stroke
>  3470 464 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
> -[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.16)]
> +[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.17)]
>  ] -26.7 MRshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2462,6 +2506,7 @@ stroke
>  3615 512 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
>  ] -26.7 MLshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2471,6 +2516,7 @@ stroke
>  3615 754 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 10)]
>  ] -26.7 MLshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2480,6 +2526,7 @@ stroke
>  3615 995 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 20)]
>  ] -26.7 MLshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2489,6 +2536,7 @@ stroke
>  3615 1237 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 30)]
>  ] -26.7 MLshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2498,6 +2546,7 @@ stroke
>  3615 1478 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 40)]
>  ] -26.7 MLshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2507,6 +2556,7 @@ stroke
>  3615 1720 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 50)]
>  ] -26.7 MLshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> @@ -2524,34 +2574,40 @@ Z stroke
>  LTb
>  LCb setrgbcolor
>  LCb setrgbcolor
> -72 1116 M
> +76 1116 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (LoC)]
>  ] -26.7 MCshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  LTb
>  LCb setrgbcolor
> -3903 1116 M
> +3847 1116 M
>  currentpoint gsave translate -270 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (% Test)]
>  ] -26.7 MCshow
>  grestore
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  LTb
>  LCb setrgbcolor
>  2027 56 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Linux Release)]
>  ] -26.7 MCshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  LTb
>  % Begin plot #1
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C LCb setrgbcolor
> +0.00 0.00 0.00 C
> +LCb setrgbcolor
>  2044 1617 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (RCU)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2092 1597 255 40 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2092 1597 255 40 BoxColFill
>  LCb setrgbcolor
>  2092 1597 N
>  255 0 V
> @@ -2561,877 +2617,978 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 573 512 25 32 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 573 512 24 28 BoxColFill
>  LCb setrgbcolor
>  573 512 N
> -0 31 V
> -24 0 V
> -0 -31 V
> --24 0 V
> +0 27 V
> +23 0 V
> +0 -27 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 607 512 25 32 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 606 512 25 28 BoxColFill
>  LCb setrgbcolor
> -607 512 N
> -0 31 V
> +606 512 N
> +0 27 V
>  24 0 V
> -0 -31 V
> +0 -27 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 641 512 25 42 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 640 512 24 36 BoxColFill
>  LCb setrgbcolor
> -641 512 N
> -0 41 V
> -24 0 V
> -0 -41 V
> --24 0 V
> +640 512 N
> +0 35 V
> +23 0 V
> +0 -35 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 675 512 25 44 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 673 512 25 38 BoxColFill
>  LCb setrgbcolor
> -675 512 N
> -0 43 V
> +673 512 N
> +0 37 V
>  24 0 V
> -0 -43 V
> +0 -37 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 709 512 25 37 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 707 512 25 32 BoxColFill
>  LCb setrgbcolor
> -709 512 N
> -0 36 V
> +707 512 N
> +0 31 V
>  24 0 V
> -0 -36 V
> +0 -31 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 743 512 25 37 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 741 512 24 32 BoxColFill
> +LCb setrgbcolor
> +741 512 N
> +0 31 V
> +23 0 V
> +0 -31 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 774 512 25 33 BoxColFill
>  LCb setrgbcolor
> -743 512 N
> -0 36 V
> +774 512 N
> +0 32 V
>  24 0 V
> -0 -36 V
> +0 -32 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 777 512 24 38 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 808 512 24 44 BoxColFill
>  LCb setrgbcolor
> -777 512 N
> -0 37 V
> +808 512 N
> +0 43 V
>  23 0 V
> -0 -37 V
> +0 -43 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 811 512 24 51 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 841 512 25 44 BoxColFill
>  LCb setrgbcolor
> -811 512 N
> -0 50 V
> -23 0 V
> -0 -50 V
> --23 0 V
> +841 512 N
> +0 43 V
> +24 0 V
> +0 -43 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 845 512 24 51 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 875 512 24 44 BoxColFill
>  LCb setrgbcolor
> -845 512 N
> -0 50 V
> +875 512 N
> +0 43 V
>  23 0 V
> -0 -50 V
> +0 -43 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 879 512 24 51 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 908 512 25 44 BoxColFill
> +LCb setrgbcolor
> +908 512 N
> +0 43 V
> +24 0 V
> +0 -43 V
> +-24 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 942 512 24 44 BoxColFill
>  LCb setrgbcolor
> -879 512 N
> -0 50 V
> +942 512 N
> +0 43 V
>  23 0 V
> -0 -50 V
> +0 -43 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 912 512 25 51 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 975 512 25 45 BoxColFill
>  LCb setrgbcolor
> -912 512 N
> -0 50 V
> +975 512 N
> +0 44 V
>  24 0 V
> -0 -50 V
> +0 -44 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 946 512 25 51 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1009 512 25 110 BoxColFill
>  LCb setrgbcolor
> -946 512 N
> -0 50 V
> +1009 512 N
> +0 109 V
>  24 0 V
> -0 -50 V
> +0 -109 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 980 512 25 52 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1043 512 24 109 BoxColFill
>  LCb setrgbcolor
> -980 512 N
> -0 51 V
> -24 0 V
> -0 -51 V
> --24 0 V
> +1043 512 N
> +0 108 V
> +23 0 V
> +0 -108 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1014 512 25 128 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1076 512 25 138 BoxColFill
>  LCb setrgbcolor
> -1014 512 N
> -0 127 V
> +1076 512 N
> +0 137 V
>  24 0 V
> -0 -127 V
> +0 -137 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1048 512 25 128 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1110 512 24 145 BoxColFill
>  LCb setrgbcolor
> -1048 512 N
> -0 127 V
> -24 0 V
> -0 -127 V
> --24 0 V
> +1110 512 N
> +0 144 V
> +23 0 V
> +0 -144 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1082 512 25 161 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1143 512 25 225 BoxColFill
>  LCb setrgbcolor
> -1082 512 N
> -0 160 V
> +1143 512 N
> +0 224 V
>  24 0 V
> -0 -160 V
> +0 -224 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1116 512 25 169 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1177 512 24 226 BoxColFill
>  LCb setrgbcolor
> -1116 512 N
> -0 168 V
> -24 0 V
> -0 -168 V
> --24 0 V
> +1177 512 N
> +0 225 V
> +23 0 V
> +0 -225 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1150 512 25 262 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1210 512 25 230 BoxColFill
>  LCb setrgbcolor
> -1150 512 N
> -0 261 V
> +1210 512 N
> +0 229 V
>  24 0 V
> -0 -261 V
> +0 -229 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1184 512 25 264 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1244 512 24 156 BoxColFill
>  LCb setrgbcolor
> -1184 512 N
> -0 263 V
> -24 0 V
> -0 -263 V
> --24 0 V
> +1244 512 N
> +0 155 V
> +23 0 V
> +0 -155 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1218 512 25 268 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1278 512 24 183 BoxColFill
>  LCb setrgbcolor
> -1218 512 N
> -0 267 V
> -24 0 V
> -0 -267 V
> --24 0 V
> +1278 512 N
> +0 182 V
> +23 0 V
> +0 -182 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1252 512 25 182 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1311 512 25 203 BoxColFill
>  LCb setrgbcolor
> -1252 512 N
> -0 181 V
> +1311 512 N
> +0 202 V
>  24 0 V
> -0 -181 V
> +0 -202 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1286 512 25 213 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1345 512 24 211 BoxColFill
>  LCb setrgbcolor
> -1286 512 N
> -0 212 V
> -24 0 V
> -0 -212 V
> --24 0 V
> +1345 512 N
> +0 210 V
> +23 0 V
> +0 -210 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1320 512 25 237 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1378 512 25 220 BoxColFill
>  LCb setrgbcolor
> -1320 512 N
> -0 236 V
> +1378 512 N
> +0 219 V
>  24 0 V
> -0 -236 V
> +0 -219 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1354 512 25 246 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1412 512 24 247 BoxColFill
> +LCb setrgbcolor
> +1412 512 N
> +0 246 V
> +23 0 V
> +0 -246 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 1445 512 25 271 BoxColFill
>  LCb setrgbcolor
> -1354 512 N
> -0 245 V
> +1445 512 N
> +0 270 V
>  24 0 V
> -0 -245 V
> +0 -270 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1388 512 24 256 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1479 512 24 272 BoxColFill
>  LCb setrgbcolor
> -1388 512 N
> -0 255 V
> +1479 512 N
> +0 271 V
>  23 0 V
> -0 -255 V
> +0 -271 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1422 512 24 288 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1512 512 25 313 BoxColFill
>  LCb setrgbcolor
> -1422 512 N
> -0 287 V
> -23 0 V
> -0 -287 V
> --23 0 V
> +1512 512 N
> +0 312 V
> +24 0 V
> +0 -312 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1456 512 24 317 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1546 512 24 313 BoxColFill
>  LCb setrgbcolor
> -1456 512 N
> -0 316 V
> +1546 512 N
> +0 312 V
>  23 0 V
> -0 -316 V
> +0 -312 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1490 512 24 317 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1580 512 24 319 BoxColFill
>  LCb setrgbcolor
> -1490 512 N
> -0 316 V
> +1580 512 N
> +0 318 V
>  23 0 V
> -0 -316 V
> +0 -318 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1523 512 25 365 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1613 512 25 337 BoxColFill
>  LCb setrgbcolor
> -1523 512 N
> -0 364 V
> +1613 512 N
> +0 336 V
>  24 0 V
> -0 -364 V
> +0 -336 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1557 512 25 365 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1647 512 24 356 BoxColFill
>  LCb setrgbcolor
> -1557 512 N
> -0 364 V
> -24 0 V
> -0 -364 V
> --24 0 V
> +1647 512 N
> +0 355 V
> +23 0 V
> +0 -355 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1591 512 25 372 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1680 512 25 378 BoxColFill
>  LCb setrgbcolor
> -1591 512 N
> -0 371 V
> +1680 512 N
> +0 377 V
>  24 0 V
> -0 -371 V
> +0 -377 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1625 512 25 393 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1714 512 24 378 BoxColFill
>  LCb setrgbcolor
> -1625 512 N
> -0 392 V
> -24 0 V
> -0 -392 V
> --24 0 V
> +1714 512 N
> +0 377 V
> +23 0 V
> +0 -377 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1659 512 25 415 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1747 512 25 380 BoxColFill
>  LCb setrgbcolor
> -1659 512 N
> -0 414 V
> +1747 512 N
> +0 379 V
>  24 0 V
> -0 -414 V
> +0 -379 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1693 512 25 441 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1781 512 24 401 BoxColFill
>  LCb setrgbcolor
> -1693 512 N
> -0 440 V
> -24 0 V
> -0 -440 V
> --24 0 V
> +1781 512 N
> +0 400 V
> +23 0 V
> +0 -400 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1727 512 25 441 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1814 512 25 408 BoxColFill
>  LCb setrgbcolor
> -1727 512 N
> -0 440 V
> +1814 512 N
> +0 407 V
>  24 0 V
> -0 -440 V
> +0 -407 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1761 512 25 443 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1848 512 24 409 BoxColFill
>  LCb setrgbcolor
> -1761 512 N
> -0 442 V
> -24 0 V
> -0 -442 V
> --24 0 V
> +1848 512 N
> +0 408 V
> +23 0 V
> +0 -408 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1795 512 25 467 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1882 512 24 372 BoxColFill
>  LCb setrgbcolor
> -1795 512 N
> -0 466 V
> -24 0 V
> -0 -466 V
> --24 0 V
> +1882 512 N
> +0 371 V
> +23 0 V
> +0 -371 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1829 512 25 476 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1915 512 25 386 BoxColFill
>  LCb setrgbcolor
> -1829 512 N
> -0 475 V
> +1915 512 N
> +0 385 V
>  24 0 V
> -0 -475 V
> +0 -385 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1863 512 25 477 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1949 512 24 393 BoxColFill
>  LCb setrgbcolor
> -1863 512 N
> -0 476 V
> -24 0 V
> -0 -476 V
> --24 0 V
> +1949 512 N
> +0 392 V
> +23 0 V
> +0 -392 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1897 512 25 433 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 1982 512 25 400 BoxColFill
>  LCb setrgbcolor
> -1897 512 N
> -0 432 V
> +1982 512 N
> +0 399 V
>  24 0 V
> -0 -432 V
> +0 -399 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1931 512 25 450 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2016 512 24 402 BoxColFill
>  LCb setrgbcolor
> -1931 512 N
> -0 449 V
> +2016 512 N
> +0 401 V
> +23 0 V
> +0 -401 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 2049 512 25 410 BoxColFill
> +LCb setrgbcolor
> +2049 512 N
> +0 409 V
>  24 0 V
> -0 -449 V
> +0 -409 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1965 512 24 458 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2083 512 24 418 BoxColFill
>  LCb setrgbcolor
> -1965 512 N
> -0 457 V
> +2083 512 N
> +0 417 V
>  23 0 V
> -0 -457 V
> +0 -417 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 1999 512 24 467 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2116 512 25 439 BoxColFill
>  LCb setrgbcolor
> -1999 512 N
> -0 466 V
> -23 0 V
> -0 -466 V
> --23 0 V
> +2116 512 N
> +0 438 V
> +24 0 V
> +0 -438 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2033 512 24 469 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2150 512 24 443 BoxColFill
>  LCb setrgbcolor
> -2033 512 N
> -0 468 V
> +2150 512 N
> +0 442 V
>  23 0 V
> -0 -468 V
> +0 -442 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2067 512 24 478 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2184 512 24 442 BoxColFill
>  LCb setrgbcolor
> -2067 512 N
> -0 477 V
> +2184 512 N
> +0 441 V
>  23 0 V
> -0 -477 V
> +0 -441 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2100 512 25 488 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2217 512 25 450 BoxColFill
>  LCb setrgbcolor
> -2100 512 N
> -0 487 V
> +2217 512 N
> +0 449 V
>  24 0 V
> -0 -487 V
> +0 -449 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2134 512 25 512 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2251 512 24 451 BoxColFill
>  LCb setrgbcolor
> -2134 512 N
> -0 511 V
> -24 0 V
> -0 -511 V
> --24 0 V
> +2251 512 N
> +0 450 V
> +23 0 V
> +0 -450 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2168 512 25 517 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2284 512 25 456 BoxColFill
>  LCb setrgbcolor
> -2168 512 N
> -0 516 V
> +2284 512 N
> +0 455 V
>  24 0 V
> -0 -516 V
> +0 -455 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2202 512 25 515 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2318 512 24 478 BoxColFill
>  LCb setrgbcolor
> -2202 512 N
> -0 514 V
> -24 0 V
> -0 -514 V
> --24 0 V
> +2318 512 N
> +0 477 V
> +23 0 V
> +0 -477 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2236 512 25 525 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2351 512 25 483 BoxColFill
>  LCb setrgbcolor
> -2236 512 N
> -0 524 V
> +2351 512 N
> +0 482 V
>  24 0 V
> -0 -524 V
> +0 -482 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2270 512 25 526 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2385 512 24 487 BoxColFill
>  LCb setrgbcolor
> -2270 512 N
> -0 525 V
> -24 0 V
> -0 -525 V
> --24 0 V
> +2385 512 N
> +0 486 V
> +23 0 V
> +0 -486 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2304 512 25 532 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2418 512 25 492 BoxColFill
>  LCb setrgbcolor
> -2304 512 N
> -0 531 V
> +2418 512 N
> +0 491 V
>  24 0 V
> -0 -531 V
> +0 -491 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2338 512 25 557 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2452 512 24 495 BoxColFill
>  LCb setrgbcolor
> -2338 512 N
> -0 556 V
> -24 0 V
> -0 -556 V
> --24 0 V
> +2452 512 N
> +0 494 V
> +23 0 V
> +0 -494 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2372 512 25 564 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2486 512 24 497 BoxColFill
>  LCb setrgbcolor
> -2372 512 N
> -0 563 V
> -24 0 V
> -0 -563 V
> --24 0 V
> +2486 512 N
> +0 496 V
> +23 0 V
> +0 -496 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2406 512 25 568 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2519 512 25 500 BoxColFill
>  LCb setrgbcolor
> -2406 512 N
> -0 567 V
> +2519 512 N
> +0 499 V
>  24 0 V
> -0 -567 V
> +0 -499 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2440 512 25 574 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2553 512 24 507 BoxColFill
>  LCb setrgbcolor
> -2440 512 N
> -0 573 V
> -24 0 V
> -0 -573 V
> --24 0 V
> +2553 512 N
> +0 506 V
> +23 0 V
> +0 -506 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2474 512 25 577 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2586 512 25 592 BoxColFill
>  LCb setrgbcolor
> -2474 512 N
> -0 576 V
> +2586 512 N
> +0 591 V
>  24 0 V
> -0 -576 V
> +0 -591 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2508 512 25 580 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2620 512 24 536 BoxColFill
> +LCb setrgbcolor
> +2620 512 N
> +0 535 V
> +23 0 V
> +0 -535 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
> +0.180 2653 512 25 533 BoxColFill
>  LCb setrgbcolor
> -2508 512 N
> -0 579 V
> +2653 512 N
> +0 532 V
>  24 0 V
> -0 -579 V
> +0 -532 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2542 512 24 583 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2687 512 24 535 BoxColFill
>  LCb setrgbcolor
> -2542 512 N
> -0 582 V
> +2687 512 N
> +0 534 V
>  23 0 V
> -0 -582 V
> +0 -534 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2576 512 24 591 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2720 512 25 532 BoxColFill
>  LCb setrgbcolor
> -2576 512 N
> -0 590 V
> -23 0 V
> -0 -590 V
> --23 0 V
> +2720 512 N
> +0 531 V
> +24 0 V
> +0 -531 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2610 512 24 691 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2754 512 24 532 BoxColFill
>  LCb setrgbcolor
> -2610 512 N
> -0 690 V
> +2754 512 N
> +0 531 V
>  23 0 V
> -0 -690 V
> +0 -531 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2644 512 24 625 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2788 512 24 531 BoxColFill
>  LCb setrgbcolor
> -2644 512 N
> -0 624 V
> +2788 512 N
> +0 530 V
>  23 0 V
> -0 -624 V
> +0 -530 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2677 512 25 621 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2821 512 25 539 BoxColFill
>  LCb setrgbcolor
> -2677 512 N
> -0 620 V
> +2821 512 N
> +0 538 V
>  24 0 V
> -0 -620 V
> +0 -538 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2711 512 25 624 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2855 512 24 523 BoxColFill
>  LCb setrgbcolor
> -2711 512 N
> -0 623 V
> -24 0 V
> -0 -623 V
> --24 0 V
> +2855 512 N
> +0 522 V
> +23 0 V
> +0 -522 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2745 512 25 621 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2888 512 25 527 BoxColFill
>  LCb setrgbcolor
> -2745 512 N
> -0 620 V
> +2888 512 N
> +0 526 V
>  24 0 V
> -0 -620 V
> +0 -526 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2779 512 25 621 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2922 512 24 511 BoxColFill
>  LCb setrgbcolor
> -2779 512 N
> -0 620 V
> -24 0 V
> -0 -620 V
> --24 0 V
> +2922 512 N
> +0 510 V
> +23 0 V
> +0 -510 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2813 512 25 620 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2955 512 25 509 BoxColFill
>  LCb setrgbcolor
> -2813 512 N
> -0 619 V
> +2955 512 N
> +0 508 V
>  24 0 V
> -0 -619 V
> +0 -508 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2847 512 25 629 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 2989 512 24 514 BoxColFill
>  LCb setrgbcolor
> -2847 512 N
> -0 628 V
> -24 0 V
> -0 -628 V
> --24 0 V
> +2989 512 N
> +0 513 V
> +23 0 V
> +0 -513 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2881 512 25 611 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3022 512 25 532 BoxColFill
>  LCb setrgbcolor
> -2881 512 N
> -0 610 V
> +3022 512 N
> +0 531 V
>  24 0 V
> -0 -610 V
> +0 -531 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2915 512 25 614 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3056 512 25 534 BoxColFill
>  LCb setrgbcolor
> -2915 512 N
> -0 613 V
> +3056 512 N
> +0 533 V
>  24 0 V
> -0 -613 V
> +0 -533 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2949 512 25 596 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3090 512 24 542 BoxColFill
>  LCb setrgbcolor
> -2949 512 N
> -0 595 V
> -24 0 V
> -0 -595 V
> --24 0 V
> +3090 512 N
> +0 541 V
> +23 0 V
> +0 -541 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 2983 512 25 594 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3123 512 25 553 BoxColFill
>  LCb setrgbcolor
> -2983 512 N
> -0 593 V
> +3123 512 N
> +0 552 V
>  24 0 V
> -0 -593 V
> +0 -552 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3017 512 25 599 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3157 512 24 602 BoxColFill
>  LCb setrgbcolor
> -3017 512 N
> -0 598 V
> -24 0 V
> -0 -598 V
> --24 0 V
> +3157 512 N
> +0 601 V
> +23 0 V
> +0 -601 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3051 512 25 620 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3190 512 25 611 BoxColFill
>  LCb setrgbcolor
> -3051 512 N
> -0 619 V
> +3190 512 N
> +0 610 V
>  24 0 V
> -0 -619 V
> +0 -610 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3085 512 25 623 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3224 512 24 618 BoxColFill
>  LCb setrgbcolor
> -3085 512 N
> -0 622 V
> -24 0 V
> -0 -622 V
> --24 0 V
> +3224 512 N
> +0 617 V
> +23 0 V
> +0 -617 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3119 512 25 632 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3257 512 25 621 BoxColFill
>  LCb setrgbcolor
> -3119 512 N
> -0 631 V
> +3257 512 N
> +0 620 V
>  24 0 V
> -0 -631 V
> +0 -620 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3153 512 24 645 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3291 512 24 656 BoxColFill
>  LCb setrgbcolor
> -3153 512 N
> -0 644 V
> +3291 512 N
> +0 655 V
>  23 0 V
> -0 -644 V
> +0 -655 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3187 512 24 703 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3324 512 25 664 BoxColFill
>  LCb setrgbcolor
> -3187 512 N
> -0 702 V
> -23 0 V
> -0 -702 V
> --23 0 V
> +3324 512 N
> +0 663 V
> +24 0 V
> +0 -663 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3221 512 24 713 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3358 512 25 669 BoxColFill
>  LCb setrgbcolor
> -3221 512 N
> -0 712 V
> -23 0 V
> -0 -712 V
> --23 0 V
> +3358 512 N
> +0 668 V
> +24 0 V
> +0 -668 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3255 512 24 720 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3392 512 24 669 BoxColFill
>  LCb setrgbcolor
> -3255 512 N
> -0 719 V
> +3392 512 N
> +0 668 V
>  23 0 V
> -0 -719 V
> +0 -668 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3288 512 25 725 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3425 512 25 669 BoxColFill
>  LCb setrgbcolor
> -3288 512 N
> -0 724 V
> +3425 512 N
> +0 668 V
>  24 0 V
> -0 -724 V
> +0 -668 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3322 512 25 765 BoxColFill
> +0.00 0.00 0.00 C
> +0.180 3459 512 24 677 BoxColFill
>  LCb setrgbcolor
> -3322 512 N
> -0 764 V
> -24 0 V
> -0 -764 V
> --24 0 V
> +3459 512 N
> +0 676 V
> +23 0 V
> +0 -676 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3356 512 25 774 BoxColFill
> -LCb setrgbcolor
> -3356 512 N
> -0 773 V
> -24 0 V
> -0 -773 V
> --24 0 V
> -Z stroke
> +0.00 0.00 0.00 C
> +% End plot #1
> +% Begin plot #2
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.180 3390 512 25 781 BoxColFill
> +0.90 0.62 0.00 C
>  LCb setrgbcolor
> -3390 512 N
> -0 780 V
> -24 0 V
> -0 -780 V
> --24 0 V
> -Z stroke
> -1.000 UL
> -LTb
> -0.00 0.00 0.00 C 0.180 3424 512 25 781 BoxColFill
> -LCb setrgbcolor
> -3424 512 N
> -0 780 V
> -24 0 V
> -0 -780 V
> --24 0 V
> -Z stroke
> -1.000 UL
> -LTb
> -0.00 0.00 0.00 C 0.180 3458 512 25 781 BoxColFill
> -LCb setrgbcolor
> -3458 512 N
> -0 780 V
> -24 0 V
> -0 -780 V
> --24 0 V
> -Z stroke
> -1.000 UL
> -LTb
> -0.00 0.00 0.00 C % End plot #1
> -% Begin plot #2
> -1.000 UL
> -LTb
> -0.90 0.62 0.00 C LCb setrgbcolor
>  2044 1537 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (RCU Test)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2092 1517 255 40 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2092 1517 255 40 BoxColFill
>  LCb setrgbcolor
>  2092 1517 N
>  255 0 V
> @@ -3441,53 +3598,70 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 573 543 25 1 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 573 539 24 1 BoxColFill
>  LCb setrgbcolor
> -573 543 N
> -24 0 V
> --24 0 V
> +573 539 N
> +23 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 607 543 25 1 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 606 539 25 1 BoxColFill
>  LCb setrgbcolor
> -607 543 N
> +606 539 N
>  24 0 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 641 553 25 1 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 640 547 24 1 BoxColFill
>  LCb setrgbcolor
> -641 553 N
> -24 0 V
> --24 0 V
> +640 547 N
> +23 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 675 555 25 22 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 673 549 25 19 BoxColFill
>  LCb setrgbcolor
> -675 555 N
> -0 21 V
> +673 549 N
> +0 18 V
>  24 0 V
> -0 -21 V
> +0 -18 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 709 548 25 25 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 707 543 25 21 BoxColFill
>  LCb setrgbcolor
> -709 548 N
> -0 24 V
> +707 543 N
> +0 20 V
>  24 0 V
> -0 -24 V
> +0 -20 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 743 548 25 26 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 741 543 24 22 BoxColFill
>  LCb setrgbcolor
> -743 548 N
> +741 543 N
> +0 21 V
> +23 0 V
> +0 -21 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 774 544 25 26 BoxColFill
> +LCb setrgbcolor
> +774 544 N
>  0 25 V
>  24 0 V
>  0 -25 V
> @@ -3495,79 +3669,98 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 777 549 24 30 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 808 555 24 35 BoxColFill
>  LCb setrgbcolor
> -777 549 N
> -0 29 V
> +808 555 N
> +0 34 V
>  23 0 V
> -0 -29 V
> +0 -34 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 811 562 24 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 841 555 25 35 BoxColFill
>  LCb setrgbcolor
> -811 562 N
> -0 40 V
> -23 0 V
> -0 -40 V
> --23 0 V
> +841 555 N
> +0 34 V
> +24 0 V
> +0 -34 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 845 562 24 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 875 555 24 35 BoxColFill
>  LCb setrgbcolor
> -845 562 N
> -0 40 V
> +875 555 N
> +0 34 V
>  23 0 V
> -0 -40 V
> +0 -34 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 879 562 24 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 908 555 25 35 BoxColFill
>  LCb setrgbcolor
> -879 562 N
> -0 40 V
> +908 555 N
> +0 34 V
> +24 0 V
> +0 -34 V
> +-24 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 942 555 24 35 BoxColFill
> +LCb setrgbcolor
> +942 555 N
> +0 34 V
>  23 0 V
> -0 -40 V
> +0 -34 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 912 562 25 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 975 556 25 35 BoxColFill
>  LCb setrgbcolor
> -912 562 N
> -0 40 V
> +975 556 N
> +0 34 V
>  24 0 V
> -0 -40 V
> +0 -34 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 946 562 25 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1009 621 25 35 BoxColFill
>  LCb setrgbcolor
> -946 562 N
> -0 40 V
> +1009 621 N
> +0 34 V
>  24 0 V
> -0 -40 V
> +0 -34 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 980 563 25 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1043 620 24 36 BoxColFill
>  LCb setrgbcolor
> -980 563 N
> -0 40 V
> -24 0 V
> -0 -40 V
> --24 0 V
> +1043 620 N
> +0 35 V
> +23 0 V
> +0 -35 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1014 639 25 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1076 649 25 41 BoxColFill
>  LCb setrgbcolor
> -1014 639 N
> +1076 649 N
>  0 40 V
>  24 0 V
>  0 -40 V
> @@ -3575,179 +3768,197 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1048 639 25 41 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1110 656 24 41 BoxColFill
>  LCb setrgbcolor
> -1048 639 N
> +1110 656 N
>  0 40 V
> -24 0 V
> +23 0 V
>  0 -40 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1082 672 25 48 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1143 736 25 43 BoxColFill
>  LCb setrgbcolor
> -1082 672 N
> -0 47 V
> +1143 736 N
> +0 42 V
>  24 0 V
> -0 -47 V
> +0 -42 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1116 680 25 48 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1177 737 24 44 BoxColFill
>  LCb setrgbcolor
> -1116 680 N
> -0 47 V
> -24 0 V
> -0 -47 V
> --24 0 V
> +1177 737 N
> +0 43 V
> +23 0 V
> +0 -43 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1150 773 25 50 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1210 741 25 44 BoxColFill
>  LCb setrgbcolor
> -1150 773 N
> -0 49 V
> +1210 741 N
> +0 43 V
>  24 0 V
> -0 -49 V
> +0 -43 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1184 775 25 51 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1244 667 24 45 BoxColFill
>  LCb setrgbcolor
> -1184 775 N
> -0 50 V
> -24 0 V
> -0 -50 V
> --24 0 V
> +1244 667 N
> +0 44 V
> +23 0 V
> +0 -44 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1218 779 25 51 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1278 694 24 45 BoxColFill
>  LCb setrgbcolor
> -1218 779 N
> -0 50 V
> -24 0 V
> -0 -50 V
> --24 0 V
> +1278 694 N
> +0 44 V
> +23 0 V
> +0 -44 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1252 693 25 52 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1311 714 25 49 BoxColFill
>  LCb setrgbcolor
> -1252 693 N
> -0 51 V
> +1311 714 N
> +0 48 V
>  24 0 V
> -0 -51 V
> +0 -48 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1286 724 25 53 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1345 722 24 49 BoxColFill
>  LCb setrgbcolor
> -1286 724 N
> -0 52 V
> -24 0 V
> -0 -52 V
> --24 0 V
> +1345 722 N
> +0 48 V
> +23 0 V
> +0 -48 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1320 748 25 56 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1378 731 25 48 BoxColFill
>  LCb setrgbcolor
> -1320 748 N
> -0 55 V
> +1378 731 N
> +0 47 V
>  24 0 V
> -0 -55 V
> +0 -47 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1354 757 25 57 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1412 758 24 49 BoxColFill
>  LCb setrgbcolor
> -1354 757 N
> -0 56 V
> +1412 758 N
> +0 48 V
> +23 0 V
> +0 -48 V
> +-23 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
> +0.180 1445 782 25 58 BoxColFill
> +LCb setrgbcolor
> +1445 782 N
> +0 57 V
>  24 0 V
> -0 -56 V
> +0 -57 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1388 767 24 57 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1479 783 24 58 BoxColFill
>  LCb setrgbcolor
> -1388 767 N
> -0 56 V
> +1479 783 N
> +0 57 V
>  23 0 V
> -0 -56 V
> +0 -57 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1422 799 24 57 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1512 824 25 57 BoxColFill
>  LCb setrgbcolor
> -1422 799 N
> +1512 824 N
>  0 56 V
> -23 0 V
> +24 0 V
>  0 -56 V
> --23 0 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1456 828 24 66 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1546 824 24 57 BoxColFill
>  LCb setrgbcolor
> -1456 828 N
> -0 65 V
> +1546 824 N
> +0 56 V
>  23 0 V
> -0 -65 V
> +0 -56 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1490 828 24 67 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1580 830 24 57 BoxColFill
>  LCb setrgbcolor
> -1490 828 N
> -0 66 V
> +1580 830 N
> +0 56 V
>  23 0 V
> -0 -66 V
> +0 -56 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1523 876 25 67 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1613 848 25 65 BoxColFill
>  LCb setrgbcolor
> -1523 876 N
> -0 66 V
> +1613 848 N
> +0 64 V
>  24 0 V
> -0 -66 V
> +0 -64 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1557 876 25 67 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1647 867 24 67 BoxColFill
>  LCb setrgbcolor
> -1557 876 N
> +1647 867 N
>  0 66 V
> -24 0 V
> +23 0 V
>  0 -66 V
> --24 0 V
> -Z stroke
> -1.000 UL
> -LTb
> -0.90 0.62 0.00 C 0.180 1591 883 25 66 BoxColFill
> -LCb setrgbcolor
> -1591 883 N
> -0 65 V
> -24 0 V
> -0 -65 V
> --24 0 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1625 904 25 75 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1680 889 25 75 BoxColFill
>  LCb setrgbcolor
> -1625 904 N
> +1680 889 N
>  0 74 V
>  24 0 V
>  0 -74 V
> @@ -3755,644 +3966,692 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1659 926 25 78 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1714 889 24 76 BoxColFill
>  LCb setrgbcolor
> -1659 926 N
> -0 77 V
> -24 0 V
> -0 -77 V
> --24 0 V
> +1714 889 N
> +0 75 V
> +23 0 V
> +0 -75 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1693 952 25 87 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1747 891 25 76 BoxColFill
>  LCb setrgbcolor
> -1693 952 N
> -0 86 V
> +1747 891 N
> +0 75 V
>  24 0 V
> -0 -86 V
> +0 -75 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1727 952 25 88 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1781 912 24 76 BoxColFill
>  LCb setrgbcolor
> -1727 952 N
> -0 87 V
> -24 0 V
> -0 -87 V
> --24 0 V
> +1781 912 N
> +0 75 V
> +23 0 V
> +0 -75 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1761 954 25 89 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1814 919 25 77 BoxColFill
>  LCb setrgbcolor
> -1761 954 N
> -0 88 V
> +1814 919 N
> +0 76 V
>  24 0 V
> -0 -88 V
> +0 -76 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1795 978 25 89 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1848 920 24 78 BoxColFill
>  LCb setrgbcolor
> -1795 978 N
> -0 88 V
> -24 0 V
> -0 -88 V
> --24 0 V
> +1848 920 N
> +0 77 V
> +23 0 V
> +0 -77 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1829 987 25 90 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1882 883 24 76 BoxColFill
>  LCb setrgbcolor
> -1829 987 N
> -0 89 V
> -24 0 V
> -0 -89 V
> --24 0 V
> +1882 883 N
> +0 75 V
> +23 0 V
> +0 -75 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1863 988 25 91 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1915 897 25 75 BoxColFill
>  LCb setrgbcolor
> -1863 988 N
> -0 90 V
> +1915 897 N
> +0 74 V
>  24 0 V
> -0 -90 V
> +0 -74 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1897 944 25 89 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1949 904 24 75 BoxColFill
>  LCb setrgbcolor
> -1897 944 N
> -0 88 V
> -24 0 V
> -0 -88 V
> --24 0 V
> +1949 904 N
> +0 74 V
> +23 0 V
> +0 -74 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1931 961 25 87 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 1982 911 25 119 BoxColFill
>  LCb setrgbcolor
> -1931 961 N
> -0 86 V
> +1982 911 N
> +0 118 V
>  24 0 V
> -0 -86 V
> +0 -118 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 1965 969 24 88 BoxColFill
> -LCb setrgbcolor
> -1965 969 N
> -0 87 V
> -23 0 V
> -0 -87 V
> --23 0 V
> -Z stroke
> -1.000 UL
> -LTb
> -0.90 0.62 0.00 C 0.180 1999 978 24 139 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2016 913 24 135 BoxColFill
>  LCb setrgbcolor
> -1999 978 N
> -0 138 V
> +2016 913 N
> +0 134 V
>  23 0 V
> -0 -138 V
> +0 -134 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2033 980 24 157 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2049 921 25 141 BoxColFill
>  LCb setrgbcolor
> -2033 980 N
> -0 156 V
> -23 0 V
> -0 -156 V
> --23 0 V
> +2049 921 N
> +0 140 V
> +24 0 V
> +0 -140 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2067 989 24 165 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2083 929 24 142 BoxColFill
>  LCb setrgbcolor
> -2067 989 N
> -0 164 V
> +2083 929 N
> +0 141 V
>  23 0 V
> -0 -164 V
> +0 -141 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2100 999 25 165 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2116 950 25 147 BoxColFill
>  LCb setrgbcolor
> -2100 999 N
> -0 164 V
> +2116 950 N
> +0 146 V
>  24 0 V
> -0 -164 V
> +0 -146 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2134 1023 25 171 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2150 954 24 147 BoxColFill
>  LCb setrgbcolor
> -2134 1023 N
> -0 170 V
> -24 0 V
> -0 -170 V
> --24 0 V
> +2150 954 N
> +0 146 V
> +23 0 V
> +0 -146 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2168 1028 25 171 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2184 953 24 148 BoxColFill
>  LCb setrgbcolor
> -2168 1028 N
> -0 170 V
> -24 0 V
> -0 -170 V
> --24 0 V
> +2184 953 N
> +0 147 V
> +23 0 V
> +0 -147 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2202 1026 25 173 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2217 961 25 149 BoxColFill
>  LCb setrgbcolor
> -2202 1026 N
> -0 172 V
> +2217 961 N
> +0 148 V
>  24 0 V
> -0 -172 V
> +0 -148 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2236 1036 25 174 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2251 962 24 151 BoxColFill
>  LCb setrgbcolor
> -2236 1036 N
> -0 173 V
> -24 0 V
> -0 -173 V
> --24 0 V
> +2251 962 N
> +0 150 V
> +23 0 V
> +0 -150 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2270 1037 25 176 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2284 967 25 151 BoxColFill
>  LCb setrgbcolor
> -2270 1037 N
> -0 175 V
> +2284 967 N
> +0 150 V
>  24 0 V
> -0 -175 V
> +0 -150 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2304 1043 25 176 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2318 989 24 151 BoxColFill
>  LCb setrgbcolor
> -2304 1043 N
> -0 175 V
> -24 0 V
> -0 -175 V
> --24 0 V
> +2318 989 N
> +0 150 V
> +23 0 V
> +0 -150 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2338 1068 25 177 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2351 994 25 154 BoxColFill
>  LCb setrgbcolor
> -2338 1068 N
> -0 176 V
> +2351 994 N
> +0 153 V
>  24 0 V
> -0 -176 V
> +0 -153 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2372 1075 25 179 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2385 998 24 154 BoxColFill
>  LCb setrgbcolor
> -2372 1075 N
> -0 178 V
> -24 0 V
> -0 -178 V
> --24 0 V
> +2385 998 N
> +0 153 V
> +23 0 V
> +0 -153 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2406 1079 25 179 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2418 1003 25 190 BoxColFill
>  LCb setrgbcolor
> -2406 1079 N
> -0 178 V
> +2418 1003 N
> +0 189 V
>  24 0 V
> -0 -178 V
> +0 -189 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2440 1085 25 222 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2452 1006 24 192 BoxColFill
>  LCb setrgbcolor
> -2440 1085 N
> -0 221 V
> -24 0 V
> -0 -221 V
> --24 0 V
> +2452 1006 N
> +0 191 V
> +23 0 V
> +0 -191 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2474 1088 25 225 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2486 1008 24 192 BoxColFill
>  LCb setrgbcolor
> -2474 1088 N
> -0 224 V
> -24 0 V
> -0 -224 V
> --24 0 V
> +2486 1008 N
> +0 191 V
> +23 0 V
> +0 -191 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2508 1091 25 224 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2519 1011 25 192 BoxColFill
>  LCb setrgbcolor
> -2508 1091 N
> -0 223 V
> +2519 1011 N
> +0 191 V
>  24 0 V
> -0 -223 V
> +0 -191 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2542 1094 24 224 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2553 1018 24 192 BoxColFill
>  LCb setrgbcolor
> -2542 1094 N
> -0 223 V
> +2553 1018 N
> +0 191 V
>  23 0 V
> -0 -223 V
> +0 -191 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2576 1102 24 225 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2586 1103 25 194 BoxColFill
>  LCb setrgbcolor
> -2576 1102 N
> -0 224 V
> -23 0 V
> -0 -224 V
> --23 0 V
> +2586 1103 N
> +0 193 V
> +24 0 V
> +0 -193 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2610 1202 24 226 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2620 1047 24 197 BoxColFill
>  LCb setrgbcolor
> -2610 1202 N
> -0 225 V
> +2620 1047 N
> +0 196 V
>  23 0 V
> -0 -225 V
> +0 -196 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2644 1136 24 229 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2653 1044 25 198 BoxColFill
>  LCb setrgbcolor
> -2644 1136 N
> -0 228 V
> -23 0 V
> -0 -228 V
> --23 0 V
> +2653 1044 N
> +0 197 V
> +24 0 V
> +0 -197 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2677 1132 25 231 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2687 1046 24 199 BoxColFill
>  LCb setrgbcolor
> -2677 1132 N
> -0 230 V
> -24 0 V
> -0 -230 V
> --24 0 V
> +2687 1046 N
> +0 198 V
> +23 0 V
> +0 -198 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2711 1135 25 232 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2720 1043 25 197 BoxColFill
>  LCb setrgbcolor
> -2711 1135 N
> -0 231 V
> +2720 1043 N
> +0 196 V
>  24 0 V
> -0 -231 V
> +0 -196 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2745 1132 25 229 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2754 1043 24 198 BoxColFill
>  LCb setrgbcolor
> -2745 1132 N
> -0 228 V
> -24 0 V
> -0 -228 V
> --24 0 V
> +2754 1043 N
> +0 197 V
> +23 0 V
> +0 -197 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2779 1132 25 230 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2788 1042 24 200 BoxColFill
>  LCb setrgbcolor
> -2779 1132 N
> -0 229 V
> -24 0 V
> -0 -229 V
> --24 0 V
> +2788 1042 N
> +0 199 V
> +23 0 V
> +0 -199 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2813 1131 25 233 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2821 1050 25 207 BoxColFill
>  LCb setrgbcolor
> -2813 1131 N
> -0 232 V
> +2821 1050 N
> +0 206 V
>  24 0 V
> -0 -232 V
> +0 -206 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2847 1140 25 241 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2855 1034 24 210 BoxColFill
>  LCb setrgbcolor
> -2847 1140 N
> -0 240 V
> -24 0 V
> -0 -240 V
> --24 0 V
> +2855 1034 N
> +0 209 V
> +23 0 V
> +0 -209 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2881 1122 25 244 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2888 1038 25 295 BoxColFill
>  LCb setrgbcolor
> -2881 1122 N
> -0 243 V
> +2888 1038 N
> +0 294 V
>  24 0 V
> -0 -243 V
> +0 -294 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2915 1125 25 345 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2922 1022 24 220 BoxColFill
>  LCb setrgbcolor
> -2915 1125 N
> -0 344 V
> -24 0 V
> -0 -344 V
> --24 0 V
> +2922 1022 N
> +0 219 V
> +23 0 V
> +0 -219 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2949 1107 25 256 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2955 1020 25 211 BoxColFill
>  LCb setrgbcolor
> -2949 1107 N
> -0 255 V
> +2955 1020 N
> +0 210 V
>  24 0 V
> -0 -255 V
> +0 -210 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 2983 1105 25 246 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 2989 1025 24 214 BoxColFill
>  LCb setrgbcolor
> -2983 1105 N
> -0 245 V
> -24 0 V
> -0 -245 V
> --24 0 V
> +2989 1025 N
> +0 213 V
> +23 0 V
> +0 -213 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3017 1110 25 250 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3022 1043 25 215 BoxColFill
>  LCb setrgbcolor
> -3017 1110 N
> -0 249 V
> +3022 1043 N
> +0 214 V
>  24 0 V
> -0 -249 V
> +0 -214 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3051 1131 25 251 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3056 1045 25 216 BoxColFill
>  LCb setrgbcolor
> -3051 1131 N
> -0 250 V
> +3056 1045 N
> +0 215 V
>  24 0 V
> -0 -250 V
> +0 -215 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3085 1134 25 251 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3090 1053 24 221 BoxColFill
>  LCb setrgbcolor
> -3085 1134 N
> -0 250 V
> -24 0 V
> -0 -250 V
> --24 0 V
> +3090 1053 N
> +0 220 V
> +23 0 V
> +0 -220 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3119 1143 25 258 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3123 1064 25 224 BoxColFill
>  LCb setrgbcolor
> -3119 1143 N
> -0 257 V
> +3123 1064 N
> +0 223 V
>  24 0 V
> -0 -257 V
> +0 -223 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3153 1156 24 261 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3157 1113 24 230 BoxColFill
>  LCb setrgbcolor
> -3153 1156 N
> -0 260 V
> +3157 1113 N
> +0 229 V
>  23 0 V
> -0 -260 V
> +0 -229 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3187 1214 24 267 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3190 1122 25 270 BoxColFill
>  LCb setrgbcolor
> -3187 1214 N
> -0 266 V
> -23 0 V
> -0 -266 V
> --23 0 V
> +3190 1122 N
> +0 269 V
> +24 0 V
> +0 -269 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3221 1224 24 314 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3224 1129 24 274 BoxColFill
>  LCb setrgbcolor
> -3221 1224 N
> -0 313 V
> +3224 1129 N
> +0 273 V
>  23 0 V
> -0 -313 V
> +0 -273 V
>  -23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3255 1231 24 320 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3257 1132 25 279 BoxColFill
>  LCb setrgbcolor
> -3255 1231 N
> -0 319 V
> -23 0 V
> -0 -319 V
> --23 0 V
> +3257 1132 N
> +0 278 V
> +24 0 V
> +0 -278 V
> +-24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3288 1236 25 324 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3291 1167 24 312 BoxColFill
>  LCb setrgbcolor
> -3288 1236 N
> -0 323 V
> -24 0 V
> -0 -323 V
> --24 0 V
> +3291 1167 N
> +0 311 V
> +23 0 V
> +0 -311 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3322 1276 25 364 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3324 1175 25 331 BoxColFill
>  LCb setrgbcolor
> -3322 1276 N
> -0 363 V
> +3324 1175 N
> +0 330 V
>  24 0 V
> -0 -363 V
> +0 -330 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3356 1285 25 386 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3358 1180 25 346 BoxColFill
>  LCb setrgbcolor
> -3356 1285 N
> -0 385 V
> +3358 1180 N
> +0 345 V
>  24 0 V
> -0 -385 V
> +0 -345 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3390 1292 25 403 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3392 1180 24 358 BoxColFill
>  LCb setrgbcolor
> -3390 1292 N
> -0 402 V
> -24 0 V
> -0 -402 V
> --24 0 V
> +3392 1180 N
> +0 357 V
> +23 0 V
> +0 -357 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3424 1292 25 417 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3425 1180 25 359 BoxColFill
>  LCb setrgbcolor
> -3424 1292 N
> -0 416 V
> +3425 1180 N
> +0 358 V
>  24 0 V
> -0 -416 V
> +0 -358 V
>  -24 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.180 3458 1292 25 418 BoxColFill
> +0.90 0.62 0.00 C
> +0.180 3459 1188 24 362 BoxColFill
>  LCb setrgbcolor
> -3458 1292 N
> -0 417 V
> -24 0 V
> -0 -417 V
> --24 0 V
> +3459 1188 N
> +0 361 V
> +23 0 V
> +0 -361 V
> +-23 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C % End plot #2
> +0.90 0.62 0.00 C
> +% End plot #2
>  % Begin plot #3
>  1.000 UL
>  LTb
> -0.55 0.00 0.00 C LCb setrgbcolor
> +0.55 0.00 0.00 C
> +LCb setrgbcolor
>  2044 1457 M
>  [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (% Test)]
>  ] -26.7 MRshow
> +/NimbusSanL-Regu findfont 80 scalefont setfont
>  1.000 UL
>  LTb
> -0.55 0.00 0.00 C 2092 1457 M
> +0.55 0.00 0.00 C
> +2092 1457 M
>  255 0 V
>  585 512 M
> +33 0 V
>  34 0 V
> -34 0 V
> -34 778 V
> +33 778 V
>  34 193 V
> -34 -5 V
> +33 -5 V
>  34 87 V
> -34 29 V
> -33 3 V
> +33 29 V
> +34 3 V
>  34 0 V
> -34 -5 V
> +33 -5 V
>  34 0 V
> -34 -17 V
> +33 -17 V
>  34 -483 V
> -34 2 V
> +33 2 V
>  34 -38 V
> -34 -20 V
> +33 -20 V
>  34 -140 V
>  34 0 V
> -34 -5 V
> +33 -5 V
>  34 150 V
> -34 -51 V
> +33 -51 V
>  34 -17 V
> -34 -14 V
> +33 -14 V
>  34 -15 V
> -34 -38 V
> -33 24 V
> +33 -38 V
> +34 24 V
>  34 -2 V
> -34 -46 V
> +33 -46 V
>  34 0 V
> -34 -8 V
> +33 -8 V
>  34 20 V
> -34 -3 V
> +33 -3 V
>  34 17 V
> -34 3 V
> +33 3 V
>  34 4 V
>  34 -21 V
> +33 0 V
>  34 0 V
> -34 0 V
> -34 26 V
> +33 26 V
>  34 -19 V
> -34 -5 V
> +33 -5 V
>  34 169 V
> -33 51 V
> -34 14 V
> -34 -7 V
> +34 51 V
> +33 14 V
>  34 -7 V
> +33 -7 V
>  34 -5 V
> -34 5 V
> +33 5 V
>  34 -5 V
> -34 5 V
> +33 5 V
>  34 -2 V
>  34 -22 V
> -34 0 V
> +33 0 V
>  34 -3 V
> -34 95 V
> +33 95 V
>  34 2 V
> -34 -2 V
> +33 -2 V
>  34 -3 V
> -34 -5 V
> -33 -70 V
> +33 -5 V
> +34 -70 V
>  34 53 V
> -34 8 V
> +33 8 V
>  34 -3 V
> -34 -2 V
> +33 -2 V
>  34 2 V
> -34 5 V
> +33 5 V
>  34 12 V
> -34 22 V
> +33 22 V
>  34 176 V
>  34 -142 V
> -34 -20 V
> +33 -20 V
>  34 5 V
> -34 -14 V
> +33 -14 V
>  34 -3 V
> -34 5 V
> +33 5 V
>  34 -2 V
> -34 -29 V
> -33 72 V
> +33 -29 V
> +34 72 V
>  34 3 V
> -34 5 V
> +33 5 V
>  34 31 V
> -34 24 V
> +33 24 V
>  34 19 V
> -34 20 V
> +33 20 V
>  34 2 V
> +33 0 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/plot.sh b/CodeSamples/formal/data/plot.sh
> index ab74b753..e91c9126 100644
> --- a/CodeSamples/formal/data/plot.sh
> +++ b/CodeSamples/formal/data/plot.sh
> @@ -21,7 +21,7 @@ set ytics out
>  set y2tics 1 10
>  set y2tics out
>  set ytics nomirror
> -set yrange [0:30000]
> +set yrange [0:35000]
>  set y2range [0:50]
>  set style data histogram
>  set style histogram rowstacked
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index a929dead..caf8112b 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -83,4 +83,5 @@ v5.12 18965 9025 27990 32.2
>  ""    19205 9556 28761 33.2
>  ""    19362 9983 29345 34.0
>  ""    19366 10332 29698 34.8
> -v5.16 19359 10362 29721 34.9
> +""    19359 10362 29721 34.9
> +v5.17 19576 10482 30058 34.9
> 
> base-commit: a92e9651cc1d81024e41f7d2723472d4d04612ad
> -- 
> 2.25.1
> 
