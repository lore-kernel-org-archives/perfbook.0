Return-Path: <SRS0=dY4q=RB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=c90rlQWmr3b9pTy+mQ+YbWavRUOm2lurinSYhn5XnA4=;
        b=pXl9FiHDsAQGRI0Sk+aC2rSJGAlmhzn+LsifESZhrVvdf2TgHkAYLOGEhGBTRVnVZr
         y6Yi7ulaLFTxzTpi6wXyEzexf0fqDw/6/sS+6bzLYWoKEWwuGKt9Xs+xnJPQVMRzQIHd
         hB/o/B4z36mPt6GB1vQ3R9fmxE2EdckjZRPtRhQx7EV3/x50cEtAEToNvBYBNuxna5wf
         c12OW+dPTJLV/3bmY9o171z8ThQ4is0D8uiHegNkh7gHRNDI173OjtyVGxLRegMJctxY
         4/qmNhL9H08QBfhlpCoVLJ7OLP5LaSu633e4WVVJG0QlhxpkuVVpXUy6ewDeOMz4OXOV
         puxw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer: Retouch RCUusecases.svg by Inkscape 1.1.1
Message-ID: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
Date: Thu, 16 Dec 2021 16:59:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Some of texts in the figure are lost when rendered by Inkscape
1.1.1 on Fedora 35.
Those texts are placed far left from the viewBox of the figure
when opened in Inkscape 1.1.1.

