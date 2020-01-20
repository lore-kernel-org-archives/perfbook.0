Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgATFDI (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 20 Jan 2020 00:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579496587;
        bh=p2W9M5L1qJxTkHIL++TdRXLYyaCNP+kkHVqv6vbCR/s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mOUPvaPvqrP7QaJRT8NgeFXxmduhujYGY/IoZxo65UIvDHOZvpptIKq5DozShevtv
         S+mubUO9CT+twgeTWPR3aracc03dX/Bz7f1VKt6Wr34Us4tDKC8MNBXFjrsVFYZCZx
         HfEDEyBmBCV3NU506f6Y5z+sKv3BYX1YOI+A3Xu4=
Date: Sun, 19 Jan 2020 21:03:07 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Make Figure 5.8 resemble with Figure 2.6
Message-ID: <20200120050307.GC2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <fa332540-81e5-eef2-8d3e-2b37f5b7ba97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa332540-81e5-eef2-8d3e-2b37f5b7ba97@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 20, 2020 at 07:41:27AM +0900, Akira Yokosawa wrote:
> >From 6cca1282ca2d80d1e01769fb109284c1182d8ec0 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 20 Jan 2020 00:09:40 +0900
> Subject: [PATCH] count: Make Figure 5.8 resemble with Figure 2.6
> 
> Tweak parameters of text object in the .svg file so that the figure
> looks similar to Figure 2.6.
> Also change the color of arrows from "Batch", "Weaken", and "Partition"
> to make them stand out on the blue background.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

> ---
> Paul,
> 
> Is the color of the arrows OK with your eyes?

Yes, but it would be better to ask someone with normal color vision.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
>  count/FourTaskOrderOpt.svg | 54 +++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 33 deletions(-)
> 
> diff --git a/count/FourTaskOrderOpt.svg b/count/FourTaskOrderOpt.svg
> index 2faee3b5..bb31ec27 100644
> --- a/count/FourTaskOrderOpt.svg
> +++ b/count/FourTaskOrderOpt.svg
> @@ -216,7 +216,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text52">Partitioning</text>
>      <!-- Text -->
> @@ -228,7 +228,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text54">Work</text>
>      <!-- Text -->
> @@ -240,7 +240,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text56">Access Control</text>
>      <!-- Text -->
> @@ -252,7 +252,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text58">Parallel</text>
>      <!-- Text -->
> @@ -264,7 +264,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text60">With Hardware</text>
>      <!-- Text -->
> @@ -276,7 +276,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text62">Interacting</text>
>      <!-- Text -->
> @@ -291,7 +291,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text70">Resource</text>
>      <!-- Text -->
> @@ -301,7 +301,7 @@
>         y="1125"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         id="text72"
>         text-anchor="middle"
>         font-family="Helvetica"
> @@ -315,7 +315,7 @@
>         font-family="Helvetica"
>         font-style="normal"
>         font-weight="normal"
> -       font-size="108"
> +       font-size="130"
>         text-anchor="middle"
>         id="text74">Replication</text>
>      <!-- Line -->
> @@ -330,7 +330,7 @@
>         id="polygon78" />
>      <text
>         xml:space="preserve"
> -       style="font-size:9px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
> +       style="font-size:10px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
>         x="221.82668"
>         y="144.38997"
>         id="text3104"
> @@ -340,10 +340,10 @@
>           id="tspan3106"
>           x="221.82668"
>           y="144.38997"
> -         style="font-style:italic">Partition</tspan></text>
> +         style="font-style:italic;font-weight:bold">Partition</tspan></text>
>      <text
>         xml:space="preserve"
> -       style="font-size:120.80000305px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
> +       style="font-size:130px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
>         x="146.69788"
>         y="1915.4342"
>         id="text3104-3"
> @@ -352,10 +352,10 @@
>           id="tspan3106-5"
>           x="146.69788"
>           y="1915.4342"
> -         style="font-style:italic">Weaken</tspan></text>
> +         style="font-style:italic;font-weight:bold">Weaken</tspan></text>
>      <text
>         xml:space="preserve"
> -       style="font-size:120.80000305px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
> +       style="font-size:130px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
>         x="2992.8018"
>         y="176.79025"
>         id="text3104-3-7"
> @@ -364,7 +364,7 @@
>           id="tspan3106-5-5"
>           x="2992.8018"
>           y="176.79025"
> -         style="font-style:italic">Batch</tspan></text>
> +         style="font-style:italic;font-weight:bold">Batch</tspan></text>
>      <g
>         id="g5308">
>        <path
> @@ -372,10 +372,10 @@
>           inkscape:connector-curvature="0"
>           id="path4364"
>           d="m 3242.2107,1800.0321 c -70.8063,-134.5638 -206.2829,-405.517 -206.2829,-405.517"
> -         style="fill:#00ff00;fill-opacity:1;stroke:#00ff00;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:none" />
> +         style="fill:#ff00ff;fill-opacity:1;stroke:#ff00ff;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:none" />
>        <polygon
>           id="polygon42-9"
> -         style="fill:#00ff00;fill-opacity:1;stroke:#00ff00;stroke-width:7;stroke-miterlimit:8;stroke-opacity:1"
> +         style="fill:#ff00ff;fill-opacity:1;stroke:#ff00ff;stroke-width:7;stroke-miterlimit:8;stroke-opacity:1"
>           points="2775,1355 2745,1505 2775,1475 2805,1505 2805,1505 "
>           transform="matrix(0.88302053,-0.46933436,0.46933436,0.88302053,-61.540385,1481.8163)" />
>      </g>
> @@ -388,10 +388,10 @@
>           inkscape:connector-curvature="0"
>           id="path4364-4"
>           d="m 3242.2107,1800.0321 c -70.8063,-134.5638 -206.2829,-405.517 -206.2829,-405.517"
> -         style="fill:#00ff00;fill-opacity:1;stroke:#00ff00;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:none" />
> +         style="fill:#ff00ff;fill-opacity:1;stroke:#ff00ff;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:none" />
>        <polygon
>           id="polygon42-9-9"
> -         style="fill:#00ff00;fill-opacity:1;stroke:#00ff00;stroke-width:7;stroke-miterlimit:8;stroke-opacity:1"
> +         style="fill:#ff00ff;fill-opacity:1;stroke:#ff00ff;stroke-width:7;stroke-miterlimit:8;stroke-opacity:1"
>           points="2775,1355 2745,1505 2775,1475 2805,1505 2805,1505 "
>           transform="matrix(0.88302053,-0.46933436,0.46933436,0.88302053,-61.540385,1481.8163)" />
>      </g>
> @@ -404,24 +404,12 @@
>           inkscape:connector-curvature="0"
>           id="path4364-8"
>           d="m 3242.2107,1800.0321 c -70.8063,-134.5638 -206.2829,-405.517 -206.2829,-405.517"
> -         style="fill:#00ff00;fill-opacity:1;stroke:#00ff00;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:none" />
> +         style="fill:#ff00ff;fill-opacity:1;stroke:#ff00ff;stroke-width:13.42222214px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:none" />
>        <polygon
>           id="polygon42-9-2"
> -         style="fill:#00ff00;fill-opacity:1;stroke:#00ff00;stroke-width:7;stroke-miterlimit:8;stroke-opacity:1"
> +         style="fill:#ff00ff;fill-opacity:1;stroke:#ff00ff;stroke-width:7;stroke-miterlimit:8;stroke-opacity:1"
>           points="2775,1475 2805,1505 2805,1505 2775,1355 2745,1505 "
>           transform="matrix(0.88302053,-0.46933436,0.46933436,0.88302053,-61.540385,1481.8163)" />
>      </g>
> -    <text
> -       sodipodi:linespacing="125%"
> -       id="text5398"
> -       y="176.79025"
> -       x="2992.8018"
> -       style="font-size:120.80000305px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans"
> -       xml:space="preserve"><tspan
> -         style="font-style:italic"
> -         y="176.79025"
> -         x="2992.8018"
> -         id="tspan5400"
> -         sodipodi:role="line">Batch</tspan></text>
>    </g>
>  </svg>
> -- 
> 2.17.1
> 
