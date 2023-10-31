Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbjJaS1P (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 31 Oct 2023 14:27:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2105BA6
        for <perfbook@vger.kernel.org>; Tue, 31 Oct 2023 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698776828;
        bh=v+cBDhGY/ZJ9YzZRwOxfrkn9Lpk70sBgEDy0xnOL4Kk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=d8f4hJypioUhDhsdm+ZNPccTQoaWbPk3QTJsME/NrwSI73tUxrB5NGcnExZhKu+Ed
         aA2ZjyiE3llt4X8L7hQ0dSnoi3kGror7DelSFTrPWLRpY9D+vJAZPOj0U+bry+c10U
         bbZKVVqMJ7Ce+XnG2pR08TGrg4SWqZy8m9OMqFcVF+o4qkY8ZlUxwJoIH1+BbVXwRZ
         DVEt9p3Vu9BMruuL1JaZCo8Qph6nQNPhzNNIARjwFPyPFo0LGa+ABzaaibqKq3C0I4
         0/sQ8I11G15yKBPNifLHI7AxPe9hlc64lbl/pkI/ZufVVUeF1PGVD/JLOU8xl5mHyO
         JCjAps7O4TqhA==
Date: Tue, 31 Oct 2023 11:27:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Update RCU-test-ratio plot as of v6.6
Message-ID: <5596d8d8-4948-4e4d-9583-c95d848a3bae@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a78724d6-4c6b-43aa-a68d-1196a0b55f77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78724d6-4c6b-43aa-a68d-1196a0b55f77@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 31, 2023 at 04:17:20PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Slightly larger diff of EPS is due to the switch to Ubuntu 22.04 LTS.

Not a problem, as I do not expect that many people expect diffs of
.eps files to be particularly helpful anyway.  ;-)