This issue is similar to the one resolved by commit 36b07176210d
("defer: Make RCUspacetime.svg compatible with Inkscape 1.0 and
later").

Ungroup and adjust x-coordinates of those texts by Inkscape 1.1.1.

Resulting SVG is compatible with Inkscape 0.92.x on Ubuntu 18.04
and Ubuntu 20.04 as well as Inkscape >=1.0.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So I said you are safe as far as you don't rotate texts.
Apparently I was wrong!

I'm suspecting the cause of the incompatibility is likely related to
grouping of texts and doing some operation on the grouped text.

In this retouch, I did ungrouping only.  So you might need to do
proper grouping if you need further edit.

        Thanks, Akira
--
 defer/RCUusecases.svg | 1406 +++++++++++++++++++----------------------
 1 file changed, 656 insertions(+), 750 deletions(-)

diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
index aa2194a7..c6aa105b 100644
--- a/defer/RCUusecases.svg
+++ b/defer/RCUusecases.svg
@@ -2,20 +2,20 @@
 <!-- Created with Inkscape (http://www.inkscape.org/) -->
 
 <svg
-   xmlns:dc="http://purl.org/dc/elements/1.1/"
-   xmlns:cc="http://creativecommons.org/ns#"
-   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
-   xmlns:svg="http://www.w3.org/2000/svg"
-   xmlns="http://www.w3.org/2000/svg"
-   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
-   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    width="193.4453mm"
    height="275.77731mm"
    viewBox="0 0 193.44529 275.77732"
    version="1.1"
    id="svg8"
-   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
-   sodipodi:docname="RCUusecases.svg">
+   inkscape:version="1.1.1 (3bf5ae0d25, 2021-09-20)"
+   sodipodi:docname="RCUusecases.svg"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:dc="http://purl.org/dc/elements/1.1/">
   <defs
      id="defs2">
     <marker
@@ -656,9 +656,9 @@
      borderopacity="1.0"
      inkscape:pageopacity="0.0"
      inkscape:pageshadow="2"
-     inkscape:zoom="1.6285163"
-     inkscape:cx="375.49516"
-     inkscape:cy="455.0154"
+     inkscape:zoom="1.1515349"
+     inkscape:cx="186.27312"
+     inkscape:cy="603.10808"
      inkscape:document-units="mm"
      inkscape:current-layer="layer1"
      showgrid="true"
@@ -666,10 +666,10 @@
      fit-margin-left="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     inkscape:window-width="3786"
-     inkscape:window-height="2096"
-     inkscape:window-x="54"
-     inkscape:window-y="27"
+     inkscape:window-width="1920"
+     inkscape:window-height="1003"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
      inkscape:window-maximized="1"
      inkscape:pagecheckerboard="0">
     <inkscape:grid
@@ -700,447 +700,383 @@
        id="path4922-0-2"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="cc" />
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016"
+       width="61.594925"
+       height="30.427073"
+       x="75.406258"
+       y="80.537178"
+       ry="0" />
     <g
-       id="g27880"
-       transform="translate(-18.520839,-28.045845)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016"
-         width="61.594925"
-         height="30.427073"
-         x="93.927094"
-         y="108.58302"
-         ry="0" />
-      <g
-         id="g31594-5"
-         transform="rotate(90,75.270696,111.7621)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3"
-           y="-79.621559"
-           x="-77.026497"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-77.026497"
-             x="-79.621559"
-             sodipodi:role="line"
-             id="tspan31224">Publish/Subscribe</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="96.812454"
-         y="130.0853"
-         id="text3777-5-7-8-9"><tspan
-           sodipodi:role="line"
-           x="96.812454"
-           y="130.0853"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458299"
-           id="tspan109-7"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
-             id="tspan110710">rcu_assign_pointer()</tspan><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans'"
-             id="tspan115146"> &amp;</tspan></tspan></text>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="m 155.52139,123.39969 -62.177093,0.26458"
-         id="path4922-0-2-6"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
+       id="g31594-5"
+       transform="rotate(90,78.974867,87.420426)">
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="105.17783"
-         y="119.96007"
-         id="text36678"><tspan
+         transform="scale(-1)"
+         id="text31542-1-3"
+         y="-77.026497"
+         x="-77.026497"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.026497"
+           x="-77.026497"
            sodipodi:role="line"
-           id="tspan36676"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="105.17783"
-           y="119.96007">For Linked Structure</tspan></text>
+           id="tspan31224">Publish/Subscribe</tspan></text>
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="102.9454"
-         y="135.88304"
-         id="text43750"><tspan
-           sodipodi:role="line"
-           id="tspan43748"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';stroke-width:0.26458299"
-           x="102.9454"
-           y="135.88304">rcu_dereference()</tspan></text>
+         transform="scale(-1)"
+         id="text31542-1-4-6"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="78.291618"
+       y="102.03945"
+       id="text3777-5-7-8-9"><tspan
+         sodipodi:role="line"
+         x="78.291618"
+         y="102.03945"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
+           id="tspan110710">rcu_assign_pointer()</tspan><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans'"
+           id="tspan115146"> &amp;</tspan></tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="m 137.00055,95.353845 -62.177092,0.26458"
+       id="path4922-0-2-6"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="86.656998"
+       y="91.914223"
+       id="text36678"><tspan
+         sodipodi:role="line"
+         id="tspan36676"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="86.656998"
+         y="91.914223">For Linked Structure</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="84.424561"
+       y="107.8372"
+       id="text43750"><tspan
+         sodipodi:role="line"
+         id="tspan43748"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';stroke-width:0.264583"
+         x="84.424561"
+         y="107.8372">rcu_dereference()</tspan></text>
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-6"
+       width="91.28125"
+       height="26.458336"
+       x="159.01459"
+       y="111.758" />
     <g
-       id="g27880-0"
-       transform="translate(69.056247,-2.6458334)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-6"
-         width="91.28125"
-         height="26.458336"
-         x="89.958336"
-         y="114.40383" />
-      <g
-         id="g31594-5-2"
-         transform="rotate(90,68.638211,112.00874)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-6"
-           y="-79.621559"
-           x="-77.026497"
-           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-           xml:space="preserve"><tspan
-             id="tspan31568-5-1"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-             y="-77.026497"
-             x="-79.621559"
-             sodipodi:role="line">Wait for Pre-Existing Things to Finish</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-8"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-7"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-             y="-81.724838"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
+       id="g31594-5-2"
+       transform="rotate(90,103.43093,144.15563)">
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="92.469849"
-         y="131.68869"
-         id="text3777-5-7-8-9-9"><tspan
-           sodipodi:role="line"
-           x="92.469849"
-           y="131.68869"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-           id="tspan109-7-2"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
-             id="tspan68822">rcu_read_lock()</tspan><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans'"
-             id="tspan95370"> &amp; </tspan><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
-             id="tspan101786">rcu_read_unlock()</tspan></tspan></text>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 181.23959,125.25174 H 89.958333"
-         id="path4922-0-2-6-0"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
+         transform="scale(-1)"
+         id="text31542-1-3-6"
+         y="-77.026497"
+         x="-77.026497"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve"><tspan
+           id="tspan31568-5-1"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.026497"
+           x="-77.026497"
+           sodipodi:role="line">Wait for Pre-Existing Things to Finish</tspan></text>
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="110.59689"
-         y="137.24484"
-         id="text3777-5-7-8-9-9-5"><tspan
-           sodipodi:role="line"
-           x="110.59689"
-           y="137.24484"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-           id="tspan109-7-2-0">vs. <tspan
+         transform="scale(-1)"
+         id="text31542-1-4-6-8"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="161.52609"
+       y="129.04286"
+       id="text3777-5-7-8-9-9"><tspan
+         sodipodi:role="line"
+         x="161.52609"
+         y="129.04286"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7-2"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
+           id="tspan68822">rcu_read_lock()</tspan><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans'"
+           id="tspan95370"> &amp; </tspan><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
+           id="tspan101786">rcu_read_unlock()</tspan></tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 250.29584,122.60591 H 159.01458"
+       id="path4922-0-2-6-0"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="179.65314"
+       y="134.59901"
+       id="text3777-5-7-8-9-9-5"><tspan
+         sodipodi:role="line"
+         x="179.65314"
+         y="134.59901"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7-2-0">vs. <tspan
    style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
    id="tspan87226">synchronize_rcu()</tspan></tspan></text>
-    </g>
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-2"
+       width="62.177082"
+       height="19.843758"
+       x="173.30209"
+       y="80.008011"
+       ry="0" />
     <g
-       id="g27880-00"
-       transform="translate(79.957155,-40.481239)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-2"
-         width="62.177082"
-         height="19.843758"
-         x="93.344933"
-         y="120.48925"
-         ry="0" />
-      <g
-         id="g31594-5-26"
-         transform="rotate(90,67.414131,115.84943)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-9"
-           y="-79.621559"
-           x="-77.555664"
-           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-             y="-77.555664"
-             x="-79.621559"
-             sodipodi:role="line"
-             id="tspan31224-0">Phased State Change</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-3"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-5"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-             y="-81.724838"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
+       id="g31594-5-26"
+       transform="rotate(90,127.10417,135.05823)">
       <text
-         xml:space="preserve"
-         style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="95.447845"
-         y="137.26306"
-         id="text3777-5-7-8-9-5"><tspan
-           sodipodi:role="line"
-           x="95.447845"
-           y="137.26306"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-           id="tspan109-7-8">+ Checked state variable</tspan></text>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 155.52202,131.07258 H 93.344936"
-         id="path4922-0-2-6-7"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="111.75105"
-         y="121.54755"
-         id="text36678-0"><tspan
+         transform="scale(-1)"
+         id="text31542-1-3-9"
+         y="-77.555664"
+         x="-77.555664"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.555664"
+           x="-77.555664"
            sodipodi:role="line"
-           id="tspan36676-6"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="111.75105"
-           y="121.54755" /></text>
+           id="tspan31224-0">Phased State Change</tspan></text>
       <text
-         xml:space="preserve"
-         style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="109.90517"
-         y="135.88304"
-         id="text43750-0"><tspan
-           sodipodi:role="line"
-           id="tspan43748-4"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';stroke-width:0.264583"
-           x="109.90517"
-           y="135.88304" /></text>
+         transform="scale(-1)"
+         id="text31542-1-4-6-3"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <text
+       xml:space="preserve"
+       style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="175.405"
+       y="96.781822"
+       id="text3777-5-7-8-9-5"><tspan
+         sodipodi:role="line"
+         x="175.405"
+         y="96.781822"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7-8">+ Checked state variable</tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 235.47917,90.591341 H 173.30209"
+       id="path4922-0-2-6-7"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="191.70821"
+       y="81.066307"
+       id="text36678-0" />
+    <text
+       xml:space="preserve"
+       style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="189.86232"
+       y="95.401802"
+       id="text43750-0" />
     <path
        style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1)"
        d="M 204.66097,111.75793 V 100.75878"
        id="path4922-0-2-7-4"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="cc" />
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-2-4"
+       width="23.8125"
+       height="14.552083"
+       x="136.78958"
+       y="80.537178"
+       ry="0" />
     <g
-       id="g27880-00-5"
-       transform="translate(29.950911,-29.368729)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-2-4"
-         width="23.8125"
-         height="14.552083"
-         x="106.83868"
-         y="109.90591"
-         ry="0" />
-      <g
-         id="g31594-5-26-8"
-         transform="rotate(90,75.732154,113.8111)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-9-7"
-           y="-79.621559"
-           x="-77.555664"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-77.555664"
-             x="-79.621559"
-             sodipodi:role="line"
-             id="tspan31224-0-3">Add-Only</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-3-3"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-5-5"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
+       id="g31594-5-26-8"
+       transform="rotate(90,104.86281,113.57303)">
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="115.29295"
-         y="121.54755"
-         id="text36678-0-7"><tspan
+         transform="scale(-1)"
+         id="text31542-1-3-9-7"
+         y="-77.555664"
+         x="-77.555664"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.555664"
+           x="-77.555664"
            sodipodi:role="line"
-           id="tspan36676-6-0"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="115.29295"
-           y="121.54755">List</tspan></text>
+           id="tspan31224-0-3">Add-Only</tspan></text>
+      <text
+         transform="scale(-1)"
+         id="text31542-1-4-6-3-3"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="145.24387"
+       y="92.178818"
+       id="text36678-0-7"><tspan
+         sodipodi:role="line"
+         id="tspan36676-6-0"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="145.24387"
+         y="92.178818">List</tspan></text>
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-4"
+       width="62.177074"
+       height="23.81249"
+       x="109.00833"
+       y="48.258003"
+       ry="0" />
     <g
-       id="g27880-9"
-       transform="translate(15.663392,-66.939605)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-4"
-         width="62.177074"
-         height="23.81249"
-         x="93.34494"
-         y="115.19761"
-         ry="0" />
-      <g
-         id="g31594-5-6"
-         transform="rotate(90,71.645102,114.48646)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-4"
-           y="-79.621559"
-           x="-77.026497"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-77.026497"
-             x="-79.621559"
-             sodipodi:role="line"
-             id="tspan31224-5">Type-Safe Memory</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-5"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-56"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="m 155.52139,123.92886 -62.177093,0.26458"
-         id="path4922-0-2-6-9"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
+       id="g31594-5-6"
+       transform="rotate(90,112.15286,88.054604)">
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="96.953011"
-         y="135.88304"
-         id="text43750-9"><tspan
+         transform="scale(-1)"
+         id="text31542-1-3-4"
+         y="-77.026497"
+         x="-77.026497"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.026497"
+           x="-77.026497"
            sodipodi:role="line"
-           id="tspan43748-6"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="96.953011"
-           y="135.88304">+ Deferred slab reclamation</tspan></text>
+           id="tspan31224-5">Type-Safe Memory</tspan></text>
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="96.953011"
-         y="130.8455"
-         id="text3777-5-7-8-9-0-5"><tspan
-           sodipodi:role="line"
-           x="96.953011"
-           y="130.8455"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458299"
-           id="tspan109-7-6-5">+ Slab allocator</tspan></text>
+         transform="scale(-1)"
+         id="text31542-1-4-6-5"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="m 171.18478,56.989255 -62.17709,0.26458"
+       id="path4922-0-2-6-9"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="112.6164"
+       y="68.943436"
+       id="text43750-9"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="112.6164"
+         y="68.943436">+ Deferred slab reclamation</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="112.6164"
+       y="63.905899"
+       id="text3777-5-7-8-9-0-5"><tspan
+         sodipodi:role="line"
+         x="112.6164"
+         y="63.905899"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7-6-5">+ Slab allocator</tspan></text>
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-4-9"
+       width="51.593758"
+       height="29.104166"
+       x="198.70207"
+       y="42.966328"
+       ry="0" />
     <g
-       id="g27880-9-3"
-       transform="translate(105.35714,-66.939609)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-4-9"
-         width="51.593758"
-         height="29.104166"
-         x="93.344933"
-         y="109.90594"
-         ry="0" />
-      <g
-         id="g31594-5-6-0"
-         transform="rotate(90,73.858407,111.40813)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-4-4"
-           y="-85.971565"
-           x="-77.026497"
-           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-             y="-77.026497"
-             x="-85.971565"
-             sodipodi:role="line"
-             id="tspan31224-5-3">Existence Guarantee</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-5-3"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-56-4"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-             y="-81.724838"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
+       id="g31594-5-6-0"
+       transform="rotate(90,155.7735,126.38362)">
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="96.812454"
-         y="125.32281"
-         id="text3777-5-7-8-9-0-2"><tspan
-           sodipodi:role="line"
-           x="96.812454"
-           y="125.32281"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-           id="tspan109-7-6-4">+ Linked structure</tspan></text>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 144.93869,119.16635 93.344297,118.90174"
-         id="path4922-0-2-6-9-5"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="96.953011"
-         y="135.88304"
-         id="text43750-9-3"><tspan
+         transform="scale(-1)"
+         id="text31542-1-3-4-4"
+         y="-77.026497"
+         x="-77.026497"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve"><tspan
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.026497"
+           x="-77.026497"
            sodipodi:role="line"
-           id="tspan43748-6-8"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="96.953011"
-           y="135.88304">+ Deferred reclamation</tspan></text>
+           id="tspan31224-5-3">Existence Guarantee</tspan></text>
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="96.953011"
-         y="130.8455"
-         id="text3777-5-7-8-9-0-5-1"><tspan
-           sodipodi:role="line"
-           x="96.953011"
-           y="130.8455"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-           id="tspan109-7-6-5-1">+ Heap allocator</tspan></text>
+         transform="scale(-1)"
+         id="text31542-1-4-6-5-3"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="202.1696"
+       y="58.383198"
+       id="text3777-5-7-8-9-0-2"><tspan
+         sodipodi:role="line"
+         x="202.1696"
+         y="58.383198"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7-6-4">+ Linked structure</tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="m 250.29583,52.226741 -51.59439,-0.26461"
+       id="path4922-0-2-6-9-5"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="202.31015"
+       y="68.943436"
+       id="text43750-9-3"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-8"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="202.31015"
+         y="68.943436">+ Deferred reclamation</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:sans-serif;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="202.31015"
+       y="63.905895"
+       id="text3777-5-7-8-9-0-5-1"><tspan
+         sodipodi:role="line"
+         x="202.31015"
+         y="63.905895"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
+         id="tspan109-7-6-5-1">+ Heap allocator</tspan></text>
     <path
        style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-36)"
        d="M 90.487464,80.536931 V 6.4535972 H 187.85418 V 62.016097 h 10.05416"
