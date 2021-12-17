Return-Path: <SRS0=286c=RC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=lQP9Oip5K+1gyBJscUnliiA03UF6xQeIpsKja2ggI3o=;
        b=mcXHPO3frwQp+/lmGp+g/yqSlgE6EXz3LwXDC2NGRis2TkjLt0gMSh5Vmdh2mGl/tD
         xqeoiAlw4HJsfuG9L/4fCnlQa0DvdTBnO6x/TNw4z1E2BQi3l4Pfrtmm7rCQug6cow+Q
         gsuyMmlEd4EWgJnydWiaePg0Jhg1v4QkJaB+CYA7tzzu1gT+RZq9taUVKnyX7JpvNqd/
         bm9qOaMVd+8Ou1sImQm3ZsWnHxcpeCmeto6QMReAKNdETS9l0VaPAQ5n4EytlTrYZoqZ
         kM8KOqzoI55gjXitGayeyNgvXhaz6/VPhaMpPKBMPg3APHdAs65xjIklAK6iKzEp3RyK
         iV+A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer: Simplify SVG files for compatibility with
 browsers
Message-ID: <713d5a73-f4ea-f415-fe25-a42c11d248ac@gmail.com>
Date: Fri, 17 Dec 2021 23:14:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

RCUspacetime.svg and RCUusecases.svg are not properly rendered
in a browser.

By reverse converting from properly-rendered PDF, we are lucky to
obtain browser-compatible SVGs of these figures.

Steps of reverse conversion (example for defer/RCUusecases.svg):

  1. Generate a properly rendered PDF with fixsvgfonts.sh applied:

        make defer/RCUusecases.pdf

  2. Confirm the PDF looks OK.
  3. Export as plain-SVG from PDF (Inkscape >= 1.0):

        inkscape -l -o defer/RCUusecases.svg defer/RCUusecases.pdf

     ,or with Inkscape < 1.0:

        inkscape -l defer/RCUusecases.svg defer/RCUusecases.pdf

  4. Confirm the plain-SVG looks OK in a browser.
  5. Confirm that the plain-SVG can be edited by Inkscape.

Note: Plain-SVG is a SVG format where Inkscape-specific attributes
    and UI settings are removed.  It is meant for portability across
    different SVG editors.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

You might want to call this "Inkscape black magic!".
But it works as far as these two figures are concerned.

It's up to you whether or not taking this.
At least this change reduces their sizes almost by half.

Note that simply saving a problematic SVG as a plain-SVG by
Inkscape, exported SVG is still not compatible with browsers.

As a matter of fact, texts in RCUusecases.svg at current master can
not be edited in Inkscape 1.1.1 in my test even after upgrouping
texts.  For example, font size can not be changed.

After the reverse conversion to plain-SVG, their font sizes become
changeable.

        Thanks, Akira
--
 defer/RCUspacetime.svg | 1084 +++++++---------------
 defer/RCUusecases.svg  | 1960 +++++++++-------------------------------
 2 files changed, 742 insertions(+), 2302 deletions(-)