If they did care, I suppose one approach would be to do a pair of patches,
one for the change in environment and another for the addition of new
data, but in this case that should not be necessary.

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
>  CodeSamples/formal/data/RCU-test-ratio.eps | 1574 ++++++++++----------
>  CodeSamples/formal/data/rcu-test.dat       |    1 +
>  2 files changed, 805 insertions(+), 770 deletions(-)
> 
> diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
> index fc7eda80..44e8d6da 100644
> --- a/CodeSamples/formal/data/RCU-test-ratio.eps
> +++ b/CodeSamples/formal/data/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
> -%%Creator: gnuplot 5.2 patchlevel 8
> -%%CreationDate: Mon Aug 28 18:02:46 2023
> +%%Creator: gnuplot 5.4 patchlevel 2
> +%%CreationDate: Tue Oct 31 15:03:42 2023
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 654 320
>  %%Orientation: Portrait
> @@ -1869,10 +1869,10 @@ systemdict /pdfmark known not {
>  SDict begin [
>    /Title (RCU-test-ratio.eps)
>    /Subject (gnuplot plot)
> -  /Creator (gnuplot 5.2 patchlevel 8)
> +  /Creator (gnuplot 5.4 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Mon Aug 28 18:02:46 2023)
> +  /CreationDate (Tue Oct 31 15:03:42 2023)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -1894,7 +1894,7 @@ end
>                 TBx1 TBxmargin sub TBy2 TBymargin add L
>  	       TBx2 TBxmargin add TBy2 TBymargin add L
>  	       TBx2 TBxmargin add TBy1 TBymargin sub L closepath } def
> -/DrawTextBox { PopTextBox stroke /Boxing false def} def
> +/DrawTextBox { PL PopTextBox stroke /Boxing false def} def
>  /FillTextBox { gsave PopTextBox fill grestore /Boxing false def} def
>  0 0 0 0 InitTextBox
>  /TBxmargin 20 def
> @@ -1998,9 +1998,9 @@ stroke
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -842 768 M
> +841 768 M
>  stroke
> -842 696 M
> +841 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.12)]
>  ] -40.0 MRshow
> @@ -2009,21 +2009,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -889 768 M
> +888 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -935 768 M
> +934 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -982 768 M
> +980 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1029 768 M
> +1027 768 M
>  stroke
> -1029 696 M
> +1027 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.16)]
>  ] -40.0 MRshow
> @@ -2032,21 +2032,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1076 768 M
> +1073 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1123 768 M
> +1119 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1169 768 M
> +1165 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1216 768 M
> +1212 768 M
>  stroke
> -1216 696 M
> +1212 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.20)]
>  ] -40.0 MRshow
> @@ -2055,21 +2055,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1263 768 M
> +1258 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1310 768 M
> +1304 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1357 768 M
> +1351 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1403 768 M
> +1397 768 M
>  stroke
> -1403 696 M
> +1397 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.24)]
>  ] -40.0 MRshow
> @@ -2078,21 +2078,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1450 768 M
> +1443 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1497 768 M
> +1490 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1544 768 M
> +1536 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1590 768 M
> +1582 768 M
>  stroke
> -1590 696 M
> +1582 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.28)]
>  ] -40.0 MRshow
> @@ -2101,21 +2101,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1637 768 M
> +1629 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1684 768 M
> +1675 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1731 768 M
> +1721 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1778 768 M
> +1767 768 M
>  stroke
> -1778 696 M
> +1767 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.32)]
>  ] -40.0 MRshow
> @@ -2124,21 +2124,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -1824 768 M
> +1814 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1871 768 M
> +1860 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1918 768 M
> +1906 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -1965 768 M
> +1953 768 M
>  stroke
> -1965 696 M
> +1953 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.36)]
>  ] -40.0 MRshow
> @@ -2147,21 +2147,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2012 768 M
> +1999 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2058 768 M
> +2045 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2105 768 M
> +2092 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2152 768 M
> +2138 768 M
>  stroke
> -2152 696 M
> +2138 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.0)]
>  ] -40.0 MRshow
> @@ -2170,21 +2170,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2199 768 M
> +2184 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2246 768 M
> +2231 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2292 768 M
> +2277 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2339 768 M
> +2323 768 M
>  stroke
> -2339 696 M
> +2323 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.4)]
>  ] -40.0 MRshow
> @@ -2193,21 +2193,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2386 768 M
> +2370 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2433 768 M
> +2416 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2480 768 M
> +2462 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2526 768 M
> +2508 768 M
>  stroke
> -2526 696 M
> +2508 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.8)]
>  ] -40.0 MRshow
> @@ -2216,21 +2216,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2573 768 M
> +2555 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2620 768 M
> +2601 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2667 768 M
> +2647 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2713 768 M
> +2694 768 M
>  stroke
> -2713 696 M
> +2694 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.12)]
>  ] -40.0 MRshow
> @@ -2239,21 +2239,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2760 768 M
> +2740 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2807 768 M
> +2786 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2854 768 M
> +2833 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2901 768 M
> +2879 768 M
>  stroke
> -2901 696 M
> +2879 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.16)]
>  ] -40.0 MRshow
> @@ -2262,21 +2262,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -2947 768 M
> +2925 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -2994 768 M
> +2972 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3041 768 M
> +3018 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3088 768 M
> +3064 768 M
>  stroke
> -3088 696 M
> +3064 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.0)]
>  ] -40.0 MRshow
> @@ -2285,21 +2285,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3135 768 M
> +3110 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3181 768 M
> +3157 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3228 768 M
> +3203 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3275 768 M
> +3249 768 M
>  stroke
> -3275 696 M
> +3249 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.4)]
>  ] -40.0 MRshow
> @@ -2308,21 +2308,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3322 768 M
> +3296 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3369 768 M
> +3342 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3415 768 M
> +3388 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3462 768 M
> +3435 768 M
>  stroke
> -3462 696 M
> +3435 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.8)]
>  ] -40.0 MRshow
> @@ -2331,21 +2331,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3509 768 M
> +3481 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3556 768 M
> +3527 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3603 768 M
> +3574 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3649 768 M
> +3620 768 M
>  stroke
> -3649 696 M
> +3620 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.12)]
>  ] -40.0 MRshow
> @@ -2354,21 +2354,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3696 768 M
> +3666 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3743 768 M
> +3712 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3790 768 M
> +3759 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3836 768 M
> +3805 768 M
>  stroke
> -3836 696 M
> +3805 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.16)]
>  ] -40.0 MRshow
> @@ -2377,25 +2377,25 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -3883 768 M
> +3851 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3930 768 M
> +3898 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -3977 768 M
> +3944 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4024 768 M
> +3990 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4070 768 M
> +4037 768 M
>  stroke
> -4070 696 M
> +4037 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.0)]
>  ] -40.0 MRshow
> @@ -2404,21 +2404,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4117 768 M
> +4083 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4164 768 M
> +4129 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4211 768 M
> +4176 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4258 768 M
> +4222 768 M
>  stroke
> -4258 696 M
> +4222 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.4)]
>  ] -40.0 MRshow
> @@ -2427,21 +2427,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4304 768 M
> +4268 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4351 768 M
> +4315 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4398 768 M
> +4361 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4445 768 M
> +4407 768 M
>  stroke
> -4445 696 M
> +4407 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.8)]
>  ] -40.0 MRshow
> @@ -2450,21 +2450,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4492 768 M
> +4453 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4538 768 M
> +4500 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4585 768 M
> +4546 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4632 768 M
> +4592 768 M
>  stroke
> -4632 696 M
> +4592 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.12)]
>  ] -40.0 MRshow
> @@ -2473,21 +2473,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4679 768 M
> +4639 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4726 768 M
> +4685 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4772 768 M
> +4731 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4819 768 M
> +4778 768 M
>  stroke
> -4819 696 M
> +4778 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.16)]
>  ] -40.0 MRshow
> @@ -2496,21 +2496,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -4866 768 M
> +4824 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4913 768 M
> +4870 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -4959 768 M
> +4917 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5006 768 M
> +4963 768 M
>  stroke
> -5006 696 M
> +4963 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.0)]
>  ] -40.0 MRshow
> @@ -2519,21 +2519,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -5053 768 M
> +5009 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5100 768 M
> +5055 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5147 768 M
> +5102 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> -5193 768 M
> +5148 768 M
>  stroke
> -5193 696 M
> +5148 696 M
>  currentpoint gsave translate 90 rotate 0 0 moveto
>  [ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.4)]
>  ] -40.0 MRshow
> @@ -2542,10 +2542,21 @@ grestore
>  1.000 UL
>  LTb
>  LCb setrgbcolor
> -5240 768 M
> +5194 768 M
>  stroke
>  LTb
>  LCb setrgbcolor
> +5241 768 M
> +stroke
> +5241 696 M
> +currentpoint gsave translate 90 rotate 0 0 moveto
> +[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.6)]
> +] -40.0 MRshow
> +grestore
> +/NimbusSanL-Regu findfont 120 scalefont setfont
> +1.000 UL
> +LTb
> +LCb setrgbcolor
>  5287 768 M
>  63 0 V
>  stroke
> @@ -2675,9 +2686,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 872 768 34 41 BoxColFill
> +0.180 871 768 34 41 BoxColFill
>  LCb setrgbcolor
> -872 768 N
> +871 768 N
>  0 40 V
>  33 0 V
>  0 -40 V
> @@ -2686,64 +2697,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 919 768 34 54 BoxColFill
> +0.180 918 768 33 54 BoxColFill
>  LCb setrgbcolor
> -919 768 N
> +918 768 N
>  0 53 V
> -33 0 V
> +32 0 V
>  0 -53 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 966 768 34 57 BoxColFill
> +0.180 964 768 33 57 BoxColFill
>  LCb setrgbcolor
> -966 768 N
> +964 768 N
>  0 56 V
> -33 0 V
> +32 0 V
>  0 -56 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1013 768 33 47 BoxColFill
> +0.180 1010 768 34 47 BoxColFill
>  LCb setrgbcolor
> -1013 768 N
> +1010 768 N
>  0 46 V
> -32 0 V
> +33 0 V
>  0 -46 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1059 768 34 48 BoxColFill
> +0.180 1057 768 33 48 BoxColFill
>  LCb setrgbcolor
> -1059 768 N
> +1057 768 N
>  0 47 V
> -33 0 V
> +32 0 V
>  0 -47 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1106 768 34 49 BoxColFill
> +0.180 1103 768 33 49 BoxColFill
>  LCb setrgbcolor
> -1106 768 N
> +1103 768 N
>  0 48 V
> -33 0 V
> +32 0 V
>  0 -48 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1153 768 34 65 BoxColFill
> +0.180 1149 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1153 768 N
> +1149 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2752,20 +2763,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1200 768 34 65 BoxColFill
> +0.180 1196 768 33 65 BoxColFill
>  LCb setrgbcolor
> -1200 768 N
> +1196 768 N
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
> -0.180 1247 768 33 65 BoxColFill
> +0.180 1242 768 33 65 BoxColFill
>  LCb setrgbcolor
> -1247 768 N
> +1242 768 N
>  0 64 V
>  32 0 V
>  0 -64 V
> @@ -2774,9 +2785,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1293 768 34 65 BoxColFill
> +0.180 1288 768 34 65 BoxColFill
>  LCb setrgbcolor
> -1293 768 N
> +1288 768 N
>  0 64 V
>  33 0 V
>  0 -64 V
> @@ -2785,42 +2796,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1340 768 34 65 BoxColFill
> +0.180 1335 768 33 65 BoxColFill
>  LCb setrgbcolor
> -1340 768 N
> +1335 768 N
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
> -0.180 1387 768 34 67 BoxColFill
> +0.180 1381 768 33 67 BoxColFill
>  LCb setrgbcolor
> -1387 768 N
> +1381 768 N
>  0 66 V
> -33 0 V
> +32 0 V
>  0 -66 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1434 768 33 164 BoxColFill
> +0.180 1427 768 34 164 BoxColFill
>  LCb setrgbcolor
> -1434 768 N
> +1427 768 N
>  0 163 V
> -32 0 V
> +33 0 V
>  0 -163 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1480 768 34 164 BoxColFill
> +0.180 1473 768 34 164 BoxColFill
>  LCb setrgbcolor
> -1480 768 N
> +1473 768 N
>  0 163 V
>  33 0 V
>  0 -163 V
> @@ -2829,31 +2840,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1527 768 34 207 BoxColFill
> +0.180 1520 768 33 207 BoxColFill
>  LCb setrgbcolor
> -1527 768 N
> +1520 768 N
>  0 206 V
> -33 0 V
> +32 0 V
>  0 -206 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1574 768 34 217 BoxColFill
> +0.180 1566 768 33 217 BoxColFill
>  LCb setrgbcolor
> -1574 768 N
> +1566 768 N
>  0 216 V
> -33 0 V
> +32 0 V
>  0 -216 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1621 768 34 337 BoxColFill
> +0.180 1612 768 34 337 BoxColFill
>  LCb setrgbcolor
> -1621 768 N
> +1612 768 N
>  0 336 V
>  33 0 V
>  0 -336 V
> @@ -2862,9 +2873,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1668 768 33 339 BoxColFill
> +0.180 1659 768 33 339 BoxColFill
>  LCb setrgbcolor
> -1668 768 N
> +1659 768 N
>  0 338 V
>  32 0 V
>  0 -338 V
> @@ -2873,20 +2884,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1714 768 34 344 BoxColFill
> +0.180 1705 768 33 344 BoxColFill
>  LCb setrgbcolor
> -1714 768 N
> +1705 768 N
>  0 343 V
> -33 0 V
> +32 0 V
>  0 -343 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1761 768 34 234 BoxColFill
> +0.180 1751 768 34 234 BoxColFill
>  LCb setrgbcolor
> -1761 768 N
> +1751 768 N
>  0 233 V
>  33 0 V
>  0 -233 V
> @@ -2895,64 +2906,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1808 768 34 273 BoxColFill
> +0.180 1798 768 33 273 BoxColFill
>  LCb setrgbcolor
> -1808 768 N
> +1798 768 N
>  0 272 V
> -33 0 V
> +32 0 V
>  0 -272 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1855 768 34 304 BoxColFill
> +0.180 1844 768 33 304 BoxColFill
>  LCb setrgbcolor
> -1855 768 N
> +1844 768 N
>  0 303 V
> -33 0 V
> +32 0 V
>  0 -303 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1902 768 33 316 BoxColFill
> +0.180 1890 768 34 316 BoxColFill
>  LCb setrgbcolor
> -1902 768 N
> +1890 768 N
>  0 315 V
> -32 0 V
> +33 0 V
>  0 -315 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1948 768 34 329 BoxColFill
> +0.180 1937 768 33 329 BoxColFill
>  LCb setrgbcolor
> -1948 768 N
> +1937 768 N
>  0 328 V
> -33 0 V
> +32 0 V
>  0 -328 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 1995 768 34 370 BoxColFill
> +0.180 1983 768 33 370 BoxColFill
>  LCb setrgbcolor
> -1995 768 N
> +1983 768 N
>  0 369 V
> -33 0 V
> +32 0 V
>  0 -369 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2042 768 34 407 BoxColFill
> +0.180 2029 768 34 407 BoxColFill
>  LCb setrgbcolor
> -2042 768 N
> +2029 768 N
>  0 406 V
>  33 0 V
>  0 -406 V
> @@ -2961,9 +2972,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2089 768 34 408 BoxColFill
> +0.180 2075 768 34 408 BoxColFill
>  LCb setrgbcolor
> -2089 768 N
> +2075 768 N
>  0 407 V
>  33 0 V
>  0 -407 V
> @@ -2972,9 +2983,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2136 768 33 469 BoxColFill
> +0.180 2122 768 33 469 BoxColFill
>  LCb setrgbcolor
> -2136 768 N
> +2122 768 N
>  0 468 V
>  32 0 V
>  0 -468 V
> @@ -2983,20 +2994,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2182 768 34 469 BoxColFill
> +0.180 2168 768 33 469 BoxColFill
>  LCb setrgbcolor
> -2182 768 N
> +2168 768 N
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
> -0.180 2229 768 34 478 BoxColFill
> +0.180 2214 768 34 478 BoxColFill
>  LCb setrgbcolor
> -2229 768 N
> +2214 768 N
>  0 477 V
>  33 0 V
>  0 -477 V
> @@ -3005,64 +3016,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2276 768 34 506 BoxColFill
> +0.180 2261 768 33 506 BoxColFill
>  LCb setrgbcolor
> -2276 768 N
> +2261 768 N
>  0 505 V
> -33 0 V
> +32 0 V
>  0 -505 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2323 768 34 534 BoxColFill
> +0.180 2307 768 33 534 BoxColFill
>  LCb setrgbcolor
> -2323 768 N
> +2307 768 N
>  0 533 V
> -33 0 V
> +32 0 V
>  0 -533 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2370 768 33 566 BoxColFill
> +0.180 2353 768 34 566 BoxColFill
>  LCb setrgbcolor
> -2370 768 N
> +2353 768 N
>  0 565 V
> -32 0 V
> +33 0 V
>  0 -565 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2416 768 34 567 BoxColFill
> +0.180 2400 768 33 567 BoxColFill
>  LCb setrgbcolor
> -2416 768 N
> +2400 768 N
>  0 566 V
> -33 0 V
> +32 0 V
>  0 -566 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2463 768 34 569 BoxColFill
> +0.180 2446 768 33 569 BoxColFill
>  LCb setrgbcolor
> -2463 768 N
> +2446 768 N
>  0 568 V
> -33 0 V
> +32 0 V
>  0 -568 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2510 768 34 601 BoxColFill
> +0.180 2492 768 34 601 BoxColFill
>  LCb setrgbcolor
> -2510 768 N
> +2492 768 N
>  0 600 V
>  33 0 V
>  0 -600 V
> @@ -3071,9 +3082,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2557 768 33 611 BoxColFill
> +0.180 2539 768 33 611 BoxColFill
>  LCb setrgbcolor
> -2557 768 N
> +2539 768 N
>  0 610 V
>  32 0 V
>  0 -610 V
> @@ -3082,20 +3093,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2603 768 34 613 BoxColFill
> +0.180 2585 768 33 613 BoxColFill
>  LCb setrgbcolor
> -2603 768 N
> +2585 768 N
>  0 612 V
> -33 0 V
> +32 0 V
>  0 -612 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2650 768 34 557 BoxColFill
> +0.180 2631 768 34 557 BoxColFill
>  LCb setrgbcolor
> -2650 768 N
> +2631 768 N
>  0 556 V
>  33 0 V
>  0 -556 V
> @@ -3104,9 +3115,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2697 768 34 578 BoxColFill
> +0.180 2677 768 34 578 BoxColFill
>  LCb setrgbcolor
> -2697 768 N
> +2677 768 N
>  0 577 V
>  33 0 V
>  0 -577 V
> @@ -3115,31 +3126,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2744 768 34 589 BoxColFill
> +0.180 2724 768 33 589 BoxColFill
>  LCb setrgbcolor
> -2744 768 N
> +2724 768 N
>  0 588 V
> -33 0 V
> +32 0 V
>  0 -588 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2791 768 33 599 BoxColFill
> +0.180 2770 768 34 599 BoxColFill
>  LCb setrgbcolor
> -2791 768 N
> +2770 768 N
>  0 598 V
> -32 0 V
> +33 0 V
>  0 -598 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2837 768 34 603 BoxColFill
> +0.180 2816 768 34 603 BoxColFill
>  LCb setrgbcolor
> -2837 768 N
> +2816 768 N
>  0 602 V
>  33 0 V
>  0 -602 V
> @@ -3148,31 +3159,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2884 768 34 614 BoxColFill
> +0.180 2863 768 33 614 BoxColFill
>  LCb setrgbcolor
> -2884 768 N
> +2863 768 N
>  0 613 V
> -33 0 V
> +32 0 V
>  0 -613 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2931 768 34 626 BoxColFill
> +0.180 2909 768 33 626 BoxColFill
>  LCb setrgbcolor
> -2931 768 N
> +2909 768 N
>  0 625 V
> -33 0 V
> +32 0 V
>  0 -625 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 2978 768 34 657 BoxColFill
> +0.180 2955 768 34 657 BoxColFill
>  LCb setrgbcolor
> -2978 768 N
> +2955 768 N
>  0 656 V
>  33 0 V
>  0 -656 V
> @@ -3181,9 +3192,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3025 768 33 664 BoxColFill
> +0.180 3002 768 33 664 BoxColFill
>  LCb setrgbcolor
> -3025 768 N
> +3002 768 N
>  0 663 V
>  32 0 V
>  0 -663 V
> @@ -3192,20 +3203,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3071 768 34 662 BoxColFill
> +0.180 3048 768 33 662 BoxColFill
>  LCb setrgbcolor
> -3071 768 N
> +3048 768 N
>  0 661 V
> -33 0 V
> +32 0 V
>  0 -661 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3118 768 34 674 BoxColFill
> +0.180 3094 768 34 674 BoxColFill
>  LCb setrgbcolor
> -3118 768 N
> +3094 768 N
>  0 673 V
>  33 0 V
>  0 -673 V
> @@ -3214,42 +3225,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3165 768 34 675 BoxColFill
> +0.180 3141 768 33 675 BoxColFill
>  LCb setrgbcolor
> -3165 768 N
> +3141 768 N
>  0 674 V
> -33 0 V
> +32 0 V
>  0 -674 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3212 768 34 683 BoxColFill
> +0.180 3187 768 33 683 BoxColFill
>  LCb setrgbcolor
> -3212 768 N
> +3187 768 N
>  0 682 V
> -33 0 V
> +32 0 V
>  0 -682 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3259 768 33 716 BoxColFill
> +0.180 3233 768 34 716 BoxColFill
>  LCb setrgbcolor
> -3259 768 N
> +3233 768 N
>  0 715 V
> -32 0 V
> +33 0 V
>  0 -715 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3305 768 34 724 BoxColFill
> +0.180 3279 768 34 724 BoxColFill
>  LCb setrgbcolor
> -3305 768 N
> +3279 768 N
>  0 723 V
>  33 0 V
>  0 -723 V
> @@ -3258,20 +3269,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3352 768 34 729 BoxColFill
> +0.180 3326 768 33 729 BoxColFill
>  LCb setrgbcolor
> -3352 768 N
> +3326 768 N
>  0 728 V
> -33 0 V
> +32 0 V
>  0 -728 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3399 768 34 737 BoxColFill
> +0.180 3372 768 34 737 BoxColFill
>  LCb setrgbcolor
> -3399 768 N
> +3372 768 N
>  0 736 V
>  33 0 V
>  0 -736 V
> @@ -3280,9 +3291,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3446 768 34 741 BoxColFill
> +0.180 3418 768 34 741 BoxColFill
>  LCb setrgbcolor
> -3446 768 N
> +3418 768 N
>  0 740 V
>  33 0 V
>  0 -740 V
> @@ -3291,9 +3302,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3493 768 33 745 BoxColFill
> +0.180 3465 768 33 745 BoxColFill
>  LCb setrgbcolor
> -3493 768 N
> +3465 768 N
>  0 744 V
>  32 0 V
>  0 -744 V
> @@ -3302,20 +3313,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3539 768 34 748 BoxColFill
> +0.180 3511 768 33 748 BoxColFill
>  LCb setrgbcolor
> -3539 768 N
> +3511 768 N
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
> -0.180 3586 768 34 759 BoxColFill
> +0.180 3557 768 34 759 BoxColFill
>  LCb setrgbcolor
> -3586 768 N
> +3557 768 N
>  0 758 V
>  33 0 V
>  0 -758 V
> @@ -3324,20 +3335,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3633 768 34 887 BoxColFill
> +0.180 3604 768 33 887 BoxColFill
>  LCb setrgbcolor
> -3633 768 N
> +3604 768 N
>  0 886 V
> -33 0 V
> +32 0 V
>  0 -886 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3680 768 33 786 BoxColFill
> +0.180 3650 768 33 786 BoxColFill
>  LCb setrgbcolor
> -3680 768 N
> +3650 768 N
>  0 785 V
>  32 0 V
>  0 -785 V
> @@ -3346,9 +3357,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3726 768 34 781 BoxColFill
> +0.180 3696 768 34 781 BoxColFill
>  LCb setrgbcolor
> -3726 768 N
> +3696 768 N
>  0 780 V
>  33 0 V
>  0 -780 V
> @@ -3357,31 +3368,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3773 768 34 785 BoxColFill
> +0.180 3743 768 33 785 BoxColFill
>  LCb setrgbcolor
> -3773 768 N
> +3743 768 N
>  0 784 V
> -33 0 V
> +32 0 V
>  0 -784 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3820 768 34 781 BoxColFill
> +0.180 3789 768 33 781 BoxColFill
>  LCb setrgbcolor
> -3820 768 N
> +3789 768 N
>  0 780 V
> -33 0 V
> +32 0 V
>  0 -780 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3867 768 34 780 BoxColFill
> +0.180 3835 768 34 780 BoxColFill
>  LCb setrgbcolor
> -3867 768 N
> +3835 768 N
>  0 779 V
>  33 0 V
>  0 -779 V
> @@ -3390,9 +3401,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3914 768 33 779 BoxColFill
> +0.180 3882 768 33 779 BoxColFill
>  LCb setrgbcolor
> -3914 768 N
> +3882 768 N
>  0 778 V
>  32 0 V
>  0 -778 V
> @@ -3401,20 +3412,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 3960 768 34 791 BoxColFill
> +0.180 3928 768 33 791 BoxColFill
>  LCb setrgbcolor
> -3960 768 N
> +3928 768 N
>  0 790 V
> -33 0 V
> +32 0 V
>  0 -790 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4007 768 34 767 BoxColFill
> +0.180 3974 768 34 767 BoxColFill
>  LCb setrgbcolor
> -4007 768 N
> +3974 768 N
>  0 766 V
>  33 0 V
>  0 -766 V
> @@ -3423,9 +3434,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4054 768 34 772 BoxColFill
> +0.180 4020 768 34 772 BoxColFill
>  LCb setrgbcolor
> -4054 768 N
> +4020 768 N
>  0 771 V
>  33 0 V
>  0 -771 V
> @@ -3434,20 +3445,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4101 768 34 750 BoxColFill
> +0.180 4067 768 33 750 BoxColFill
>  LCb setrgbcolor
> -4101 768 N
> +4067 768 N
>  0 749 V
> -33 0 V
> +32 0 V
>  0 -749 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4148 768 33 748 BoxColFill
> +0.180 4113 768 33 748 BoxColFill
>  LCb setrgbcolor
> -4148 768 N
> +4113 768 N
>  0 747 V
>  32 0 V
>  0 -747 V
> @@ -3456,9 +3467,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4194 768 34 754 BoxColFill
> +0.180 4159 768 34 754 BoxColFill
>  LCb setrgbcolor
> -4194 768 N
> +4159 768 N
>  0 753 V
>  33 0 V
>  0 -753 V
> @@ -3467,31 +3478,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4241 768 34 781 BoxColFill
> +0.180 4206 768 33 781 BoxColFill
>  LCb setrgbcolor
> -4241 768 N
> +4206 768 N
>  0 780 V
> -33 0 V
> +32 0 V
>  0 -780 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4288 768 34 784 BoxColFill
> +0.180 4252 768 33 784 BoxColFill
>  LCb setrgbcolor
> -4288 768 N
> +4252 768 N
>  0 783 V
> -33 0 V
> +32 0 V
>  0 -783 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4335 768 34 796 BoxColFill
> +0.180 4298 768 34 796 BoxColFill
>  LCb setrgbcolor
> -4335 768 N
> +4298 768 N
>  0 795 V
>  33 0 V
>  0 -795 V
> @@ -3500,9 +3511,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4382 768 33 812 BoxColFill
> +0.180 4345 768 33 812 BoxColFill
>  LCb setrgbcolor
> -4382 768 N
> +4345 768 N
>  0 811 V
>  32 0 V
>  0 -811 V
> @@ -3511,20 +3522,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4428 768 34 884 BoxColFill
> +0.180 4391 768 33 884 BoxColFill
>  LCb setrgbcolor
> -4428 768 N
> +4391 768 N
>  0 883 V
> -33 0 V
> +32 0 V
>  0 -883 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4475 768 34 896 BoxColFill
> +0.180 4437 768 34 896 BoxColFill
>  LCb setrgbcolor
> -4475 768 N
> +4437 768 N
>  0 895 V
>  33 0 V
>  0 -895 V
> @@ -3533,42 +3544,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4522 768 34 905 BoxColFill
> +0.180 4484 768 33 905 BoxColFill
>  LCb setrgbcolor
> -4522 768 N
> +4484 768 N
>  0 904 V
> -33 0 V
> +32 0 V
>  0 -904 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4569 768 34 910 BoxColFill
> +0.180 4530 768 33 910 BoxColFill
>  LCb setrgbcolor
> -4569 768 N
> +4530 768 N
>  0 909 V
> -33 0 V
> +32 0 V
>  0 -909 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4616 768 33 962 BoxColFill
> +0.180 4576 768 34 962 BoxColFill
>  LCb setrgbcolor
> -4616 768 N
> +4576 768 N
>  0 961 V
> -32 0 V
> +33 0 V
>  0 -961 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4662 768 34 974 BoxColFill
> +0.180 4622 768 34 974 BoxColFill
>  LCb setrgbcolor
> -4662 768 N
> +4622 768 N
>  0 973 V
>  33 0 V
>  0 -973 V
> @@ -3577,64 +3588,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4709 768 34 982 BoxColFill
> +0.180 4669 768 33 982 BoxColFill
>  LCb setrgbcolor
> -4709 768 N
> +4669 768 N
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
> -0.180 4756 768 34 982 BoxColFill
> +0.180 4715 768 33 982 BoxColFill
>  LCb setrgbcolor
> -4756 768 N
> +4715 768 N
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
> -0.180 4803 768 33 982 BoxColFill
> +0.180 4761 768 34 982 BoxColFill
>  LCb setrgbcolor
> -4803 768 N
> +4761 768 N
>  0 981 V
> -32 0 V
> +33 0 V
>  0 -981 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4849 768 34 994 BoxColFill
> +0.180 4808 768 33 994 BoxColFill
>  LCb setrgbcolor
> -4849 768 N
> +4808 768 N
>  0 993 V
> -33 0 V
> +32 0 V
>  0 -993 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4896 768 34 1000 BoxColFill
> +0.180 4854 768 33 1000 BoxColFill
>  LCb setrgbcolor
> -4896 768 N
> +4854 768 N
>  0 999 V
> -33 0 V
> +32 0 V
>  0 -999 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4943 768 34 1032 BoxColFill
> +0.180 4900 768 34 1032 BoxColFill
>  LCb setrgbcolor
> -4943 768 N
> +4900 768 N
>  0 1031 V
>  33 0 V
>  0 -1031 V
> @@ -3643,20 +3654,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 4990 768 34 1034 BoxColFill
> +0.180 4947 768 33 1034 BoxColFill
>  LCb setrgbcolor
> -4990 768 N
> +4947 768 N
>  0 1033 V
> -33 0 V
> +32 0 V
>  0 -1033 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5037 768 33 1054 BoxColFill
> +0.180 4993 768 33 1054 BoxColFill
>  LCb setrgbcolor
> -5037 768 N
> +4993 768 N
>  0 1053 V
>  32 0 V
>  0 -1053 V
> @@ -3665,9 +3676,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5083 768 34 1073 BoxColFill
> +0.180 5039 768 34 1073 BoxColFill
>  LCb setrgbcolor
> -5083 768 N
> +5039 768 N
>  0 1072 V
>  33 0 V
>  0 -1072 V
> @@ -3676,31 +3687,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5130 768 34 1093 BoxColFill
> +0.180 5086 768 33 1093 BoxColFill
>  LCb setrgbcolor
> -5130 768 N
> +5086 768 N
>  0 1092 V
> -33 0 V
> +32 0 V
>  0 -1092 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5177 768 34 1111 BoxColFill
> +0.180 5132 768 33 1111 BoxColFill
>  LCb setrgbcolor
> -5177 768 N
> +5132 768 N
>  0 1110 V
> -33 0 V
> +32 0 V
>  0 -1110 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> -0.180 5224 768 34 1116 BoxColFill
> +0.180 5178 768 34 1116 BoxColFill
>  LCb setrgbcolor
> -5224 768 N
> +5178 768 N
>  0 1115 V
>  33 0 V
>  0 -1115 V
> @@ -3709,6 +3720,17 @@ Z stroke
>  1.000 UL
>  LTb
>  0.00 0.00 0.00 C
> +0.180 5224 768 34 1122 BoxColFill
> +LCb setrgbcolor
> +5224 768 N
> +0 1121 V
> +33 0 V
> +0 -1121 V
> +-33 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.00 0.00 0.00 C
>  % End plot #1
>  % Begin plot #2
>  1.000 UL
> @@ -3742,71 +3764,71 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 872 808 34 1 BoxColFill
> +0.180 871 808 34 1 BoxColFill
>  LCb setrgbcolor
> -872 808 N
> +871 808 N
>  33 0 V
>  -33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 919 821 34 1 BoxColFill
> +0.180 918 821 33 1 BoxColFill
>  LCb setrgbcolor
> -919 821 N
> -33 0 V
> --33 0 V
> +918 821 N
> +32 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 966 824 34 27 BoxColFill
> +0.180 964 824 33 27 BoxColFill
>  LCb setrgbcolor
> -966 824 N
> +964 824 N
>  0 26 V
> -33 0 V
> +32 0 V
>  0 -26 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1013 814 33 32 BoxColFill
> +0.180 1010 814 34 32 BoxColFill
>  LCb setrgbcolor
> -1013 814 N
> +1010 814 N
>  0 31 V
> -32 0 V
> +33 0 V
>  0 -31 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1059 815 34 32 BoxColFill
> +0.180 1057 815 33 32 BoxColFill
>  LCb setrgbcolor
> -1059 815 N
> +1057 815 N
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
> -0.180 1106 816 34 38 BoxColFill
> +0.180 1103 816 33 38 BoxColFill
>  LCb setrgbcolor
> -1106 816 N
> +1103 816 N
>  0 37 V
> -33 0 V
> +32 0 V
>  0 -37 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1153 832 34 53 BoxColFill
> +0.180 1149 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1153 832 N
> +1149 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3815,20 +3837,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1200 832 34 53 BoxColFill
> +0.180 1196 832 33 53 BoxColFill
>  LCb setrgbcolor
> -1200 832 N
> +1196 832 N
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
> -0.180 1247 832 33 53 BoxColFill
> +0.180 1242 832 33 53 BoxColFill
>  LCb setrgbcolor
> -1247 832 N
> +1242 832 N
>  0 52 V
>  32 0 V
>  0 -52 V
> @@ -3837,9 +3859,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1293 832 34 53 BoxColFill
> +0.180 1288 832 34 53 BoxColFill
>  LCb setrgbcolor
> -1293 832 N
> +1288 832 N
>  0 52 V
>  33 0 V
>  0 -52 V
> @@ -3848,42 +3870,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1340 832 34 53 BoxColFill
> +0.180 1335 832 33 53 BoxColFill
>  LCb setrgbcolor
> -1340 832 N
> +1335 832 N
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
> -0.180 1387 834 34 52 BoxColFill
> +0.180 1381 834 33 52 BoxColFill
>  LCb setrgbcolor
> -1387 834 N
> +1381 834 N
>  0 51 V
> -33 0 V
> +32 0 V
>  0 -51 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1434 931 33 53 BoxColFill
> +0.180 1427 931 34 53 BoxColFill
>  LCb setrgbcolor
> -1434 931 N
> +1427 931 N
>  0 52 V
> -32 0 V
> +33 0 V
>  0 -52 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1480 931 34 52 BoxColFill
> +0.180 1473 931 34 52 BoxColFill
>  LCb setrgbcolor
> -1480 931 N
> +1473 931 N
>  0 51 V
>  33 0 V
>  0 -51 V
> @@ -3892,31 +3914,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1527 974 34 61 BoxColFill
> +0.180 1520 974 33 61 BoxColFill
>  LCb setrgbcolor
> -1527 974 N
> +1520 974 N
>  0 60 V
> -33 0 V
> +32 0 V
>  0 -60 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1574 984 34 61 BoxColFill
> +0.180 1566 984 33 61 BoxColFill
>  LCb setrgbcolor
> -1574 984 N
> +1566 984 N
>  0 60 V
> -33 0 V
> +32 0 V
>  0 -60 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1621 1104 34 64 BoxColFill
> +0.180 1612 1104 34 64 BoxColFill
>  LCb setrgbcolor
> -1621 1104 N
> +1612 1104 N
>  0 63 V
>  33 0 V
>  0 -63 V
> @@ -3925,9 +3947,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1668 1106 33 65 BoxColFill
> +0.180 1659 1106 33 65 BoxColFill
>  LCb setrgbcolor
> -1668 1106 N
> +1659 1106 N
>  0 64 V
>  32 0 V
>  0 -64 V
> @@ -3936,20 +3958,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1714 1111 34 65 BoxColFill
> +0.180 1705 1111 33 65 BoxColFill
>  LCb setrgbcolor
> -1714 1111 N
> +1705 1111 N
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
> -0.180 1761 1001 34 66 BoxColFill
> +0.180 1751 1001 34 66 BoxColFill
>  LCb setrgbcolor
> -1761 1001 N
> +1751 1001 N
>  0 65 V
>  33 0 V
>  0 -65 V
> @@ -3958,64 +3980,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1808 1040 34 68 BoxColFill
> +0.180 1798 1040 33 68 BoxColFill
>  LCb setrgbcolor
> -1808 1040 N
> +1798 1040 N
>  0 67 V
> -33 0 V
> +32 0 V
>  0 -67 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1855 1071 34 73 BoxColFill
> +0.180 1844 1071 33 73 BoxColFill
>  LCb setrgbcolor
> -1855 1071 N
> +1844 1071 N
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
> -0.180 1902 1083 33 73 BoxColFill
> +0.180 1890 1083 34 73 BoxColFill
>  LCb setrgbcolor
> -1902 1083 N
> +1890 1083 N
>  0 72 V
> -32 0 V
> +33 0 V
>  0 -72 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1948 1096 34 72 BoxColFill
> +0.180 1937 1096 33 72 BoxColFill
>  LCb setrgbcolor
> -1948 1096 N
> +1937 1096 N
>  0 71 V
> -33 0 V
> +32 0 V
>  0 -71 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 1995 1137 34 73 BoxColFill
> +0.180 1983 1137 33 73 BoxColFill
>  LCb setrgbcolor
> -1995 1137 N
> +1983 1137 N
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
> -0.180 2042 1174 34 85 BoxColFill
> +0.180 2029 1174 34 85 BoxColFill
>  LCb setrgbcolor
> -2042 1174 N
> +2029 1174 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -4024,9 +4046,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2089 1175 34 85 BoxColFill
> +0.180 2075 1175 34 85 BoxColFill
>  LCb setrgbcolor
> -2089 1175 N
> +2075 1175 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -4035,9 +4057,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2136 1236 33 86 BoxColFill
> +0.180 2122 1236 33 86 BoxColFill
>  LCb setrgbcolor
> -2136 1236 N
> +2122 1236 N
>  0 85 V
>  32 0 V
>  0 -85 V
> @@ -4046,20 +4068,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2182 1236 34 86 BoxColFill
> +0.180 2168 1236 33 86 BoxColFill
>  LCb setrgbcolor
> -2182 1236 N
> +2168 1236 N
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
> -0.180 2229 1245 34 85 BoxColFill
> +0.180 2214 1245 34 85 BoxColFill
>  LCb setrgbcolor
> -2229 1245 N
> +2214 1245 N
>  0 84 V
>  33 0 V
>  0 -84 V
> @@ -4068,64 +4090,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2276 1273 34 95 BoxColFill
> +0.180 2261 1273 33 95 BoxColFill
>  LCb setrgbcolor
> -2276 1273 N
> +2261 1273 N
>  0 94 V
> -33 0 V
> +32 0 V
>  0 -94 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2323 1301 34 100 BoxColFill
> +0.180 2307 1301 33 100 BoxColFill
>  LCb setrgbcolor
> -2323 1301 N
> +2307 1301 N
>  0 99 V
> -33 0 V
> +32 0 V
>  0 -99 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2370 1333 33 112 BoxColFill
> +0.180 2353 1333 34 112 BoxColFill
>  LCb setrgbcolor
> -2370 1333 N
> +2353 1333 N
>  0 111 V
> -32 0 V
> +33 0 V
>  0 -111 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2416 1334 34 113 BoxColFill
> +0.180 2400 1334 33 113 BoxColFill
>  LCb setrgbcolor
> -2416 1334 N
> +2400 1334 N
>  0 112 V
> -33 0 V
> +32 0 V
>  0 -112 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2463 1336 34 114 BoxColFill
> +0.180 2446 1336 33 114 BoxColFill
>  LCb setrgbcolor
> -2463 1336 N
> +2446 1336 N
>  0 113 V
> -33 0 V
> +32 0 V
>  0 -113 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2510 1368 34 113 BoxColFill
> +0.180 2492 1368 34 113 BoxColFill
>  LCb setrgbcolor
> -2510 1368 N
> +2492 1368 N
>  0 112 V
>  33 0 V
>  0 -112 V
> @@ -4134,9 +4156,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2557 1378 33 116 BoxColFill
> +0.180 2539 1378 33 116 BoxColFill
>  LCb setrgbcolor
> -2557 1378 N
> +2539 1378 N
>  0 115 V
>  32 0 V
>  0 -115 V
> @@ -4145,20 +4167,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2603 1380 34 116 BoxColFill
> +0.180 2585 1380 33 116 BoxColFill
>  LCb setrgbcolor
> -2603 1380 N
> +2585 1380 N
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
> -0.180 2650 1324 34 114 BoxColFill
> +0.180 2631 1324 34 114 BoxColFill
>  LCb setrgbcolor
> -2650 1324 N
> +2631 1324 N
>  0 113 V
>  33 0 V
>  0 -113 V
> @@ -4167,9 +4189,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2697 1345 34 112 BoxColFill
> +0.180 2677 1345 34 112 BoxColFill
>  LCb setrgbcolor
> -2697 1345 N
> +2677 1345 N
>  0 111 V
>  33 0 V
>  0 -111 V
> @@ -4178,31 +4200,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2744 1356 34 112 BoxColFill
> +0.180 2724 1356 33 112 BoxColFill
>  LCb setrgbcolor
> -2744 1356 N
> +2724 1356 N
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
> -0.180 2791 1366 33 179 BoxColFill
> +0.180 2770 1366 34 179 BoxColFill
>  LCb setrgbcolor
> -2791 1366 N
> +2770 1366 N
>  0 178 V
> -32 0 V
> +33 0 V
>  0 -178 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2837 1370 34 202 BoxColFill
> +0.180 2816 1370 34 202 BoxColFill
>  LCb setrgbcolor
> -2837 1370 N
> +2816 1370 N
>  0 201 V
>  33 0 V
>  0 -201 V
> @@ -4211,31 +4233,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2884 1381 34 212 BoxColFill
> +0.180 2863 1381 33 212 BoxColFill
>  LCb setrgbcolor
> -2884 1381 N
> +2863 1381 N
>  0 211 V
> -33 0 V
> +32 0 V
>  0 -211 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2931 1393 34 213 BoxColFill
> +0.180 2909 1393 33 213 BoxColFill
>  LCb setrgbcolor
> -2931 1393 N
> +2909 1393 N
>  0 212 V
> -33 0 V
> +32 0 V
>  0 -212 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 2978 1424 34 221 BoxColFill
> +0.180 2955 1424 34 221 BoxColFill
>  LCb setrgbcolor
> -2978 1424 N
> +2955 1424 N
>  0 220 V
>  33 0 V
>  0 -220 V
> @@ -4244,9 +4266,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3025 1431 33 220 BoxColFill
> +0.180 3002 1431 33 220 BoxColFill
>  LCb setrgbcolor
> -3025 1431 N
> +3002 1431 N
>  0 219 V
>  32 0 V
>  0 -219 V
> @@ -4255,20 +4277,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3071 1429 34 221 BoxColFill
> +0.180 3048 1429 33 221 BoxColFill
>  LCb setrgbcolor
> -3071 1429 N
> +3048 1429 N
>  0 220 V
> -33 0 V
> +32 0 V
>  0 -220 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3118 1441 34 224 BoxColFill
> +0.180 3094 1441 34 224 BoxColFill
>  LCb setrgbcolor
> -3118 1441 N
> +3094 1441 N
>  0 223 V
>  33 0 V
>  0 -223 V
> @@ -4277,42 +4299,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3165 1442 34 226 BoxColFill
> +0.180 3141 1442 33 226 BoxColFill
>  LCb setrgbcolor
> -3165 1442 N
> +3141 1442 N
>  0 225 V
> -33 0 V
> +32 0 V
>  0 -225 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3212 1450 34 227 BoxColFill
> +0.180 3187 1450 33 227 BoxColFill
>  LCb setrgbcolor
> -3212 1450 N
> +3187 1450 N
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
> -0.180 3259 1483 33 227 BoxColFill
> +0.180 3233 1483 34 227 BoxColFill
>  LCb setrgbcolor
> -3259 1483 N
> +3233 1483 N
>  0 226 V
> -32 0 V
> +33 0 V
>  0 -226 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3305 1491 34 230 BoxColFill
> +0.180 3279 1491 34 230 BoxColFill
>  LCb setrgbcolor
> -3305 1491 N
> +3279 1491 N
>  0 229 V
>  33 0 V
>  0 -229 V
> @@ -4321,20 +4343,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3352 1496 34 230 BoxColFill
> +0.180 3326 1496 33 230 BoxColFill
>  LCb setrgbcolor
> -3352 1496 N
> +3326 1496 N
>  0 229 V
> -33 0 V
> +32 0 V
>  0 -229 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3399 1504 34 285 BoxColFill
> +0.180 3372 1504 34 285 BoxColFill
>  LCb setrgbcolor
> -3399 1504 N
> +3372 1504 N
>  0 284 V
>  33 0 V
>  0 -284 V
> @@ -4343,9 +4365,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3446 1508 34 288 BoxColFill
> +0.180 3418 1508 34 288 BoxColFill
>  LCb setrgbcolor
> -3446 1508 N
> +3418 1508 N
>  0 287 V
>  33 0 V
>  0 -287 V
> @@ -4354,9 +4376,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3493 1512 33 287 BoxColFill
> +0.180 3465 1512 33 287 BoxColFill
>  LCb setrgbcolor
> -3493 1512 N
> +3465 1512 N
>  0 286 V
>  32 0 V
>  0 -286 V
> @@ -4365,20 +4387,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3539 1515 34 288 BoxColFill
> +0.180 3511 1515 33 288 BoxColFill
>  LCb setrgbcolor
> -3539 1515 N
> +3511 1515 N
>  0 287 V
> -33 0 V
> +32 0 V
>  0 -287 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3586 1526 34 289 BoxColFill
> +0.180 3557 1526 34 289 BoxColFill
>  LCb setrgbcolor
> -3586 1526 N
> +3557 1526 N
>  0 288 V
>  33 0 V
>  0 -288 V
> @@ -4387,20 +4409,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3633 1654 34 290 BoxColFill
> +0.180 3604 1654 33 290 BoxColFill
>  LCb setrgbcolor
> -3633 1654 N
> +3604 1654 N
>  0 289 V
> -33 0 V
> +32 0 V
>  0 -289 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3680 1553 33 294 BoxColFill
> +0.180 3650 1553 33 294 BoxColFill
>  LCb setrgbcolor
> -3680 1553 N
> +3650 1553 N
>  0 293 V
>  32 0 V
>  0 -293 V
> @@ -4409,9 +4431,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3726 1548 34 297 BoxColFill
> +0.180 3696 1548 34 297 BoxColFill
>  LCb setrgbcolor
> -3726 1548 N
> +3696 1548 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4420,31 +4442,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3773 1552 34 297 BoxColFill
> +0.180 3743 1552 33 297 BoxColFill
>  LCb setrgbcolor
> -3773 1552 N
> +3743 1552 N
>  0 296 V
> -33 0 V
> +32 0 V
>  0 -296 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3820 1548 34 294 BoxColFill
> +0.180 3789 1548 33 294 BoxColFill
>  LCb setrgbcolor
> -3820 1548 N
> +3789 1548 N
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
> -0.180 3867 1547 34 297 BoxColFill
> +0.180 3835 1547 34 297 BoxColFill
>  LCb setrgbcolor
> -3867 1547 N
> +3835 1547 N
>  0 296 V
>  33 0 V
>  0 -296 V
> @@ -4453,9 +4475,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3914 1546 33 299 BoxColFill
> +0.180 3882 1546 33 299 BoxColFill
>  LCb setrgbcolor
> -3914 1546 N
> +3882 1546 N
>  0 298 V
>  32 0 V
>  0 -298 V
> @@ -4464,20 +4486,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 3960 1558 34 310 BoxColFill
> +0.180 3928 1558 33 310 BoxColFill
>  LCb setrgbcolor
> -3960 1558 N
> +3928 1558 N
>  0 309 V
> -33 0 V
> +32 0 V
>  0 -309 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4007 1534 34 315 BoxColFill
> +0.180 3974 1534 34 315 BoxColFill
>  LCb setrgbcolor
> -4007 1534 N
> +3974 1534 N
>  0 314 V
>  33 0 V
>  0 -314 V
> @@ -4486,9 +4508,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4054 1539 34 443 BoxColFill
> +0.180 4020 1539 34 443 BoxColFill
>  LCb setrgbcolor
> -4054 1539 N
> +4020 1539 N
>  0 442 V
>  33 0 V
>  0 -442 V
> @@ -4497,20 +4519,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4101 1517 34 329 BoxColFill
> +0.180 4067 1517 33 329 BoxColFill
>  LCb setrgbcolor
> -4101 1517 N
> +4067 1517 N
>  0 328 V
> -33 0 V
> +32 0 V
>  0 -328 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4148 1515 33 315 BoxColFill
> +0.180 4113 1515 33 315 BoxColFill
>  LCb setrgbcolor
> -4148 1515 N
> +4113 1515 N
>  0 314 V
>  32 0 V
>  0 -314 V
> @@ -4519,9 +4541,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4194 1521 34 322 BoxColFill
> +0.180 4159 1521 34 322 BoxColFill
>  LCb setrgbcolor
> -4194 1521 N
> +4159 1521 N
>  0 321 V
>  33 0 V
>  0 -321 V
> @@ -4530,31 +4552,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4241 1548 34 322 BoxColFill
> +0.180 4206 1548 33 322 BoxColFill
>  LCb setrgbcolor
> -4241 1548 N
> +4206 1548 N
>  0 321 V
> -33 0 V
> +32 0 V
>  0 -321 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4288 1551 34 323 BoxColFill
> +0.180 4252 1551 33 323 BoxColFill
>  LCb setrgbcolor
> -4288 1551 N
> +4252 1551 N
>  0 322 V
> -33 0 V
> +32 0 V
>  0 -322 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4335 1563 34 331 BoxColFill
> +0.180 4298 1563 34 331 BoxColFill
>  LCb setrgbcolor
> -4335 1563 N
> +4298 1563 N
>  0 330 V
>  33 0 V
>  0 -330 V
> @@ -4563,9 +4585,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4382 1579 33 335 BoxColFill
> +0.180 4345 1579 33 335 BoxColFill
>  LCb setrgbcolor
> -4382 1579 N
> +4345 1579 N
>  0 334 V
>  32 0 V
>  0 -334 V
> @@ -4574,20 +4596,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4428 1651 34 344 BoxColFill
> +0.180 4391 1651 33 344 BoxColFill
>  LCb setrgbcolor
> -4428 1651 N
> +4391 1651 N
>  0 343 V
> -33 0 V
> +32 0 V
>  0 -343 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4475 1663 34 404 BoxColFill
> +0.180 4437 1663 34 404 BoxColFill
>  LCb setrgbcolor
> -4475 1663 N
> +4437 1663 N
>  0 403 V
>  33 0 V
>  0 -403 V
> @@ -4596,42 +4618,42 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4522 1672 34 411 BoxColFill
> +0.180 4484 1672 33 411 BoxColFill
>  LCb setrgbcolor
> -4522 1672 N
> +4484 1672 N
>  0 410 V
> -33 0 V
> +32 0 V
>  0 -410 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4569 1677 34 417 BoxColFill
> +0.180 4530 1677 33 417 BoxColFill
>  LCb setrgbcolor
> -4569 1677 N
> +4530 1677 N
>  0 416 V
> -33 0 V
> +32 0 V
>  0 -416 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4616 1729 33 468 BoxColFill
> +0.180 4576 1729 34 468 BoxColFill
>  LCb setrgbcolor
> -4616 1729 N
> +4576 1729 N
>  0 467 V
> -32 0 V
> +33 0 V
>  0 -467 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4662 1741 34 496 BoxColFill
> +0.180 4622 1741 34 496 BoxColFill
>  LCb setrgbcolor
> -4662 1741 N
> +4622 1741 N
>  0 495 V
>  33 0 V
>  0 -495 V
> @@ -4640,64 +4662,64 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4709 1749 34 518 BoxColFill
> +0.180 4669 1749 33 518 BoxColFill
>  LCb setrgbcolor
> -4709 1749 N
> +4669 1749 N
>  0 517 V
> -33 0 V
> +32 0 V
>  0 -517 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4756 1749 34 536 BoxColFill
> +0.180 4715 1749 33 536 BoxColFill
>  LCb setrgbcolor
> -4756 1749 N
> +4715 1749 N
>  0 535 V
> -33 0 V
> +32 0 V
>  0 -535 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4803 1749 33 537 BoxColFill
> +0.180 4761 1749 34 537 BoxColFill
>  LCb setrgbcolor
> -4803 1749 N
> +4761 1749 N
>  0 536 V
> -32 0 V
> +33 0 V
>  0 -536 V
> --32 0 V
> +-33 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4849 1761 34 544 BoxColFill
> +0.180 4808 1761 33 544 BoxColFill
>  LCb setrgbcolor
> -4849 1761 N
> +4808 1761 N
>  0 543 V
> -33 0 V
> +32 0 V
>  0 -543 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4896 1767 34 546 BoxColFill
> +0.180 4854 1767 33 546 BoxColFill
>  LCb setrgbcolor
> -4896 1767 N
> +4854 1767 N
>  0 545 V
> -33 0 V
> +32 0 V
>  0 -545 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4943 1799 34 553 BoxColFill
> +0.180 4900 1799 34 553 BoxColFill
>  LCb setrgbcolor
> -4943 1799 N
> +4900 1799 N
>  0 552 V
>  33 0 V
>  0 -552 V
> @@ -4706,20 +4728,20 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 4990 1801 34 556 BoxColFill
> +0.180 4947 1801 33 556 BoxColFill
>  LCb setrgbcolor
> -4990 1801 N
> +4947 1801 N
>  0 555 V
> -33 0 V
> +32 0 V
>  0 -555 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5037 1821 33 566 BoxColFill
> +0.180 4993 1821 33 566 BoxColFill
>  LCb setrgbcolor
> -5037 1821 N
> +4993 1821 N
>  0 565 V
>  32 0 V
>  0 -565 V
> @@ -4728,9 +4750,9 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5083 1840 34 581 BoxColFill
> +0.180 5039 1840 34 581 BoxColFill
>  LCb setrgbcolor
> -5083 1840 N
> +5039 1840 N
>  0 580 V
>  33 0 V
>  0 -580 V
> @@ -4739,31 +4761,31 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5130 1860 34 594 BoxColFill
> +0.180 5086 1860 33 594 BoxColFill
>  LCb setrgbcolor
> -5130 1860 N
> +5086 1860 N
>  0 593 V
> -33 0 V
> +32 0 V
>  0 -593 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5177 1878 34 609 BoxColFill
> +0.180 5132 1878 33 609 BoxColFill
>  LCb setrgbcolor
> -5177 1878 N
> +5132 1878 N
>  0 608 V
> -33 0 V
> +32 0 V
>  0 -608 V
> --33 0 V
> +-32 0 V
>  Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> -0.180 5224 1883 34 609 BoxColFill
> +0.180 5178 1883 34 609 BoxColFill
>  LCb setrgbcolor
> -5224 1883 N
> +5178 1883 N
>  0 608 V
>  33 0 V
>  0 -608 V
> @@ -4772,6 +4794,17 @@ Z stroke
>  1.000 UL
>  LTb
>  0.90 0.62 0.00 C
> +0.180 5224 1889 34 623 BoxColFill
> +LCb setrgbcolor
> +5224 1889 N
> +0 622 V
> +33 0 V
> +0 -622 V
> +-33 0 V
> +Z stroke
> +1.000 UL
> +LTb
> +0.90 0.62 0.00 C
>  % End plot #2
>  % Begin plot #3
>  1.500 UL
> @@ -4787,101 +4820,102 @@ LTb
>  0.55 0.00 0.00 C
>  3153 2217 M
>  351 0 V
> -842 768 M
> +841 768 M
>  47 0 V
>  46 0 V
> -47 1167 V
> +46 1167 V
>  47 290 V
> -47 -7 V
> -47 130 V
> +46 -7 V
> +46 130 V
>  46 44 V
>  47 3 V
> -47 0 V
> -47 -7 V
> +46 0 V
> +46 -7 V
>  47 0 V
>  46 -25 V
> -47 -725 V
> +46 -725 V
>  47 3 V
> -47 -58 V
> +46 -58 V
>  46 -29 V
>  47 -210 V
> -47 0 V
> -47 -7 V
> -47 225 V
> -46 -76 V
> -47 -26 V
> -47 -22 V
> +46 0 V
> +46 -7 V
> +46 225 V
> +47 -76 V
> +46 -26 V
> +46 -22 V
>  47 -21 V
> -47 -58 V
> +46 -58 V
>  46 36 V
>  47 -4 V
> -47 -69 V
> -47 0 V
> +46 -69 V
> +46 0 V
>  47 -10 V
>  46 29 V
> -47 -4 V
> +46 -4 V
>  47 25 V
> -47 4 V
> -47 7 V
> +46 4 V
> +46 7 V
>  46 -32 V
>  47 0 V
> -47 0 V
> -47 39 V
> -46 -29 V
> -47 -7 V
> -47 254 V
> +46 0 V
> +46 39 V
> +47 -29 V
> +46 -7 V
> +46 254 V
>  47 76 V
> -47 22 V
> +46 22 V
>  46 -11 V
>  47 -7 V
> -47 -11 V
> -47 11 V
> -47 -11 V
> -46 7 V
> -47 -4 V
> -47 -32 V
> +46 -11 V
> +46 11 V
> +46 -11 V
> +47 7 V
> +46 -4 V
> +46 -32 V
>  47 0 V
> -47 -4 V
> +46 -4 V
>  46 141 V
>  47 8 V
> -47 -8 V
> -47 -3 V
> +46 -8 V
> +46 -3 V
>  47 -7 V
>  46 -105 V
> -47 94 V
> -47 11 V
> +46 94 V
> +46 11 V
>  47 -4 V
>  46 0 V
> -47 4 V
> +46 4 V
>  47 7 V
> -47 14 V
> -47 33 V
> -46 268 V
> -47 -214 V
> -47 -32 V
> +46 14 V
> +46 33 V
> +47 268 V
> +46 -214 V
> +46 -32 V
>  47 7 V
> -47 -22 V
> +46 -22 V
>  46 -3 V
>  47 7 V
> -47 -4 V
> -47 -43 V
> -47 108 V
> -46 8 V
> -47 7 V
> -47 47 V
> +46 -4 V
> +46 -43 V
> +46 108 V
> +47 8 V
> +46 7 V
> +46 47 V
>  47 36 V
> -47 29 V
> +46 29 V
>  46 29 V
>  47 4 V
> -47 -4 V
> -47 0 V
> -46 -14 V
> -47 0 V
> -47 0 V
> -47 7 V
> +46 -4 V
> +46 0 V
> +47 -14 V
> +46 0 V
> +46 0 V
> +46 7 V
>  47 4 V
>  46 7 V
> -47 -4 V
> +46 -4 V
> +47 15 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
> index d3b02680..4ac33da4 100644
> --- a/CodeSamples/formal/data/rcu-test.dat
> +++ b/CodeSamples/formal/data/rcu-test.dat
> @@ -93,3 +93,4 @@ v6.0  19954 10716 30670 34.9
>  ""    21087 11457 32544 35.2
>  v6.4  21444 11748 33192 35.4
>  ""    21530 11753 33283 35.3
> +v6.6  21651 12009 33660 35.7
> 
> base-commit: 32eaf45a90afbaec05d07204341e67e36b57ab89
> -- 
> 2.34.1
> 
