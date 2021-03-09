Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230491AbhCITqj (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 9 Mar 2021 14:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615319199;
        bh=P4H9MGi/G6S50dAjzjWodXgrW7NyE6+GKHW+DJA9PeU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XAZFdmwqccoV7kG90agmXx9P3pFl0R0H5wBTlYfzeuTRIPzxI/ZONUqLw5ypmY9Yk
         tDmb6EikXb8CmCutu30vdzBJ1bv3m9HIxhpxqy/b8kkLxnhh1fwVlwq9ffTM+ydMj+
         Vbe3cXy0km28LFUWLR2DGaQUKS+VOv+tiwwaiFRb2VPQypl4b02z63FNDRdPWgrJFn
         Vf7dk33ytU40n22dbt/6G6kxBDci5YFcQFUdWOQTwdSI4ogYnu+6kGjbLgkePWgwd0
         7HA3sUhoJSkzeTLmKKdE0+iqAgPuuONn2hxby4Y70qQu/RlQg1gSwNFe841JSFdVdF
         3OlWBTQzHljPQ==
Date: Tue, 9 Mar 2021 11:46:38 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook] Possible improvements of Figures 9.11 -- 9.13
Message-ID: <20210309194638.GS2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <25130536-3b28-3cef-30f7-17da90c9ccdb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25130536-3b28-3cef-30f7-17da90c9ccdb@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Mar 10, 2021 at 12:32:30AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I'm reviewing Section 9.5.
> I find Figures 9.11 -- 9.13 are somewhat hard to grasp.
> 
> In those figures, P0() is called "RCU Reader" due to the
> RCU read-side critical section.
> 
> However, it updates x and y, and you are talking about
> final values of x and y.
> 
> At first glance, it looked as though P0() would read from
> x and y, and get values 1 or 2.
> 
> Some clarification would help new readers of Edition 2,
> I suppose.

How about as shown below?  (Not particularly human-readable given that
I modified the figures as well.)

							Thanx, Paul

------------------------------------------------------------------------

 RCUGuaranteeFwd.svg |   99 +++++++++++++++++++++++---------------------------
 RCUGuaranteeMid.svg |  101 ++++++++++++++++++++++++----------------------------
 RCUGuaranteeRev.svg |   99 +++++++++++++++++++++++---------------------------
 rcufundamental.tex  |   51 ++++++++++++++++----------
 4 files changed, 173 insertions(+), 177 deletions(-)

commit 00ba43d6f9e6892cfb336ae8c75802852486cf15
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Mar 9 11:44:21 2021 -0800

    defer/rcufundamental: Clarify discussion of Figures 9.11-9.13
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/defer/RCUGuaranteeFwd.svg b/defer/RCUGuaranteeFwd.svg
index 124b649..055638b 100644
--- a/defer/RCUGuaranteeFwd.svg
+++ b/defer/RCUGuaranteeFwd.svg
@@ -13,7 +13,7 @@
    height="270.15079"
    id="svg2"
    version="1.1"
-   inkscape:version="0.48.4 r9939"
+   inkscape:version="0.92.3 (2405546, 2018-03-11)"
    sodipodi:docname="RCUGuaranteeFwd.svg">
   <defs
      id="defs4">
@@ -124,7 +124,7 @@
      inkscape:pageopacity="0.0"
      inkscape:pageshadow="2"
      inkscape:zoom="3.7201446"
-     inkscape:cx="117.75291"
+     inkscape:cx="106.53768"
      inkscape:cy="135.07539"
      inkscape:document-units="px"
      inkscape:current-layer="layer1"
@@ -133,10 +133,10 @@
      fit-margin-left="0.05"
      fit-margin-right="0.05"
      fit-margin-bottom="0.05"
-     inkscape:window-width="1012"
-     inkscape:window-height="1148"
-     inkscape:window-x="458"
-     inkscape:window-y="24"
+     inkscape:window-width="1652"
+     inkscape:window-height="1465"
+     inkscape:window-x="2188"
+     inkscape:window-y="337"
      inkscape:window-maximized="0" />
   <metadata
      id="metadata7">
@@ -165,8 +165,8 @@
         <path
            inkscape:connector-curvature="0"
            id="path5410"
-           d="m 84.754663,841.32358 100.721987,0.37407 -0.37407,14.6715"
-           style="fill:none;stroke:#00ff00;stroke-width:15.3268261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
+           d="m 84.217049,797.77689 100.453181,0.10526 0.43235,58.487"
+           style="fill:none;stroke:#00ff00;stroke-width:15.3268261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
            sodipodi:nodetypes="ccc" />
         <path
            inkscape:connector-curvature="0"
