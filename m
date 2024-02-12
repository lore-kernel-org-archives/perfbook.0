Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13D25761
	for <perfbook@vger.kernel.org>; Mon, 12 Feb 2024 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707731979; cv=none; b=q9/EqUY4ESu5abpdfxIdMckncaQHua8UkWpKLho5nM3x7Uo5aMoVdoBDb32Rd0gCmlT0KZ/gq2E2NyLBE2XWGBwk2rG2Id4LlODKLcIZR+ZgDd68WzhfnEI7Ve19otdnRSDhJIRpIJyO8p8qAgiOlDmhAitbyjs4ietTldO4JL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707731979; c=relaxed/simple;
	bh=9phgxwoFNj3XTXwd2QNMZCgCDtbFF5eyzlOAtytbBK4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=avogqU7CkeTBWG2cSsJtwwrscAuYu6uZMJVSOlMbULoVyWq7wOnnmC4gRc10YYgs/KOZeo1/awR1wMtjaWOO/EExFn39dOKhevs39aOI01UM7GcXU1wdG/mm+IT9TeKxn9dg1mznVNrjJzWkgPtW+piQTl9+AslzXyn4uf+h100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzdB9y/r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzdB9y/r"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d94323d547so25812515ad.3
        for <perfbook@vger.kernel.org>; Mon, 12 Feb 2024 01:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707731977; x=1708336777; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=031Ak2uaC0KthyTxV4HRbibedkBLLYAJR4gFt61U2Dc=;
        b=VzdB9y/rN7WSlrwTQ6KbQ29jts1WMSfInMz4O3Te8NitggX4SlZbUAHBNSbwFKh4K9
         Gq0/981oglVv6ouY7niA5ZVulJ+5KeugEBXLlU8Ki8wJJrNEwZfE14ZEO7Dq9vHuoFTr
         HwlLdvZ7TMmHJaHLpcH2odwNh+x/kmDIrQfopdIePSFn9E15p1mqw9vBH0zwVF8VFYGz
         bCSCBf547DO4zYKx7BL2Meu4Fs8PwiNy9pvdqaruNB9d+N1rkv6v6zO+zvpHoDah3pz4
         knDlkXt+tqNefPVnuBAduyYgfPizLyLl9INk+EVQexejJiwehI35Sq4r11mAKovCM5nc
         sFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731977; x=1708336777;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=031Ak2uaC0KthyTxV4HRbibedkBLLYAJR4gFt61U2Dc=;
        b=aDnflBmnTGqJ039WB1M5ogkiuNangEirmm2d8lc3uvZMTajEQLtTofQvJlT0C5lJGY
         leOdxMWI2PkmvPWdssKErcGWPpzq6fgeucRngBtxdqHzBWCVpLfNeJgIVSJHaKYirDvZ
         btWQKSPsRaa4P2LZClhlx8nKi96IKMWSMDQQe/Moy6SJCvAXHgYT/BrFu/d4vFsq/SQ+
         JeOcspTJfB4Dg2l8vb2UXyCCi61kvBg6Sbha4/gkPtSHtxmDfMnNyfKmG/Qj+LC/erbG
         /V3qqAo+N/bB2HzCAvxXNmc4EMLJhTrrx2cDMqG3riJp2KY12eSUA0jtdIbkdx9hQW9p
         nRog==
X-Gm-Message-State: AOJu0YxLpzw259AHDNBJmveg1+VLaCYMVFp/odnaqIJpYS90Q2R5/kz0
	9H+JvAV3hKbW2eH2/OWClfzBq+iw6G0P3lzbectkA/ie7OnPLuZ2
X-Google-Smtp-Source: AGHT+IGmNAZXRT97gESZNT06Zd3DzBlD4db+iu7dCHst8OpfeBvReOHBU/HXcZJcZfl+uYkRLQHVHg==
X-Received: by 2002:a17:902:e74d:b0:1d9:a2d3:812a with SMTP id p13-20020a170902e74d00b001d9a2d3812amr6054615plf.56.1707731976697;
        Mon, 12 Feb 2024 01:59:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr+mq85RsQYOW/3JjNsUvQno87GDkpBSfv6zlIRk2AlNfkFEEeL8kQvNj1aME58jwsLowZN91jldbDxwNkBbSi
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ecd100b001d8f251c8b2sm13987plh.221.2024.02.12.01.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:59:36 -0800 (PST)
Message-ID: <f5db6884-b08d-4823-baf2-fba5d87b28b6@gmail.com>
Date: Mon, 12 Feb 2024 18:59:34 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] memorder: Retouch co-, fr-, and rf-hopes.svg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These SGVs have bi-directional arrows which cause Ubuntu 20.04's
inkscape 0.92.5 to crash.

