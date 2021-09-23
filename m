Return-Path: <SRS0=tc9Q=ON=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qsYVu6Omnb+JNfc/OjtJC4mOPvQcsOdw4z+FUJK9/Ko=;
        b=iws6l1vTm7Yo3TeQWo9GV6ax0yKJTa3eS+dL11H9L1ghBMyDSz15D3FzY6nN9fGKOX
         1UARm6HdAagQK7SHOOxCo96j9x7oQKAS+A1i+n+/9Bus5nDB953Zpnyp1vj3ZZ1G2V1c
         27mzrHVP6BlpPJLpqiyu1hEm5lPZImJ0F7K4tpUwMttW8cZ943T3f/bZZC55gy66EUsw
         AK17gmWnYtE8OnXjiP2FxGyoerHnvqsM2x+URkMVMazvP2p6MlCHVUsfh2IvqPjAMOcy
         ++AyJDmwGBa3hXn/ytVIOKR7dPg9nLcz2y8aF72Nxw0RUJ+fdcN4LsVsjBZ+EK9xf6h7
         pzWA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer: Make RCUspacetime.svg compatible with
 Inkscape 1.0 and later
Message-ID: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
Date: Thu, 23 Sep 2021 12:08:35 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Rotated labels on the "Time" axis of Figure 9.27 are misplaced when
built on Fedora 34 (Inkscape 1.1) and Ubuntu 21.04 (Inkscape 1.0.2).

Update the svg file with the one tweaked by Inkscape 1.1.

It is backward-compatible with Inkscape versions 0.92.3 (Ubuntu 18.04),
0.92.5 (Ubuntu 20.04), and 1.0.2 (Ubuntu 21.04).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Parameters for string rotation from Inkscape 0.92.5 are not handled
as expected by Inkscape >= 1.0.

I've not seen any such breakage in .svg files made by Inkscape 0.92.3
(Ubuntu 18.04).
So this issue might be local to Ubuntu 20.04, but I'm not sure.

Also, it looks like fixsvgfonts.sh and fixsvgfonts-urwps.sh need some
update to catch additional patterns of font specification strings.

I'll post a follow-up patch to update them.

        Thanks, Akira
--
 defer/RCUspacetime.svg | 169 +++++++++++++++++++++--------------------
 1 file changed, 85 insertions(+), 84 deletions(-)

diff --git a/defer/RCUspacetime.svg b/defer/RCUspacetime.svg
index 7f644169..bebd4dc1 100644
--- a/defer/RCUspacetime.svg
+++ b/defer/RCUspacetime.svg
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
    width="262.95599mm"
    height="138.7054mm"
    viewBox="0 0 262.95599 138.7054"
    version="1.1"
    id="svg8"
-   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
-   sodipodi:docname="RCUspacetime.svg">
+   inkscape:version="1.1 (c68e22c387, 2021-05-23)"
+   sodipodi:docname="RCUspacetime.svg"
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
@@ -327,9 +327,9 @@
      borderopacity="1.0"
      inkscape:pageopacity="0.0"
      inkscape:pageshadow="2"
-     inkscape:zoom="3.2570326"
-     inkscape:cx="657.83285"
-     inkscape:cy="262.12044"
+     inkscape:zoom="1.6285163"
+     inkscape:cx="210.92819"
+     inkscape:cy="261.89483"
      inkscape:document-units="mm"
      inkscape:current-layer="layer1"
      showgrid="true"
@@ -337,11 +337,12 @@
      fit-margin-left="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     inkscape:window-width="3786"
-     inkscape:window-height="2096"
-     inkscape:window-x="54"
-     inkscape:window-y="27"
-     inkscape:window-maximized="1">
+     inkscape:window-width="1920"
+     inkscape:window-height="1003"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="1"
+     inkscape:pagecheckerboard="0">
     <inkscape:grid
        type="xygrid"
        id="grid3713"
@@ -356,7 +357,7 @@
         <dc:format>image/svg+xml</dc:format>
         <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
-        <dc:title></dc:title>
+        <dc:title />
       </cc:Work>
     </rdf:RDF>
   </metadata>
@@ -383,7 +384,7 @@
        inkscape:connector-curvature="0" />
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="112.31356"
        y="95.173538"
        id="text3777-5-7-8"><tspan
