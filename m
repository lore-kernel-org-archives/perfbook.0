Return-Path: <SRS0=nTFx=CA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686562610; x=1689154610;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr8yKJ++BfjB7KFUUYcAWapmO80vE+EMQ6dA8MHVLF8=;
        b=Opu379IWiOk4l7eu9f0jKpE+t72QMeadBNAG/rlOQtayvXZbslNbJ8yfSD2uDR80tv
         fgxj+hkhOY05Lr8o9Criaz95G0DD00X3e2lI8hUxLISMtTn7+yZOssFY+QYIu7dUIA8h
         08rfEgVs5xb2MlXzdU3PZ75ObvjeZw+BI/S7ueTa1G/+e2dCrZ/SljLbjUF+WVP9dcV7
         1nXP62avp9hAWvfqMe7p40Q5LkZsXpLyUlSVpKxoxGabPgKLF5MyQ9xwHGnNI+bchL6f
         S1VcPPBJQ0R4cih39Uuowct2osvQR124EbmiOuyv5MzE9zEMxwSuYspdDK1KpblJOKDm
         rKsQ==
Message-ID: <4ab19efc-4940-c1f9-71cf-221cb048e86e@gmail.com>
Date: Mon, 12 Jun 2023 18:36:46 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] memorder: Tweak Figure 15.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

While the caption says "Intel Core 2 Architecture Simplified",
it doesn't look simpler than Figure 15.1.

To make it look simpler, raise blue shapes one level up and reduce
their color saturation, with 75% opacity so that blocks underneath
can be related to Figure 15.1.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/Intel_Core2_arch-simplified.svg | 46 ++++++++++++------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/memorder/Intel_Core2_arch-simplified.svg b/memorder/Intel_Core2_arch-simplified.svg
index d039b4073260..f8fbe6151bd0 100644
--- a/memorder/Intel_Core2_arch-simplified.svg
+++ b/memorder/Intel_Core2_arch-simplified.svg
@@ -6,7 +6,7 @@
    height="767.08295"
    id="svg2"
    sodipodi:version="0.32"
-   inkscape:version="1.1 (c4e8f9e, 2021-05-24)"
+   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
    version="1.0"
    sodipodi:docname="Intel_Core2_arch-simplified.svg"
    inkscape:output_extension="org.inkscape.output.svg.inkscape"
@@ -36,10 +36,10 @@
      height="1218.19px"
      showgrid="true"
      gridtolerance="50"
-     inkscape:window-width="1848"
-     inkscape:window-height="1016"
-     inkscape:window-x="72"
-     inkscape:window-y="27"
+     inkscape:window-width="1846"
+     inkscape:window-height="1009"
+     inkscape:window-x="74"
+     inkscape:window-y="34"
      inkscape:grid-bbox="false"
      inkscape:pagecheckerboard="0"
      fit-margin-left="5"
@@ -65,20 +65,6 @@
      transform="translate(489.76607,-564.11796)">
     <g
        id="g4965">
-      <path
-         style="fill:#65c8ff;fill-opacity:1;stroke:#000000;stroke-width:1.875;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:7.5, 1.875;stroke-dashoffset:0;stroke-opacity:1"
-         d="m 992.40255,589.98515 0.90561,324.52221 -333.99151,1.33114 0.97009,139.1328 -252.28674,0.093 -3.73844,222.5678 -888.40106,-1.0985 1.1525,-687.18452 z"
-         id="path324-2-3"
-         sodipodi:nodetypes="ccccccccc" />
-      <path
-         style="fill:#65c8ff;fill-opacity:1;stroke:#000000;stroke-width:1.875;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:7.5, 1.875;stroke-dashoffset:0;stroke-opacity:1"
-         d="m 678.09335,925.71626 313.33981,0.0411 -0.0182,139.35354 -319.16745,-0.042 0.0183,-139.35359 z"
-         id="path324" />
-      <path
-         style="fill:#65c8ff;fill-opacity:1;stroke:#000000;stroke-width:1.875;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:7.5, 1.875;stroke-dashoffset:0;stroke-opacity:1"
-         d="m 480.5,1082.281 551.2159,0.368 -3.1393,-460.92849 212.9109,-0.12069 0.3378,375.89964 -165.555,2.36644 -1.0185,156.774 -600.47901,0.9166 -0.10013,-75.2765 z"
-         id="path324-2"
-         sodipodi:nodetypes="cccccccccc" />
       <g
          id="g1108"
          transform="matrix(1,0,0,-1,10.579716,2239.533)">
@@ -1508,9 +1494,23 @@
          d="m -156.20711,1206.1684 0.0815,45.7196 215.825029,-1.5736 L 58.547005,607.74341 386,608.18896"
          style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
          sodipodi:nodetypes="ccccc" />
+      <path
+         style="fill:#a0d6f4;fill-opacity:1;stroke:#000000;stroke-width:1.875;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:7.5, 1.875;stroke-dashoffset:0;stroke-opacity:1;opacity:0.75"
+         d="m 992.40255,589.98515 0.90561,324.52221 -333.99151,1.33114 0.97009,139.1328 -252.28674,0.093 -3.73844,222.5678 -888.40106,-1.0985 1.1525,-687.18452 z"
+         id="path324-2-3"
+         sodipodi:nodetypes="ccccccccc" />
+      <path
+         style="fill:#a0d6f4;fill-opacity:1;stroke:#000000;stroke-width:1.875;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:7.5, 1.875;stroke-dashoffset:0;stroke-opacity:1;opacity:0.75"
+         d="m 678.09335,925.71626 313.33981,0.0411 -0.0182,139.35354 -319.16745,-0.042 0.0183,-139.35359 z"
+         id="path324" />
+      <path
+         style="opacity:0.75;fill:#a0d6f4;fill-opacity:1;stroke:#000000;stroke-width:1.875;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:7.5, 1.875;stroke-dashoffset:0;stroke-opacity:1"
+         d="m 480.5,1089.781 551.2159,0.368 -3.1393,-460.92848 212.9109,-0.12069 0.3378,375.89967 -165.555,2.3664 -1.0185,156.774 -600.47901,0.9166 -0.10013,-75.2765 z"
+         id="path324-2"
+         sodipodi:nodetypes="cccccccccc" />
       <g
          id="g33478"
-         transform="rotate(-20,895.09396,985.88918)">
+         transform="rotate(-20,862.24039,1039.8288)">
         <rect
            style="fill:#65c8ff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
            id="rect30190"
@@ -1532,7 +1532,9 @@
       </g>
       <g
          id="g33478-5"
-         transform="rotate(-90,977.84316,899.71489)">
+         transform="matrix(1.1131446,-0.45901397,0.45901397,1.1131446,-244.30505,158.60727)"
+         inkscape:transform-center-y="7.7629834"
+         inkscape:transform-center-x="-7.325063">
         <rect
            style="fill:#65c8ff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
            id="rect30190-6"
@@ -1554,7 +1556,7 @@
       </g>
       <g
          id="g33478-5-7"
-         transform="rotate(-45,559.57844,1846.5947)">
+         transform="rotate(-45,624.50026,1710.9171)">
         <rect
            style="fill:#65c8ff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
            id="rect30190-6-9"

base-commit: 20d1c20018dbc94127f8b12e8e9c8fbf9c2520bc
-- 
2.25.1

