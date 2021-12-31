Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:41840 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhLaRh7 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 31 Dec 2021 12:37:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EF07FB81DA3
        for <perfbook@vger.kernel.org>; Fri, 31 Dec 2021 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640972276;
        bh=elyFqIz0G37lcVvs1ojV+r233GSzax01YfifJMRJ3jw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JqVQ/JFW00XFWvbPSS1W3+Ghf0hHLUinISGHvUoXXDc0qfeT07NqzdA2cXfvEya1Y
         wQkQfGpEDSwycwxKdVP0w+lPegZPE6CudX15HdHwiFvGPb32RrmGbrSGMw2xUJsVin
         b0WP3uSn4sl4D0DdlS/J1d56zkLyoRy0nUgsO8Boe7BBDNDuze8SMOiaPu/ZSPkugI
         UoPAJkWdsEsrb7mEyPdg4zyd0Y8bwPZCYBGic++CANUS+6zCzzV64xJwQc2fAqViAs
         b3JbGwqzyaDwlb3W/uL7DvnUiKG5dfJScegHDVGx4f2JVoFjd3jxMSgthGwEoXSsRC
         hHgB3tCiqnkEw==
Date: Fri, 31 Dec 2021 09:37:56 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Retouch SVG files for browser
 compatibility (2nd attempt)
Message-ID: <20211231173756.GG4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f4bf6a67-ff75-51d3-1253-a17042439ade@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4bf6a67-ff75-51d3-1253-a17042439ade@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 31, 2021 at 11:29:21AM +0900, Akira Yokosawa wrote:
> In <text> elements which are misplaced when viewed in a browser,
> there are "transform" directives of the form:
> 
>     transform="scale(-1)"
> 
> (indicating rotation of 180 degrees), and attributes of:
> 
>     writing-mode:tb-rl
> 
> (top to bottom, right to left: Normally used in vertical text in
> Asian languages.  "lr-tb" is the normal choice in English.)
> 
> By manually removing those transform directives and replacing
> "tb-rl" with "lr-tb" by a text editor; then ungrouping, rotating,
> and moving those text elements by Inkscape 1.1.1; browser-compatible
> SVGs have been obtained.
> 
> Regrouping of edited text elements have been done as a final stage.

Looks good, thank you!  Queued, and will push soon.

I grouped the "Delete-Only List" box, which might well have been
ungrouped to start with.  This also serves as a test of Inkskcape
v1.1 modifying a drawing produced by Inkscape v1.1.1.  ;-)

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I've not figured out what operations corrupted those text elements in
> RCUspacetime.svg.
> So take this fix as a "happens to work" kind of thing.
> 
> Do you have any clue as to why those text elements have 180 degree
> rotation and vertical writing mode?

My best guess is that in the process of copying old figures to make
new figures, I took some 90-degree rotated text and rotated it back.
That -should- result in zero-degree rotation, but if the two verions
of Inkscape used different pivot point for rotation, it would not have
been possible to simply cancel the rotations, at least without quite a
bit more math than I would expect to be applied.

> I guess you copied such a text element to RCUusecases.svg and edited
> and copied it in Inkscape.  So I suspect RCUusecases.svg was corrupted
> from the very beginning.

That is my guess.

> After this update, you should be able to edit both SVGs by Inkscape
> as you'd like, I suppose.

Looks good at the moment, but I am curious as to what your version
of Inkscape thinks.  ;-)

And Happy New Year!!!

							Thanx, Paul