@@ -179,36 +179,36 @@
            id="path5450"
            inkscape:connector-curvature="0" />
         <path
-           style="fill:none;stroke:#64c8c8;stroke-width:16;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
-           d="m 26.511711,797.23541 -38.528801,0 -0.374066,173.9407 157.107726,0"
+           style="fill:none;stroke:#64c8c8;stroke-width:16;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           d="m 26.511711,841.58852 -38.797608,-0.2688 -0.105259,129.85639 H 144.71657"
            id="path5456"
            inkscape:connector-curvature="0"
            sodipodi:nodetypes="cccc" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="93.409752"
-           y="844.49298"
-           id="text5458"
-           sodipodi:linespacing="125%"><tspan
+           y="800.49298"
+           id="text5458"><tspan
              sodipodi:role="line"
              x="93.409752"
-             y="844.49298"
-             id="tspan5462">Given this ordering ...</tspan></text>
+             y="800.49298"
+             id="tspan5462"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">Given this ordering ...</tspan></text>
         <text
-           sodipodi:linespacing="125%"
            id="text5466"
            y="973.47589"
            x="6.0528007"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
              id="tspan5468"
              y="973.47589"
              x="6.0528007"
-             sodipodi:role="line">.... RCU guarantees this ordering.</tspan></text>
+             sodipodi:role="line"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">.... RCU guarantees this ordering.</tspan></text>
         <path
            style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
-           d="M 108.47914,114.18551 59.102431,217.8018"
+           d="M 112.24243,68.219555 59.102431,217.8018"
            id="path5470"
            inkscape:connector-curvature="0"
            transform="translate(26.137646,740.75144)"
@@ -230,13 +230,12 @@
            id="rect4930"
            style="fill:#fe9696;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text4932"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="font-size:6px;text-align:center;text-anchor:middle"
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan4936"
              y="795.81049"
              x="61.421471"
@@ -255,16 +254,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text4948"
-           sodipodi:linespacing="125%"><tspan
+           id="text4948"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
              id="tspan4952"
-             style="text-align:center;text-anchor:middle">x = 1;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle">r1 = x;</tspan></text>
       </g>
       <path
          style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
@@ -289,16 +287,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text5352"
-           sodipodi:linespacing="125%"><tspan
+           id="text5352"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
              id="tspan5356"
-             style="text-align:center;text-anchor:middle">y = 1;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle">r2 = y;</tspan></text>
       </g>
       <g
          transform="translate(124,89.95315)"
@@ -313,16 +310,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text5364"
-           sodipodi:linespacing="125%"><tspan
+           id="text5364"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
              id="tspan5368"
-             style="text-align:center;text-anchor:middle">y = 2;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle">x = 1;</tspan></text>
       </g>
       <g
          transform="translate(124,134)"
@@ -336,13 +332,12 @@
            id="rect5372"
            style="fill:#fe9696;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text5374"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="font-size:6px;text-align:center;text-anchor:middle"
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan5378"
              y="795.81049"
              x="61.421471"
@@ -370,17 +365,16 @@
            id="rect5386"
            style="fill:#96c8fe;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text5388"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="text-align:center;text-anchor:middle"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan5392"
              y="795.81049"
              x="61.421471"
-             sodipodi:role="line">x = 2;</tspan></text>
+             sodipodi:role="line">y = 1;</tspan></text>
       </g>
       <path
          style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
@@ -400,39 +394,38 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text3862"
-           sodipodi:linespacing="125%"><tspan
+           id="text3862"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
              id="tspan3864"
-             style="font-size:6px;text-align:center;text-anchor:middle">rcu_read_unlock()</tspan></text>
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle">rcu_read_unlock()</tspan></text>
       </g>
       <text
          xml:space="preserve"
-         style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          x="56.733543"
          y="733.72308"
-         id="text3251"
-         sodipodi:linespacing="125%"><tspan
+         id="text3251"><tspan
            sodipodi:role="line"
            id="tspan3253"
            x="56.733543"
-           y="733.72308">P0()</tspan></text>
+           y="733.72308"
+           style="font-size:8px;line-height:1.25;font-family:sans-serif">P0()</tspan></text>
       <text
-         sodipodi:linespacing="125%"
          id="text3255"
          y="997.72308"
          x="186.73355"