diff --git a/defer/RCUspacetime.svg b/defer/RCUspacetime.svg
index bebd4dc1..43ffecc9 100644
--- a/defer/RCUspacetime.svg
+++ b/defer/RCUspacetime.svg
@@ -2,772 +2,322 @@
 <!-- Created with Inkscape (http://www.inkscape.org/) -->
 
 <svg
-   width="262.95599mm"
-   height="138.7054mm"
-   viewBox="0 0 262.95599 138.7054"
    version="1.1"
-   id="svg8"
-   inkscape:version="1.1 (c68e22c387, 2021-05-23)"
-   sodipodi:docname="RCUspacetime.svg"
-   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
-   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   id="svg2"
+   xml:space="preserve"
+   width="993.84943"
+   height="524.24091"
+   viewBox="0 0 993.84943 524.24091"
    xmlns="http://www.w3.org/2000/svg"
-   xmlns:svg="http://www.w3.org/2000/svg"
-   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
-   xmlns:cc="http://creativecommons.org/ns#"
-   xmlns:dc="http://purl.org/dc/elements/1.1/">
-  <defs
-     id="defs2">
-    <marker
-       inkscape:stockid="Arrow2Mstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mstart"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4960"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(0.6)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="marker32475"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path32473"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(1.1,0,0,1.1,1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Lstart"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4954"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(1.1,0,0,1.1,1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:isstock="true"
-       style="overflow:visible"
-       id="marker32217"
-       refX="0"
-       refY="0"
-       orient="auto"
-       inkscape:stockid="Arrow2Mend">
-      <path
-         transform="scale(-0.6)"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         id="path32215"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4963"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Lend"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4957"
-         style="fill:#5a5a5a;fill-opacity:1;fill-rule:evenodd;stroke:#5a5a5a;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow1Lend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow1Lend"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4939"
-         d="M 0,0 5,-5 -12.5,0 5,5 Z"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:1.00000003pt;stroke-opacity:1"
-         transform="matrix(-0.8,0,0,-0.8,-10,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow1Lstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow1Lstart"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path5011"
-         d="M 0,0 5,-5 -12.5,0 5,5 Z"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:1.00000003pt;stroke-opacity:1"
-         transform="matrix(0.8,0,0,0.8,10,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-5"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-8"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-9-2"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-8-8"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-7-2"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-5-7"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-5"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-1-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-5-1"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Lend-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4957-5"
-         style="fill:#5a5a5a;fill-opacity:1;fill-rule:evenodd;stroke:#5a5a5a;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-4"
-       style="overflow:visible"
-       inkscape:isstock="true"
-       inkscape:collect="always">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-8"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-4-4"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-8-2"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-4-0"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-8-5"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-  </defs>
-  <sodipodi:namedview
-     id="base"
-     pagecolor="#ffffff"
-     bordercolor="#666666"
-     borderopacity="1.0"
-     inkscape:pageopacity="0.0"
-     inkscape:pageshadow="2"
-     inkscape:zoom="1.6285163"
-     inkscape:cx="210.92819"
-     inkscape:cy="261.89483"
-     inkscape:document-units="mm"
-     inkscape:current-layer="layer1"
-     showgrid="true"
-     fit-margin-top="5"
-     fit-margin-left="5"
-     fit-margin-right="5"
-     fit-margin-bottom="5"
-     inkscape:window-width="1920"
-     inkscape:window-height="1003"
-     inkscape:window-x="0"
-     inkscape:window-y="0"
-     inkscape:window-maximized="1"
-     inkscape:pagecheckerboard="0">
-    <inkscape:grid
-       type="xygrid"
-       id="grid3713"
-       originx="-60.659663"
-       originy="-134.39329" />
-  </sodipodi:namedview>
-  <metadata
-     id="metadata5">
-    <rdf:RDF>
-      <cc:Work
-         rdf:about="">
-        <dc:format>image/svg+xml</dc:format>
-        <dc:type
-           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-        <dc:title />
-      </cc:Work>
-    </rdf:RDF>
-  </metadata>
-  <g
-     inkscape:label="Layer 1"
-     inkscape:groupmode="layer"
-     id="layer1"
-     transform="translate(-60.659668,-23.901291)">
-    <path
-       style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.00000003, 3.00000003;stroke-dashoffset:0;stroke-opacity:1"
-       d="M 240.77083,53.583332 V 86.656248"
-       id="path113-9"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend)"
-       d="M 226.74791,71.436941 H 205.58125"
-       id="path4922"
-       inkscape:connector-curvature="0" />
-    <path
-       style="fill:none;stroke:#007b00;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-7)"
-       d="m 254.52916,71.448471 h 21.16666"
-       id="path4922-6"
-       inkscape:connector-curvature="0" />
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="112.31356"
-       y="95.173538"
-       id="text3777-5-7-8"><tspan
-         sodipodi:role="line"
-         id="tspan3775-5-4-7"
-         x="112.31356"
-         y="95.173538"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">rcu_read_lock();</tspan><tspan
-         sodipodi:role="line"
-         x="112.31356"
-         y="100.4652"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4667">mcp = ...</tspan><tspan
-         sodipodi:role="line"
-         x="112.31356"
-         y="105.75687"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan109">*cur_a = mcp-&gt;a;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
-   id="tspan31698"> (5)</tspan></tspan></text>
-    <path
-       style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3, 3;stroke-dashoffset:0;stroke-opacity:1"
-       d="M 66.145837,109.14583 H 312.20834"
-       id="path113"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="112.31356"
-       y="116.07561"
-       id="text3777-5-7-8-7"><tspan
-         sodipodi:role="line"
-         x="112.31356"
-         y="116.07561"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan109-4">*cur_b = mcp-&gt;b;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
-   id="tspan31700"> (25)</tspan></tspan><tspan
-         sodipodi:role="line"
-         x="112.31356"
-         y="121.36727"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4665">rcu_read_unlock();</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="186.25475"
-       y="100.55408"
-       id="text3777-5-7-8-0"><tspan
-         sodipodi:role="line"
-         x="186.25475"
-         y="100.55408"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan109-9">mcp = kmalloc(...)</tspan><tspan
-         sodipodi:role="line"
-         x="186.25475"
-         y="105.84574"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4704">mcp = xchg(&amp;curconfig, mcp);</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="186.03976"
-       y="116.07561"
-       id="text3777-5-7-8-0-9"><tspan
-         sodipodi:role="line"
-         x="186.03976"
-         y="116.07561"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4704-8">synchronize_rcu();</tspan><tspan
-         sodipodi:role="line"
-         x="186.03976"
-         y="121.36727"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4729">...</tspan><tspan
-         sodipodi:role="line"
-         x="186.03976"
-         y="126.65894"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4731">...</tspan></text>
-    <path
-       style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.00000003, 3.00000003;stroke-dashoffset:0;stroke-opacity:1"
-       d="M 66.145837,130.3125 H 312.20834"
-       id="path113-1"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="185.99222"
-       y="137.21603"
-       id="text3777-5-7-8-0-9-3"><tspan
-         sodipodi:role="line"
-         x="185.99222"
-         y="137.21603"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4731-0">kfree(mcp);</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="258.63132"
-       y="120.48671"
-       id="text3777-5-7-8-3"><tspan
-         sodipodi:role="line"
-         id="tspan3775-5-4-7-4"
-         x="258.63132"
-         y="120.48671"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">rcu_read_lock();</tspan><tspan
-         sodipodi:role="line"
-         x="258.63132"
-         y="125.77837"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan109-3">mcp = ...</tspan></text>
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="258.51349"
-       y="137.14162"
-       id="text3777-5-7-8-3-9"><tspan
-         sodipodi:role="line"
-         x="258.51349"
-         y="137.14162"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan109-3-6">*cur_a = mcp-&gt;a;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
-   id="tspan31702"> (9)</tspan></tspan><tspan
-         sodipodi:role="line"
-         x="258.51349"
-         y="142.43329"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4832">*cur_b = mcp-&gt;b;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
-   id="tspan31704"> (81)</tspan></tspan><tspan
-         sodipodi:role="line"
-         x="258.51349"
-         y="147.72495"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
-         id="tspan4834">rcu_read_unlock();</tspan></text>
-    <g
-       id="g4851"
-       transform="translate(-35.983348,3.3072907)">
-      <text
-         id="text4840"
-         y="69.432495"
-         x="224.24263"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-           y="69.432495"
-           x="224.24263"
-           id="tspan4838"
-           sodipodi:role="line">5,</tspan></text>
-      <rect
-         y="61.520832"
-         x="211.66666"
-         height="13.229166"
-         width="29.104166"
-         id="rect4836"
-         style="fill:#78b4ff;fill-opacity:1;stroke:#000000;stroke-width:0.2;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" />
-      <text
-         id="text4844"
-         y="69.460396"
-         x="221.52756"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-           y="69.460396"
-           x="221.52756"
-           id="tspan4842"
-           sodipodi:role="line">5,25</tspan></text>
-    </g>
-    <g
-       transform="translate(64.822918,3.3072907)"
-       id="g4851-9">
-      <text
-         id="text4840-3"
-         y="69.432495"
-         x="224.24263"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-           y="69.432495"
-           x="224.24263"
-           id="tspan4838-3"
-           sodipodi:role="line">5,</tspan></text>
-      <rect
-         y="61.520832"
-         x="211.66666"
-         height="13.229166"
-         width="29.104166"
-         id="rect4836-8"
-         style="fill:#78ff78;fill-opacity:1;stroke:#000000;stroke-width:0.2;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" />
-      <text
-         id="text4844-0"
-         y="69.460396"
-         x="221.56786"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-           y="69.460396"
-           x="221.56786"
-           id="tspan4842-5"
-           sodipodi:role="line">9,81</tspan></text>
-    </g>
-    <g
-       transform="translate(12.435392,3.3072919)"
-       id="g4851-9-0">
-      <text
-         id="text4840-3-0"
-         y="69.432495"
-         x="225.84267"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-           y="69.432495"
-           x="225.84267"
-           id="tspan4838-3-4"
-           sodipodi:role="line">5,</tspan></text>
-      <rect
-         y="64.166664"
-         x="214.3125"
-         height="7.9374995"
-         width="27.781256"
-         id="rect4836-8-6"
-         style="fill:#c8c8c8;fill-opacity:1;stroke:#000000;stroke-width:0.2;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" />
-      <text
-         id="text4844-0-2"
-         y="69.288834"
-         x="216.34557"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
-           y="69.288834"
-           x="216.34557"
-           id="tspan4842-5-6"
-           sodipodi:role="line">curconfig</tspan></text>
-    </g>
-    <path
-       style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:2.40000012, 1.20000006, 0.60000003, 1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-9)"
-       d="m 175.94789,71.436941 c -17.92373,-3.529979 -42.69195,-10.298787 -56.8854,-3.301526 -6.16774,3.257959 -10.96986,9.628408 -12.06487,16.298498 -0.72654,4.425553 4.12737,12.805668 4.12737,12.805668"
-       id="path4922-7"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="ccac" />
-    <path
-       style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:2.40000012, 1.20000006, 0.60000003, 1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-9-2)"
-       d="m 175.94791,77.924998 c 0,0 -8.27905,6.142627 -9.19641,10.774525 -0.67487,3.407487 0.83374,7.395175 3.23349,9.906675 3.42151,3.580852 13.90042,5.247962 13.90042,5.247962"
-       id="path4922-7-2"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="caac" />
-    <path
-       style="fill:none;stroke:#007b00;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.60000018, 1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99)"
-       d="m 257.96875,106.49999 c 0,0 8.81151,4.45924 12.02239,1.97279 3.08625,-2.38994 2.95155,-8.25025 1.05605,-11.662547 -3.36055,-6.049701 -12.90643,-5.321755 -18.54385,-9.335692 -4.44232,-3.163004 -11.73251,-11.401626 -11.73251,-11.401626"
-       id="path4922-0"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="caaac" />
-    <path
-       style="fill:none;stroke:#007b00;stroke-width:0.60000003;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.60000018,1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-7-2)"
-       d="m 305.59375,77.924998 c 8.1273,3.149456 9.60768,9.151542 11.90624,16.66875 1.80056,6.735882 0.78619,17.726392 -4.7211,23.527222 -6.40225,6.74347 -27.0289,6.89986 -27.0289,6.89986"
-       id="path4922-6-6"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="ccac" />
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.60000003, 0.60000003;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1)"
-       d="M 185.20833,113.11458 153.45834,95.916664"
-       id="path4922-0-2"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.60000004, 0.60000004;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-1)"
-       d="m 257.96874,118.40625 -25.13541,-2.64584"
-       id="path4922-0-2-9"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.60000005, 0.60000005;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-1-9)"
-       d="m 158.22082,122.375 26.45834,11.90625"
-       id="path4922-0-2-9-4"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Lend)"
-       d="M 175.94791,53.583332 H 317.5"
-       id="path113-10"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="212.72537"
-       y="49.614582"
-       id="text26915"><tspan
-         sodipodi:role="line"
-         id="tspan26913"
-         x="212.72537"
-         y="49.614582"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">Address Space</tspan></text>
-    <path
-       style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Lend-7)"
-       d="M 91.281249,39.031252 V 156.77084"
-       id="path113-10-8"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="81.756622"
-       y="34.797916"
-       id="text26915-7"><tspan
-         sodipodi:role="line"
-         id="tspan26913-0"
-         x="81.756622"
-         y="34.797916"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">Time</tspan></text>
-    <path
-       style="fill:none;stroke:#5a5aff;stroke-width:0.60000003;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:2.40000012,1.20000006,0.60000003,1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-4)"
-       d="m 87.312503,78.1896 v 51.59375"
-       id="path4922-0-2-0"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#007b00;stroke-width:0.60000003;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.60000018,1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-4-4)"
-       d="m 81.756261,150.15626 -4e-6,-39.83862"
-       id="path4922-0-2-0-9"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="-84.219742"
-       y="-96.887878"
-       id="text31542"
-       transform="scale(-1)"><tspan
-         sodipodi:role="line"
-         id="tspan31540"
-         x="-84.219742"
-         y="-96.887878"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#5a5aff;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
-    <g
-       id="g31594"
-       transform="translate(-8.9958336,46.017934)">
-      <text
-         transform="scale(-1)"
-         id="text31542-1"
-         y="-79.621559"
-         x="-77.026497"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         xml:space="preserve"><tspan
-           id="tspan31568"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-           y="-77.026497"
-           x="-79.621559"
-           sodipodi:role="line">Grace</tspan></text>
-      <text
-         transform="scale(-1)"
-         id="text31542-1-4"
-         y="-80.102051"
-         x="-81.724838"
-         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         xml:space="preserve"><tspan
-           id="tspan31568-2"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
-           y="-81.724838"
-           x="-80.102051"
-           sodipodi:role="line">Period</tspan></text>
-    </g>
-    <text
-       xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.264583"
-       x="-85.955162"
-       y="-150.94402"
-       id="text31542-2"
-       transform="scale(-1)"><tspan
-         sodipodi:role="line"
-         id="tspan31540-2"
-         x="-85.955162"
-         y="-150.94402"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#007b00;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
-    <path
-       style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#Arrow2Mstart);marker-end:url(#Arrow2Mend-99-1-4-0)"
-       d="m 77.258344,110.46875 v 18.52083"
-       id="path4922-0-2-0-5"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-  </g>
-</svg>
+   xmlns:svg="http://www.w3.org/2000/svg"><defs
+     id="defs6" /><g
+     id="g8"
+     transform="matrix(1.3333333,0,0,1.3333333,0,1.7772689e-5)"><g
+       id="g10"><g
+         id="g12"><path
+           d="m 510.551,84.137 v 93.75"
+           style="fill:none;stroke:#5a5a5a;stroke-width:1.41732;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:8.50394, 8.50394;stroke-dashoffset:0;stroke-opacity:1"
+           id="path14" /></g><g
+         id="g16"><path
+           d="m 470.801,134.746 h -60"
+           style="fill:none;stroke:#5a5aff;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path18" /></g><g
+         id="g20"><path
+           d="m 419.699,138.863 -11.148,-4.101 11.148,-4.098 c -1.781,2.418 -1.773,5.731 0,8.199 z"
+           style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path22" /></g><g
+         id="g24"><path
+           d="m 549.551,134.781 h 60"
+           style="fill:none;stroke:#007b00;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path26" /></g><g
+         id="g28"
+         transform="scale(-1)"><path
+           d="m -600.652,-130.664 -11.153,-4.098 11.153,-4.101 c -1.782,2.422 -1.774,5.734 0,8.199 z"
+           style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path30" /></g><text
+         transform="translate(146.42048,202.03157)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text38"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937 79.463936 86.687927 93.911919 101.13592 108.35991"
+           y="0"
+           id="tspan32">rcu_read_lock();</tspan><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195"
+           y="14.999987"
+           id="tspan34">mcp = ...</tspan><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937 79.463936 86.687927 93.911919 101.13592 108.35991"
+           y="29.999975"
+           id="tspan36">*cur_a = mcp-&gt;a;</tspan></text><text
+         transform="translate(265.34038,232.03154)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text42"><tspan
+           x="0 3.9959967 10.667991"
+           y="0"
+           id="tspan40">(5)</tspan></text><g
+         id="g44"><path
+           d="m 15.551,241.637 h 697.5"
+           style="fill:none;stroke:#5a5a5a;stroke-width:1.41732;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:8.50394, 8.50394;stroke-dashoffset:0;stroke-opacity:1"
+           id="path46" /></g><text
+         transform="translate(146.42048,261.28153)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text50"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937 79.463936 86.687927 93.911919 101.13592 108.35991"
+           y="0"
+           id="tspan48">*cur_b = mcp-&gt;b;</tspan></text><text
+         transform="translate(265.34038,261.28153)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text54"><tspan
+           x="0 3.9959967 10.667991 17.339985"
+           y="0"
+           id="tspan52">(25)</tspan></text><text
+         transform="translate(146.42048,276.65071)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text68"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937 79.463936 86.687927 93.911919 101.13592 108.35991 115.5839 122.8079"
+           y="0"
+           id="tspan56">rcu_read_unlock();</tspan><tspan
+           x="209.59706 216.82104 224.04504 231.26904 238.49303 245.71703 252.94102 260.16501 267.38901 274.61301 281.83701 289.061 296.28497 303.50897 310.73297 317.95697 325.18097 332.40497"
+           y="-59.367214"
+           id="tspan58">mcp = kmalloc(...)</tspan><tspan
+           x="209.59706 216.82104 224.04504 231.26904 238.49303 245.71703 252.94102 260.16501 267.38901 274.61301 281.83701 289.061 296.28497 303.50897 310.73297 317.95697 325.18097 332.40497 339.62894 346.85294 354.07693 361.30093 368.52493 375.74893 382.9729 390.1969 397.4209 404.6449"
+           y="-44.367226"
+           id="tspan60">mcp = xchg(&amp;curconfig, mcp);</tspan><tspan
+           x="208.98766 216.21165 223.43565 230.65964 237.88364 245.10764 252.33162 259.55563 266.7796 274.0036 281.2276 288.4516 295.6756 302.8996 310.12357 317.34756 324.57156 331.79556"
+           y="-15.369179"
+           id="tspan62">synchronize_rcu();</tspan><tspan
+           x="208.98766 216.21165 223.43565"
+           y="-0.36919168"
+           id="tspan64">...</tspan><tspan
+           x="208.98766 216.21165 223.43565"
+           y="14.630796"
+           id="tspan66">...</tspan></text><g
+         id="g70"><path
+           d="m 15.551,301.637 h 697.5"
+           style="fill:none;stroke:#5a5a5a;stroke-width:1.41732;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:8.50394, 8.50394;stroke-dashoffset:0;stroke-opacity:1"
+           id="path72" /></g><text
+         transform="translate(355.27337,321.20714)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text82"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937"
+           y="0"
+           id="tspan74">kfree(mcp);</tspan><tspan
+           x="205.90611 213.13011 220.3541 227.57809 234.80209 242.02608 249.25008 256.47406 263.69806 270.92206 278.14606 285.37006 292.59406 299.81802 307.04202 314.26602"
+           y="-47.421703"
+           id="tspan76">rcu_read_lock();</tspan><tspan
+           x="205.90611 213.13011 220.3541 227.57809 234.80209 242.02608 249.25008 256.47406 263.69806"
+           y="-32.421719"
+           id="tspan78">mcp = ...</tspan><tspan
+           x="205.57211 212.79611 220.0201 227.24409 234.46809 241.69208 248.91608 256.14008 263.36407 270.58804 277.81204 285.03604 292.26004 299.48404 306.70804 313.93201"
+           y="-0.21094783"
+           id="tspan80">*cur_a = mcp-&gt;a;</tspan></text><text
+         transform="translate(679.76538,320.9962)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text86"><tspan
+           x="0 3.9959967 10.667991"
+           y="0"
+           id="tspan84">(9)</tspan></text><text
+         transform="translate(560.84548,336.36538)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text90"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937 79.463936 86.687927 93.911919 101.13592 108.35991"
+           y="0"
+           id="tspan88">*cur_b = mcp-&gt;b;</tspan></text><text
+         transform="translate(679.76538,336.36538)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text94"><tspan
+           x="0 3.9959967 10.667991 17.339985"
+           y="0"
+           id="tspan92">(81)</tspan></text><text
+         transform="translate(560.84548,351.73456)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text98"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195 65.015945 72.239937 79.463936 86.687927 93.911919 101.13592 108.35991 115.5839 122.8079"
+           y="0"
+           id="tspan96">rcu_read_unlock();</tspan></text><text
+         transform="translate(361.69969,138.43983)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text102"><tspan
+           x="0 6.6719942"
+           y="0"
+           id="tspan100">5,</tspan></text><g
+         id="g104"><path
+           d="m 326.051,116.012 h 82.5 v 37.5 h -82.5 z"
+           style="fill:#78b4ff;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:0.566929;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path106" /></g><text
+         transform="translate(354.00342,138.51892)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text112"><tspan
+           x="0 6.6719942 10.007992 16.679987"
+           y="0"
+           id="tspan108">5,25</tspan><tspan
+           x="293.44632 300.11832"
+           y="-0.079088576"
+           id="tspan110">5,</tspan></text><g
+         id="g114"><path
+           d="m 611.801,116.012 h 82.5 v 37.5 h -82.5 z"
+           style="fill:#78ff78;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:0.566929;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path116" /></g><text
+         transform="translate(639.8677,138.51892)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text122"><tspan
+           x="0 6.6719942 10.007992 16.679987"
+           y="0"
+           id="tspan118">9,81</tspan><tspan
+           x="-136.38251 -129.71051"
+           y="-0.079085216"
+           id="tspan120">5,</tspan></text><g
+         id="g124"><path
+           d="m 470.801,123.512 h 78.75 v 22.5 h -78.75 z"
+           style="fill:#c8c8c8;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:0.566929;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path126" /></g><text
+         transform="translate(476.56429,138.0326)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSansMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text130"><tspan
+           x="0 7.2239938 14.447988 21.671982 28.895975 36.119968 43.343964 50.567959 57.79195"
+           y="0"
+           id="tspan128">curconfig</tspan></text><g
+         id="g132"><path
+           d="m 326.801,134.746 c -50.809,-10.004 -121.016,-29.191 -161.25,-9.359 -17.485,9.238 -31.094,27.293 -34.199,46.203 -2.059,12.543 11.699,36.297 11.699,36.297"
+           style="fill:none;stroke:#5a5aff;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:6.80315, 3.40158, 1.70079, 3.40158;stroke-dashoffset:0;stroke-opacity:1"
+           id="path134" /></g><g
+         id="g136"
+         transform="matrix(-0.579218,-1,1,-0.579218,0,0)"><path
+           d="m -210.006,20.513 -9.65,-3.546 9.649,-3.548 c -1.542,2.095 -1.533,4.96 0.001,7.094 z"
+           style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.5519;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path138" /></g><g
+         id="g140"><path
+           d="m 326.801,153.137 c 0,0 -23.469,17.414 -26.067,30.543 -1.914,9.66 2.364,20.965 9.164,28.082 9.7,10.152 39.403,14.875 39.403,14.875"
+           style="fill:none;stroke:#5a5aff;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:6.80315, 3.40158, 1.70079, 3.40158;stroke-dashoffset:0;stroke-opacity:1"
+           id="path142" /></g><g
+         id="g144"
+         transform="matrix(-1,-0.159092,0.159092,-1,0,0)"><path
+           d="m -367.057,-162.78 -11.011,-4.049 11.008,-4.048 c -1.757,2.389 -1.748,5.661 0.003,8.097 z"
+           style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.629874;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path146" /></g><g
+         id="g148"><path
+           d="m 559.301,234.137 c 0,0 24.976,12.64 34.078,5.593 8.75,-6.773 8.367,-23.386 2.996,-33.058 -9.527,-17.149 -36.586,-15.086 -52.566,-26.465 -12.594,-8.965 -33.258,-32.32 -33.258,-32.32"
+           style="fill:none;stroke:#007b00;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:10.2047, 3.40158;stroke-dashoffset:0;stroke-opacity:1"
+           id="path150" /></g><g
+         id="g152"
+         transform="matrix(0.88488,1,-1,0.88488,0,0)"><path
+           d="m 342.983,-209.865 -8.349,-3.071 8.349,-3.069 c -1.334,1.811 -1.326,4.292 0,6.14 z"
+           style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.477644;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path154" /></g><g
+         id="g156"><path
+           d="m 694.301,153.137 c 23.039,8.929 27.234,25.941 33.75,47.25 5.105,19.093 2.23,50.25 -13.383,66.691 -18.148,19.117 -76.617,19.559 -76.617,19.559"
+           style="fill:none;stroke:#007b00;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:10.2047, 3.40158;stroke-dashoffset:0;stroke-opacity:1"
+           id="path158" /></g><g
+         id="g160"
+         transform="matrix(1,-0.00758194,0.00758194,1,0,0)"><path
+           d="m 644.739,295.576 -11.148,-4.1 11.148,-4.099 c -1.78,2.42 -1.77,5.732 0,8.199 z"
+           style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.637777;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path162" /></g><g
+         id="g164"><path
+           d="m 353.051,252.887 -90,-48.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path166" /></g><g
+         id="g168"
+         transform="matrix(1,0.541667,-0.541667,1,0,0)"><path
+           d="m 296.694,51.287 -9.805,-3.607 9.806,-3.604 c -1.566,2.129 -1.56,5.039 -10e-4,7.211 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.560808;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path170" /></g><g
+         id="g172"><path
+           d="m 559.301,267.887 -71.25,-7.5"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path174" /></g><g
+         id="g176"
+         transform="matrix(1,0.105263,-0.105263,1,0,0)"><path
+           d="m 518.66,210.818 -11.089,-4.079 11.09,-4.077 c -1.774,2.409 -1.763,5.701 -10e-4,8.156 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.634291;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path178" /></g><g
+         id="g180"><path
+           d="m 276.551,279.137 75,33.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path182" /></g><g
+         id="g184"
+         transform="matrix(-1,-0.45,0.45,-1,0,0)"><path
+           d="m -401.328,-124.887 -10.166,-3.737 10.168,-3.74 c -1.624,2.207 -1.616,5.227 -0.002,7.477 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.581619;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path186" /></g><g
+         id="g188"><path
+           d="m 326.801,84.137 h 401.25"
+           style="fill:none;stroke:#5a5a5a;stroke-width:1.41732;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path190" /></g><g
+         id="g192"
+         transform="scale(-1)"><path
+           d="m -712.898,-77.848 -17.036,-6.265 17.036,-6.262 c -2.723,3.695 -2.707,8.758 0,12.527 z"
+           style="fill:#5a5a5a;fill-opacity:1;fill-rule:evenodd;stroke:#5a5a5a;stroke-width:0.974409;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path194" /></g><text
+         transform="translate(431.05239,72.888069)"
+         style="font-variant:normal;font-weight:normal;font-size:22px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text198"><tspan
+           x="0 14.519998 26.751995 38.983994 46.089993 58.23399 69.233986 80.233986 86.349983 101.02398 113.25598 125.48798 136.66397"
+           y="0"
+           id="tspan196">Address Space</tspan></text><g
+         id="g200"><path
+           d="m 86.801,42.887 v 333.75"
+           style="fill:none;stroke:#5a5a5a;stroke-width:1.41732;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path202" /></g><g
+         id="g204"
+         transform="rotate(-90)"><path
+           d="m -361.484,93.09 -17.036,-6.262 17.036,-6.266 c -2.723,3.7 -2.707,8.758 0,12.528 z"
+           style="fill:#5a5a5a;fill-opacity:1;fill-rule:evenodd;stroke:#5a5a5a;stroke-width:0.974409;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path206" /></g><text
+         transform="translate(59.80239,30.888072)"
+         style="font-variant:normal;font-weight:normal;font-size:22px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text210"><tspan
+           x="0 13.375998 18.259996 36.585995"
+           y="0"
+           id="tspan208">Time</tspan></text><g
+         id="g212"><path
+           d="m 75.551,153.887 v 146.25"
+           style="fill:none;stroke:#5a5aff;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:6.80315, 3.40158, 1.70079, 3.40158;stroke-dashoffset:0;stroke-opacity:1"
+           id="path214" /></g><g
+         id="g216"
+         transform="rotate(-90)"><path
+           d="m -291.242,79.668 -11.149,-4.102 11.149,-4.097 c -1.781,2.418 -1.77,5.73 0,8.199 z"
+           style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path218" /></g><g
+         id="g220"><path
+           d="M 59.801,357.887 V 244.961"
+           style="fill:none;stroke:#007b00;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:10.2047, 3.40158;stroke-dashoffset:0;stroke-opacity:1"
+           id="path222" /></g><g
+         id="g224"
+         transform="rotate(90)"><path
+           d="m 253.855,-55.684 -11.148,-4.101 11.148,-4.102 c -1.781,2.422 -1.769,5.735 0,8.203 z"
+           style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path226" /></g><text
+         transform="rotate(-90,138.21179,68.679327)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#5a5aff;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text230"><tspan
+           x="0 8.543993 15.131988 21.803982 28.475977 35.147972 39.203968"
+           y="0"
+           id="tspan228">Readers</tspan></text><text
+         transform="rotate(-90,156.01696,132.3748)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text236"><tspan
+           x="0 9.3359919 13.283989 19.955984 26.027979"
+           y="0"
+           id="tspan232">Grace</tspan><tspan
+           x="-1.3620229 6.281971 12.953965 16.949963 19.61396 26.285954"
+           y="13.318129"
+           id="tspan234">Period</tspan></text><text
+         transform="rotate(-90,217.28643,142.83467)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#007b00;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text240"><tspan
+           x="0 8.543993 15.131988 21.803982 28.475977 35.147972 39.203968"
+           y="0"
+           id="tspan238">Readers</tspan></text><g
+         id="g242"><path
+           d="m 47.051,245.387 v 52.5"
+           style="fill:none;stroke:#5a5aff;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path244" /></g><g
+         id="g246"
+         transform="rotate(90)"><path
+           d="m 254.285,-42.934 -11.148,-4.101 11.148,-4.102 c -1.781,2.422 -1.769,5.735 0,8.203 z"
+           style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path248" /></g><g
+         id="g250"
+         transform="rotate(-90)"><path
+           d="m -288.992,51.168 -11.149,-4.102 11.149,-4.097 c -1.781,2.418 -1.77,5.73 0,8.199 z"
+           style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path252" /></g></g></g></svg>
diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
index fb5c6007..656157b3 100644
--- a/defer/RCUusecases.svg
+++ b/defer/RCUusecases.svg
@@ -2,1540 +2,430 @@
 <!-- Created with Inkscape (http://www.inkscape.org/) -->
 
 <svg
-   width="193.4453mm"
-   height="275.77731mm"
-   viewBox="0 0 193.44529 275.77732"
    version="1.1"
-   id="svg8"
-   inkscape:version="1.1 (c68e22c387, 2021-05-23)"
-   sodipodi:docname="RCUusecases.svg"
-   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
-   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   id="svg2"
+   xml:space="preserve"
+   width="731.13184"
+   height="1042.3079"
+   viewBox="0 0 731.13184 1042.3079"
    xmlns="http://www.w3.org/2000/svg"
-   xmlns:svg="http://www.w3.org/2000/svg"
-   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
-   xmlns:cc="http://creativecommons.org/ns#"
-   xmlns:dc="http://purl.org/dc/elements/1.1/">
-  <defs
-     id="defs2">
-    <marker
-       inkscape:stockid="Arrow2Mstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mstart"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4960"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(0.6)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="marker32475"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path32473"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(1.1,0,0,1.1,1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Lstart"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4954"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(1.1,0,0,1.1,1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:isstock="true"
-       style="overflow:visible"
-       id="marker32217"
-       refX="0"
-       refY="0"
-       orient="auto"
-       inkscape:stockid="Arrow2Mend">
-      <path
-         transform="scale(-0.6)"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         id="path32215"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4963"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Lend"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4957"
-         style="fill:#5a5a5a;fill-opacity:1;fill-rule:evenodd;stroke:#5a5a5a;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow1Lend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow1Lend"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4939"
-         d="M 0,0 5,-5 -12.5,0 5,5 Z"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:1pt;stroke-opacity:1"
-         transform="matrix(-0.8,0,0,-0.8,-10,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow1Lstart"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow1Lstart"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path5011"
-         d="M 0,0 5,-5 -12.5,0 5,5 Z"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:1pt;stroke-opacity:1"
-         transform="matrix(0.8,0,0,0.8,10,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-5"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-8"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-9-2"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-8-8"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-7-2"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-5-7"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-5"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-1-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-5-1"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Lend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Lend-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         id="path4957-5"
-         style="fill:#5a5a5a;fill-opacity:1;fill-rule:evenodd;stroke:#5a5a5a;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
-         inkscape:connector-curvature="0" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-4-4"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-8-2"
-         style="fill:#007b00;fill-opacity:1;fill-rule:evenodd;stroke:#007b00;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-4-0"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-8-5"
-         style="fill:#5a5aff;fill-opacity:1;fill-rule:evenodd;stroke:#5a5aff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-3"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-9"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-9-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-9-5"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-39"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-7"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-36"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-75"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-5"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-6"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-5-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-6-1"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-9-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-9-0"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-9-7-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-9-0-9"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-9-7-1-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-9-0-9-8"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-6"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-5"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-3-1-9-7-1-1"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-6-6-9-0-9-5"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-3"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-6"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-6-7"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-5-5"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-6-6"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-5-2"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-1"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-9-6"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-1-2"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-6-6-9"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-5-2-1"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-9-0"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-1-9"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-    <marker
-       inkscape:stockid="Arrow2Mend"
-       orient="auto"
-       refY="0"
-       refX="0"
-       id="Arrow2Mend-99-1-5-6-6-3"
-       style="overflow:visible"
-       inkscape:isstock="true">
-      <path
-         inkscape:connector-curvature="0"
-         id="path4963-6-3-54-5-2-6"
-         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
-         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
-         transform="scale(-0.6)" />
-    </marker>
-  </defs>
-  <sodipodi:namedview
-     id="base"
-     pagecolor="#ffffff"
-     bordercolor="#666666"
-     borderopacity="1.0"
-     inkscape:pageopacity="0.0"
-     inkscape:pageshadow="2"
-     inkscape:zoom="1.6285163"
-     inkscape:cx="385.93412"
-     inkscape:cy="12.281117"
-     inkscape:document-units="mm"
-     inkscape:current-layer="layer1"
-     showgrid="true"
-     fit-margin-top="5"
-     fit-margin-left="5"
-     fit-margin-right="5"
-     fit-margin-bottom="5"
-     inkscape:window-width="1920"
-     inkscape:window-height="1011"
-     inkscape:window-x="0"
-     inkscape:window-y="0"
-     inkscape:window-maximized="1"
-     inkscape:pagecheckerboard="0">
-    <inkscape:grid
-       type="xygrid"
-       id="grid3713"
-       originx="-69.823447"
-       originy="21.868986" />
-  </sodipodi:namedview>
-  <metadata
-     id="metadata5">
-    <rdf:RDF>
-      <cc:Work
-         rdf:about="">
-        <dc:format>image/svg+xml</dc:format>
-        <dc:type
-           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-      </cc:Work>
-    </rdf:RDF>
-  </metadata>
-  <g
-     inkscape:label="Layer 1"
-     inkscape:groupmode="layer"
-     id="layer1"
-     transform="translate(-69.823458,132.36098)">
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1)"
-       d="M 90.487464,62.016097 H 107.68533"
-       id="path4922-0-2"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <g
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
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
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
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="105.17783"
-         y="119.96007"
-         id="text36678"><tspan
-           sodipodi:role="line"
-           id="tspan36676"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="105.17783"
-           y="119.96007">For Linked Structure</tspan></text>
-      <text
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
-    </g>
-    <g
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
-             y="-81.724838"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
-      </g>
-      <text
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
-      <text
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
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono'"
-   id="tspan87226">synchronize_rcu()</tspan></tspan></text>
-    </g>
-    <g
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
-             y="-81.724838"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
-      </g>
-      <text
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
-           sodipodi:role="line"
-           id="tspan36676-6"
-           x="111.75105"
-           y="121.54755"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583" /></text>
-      <text
-         xml:space="preserve"
-         style="font-style:italic;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
-         x="109.90517"
-         y="135.88304"
-         id="text43750-0"><tspan
-           sodipodi:role="line"
-           id="tspan43748-4"
-           x="109.90517"
-           y="135.88304"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Italic';stroke-width:0.264583" /></text>
-    </g>
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1)"
-       d="M 204.66097,111.75793 V 100.75878"
-       id="path4922-0-2-7-4"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <g
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
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
-      </g>
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="115.29295"
-         y="121.54755"
-         id="text36678-0-7"><tspan
-           sodipodi:role="line"
-           id="tspan36676-6-0"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="115.29295"
-           y="121.54755">List</tspan></text>
-    </g>
-    <g
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
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
-      </g>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="m 155.52139,123.92886 -62.177093,0.26458"
-         id="path4922-0-2-6-9"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
-         xml:space="preserve"
-         style="font-style:normal;font-weight:normal;font-size:4.23332977px;line-height:1.25;font-family:sans-serif;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         x="96.953011"
-         y="135.88304"
-         id="text43750-9"><tspan
-           sodipodi:role="line"
-           id="tspan43748-6"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.26458299"
-           x="96.953011"
-           y="135.88304">+ Deferred slab reclamation</tspan></text>
-      <text
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
-    </g>
-    <g
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
-             y="-81.724838"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583" /></text>
-      </g>
-      <text
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
-           sodipodi:role="line"
-           id="tspan43748-6-8"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';stroke-width:0.264583"
-           x="96.953011"
-           y="135.88304">+ Deferred reclamation</tspan></text>
-      <text
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
-    </g>
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-36)"
-       d="M 90.487464,80.536931 V 6.4535972 H 187.85418 V 62.016097 h 10.05416"
-       id="path4922-0-2-3"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="ccccc" />
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-5)"
-       d="M 166.9521,111.758 V 73.393421"
-       id="path4922-0-2-7-4-2"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-5-9)"
-       d="M 243.41667,111.758 V 73.393421"
-       id="path4922-0-2-7-4-2-2"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <g
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
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
-      </g>
-      <text
-         transform="rotate(-90)"
-         id="text31542-1-3-9-7-6-3"
-         y="222.24622"
-         x="-26.630951"
-         style="font-style:normal;font-weight:normal;font-size:10.58329964px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458299"
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-           y="-27.160118"
-           x="222.77538"
-           sodipodi:role="line"
-           id="tspan31224-0-3-0-6">- Publish/subscribe</tspan></text>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.60000001, 0.60000001;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 259.82084,21.799522 220.1327,21.534912"
-         id="path4922-0-2-6-9-5-7"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-    </g>
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-9-7)"
-       d="m 231.56336,42.852925 -0.053,-12.322008"
-       id="path4922-0-2-7-4-3-87"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <g
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
-             y="-88.339401"
-             x="-80.102051"
-             sodipodi:role="line"
-             style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299" /></text>
-      </g>
-      <path
-         style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.6, 0.6;stroke-dashoffset:0;stroke-opacity:1"
-         d="M 172.19078,129.74983 H 94.138692"
-         id="path4922-0-2-6-9-9"
-         inkscape:connector-curvature="0"
-         sodipodi:nodetypes="cc" />
-      <text
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
-         xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23332977px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458299"
-           y="-124.63039"
-           x="98.535355"
-           sodipodi:role="line"
-           id="tspan19157-3">Non-Blocking Synchronization (NBS)</tspan></text>
-    </g>
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-3-1-9-7-1)"
-       d="M 140.75825,48.522348 V 41.907765"
-       id="path4922-0-2-7-4-3-87-4"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1"
-       d="m 250.03126,48.258001 h 7.9375 V -113.13783"
-       id="path4922-0-2-7-4-3-87-4-4"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="ccc" />
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
-   style="fill:#ffffff;fill-opacity:1"
-   id="tspan60832">+</tspan> (1) single object, (2) sequence locks, (3) version number(s),</tspan></text>
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
-   style="fill:#ffffff;fill-opacity:1"
-   id="tspan60832-4">+</tspan> (4) Issaquah challenge, and/or (5) many other approaches</tspan></text>
-    </g>
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6)"
-       d="M 257.93434,-27.81547 H 235.44468"
-       id="path4922-0-2-7-6"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
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
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6-6)"
-       d="M 257.93479,-63.005074 H 235.44513"
-       id="path4922-0-2-7-6-7"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
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
-    <path
-       style="fill:none;stroke:#000000;stroke-width:0.6;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-5-6-6-3)"
-       d="M 257.96876,-113.13783 H 235.47917"
-       id="path4922-0-2-7-6-7-6"
-       inkscape:connector-curvature="0"
-       sodipodi:nodetypes="cc" />
-  </g>
-</svg>
+   xmlns:svg="http://www.w3.org/2000/svg"><defs
+     id="defs6" /><g
+     id="g8"
+     transform="matrix(1.3333333,0,0,1.3333333,0,-1.6608968e-5)"><g
+       id="g10"><g
+         id="g12"><path
+           d="m 58.574,550.988 h 48.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path14" /></g><g
+         id="g16"
+         transform="scale(-1)"><path
+           d="m -98.43,-546.875 -11.148,-4.098 11.148,-4.101 c -1.781,2.422 -1.769,5.734 0,8.199 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path18" /></g><g
+         id="g20"><path
+           d="m 15.824,603.492 h 174.602 v 86.25 H 15.824 Z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path22" /></g><text
+         transform="translate(54.048018,620.78852)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text26"><tspan
+           x="0 7.9919934 14.663988 21.335981 23.999981 26.663979 32.663971 39.335968 42.659966 50.651958 57.323952 63.995945 69.995941 75.995934 79.991936 82.65593 89.327927"
+           y="0"
+           id="tspan24">Publish/Subscribe</tspan></text><text
+         transform="translate(24.004225,664.44217)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Mono';-inkscape-font-specification:LiberationMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text30"><tspan
+           x="0 7.1999941 14.399988 21.599981 28.799976 35.999969 43.199963 50.39996 57.599953 64.79995 71.999939 79.199936 86.399925 93.599922 100.79992 107.99991 115.19991 122.39989 129.5999 136.79988"
+           y="0"
+           id="tspan28">rcu_assign_pointer()</tspan></text><text
+         transform="translate(171.3281,664.44217)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text34"><tspan
+           x="0"
+           y="0"
+           id="tspan32">&amp;</tspan></text><g
+         id="g36"><path
+           d="m 190.422,645.492 -176.25,0.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path38" /></g><text
+         transform="translate(47.717112,635.74073)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text42"><tspan
+           x="0 7.319994 13.991988 17.987986 21.311983 27.983976 30.647974 37.319969 43.319965 49.991959 56.663952 59.987949 67.979942 71.30394 75.299934 81.971931 87.971924 91.295921 97.967918 101.96391"
+           y="0"
+           id="tspan40">For Linked Structure</tspan></text><text
+         transform="translate(41.388941,680.87673)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Mono';-inkscape-font-specification:LiberationMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text46"><tspan
+           x="0 7.1999941 14.399988 21.599981 28.799976 35.999969 43.199963 50.39996 57.599953 64.79995 71.999939 79.199936 86.399925 93.599922 100.79992 107.99991 115.19991"
+           y="0"
+           id="tspan44">rcu_dereference()</tspan></text><g
+         id="g48"><path
+           d="m 252.824,691.992 h 258.75 v 75 h -258.75 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path50" /></g><text
+         transform="translate(284.19642,712.28844)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text54"><tspan
+           x="0 10.871991 17.543985 20.207983 23.531981 26.855978 30.179976 36.851971 40.847965 44.171963 52.163956 56.159954 62.831947 66.827942 74.819939 80.819931 83.483932 89.483925 92.807922 95.471924 102.14391 108.81591 111.9239 119.2439 125.91589 128.5799 135.25189 141.92389 147.92387 151.24788 154.57187 161.24387 164.56786 171.88786 174.55185 181.22385 183.88785 189.88785"
+           y="0"
+           id="tspan52">Wait for Pre-Existing Things to Finish</tspan></text><text
+         transform="translate(259.94449,740.98725)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Mono';-inkscape-font-specification:LiberationMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text58"><tspan
+           x="0 7.1999941 14.399988 21.599981 28.799976 35.999969 43.199963 50.39996 57.599953 64.79995 71.999939 79.199936 86.399925 93.599922 100.79992"
+           y="0"
+           id="tspan56">rcu_read_lock()</tspan></text><text
+         transform="translate(371.26839,740.98725)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text62"><tspan
+           x="0 7.9919934"
+           y="0"
+           id="tspan60">&amp; </tspan></text><text
+         transform="translate(382.58438,740.98725)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Mono';-inkscape-font-specification:LiberationMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text66"><tspan
+           x="0 7.1999941 14.399988 21.599981 28.799976 35.999969 43.199963 50.39996 57.599953 64.79995 71.999939 79.199936 86.399925 93.599922 100.79992 107.99991 115.19991"
+           y="0"
+           id="tspan64">rcu_read_unlock()</tspan></text><g
+         id="g68"><path
+           d="M 511.574,722.742 H 252.824"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path70" /></g><text
+         transform="translate(311.32823,756.73698)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text74"><tspan
+           x="0 5.903995 11.78399 15.119987"
+           y="0"
+           id="tspan72">vs. </tspan></text><text
+         transform="translate(329.78422,756.73698)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Mono';-inkscape-font-specification:LiberationMono;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text78"><tspan
+           x="0 7.1999941 14.399988 21.599981 28.799976 35.999969 43.199963 50.39996 57.599953 64.79995 71.999939 79.199936 86.399925 93.599922 100.79992 107.99991 115.19991"
+           y="0"
+           id="tspan76">synchronize_rcu()</tspan></text><g
+         id="g80"><path
+           d="m 293.324,601.992 h 176.25 v 56.25 h -176.25 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path82" /></g><text
+         transform="translate(322.51379,620.8953)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text86"><tspan
+           x="0 7.9919934 14.663988 21.335981 27.335978 34.007973 40.679966 44.003963 51.995956 55.319954 61.991947 65.315948 71.987938 75.311935 83.975929 90.647926 97.319916 103.99191 110.66391"
+           y="0"
+           id="tspan84">Phased State Change</tspan></text><text
+         transform="translate(299.28626,649.53865)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Nimbus Sans';-inkscape-font-specification:NimbusSans-Regular;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text90"><tspan
+           x="0 7.0079942 10.343991 19.007984 25.679979 32.351974 38.423969 44.171963 50.843956 57.515953 60.851948 66.815941 70.151939 76.667938 79.83593 86.507927 89.843925 95.639923 102.31191 106.30791 108.97191 115.64391 122.3159 124.9799"
+           y="0"
+           id="tspan88">+ Checked state variable</tspan></text><g
+         id="g92"><path
+           d="M 469.574,631.992 H 293.324"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path94" /></g><g
+         id="g96"><path
+           d="m 382.215,691.992 v -31.18"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path98" /></g><g
+         id="g100"
+         transform="rotate(90)"><path
+           d="m 669.711,-378.102 -11.152,-4.097 11.152,-4.102 c -1.781,2.422 -1.773,5.735 0,8.199 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path102" /></g><g
+         id="g104"><path
+           d="m 189.824,603.492 h 67.5 v 41.25 h -67.5 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path106" /></g><text
+         transform="translate(198.56451,623.03874)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text110"><tspan
+           x="0 7.9919934 14.663988 21.335981 25.33198 34.655972 41.327965 43.991962"
+           y="0"
+           id="tspan108">Add-Only</tspan></text><text
+         transform="translate(213.79013,636.49076)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text114"><tspan
+           x="0 6.6719942 9.3359919 15.335987"
+           y="0"
+           id="tspan112">List</tspan></text><g
+         id="g116"><path
+           d="m 111.074,511.992 h 176.25 v 67.5 h -176.25 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path118" /></g><text
+         transform="translate(148.39352,528.53836)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text122"><tspan
+           x="0 6.6599946 12.659989 19.331984 26.003979 29.999975 37.99197 44.663963 47.987961 54.659954 57.983952 67.979942 74.651939 84.647926 91.319923 95.315918"
+           y="0"
+           id="tspan120">Type-Safe Memory</tspan></text><g
+         id="g124"><path
+           d="m 287.324,536.742 -176.25,0.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path126" /></g><text
+         transform="translate(121.30283,570.62669)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text132"><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 28.979977 35.65197 39.647968 43.643963 50.31596 56.987953 60.311951 66.311943 68.975945 75.647934 82.319931 85.643929 89.639923 96.31192 102.31191 104.97591 111.6479 121.6439 128.31589 131.63989 134.30389 140.97588"
+           y="0"
+           id="tspan128">+ Deferred slab reclamation</tspan><tspan
+           x="0 6.9959941 10.319991 18.311985 20.975983 27.647978 34.319973 37.64397 44.315964 46.979961 49.643959 56.315952 62.315948 68.987946 72.311943 78.983932"
+           y="-14.279628"
+           id="tspan130">+ Slab allocator</tspan></text><g
+         id="g134"><path
+           d="m 365.324,496.992 h 146.25 v 82.5 h -146.25 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path136" /></g><text
+         transform="translate(382.19146,513.53844)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text140"><tspan
+           x="0 7.9919934 13.991988 16.655987 22.655981 25.979979 32.651974 39.323967 45.323963 51.995956 55.319954 64.643944 71.315941 77.987938 81.983932 88.65593 95.327919 98.651917 105.32391"
+           y="0"
+           id="tspan138">Existence Guarantee</tspan></text><text
+         transform="translate(375.1544,540.69216)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text144"><tspan
+           x="0 6.9959941 10.319991 16.991985 19.655983 26.327978 32.327972 38.999966 45.671963 48.99596 54.995953 58.31995 62.315948 68.987946 74.987938 78.311935 84.983932 88.979927"
+           y="0"
+           id="tspan142">+ Linked structure</tspan></text><g
+         id="g146"><path
+           d="m 511.574,523.242 -146.25,-0.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path148" /></g><text
+         transform="translate(375.55283,570.62668)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text154"><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 28.979977 35.65197 39.647968 43.643963 50.31596 56.987953 60.311951 64.307945 70.979942 76.979935 79.643936 86.315926 96.31192 102.98392 106.30791 108.97191 115.64391"
+           y="0"
+           id="tspan150">+ Deferred reclamation</tspan><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 32.327972 38.999966 42.323963 48.99596 51.659958 54.323956 60.995949 66.995941 73.667938 76.991936 83.663933"
+           y="-14.279628"
+           id="tspan152">+ Heap allocator</tspan></text><g
+         id="g156"><path
+           d="m 58.574,603.488 v -210 h 276 v 157.5 h 28.5"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path158" /></g><g
+         id="g160"
+         transform="scale(-1)"><path
+           d="m -354.18,-546.875 -11.148,-4.098 11.148,-4.101 c -1.781,2.422 -1.769,5.734 0,8.199 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path162" /></g><g
+         id="g164"><path
+           d="M 275.324,691.992 V 583.242"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path166" /></g><g
+         id="g168"
+         transform="rotate(90)"><path
+           d="m 592.137,-271.207 -11.149,-4.102 11.149,-4.101 c -1.782,2.422 -1.77,5.734 0,8.203 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path170" /></g><g
+         id="g172"><path
+           d="M 492.074,691.992 V 583.242"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path174" /></g><g
+         id="g176"
+         transform="rotate(90)"><path
+           d="m 592.137,-487.957 -11.149,-4.102 11.149,-4.101 c -1.782,2.422 -1.77,5.734 0,8.203 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path178" /></g><g
+         id="g180"><path
+           d="m 402.074,404.738 h 112.5 v 52.5 h -112.5 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path182" /></g><text
+         transform="translate(407.61325,420.53868)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text188"><tspan
+           x="0 8.6639929 15.335987 17.999985 24.67198 27.995977 34.667973 38.663967 47.987961 54.659954 57.323952 63.323948 66.647942 73.319939 75.98394 81.983932"
+           y="0"
+           id="tspan184">Delete-Only List</tspan><tspan
+           x="0.45125723 4.4472537 7.7712512 15.763245 22.43524 29.107233 31.771231 34.43523 40.435223 47.10722 50.431217 56.43121 63.103207 69.7752 75.775192 81.775192 85.771187 88.435181 95.107178"
+           y="28.955893"
+           id="tspan186">- Publish/subscribe</tspan></text><g
+         id="g190"><path
+           d="m 514.574,432.488 -112.5,-0.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path192" /></g><g
+         id="g194"><path
+           d="m 458.477,496.668 -0.153,-34.926"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path196" /></g><g
+         id="g198"
+         transform="matrix(0.00430125,1,-1,0.00430125,0,0)"><path
+           d="m 472.601,-452.213 -11.15,-4.103 11.15,-4.097 c -1.783,2.419 -1.77,5.731 0,8.2 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637789;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path200" /></g><g
+         id="g202"><path
+           d="m 87.824,419.742 h 221.25 v 71.25 H 87.824 Z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path204" /></g><text
+         transform="translate(104.70609,437.78828)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text208"><tspan
+           x="0 6.6719942 9.3359919 16.007986 22.679981 26.003979 29.999975 41.099964 47.771961 50.435959 57.107952 63.779945 67.103943 70.42794 79.75193 86.423927 90.419922 97.091919 103.76392 110.43591 117.1079 120.4319 129.09589 135.76788 138.43188 141.09589 147.76788 153.76787 157.09187 163.76387 167.75986 171.08386 174.40785 181.07985"
+           y="0"
+           id="tspan206">Light-Weight Garbage Collector for</tspan></text><g
+         id="g210"><path
+           d="M 308.324,463.992 H 87.074"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path212" /></g><text
+         transform="translate(96.552762,481.37661)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text216"><tspan
+           x="0 6.9959941 10.319991 18.983984 26.975977"
+           y="0"
+           id="tspan214">+ NBS</tspan></text><text
+         transform="translate(99.538145,452.78837)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text220"><tspan
+           x="0 8.6639929 15.335987 22.007982 26.003979 33.995972 36.659969 43.331963 49.331959 55.331955 57.995953 64.667946 71.339943 74.66394 82.65593 88.65593 95.327919 101.32792 107.99991 111.9959 118.6679 125.3399 128.00389 134.00389 140.67589 143.99988 146.66388 153.33588 160.00787 163.33186 167.32787 175.99185 183.98384 191.97585"
+           y="0"
+           id="tspan218">Non-Blocking Synchronization (NBS)</tspan></text><g
+         id="g222"><path
+           d="m 201.074,512.738 v -18.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path224" /></g><g
+         id="g226"
+         transform="rotate(90)"><path
+           d="m 502.887,-196.957 -11.149,-4.102 11.149,-4.101 c -1.782,2.422 -1.77,5.734 0,8.203 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path228" /></g><g
+         id="g230"><path
+           d="m 510.824,511.992 h 22.5 v -457.5"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path232" /></g><g
+         id="g234"><path
+           d="m 117.074,256.992 h 348.75 v 101.25 h -348.75 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path236" /></g><g
+         id="g238"><path
+           d="M 465.824,283.242 H 117.074"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path240" /></g><text
+         transform="translate(126.03232,299.97212)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text244"><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 32.327972 38.999966 45.671963 49.667957 55.667953 58.991951 61.655949 68.327942 74.327934 76.991936 83.663933 90.335922 97.007919 100.33192 106.33191 113.00391 122.9999 129.67189 132.9959 138.99588 145.66788 149.66388 152.98787 156.31187 162.98387 166.30786 169.63185 175.63185 182.30385 188.97585 195.64784 201.64783 208.31982 214.99182 218.31581 221.63982 228.31181 234.98381 241.65579 245.65179 252.32379 255.64778 258.3118 264.98376"
+           y="0"
+           id="tspan242">+ Readers include some sort of snapshot operation</tspan></text><text
+         transform="translate(176.78814,275.78786)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text248"><tspan
+           x="0 9.3239918 15.995987 22.66798 28.667976 31.331974 34.655972 44.651962 51.323956 53.987953 57.311951 59.975948 63.971947 71.30394 77.975937 81.971931 87.971924 90.635925 97.307922 103.97991 107.30391 115.9679 122.6399 129.31189 135.31189 137.97589 143.97588 147.29988 153.97188 160.64386 166.64386 172.64386 175.96785 184.63185 191.30383 197.97583 201.29984 205.29582 211.96782"
+           y="0"
+           id="tspan246">Quasi Multi-Version Consistency Control</tspan></text><text
+         transform="translate(126.03232,315.45707)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text252"><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 32.327972 38.327969 41.651966 45.647961 52.319958 54.983955 61.655949 64.979942 70.979942 74.30394 80.975929 87.647926 90.971924 94.967918 101.63992 108.31191 114.9839 121.6559 125.65189 131.65189 134.97589 141.64789 148.31987 154.99187 158.31587 166.97986 170.97586 173.63986 176.96385 183.63585 187.63185 193.63184"
+           y="0"
+           id="tspan250">+ Constraints on readers and writers:</tspan></text><text
+         transform="translate(126.03232,330.45736)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text256"><tspan
+           x="0"
+           y="0"
+           id="tspan254">+</tspan></text><text
+         transform="translate(136.36412,330.45736)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text260"><tspan
+           x="0 3.9959967 10.667991 14.663988 17.987986 23.98798 26.651978 33.323971 39.995968 42.659966 49.331959 52.655956 59.32795 65.999947 68.66394 75.335938 81.33593 84.659927 87.983925 91.307922 95.303917 101.97591 105.97191 109.29591 115.29591 121.9679 128.63989 135.31189 141.98389 148.65587 154.65587 161.32787 164.65186 167.31586 173.98785 179.98785 185.98784 191.98784 195.31184 198.63583 202.63184 209.30383 213.29982 216.62383 222.62381 229.29581 233.29181 239.29179 241.9558 248.62779 255.29979 258.62378 265.29578 271.96777 281.96378 288.63577 295.30774 299.30374 303.29974 309.29974 313.29575"
+           y="0"
+           id="tspan258">(1) single object, (2) sequence locks, (3) version number(s),</tspan></text><text
+         transform="translate(126.03232,345.96556)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text264"><tspan
+           x="0"
+           y="0"
+           id="tspan262">+</tspan></text><text
+         transform="translate(136.36412,345.96556)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text268"><tspan
+           x="0 3.9959967 10.667991 14.663988 17.987986 21.311983 27.311977 33.311974 39.983967 46.65596 53.327957 59.99995 66.671944 69.995941 75.995934 82.667931 89.339928 92.003922 94.667923 101.33991 108.01191 114.68391 121.3559 124.67989 128.00389 134.67589 141.34789 148.01988 151.34387 158.01587 162.01187 165.33586 169.33186 176.00386 179.99985 183.32385 193.31984 199.99184 206.66383 212.66382 215.98782 222.65982 225.98381 232.65581 239.3278 243.32379 246.6478 253.31979 259.99179 266.66379 270.65976 277.33176 284.00375 290.00375 296.67575 303.34775"
+           y="0"
+           id="tspan266">(4) Issaquah challenge, and/or (5) many other approaches</tspan></text><g
+         id="g270"><path
+           d="m 533.227,296.348 h -63.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path272" /></g><g
+         id="g274"><path
+           d="m 478.375,300.465 -11.148,-4.098 11.148,-4.101 c -1.781,2.422 -1.77,5.734 0,8.199 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path276" /></g><g
+         id="g278"><path
+           d="m 117.074,157.992 h 348.75 v 67.5 h -348.75 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path280" /></g><g
+         id="g282"><path
+           d="M 465.824,184.242 H 117.074"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path284" /></g><text
+         transform="translate(126.03232,200.9722)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text288"><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 32.327972 38.999966 45.671963 49.667957 55.667953 58.991951 65.663948 71.66394 74.987938 77.651932 84.323929 90.995926 93.65992 99.65992 102.32391 108.99591 115.6679 122.3399 125.0039 128.3279 134.99989 138.99588 142.31989 148.99188 155.66386 158.32787 164.32787 167.65186 174.32385 180.99585 186.99585 193.66783 200.33983 207.01183 209.67583 212.99982 215.66382 222.33582 229.00781 235.67981 238.3438 241.6678 245.66379 252.33578 255.65979 262.33179 266.32779 272.99979 279.67175 285.67175 292.34375"
+           y="0"
+           id="tspan286">+ Readers as individual or bulk unconditional references</tspan></text><text
+         transform="translate(228.50894,176.78795)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text292"><tspan
+           x="0 9.3239918 15.995987 22.66798 28.667976 31.331974 34.655972 43.319965 49.991959 53.315956 59.987949 63.983948 70.655945 77.327934 83.327934 89.999924 93.323921 101.98792 108.65991 115.3319 122.0039"
+           y="0"
+           id="tspan290">Quasi Reference Count</tspan></text><text
+         transform="translate(126.03232,216.45715)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text296"><tspan
+           x="0 6.9959941 10.319991 19.643984 26.315979 29.639975 32.303974 38.975967 45.647961 52.319958 54.983955 58.307953 64.979942 68.975945 71.639938 78.311935 84.983932 87.647926 94.319923 100.99191 104.31591 107.63991 114.3119 117.6359 124.3079 130.97989 134.97589 138.97188 145.64388 152.31587 154.97987 161.65187 167.65186 170.97586 174.29985 176.96385 183.63585 189.63585 195.63583 198.95984 205.63184 209.62782 212.95183 216.94781 223.61981 226.94382 233.6158 237.6118 244.2838 250.9558 256.95578"
+           y="0"
+           id="tspan294">+ Optional bridging to per-object lock or reference</tspan></text><g
+         id="g298"><path
+           d="M 533.23,196.598 H 469.48"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path300" /></g><g
+         id="g302"><path
+           d="m 478.375,200.715 -11.148,-4.098 11.148,-4.101 c -1.781,2.422 -1.77,5.734 0,8.199 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path304" /></g><g
+         id="g306"><path
+           d="m 117.074,14.738 h 348.75 v 111.004 h -348.75 z"
+           style="fill:none;stroke:#000000;stroke-width:1.13386;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path308" /></g><g
+         id="g310"><path
+           d="M 465.824,40.988 H 117.074"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:1.70079, 1.70079;stroke-dashoffset:0;stroke-opacity:1"
+           id="path312" /></g><text
+         transform="translate(126.03232,57.721457)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text316"><tspan
+           x="0 6.9959941 10.319991 18.983984 25.655979 32.327972 38.999966 45.671963 49.667957 55.667953 58.991951 65.663948 71.66394 74.987938 78.983932 85.65593 92.327927 98.999916 102.99591 109.66791 116.3399 119.0039 125.6759 128.99989 132.9959 139.66788 146.33987 153.01187 159.68387 163.67987 167.67586 176.33986 180.33585 182.99985 186.32384 192.99583 196.99184 200.31583 202.97983 209.65182 215.65182"
+           y="0"
+           id="tspan314">+ Readers as read-held reader-writer lock</tspan></text><text
+         transform="translate(228.50894,33.537199)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text320"><tspan
+           x="0 9.3239918 15.995987 22.66798 28.667976 31.331974 34.655972 43.319965 49.991959 56.663952 63.335949 70.007942 74.003937 77.999931 89.099922 93.095924 95.759918 99.083916 105.75591 109.75191 113.0759 119.7479 126.41989 132.41989"
+           y="0"
+           id="tspan318">Quasi Reader-Writer Lock</tspan></text><text
+         transform="translate(126.03232,73.206405)"
+         style="font-variant:normal;font-weight:normal;font-size:12px;font-family:'Liberation Sans';-inkscape-font-specification:LiberationSans;writing-mode:lr-tb;fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke:none"
+         id="text330"><tspan
+           x="0 6.9959941 10.319991 18.311985 24.983978 31.655973 34.979969 37.64397 44.315964 46.979961 50.303959 56.975952 62.975948 66.299942 74.963936 81.635933 84.299927 86.963928 90.287926 96.959923 102.95992 106.28391 109.60791 116.2799 126.27589 132.94789 139.61989 143.61588 150.28787 152.95187 156.27586 162.27586 168.27586 174.94786 180.94785 187.61984 191.61584 198.28784 204.95982 207.62383 213.62383 220.29582 223.61981 226.28381 232.95581"
+           y="0"
+           id="tspan322">+ Spatial as well as temporal synchronization</tspan><tspan
+           x="0 6.9959941 10.319991 19.643984 26.315979 29.639975 32.303974 38.975967 45.647961 52.319958 54.983955 58.307953 62.303947 68.975945 75.647934 82.319931 86.315926 89.639923 96.31192 100.30791 108.97191 112.9679 115.6319 118.9559 125.62789 128.95189 135.62389 142.29588 148.96788 152.96387 159.63586 166.30786"
+           y="14.250372"
+           id="tspan324">+ Optional read-to-write upgrade</tspan><tspan
+           x="0 6.9959941 10.319991 19.643984 26.315979 29.639975 32.303974 38.975967 45.647961 52.319958 54.983955 58.307953 64.979942 68.975945 71.639938 78.311935 84.983932 87.647926 94.319923 100.99191 104.31591 107.63991 114.3119 117.6359 124.3079 130.97989 134.97589 138.97188 145.64388 152.31587 154.97987 161.65187 167.65186 170.97586 174.29985 176.96385 183.63585 189.63585 195.63583 198.95984 205.63184 209.62782 212.95183 216.94781 223.61981 226.94382 233.6158 237.6118 244.2838 250.9558 256.95578"
+           y="28.501717"
+           id="tspan326">+ Optional bridging to per-object lock or reference</tspan><tspan
+           x="0 6.9959941 10.319991 19.643984 26.315979 29.639975 32.303974 38.975967 45.647961 52.319958 54.983955 57.647953 63.647945 66.971947 69.635941 76.307938 82.979927 89.651924 93.647919 100.31992 103.64391 110.31591 116.9879 119.6519 126.3239 129.64789 136.31989 142.99188 146.31587 152.98787 159.65987 162.32387 168.99586 174.99585 178.31985"
+           y="44.254463"
+           id="tspan328">+ Optionally ignore deleted objects</tspan></text><g
+         id="g332"><path
+           d="m 533.324,54.492 h -63.75"
+           style="fill:none;stroke:#000000;stroke-width:1.70079;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path334" /></g><g
+         id="g336"><path
+           d="m 478.473,58.605 -11.149,-4.097 11.149,-4.102 c -1.782,2.422 -1.77,5.735 0,8.199 z"
+           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.637795;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id="path338" /></g></g></g></svg>

base-commit: f745edee12b74f0c532c9753ebff5ef03572fc83
-- 
2.17.1

