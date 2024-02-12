Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8239428389
	for <perfbook@vger.kernel.org>; Mon, 12 Feb 2024 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707748902; cv=none; b=VbyoqP99/FPAwAFJDIRQlxgwuqi5YW5tdjxoTkZ/Y0xXWook6uqtps04qsQjLHxsbgiNfB4dNjjs57isAze22BwJyZBpuzirqPVywnsN3afaRk/cSBb5UZMrwoyhL2Fgrv5+TqTPVLtIRYQsj7LM+H6GvoIvT24RJxYttZaW9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707748902; c=relaxed/simple;
	bh=3glXqYDX9id1Tc3hiFHEgMSgZ2D35+Jex/qa+3AkpMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMVQ7TezlD9SHXZjWy5wbG4oSiYj8sLkSVOMnILbuoz1Qxo26FHzO3Pj10Wd3Me1VkQEaZzY/iGsQFRTc8Gl56+FdE41ReT0hqDUTvIGizyijyraTL3g00035T+dvplQS9HJZBJnJnX13qQmd6QD+fG5blO3yyYnyZkiEXke5hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qY8WzyfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qY8WzyfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDC0C433F1;
	Mon, 12 Feb 2024 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707748902;
	bh=3glXqYDX9id1Tc3hiFHEgMSgZ2D35+Jex/qa+3AkpMg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qY8WzyfM9W7xeNGRXBziEuxetAb0DzEMFbbAZAi3iGnhLmpKV6jMCCduZwrxKbElL
	 oqW7rg9Gr0aZAMX3vm44tTEN1hjGk/O14u6y+JuXbcPErJugI+oL8NUSBF0BzJy7/5
	 QDf6HcCJmOjK+yBJDriN7Ipq6B0wwVSQ2XkU3mH4rJYp+JWn/nNDxNt3DhpmpnV+Af
	 LzSa+rcHpCEd8asdDCK+Eyt0OuFCQflcB1w6zDzDBe5vLEfP7Fc5M20ZX1Fn5ncDAW
	 z4WNiDue8FeJV4ZelY2DI7Fg5TTR6jC6FggoRBzwX3CHp3UTLr7mewySSIBEH9XeVx
	 JU9Rj0F4Cy/BA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8FA1ECE1261; Mon, 12 Feb 2024 06:41:41 -0800 (PST)
Date: Mon, 12 Feb 2024 06:41:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook] memorder: Retouch co-, fr-, and rf-hopes.svg
Message-ID: <199f0d8e-edc6-4eaa-88e1-ebbc57247819@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f5db6884-b08d-4823-baf2-fba5d87b28b6@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5db6884-b08d-4823-baf2-fba5d87b28b6@gmail.com>

On Mon, Feb 12, 2024 at 06:59:34PM +0900, Akira Yokosawa wrote:
> These SGVs have bi-directional arrows which cause Ubuntu 20.04's
> inkscape 0.92.5 to crash.
> 
> As workarounds, replace them with the ones which are safe in the
> old version of inkscape.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Thank you for tracking this down and fixing it!

Queued and pushed, still only to github.  (Again, kernel.org will be
catching up soonish.)

							Thanx, Paul