As workarounds, replace them with the ones which are safe in the
old version of inkscape.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/co-hopes.svg | 80 +++++++++++++++++++++++++++++++------------
 memorder/fr-hopes.svg | 80 +++++++++++++++++++++++++++++++------------
 memorder/rf-hopes.svg | 80 +++++++++++++++++++++++++++++++------------
 3 files changed, 174 insertions(+), 66 deletions(-)

diff --git a/memorder/co-hopes.svg b/memorder/co-hopes.svg
index 8c465939..e8d40a76 100644
--- a/memorder/co-hopes.svg
+++ b/memorder/co-hopes.svg
@@ -10,7 +10,7 @@
    viewBox="0 0 343.3322 260.03502"
    id="svg2"
    version="1.1"
-   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
+   inkscape:version="1.3.2 (091e20e, 2023-11-25)"
    sodipodi:docname="co-hopes.svg"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
@@ -228,6 +228,44 @@
          transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
          inkscape:connector-curvature="0" />
     </marker>
+    <marker
+       style="overflow:visible"
+       id="ConcaveTriangle-3"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Concave triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.7)"
+         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         id="path7-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="ConcaveTriangle-3-8"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Concave triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.7)"
+         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         id="path7-7-9" />
+    </marker>
   </defs>
   <sodipodi:namedview
      pagecolor="#ffffff"
@@ -238,22 +276,24 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2245"
-     inkscape:window-height="1528"
+     inkscape:window-width="1850"
+     inkscape:window-height="1009"
      id="namedview88"
      showgrid="false"
      fit-margin-left="5"
      fit-margin-top="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     inkscape:zoom="1.8568507"
-     inkscape:cx="332.28304"
-     inkscape:cy="279.77478"
-     inkscape:window-x="523"
-     inkscape:window-y="318"
-     inkscape:window-maximized="0"
+     inkscape:zoom="3.7137014"
+     inkscape:cx="175.96999"
+     inkscape:cy="131.53992"
+     inkscape:window-x="70"
+     inkscape:window-y="34"
+     inkscape:window-maximized="1"
      inkscape:current-layer="svg2"
-     inkscape:pagecheckerboard="0" />
+     inkscape:pagecheckerboard="0"
+     inkscape:showpageshadow="2"
+     inkscape:deskcolor="#d1d1d1" />
   <path
      style="fill:none;stroke:#000000;stroke-width:1.60492;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Lend-32)"
      d="m 52.826274,238.12321 283.686986,0.883"
@@ -494,12 +534,6 @@
      id="path3011-5-3"
      inkscape:connector-curvature="0"
      sodipodi:nodetypes="cc" />
-  <path
-     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart);marker-end:url(#Arrow2Lend-3)"
-     d="m 110.85867,88.312174 -22.669423,0.20855"
-     id="path3011-3"
-     inkscape:connector-curvature="0"
-     sodipodi:nodetypes="cc" />
   <text
      xml:space="preserve"
      style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
@@ -522,12 +556,6 @@
        x="84.749611"
        y="169.91011"
        style="font-size:9.62954px;line-height:1.25;font-family:sans-serif">co</tspan></text>
-  <path
-     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart-7);marker-end:url(#Arrow2Lend-3-7)"
-     d="m 161.81454,178.4363 -49.07457,0.0506"
-     id="path3011-3-0"
-     inkscape:connector-curvature="0"
-     sodipodi:nodetypes="cc" />
   <path
      style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow2Lend-98-4)"
      d="M 192.47764,168.99739 235.90688,67.014124"
@@ -568,4 +596,12 @@
        x="24.576328"
        y="196.10069"
        style="font-weight:bold;font-size:12.0492px;line-height:1.25;font-family:sans-serif;fill:#020000;fill-opacity:1">CPU 2</tspan></text>
