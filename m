Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjECQhV (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 3 May 2023 12:37:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5BF7683
        for <perfbook@vger.kernel.org>; Wed,  3 May 2023 09:37:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29808628BA
        for <perfbook@vger.kernel.org>; Wed,  3 May 2023 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683131827;
        bh=k803w68F5xVSAYHG4czio7nxXDYhbgQImRllqVipHBs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CJ1S8vSrqNN+LYLBuZJ9iwY3SiSdQH0xAM4IllCsYRXnuWvQISjeDzeBm+Gb52Sm1
         GcPKDzlvG+tmEU5SBr9HRL1vz0bh290R1RUQG381plxvRL14DGFZwVlG4PQTinJSEF
         vNsCFkmgMPSFKdfq/CfSZK+JQjr5WNZDN7NfBYi9kC7wlKy/RZs1GJt6vITws2eALQ
         SXDfgSOBtEDhEJZXcHrny3OLcQLXs9GKTJ+jeoKnDPnrc59+bfc2/AIHbfkYPuoqU5
         +p7PjEtZ+RqllpertGKDfHEgaAGmSIANg4TsBzocE+WWI75twD2EUin/PVE8dXGEHT
         /RV71UZfkNzBw==
Date: Wed, 3 May 2023 09:37:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] defer/rcuusage: Make Figure 9.29 more accurate
Message-ID: <07569c52-1e06-4f17-b629-ce38ce803cb1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230503082756.1382348-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503082756.1382348-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 03, 2023 at 04:27:56AM -0400, Alan Huang wrote:
> As suggested by Paul, run the first horizontal line
> right through the "mcp = xchg(&curconfig, mcp);", but
> without overlap.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Nice!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  defer/RCUspacetime.svg | 42 +++++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/defer/RCUspacetime.svg b/defer/RCUspacetime.svg
> index 10135f84..fdbd275b 100644
> --- a/defer/RCUspacetime.svg
> +++ b/defer/RCUspacetime.svg
> @@ -7,7 +7,7 @@
>     viewBox="0 0 262.95599 138.7054"
>     version="1.1"
>     id="svg8"
> -   inkscape:version="1.1 (c4e8f9e, 2021-05-24)"
> +   inkscape:version="1.2.2 (b0a8486, 2022-12-01)"
>     sodipodi:docname="RCUspacetime.svg"
>     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
> @@ -328,7 +328,7 @@
>       inkscape:pageopacity="0.0"
>       inkscape:pageshadow="2"
>       inkscape:zoom="1.1515349"
> -     inkscape:cx="480.22861"
> +     inkscape:cx="481.53122"
>       inkscape:cy="287.87664"
>       inkscape:document-units="mm"
>       inkscape:current-layer="layer1"
> @@ -338,11 +338,13 @@
>       fit-margin-right="5"
>       fit-margin-bottom="5"
>       inkscape:window-width="1551"
> -     inkscape:window-height="1082"
> +     inkscape:window-height="919"
>       inkscape:window-x="117"
> -     inkscape:window-y="72"
> +     inkscape:window-y="25"
>       inkscape:window-maximized="0"
> -     inkscape:pagecheckerboard="0">
> +     inkscape:pagecheckerboard="0"
> +     inkscape:showpageshadow="2"
> +     inkscape:deskcolor="#d1d1d1">
>      <inkscape:grid
>         type="xygrid"
>         id="grid3713"
> @@ -406,8 +408,8 @@
>     style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
>     id="tspan31698"> (5)</tspan></tspan></text>
>      <path
> -       style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3, 3;stroke-dashoffset:0;stroke-opacity:1"
> -       d="M 66.145837,109.14583 H 312.20834"
> +       style="fill:none;stroke:#5a5a5a;stroke-width:0.499998;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3, 3;stroke-dashoffset:0;stroke-opacity:1"
> +       d="M 66.145837,109.14583 H 181.70136"
>         id="path113"
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
> @@ -432,17 +434,17 @@
>      <text
>         xml:space="preserve"
>         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
> -       x="186.25475"
> -       y="100.55408"
> +       x="185.79521"
> +       y="104.68986"
>         id="text3777-5-7-8-0"><tspan
>           sodipodi:role="line"
> -         x="186.25475"
> -         y="100.55408"
> +         x="185.79521"
> +         y="104.68986"
>           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>           id="tspan109-9">mcp = kmalloc(...)</tspan><tspan
>           sodipodi:role="line"
> -         x="186.25475"
> -         y="105.84574"
> +         x="185.79521"
> +         y="110.02502"
>           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
>           id="tspan4704">mcp = xchg(&amp;curconfig, mcp);</tspan></text>
>      <text
> @@ -630,14 +632,14 @@
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="ccac" />
>      <path
> -       style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:2.40000012, 1.20000006, 0.60000003, 1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-9-2)"
> -       d="m 175.94791,77.924998 c 0,0 -8.27905,6.142627 -9.19641,10.774525 -0.67487,3.407487 0.83374,7.395175 3.23349,9.906675 3.42151,3.580852 13.90042,5.247962 13.90042,5.247962"
> +       style="fill:none;stroke:#5a5aff;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:2.40001, 1.2, 0.6, 1.2;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-9-2)"
> +       d="m 176.30901,77.838875 c 0,0 -8.60882,7.335858 -9.56272,12.867521 -0.70175,4.069405 0.86695,8.831718 3.36229,11.831084 3.55779,4.27644 14.4541,6.26741 14.4541,6.26741"
>         id="path4922-7-2"
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="caac" />
>      <path
> -       style="fill:none;stroke:#007b00;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.60000018, 1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99)"
> -       d="m 257.96875,106.49999 c 0,0 8.81151,4.45924 12.02239,1.97279 3.08625,-2.38994 2.95155,-8.25025 1.05605,-11.662547 -3.36055,-6.049701 -12.90643,-5.321755 -18.54385,-9.335692 -4.44232,-3.163004 -11.73251,-11.401626 -11.73251,-11.401626"
> +       style="fill:none;stroke:#007b00;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.6, 1.2;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99)"
> +       d="m 256.70771,108.83394 c 0,0 8.17048,4.79887 11.14777,2.12304 2.86173,-2.57196 2.73683,-8.87861 0.97923,-12.550793 -3.11608,-6.510461 -11.9675,-5.727073 -17.19481,-10.046722 -4.11914,-3.403906 -10.87898,-12.270002 -10.87898,-12.270002"
>         id="path4922-0"
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="caaac" />
> @@ -765,5 +767,11 @@
>         id="path4922-0-2-0-5"
>         inkscape:connector-curvature="0"
>         sodipodi:nodetypes="cc" />
> +    <path
> +       style="fill:none;stroke:#5a5a5a;stroke-width:0.499999;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3, 3;stroke-dashoffset:0;stroke-opacity:1"
> +       d="m 258.38148,109.1463 h 50.99135"
> +       id="path113-93"
> +       inkscape:connector-curvature="0"
> +       sodipodi:nodetypes="cc" />
>    </g>
>  </svg>
> -- 
> 2.34.1
> 