-         style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          xml:space="preserve"><tspan
            y="997.72308"
            x="186.73355"
            id="tspan3257"
-           sodipodi:role="line">P1()</tspan></text>
+           sodipodi:role="line"
+           style="font-size:8px;line-height:1.25;font-family:sans-serif">P1()</tspan></text>
     </g>
   </g>
 </svg>
diff --git a/defer/RCUGuaranteeMid.svg b/defer/RCUGuaranteeMid.svg
index 025266b..f343632 100644
--- a/defer/RCUGuaranteeMid.svg
+++ b/defer/RCUGuaranteeMid.svg
@@ -13,7 +13,7 @@
    height="266.8678"
    id="svg2"
    version="1.1"
-   inkscape:version="0.48.4 r9939"
+   inkscape:version="0.92.3 (2405546, 2018-03-11)"
    sodipodi:docname="RCUGuaranteeMid.svg">
   <defs
      id="defs4">
@@ -166,19 +166,19 @@
      inkscape:pageopacity="0.0"
      inkscape:pageshadow="2"
      inkscape:zoom="3.4674888"
-     inkscape:cx="121.41351"
+     inkscape:cx="125.71437"
      inkscape:cy="133.4339"
      inkscape:document-units="px"
-     inkscape:current-layer="g5416"
+     inkscape:current-layer="layer1"
      showgrid="false"
      fit-margin-top="5"
      fit-margin-left="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     inkscape:window-width="937"
-     inkscape:window-height="1148"
-     inkscape:window-x="420"
-     inkscape:window-y="24"
+     inkscape:window-width="1381"
+     inkscape:window-height="1484"
+     inkscape:window-x="2445"
+     inkscape:window-y="403"
      inkscape:window-maximized="0">
     <inkscape:grid
        type="xygrid"
@@ -187,8 +187,10 @@
        visible="true"
        enabled="true"
        snapvisiblegridlinesonly="true"
-       originx="-2.6202392e-07px"
-       originy="14.377359px" />
+       originx="-2.6202392e-07"
+       originy="14.377359"
+       spacingx="1"
+       spacingy="1" />
   </sodipodi:namedview>
   <metadata
      id="metadata7">
@@ -198,7 +200,7 @@
         <dc:format>image/svg+xml</dc:format>
         <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-        <dc:title></dc:title>
+        <dc:title />
       </cc:Work>
     </rdf:RDF>
   </metadata>
@@ -237,16 +239,16 @@
            inkscape:connector-curvature="0"
            sodipodi:nodetypes="cccc" />
         <text
-           sodipodi:linespacing="125%"
            id="text5466"
            y="891.99835"
            x="44.399769"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
              id="tspan5468"
              y="891.99835"
              x="44.399769"
-             sodipodi:role="line">... this can happen</tspan></text>
+             sodipodi:role="line"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">... this can happen</tspan></text>
         <path
            style="fill:none;stroke:#000000;stroke-width:0.94868332px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
            d="M 88.499834,855.13067 98.0701,878.6298"
@@ -254,16 +256,16 @@
            inkscape:connector-curvature="0"
            sodipodi:nodetypes="cc" />
         <text
-           sodipodi:linespacing="125%"
            id="text5466-7"
            y="848.10419"
            x="47.993519"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
              id="tspan5468-2"
              y="848.10419"
              x="47.993519"
-             sodipodi:role="line">Given this ordering ...</tspan></text>
+             sodipodi:role="line"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">Given this ordering ...</tspan></text>
       </g>
     </g>
     <g
@@ -286,13 +288,12 @@
            id="rect4930"
            style="fill:#fe9696;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text4932"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="font-size:6px;text-align:center;text-anchor:middle"
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan4936"
              y="795.81049"
              x="61.421471"
@@ -311,16 +312,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text4948"
-           sodipodi:linespacing="125%"><tspan
+           id="text4948"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
-             style="text-align:center;text-anchor:middle"
-             id="tspan3066">x = 1;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+             id="tspan3066">r1 = x;</tspan></text>
       </g>
       <path
          style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
@@ -345,16 +345,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text5352"
-           sodipodi:linespacing="125%"><tspan
+           id="text5352"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
-             style="text-align:center;text-anchor:middle"
-             id="tspan3068">y = 1;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+             id="tspan3068">r2 = y;</tspan></text>
       </g>
       <g
          transform="translate(124,-36.04685)"