@@ -391,18 +392,18 @@
          id="tspan3775-5-4-7"
          x="112.31356"
          y="95.173538"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332">rcu_read_lock();</tspan><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">rcu_read_lock();</tspan><tspan
          sodipodi:role="line"
          x="112.31356"
          y="100.4652"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4667">mcp = ...</tspan><tspan
          sodipodi:role="line"
          x="112.31356"
          y="105.75687"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan109">*cur_a = mcp-&gt;a;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
    id="tspan31698"> (5)</tspan></tspan></text>
     <path
        style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3, 3;stroke-dashoffset:0;stroke-opacity:1"
@@ -412,58 +413,58 @@
        sodipodi:nodetypes="cc" />
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="112.31356"
        y="116.07561"
        id="text3777-5-7-8-7"><tspan
          sodipodi:role="line"
          x="112.31356"
          y="116.07561"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan109-4">*cur_b = mcp-&gt;b;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
    id="tspan31700"> (25)</tspan></tspan><tspan
          sodipodi:role="line"
          x="112.31356"
          y="121.36727"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4665">rcu_read_unlock();</tspan></text>
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="186.25475"
        y="100.55408"
        id="text3777-5-7-8-0"><tspan
          sodipodi:role="line"
          x="186.25475"
          y="100.55408"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan109-9">mcp = kmalloc(...)</tspan><tspan
          sodipodi:role="line"
          x="186.25475"
          y="105.84574"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4704">mcp = xchg(&amp;curconfig, mcp);</tspan></text>
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="186.03976"
        y="116.07561"
        id="text3777-5-7-8-0-9"><tspan
          sodipodi:role="line"
          x="186.03976"
          y="116.07561"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4704-8">synchronize_rcu();</tspan><tspan
          sodipodi:role="line"
          x="186.03976"
          y="121.36727"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4729">...</tspan><tspan
          sodipodi:role="line"
          x="186.03976"
          y="126.65894"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4731">...</tspan></text>
     <path
        style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:3.00000003, 3.00000003;stroke-dashoffset:0;stroke-opacity:1"
@@ -473,18 +474,18 @@
        sodipodi:nodetypes="cc" />
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="185.99222"
        y="137.21603"
        id="text3777-5-7-8-0-9-3"><tspan
          sodipodi:role="line"
          x="185.99222"
          y="137.21603"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4731-0">kfree(mcp);</tspan></text>
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="258.63132"
        y="120.48671"
        id="text3777-5-7-8-3"><tspan
@@ -492,36 +493,36 @@
          id="tspan3775-5-4-7-4"
          x="258.63132"
          y="120.48671"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332">rcu_read_lock();</tspan><tspan
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">rcu_read_lock();</tspan><tspan
          sodipodi:role="line"
          x="258.63132"
          y="125.77837"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan109-3">mcp = ...</tspan></text>
     <text
        xml:space="preserve"
-       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="258.51349"
        y="137.14162"
        id="text3777-5-7-8-3-9"><tspan
          sodipodi:role="line"
          x="258.51349"
          y="137.14162"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan109-3-6">*cur_a = mcp-&gt;a;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
    id="tspan31702"> (9)</tspan></tspan><tspan
          sodipodi:role="line"
          x="258.51349"
          y="142.43329"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4832">*cur_b = mcp-&gt;b;<tspan
-   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start"
    id="tspan31704"> (81)</tspan></tspan><tspan
          sodipodi:role="line"
          x="258.51349"
          y="147.72495"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583"
          id="tspan4834">rcu_read_unlock();</tspan></text>
     <g
        id="g4851"
@@ -530,9 +531,9 @@
          id="text4840"
          y="69.432495"
          x="224.24263"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
            y="69.432495"
            x="224.24263"
            id="tspan4838"
@@ -548,9 +549,9 @@
          id="text4844"
          y="69.460396"
          x="221.52756"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
            y="69.460396"
            x="221.52756"
            id="tspan4842"
@@ -563,9 +564,9 @@
          id="text4840-3"
          y="69.432495"
          x="224.24263"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
            y="69.432495"
            x="224.24263"
            id="tspan4838-3"
@@ -581,9 +582,9 @@
          id="text4844-0"
          y="69.460396"
          x="221.56786"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
            y="69.460396"
            x="221.56786"
            id="tspan4842-5"