@@ -1159,139 +1095,121 @@
        id="path4922-0-2-7-4-2-2"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="cc" />
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-2-4-9"
+       width="39.6875"
+       height="18.520834"
+       x="211.66669"
+       y="10.422347"
+       ry="0" />
     <g
-       id="g10761"
-       transform="translate(-8.4666671,-1.5875911)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-2-4-9"
-         width="39.6875"
-         height="18.520834"
-         x="220.13335"
-         y="12.009938"
-         ry="0" />
-      <g
-         id="g31594-5-26-8-3"
-         transform="rotate(90,183.39005,122.25034)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-9-7-6"
-           y="-83.553368"
-           x="-77.555664"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-77.555664"
-             x="-83.553368"
-             sodipodi:role="line"
-             id="tspan31224-0-3-0">Delete-Only List</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-3-3-6"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-5-5-2"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
+       id="g31594-5-26-8-3"
+       transform="rotate(90,177.30471,114.57741)">
       <text
-         transform="rotate(-90)"
-         id="text31542-1-3-9-7-6-3"
-         y="222.24622"
-         x="-26.630951"
-         style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
+         transform="scale(-1)"
+         id="text31542-1-3-9-7-6"
+         y="-77.555664"
+         x="-77.555664"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-           y="-27.160118"
-           x="222.77538"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.555664"
+           x="-77.555664"
            sodipodi:role="line"