@@ -369,16 +368,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text5364"
-           sodipodi:linespacing="125%"><tspan
+           id="text5364"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
-             style="text-align:center;text-anchor:middle"
-             id="tspan3070">x = 2;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+             id="tspan3070">x = 1;</tspan></text>
       </g>
       <g
          transform="translate(124,8)"
@@ -392,13 +390,12 @@
            id="rect5372"
            style="fill:#fe9696;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text5374"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="font-size:6px;text-align:center;text-anchor:middle"
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan5378"
              y="795.81049"
              x="61.421471"
@@ -420,17 +417,16 @@
            id="rect5386"
            style="fill:#96c8fe;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text5388"
            y="883.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="text-align:center;text-anchor:middle"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              y="883.81049"
              x="61.421471"
              sodipodi:role="line"
-             id="tspan3072">y = 2;</tspan></text>
+             id="tspan3072">y = 1;</tspan></text>
       </g>
       <path
          style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
@@ -450,39 +446,38 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text3862"
-           sodipodi:linespacing="125%"><tspan
+           id="text3862"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
              id="tspan3864"
-             style="font-size:6px;text-align:center;text-anchor:middle">rcu_read_unlock()</tspan></text>
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle">rcu_read_unlock()</tspan></text>
       </g>
       <text
          xml:space="preserve"
-         style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          x="13.011486"
          y="784.56586"
-         id="text3259"
-         sodipodi:linespacing="125%"><tspan
+         id="text3259"><tspan
            sodipodi:role="line"
            id="tspan3261"
            x="13.011486"
-           y="784.56586">P0()</tspan></text>
+           y="784.56586"
+           style="font-size:8px;line-height:1.25;font-family:sans-serif">P0()</tspan></text>
     </g>
     <text
        xml:space="preserve"
-       style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
        x="186.02127"
        y="794.23138"
-       id="text3267"
-       sodipodi:linespacing="125%"><tspan
+       id="text3267"><tspan
          sodipodi:role="line"
          id="tspan3269"
          x="186.02127"
-         y="794.23138">P1()</tspan></text>
+         y="794.23138"
+         style="font-size:8px;line-height:1.25;font-family:sans-serif">P1()</tspan></text>
   </g>
 </svg>
diff --git a/defer/RCUGuaranteeRev.svg b/defer/RCUGuaranteeRev.svg
index cb54099..fa708ee 100644
--- a/defer/RCUGuaranteeRev.svg
+++ b/defer/RCUGuaranteeRev.svg
@@ -13,7 +13,7 @@
    height="212.83498"
    id="svg2"
    version="1.1"
-   inkscape:version="0.48.4 r9939"
+   inkscape:version="0.92.3 (2405546, 2018-03-11)"
    sodipodi:docname="RCUGuaranteeRev.svg">
   <defs
      id="defs4">
@@ -124,19 +124,19 @@
      inkscape:pageopacity="0.0"
      inkscape:pageshadow="2"
      inkscape:zoom="3.614866"
-     inkscape:cx="116.46352"
+     inkscape:cx="115.85782"
      inkscape:cy="106.41749"
      inkscape:document-units="px"
-     inkscape:current-layer="layer2"
+     inkscape:current-layer="layer1"
      showgrid="false"
      fit-margin-top="0.05"
      fit-margin-left="0.05"
      fit-margin-right="0.05"
      fit-margin-bottom="0.05"
-     inkscape:window-width="937"
+     inkscape:window-width="1438"
      inkscape:window-height="1148"
-     inkscape:window-x="420"
-     inkscape:window-y="24"
+     inkscape:window-x="2809"
+     inkscape:window-y="208"
      inkscape:window-maximized="0" />
   <metadata
      id="metadata7">
@@ -186,27 +186,27 @@
            sodipodi:nodetypes="ccc" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="-837.23907"
            y="132.1207"
            id="text5458"
-           sodipodi:linespacing="125%"
-           transform="matrix(0,-1,1,0,0,0)"><tspan
+           transform="rotate(-90)"><tspan
              sodipodi:role="line"
              x="-837.23907"
              y="132.1207"
-             id="tspan5462">this ordering.</tspan></text>
+             id="tspan5462"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">this ordering.</tspan></text>
         <text
-           sodipodi:linespacing="125%"
            id="text5466"
            y="891.99835"
            x="54.399769"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
              id="tspan5468"
              y="891.99835"
              x="54.399769"