@@ -596,9 +597,9 @@
          id="text4840-3-0"
          y="69.432495"
          x="225.84267"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
            y="69.432495"
            x="225.84267"
            id="tspan4838-3-4"
@@ -614,9 +615,9 @@
          id="text4844-0-2"
          y="69.288834"
          x="216.34557"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
          xml:space="preserve"><tspan
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.39999998;stroke-miterlimit:4;stroke-dasharray:none"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:monospace;-inkscape-font-specification:'monospace, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:1.4;stroke-miterlimit:4;stroke-dasharray:none"
            y="69.288834"
            x="216.34557"
            id="tspan4842-5-6"
@@ -672,7 +673,7 @@
        sodipodi:nodetypes="cc" />
     <text
        xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="212.72537"
        y="49.614582"
        id="text26915"><tspan
@@ -680,7 +681,7 @@
          id="tspan26913"
          x="212.72537"
          y="49.614582"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111126px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332">Address Space</tspan></text>
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">Address Space</tspan></text>
     <path
        style="fill:none;stroke:#5a5a5a;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Lend-7)"
        d="M 91.281249,39.031252 V 156.77084"
@@ -689,7 +690,7 @@
        sodipodi:nodetypes="cc" />
     <text
        xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
        x="81.756622"
        y="34.797916"
        id="text26915-7"><tspan
@@ -697,7 +698,7 @@
          id="tspan26913-0"
          x="81.756622"
          y="34.797916"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111126px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.26458332">Time</tspan></text>
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:lr-tb;text-anchor:start;stroke-width:0.264583">Time</tspan></text>
     <path
        style="fill:none;stroke:#5a5aff;stroke-width:0.60000003;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:2.40000012,1.20000006,0.60000003,1.20000006;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow2Mend-99-1-4)"
        d="m 87.312503,78.1896 v 51.59375"
@@ -712,56 +713,56 @@
        sodipodi:nodetypes="cc" />
     <text
        xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.26458332"
-       x="-83.891632"
-       y="-95.702042"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-84.219742"
+       y="-96.887878"
        id="text31542"
        transform="scale(-1)"><tspan
          sodipodi:role="line"
          id="tspan31540"
-         x="-95.702042"
-         y="-83.891632"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#5a5aff;fill-opacity:1;stroke-width:0.26458332">Readers</tspan></text>
+         x="-84.219742"
+         y="-96.887878"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#5a5aff;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
     <g
        id="g31594"
-       transform="translate(-8.9958336,0.52916667)">
+       transform="translate(-8.9958336,46.017934)">
       <text
          transform="scale(-1)"
          id="text31542-1"
-         y="-125.84578"
-         x="-76.697754"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         y="-79.621559"
+         x="-77.026497"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
          xml:space="preserve"><tspan
            id="tspan31568"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458332"
-           y="-76.697754"
-           x="-125.84578"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
+           y="-77.026497"
+           x="-79.621559"
            sodipodi:role="line">Grace</tspan></text>
       <text
          transform="scale(-1)"
          id="text31542-1-4"
-         y="-126.25713"
+         y="-80.102051"
          x="-81.724838"
-         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
          xml:space="preserve"><tspan
            id="tspan31568-2"
-           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.26458332"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#000000;fill-opacity:1;stroke-width:0.264583"
            y="-81.724838"
-           x="-126.25713"
+           x="-80.102051"
            sodipodi:role="line">Period</tspan></text>
     </g>
     <text
        xml:space="preserve"
-       style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.26458332"
-       x="-85.631493"
-       y="-150.20815"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#5a5aff;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-85.955162"
+       y="-150.94402"
        id="text31542-2"
        transform="scale(-1)"><tspan
          sodipodi:role="line"
          id="tspan31540-2"
-         x="-150.20815"
-         y="-85.631493"
-         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333311px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#007b00;fill-opacity:1;stroke-width:0.26458332">Readers</tspan></text>
+         x="-85.955162"
+         y="-150.94402"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-feature-settings:normal;text-align:start;writing-mode:tb-rl;text-anchor:start;fill:#007b00;fill-opacity:1;stroke-width:0.264583">Readers</tspan></text>
     <path
        style="fill:none;stroke:#5a5aff;stroke-width:0.60000002;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#Arrow2Mstart);marker-end:url(#Arrow2Mend-99-1-4-0)"
        d="m 77.258344,110.46875 v 18.52083"
-- 
2.17.1