> ---
>  memorder/co-hopes.svg | 80 +++++++++++++++++++++++++++++++------------
>  memorder/fr-hopes.svg | 80 +++++++++++++++++++++++++++++++------------
>  memorder/rf-hopes.svg | 80 +++++++++++++++++++++++++++++++------------
>  3 files changed, 174 insertions(+), 66 deletions(-)
> 
> diff --git a/memorder/co-hopes.svg b/memorder/co-hopes.svg
> index 8c465939..e8d40a76 100644
> --- a/memorder/co-hopes.svg
> +++ b/memorder/co-hopes.svg
> @@ -10,7 +10,7 @@
>     viewBox="0 0 343.3322 260.03502"
>     id="svg2"
>     version="1.1"
> -   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
> +   inkscape:version="1.3.2 (091e20e, 2023-11-25)"
>     sodipodi:docname="co-hopes.svg"
>     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
> @@ -228,6 +228,44 @@
>           transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
>           inkscape:connector-curvature="0" />
>      </marker>
> +    <marker
> +       style="overflow:visible"
> +       id="ConcaveTriangle-3"
> +       refX="0"
> +       refY="0"
> +       orient="auto-start-reverse"
> +       inkscape:stockid="Concave triangle arrow"
> +       markerWidth="1"
> +       markerHeight="1"
> +       viewBox="0 0 1 1"
> +       inkscape:isstock="true"
> +       inkscape:collect="always"
> +       preserveAspectRatio="xMidYMid">
> +      <path
> +         transform="scale(0.7)"
> +         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
> +         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
> +         id="path7-7" />
> +    </marker>
> +    <marker
> +       style="overflow:visible"
> +       id="ConcaveTriangle-3-8"
> +       refX="0"
> +       refY="0"
> +       orient="auto-start-reverse"
> +       inkscape:stockid="Concave triangle arrow"
> +       markerWidth="1"
> +       markerHeight="1"
> +       viewBox="0 0 1 1"
> +       inkscape:isstock="true"
> +       inkscape:collect="always"
> +       preserveAspectRatio="xMidYMid">
> +      <path
> +         transform="scale(0.7)"
> +         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
> +         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
> +         id="path7-7-9" />
> +    </marker>
>    </defs>
>    <sodipodi:namedview
>       pagecolor="#ffffff"
> @@ -238,22 +276,24 @@
>       guidetolerance="10"
>       inkscape:pageopacity="0"
>       inkscape:pageshadow="2"
> -     inkscape:window-width="2245"
> -     inkscape:window-height="1528"
> +     inkscape:window-width="1850"
> +     inkscape:window-height="1009"
>       id="namedview88"
>       showgrid="false"
>       fit-margin-left="5"
>       fit-margin-top="5"
>       fit-margin-right="5"
>       fit-margin-bottom="5"
> -     inkscape:zoom="1.8568507"
> -     inkscape:cx="332.28304"
> -     inkscape:cy="279.77478"
> -     inkscape:window-x="523"
> -     inkscape:window-y="318"
> -     inkscape:window-maximized="0"
> +     inkscape:zoom="3.7137014"
> +     inkscape:cx="175.96999"
> +     inkscape:cy="131.53992"
> +     inkscape:window-x="70"
> +     inkscape:window-y="34"
> +     inkscape:window-maximized="1"
>       inkscape:current-layer="svg2"
> -     inkscape:pagecheckerboard="0" />
> +     inkscape:pagecheckerboard="0"
> +     inkscape:showpageshadow="2"
> +     inkscape:deskcolor="#d1d1d1" />
>    <path
>       style="fill:none;stroke:#000000;stroke-width:1.60492;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Lend-32)"
>       d="m 52.826274,238.12321 283.686986,0.883"
> @@ -494,12 +534,6 @@
>       id="path3011-5-3"
>       inkscape:connector-curvature="0"
>       sodipodi:nodetypes="cc" />
> -  <path
> -     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart);marker-end:url(#Arrow2Lend-3)"
> -     d="m 110.85867,88.312174 -22.669423,0.20855"
> -     id="path3011-3"
> -     inkscape:connector-curvature="0"
> -     sodipodi:nodetypes="cc" />
>    <text
>       xml:space="preserve"
>       style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
> @@ -522,12 +556,6 @@
>         x="84.749611"
>         y="169.91011"
>         style="font-size:9.62954px;line-height:1.25;font-family:sans-serif">co</tspan></text>
> -  <path
> -     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart-7);marker-end:url(#Arrow2Lend-3-7)"
> -     d="m 161.81454,178.4363 -49.07457,0.0506"
> -     id="path3011-3-0"
> -     inkscape:connector-curvature="0"
> -     sodipodi:nodetypes="cc" />
>    <path
>       style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow2Lend-98-4)"
>       d="M 192.47764,168.99739 235.90688,67.014124"
> @@ -568,4 +596,12 @@
>         x="24.576328"
>         y="196.10069"
>         style="font-weight:bold;font-size:12.0492px;line-height:1.25;font-family:sans-serif;fill:#020000;fill-opacity:1">CPU 2</tspan></text>
> +  <path
> +     style="fill:none;stroke:#000000;stroke-width:0.627991px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3);marker-end:url(#ConcaveTriangle-3)"
> +     d="m 90.963672,88.008382 c 17.972248,0 17.972248,0 17.972248,0 v 0"
> +     id="path3" />
> +  <path
> +     style="fill:none;stroke:#000000;stroke-width:0.907462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8);marker-end:url(#ConcaveTriangle-3-8)"
> +     d="m 118.52762,177.53124 c 37.52759,0 37.52759,0 37.52759,0 v 0"
> +     id="path2-6" />
>  </svg>
> diff --git a/memorder/fr-hopes.svg b/memorder/fr-hopes.svg
> index e925a409..c77626f1 100644
> --- a/memorder/fr-hopes.svg
> +++ b/memorder/fr-hopes.svg
> @@ -10,7 +10,7 @@
>     viewBox="0 0 272.95364 262.96874"
>     id="svg2"
>     version="1.1"
> -   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
> +   inkscape:version="1.3.2 (091e20e, 2023-11-25)"
>     sodipodi:docname="fr-hopes.svg"
>     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
> @@ -256,6 +256,44 @@
>           transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
>           inkscape:connector-curvature="0" />
>      </marker>
> +    <marker
> +       style="overflow:visible"
> +       id="ConcaveTriangle-3-8"
> +       refX="0"
> +       refY="0"
> +       orient="auto-start-reverse"
> +       inkscape:stockid="Concave triangle arrow"
> +       markerWidth="1"
> +       markerHeight="1"
> +       viewBox="0 0 1 1"
> +       inkscape:isstock="true"
> +       inkscape:collect="always"
> +       preserveAspectRatio="xMidYMid">
> +      <path
> +         transform="scale(0.7)"
> +         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
> +         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
> +         id="path7-7-9" />
> +    </marker>
> +    <marker
> +       style="overflow:visible"
> +       id="ConcaveTriangle-3-8-3"
> +       refX="0"
> +       refY="0"
> +       orient="auto-start-reverse"
> +       inkscape:stockid="Concave triangle arrow"
> +       markerWidth="1"
> +       markerHeight="1"
> +       viewBox="0 0 1 1"
> +       inkscape:isstock="true"
> +       inkscape:collect="always"
> +       preserveAspectRatio="xMidYMid">
> +      <path
> +         transform="scale(0.7)"
> +         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
> +         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
> +         id="path7-7-9-6" />
> +    </marker>
>    </defs>
>    <sodipodi:namedview
>       pagecolor="#ffffff"
> @@ -266,22 +304,24 @@
>       guidetolerance="10"
>       inkscape:pageopacity="0"
>       inkscape:pageshadow="2"
> -     inkscape:window-width="2245"
> -     inkscape:window-height="1528"
> +     inkscape:window-width="1850"
> +     inkscape:window-height="1009"
>       id="namedview88"
>       showgrid="false"
>       fit-margin-left="5"
>       fit-margin-top="5"
>       fit-margin-right="5"
>       fit-margin-bottom="5"
> -     inkscape:zoom="1.8568507"
> -     inkscape:cx="331.20595"
> -     inkscape:cy="235.61399"
> -     inkscape:window-x="523"
> -     inkscape:window-y="318"
> -     inkscape:window-maximized="0"
> +     inkscape:zoom="5.2519669"
> +     inkscape:cx="112.52927"
> +     inkscape:cy="138.51953"
> +     inkscape:window-x="70"
> +     inkscape:window-y="34"
> +     inkscape:window-maximized="1"
>       inkscape:current-layer="svg2"
> -     inkscape:pagecheckerboard="0" />
> +     inkscape:pagecheckerboard="0"
> +     inkscape:showpageshadow="2"
> +     inkscape:deskcolor="#d1d1d1" />
>    <g
>       id="g28235"
>       transform="translate(9.4514979,85.433725)">
> @@ -483,12 +523,6 @@
>       id="path3011-5-3"
>       inkscape:connector-curvature="0"
>       sodipodi:nodetypes="cc" />
> -  <path
> -     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart);marker-end:url(#Arrow2Lend-3)"
> -     d="m 109.58386,89.370899 -22.669422,0.20855"
> -     id="path3011-3"
> -     inkscape:connector-curvature="0"
> -     sodipodi:nodetypes="cc" />
>    <text
>       xml:space="preserve"
>       style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
> @@ -500,12 +534,6 @@
>         x="135.37384"
>         y="192.42451"
>         style="font-size:9.62954px;line-height:1.25;font-family:sans-serif">-t</tspan></text>
> -  <path
> -     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart-7);marker-end:url(#Arrow2Lend-3-7)"
> -     d="m 160.53973,196.37002 -49.07457,0.0506"
> -     id="path3011-3-0"
> -     inkscape:connector-curvature="0"
> -     sodipodi:nodetypes="cc" />
>    <path
>       style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow2Lend-98-4)"
>       d="M 161.12053,175.02377 111.39632,149.47465"
> @@ -579,4 +607,12 @@
>         x="24.576328"
>         y="200.90344"
>         style="font-weight:bold;font-size:12.0492px;line-height:1.25;font-family:sans-serif;fill:#020000;fill-opacity:1">CPU 2</tspan></text>
> +  <path
> +     style="fill:none;stroke:#000000;stroke-width:0.907462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8);marker-end:url(#ConcaveTriangle-3-8)"
> +     d="m 117.81815,197.54089 c 37.52759,0 37.52759,0 37.52759,0 v 0"
> +     id="path2-6" />
> +  <path
> +     style="fill:none;stroke:#000000;stroke-width:0.61668px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8-3);marker-end:url(#ConcaveTriangle-3-8-3)"
> +     d="m 89.875692,86.068108 c 17.330588,0 17.330588,0 17.330588,0 v 0"
> +     id="path2-6-7" />
>  </svg>
> diff --git a/memorder/rf-hopes.svg b/memorder/rf-hopes.svg
> index 2cbac595..df6849c3 100644
> --- a/memorder/rf-hopes.svg
> +++ b/memorder/rf-hopes.svg
> @@ -10,7 +10,7 @@
>     viewBox="0 0 389.50302 242.06765"
>     id="svg2"
>     version="1.1"
> -   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
> +   inkscape:version="1.3.2 (091e20e, 2023-11-25)"
>     sodipodi:docname="rf-hopes.svg"
>     xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>     xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
> @@ -270,6 +270,44 @@
>           transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
>           inkscape:connector-curvature="0" />
>      </marker>
> +    <marker
> +       style="overflow:visible"
> +       id="ConcaveTriangle-3-8"
> +       refX="0"
> +       refY="0"
> +       orient="auto-start-reverse"
> +       inkscape:stockid="Concave triangle arrow"
> +       markerWidth="1"
> +       markerHeight="1"
> +       viewBox="0 0 1 1"
> +       inkscape:isstock="true"
> +       inkscape:collect="always"
> +       preserveAspectRatio="xMidYMid">
> +      <path
> +         transform="scale(0.7)"
> +         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
> +         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
> +         id="path7-7-9" />
> +    </marker>
> +    <marker
> +       style="overflow:visible"
> +       id="ConcaveTriangle-3-8-3"
> +       refX="0"
> +       refY="0"
> +       orient="auto-start-reverse"
> +       inkscape:stockid="Concave triangle arrow"
> +       markerWidth="1"
> +       markerHeight="1"
> +       viewBox="0 0 1 1"
> +       inkscape:isstock="true"
> +       inkscape:collect="always"
> +       preserveAspectRatio="xMidYMid">
> +      <path
> +         transform="scale(0.7)"
> +         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
> +         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
> +         id="path7-7-9-6" />
> +    </marker>
>    </defs>
>    <sodipodi:namedview
>       pagecolor="#ffffff"
> @@ -280,22 +318,24 @@
>       guidetolerance="10"
>       inkscape:pageopacity="0"
>       inkscape:pageshadow="2"
> -     inkscape:window-width="2245"
> -     inkscape:window-height="1528"
> +     inkscape:window-width="1850"
> +     inkscape:window-height="1009"
>       id="namedview88"
>       showgrid="false"
>       fit-margin-left="5"
>       fit-margin-top="5"
>       fit-margin-right="5"
>       fit-margin-bottom="5"
> -     inkscape:zoom="1.8568507"
> -     inkscape:cx="327.97467"
> -     inkscape:cy="213.53359"
> -     inkscape:window-x="860"
> -     inkscape:window-y="345"
> -     inkscape:window-maximized="0"
> +     inkscape:zoom="5.2519669"
> +     inkscape:cx="168.6035"
> +     inkscape:cy="88.443056"
> +     inkscape:window-x="70"
> +     inkscape:window-y="34"
> +     inkscape:window-maximized="1"
>       inkscape:current-layer="svg2"
> -     inkscape:pagecheckerboard="0" />
> +     inkscape:pagecheckerboard="0"
> +     inkscape:showpageshadow="2"
> +     inkscape:deskcolor="#d1d1d1" />
>    <g
>       id="g28235"
>       transform="translate(126.00079,64.532629)">
> @@ -491,12 +531,6 @@
>       id="path3011-5-3"
>       inkscape:connector-curvature="0"
>       sodipodi:nodetypes="cc" />
> -  <path
> -     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart);marker-end:url(#Arrow2Lend-3)"
> -     d="m 166.13315,68.469803 -22.66942,0.20855"
> -     id="path3011-3"
> -     inkscape:connector-curvature="0"
> -     sodipodi:nodetypes="cc" />
>    <text
>       xml:space="preserve"
>       style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
> @@ -508,12 +542,6 @@
>         x="202.73589"
>         y="165.89842"
>         style="font-size:9.62954px;line-height:1.25;font-family:sans-serif">t</tspan></text>
> -  <path
> -     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart-7);marker-end:url(#Arrow2Lend-3-7)"
> -     d="m 237.42132,170.13008 -69.40688,-0.23556"
> -     id="path3011-3-0"
> -     inkscape:connector-curvature="0"
> -     sodipodi:nodetypes="cc" />
>    <path
>       style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow2Lend-98-4)"
>       d="m 227.17463,128.43082 12.71532,19.87415"
> @@ -593,4 +621,12 @@
>         x="24.576328"
>         y="174.46837"
>         style="font-weight:bold;font-size:12.0492px;line-height:1.25;font-family:sans-serif;fill:#020000;fill-opacity:1">CPU 2</tspan></text>
> +  <path
> +     style="fill:none;stroke:#000000;stroke-width:1.11284px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8);marker-end:url(#ConcaveTriangle-3-8)"
> +     d="m 175.6647,171.29089 c 56.43602,0 56.43602,0 56.43602,0 v 0"
> +     id="path2-6" />
> +  <path
> +     style="fill:none;stroke:#000000;stroke-width:0.615678px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8-3);marker-end:url(#ConcaveTriangle-3-8-3)"
> +     d="m 146.43039,65.500188 c 17.27428,0 17.27428,0 17.27428,0 v 0"
> +     id="path2-6-7" />
>  </svg>
> 
> base-commit: cb74c776aa3257249c79e24eb1b93cd7fb22700d
> -- 
> 2.34.1
> 