-             sodipodi:role="line">Given this ordering ...</tspan></text>
+             sodipodi:role="line"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">Given this ordering ...</tspan></text>
         <path
            style="fill:none;stroke:#000000;stroke-width:0.94868332px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
            d="M 94.499834,879.27124 104.0701,855.77211"
@@ -214,16 +214,16 @@
            inkscape:connector-curvature="0"
            sodipodi:nodetypes="cc" />
         <text
-           sodipodi:linespacing="125%"
            id="text5466-7"
            y="848.10419"
            x="53.993519"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
              id="tspan5468-2"
              y="848.10419"
              x="53.993519"
-             sodipodi:role="line">... RCU guarantees</tspan></text>
+             sodipodi:role="line"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif">... RCU guarantees</tspan></text>
       </g>
     </g>
     <g
@@ -241,13 +241,12 @@
            id="rect4930"
            style="fill:#fe9696;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text4932"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="font-size:6px;text-align:center;text-anchor:middle"
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan4936"
              y="795.81049"
              x="61.421471"
@@ -266,16 +265,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text4948"
-           sodipodi:linespacing="125%"><tspan
+           id="text4948"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
-             style="text-align:center;text-anchor:middle"
-             id="tspan3066">x = 1;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+             id="tspan3066">r1 = x;</tspan></text>
       </g>
       <path
          style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
@@ -300,16 +298,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text5352"
-           sodipodi:linespacing="125%"><tspan
+           id="text5352"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
-             style="text-align:center;text-anchor:middle"
-             id="tspan3068">y = 1;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+             id="tspan3068">r2 = y;</tspan></text>
       </g>
       <g
          transform="translate(124,-36.04685)"
@@ -324,16 +321,15 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text5364"
-           sodipodi:linespacing="125%"><tspan
+           id="text5364"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
-             style="text-align:center;text-anchor:middle"
-             id="tspan3070">x = 2;</tspan></text>
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
+             id="tspan3070">x = 1;</tspan></text>
       </g>
       <g
          transform="translate(124,8)"
@@ -347,13 +343,12 @@
            id="rect5372"
            style="fill:#fe9696;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text5374"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="font-size:6px;text-align:center;text-anchor:middle"
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              id="tspan5378"
              y="795.81049"
              x="61.421471"
@@ -381,17 +376,16 @@
            id="rect5386"
            style="fill:#96c8fe;fill-opacity:1;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;stroke-dashoffset:0" />
         <text
-           sodipodi:linespacing="125%"
            id="text5388"
            y="795.81049"
            x="61.421471"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            xml:space="preserve"><tspan
-             style="text-align:center;text-anchor:middle"
+             style="font-size:8px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
              y="795.81049"
              x="61.421471"
              sodipodi:role="line"
-             id="tspan3072">y = 2;</tspan></text>
+             id="tspan3072">y = 1;</tspan></text>
       </g>
       <path
          style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
@@ -411,39 +405,38 @@
            transform="translate(26.663998,740.34064)" />
         <text
            xml:space="preserve"
-           style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none"
            x="61.421471"
            y="795.81049"
-           id="text3862"
-           sodipodi:linespacing="125%"><tspan
+           id="text3862"><tspan
              sodipodi:role="line"
              x="61.421471"
              y="795.81049"
              id="tspan3864"
-             style="font-size:6px;text-align:center;text-anchor:middle">rcu_read_unlock()</tspan></text>
+             style="font-size:6px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle">rcu_read_unlock()</tspan></text>
       </g>
       <text
          xml:space="preserve"
-         style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
          x="13.011486"
          y="784.56586"
-         id="text3259"
-         sodipodi:linespacing="125%"><tspan
+         id="text3259"><tspan
            sodipodi:role="line"
            id="tspan3261"
            x="13.011486"
-           y="784.56586">P0()</tspan></text>
+           y="784.56586"
+           style="font-size:8px;line-height:1.25;font-family:sans-serif">P0()</tspan></text>
     </g>
     <text
        xml:space="preserve"
-       style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;line-height:0%;font-family:sans-serif;-inkscape-font-specification:Sans;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
        x="186.02127"
        y="794.23138"
-       id="text3267"
-       sodipodi:linespacing="125%"><tspan
+       id="text3267"><tspan
          sodipodi:role="line"
          id="tspan3269"
          x="186.02127"
-         y="794.23138">P1()</tspan></text>
+         y="794.23138"
+         style="font-size:8px;line-height:1.25;font-family:sans-serif">P1()</tspan></text>
   </g>
 </svg>
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 1e8fa3b..d8ca411 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -229,21 +229,23 @@ Figure~\ref{fig:defer:RCU Reader and Later Grace Period}.
 If any portion of a given critical section precedes the beginning of
 a given grace period, then RCU guarantees that all of that critical
 section will precede the end of that grace period.