-           id="tspan31224-0-3-0-6">- Publish/subscribe</tspan></text>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.60000001, 0.60000001;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 259.82084,21.799522 220.1327,21.534912"
-         id="path4922-0-2-6-9-5-7"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
+           id="tspan31224-0-3-0">Delete-Only List</tspan></text>
+      <text
+         transform="scale(-1)"
+         id="text31542-1-4-6-3-3-6"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <text
+       transform="rotate(-90)"
+       id="text31542-1-3-9-7-6-3"
+       y="213.60962"
+       x="-25.04336"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       xml:space="preserve"><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+         y="-25.572527"
+         x="214.13878"
+         sodipodi:role="line"
+         id="tspan31224-0-3-0-6">- Publish/subscribe</tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="m 251.35417,20.211931 -39.68814,-0.26461"
+       id="path4922-0-2-6-9-5-7"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
     <path
        style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-9-7)"
        d="m 231.56336,42.852925 -0.053,-12.322008"
        id="path4922-0-2-7-4-3-87"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="cc" />
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-4-2"
+       width="78.052078"
+       height="25.13542"
+       x="100.80624"
+       y="15.71431"
+       ry="0" />
     <g
-       id="g27880-9-9"
-       transform="translate(6.4029491,-98.425049)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.40000001;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-4-2"
-         width="78.052078"
-         height="25.13542"
-         x="94.40329"
-         y="114.13936"
-         ry="0" />
-      <g
-         id="g31594-5-6-02"
-         transform="rotate(90,68.833929,111.14612)">
-        <text
-           transform="scale(-1)"
-           id="text31542-1-3-4-3"
-           y="-79.621559"
-           x="-77.026497"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-77.026497"
-             x="-79.621559"
-             sodipodi:role="line"
-             id="tspan19157">Light-Weight Garbage Collector for</tspan></text>
-        <text
-           transform="scale(-1)"
-           id="text31542-1-4-6-5-5"
-           y="-80.102051"
-           x="-81.724838"
-           style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-           xml:space="preserve"><tspan
-             id="tspan31568-2-2-56-9"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line" /></text>
-      </g>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 172.19078,129.74983 H 94.138692"
-         id="path4922-0-2-6-9-9"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
+       id="g31594-5-6-02"
+       transform="rotate(90,120.18961,64.076738)">
       <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="97.482178"