+  <path
+     style="fill:none;stroke:#000000;stroke-width:0.627991px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3);marker-end:url(#ConcaveTriangle-3)"
+     d="m 90.963672,88.008382 c 17.972248,0 17.972248,0 17.972248,0 v 0"
+     id="path3" />
+  <path
+     style="fill:none;stroke:#000000;stroke-width:0.907462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8);marker-end:url(#ConcaveTriangle-3-8)"
+     d="m 118.52762,177.53124 c 37.52759,0 37.52759,0 37.52759,0 v 0"
+     id="path2-6" />
 </svg>
diff --git a/memorder/fr-hopes.svg b/memorder/fr-hopes.svg
index e925a409..c77626f1 100644
--- a/memorder/fr-hopes.svg
+++ b/memorder/fr-hopes.svg
@@ -10,7 +10,7 @@
    viewBox="0 0 272.95364 262.96874"
    id="svg2"
    version="1.1"
-   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
+   inkscape:version="1.3.2 (091e20e, 2023-11-25)"
    sodipodi:docname="fr-hopes.svg"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
@@ -256,6 +256,44 @@
          transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
          inkscape:connector-curvature="0" />
     </marker>
+    <marker
+       style="overflow:visible"
+       id="ConcaveTriangle-3-8"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Concave triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.7)"
+         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         id="path7-7-9" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="ConcaveTriangle-3-8-3"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Concave triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.7)"
+         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         id="path7-7-9-6" />
+    </marker>
   </defs>
   <sodipodi:namedview
      pagecolor="#ffffff"
@@ -266,22 +304,24 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2245"
-     inkscape:window-height="1528"
+     inkscape:window-width="1850"
+     inkscape:window-height="1009"
      id="namedview88"
      showgrid="false"
      fit-margin-left="5"
      fit-margin-top="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     inkscape:zoom="1.8568507"
-     inkscape:cx="331.20595"
-     inkscape:cy="235.61399"
-     inkscape:window-x="523"
-     inkscape:window-y="318"
-     inkscape:window-maximized="0"
+     inkscape:zoom="5.2519669"
+     inkscape:cx="112.52927"
+     inkscape:cy="138.51953"
+     inkscape:window-x="70"
+     inkscape:window-y="34"
+     inkscape:window-maximized="1"
      inkscape:current-layer="svg2"
-     inkscape:pagecheckerboard="0" />
+     inkscape:pagecheckerboard="0"
+     inkscape:showpageshadow="2"
+     inkscape:deskcolor="#d1d1d1" />
   <g
      id="g28235"
      transform="translate(9.4514979,85.433725)">
@@ -483,12 +523,6 @@
      id="path3011-5-3"
      inkscape:connector-curvature="0"
      sodipodi:nodetypes="cc" />
-  <path
-     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart);marker-end:url(#Arrow2Lend-3)"
-     d="m 109.58386,89.370899 -22.669422,0.20855"
-     id="path3011-3"
-     inkscape:connector-curvature="0"
-     sodipodi:nodetypes="cc" />
   <text
      xml:space="preserve"
      style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
@@ -500,12 +534,6 @@
        x="135.37384"
        y="192.42451"
        style="font-size:9.62954px;line-height:1.25;font-family:sans-serif">-t</tspan></text>
-  <path
-     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart-7);marker-end:url(#Arrow2Lend-3-7)"
-     d="m 160.53973,196.37002 -49.07457,0.0506"
-     id="path3011-3-0"
-     inkscape:connector-curvature="0"
-     sodipodi:nodetypes="cc" />
   <path
      style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow2Lend-98-4)"
      d="M 161.12053,175.02377 111.39632,149.47465"
@@ -579,4 +607,12 @@
        x="24.576328"
        y="200.90344"
        style="font-weight:bold;font-size:12.0492px;line-height:1.25;font-family:sans-serif;fill:#020000;fill-opacity:1">CPU 2</tspan></text>
+  <path
+     style="fill:none;stroke:#000000;stroke-width:0.907462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8);marker-end:url(#ConcaveTriangle-3-8)"
+     d="m 117.81815,197.54089 c 37.52759,0 37.52759,0 37.52759,0 v 0"
+     id="path2-6" />
+  <path
+     style="fill:none;stroke:#000000;stroke-width:0.61668px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8-3);marker-end:url(#ConcaveTriangle-3-8-3)"
+     d="m 89.875692,86.068108 c 17.330588,0 17.330588,0 17.330588,0 v 0"
+     id="path2-6-7" />
 </svg>