-In the figure, because \co{P0()}'s access to \co{y} precedes
-\co{P1()}'s access to this same variable, it is guaranteed that
-\co{P0()}'s access to \co{x} will precede \co{P1()}'s access.
-In this case, if \co{y}'s final value is 2, then \co{x}'s
-final value is guaranteed to also be 2.
+In the figure, \co{P0()}'s access to \co{x} precedes \co{P1()}'s access
+to this same variable, and thus also precedes the grace period generated
+by \co{P1()}'s call to \co{synchronize_rcu()}.
+It is therefore guaranteed that \co{P0()}'s access to \co{y} will precede
+\co{P1()}'s access.
+In this case, if \co{r1}'s final value is 0, then \co{r2}'s final value
+is guaranteed to also be 0.
 
 \QuickQuiz{
-	What other final values of \co{x} and \co{y} are possible in
+	What other final values of \co{r1} and \co{r2} are possible in
 	Figure~\ref{fig:defer:RCU Reader and Later Grace Period}?
 }\QuickQuizAnswer{
-	The \co{x == 2 && y == 2} possibility was called out in the text.
-	Given that \co{y == 2} implies \co{x == 2}, we know that
-	\co{x == 1 && y == 2} is forbidden.
+	The \co{r1 == 0 && r2 == 0} possibility was called out in the text.
+	Given that \co{r1 == 0} implies \co{r2 == 0}, we know that
+	\co{r1 == 0 && r2 == 1} is forbidden.
 	The following discussion will show that both
-	\co{x == 1 && y == 1} and \co{x == 2 && y == 1} are possible.
+	\co{r1 == 1 && r2 == 1} and \co{r1 == 1 && r2 == 0} are possible.
 }\QuickQuizEnd
 
 \begin{figure}[tb]
@@ -259,11 +261,23 @@ Figure~\ref{fig:defer:RCU Reader and Earlier Grace Period}.
 If any portion of a given critical section follows the end of
 a given grace period, then RCU guarantees that all of that critical
 section will follow the beginning of that grace period.
-In the figure, because \co{P0()}'s access to \co{y} follows
-\co{P1()}'s access to this same variable, it is guaranteed that
-\co{P0()}'s access to \co{x} will follow \co{P1()}'s access.
-In this case, if \co{y}'s final value is 1, then \co{x}'s
-final value is guaranteed to also be 1.
+In the figure, \co{P0()}'s access to \co{y} follows \co{P1()}'s access
+to this same variable, and thus follows the grace period generated by
+\co{P1()}'s call to \co{synchronize_rcu()}.
+It is therefore guaranteed that \co{P0()}'s access to \co{x} will follow
+\co{P1()}'s access.  In this case, if \co{r2}'s final value is 1, then
+\co{r1}'s final value is guaranteed to also be 1.
+
+\QuickQuiz{
+	What would happen if the order of \co{P0()}'s two accesses was
+	reversed in
+	\cref{fig:defer:RCU Reader and Earlier Grace Period}?
+}\QuickQuizAnswer{
+	Absolutely nothing would change.
+	The fact that \co{P0()}'s loads from \co{x} and \co{y} are
+	in the same RCU read-side critical section suffices;
+	their order is irrelevant.
+}\QuickQuizEnd
 
 \begin{figure}[tb]
 \centering
@@ -276,12 +290,13 @@ Finally, as shown in
 Figure~\ref{fig:defer:RCU Reader Within Grace Period},
 an RCU read-side critical section can be completely overlapped by
 an RCU grace period.
-In this case, \co{x}'s final value is 1 and \co{y}'s final value is 2.
+In this case, \co{r1}'s final value is 1 and \co{r2}'s final value is 0.
 
-However, it cannot be the case that \co{x}'s final value is 2 and \co{y}'s
+However, it cannot be the case that \co{r1}'s final value is 0 and \co{r2}'s
 final value is 1.
 This would mean that an RCU read-side critical section had completely
-overlapped a grace period, which is forbidden.
+overlapped a grace period, which is forbidden (or at the very least
+constitutes a bug in RCU).
 RCU's wait-for-readers guarantee therefore has two parts:
 (1)~If any part of a given RCU read-side critical section precedes
 the beginning of a given grace period, then the entirety of that