-         y="135.88304"
-         id="text43750-9-7"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="97.482178"
-           y="135.88304">+ NBS</tspan></text>
-      <text
-         transform="rotate(-90)"
-         id="text31542-1-3-4-3-9"
-         y="98.535355"
-         x="-124.63039"
-         style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
+         transform="scale(-1)"
+         id="text31542-1-3-4-3"
+         y="-77.026497"
+         x="-77.026497"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-           y="-124.63039"
-           x="98.535355"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.026497"
+           x="-77.026497"
            sodipodi:role="line"
-           id="tspan19157-3">Non-Blocking Synchronization (NBS)</tspan></text>
+           id="tspan19157">Light-Weight Garbage Collector for</tspan></text>
+      <text
+         transform="scale(-1)"
+         id="text31542-1-4-6-5-5"
+         y="-80.102051"
+         x="-81.724838"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         xml:space="preserve" />
     </g>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 178.59373,31.324781 H 100.54164"
+       id="path4922-0-2-6-9-9"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="103.88512"
+       y="37.457993"
+       id="text43750-9-7"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="103.88512"
+         y="37.457993">+ NBS</tspan></text>
+    <text
+       transform="rotate(-90)"
+       id="text31542-1-3-4-3-9"
+       y="105.61021"
+       x="-26.205338"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       xml:space="preserve"><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+         y="-26.734505"
+         x="106.13937"
+         sodipodi:role="line"
+         id="tspan19157-3">Non-Blocking Synchronization (NBS)</tspan></text>
     <path
        style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-9-7-1)"
        d="M 140.75825,48.522348 V 41.907765"