>         Thanks, Akira
> --
>  defer/RCUspacetime.svg |  88 +++--
>  defer/RCUusecases.svg  | 707 ++++++++++++++++++++---------------------
>  2 files changed, 378 insertions(+), 417 deletions(-)
> 
> diff --git a/defer/RCUspacetime.svg b/defer/RCUspacetime.svg
> index bebd4dc1..587b150f 100644
> --- a/defer/RCUspacetime.svg
> +++ b/defer/RCUspacetime.svg
> @@ -7,7 +7,7 @@
>     viewBox="0 0 262.95599 138.7054"
>     version="1.1"
>     id="svg8"
> -   inkscape:version="1.1 (c68e22c387, 2021-05-23)"
> +   inkscape:version="1.1.1 (3bf5ae0, 2021-09-20)"
>     sodipodi:docname="RCUspacetime.svg"
>     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
> @@ -327,9 +327,9 @@
>       borderopacity="1.0"
>       inkscape:pageopacity="0.0"
>       inkscape:pageshadow="2"
> -     inkscape:zoom="1.6285163"
> -     inkscape:cx="210.92819"
> -     inkscape:cy="261.89483"
> +     inkscape:zoom="1.1515349"
> +     inkscape:cx="250.10097"
> +     inkscape:cy="375.15145"
>       inkscape:document-units="mm"
>       inkscape:current-layer="layer1"
>       showgrid="true"
> @@ -337,8 +337,8 @@
>       fit-margin-left="5"
>       fit-margin-right="5"
>       fit-margin-bottom="5"
> -     inkscape:window-width="1920"
> -     inkscape:window-height="1003"
> +     inkscape:window-width="1366"
> +     inkscape:window-height="701"
>       inkscape:window-x="0"
>       inkscape:window-y="0"
>       inkscape:window-maximized="1"
> @@ -714,55 +714,51 @@
>      <text
>         xml:space="preserve"
>         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -       x="-84.219742"
> -       y="-96.887878"
> +       x="-97.617546"
> +       y="84.924591"
>         id="text31542"
> -       transform="scale(-1)"><tspan
> +       transform="rotate(-90)"><tspan
>           sodipodi:role="line"
>           id="tspan31540"
> -         x="-84.219742"
> -         y="-96.887878"
> -         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#5a5aff;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
> -    <g
> -       id="g31594"
> -       transform="translate(-8.9958336,46.017934)">
> -      <text
> -         transform="scale(-1)"
> -         id="text31542-1"
> -         y="-79.621559"
> -         x="-77.026497"
> -         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         xml:space="preserve"><tspan
> -           id="tspan31568"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -           y="-77.026497"
> -           x="-79.621559"
> -           sodipodi:role="line">Grace</tspan></text>
> -      <text
> -         transform="scale(-1)"
> -         id="text31542-1-4"
> -         y="-80.102051"
> -         x="-81.724838"
> -         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         xml:space="preserve"><tspan
> -           id="tspan31568-2"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -           y="-81.724838"
> -           x="-80.102051"
> -           sodipodi:role="line">Period</tspan></text>
> -    </g>
> +         x="-97.617546"
> +         y="84.924591"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#5a5aff;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
> +    <text
> +       id="text31542-1"
> +       y="69.094749"
> +       x="-125.66684"
> +       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +       xml:space="preserve"
> +       transform="rotate(-90)"><tspan
> +         id="tspan31568"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +         y="69.094749"
> +         x="-125.66684"
> +         sodipodi:role="line">Grace</tspan></text>
> +    <text
> +       id="text31542-1-4"
> +       y="73.279411"
> +       x="-126.26012"
> +       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +       xml:space="preserve"
> +       transform="rotate(-90)"><tspan
> +         id="tspan31568-2"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +         y="73.279411"
> +         x="-126.26012"
> +         sodipodi:role="line">Period</tspan></text>
>      <text
>         xml:space="preserve"
>         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -       x="-85.955162"
> -       y="-150.94402"
> +       x="-150.61545"
> +       y="86.660011"
>         id="text31542-2"
> -       transform="scale(-1)"><tspan
> +       transform="rotate(-90)"><tspan
>           sodipodi:role="line"
>           id="tspan31540-2"
> -         x="-85.955162"
> -         y="-150.94402"
> -         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#007b00;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
> +         x="-150.61545"
> +         y="86.660011"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#007b00;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
>      <path
>         style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#Arrow2Mstart);marker-end:url(#Arrow2Mend-99-1-4-0)"
>         d="m 77.258344,110.46875 v 18.52083"
> diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
> index fb5c6007..cc3fb16a 100644
> --- a/defer/RCUusecases.svg
> +++ b/defer/RCUusecases.svg
> @@ -7,7 +7,7 @@
>     viewBox="0 0 193.44529 275.77732"
>     version="1.1"
>     id="svg8"
> -   inkscape:version="1.1 (c68e22c387, 2021-05-23)"
> +   inkscape:version="1.1.1 (3bf5ae0, 2021-09-20)"
>     sodipodi:docname="RCUusecases.svg"
>     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
> @@ -656,9 +656,9 @@
>       borderopacity="1.0"
>       inkscape:pageopacity="0.0"
>       inkscape:pageshadow="2"
> -     inkscape:zoom="1.6285163"
> -     inkscape:cx="385.93412"
> -     inkscape:cy="12.281117"
> +     inkscape:zoom="0.57576746"
> +     inkscape:cx="406.41408"
> +     inkscape:cy="527.99094"
>       inkscape:document-units="mm"
>       inkscape:current-layer="layer1"
>       showgrid="true"
> @@ -666,8 +666,8 @@
>       fit-margin-left="5"
>       fit-margin-right="5"
>       fit-margin-bottom="5"
> -     inkscape:window-width="1920"
> -     inkscape:window-height="1011"
> +     inkscape:window-width="1366"
> +     inkscape:window-height="701"
>       inkscape:window-x="0"
>       inkscape:window-y="0"
>       inkscape:window-maximized="1"
> @@ -701,135 +701,129 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
>      <g
> -       id="g27880"
> -       transform="translate(-18.520839,-28.045845)">
> +       id="g706">
>        <rect
> -         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
> +         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016"
>           width="61.594925"
>           height="30.427073"
> -         x="93.927094"
> -         y="108.58302"
> +         x="75.406258"
> +         y="80.537178"
>           ry="0" />
>        <g
>           id="g31594-5"
> -         transform="rotate(90,75.270696,111.7621)">
> +         transform="translate(12.124174,7.4870758)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3"
> -           y="-79.621559"
> -           x="-77.026497"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="79.621559"
> +           x="77.026497"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -             y="-77.026497"
> -             x="-79.621559"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="79.621559"
> +             x="77.026497"
>               sodipodi:role="line"
>               id="tspan31224">Publish/Subscribe</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6"
> -           y="-80.102051"
> -           x="-81.724838"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="80.102051"
> +           x="81.724838"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2"
> -             y="-88.339401"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="96.812454"
> -         y="130.0853"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="78.291618"
> +         y="102.03945"
>           id="text3777-5-7-8-9"><tspan
>             sodipodi:role="line"
> -           x="96.812454"
> -           y="130.0853"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458299"
> +           x="78.291618"
> +           y="102.03945"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7"><tspan
>               style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
>               id="tspan110710">rcu_assign_pointer()</tspan><tspan
>               style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans'"
>               id="tspan115146"> &amp;</tspan></tspan></text>
>        <path
> -         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="m 155.52139,123.39969 -62.177093,0.26458"
> +         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> +         d="m 137.00055,95.353845 -62.177092,0.26458"
>           id="path4922-0-2-6"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="105.17783"
> -         y="119.96007"
> +         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="86.656998"
> +         y="91.914223"
>           id="text36678"><tspan
>             sodipodi:role="line"
>             id="tspan36676"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
> -           x="105.17783"
> -           y="119.96007">For Linked Structure</tspan></text>
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> +           x="86.656998"
> +           y="91.914223">For Linked Structure</tspan></text>
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="102.9454"
> -         y="135.88304"
> +         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="84.424561"
> +         y="107.8372"
>           id="text43750"><tspan
>             sodipodi:role="line"
>             id="tspan43748"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';stroke-width:0.26458299"
> -           x="102.9454"
> -           y="135.88304">rcu_dereference()</tspan></text>
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';stroke-width:0.264583"
> +           x="84.424561"
> +           y="107.8372">rcu_dereference()</tspan></text>
>      </g>
>      <g
> -       id="g27880-0"
> -       transform="translate(69.056247,-2.6458334)">
> +       id="g744">
>        <rect
>           style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-6"
>           width="91.28125"
>           height="26.458336"
> -         x="89.958336"
> -         y="114.40383" />
> +         x="159.01459"
> +         y="111.758" />
>        <g
>           id="g31594-5-2"
> -         transform="rotate(90,68.638211,112.00874)">
> +         transform="translate(93.397929,39.158352)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3-6"
> -           y="-79.621559"
> -           x="-77.026497"
> +           y="79.621559"
> +           x="77.026497"
>             style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-5-1"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -             y="-77.026497"
> -             x="-79.621559"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="79.621559"
> +             x="77.026497"
>               sodipodi:role="line">Wait for Pre-Existing Things to Finish</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6-8"
> -           y="-80.102051"
> -           x="-81.724838"
> +           y="80.102051"
> +           x="81.724838"
>             style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2-7"
> -             y="-81.724838"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="92.469849"
> -         y="131.68869"
> +         x="161.52609"
> +         y="129.04286"
>           id="text3777-5-7-8-9-9"><tspan
>             sodipodi:role="line"
> -           x="92.469849"
> -           y="131.68869"
> +           x="161.52609"
> +           y="129.04286"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7-2"><tspan
>               style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
> @@ -840,103 +834,100 @@
>               id="tspan101786">rcu_read_unlock()</tspan></tspan></text>
>        <path
>           style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 181.23959,125.25174 H 89.958333"
> +         d="M 250.29584,122.60591 H 159.01458"
>           id="path4922-0-2-6-0"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="110.59689"
> -         y="137.24484"
> +         x="179.65314"
> +         y="134.59901"
>           id="text3777-5-7-8-9-9-5"><tspan
>             sodipodi:role="line"
> -           x="110.59689"
> -           y="137.24484"
> +           x="179.65314"
> +           y="134.59901"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7-2-0">vs. <tspan
>     style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
>     id="tspan87226">synchronize_rcu()</tspan></tspan></text>
>      </g>
>      <g
> -       id="g27880-00"
> -       transform="translate(79.957155,-40.481239)">
> +       id="g727">
>        <rect
>           style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-2"
>           width="62.177082"
>           height="19.843758"
> -         x="93.344933"
> -         y="120.48925"
> +         x="173.30209"
> +         y="80.008011"
>           ry="0" />
>        <g
>           id="g31594-5-26"
> -         transform="rotate(90,67.414131,115.84943)">
> +         transform="translate(106.41554,7.1437809)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3-9"
> -           y="-79.621559"
> -           x="-77.555664"
> +           y="79.621559"
> +           x="77.555664"
>             style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -             y="-77.555664"
> -             x="-79.621559"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="79.621559"
> +             x="77.555664"
>               sodipodi:role="line"
>               id="tspan31224-0">Phased State Change</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6-3"
> -           y="-80.102051"
> -           x="-81.724838"
> +           y="80.102051"
> +           x="81.724838"
>             style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2-5"
> -             y="-81.724838"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <text
>           xml:space="preserve"
>           style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="95.447845"
> -         y="137.26306"
> +         x="175.405"
> +         y="96.781822"
>           id="text3777-5-7-8-9-5"><tspan
>             sodipodi:role="line"
> -           x="95.447845"
> -           y="137.26306"
> +           x="175.405"
> +           y="96.781822"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7-8">+ Checked state variable</tspan></text>
>        <path
>           style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 155.52202,131.07258 H 93.344936"
> +         d="M 235.47917,90.591341 H 173.30209"
>           id="path4922-0-2-6-7"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
> -      <text
> -         xml:space="preserve"
> -         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="111.75105"
> -         y="121.54755"
> -         id="text36678-0"><tspan
> -           sodipodi:role="line"
> -           id="tspan36676-6"
> -           x="111.75105"
> -           y="121.54755"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583" /></text>
> -      <text
> -         xml:space="preserve"
> -         style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="109.90517"
> -         y="135.88304"
> -         id="text43750-0"><tspan
> -           sodipodi:role="line"
> -           id="tspan43748-4"
> -           x="109.90517"
> -           y="135.88304"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';stroke-width:0.264583" /></text>
>      </g>
> +    <text
> +       xml:space="preserve"
> +       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +       x="191.70821"
> +       y="81.066307"
> +       id="text36678-0"><tspan
> +         sodipodi:role="line"
> +         id="tspan36676-6"
> +         x="191.70821"
> +         y="81.066307"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583" /></text>
> +    <text
> +       xml:space="preserve"
> +       style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +       x="189.86232"
> +       y="95.401802"
> +       id="text43750-0"><tspan
> +         sodipodi:role="line"
> +         id="tspan43748-4"
> +         x="189.86232"
> +         y="95.401802"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';stroke-width:0.264583" /></text>
>      <path
>         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1)"
>         d="M 204.66097,111.75793 V 100.75878"
> @@ -944,200 +935,191 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
>      <g
> -       id="g27880-00-5"
> -       transform="translate(29.950911,-29.368729)">
> +       id="g716">
>        <rect
> -         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
> +         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-2-4"
>           width="23.8125"
>           height="14.552083"
> -         x="106.83868"
> -         y="109.90591"
> +         x="136.78958"
> +         y="80.537178"
>           ry="0" />
>        <g
>           id="g31594-5-26-8"
> -         transform="rotate(90,75.732154,113.8111)">
> +         transform="translate(61.700931,7.6729506)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3-9-7"
> -           y="-79.621559"
> -           x="-77.555664"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="79.621559"
> +           x="77.555664"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -             y="-77.555664"
> -             x="-79.621559"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="79.621559"
> +             x="77.555664"
>               sodipodi:role="line"
>               id="tspan31224-0-3">Add-Only</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6-3-3"
> -           y="-80.102051"
> -           x="-81.724838"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="80.102051"
> +           x="81.724838"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2-5-5"
> -             y="-88.339401"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="115.29295"
> -         y="121.54755"
> +         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="145.24387"
> +         y="92.178818"
>           id="text36678-0-7"><tspan
>             sodipodi:role="line"
>             id="tspan36676-6-0"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
> -           x="115.29295"
> -           y="121.54755">List</tspan></text>
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> +           x="145.24387"
> +           y="92.178818">List</tspan></text>
>      </g>
>      <g
> -       id="g27880-9"
> -       transform="translate(15.663392,-66.939605)">
> +       id="g689">
>        <rect
> -         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
> +         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-4"
>           width="62.177074"
>           height="23.81249"
> -         x="93.34494"
> -         y="115.19761"
> +         x="109.00833"
> +         y="48.258003"
>           ry="0" />
>        <g
>           id="g31594-5-6"
> -         transform="rotate(90,71.645102,114.48646)">
> +         transform="translate(43.180076,-25.664579)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3-4"
> -           y="-79.621559"
> -           x="-77.026497"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="79.621559"
> +           x="77.026497"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -             y="-77.026497"
> -             x="-79.621559"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="79.621559"
> +             x="77.026497"
>               sodipodi:role="line"
>               id="tspan31224-5">Type-Safe Memory</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6-5"
> -           y="-80.102051"
> -           x="-81.724838"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="80.102051"
> +           x="81.724838"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2-56"
> -             y="-88.339401"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <path
> -         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="m 155.52139,123.92886 -62.177093,0.26458"
> +         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> +         d="m 171.18478,56.989255 -62.17709,0.26458"
>           id="path4922-0-2-6-9"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="96.953011"
> -         y="135.88304"
> +         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="112.6164"
> +         y="68.943436"
>           id="text43750-9"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
> -           x="96.953011"
> -           y="135.88304">+ Deferred slab reclamation</tspan></text>
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> +           x="112.6164"
> +           y="68.943436">+ Deferred slab reclamation</tspan></text>
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="96.953011"
> -         y="130.8455"
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="112.6164"
> +         y="63.905899"
>           id="text3777-5-7-8-9-0-5"><tspan
>             sodipodi:role="line"
> -           x="96.953011"
> -           y="130.8455"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458299"
> +           x="112.6164"
> +           y="63.905899"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7-6-5">+ Slab allocator</tspan></text>
>      </g>
>      <g
> -       id="g27880-9-3"
> -       transform="translate(105.35714,-66.939609)">
> +       id="g676">
>        <rect
>           style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-4-9"
>           width="51.593758"
>           height="29.104166"
> -         x="93.344933"
> -         y="109.90594"
> +         x="198.70207"
> +         y="42.966328"
>           ry="0" />
>        <g
>           id="g31594-5-6-0"
> -         transform="rotate(90,73.858407,111.40813)">
> +         transform="translate(127.05311,-36.77709)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3-4-4"
> -           y="-85.971565"
> -           x="-77.026497"
> +           y="85.971565"
> +           x="77.026497"
>             style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -             y="-77.026497"
> -             x="-85.971565"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="85.971565"
> +             x="77.026497"
>               sodipodi:role="line"
>               id="tspan31224-5-3">Existence Guarantee</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6-5-3"
> -           y="-80.102051"
> -           x="-81.724838"
> +           y="80.102051"
> +           x="81.724838"
>             style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2-56-4"
> -             y="-81.724838"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="96.812454"
> -         y="125.32281"
> +         x="202.1696"
> +         y="58.383198"
>           id="text3777-5-7-8-9-0-2"><tspan
>             sodipodi:role="line"
> -           x="96.812454"
> -           y="125.32281"
> +           x="202.1696"
> +           y="58.383198"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7-6-4">+ Linked structure</tspan></text>
>        <path
>           style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 144.93869,119.16635 93.344297,118.90174"
> +         d="m 250.29583,52.226741 -51.59439,-0.26461"
>           id="path4922-0-2-6-9-5"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="96.953011"
> -         y="135.88304"
> +         x="202.31015"
> +         y="68.943436"
>           id="text43750-9-3"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-8"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="96.953011"
> -           y="135.88304">+ Deferred reclamation</tspan></text>
> +           x="202.31015"
> +           y="68.943436">+ Deferred reclamation</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="96.953011"
> -         y="130.8455"
> +         x="202.31015"
> +         y="63.905895"
>           id="text3777-5-7-8-9-0-5-1"><tspan
>             sodipodi:role="line"
> -           x="96.953011"
> -           y="130.8455"
> +           x="202.31015"
> +           y="63.905895"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>             id="tspan109-7-6-5-1">+ Heap allocator</tspan></text>
>      </g>
> @@ -1159,64 +1141,57 @@
>         id="path4922-0-2-7-4-2-2"
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
> +    <rect
> +       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
> +       id="rect12016-2-4-9"
> +       width="39.6875"
> +       height="18.520834"
> +       x="211.66669"
> +       y="10.422347"
> +       ry="0" />
>      <g
> -       id="g10761"
> -       transform="translate(-8.4666671,-1.5875911)">
> -      <rect
> -         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
> -         id="rect12016-2-4-9"
> -         width="39.6875"
> -         height="18.520834"
> -         x="220.13335"
> -         y="12.009938"
> -         ry="0" />
> -      <g
> -         id="g31594-5-26-8-3"
> -         transform="rotate(90,183.39005,122.25034)">
> -        <text
> -           transform="scale(-1)"
> -           id="text31542-1-3-9-7-6"
> -           y="-83.553368"
> -           x="-77.555664"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -           xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -             y="-77.555664"
> -             x="-83.553368"
> -             sodipodi:role="line"
> -             id="tspan31224-0-3-0">Delete-Only List</tspan></text>
> -        <text
> -           transform="scale(-1)"
> -           id="text31542-1-4-6-3-3-6"
> -           y="-80.102051"
> -           x="-81.724838"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -           xml:space="preserve"><tspan
> -             id="tspan31568-2-2-5-5-2"
> -             y="-88.339401"
> -             x="-80.102051"
> -             sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
> -      </g>
> +       id="g31594-5-26-8-3"
> +       transform="translate(139.01515,-67.003528)">
>        <text
> -         transform="rotate(-90)"
> -         id="text31542-1-3-9-7-6-3"
> -         y="222.24622"
> -         x="-26.630951"
> -         style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +         id="text31542-1-3-9-7-6"
> +         y="83.553368"
> +         x="77.555664"
> +         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>           xml:space="preserve"><tspan
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -           y="-27.160118"
> -           x="222.77538"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +           y="83.553368"
> +           x="77.555664"
>             sodipodi:role="line"
> -           id="tspan31224-0-3-0-6">- Publish/subscribe</tspan></text>
> -      <path
> -         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.60000001, 0.60000001;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 259.82084,21.799522 220.1327,21.534912"
> -         id="path4922-0-2-6-9-5-7"
> -         inkscape:connector-curvature="0"
> -         sodipodi:nodetypes="cc" />
> +           id="tspan31224-0-3-0">Delete-Only List</tspan></text>
> +      <text
> +         id="text31542-1-4-6-3-3-6"
> +         y="80.102051"
> +         x="81.724838"
> +         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         xml:space="preserve"><tspan
> +           id="tspan31568-2-2-5-5-2"
> +           y="80.102051"
> +           x="81.724838"
> +           sodipodi:role="line"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>      </g>
> +    <text
> +       id="text31542-1-3-9-7-6-3"
> +       y="26.418571"
> +       x="213.09894"
> +       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +       xml:space="preserve"><tspan
> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +         y="26.418571"
> +         x="213.09894"
> +         sodipodi:role="line"
> +         id="tspan31224-0-3-0-6">- Publish/subscribe</tspan></text>
> +    <path
> +       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> +       d="m 251.35417,20.211931 -39.68814,-0.26461"
> +       id="path4922-0-2-6-9-5-7"
> +       inkscape:connector-curvature="0"
> +       sodipodi:nodetypes="cc" />
>      <path
>         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-9-7)"
>         d="m 231.56336,42.852925 -0.053,-12.322008"
> @@ -1224,71 +1199,67 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
>      <g
> -       id="g27880-9-9"
> -       transform="translate(6.4029491,-98.425049)">
> +       id="g661">
>        <rect
> -         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
> +         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-4-2"
>           width="78.052078"
>           height="25.13542"
> -         x="94.40329"
> -         y="114.13936"
> +         x="100.80624"
> +         y="15.71431"
>           ry="0" />
>        <g
>           id="g31594-5-6-02"
> -         transform="rotate(90,68.833929,111.14612)">
> +         transform="translate(29.510567,-58.39913)">
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-3-4-3"
> -           y="-79.621559"
> -           x="-77.026497"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="79.621559"
> +           x="77.026497"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -             y="-77.026497"
> -             x="-79.621559"
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +             y="79.621559"
> +             x="77.026497"
>               sodipodi:role="line"
>               id="tspan19157">Light-Weight Garbage Collector for</tspan></text>
>          <text
> -           transform="scale(-1)"
>             id="text31542-1-4-6-5-5"
> -           y="-80.102051"
> -           x="-81.724838"
> -           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +           y="80.102051"
> +           x="81.724838"
> +           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>             xml:space="preserve"><tspan
>               id="tspan31568-2-2-56-9"
> -             y="-88.339401"
> -             x="-80.102051"
> +             y="80.102051"
> +             x="81.724838"
>               sodipodi:role="line"
> -             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
> +             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
>        </g>
>        <path
> -         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 172.19078,129.74983 H 94.138692"
> +         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> +         d="M 178.59373,31.324781 H 100.54164"
>           id="path4922-0-2-6-9-9"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
> -         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> -         x="97.482178"
> -         y="135.88304"
> +         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> +         x="103.88512"
> +         y="37.457993"
>           id="text43750-9-7"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3"
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
> -           x="97.482178"
> -           y="135.88304">+ NBS</tspan></text>
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> +           x="103.88512"
> +           y="37.457993">+ NBS</tspan></text>
>        <text
> -         transform="rotate(-90)"
>           id="text31542-1-3-4-3-9"
> -         y="98.535355"
> -         x="-124.63039"
> -         style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
> +         y="27.565523"
> +         x="105.18031"
> +         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>           xml:space="preserve"><tspan
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
> -           y="-124.63039"
> -           x="98.535355"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +           y="27.565523"
> +           x="105.18031"
>             sodipodi:role="line"
>             id="tspan19157-3">Non-Blocking Synchronization (NBS)</tspan></text>
>      </g>
> @@ -1305,80 +1276,78 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="ccc" />
>      <g
> -       id="g27880-9-9-5"
> -       transform="translate(33.65503,-144.99192)">
> +       id="g648">
>        <rect
>           style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-4-2-0"
>           width="123.03125"
>           height="35.71875"
> -         x="77.469978"
> -         y="103.29159"
> +         x="111.12501"
> +         y="-41.700333"
>           ry="0" />
>        <path
>           style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 200.50123,112.552 H 77.469975"
> +         d="M 234.15626,-32.43992 H 111.12501"
>           id="path4922-0-2-6-9-9-3"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="118.45444"
> +         x="114.28486"
> +         y="-26.537483"
>           id="text43750-9-7-2"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="118.45444">+ Readers include some sort of snapshot operation</tspan></text>
> +           x="114.28486"
> +           y="-26.537483">+ Readers include some sort of snapshot operation</tspan></text>
>        <text
> -         transform="rotate(-90)"
>           id="text31542-1-3-4-3-9-6"
> -         y="98.535355"
> -         x="-108.75541"
> +         y="-35.368572"
> +         x="134.76733"
>           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>           xml:space="preserve"><tspan
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -           y="-108.75541"
> -           x="98.535355"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +           y="-35.368572"
> +           x="134.76733"
>             sodipodi:role="line"
>             id="tspan19157-3-1">Quasi Multi-Version Consistency Control</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="123.91718"
> +         x="114.28486"
> +         y="-21.074738"
>           id="text43750-9-7-2-9"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="123.91718">+ Constraints on readers and writers:</tspan></text>
> +           x="114.28486"
> +           y="-21.074738">+ Constraints on readers and writers:</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="129.20895"
> +         x="114.28486"
> +         y="-15.782967"
>           id="text43750-9-7-2-9-7"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-4"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="129.20895"><tspan
> +           x="114.28486"
> +           y="-15.782967"><tspan
>     style="fill:#ffffff;fill-opacity:1"
>     id="tspan60832">+</tspan> (1) single object, (2) sequence locks, (3) version number(s),</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="134.6799"
> +         x="114.28486"
> +         y="-10.312019"
>           id="text43750-9-7-2-9-7-2"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-4-7"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="134.6799"><tspan
> +           x="114.28486"
> +           y="-10.312019"><tspan
>     style="fill:#ffffff;fill-opacity:1"
>     id="tspan60832-4">+</tspan> (4) Issaquah challenge, and/or (5) many other approaches</tspan></text>
>      </g>
> @@ -1389,56 +1358,54 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
>      <g
> -       id="g27880-9-9-5-3"
> -       transform="translate(33.65503,-179.91689)">
> +       id="g632">
>        <rect
>           style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-4-2-0-7"
>           width="123.03125"
>           height="23.8125"
> -         x="77.469978"
> -         y="103.29159"
> +         x="111.12501"
> +         y="-76.625305"
>           ry="0" />
>        <path
>           style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 200.50123,112.552 H 77.469975"
> +         d="M 234.15626,-67.36489 H 111.12501"
>           id="path4922-0-2-6-9-9-3-3"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="118.45444"
> +         x="114.28486"
> +         y="-61.462452"
>           id="text43750-9-7-2-4"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-7"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="118.45444">+ Readers as individual or bulk unconditional references</tspan></text>
> +           x="114.28486"
> +           y="-61.462452">+ Readers as individual or bulk unconditional references</tspan></text>
>        <text
> -         transform="rotate(-90)"
>           id="text31542-1-3-4-3-9-6-2"
> -         y="116.7813"
> -         x="-108.75541"
> +         y="-70.337311"
> +         x="148.91379"
>           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>           xml:space="preserve"><tspan
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -           y="-108.75541"
> -           x="116.7813"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +           y="-70.337311"
> +           x="148.91379"
>             sodipodi:role="line"
>             id="tspan19157-3-1-1">Quasi Reference Count</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="123.91718"
> +         x="114.28486"
> +         y="-55.999706"
>           id="text43750-9-7-2-9-79"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-5"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="123.91718">+ Optional bridging to per-object lock or reference</tspan></text>
> +           x="114.28486"
> +           y="-55.999706">+ Optional bridging to per-object lock or reference</tspan></text>
>      </g>
>      <path
>         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6-6)"
> @@ -1447,89 +1414,87 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
>      <g
> -       id="g27880-9-9-5-3-0"
> -       transform="translate(33.65503,-230.45257)">
> +       id="g622">
>        <rect
>           style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
>           id="rect12016-4-2-0-7-9"
>           width="123.03125"
>           height="39.158566"
> -         x="77.469978"
> -         y="103.29159"
> +         x="111.12501"
> +         y="-127.16098"
>           ry="0" />
>        <path
>           style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
> -         d="M 200.50123,112.552 H 77.469975"
> +         d="M 234.15626,-117.90057 H 111.12501"
>           id="path4922-0-2-6-9-9-3-3-3"
>           inkscape:connector-curvature="0"
>           sodipodi:nodetypes="cc" />
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="118.45444"
> +         x="114.28486"
> +         y="-111.99813"
>           id="text43750-9-7-2-4-6"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-7-0"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="118.45444">+ Readers as read-held reader-writer lock</tspan></text>
> +           x="114.28486"
> +           y="-111.99813">+ Readers as read-held reader-writer lock</tspan></text>
>        <text
> -         transform="rotate(-90)"
>           id="text31542-1-3-4-3-9-6-2-6"
> -         y="116.7813"
> -         x="-108.75541"
> +         y="-120.55042"
> +         x="147.14944"
>           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
>           xml:space="preserve"><tspan
> -           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> -           y="-108.75541"
> -           x="116.7813"
> +           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
> +           y="-120.55042"
> +           x="147.14944"
>             sodipodi:role="line"
>             id="tspan19157-3-1-1-2">Quasi Reader-Writer Lock</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="123.91718"
> +         x="114.28486"
> +         y="-106.53539"
>           id="text43750-9-7-2-9-79-6"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-5-1"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="123.91718">+ Spatial as well as temporal synchronization</tspan></text>
> +           x="114.28486"
> +           y="-106.53539">+ Spatial as well as temporal synchronization</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="128.9444"
> +         x="114.28486"
> +         y="-101.50817"
>           id="text43750-9-7-2-9-79-6-3"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-5-1-6"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="128.9444">+ Optional read-to-write upgrade</tspan></text>
> +           x="114.28486"
> +           y="-101.50817">+ Optional read-to-write upgrade</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="133.97195"
> +         x="114.28486"
> +         y="-96.480614"
>           id="text43750-9-7-2-9-79-7"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-5-5"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="133.97195">+ Optional bridging to per-object lock or reference</tspan></text>
> +           x="114.28486"
> +           y="-96.480614">+ Optional bridging to per-object lock or reference</tspan></text>
>        <text
>           xml:space="preserve"
>           style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -         x="80.629829"
> -         y="139.52917"
> +         x="114.28486"
> +         y="-90.923393"
>           id="text43750-9-7-2-9-79-7-3"><tspan
>             sodipodi:role="line"
>             id="tspan43748-6-3-0-3-5-5-5"
>             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
> -           x="80.629829"
> -           y="139.52917">+ Optionally ignore deleted objects</tspan></text>
> +           x="114.28486"
> +           y="-90.923393">+ Optionally ignore deleted objects</tspan></text>
>      </g>
>      <path
>         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6-6-3)"
> 
> base-commit: ae8a6c7c7cbccb72d6334e2a14163a14e6135c94
> -- 
> 2.17.1
> 