diff --git a/memorder/rf-hopes.svg b/memorder/rf-hopes.svg
index 2cbac595..df6849c3 100644
--- a/memorder/rf-hopes.svg
+++ b/memorder/rf-hopes.svg
@@ -10,7 +10,7 @@
    viewBox="0 0 389.50302 242.06765"
    id="svg2"
    version="1.1"
-   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
+   inkscape:version="1.3.2 (091e20e, 2023-11-25)"
    sodipodi:docname="rf-hopes.svg"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
@@ -270,6 +270,44 @@
          transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
          inkscape:connector-curvature="0" />
     </marker>
+    <marker
+       style="overflow:visible"
+       id="ConcaveTriangle-3-8"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Concave triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.7)"
+         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         id="path7-7-9" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="ConcaveTriangle-3-8-3"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Concave triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.7)"
+         d="M -2,-4 9,0 -2,4 c 2,-2.33 2,-5.66 0,-8 z"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         id="path7-7-9-6" />
+    </marker>
   </defs>
   <sodipodi:namedview
      pagecolor="#ffffff"
@@ -280,22 +318,24 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2245"
-     inkscape:window-height="1528"
+     inkscape:window-width="1850"
+     inkscape:window-height="1009"
      id="namedview88"
      showgrid="false"
      fit-margin-left="5"
      fit-margin-top="5"
      fit-margin-right="5"
      fit-margin-bottom="5"
-     inkscape:zoom="1.8568507"
-     inkscape:cx="327.97467"
-     inkscape:cy="213.53359"
-     inkscape:window-x="860"
-     inkscape:window-y="345"
-     inkscape:window-maximized="0"
+     inkscape:zoom="5.2519669"
+     inkscape:cx="168.6035"
+     inkscape:cy="88.443056"
+     inkscape:window-x="70"
+     inkscape:window-y="34"
+     inkscape:window-maximized="1"
      inkscape:current-layer="svg2"
-     inkscape:pagecheckerboard="0" />
+     inkscape:pagecheckerboard="0"
+     inkscape:showpageshadow="2"
+     inkscape:deskcolor="#d1d1d1" />
   <g
      id="g28235"
      transform="translate(126.00079,64.532629)">
@@ -491,12 +531,6 @@
      id="path3011-5-3"
      inkscape:connector-curvature="0"
      sodipodi:nodetypes="cc" />
-  <path
-     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart);marker-end:url(#Arrow2Lend-3)"
-     d="m 166.13315,68.469803 -22.66942,0.20855"
-     id="path3011-3"
-     inkscape:connector-curvature="0"
-     sodipodi:nodetypes="cc" />
   <text
      xml:space="preserve"
      style="font-style:normal;font-weight:normal;line-height:0%;font-family:sans-serif;text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
@@ -508,12 +542,6 @@
        x="202.73589"
        y="165.89842"
        style="font-size:9.62954px;line-height:1.25;font-family:sans-serif">t</tspan></text>
-  <path
-     style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow2Lstart-7);marker-end:url(#Arrow2Lend-3-7)"
-     d="m 237.42132,170.13008 -69.40688,-0.23556"
-     id="path3011-3-0"
-     inkscape:connector-curvature="0"
-     sodipodi:nodetypes="cc" />
   <path
      style="fill:none;stroke:#000000;stroke-width:0.802462px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow2Lend-98-4)"
      d="m 227.17463,128.43082 12.71532,19.87415"
@@ -593,4 +621,12 @@
        x="24.576328"
        y="174.46837"
        style="font-weight:bold;font-size:12.0492px;line-height:1.25;font-family:sans-serif;fill:#020000;fill-opacity:1">CPU 2</tspan></text>
+  <path
+     style="fill:none;stroke:#000000;stroke-width:1.11284px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8);marker-end:url(#ConcaveTriangle-3-8)"
+     d="m 175.6647,171.29089 c 56.43602,0 56.43602,0 56.43602,0 v 0"
+     id="path2-6" />
+  <path
+     style="fill:none;stroke:#000000;stroke-width:0.615678px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#ConcaveTriangle-3-8-3);marker-end:url(#ConcaveTriangle-3-8-3)"
+     d="m 146.43039,65.500188 c 17.27428,0 17.27428,0 17.27428,0 v 0"
+     id="path2-6-7" />
 </svg>

base-commit: cb74c776aa3257249c79e24eb1b93cd7fb22700d
-- 
2.34.1

