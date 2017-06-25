Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zyTdAILhayGROHjebLdiBl6ScIPv6OHnrGlupRzHYTk=;
 b=q2dT11i6WpXJQzMdoVdcyLB6V7vA7azC2LLZaPi6Yj4aO/KsiG1s8hKjLZeaPSMF7/
 NviHlLaxqVZGBhMg8EKQBZeyvAzfIF9w+f6SL5nTrqKT/z0aRE+JgM4pPVzR4zLhMC+R
 xSuIVzNIke6gmWZuXcgw8rqV48R70kZzEks8NOm48O3DiSoc8tn15EyBCWtAxh5XG1am
 cxfZ2bkjbX8bWjr/gs+2Vrb18dYtE1sQUdqTF22O1zbBZs/pCpfTWUhoAjHXarEFBGPp
 zpNLy5yidJ9BE8Th8d/vt5Ugvbows47YgcH92yACvezjEMuD7OWSaJMQ9Bkfj3uwsO3L
 sAqw==
Subject: [PATCH 2/5] treewide: Add whitespace before SI unit symbols in
 figures
References: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <889d36c7-7d5a-fdf0-04a7-dd2cacd9d173@gmail.com>
Date: Sun, 25 Jun 2017 09:04:06 +0900
MIME-Version: 1.0
In-Reply-To: <69a63f84-0f40-1194-3770-e4074897388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 01cf06395e90583eb8ddbeb1407362fd96618b96 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Jun 2017 19:38:12 +0900
Subject: [PATCH 2/5] treewide: Add whitespace before SI unit symbols in figures

Those in .fig and .svg can be edited directly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/SystemArch.fig |  2 +-
 rt/rt-regimes.svg  | 66 +++++++++++++++++++++++++++---------------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/cpu/SystemArch.fig b/cpu/SystemArch.fig
index 5b46d33..0860be5 100644
--- a/cpu/SystemArch.fig
+++ b/cpu/SystemArch.fig
@@ -148,5 +148,5 @@ Single
 4 1 0 50 -1 16 9 0.0000 4 150 555 375 1200 Memory\001
 4 1 0 50 -1 16 9 0.0000 4 150 555 3225 1200 Memory\001
 4 1 0 50 -1 16 9 0.0000 4 150 3255 1800 2850 Speed-of-Light Round-Trip Distance in Vacuum\001
-4 1 0 50 -1 16 9 0.0000 4 150 2175 1800 3045 for 1.8GHz Clock Period (8cm)\001
+4 1 0 50 -1 16 9 0.0000 4 150 2175 1800 3045 for 1.8 GHz Clock Period (8 cm)\001
 4 1 0 50 -1 16 9 0.0000 4 150 1440 1800 1200 System Interconnect\001
diff --git a/rt/rt-regimes.svg b/rt/rt-regimes.svg
index c162bc2..79f008d 100644
--- a/rt/rt-regimes.svg
+++ b/rt/rt-regimes.svg
@@ -126,124 +126,124 @@
     <text
        xml:space="preserve"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
-       x="8420.4551"
+       x="8393.7285"
        y="3593.3965"
        id="text3849"
        sodipodi:linespacing="125%"><tspan
          sodipodi:role="line"
          id="tspan3851"
-         x="8420.4551"
-         y="3593.3965">1s</tspan></text>
+         x="8393.7285"
+         y="3593.3965">1 s</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text3853"
        y="4127.9331"
-       x="8368.3584"
+       x="8341.6318"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
        xml:space="preserve"><tspan
          y="4127.9331"
-         x="8368.3584"
+         x="8341.6318"
          id="tspan3855"
-         sodipodi:role="line">1ms</tspan></text>
+         sodipodi:role="line">1 ms</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text3861"
        y="3967.9194"
-       x="8341.6318"
+       x="8314.9053"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
        xml:space="preserve"><tspan
          y="3967.9194"
-         x="8341.6318"
+         x="8314.9053"
          id="tspan3863"
-         sodipodi:role="line">10ms</tspan></text>
+         sodipodi:role="line">10 ms</tspan></text>
     <text
        xml:space="preserve"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
-       x="8314.9053"
+       x="8288.1787"
        y="3807.2112"
        id="text3865"
        sodipodi:linespacing="125%"><tspan
          sodipodi:role="line"
          id="tspan3867"
-         x="8314.9053"
-         y="3807.2112">100ms</tspan></text>
+         x="8288.1787"
+         y="3807.2112">100 ms</tspan></text>
     <text
        xml:space="preserve"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
-       x="8386.5244"
+       x="8359.7979"
        y="4715.9282"
        id="text3869"
        sodipodi:linespacing="125%"><tspan
          sodipodi:role="line"
          id="tspan3871"
-         x="8386.5244"
-         y="4715.9282">1us</tspan></text>
+         x="8359.7979"
+         y="4715.9282">1 us</tspan></text>
     <text
        xml:space="preserve"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
-       x="8359.7979"
+       x="8333.0713"
        y="4555.9136"
        id="text3873"
        sodipodi:linespacing="125%"><tspan
          sodipodi:role="line"
          id="tspan3875"
-         x="8359.7979"
-         y="4555.9136">10us</tspan></text>
+         x="8333.0713"
+         y="4555.9136">10 us</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text3877"
        y="4395.2036"
-       x="8333.0713"
+       x="8306.3447"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
        xml:space="preserve"><tspan
          y="4395.2036"
-         x="8333.0713"
+         x="8306.3447"
          id="tspan3879"
-         sodipodi:role="line">100us</tspan></text>
+         sodipodi:role="line">100 us</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text3881"
        y="5277.1963"
-       x="8386.5244"
+       x="8359.7979"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
        xml:space="preserve"><tspan
          y="5277.1963"
-         x="8386.5244"
+         x="8359.7979"
          id="tspan3883"
-         sodipodi:role="line">1ns</tspan></text>
+         sodipodi:role="line">1 ns</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text3885"
        y="5117.1816"
-       x="8359.7979"
+       x="8333.0713"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
        xml:space="preserve"><tspan
          y="5117.1816"
-         x="8359.7979"
+         x="8333.0713"
          id="tspan3887"
-         sodipodi:role="line">10ns</tspan></text>
+         sodipodi:role="line">10 ns</tspan></text>
     <text
        xml:space="preserve"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
-       x="8333.0713"
+       x="8306.3447"
        y="4956.4717"
        id="text3889"
        sodipodi:linespacing="125%"><tspan
          sodipodi:role="line"
          id="tspan3891"
-         x="8333.0713"
-         y="4956.4717">100ns</tspan></text>
+         x="8306.3447"
+         y="4956.4717">100 ns</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text3893"
        y="5517.7397"
-       x="8333.0713"
+       x="8306.3447"
        style="font-size:106.90753174px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
        xml:space="preserve"><tspan
          y="5517.7397"
-         x="8333.0713"
+         x="8306.3447"
          id="tspan3895"
-         sodipodi:role="line">100ps</tspan></text>
+         sodipodi:role="line">100 ps</tspan></text>
     <text
        xml:space="preserve"
        style="font-size:10px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Symbol;-inkscape-font-specification:Symbol"
-- 
2.7.4