@@ -1304,233 +1222,221 @@
        id="path4922-0-2-7-4-3-87-4-4"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="ccc" />
-    <g
-       id="g27880-9-9-5"
-       transform="translate(33.65503,-144.99192)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-4-2-0"
-         width="123.03125"
-         height="35.71875"
-         x="77.469978"
-         y="103.29159"
-         ry="0" />
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 200.50123,112.552 H 77.469975"
-         id="path4922-0-2-6-9-9-3"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="118.45444"
-         id="text43750-9-7-2"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="118.45444">+ Readers include some sort of snapshot operation</tspan></text>
-      <text
-         transform="rotate(-90)"
-         id="text31542-1-3-4-3-9-6"
-         y="98.535355"
-         x="-108.75541"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-           y="-108.75541"
-           x="98.535355"
-           sodipodi:role="line"
-           id="tspan19157-3-1">Quasi Multi-Version Consistency Control</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="123.91718"
-         id="text43750-9-7-2-9"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="123.91718">+ Constraints on readers and writers:</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="129.20895"
-         id="text43750-9-7-2-9-7"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-4"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="129.20895"><tspan
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-4-2-0"
+       width="123.03125"
+       height="35.71875"
+       x="111.12501"
+       y="-41.700333"
+       ry="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 234.15626,-32.43992 H 111.12501"
+       id="path4922-0-2-6-9-9-3"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-26.537483"
+       id="text43750-9-7-2"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-26.537483">+ Readers include some sort of snapshot operation</tspan></text>
+    <text
+       transform="rotate(-90)"
+       id="text31542-1-3-4-3-9-6"
+       y="134.97878"
+       x="36.236511"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       xml:space="preserve"><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+         y="36.765678"
+         x="134.44962"
+         sodipodi:role="line"
+         id="tspan19157-3-1">Quasi Multi-Version Consistency Control</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-21.074738"
+       id="text43750-9-7-2-9"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-21.074738">+ Constraints on readers and writers:</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-15.782967"
+       id="text43750-9-7-2-9-7"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-4"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-15.782967"><tspan
    style="fill:#ffffff;fill-opacity:1"
    id="tspan60832">+</tspan> (1) single object, (2) sequence locks, (3) version number(s),</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="134.6799"
-         id="text43750-9-7-2-9-7-2"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-4-7"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="134.6799"><tspan
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-10.312019"
+       id="text43750-9-7-2-9-7-2"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-4-7"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-10.312019"><tspan
    style="fill:#ffffff;fill-opacity:1"
    id="tspan60832-4">+</tspan> (4) Issaquah challenge, and/or (5) many other approaches</tspan></text>
-    </g>
     <path
        style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6)"
        d="M 257.93434,-27.81547 H 235.44468"
        id="path4922-0-2-7-6"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="cc" />
-    <g
-       id="g27880-9-9-5-3"
-       transform="translate(33.65503,-179.91689)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-4-2-0-7"
-         width="123.03125"
-         height="23.8125"
-         x="77.469978"
-         y="103.29159"
-         ry="0" />
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 200.50123,112.552 H 77.469975"
-         id="path4922-0-2-6-9-9-3-3"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="118.45444"
-         id="text43750-9-7-2-4"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-7"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="118.45444">+ Readers as individual or bulk unconditional references</tspan></text>
-      <text
-         transform="rotate(-90)"
-         id="text31542-1-3-4-3-9-6-2"
-         y="116.7813"
-         x="-108.75541"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-           y="-108.75541"
-           x="116.7813"
-           sodipodi:role="line"
-           id="tspan19157-3-1-1">Quasi Reference Count</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="123.91718"
-         id="text43750-9-7-2-9-79"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-5"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="123.91718">+ Optional bridging to per-object lock or reference</tspan></text>
-    </g>
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-4-2-0-7"
+       width="123.03125"
+       height="23.8125"
+       x="111.12501"
+       y="-76.625305"
+       ry="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 234.15626,-67.36489 H 111.12501"
+       id="path4922-0-2-6-9-9-3-3"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-61.462452"
+       id="text43750-9-7-2-4"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-7"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-61.462452">+ Readers as individual or bulk unconditional references</tspan></text>
+    <text
+       transform="rotate(-90)"
+       id="text31542-1-3-4-3-9-6-2"
+       y="149.79524"
+       x="71.161484"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       xml:space="preserve"><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+         y="70.632317"
+         x="150.3244"
+         sodipodi:role="line"
+         id="tspan19157-3-1-1">Quasi Reference Count</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-55.999706"
+       id="text43750-9-7-2-9-79"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-5"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-55.999706">+ Optional bridging to per-object lock or reference</tspan></text>
     <path
        style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6-6)"
        d="M 257.93479,-63.005074 H 235.44513"
        id="path4922-0-2-7-6-7"
        inkscape:connector-curvature="0"
        sodipodi:nodetypes="cc" />
-    <g
-       id="g27880-9-9-5-3-0"
-       transform="translate(33.65503,-230.45257)">
-      <rect
-         style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
-         id="rect12016-4-2-0-7-9"
-         width="123.03125"
-         height="39.158566"
-         x="77.469978"
-         y="103.29159"
-         ry="0" />
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 200.50123,112.552 H 77.469975"
-         id="path4922-0-2-6-9-9-3-3-3"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="118.45444"
-         id="text43750-9-7-2-4-6"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-7-0"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="118.45444">+ Readers as read-held reader-writer lock</tspan></text>
-      <text
-         transform="rotate(-90)"
-         id="text31542-1-3-4-3-9-6-2-6"
-         y="116.7813"
-         x="-108.75541"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-           y="-108.75541"
-           x="116.7813"
-           sodipodi:role="line"
-           id="tspan19157-3-1-1-2">Quasi Reader-Writer Lock</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="123.91718"
-         id="text43750-9-7-2-9-79-6"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-5-1"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="123.91718">+ Spatial as well as temporal synchronization</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="128.9444"
-         id="text43750-9-7-2-9-79-6-3"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-5-1-6"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="128.9444">+ Optional read-to-write upgrade</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="133.97195"
-         id="text43750-9-7-2-9-79-7"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-5-5"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="133.97195">+ Optional bridging to per-object lock or reference</tspan></text>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="80.629829"
-         y="139.52917"
-         id="text43750-9-7-2-9-79-7-3"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6-3-0-3-5-5-5"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="80.629829"
-           y="139.52917">+ Optionally ignore deleted objects</tspan></text>
-    </g>
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.4;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       id="rect12016-4-2-0-7-9"
+       width="123.03125"
+       height="39.158566"
+       x="111.12501"
+       y="-127.16098"
+       ry="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 234.15626,-117.90057 H 111.12501"
+       id="path4922-0-2-6-9-9-3-3-3"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-111.99813"
+       id="text43750-9-7-2-4-6"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-7-0"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-111.99813">+ Readers as read-held reader-writer lock</tspan></text>
+    <text
+       transform="rotate(-90)"
+       id="text31542-1-3-4-3-9-6-2-6"
+       y="147.14944"
+       x="121.69716"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       xml:space="preserve"><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+         y="122.22633"
+         x="146.62029"
+         sodipodi:role="line"
+         id="tspan19157-3-1-1-2">Quasi Reader-Writer Lock</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-106.53539"
+       id="text43750-9-7-2-9-79-6"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-5-1"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-106.53539">+ Spatial as well as temporal synchronization</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-101.50817"
+       id="text43750-9-7-2-9-79-6-3"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-5-1-6"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-101.50817">+ Optional read-to-write upgrade</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-96.480614"
+       id="text43750-9-7-2-9-79-7"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-5-5"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-96.480614">+ Optional bridging to per-object lock or reference</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="114.28486"
+       y="-90.923393"
+       id="text43750-9-7-2-9-79-7-3"><tspan
+         sodipodi:role="line"
+         id="tspan43748-6-3-0-3-5-5-5"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
+         x="114.28486"
+         y="-90.923393">+ Optionally ignore deleted objects</tspan></text>
     <path
        style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6-6-3)"
        d="M 257.96876,-113.13783 H 235.47917"

base-commit: 213c37c8f56de2df1bcfe6238c19c8c4590988cd
-- 
2.17.1

