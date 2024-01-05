Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20E250FF
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck8OebW7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso1033509a12.0
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448479; x=1705053279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQhRalqKbcuh67aB3HW89LGRKatPh92dk/xa8tzZzgE=;
        b=Ck8OebW77u0Vr6o0IWC4+f0PmG1Tst0Go9JouM6Tu2pKZ7o5HIioWfT64rRk6c8mMU
         SKbtQgCj3vZNKfFLQ3fZ8H5keArZO38TWGlDN8QjLuv44ZAK3mJeni6xVwS0ULtc5DVe
         /0+kx9IoaYbjvqMU/iLZwXFjTfLOXc2cr6iLzqYpRS8p3AHumMBMJev2frLI/uScAia4
         wjy2LKEqxyx/6o+364c4YML5jZhPzcJwIY0NPz2AdM7AnCU65sA/NlvZKKdU5LTMIeRn
         k8wmTO2KeD8JWTd1Sh7UrwKK/eVHuVzfZBnDGUzV6/GJVQg1Q8gea17GtFN52uCkw7Yf
         2QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448479; x=1705053279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQhRalqKbcuh67aB3HW89LGRKatPh92dk/xa8tzZzgE=;
        b=RvtBTG/H2f1wBLrshkfYPko5OiF+Lnmr95GQtPgtCoeRFOJ5p8uHfnp526agiD8fwI
         yOc1+AzWMhdn350GEHK/PrnXJ1RZfGa13pbrzd5U1J0R6HQxNSMnRkjTGUXKi4pLcGdl
         fx6WEVNkMQi4xp8JkvdkspaG6NjWHYAjRxw74JanMYfQiEuVDnzLvMfnNFImjNm8BuCv
         0mUKr85/VP3Gvg/eG8USoLDJqDIDT2+9lVHcS2qR5xZgSnZCgkkusHq2gjQVzZapksJ1
         Nk9YFS+kD5kztEwBkFX7Dev4MadSJHUssM3nHntL+n0fzfU6UlOZ3ODgbk54JiSGDgpm
         N6Hg==
X-Gm-Message-State: AOJu0Yz76e2+F9QPZVOuXiezAd/sH6UAcgb6Rd42E3lx4jFtSa8NqKlo
	xIoxK6k8+KP4Z4wnkKAF4ww=
X-Google-Smtp-Source: AGHT+IGzIi83B+j4Gl6LOwadZMUVfzF84zIZ7sjyijD8uxp2BO+9gN3preiWJO6jwYuXxyBQ3f58og==
X-Received: by 2002:a05:6a20:881c:b0:190:85d9:9d49 with SMTP id c28-20020a056a20881c00b0019085d99d49mr1470671pzf.111.1704448479478;
        Fri, 05 Jan 2024 01:54:39 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:54:39 -0800 (PST)
Message-ID: <046793cf-02d7-454c-9f76-d5662f1f6eaa@gmail.com>
Date: Fri, 5 Jan 2024 18:54:38 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/8] cartoons: Retouch r-2014-Memory-barrier.svg
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

r-2014-Memory-barrier.svg was drawn by Inkscape 0.48.3.1.
Recent versions of rsvg-convert have trouble with outlined text
in the cartoon.
Retouch the figure by importing a properly rendered PDF into modern
Inkscape and saving it as r-2023-Memory-barrier.svg.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cartoons/r-2023-Memory-barrier.svg | 1130 ++++++++++++++++++++++++++++
 cpu/overview.tex                   |    2 +-
 2 files changed, 1131 insertions(+), 1 deletion(-)
 create mode 100644 cartoons/r-2023-Memory-barrier.svg

diff --git a/cartoons/r-2023-Memory-barrier.svg b/cartoons/r-2023-Memory-=
barrier.svg
new file mode 100644
index 00000000..bf17f3e0
--- /dev/null
+++ b/cartoons/r-2023-Memory-barrier.svg
@@ -0,0 +1,1130 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   width=3D"107.60958mm"
+   height=3D"106.15136mm"
+   viewBox=3D"0 0 107.60958 106.15136"
+   version=3D"1.1"
+   id=3D"svg5"
+   inkscape:version=3D"1.1.2 (0a00cf5339, 2022-02-04)"
+   sodipodi:docname=3D"r-2023-Memory-barrier.svg"
+   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"=

+   xmlns=3D"http://www.w3.org/2000/svg"
+   xmlns:svg=3D"http://www.w3.org/2000/svg">
+  <sodipodi:namedview
+     id=3D"namedview7"
+     pagecolor=3D"#ffffff"
+     bordercolor=3D"#666666"
+     borderopacity=3D"1.0"
+     inkscape:pageshadow=3D"2"
+     inkscape:pageopacity=3D"0.0"
+     inkscape:pagecheckerboard=3D"0"
+     inkscape:document-units=3D"mm"
+     showgrid=3D"false"
+     inkscape:zoom=3D"1.4609989"
+     inkscape:cx=3D"326.83119"
+     inkscape:cy=3D"269.33628"
+     inkscape:window-width=3D"1850"
+     inkscape:window-height=3D"1009"
+     inkscape:window-x=3D"70"
+     inkscape:window-y=3D"34"
+     inkscape:window-maximized=3D"1"
+     inkscape:current-layer=3D"layer1" />
+  <defs
+     id=3D"defs2" />
+  <g
+     inkscape:label=3D"Layer 1"
+     inkscape:groupmode=3D"layer"
+     id=3D"layer1"
+     transform=3D"translate(-8.3137535,-6.8747199)">
+    <g
+       id=3D"g848"
+       transform=3D"matrix(0.35277777,0,0,0.35277777,6.9953373,5.5544504=
)">
+      <g
+         id=3D"g850">
+        <path
+           d=3D"m 147.367,220.855 -71.926,21.383 70.469,-14.582 -79.215,=
52.489 98.168,-28.188 8.746,32.559 22.844,-29.157 58.317,20.895 -28.188,-=
25.27 57.832,2.43 -52,-20.41 76.297,-12.637 -84.559,-5.344 24.301,-31.105=
 -32.562,18.953"
+           style=3D"fill:#ffffc5;fill-opacity:1;fill-rule:nonzero;stroke=
:#747474;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path852" />
+      </g>
+      <g
+         id=3D"g854"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -193.215,338.583 v 16.554 l 105.649,30.425 42.351,-20.=
606 v -17.371 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path856" />
+      </g>
+      <g
+         id=3D"g858"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -196.445,338.481 106.597,33.264 45.961,-25.072 -110.92=
9,-10.392 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path860" />
+      </g>
+      <g
+         id=3D"g862"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -90.418,365.072 38.113,-17.133 -0.679,-214.99 -54.391,=
27.79 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path864" />
+      </g>
+      <g
+         id=3D"g866"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -189.484,135.564 v 201.698 l 101.66,27.81 V 146.439 Z"=

+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path868" />
+      </g>
+      <g
+         id=3D"g870"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -192.953,118.853 v 16.561 l 105.652,20.803 39.352,-15.=
376 V 123.47 Z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path872" />
+      </g>
+      <g
+         id=3D"g874"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -193.816,120.127 104.234,22.274 41.23,-18.202 -106.203=
,-17.262 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path876" />
+      </g>
+      <g
+         id=3D"g878"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -177.234,174.079 42.519,8.457 V 168.44 l -44.152,-7.32=
7 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path880" />
+      </g>
+      <g
+         id=3D"g882"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -160.062,191.116 42.519,10.541 v -14.096 l -44.152,-9.=
492 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path884" />
+      </g>
+      <g
+         id=3D"g886"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -181.32,200.697 42.519,10.541 v -14.096 l -44.156,-9.4=
85 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path888" />
+      </g>
+      <g
+         id=3D"g890"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -137.168,210.85 42.523,10.534 v -14.095 l -44.156,-9.4=
86 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path892" />
+      </g>
+      <g
+         id=3D"g894"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -162.516,219.301 42.52,10.541 v -14.096 l -44.152,-9.4=
86 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path896" />
+      </g>
+      <g
+         id=3D"g898"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -137.168,167.875 25.352,5.08"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path900" />
+      </g>
+      <g
+         id=3D"g902"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -155.156,163.932 -1.633,-12.965"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path904" />
+      </g>
+      <g
+         id=3D"g906"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -143.707,223.686 -1.637,14.096"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path908" />
+      </g>
+      <g
+         id=3D"g910"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -178.051,230.448 62.961,14.096"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#ffffff;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path912" />
+      </g>
+      <g
+         id=3D"g914"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -59.648,324.583 -18.532,8.457 v -14.089 l 19.242,-7.33=
4 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#a7a7a7;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path916" />
+      </g>
+      <g
+         id=3D"g918"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -67.133,341.62 -18.527,10.541 v -14.095 l 19.242,-9.48=
6 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#a7a7a7;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path920" />
+      </g>
+      <g
+         id=3D"g922"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -77.109,318.386 -11.047,5.073"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#a7a7a7;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path924" />
+      </g>
+      <g
+         id=3D"g926"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -69.27,314.437 0.711,-12.966"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#a7a7a7;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path928" />
+      </g>
+      <g
+         id=3D"g930"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -60.363,296.398 -27.434,14.096"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#a7a7a7;stroke-width:2.97071;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path932" />
+      </g>
+      <g
+         id=3D"g934"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -194.273,337.317 v 16.553 l 105.652,30.425 42.348,-20.=
605 v -17.371 z"
+           style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.990238;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path936" />
+      </g>
+      <g
+         id=3D"g938"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -197.504,337.214 106.598,33.265 45.961,-25.073 -110.93=
,-10.391 z"
+           style=3D"fill:#f2f2f2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.990238;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path940" />
+      </g>
+      <g
+         id=3D"g942"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -91.473,363.806 38.11,-17.133 -0.676,-214.99 -54.395,2=
7.789 z"
+           style=3D"fill:#a02c2c;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.74197;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path944" />
+      </g>
+      <g
+         id=3D"g946"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -190.543,134.297 v 201.698 l 101.66,27.811 V 145.172 Z=
"
+           style=3D"fill:#de8787;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:1.19263;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path948" />
+      </g>
+      <g
+         id=3D"g950"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -194.012,117.587 v 16.561 l 105.653,20.803 39.351,-15.=
376 v -17.371 z"
+           style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.990238;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path952" />
+      </g>
+      <g
+         id=3D"g954"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"M -194.875,118.86 -90.641,141.134 -49.41,122.932 -155.61=
3,105.67 Z"
+           style=3D"fill:#f2f2f2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.990238;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path956" />
+      </g>
+      <g
+         id=3D"g958"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -178.289,172.812 42.519,8.457 v -14.095 l -44.156,-7.3=
27 z"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path960" />
+      </g>
+      <g
+         id=3D"g962"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -161.121,189.849 42.523,10.542 v -14.096 l -44.156,-9.=
493 z"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path964" />
+      </g>
+      <g
+         id=3D"g966"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -182.379,199.437 42.52,10.535 v -14.096 l -44.157,-9.4=
86 z"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path968" />
+      </g>
+      <g
+         id=3D"g970"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -138.223,209.583 42.52,10.535 v -14.089 l -44.156,-9.4=
93 z"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path972" />
+      </g>
+      <g
+         id=3D"g974"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -163.574,218.034 42.523,10.541 V 214.48 l -44.156,-9.4=
86 z"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path976" />
+      </g>
+      <g
+         id=3D"g978"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -138.223,166.615 25.348,5.073"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path980" />
+      </g>
+      <g
+         id=3D"g982"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -156.215,162.666 -1.633,-12.965"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path984" />
+      </g>
+      <g
+         id=3D"g986"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -144.766,222.419 -1.636,14.096"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path988" />
+      </g>
+      <g
+         id=3D"g990"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -179.109,229.181 62.964,14.096"
+           style=3D"fill:none;stroke:#ffffff;stroke-width:1.19263;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path992" />
+      </g>
+      <g
+         id=3D"g994"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -60.707,323.316 -18.527,8.458 v -14.089 l 19.238,-7.33=
4 z"
+           style=3D"fill:none;stroke:#a7a7a7;stroke-width:0.787275;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path996" />
+      </g>
+      <g
+         id=3D"g998"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -68.191,340.36 -18.528,10.535 v -14.096 l 19.242,-9.48=
6 z"
+           style=3D"fill:none;stroke:#a7a7a7;stroke-width:0.787275;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1000" />
+      </g>
+      <g
+         id=3D"g1002"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -78.168,317.119 -11.043,5.074"
+           style=3D"fill:none;stroke:#a7a7a7;stroke-width:0.787275;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1004" />
+      </g>
+      <g
+         id=3D"g1006"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -70.328,313.17 0.715,-12.965"
+           style=3D"fill:none;stroke:#a7a7a7;stroke-width:0.787275;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1008" />
+      </g>
+      <g
+         id=3D"g1010"
+         transform=3D"scale(-1,0.573645)">
+        <path
+           d=3D"m -61.418,295.132 -27.437,14.095"
+           style=3D"fill:none;stroke:#a7a7a7;stroke-width:0.787275;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1012" />
+      </g>
+      <text
+         transform=3D"matrix(0.99843443,-0.12261972,-0.05593468,0.984024=
27,106.35877,103.34223)"
+         style=3D"font-variant:normal;font-weight:bold;font-size:20.7019=
px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSans=
Mono-Bold;writing-mode:lr-tb;fill:#ffffff;fill-opacity:1;fill-rule:nonzer=
o;stroke:none"
+         id=3D"text1016"><tspan
+           x=3D"0 12.007111 24.034922 36.042034 48.069843 60.076954"
+           y=3D"0"
+           sodipodi:role=3D"line"
+           id=3D"tspan1014">Memory</tspan></text>
+      <g
+         id=3D"g1018"
+         transform=3D"matrix(1,-0.122812,-0.0560224,0.985567,0,0)">
+        <path
+           d=3D"m 113.897,103.862 3.546,-0.002 1.793,6.612 1.786,-6.61 3=
=2E578,0.002 0.001,15.077 -2.563,-0.002 -0.004,-12.066 -1.6,6.587 -2.359,=
-0.009 -1.635,-6.577 0.005,12.065 h -2.547 z m 22.246,14.512 c -0.694,0.2=
94 -1.393,0.508 -2.104,0.641 -0.712,0.134 -1.465,0.206 -2.254,0.211 -1.89=
9,-0.003 -3.341,-0.504 -4.335,-1.507 -0.994,-1.012 -1.493,-2.469 -1.495,-=
4.372 -0.001,-1.847 0.479,-3.309 1.442,-4.386 0.96,-1.074 2.273,-1.612 3.=
941,-1.618 1.676,0.011 2.974,0.509 3.896,1.5 0.919,0.995 1.377,2.399 1.37=
7,4.215 l 0.004,1.189 -7.656,-0.003 c -0.005,0.888 0.251,1.554 0.768,1.99=
9 0.525,0.437 1.302,0.653 2.334,0.655 0.675,0.001 1.342,-0.094 1.999,-0.2=
9 0.664,-0.202 1.362,-0.512 2.089,-0.929 z m -2.496,-6.352 c -0.013,-0.78=
2 -0.218,-1.374 -0.615,-1.773 -0.39,-0.397 -0.955,-0.594 -1.705,-0.593 -0=
=2E688,0.002 -1.235,0.207 -1.637,0.621 -0.395,0.418 -0.627,1.008 -0.698,1=
=2E768 z m 10.333,-3.25 c 0.224,-0.48 0.505,-0.833 0.847,-1.068 0.35,-0.2=
3 0.777,-0.347 1.277,-0.348 0.976,-0.005 1.648,0.332 2.01,1.011 0.37,0.67=
3 0.557,2.068 0.563,4.193 l -0.002,6.373 -2.407,10e-4 v -7.261 c 0.003,-0=
=2E844 -0.059,-1.403 -0.188,-1.672 -0.132,-0.278 -0.367,-0.419 -0.711,-0.=
422 -0.335,0.002 -0.57,0.147 -0.71,0.435 -0.14,0.28 -0.211,0.83 -0.204,1.=
655 l 10e-4,7.261 -2.391,0.003 v -7.261 c -0.007,-0.825 -0.073,-1.376 -0.=
203,-1.658 -0.132,-0.278 -0.363,-0.426 -0.696,-0.435 -0.344,0 -0.582,0.14=
1 -0.711,0.418 -0.121,0.271 -0.184,0.83 -0.187,1.673 v 7.261 l -2.421,0.0=
16 0.008,-11.303 2.156,-0.001 -0.013,1.172 c 0.163,-0.444 0.429,-0.795 0.=
801,-1.058 0.379,-0.27 0.797,-0.4 1.258,-0.398 0.445,-0.008 0.859,0.131 1=
=2E242,0.409 0.378,0.269 0.604,0.606 0.681,1.004 z m 11.256,1.002 c -0.69=
9,0 -1.256,0.311 -1.667,0.934 -0.414,0.614 -0.62,1.476 -0.62,2.586 -0.001=
,1.11 0.204,1.976 0.614,2.597 0.418,0.623 0.978,0.939 1.677,0.939 0.708,0=
=2E005 1.264,-0.307 1.667,-0.934 0.402,-0.624 0.604,-1.494 0.604,-2.604 0=
,-1.11 -0.204,-1.968 -0.613,-2.581 -0.402,-0.621 -0.955,-0.932 -1.662,-0.=
937 z m -5.225,3.519 c -0.001,-1.828 0.473,-3.275 1.413,-4.343 0.948,-1.0=
63 2.223,-1.597 3.817,-1.601 1.601,0.002 2.873,0.533 3.808,1.6 0.943,1.06=
9 1.414,2.519 1.415,4.346 -0.003,1.819 -0.473,3.263 -1.414,4.327 -0.94,1.=
067 -2.215,1.602 -3.816,1.601 -1.594,0.003 -2.866,-0.532 -3.809,-1.6 -0.9=
46,-1.07 -1.418,-2.512 -1.414,-4.33 z m 22.604,-2.53 c -0.309,-0.3 -0.681=
,-0.521 -1.115,-0.662 -0.438,-0.15 -0.911,-0.225 -1.419,-0.225 -0.637,-0.=
004 -1.189,0.102 -1.654,0.317 -0.468,0.219 -0.829,0.539 -1.087,0.959 -0.1=
66,0.245 -0.277,0.552 -0.339,0.925 -0.065,0.364 -0.097,0.915 -0.094,1.652=
 l -0.005,5.216 -2.953,-0.004 0.007,-11.303 2.953,0.004 -0.011,1.742 c 0.=
295,-0.649 0.74,-1.148 1.337,-1.498 0.605,-0.356 1.306,-0.534 2.111,-0.52=
9 0.395,-0.003 0.784,0.05 1.166,0.161 0.388,0.104 0.756,0.245 1.101,0.422=
 z m 7.59,9.407 c -0.41,1.059 -0.894,1.827 -1.449,2.309 -0.547,0.491 -1.2=
2,0.74 -2.021,0.747 l -2.437,-0.003 -0.001,-2.251 1.202,-0.009 c 0.602,0 =
1.045,-0.103 1.327,-0.31 0.278,-0.199 0.563,-0.675 0.857,-1.431 l 0.233,-=
0.589 -4.304,-11 3.11,0.007 2.566,7.327 2.496,-7.33 3.094,0.005 z"
+           style=3D"fill:none;stroke:#000000;stroke-width:1.89531;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path1020" />
+      </g>
+      <text
+         transform=3D"matrix(0.99843443,-0.12261972,-0.05593468,0.984024=
27,98.913462,129.54535)"
+         style=3D"font-variant:normal;font-weight:bold;font-size:20.7019=
px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSans=
Mono-Bold;writing-mode:lr-tb;fill:#ffffff;fill-opacity:1;fill-rule:nonzer=
o;stroke:none"
+         id=3D"text1024"><tspan
+           x=3D"0 12.007111 24.034922 36.042034 48.069843 60.076954 72.0=
84068"
+           y=3D"0"
+           sodipodi:role=3D"line"
+           id=3D"tspan1022">Barrier</tspan></text>
+      <g
+         id=3D"g1026"
+         transform=3D"matrix(1,-0.122812,-0.0560224,0.985567,0,0)">
+        <path
+           d=3D"m 111.173,137.941 v 4.455 l 1.969,0.008 c 0.945,0.002 1.=
608,-0.157 1.989,-0.482 0.388,-0.32 0.579,-0.883 0.577,-1.688 0.005,-0.81=
2 -0.196,-1.395 -0.599,-1.755 -0.394,-0.354 -1.053,-0.531 -1.967,-0.53 z =
m -0.002,-5.898 -0.006,3.519 1.969,0.008 c 0.758,-0.001 1.297,-0.132 1.61=
8,-0.401 0.317,-0.266 0.476,-0.71 0.472,-1.337 0.005,-0.609 -0.153,-1.057=
 -0.481,-1.344 -0.322,-0.293 -0.853,-0.439 -1.603,-0.437 z m -2.898,-2.35=
8 4.86,0.003 c 1.687,0 2.947,0.319 3.788,0.963 0.848,0.637 1.268,1.585 1.=
269,2.854 -0.001,0.963 -0.247,1.721 -0.748,2.269 -0.5,0.552 -1.232,0.869 =
-2.197,0.947 1.151,0.111 2.017,0.5 2.597,1.163 0.576,0.655 0.869,1.575 0.=
873,2.757 -0.005,1.45 -0.438,2.506 -1.307,3.166 -0.87,0.653 -2.297,0.978 =
-4.274,0.974 l -4.859,-0.003 z m 17.825,9.775 c -1.117,0 -1.894,0.145 -2.=
335,0.438 -0.433,0.287 -0.652,0.771 -0.653,1.457 0.005,0.508 0.161,0.916 =
0.459,1.214 0.306,0.304 0.717,0.454 1.229,0.455 0.781,-0.006 1.389,-0.303=
 1.825,-0.883 0.436,-0.587 0.648,-1.413 0.643,-2.472 l 0.004,-0.206 z m 4=
=2E108,-1.137 0.002,6.453 -2.937,-0.001 -0.008,-1.254 c -0.359,0.494 -0.8=
18,0.877 -1.373,1.145 -0.559,0.271 -1.173,0.405 -1.837,0.405 -1.281,-0.00=
1 -2.285,-0.34 -3.011,-1.025 -0.717,-0.68 -1.071,-1.624 -1.064,-2.828 -0.=
004,-1.32 0.422,-2.298 1.273,-2.933 0.859,-0.63 2.185,-0.948 3.978,-0.947=
 l 2.047,0.002 -0.012,-0.493 c 0.004,-0.483 -0.169,-0.85 -0.514,-1.095 -0=
=2E339,-0.252 -0.846,-0.379 -1.522,-0.38 -0.71,0.007 -1.396,0.104 -2.062,=
0.282 -0.669,0.183 -1.36,0.473 -2.076,0.867 l -0.002,-2.536 c 0.661,-0.26=
7 1.326,-0.461 1.998,-0.592 0.68,-0.137 1.395,-0.206 2.145,-0.208 1.832,0=
=2E006 3.119,0.389 3.861,1.147 0.737,0.75 1.109,2.08 1.114,3.991 z m 12.4=
19,-1.722 c -0.309,-0.3 -0.681,-0.521 -1.115,-0.662 -0.438,-0.15 -0.911,-=
0.225 -1.419,-0.225 -0.637,-0.004 -1.189,0.102 -1.654,0.317 -0.468,0.22 -=
0.829,0.539 -1.087,0.959 -0.166,0.245 -0.277,0.552 -0.339,0.925 -0.065,0.=
364 -0.097,0.915 -0.094,1.653 l -0.005,5.215 -2.953,-0.003 0.007,-11.303 =
2.953,0.003 -0.011,1.743 c 0.295,-0.649 0.74,-1.149 1.337,-1.498 0.605,-0=
=2E357 1.306,-0.535 2.111,-0.53 0.395,-0.002 0.784,0.05 1.166,0.161 0.388=
,0.104 0.756,0.245 1.102,0.423 z m 11.996,0.001 c -0.309,-0.301 -0.681,-0=
=2E521 -1.115,-0.663 -0.438,-0.149 -0.911,-0.224 -1.419,-0.224 -0.636,-0.=
004 -1.189,0.101 -1.654,0.317 -0.468,0.219 -0.829,0.539 -1.087,0.959 -0.1=
66,0.244 -0.277,0.552 -0.338,0.924 -0.066,0.365 -0.098,0.916 -0.095,1.653=
 l -0.005,5.216 -2.953,-0.004 0.007,-11.303 2.953,0.004 -0.011,1.742 c 0.=
295,-0.649 0.74,-1.148 1.338,-1.498 0.605,-0.356 1.306,-0.535 2.111,-0.52=
9 0.394,-0.003 0.784,0.05 1.165,0.161 0.388,0.104 0.756,0.244 1.102,0.422=
 z m 2.634,-3.132 5.843,-0.002 -0.009,9.036 3.673,0.014 0.002,2.267 -10.3=
13,-0.001 -0.002,-2.267 3.703,0.002 -0.004,-6.771 -2.907,-0.013 z m 2.895=
,-5.49 2.937,-0.014 0.006,3.457 -2.937,0.014 z m 17.988,16.237 c -0.695,0=
=2E294 -1.393,0.508 -2.105,0.641 -0.711,0.133 -1.465,0.206 -2.254,0.211 -=
1.898,-0.003 -3.34,-0.504 -4.334,-1.507 -0.994,-1.012 -1.494,-2.47 -1.495=
,-4.372 -0.002,-1.847 0.479,-3.309 1.442,-4.386 0.959,-1.074 2.273,-1.612=
 3.94,-1.618 1.677,0.011 2.974,0.509 3.897,1.5 0.919,0.995 1.377,2.399 1.=
377,4.215 l 0.004,1.189 -7.657,-0.003 c -0.004,0.887 0.252,1.554 0.769,1.=
998 0.524,0.438 1.302,0.654 2.333,0.656 0.676,10e-4 1.343,-0.094 2,-0.29 =
0.664,-0.203 1.362,-0.512 2.088,-0.929 z m -2.496,-6.352 c -0.013,-0.782 =
-0.218,-1.374 -0.615,-1.773 -0.39,-0.397 -0.956,-0.594 -1.706,-0.593 -0.6=
87,0.002 -1.234,0.207 -1.637,0.621 -0.394,0.418 -0.627,1.008 -0.697,1.768=
 z m 14.972,-1.265 c -0.31,-0.3 -0.682,-0.521 -1.116,-0.662 -0.438,-0.15 =
-0.911,-0.225 -1.418,-0.225 -0.637,-0.004 -1.19,0.102 -1.655,0.317 -0.468=
,0.22 -0.829,0.539 -1.086,0.959 -0.166,0.245 -0.278,0.552 -0.339,0.925 -0=
=2E066,0.364 -0.097,0.915 -0.095,1.653 l -0.005,5.215 -2.953,-0.003 0.007=
,-11.303 2.954,0.003 -0.012,1.743 c 0.295,-0.649 0.74,-1.149 1.338,-1.498=
 0.605,-0.357 1.306,-0.535 2.111,-0.53 0.394,-0.002 0.784,0.05 1.165,0.16=
1 0.389,0.104 0.756,0.245 1.102,0.423 z"
+           style=3D"fill:none;stroke:#000000;stroke-width:1.89531;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path1028" />
+      </g>
+      <g
+         id=3D"g1030">
+        <path
+           d=3D"m 153.957,229.41 -12.887,13.613 26.293,-6.05 10.313,24.1=
99 7.734,-21.68 30.938,16.133 -6.188,-13.105 28.875,5.542 -26.812,-16.636=
 38.152,-7.055 -38.668,-2.019 5.672,-14.114 -15.984,3.024"
+           style=3D"fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke=
:#747474;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1032" />
+      </g>
+      <g
+         id=3D"g1034"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -191.873,201.832 24.349,37.349 -8.716,2.584 -22.574,-3=
7.513 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1036" />
+      </g>
+      <g
+         id=3D"g1038"
+         transform=3D"matrix(0.0127232,1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m 203.257,203.219 c 0.001,4.316 -3.498,7.814 -7.814,7.81=
4 -4.317,0 -7.818,-3.498 -7.818,-7.815 -0.001,-4.32 3.502,-7.818 7.818,-7=
=2E818 4.317,0 7.814,3.498 7.814,7.819 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1040" />
+      </g>
+      <g
+         id=3D"g1042"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -169.712,250.282 -27.98,28.531 -1.749,-9.269 25.739,-2=
5.574 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1044" />
+      </g>
+      <g
+         id=3D"g1046"
+         transform=3D"matrix(0.0458165,1,1,-0.0458165,0,0)">
+        <path
+           d=3D"m 188.647,237.591 c 0.003,4.313 -3.497,7.809 -7.81,7.807=
 -4.312,0.003 -7.808,-3.494 -7.807,-7.806 -0.002,-4.316 3.494,-7.813 7.81=
,-7.811 4.313,0.002 7.809,3.498 7.807,7.81 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24764;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1048" />
+      </g>
+      <g
+         id=3D"g1050"
+         transform=3D"matrix(0.0458165,1,1,-0.0458165,0,0)">
+        <path
+           d=3D"m 185.999,237.591 c 0.001,2.848 -2.311,5.161 -5.162,5.15=
9 -2.848,0.001 -5.161,-2.311 -5.158,-5.158 -0.002,-2.852 2.31,-5.161 5.15=
8,-5.162 2.851,-0.002 5.164,2.31 5.162,5.161 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24764;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1052" />
+      </g>
+      <g
+         id=3D"g1054"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -200.195,269.57 -11.094,-2.454 -9.191,4.52 3.901,9.64 =
8.335,-2.328 12.422,0.271 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1056" />
+      </g>
+      <g
+         id=3D"g1058"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -199.37,267.967 -7.845,11.775 -14.097,9.427 10.942,8.8=
73 13.948,-7.604 5.174,-14.918 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1060" />
+      </g>
+      <g
+         id=3D"g1062"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -204.414,283.04 7.438,6.747"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1064" />
+      </g>
+      <g
+         id=3D"g1066"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -208.204,278.558 -1.747,-7.604"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.24982;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1068" />
+      </g>
+      <g
+         id=3D"g1070">
+        <path
+           d=3D"m 206.793,185.195 3.48,12.43 -8.375,21 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.25;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1072" />
+      </g>
+      <g
+         id=3D"g1074"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -187.807,-116.419 -21.69,38.377 8.763,2.004 19.925,-38=
=2E424 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.22418;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1076" />
+      </g>
+      <g
+         id=3D"g1078"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -178.516,-114 c 0,4.266 -3.459,7.728 -7.729,7.728 -4.2=
66,0 -7.728,-3.459 -7.728,-7.729 0,-4.269 3.46,-7.728 7.729,-7.728 4.266,=
0.001 7.728,3.46 7.728,7.729 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.22418;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1080" />
+      </g>
+      <g
+         id=3D"g1082"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -181.137,-114.001 c 0.001,2.82 -2.286,5.107 -5.106,5.1=
08 -2.821,-0.002 -5.107,-2.286 -5.109,-5.106 0.003,-2.821 2.286,-5.107 5.=
106,-5.108 2.821,-0.002 5.108,2.286 5.109,5.106 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.22418;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1084" />
+      </g>
+      <g
+         id=3D"g1086"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -207.581,-64.737 20.497,31.676 6.228,-4.058 -23.214,-3=
4.245 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.22418;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1088" />
+      </g>
+      <g
+         id=3D"g1090"
+         transform=3D"matrix(-1,-0.352206,0.352206,-1,0,0)">
+        <path
+           d=3D"m -199.765,-30.399 c 0,4.07 -3.302,7.374 -7.376,7.375 -4=
=2E071,-0.004 -7.373,-3.302 -7.374,-7.375 0.003,-4.072 3.301,-7.374 7.375=
,-7.375 4.07,0 7.373,3.301 7.375,7.375 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.12222;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1092" />
+      </g>
+      <g
+         id=3D"g1094"
+         transform=3D"matrix(-1,-0.352206,0.352206,-1,0,0)">
+        <path
+           d=3D"m -202.266,-30.401 c -0.001,2.692 -2.182,4.874 -4.874,4.=
873 -2.69,0.002 -4.872,-2.179 -4.871,-4.871 -0.003,-2.69 2.182,-4.873 4.8=
7,-4.871 2.69,-0.002 4.873,2.178 4.875,4.869 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.12222;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1096" />
+      </g>
+      <g
+         id=3D"g1098"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -205.437,-15.717 25.314,-23.81 5.618,12.864 -29.024,23=
=2E967 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.22418;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1100" />
+      </g>
+      <g
+         id=3D"g1102">
+        <path
+           d=3D"m 218.414,231.812 2,7.145 c -21.941,0.508 -43.371,-2.711=
 -71.644,-24.832 l -4.247,-10.078 c 21.352,17.969 43.434,31.223 73.891,27=
=2E765 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.25;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1104" />
+      </g>
+      <g
+         id=3D"g1106">
+        <path
+           d=3D"m 150.668,152.371 c 6.902,-1.406 13.805,-2.816 20.711,-4=
=2E223 8.383,0.157 6.121,-17.027 -7.406,-12.46 -4.532,0.46 -9.02,1.246 -1=
3.551,1.703"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.25;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1108" />
+      </g>
+      <g
+         id=3D"g1110">
+        <path
+           d=3D"m 144.953,206.062 c 15.633,14.559 31.25,27.489 73.832,27=
=2E071 -12.691,-19.078 -16.765,-13.766 -10.777,-46.141 -28.555,-19.008 -3=
2.328,-29.605 -44.387,-51.695 -21.703,26.754 -21.793,49.086 -18.668,70.76=
5 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.25;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1112" />
+      </g>
+      <g
+         id=3D"g1114"
+         transform=3D"matrix(-1,0.837792,-0.837792,-1,0,0)">
+        <path
+           d=3D"m -18.549,-152.911 31.244,-13.868 -4.53,-5.298 -27.176,1=
2.869 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:1.72471;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1116" />
+      </g>
+      <g
+         id=3D"g1118"
+         transform=3D"matrix(-1,0.837792,-0.837792,-1,0,0)">
+        <path
+           d=3D"m 7.213,-163.938 6.482,28.529 5.62,-1.296 -7.78,-31.123 =
z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:1.72471;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1120" />
+      </g>
+      <g
+         id=3D"g1122"
+         transform=3D"matrix(-1,0.837792,-0.837792,-1,0,0)">
+        <path
+           d=3D"m 14.972,-171.632 c -2.648,-0.258 -5.298,-0.517 -7.948,-=
0.776 -3.25,2.07 -5.98,11.087 -1.291,11.211 1.824,0.774 3.664,1.488 5.485=
,2.275"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:1.72471;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1124" />
+      </g>
+      <g
+         id=3D"g1126"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -142.856,-64.142 c 0,3.214 -2.607,5.822 -5.82,5.82 -3.=
215,0 -5.821,-2.604 -5.822,-5.819 -0.001,-3.214 2.607,-5.822 5.819,-5.82 =
3.216,0 5.822,2.604 5.823,5.819 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.0277;stroke-linecap:butt;stroke-linejoin:miter;st=
roke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1128" />
+      </g>
+      <g
+         id=3D"g1130"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -144.831,-64.142 c -0.001,2.125 -1.72,3.848 -3.846,3.8=
48 -2.125,0 -3.846,-1.722 -3.846,-3.847 0,-2.125 1.721,-3.845 3.846,-3.84=
8 2.125,0 3.847,1.725 3.846,3.847 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.0277;stroke-linecap:butt;stroke-linejoin:miter;st=
roke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1132" />
+      </g>
+      <g
+         id=3D"g1134"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -152.965,-24.927 c 0,3.215 -2.604,5.82 -5.82,5.821 -3.=
215,0 -5.821,-2.605 -5.819,-5.821 -10e-4,-3.215 2.604,-5.82 5.82,-5.82 3.=
215,-0.001 5.818,2.606 5.819,5.82 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.0277;stroke-linecap:butt;stroke-linejoin:miter;st=
roke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1136" />
+      </g>
+      <g
+         id=3D"g1138"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -154.937,-24.929 c 0,2.126 -1.723,3.851 -3.849,3.851 -=
2.122,-0.003 -3.846,-1.722 -3.846,-3.847 0,-2.125 1.724,-3.848 3.847,-3.8=
45 2.124,-0.003 3.846,1.722 3.848,3.841 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.0277;stroke-linecap:butt;stroke-linejoin:miter;st=
roke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1140" />
+      </g>
+      <g
+         id=3D"g1142">
+        <path
+           d=3D"m 100.227,148.441 -6.801,-15.55 -34.508,-8.262 -1.941,8.=
75 39.363,21.383 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.25;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1144" />
+      </g>
+      <g
+         id=3D"g1146"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 182.723,-79.805 -11.809,-1.339 -6.838,9.516 2.529,11.7=
89 16.942,-2.055 -3.914,-8.349 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.16676;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1148" />
+      </g>
+      <g
+         id=3D"g1150"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 232.598,-71.863 -33.167,27.273 -3.398,-8.068 33.512,-2=
5.591 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.16676;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1152" />
+      </g>
+      <g
+         id=3D"g1154"
+         transform=3D"matrix(-0.279838,-1,-1,0.279838,0,0)">
+        <path
+           d=3D"m -222.802,-80.479 c -0.001,4.156 -3.371,7.525 -7.53,7.5=
29 -4.157,-10e-4 -7.53,-3.374 -7.529,-7.53 10e-4,-4.157 3.369,-7.529 7.53=
,-7.529 4.156,0.001 7.528,3.369 7.529,7.53 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.16676;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1156" />
+      </g>
+      <g
+         id=3D"g1158"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 166.731,-71.862 10.078,2.137"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.16676;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1160" />
+      </g>
+      <g
+         id=3D"g1162"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 176.565,-75.75 -2.395,8.376 -7.28,4.897 16.698,-1.629 =
2.765,-3.644 -2.116,-7.123 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.16676;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1164" />
+      </g>
+      <g
+         id=3D"g1166"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 196.275,-49.532 -21.967,-31.608 9.082,0.014 19.574,28.=
95 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:2.16676;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1168" />
+      </g>
+      <g
+         id=3D"g1170"
+         transform=3D"matrix(0.92804,-1,-1,-0.92804,0,0)">
+        <path
+           d=3D"m -41.345,-149.213 c 10e-4,3.164 -2.563,5.73 -5.728,5.73=
1 -3.165,0 -5.732,-2.566 -5.731,-5.729 0,-3.165 2.566,-5.732 5.731,-5.733=
 3.162,0.002 5.73,2.568 5.728,5.731 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:1.64922;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1172" />
+      </g>
+      <g
+         id=3D"g1174"
+         transform=3D"matrix(0.92804,-1,-1,-0.92804,0,0)">
+        <path
+           d=3D"m -43.287,-149.212 c 10e-4,2.091 -1.695,3.788 -3.788,3.7=
87 -2.09,0.001 -3.785,-1.697 -3.786,-3.788 -0.001,-2.09 1.697,-3.785 3.78=
7,-3.786 2.091,-0.001 3.787,1.695 3.787,3.787 z"
+           style=3D"fill:#000000;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:1.64922;stroke-linecap:butt;stroke-linejoin:miter;s=
troke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1176" />
+      </g>
+      <g
+         id=3D"g1178">
+        <path
+           d=3D"M 116.266,240.777 53.09,260.219"
+           style=3D"fill:none;stroke:#747474;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1180" />
+      </g>
+      <g
+         id=3D"g1182">
+        <path
+           d=3D"m 153.684,268.965 -22.84,35.476"
+           style=3D"fill:none;stroke:#747474;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1184" />
+      </g>
+      <g
+         id=3D"g1186">
+        <path
+           d=3D"m 202.285,264.594 22.352,39.363"
+           style=3D"fill:none;stroke:#747474;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1188" />
+      </g>
+      <g
+         id=3D"g1190">
+        <path
+           d=3D"m 250.883,260.219 42.277,16.523"
+           style=3D"fill:none;stroke:#747474;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1192" />
+      </g>
+      <g
+         id=3D"g1194">
+        <path
+           d=3D"m 270.32,236.406 31.102,1.457"
+           style=3D"fill:none;stroke:#747474;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1196" />
+      </g>
+      <g
+         id=3D"g1198">
+        <path
+           d=3D"m 243.59,207.734 20.898,-12.152"
+           style=3D"fill:none;stroke:#747474;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1200" />
+      </g>
+      <g
+         id=3D"g1202">
+        <path
+           d=3D"M 166.32,42.5 144.051,3.93"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1204" />
+      </g>
+      <g
+         id=3D"g1206">
+        <path
+           d=3D"M 173.609,38.613 162.098,18.676"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1208" />
+      </g>
+      <g
+         id=3D"g1210">
+        <path
+           d=3D"M 39.965,111.508 4.062,49.324"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1212" />
+      </g>
+      <g
+         id=3D"g1214">
+        <path
+           d=3D"M 255.254,156.219 238.262,92.801"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1216" />
+      </g>
+      <g
+         id=3D"g1218">
+        <path
+           d=3D"m 221.238,164.48 -8.613,-32.144"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1220" />
+      </g>
+      <g
+         id=3D"g1222">
+        <path
+           d=3D"m 293.16,188.781 -5.281,-19.719"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1224" />
+      </g>
+      <g
+         id=3D"g1226">
+        <path
+           d=3D"M 272.266,173.715 263.207,139.91"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1228" />
+      </g>
+      <g
+         id=3D"g1230">
+        <path
+           d=3D"M 279.066,179.059 272.684,155.23"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1232" />
+      </g>
+      <g
+         id=3D"g1234">
+        <path
+           d=3D"M 228.609,160.996 207.406,81.863"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1236" />
+      </g>
+      <g
+         id=3D"g1238">
+        <path
+           d=3D"M 100.227,136.293 38.965,30.184"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1240" />
+      </g>
+      <g
+         id=3D"g1242">
+        <path
+           d=3D"M 127.441,138.723 73.73,45.691"
+           style=3D"fill:none;stroke:#c8c8c8;stroke-width:0.75;stroke-li=
necap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:non=
e;stroke-opacity:1"
+           id=3D"path1244" />
+      </g>
+      <g
+         id=3D"g1246"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -191.531,202.637 24.349,37.349 -8.717,2.585 -22.573,-3=
7.514 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749939;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1248" />
+      </g>
+      <g
+         id=3D"g1250"
+         transform=3D"matrix(0.0127232,1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m 202.916,204.024 c 0,4.316 -3.498,7.814 -7.814,7.814 -4=
=2E317,0 -7.818,-3.498 -7.819,-7.815 0,-4.316 3.499,-7.818 7.819,-7.818 4=
=2E316,0 7.814,3.498 7.814,7.819 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749939;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1252" />
+      </g>
+      <g
+         id=3D"g1254"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -169.37,251.087 -27.981,28.531 -1.749,-9.268 25.74,-25=
=2E575 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749939;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1256" />
+      </g>
+      <g
+         id=3D"g1258"
+         transform=3D"matrix(0.0458165,1,1,-0.0458165,0,0)">
+        <path
+           d=3D"m 188.333,238.406 c 0.002,4.313 -3.498,7.809 -7.81,7.807=
 -4.313,0.003 -7.809,-3.493 -7.807,-7.806 -0.002,-4.316 3.494,-7.812 7.81=
,-7.811 4.313,0.002 7.809,3.498 7.807,7.81 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749214;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1260" />
+      </g>
+      <g
+         id=3D"g1262"
+         transform=3D"matrix(0.0458165,1,1,-0.0458165,0,0)">
+        <path
+           d=3D"m 185.685,238.407 c 0.001,2.847 -2.311,5.16 -5.162,5.158=
 -2.848,0.002 -5.161,-2.31 -5.159,-5.158 -0.001,-2.852 2.311,-5.161 5.158=
,-5.162 2.852,-0.002 5.165,2.31 5.163,5.162 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749214;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1264" />
+      </g>
+      <g
+         id=3D"g1266"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -199.85,270.375 -11.098,-2.453 -9.19,4.519 3.901,9.64 =
8.334,-2.328 12.422,0.272 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749939;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1268" />
+      </g>
+      <g
+         id=3D"g1270"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -199.029,268.772 -7.845,11.776 -14.097,9.426 10.942,8.=
873 13.948,-7.603 5.175,-14.919 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.749939;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1272" />
+      </g>
+      <g
+         id=3D"g1274"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -204.072,283.845 7.437,6.747"
+           style=3D"fill:none;stroke:#000000;stroke-width:0.749939;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1276" />
+      </g>
+      <g
+         id=3D"g1278"
+         transform=3D"matrix(-0.0127232,-1,1,-0.0127232,0,0)">
+        <path
+           d=3D"m -207.863,279.363 -1.747,-7.604"
+           style=3D"fill:none;stroke:#000000;stroke-width:0.749939;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1280" />
+      </g>
+      <g
+         id=3D"g1282">
+        <path
+           d=3D"m 207.594,184.844 3.48,12.429 -8.375,21 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1284" />
+      </g>
+      <g
+         id=3D"g1286"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -188.537,-115.953 -21.69,38.374 8.763,2.004 19.925,-38=
=2E424 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.741392;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1288" />
+      </g>
+      <g
+         id=3D"g1290"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -179.246,-113.536 c 0,4.265 -3.459,7.727 -7.729,7.728 =
-4.266,-10e-4 -7.728,-3.46 -7.728,-7.73 0,-4.269 3.46,-7.727 7.729,-7.728=
 4.266,0.001 7.728,3.46 7.728,7.73 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.741392;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1292" />
+      </g>
+      <g
+         id=3D"g1294"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -181.867,-113.538 c 10e-4,2.82 -2.286,5.107 -5.106,5.1=
08 -2.821,-0.002 -5.107,-2.286 -5.109,-5.106 -0.001,-2.82 2.286,-5.107 5.=
106,-5.108 2.821,-0.002 5.108,2.286 5.109,5.106 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.741392;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1296" />
+      </g>
+      <g
+         id=3D"g1298"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -208.311,-64.274 20.497,31.676 6.228,-4.057 -23.214,-3=
4.246 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.741392;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1300" />
+      </g>
+      <g
+         id=3D"g1302"
+         transform=3D"matrix(-1,-0.352206,0.352206,-1,0,0)">
+        <path
+           d=3D"m -200.368,-29.835 c 0,4.07 -3.301,7.373 -7.375,7.374 -4=
=2E071,-0.003 -7.373,-3.301 -7.375,-7.375 0.004,-4.071 3.302,-7.373 7.375=
,-7.375 4.072,0.004 7.374,3.302 7.375,7.376 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.707406;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1304" />
+      </g>
+      <g
+         id=3D"g1306"
+         transform=3D"matrix(-1,-0.352206,0.352206,-1,0,0)">
+        <path
+           d=3D"m -202.868,-29.838 c -0.001,2.692 -2.182,4.874 -4.874,4.=
873 -2.691,0.003 -4.873,-2.178 -4.872,-4.87 -0.002,-2.69 2.179,-4.873 4.8=
71,-4.871 2.69,-0.003 4.872,2.178 4.875,4.868 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.707406;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1308" />
+      </g>
+      <g
+         id=3D"g1310"
+         transform=3D"matrix(-1,-0.152825,0.152825,-1,0,0)">
+        <path
+           d=3D"m -206.167,-15.254 25.314,-23.81 5.618,12.864 -29.024,23=
=2E967 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.741392;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1312" />
+      </g>
+      <g
+         id=3D"g1314">
+        <path
+           d=3D"m 219.215,231.461 2,7.144 c -21.942,0.508 -43.371,-2.71 =
-71.645,-24.832 l -4.246,-10.078 c 21.352,17.969 43.434,31.223 73.891,27.=
766 z"
+           style=3D"fill:#ceae83;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1316" />
+      </g>
+      <g
+         id=3D"g1318">
+        <path
+           d=3D"m 151.469,152.02 c 6.902,-1.407 13.804,-2.817 20.711,-4.=
223 8.382,0.156 6.121,-17.027 -7.407,-12.461 -4.531,0.461 -9.019,1.246 -1=
3.55,1.703"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1320" />
+      </g>
+      <g
+         id=3D"g1322">
+        <path
+           d=3D"m 145.754,205.711 c 15.633,14.559 31.25,27.488 73.832,27=
=2E07 -12.691,-19.078 -16.766,-13.765 -10.777,-46.14 -28.555,-19.008 -32.=
329,-29.606 -44.387,-51.696 -21.703,26.754 -21.793,49.086 -18.668,70.766 =
z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1324" />
+      </g>
+      <g
+         id=3D"g1326"
+         transform=3D"matrix(-1,0.837792,-0.837792,-1,0,0)">
+        <path
+           d=3D"m -19.192,-153.099 31.243,-13.867 -4.529,-5.299 -27.176,=
12.869 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.574903;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1328" />
+      </g>
+      <g
+         id=3D"g1330"
+         transform=3D"matrix(-1,0.837792,-0.837792,-1,0,0)">
+        <path
+           d=3D"m 6.569,-164.125 6.482,28.528 5.621,-1.295 -7.781,-31.12=
4 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.574903;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1332" />
+      </g>
+      <g
+         id=3D"g1334"
+         transform=3D"matrix(-1,0.837792,-0.837792,-1,0,0)">
+        <path
+           d=3D"m 14.328,-171.82 c -2.647,-0.257 -5.297,-0.517 -7.947,-0=
=2E776 -3.25,2.07 -5.981,11.088 -1.291,11.212 1.822,0.776 3.663,1.487 5.4=
84,2.274"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.574903;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1336" />
+      </g>
+      <g
+         id=3D"g1338"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -143.414,-63.372 c 0,3.214 -2.607,5.821 -5.82,5.82 -3.=
215,0 -5.821,-2.604 -5.822,-5.819 -10e-4,-3.214 2.607,-5.822 5.819,-5.82 =
3.216,0 5.822,2.604 5.823,5.819 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.675901;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1340" />
+      </g>
+      <g
+         id=3D"g1342"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -145.389,-63.372 c -10e-4,2.125 -1.72,3.848 -3.846,3.8=
48 -2.125,0 -3.846,-1.722 -3.846,-3.847 0,-2.125 1.721,-3.845 3.847,-3.84=
5 2.124,-0.003 3.846,1.722 3.845,3.844 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.675901;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1344" />
+      </g>
+      <g
+         id=3D"g1346"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -153.523,-24.157 c 0,3.215 -2.604,5.82 -5.82,5.82 -3.2=
15,0.001 -5.821,-2.604 -5.819,-5.82 -0.001,-3.215 2.604,-5.82 5.82,-5.82 =
3.215,-0.001 5.818,2.606 5.819,5.82 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.675901;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1348" />
+      </g>
+      <g
+         id=3D"g1350"
+         transform=3D"matrix(-0.988785,-0.749731,0.323443,-1,0,0)">
+        <path
+           d=3D"m -155.495,-24.159 c 0,2.125 -1.723,3.851 -3.849,3.851 -=
2.122,-0.003 -3.846,-1.722 -3.846,-3.847 0,-2.125 1.724,-3.848 3.847,-3.8=
45 2.124,-0.003 3.846,1.722 3.848,3.841 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.675901;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1352" />
+      </g>
+      <g
+         id=3D"g1354">
+        <path
+           d=3D"m 101.027,148.09 -6.8,-15.551 -34.508,-8.262 -1.942,8.75=
 39.364,21.383 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.75;stroke-linecap:butt;stroke-linejoin:miter;stro=
ke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1356" />
+      </g>
+      <g
+         id=3D"g1358"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 182.605,-80.638 -11.809,-1.34 -6.839,9.516 2.529,11.79=
 16.943,-2.056 -3.914,-8.349 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.722253;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1360" />
+      </g>
+      <g
+         id=3D"g1362"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 232.48,-72.697 -33.167,27.273 -3.399,-8.068 33.513,-25=
=2E591 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.722253;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1364" />
+      </g>
+      <g
+         id=3D"g1366"
+         transform=3D"matrix(-0.279838,-1,-1,0.279838,0,0)">
+        <path
+           d=3D"m -222.684,-81.313 c -0.001,4.156 -3.371,7.525 -7.53,7.5=
29 -4.157,-10e-4 -7.53,-3.374 -7.529,-7.53 0.001,-4.157 3.373,-7.53 7.53,=
-7.529 4.156,0.001 7.529,3.37 7.529,7.53 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.722253;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1368" />
+      </g>
+      <g
+         id=3D"g1370"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 166.613,-72.696 10.077,2.137"
+           style=3D"fill:none;stroke:#000000;stroke-width:0.722253;strok=
e-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray=
:none;stroke-opacity:1"
+           id=3D"path1372" />
+      </g>
+      <g
+         id=3D"g1374"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 176.447,-76.584 -2.395,8.376 -7.28,4.897 16.697,-1.628=
 2.766,-3.644 -2.116,-7.124 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.722253;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1376" />
+      </g>
+      <g
+         id=3D"g1378"
+         transform=3D"matrix(0.279838,1,-1,0.279838,0,0)">
+        <path
+           d=3D"m 196.157,-50.366 -21.968,-31.608 9.082,0.014 19.575,28.=
951 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.722253;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1380" />
+      </g>
+      <g
+         id=3D"g1382"
+         transform=3D"matrix(0.92804,-1,-1,-0.92804,0,0)">
+        <path
+           d=3D"m -40.754,-149.466 c -0.002,3.163 -2.566,5.728 -5.731,5.=
729 -3.164,0 -5.732,-2.566 -5.73,-5.729 -10e-4,-3.164 2.565,-5.732 5.73,-=
5.733 3.163,0.002 5.73,2.568 5.731,5.733 z"
+           style=3D"fill:#fff2a2;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.549741;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1384" />
+      </g>
+      <g
+         id=3D"g1386"
+         transform=3D"matrix(0.92804,-1,-1,-0.92804,0,0)">
+        <path
+           d=3D"m -42.699,-149.466 c 10e-4,2.09 -1.694,3.787 -3.787,3.78=
6 -2.091,0.001 -3.786,-1.697 -3.787,-3.787 -10e-4,-2.091 1.697,-3.786 3.7=
88,-3.787 2.09,-0.001 3.787,1.695 3.786,3.788 z"
+           style=3D"fill:#ffffd7;fill-opacity:1;fill-rule:nonzero;stroke=
:#000000;stroke-width:0.549741;stroke-linecap:butt;stroke-linejoin:miter;=
stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+           id=3D"path1388" />
+      </g>
+      <text
+         transform=3D"matrix(0.99843443,-0.12261972,-0.05593468,0.984024=
27,106.65956,103.50629)"
+         style=3D"font-variant:normal;font-weight:bold;font-size:20.7019=
px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSans=
Mono-Bold;writing-mode:lr-tb;fill:#ffffff;fill-opacity:1;fill-rule:nonzer=
o;stroke:none"
+         id=3D"text1392"><tspan
+           x=3D"0 12.007111 24.034922 36.042034 48.069843 60.076954"
+           y=3D"0"
+           sodipodi:role=3D"line"
+           id=3D"tspan1390">Memory</tspan></text>
+      <g
+         id=3D"g1394"
+         transform=3D"matrix(1,-0.122812,-0.0560224,0.985567,0,0)">
+        <path
+           d=3D"m 114.209,104.067 3.547,-0.002 1.792,6.613 1.786,-6.611 =
3.578,0.002 10e-4,15.077 -2.562,-0.002 -0.005,-12.065 -1.599,6.586 -2.36,=
-0.009 -1.634,-6.577 0.004,12.066 -2.547,-10e-4 z m 22.247,14.512 c -0.69=
5,0.294 -1.394,0.508 -2.105,0.642 -0.711,0.133 -1.465,0.205 -2.254,0.21 -=
1.899,-0.003 -3.341,-0.503 -4.334,-1.507 -0.995,-1.012 -1.494,-2.469 -1.4=
95,-4.372 -0.002,-1.847 0.478,-3.309 1.441,-4.386 0.96,-1.073 2.274,-1.61=
1 3.941,-1.617 1.677,0.01 2.974,0.509 3.897,1.5 0.919,0.994 1.376,2.399 1=
=2E376,4.214 l 0.005,1.19 -7.657,-0.003 c -0.005,0.887 0.251,1.553 0.768,=
1.998 0.525,0.438 1.303,0.654 2.334,0.655 0.676,0.001 1.342,-0.094 1.999,=
-0.29 0.665,-0.202 1.362,-0.512 2.089,-0.928 z m -2.497,-6.351 c -0.012,-=
0.783 -0.217,-1.375 -0.615,-1.773 -0.389,-0.398 -0.955,-0.595 -1.705,-0.5=
93 -0.687,0.001 -1.234,0.207 -1.637,0.62 -0.395,0.419 -0.627,1.008 -0.698=
,1.768 z m 10.334,-3.251 c 0.223,-0.479 0.504,-0.833 0.846,-1.067 0.351,-=
0.23 0.778,-0.347 1.277,-0.349 0.977,-0.005 1.648,0.333 2.01,1.012 0.37,0=
=2E672 0.557,2.067 0.563,4.192 l -0.002,6.373 -2.406,10e-4 -10e-4,-7.261 =
c 0.004,-0.844 -0.059,-1.402 -0.187,-1.672 -0.133,-0.278 -0.367,-0.418 -0=
=2E711,-0.421 -0.336,0.001 -0.57,0.147 -0.71,0.434 -0.141,0.28 -0.212,0.8=
3 -0.205,1.655 l 0.001,7.261 -2.39,0.004 -10e-4,-7.261 c -0.007,-0.826 -0=
=2E073,-1.377 -0.202,-1.658 -0.133,-0.279 -0.364,-0.426 -0.697,-0.436 -0.=
343,10e-4 -0.581,0.141 -0.71,0.419 -0.122,0.27 -0.184,0.829 -0.188,1.673 =
l 10e-4,7.261 -2.421,0.015 0.007,-11.303 h 2.156 l -0.012,1.171 c 0.162,-=
0.443 0.428,-0.795 0.8,-1.057 0.379,-0.27 0.798,-0.4 1.259,-0.398 0.445,-=
0.008 0.859,0.13 1.241,0.408 0.379,0.269 0.605,0.606 0.682,1.004 z m 11.2=
55,1.003 c -0.699,0 -1.256,0.311 -1.666,0.933 -0.415,0.615 -0.621,1.477 -=
0.621,2.586 0,1.11 0.204,1.976 0.614,2.598 0.418,0.623 0.978,0.938 1.678,=
0.938 0.707,0.005 1.264,-0.306 1.666,-0.934 0.403,-0.623 0.604,-1.494 0.6=
04,-2.604 0.001,-1.109 -0.204,-1.967 -0.613,-2.581 -0.402,-0.621 -0.955,-=
0.932 -1.662,-0.936 z m -5.225,3.518 c -0.001,-1.827 0.473,-3.274 1.413,-=
4.342 0.949,-1.063 2.223,-1.598 3.817,-1.602 1.601,0.002 2.873,0.533 3.80=
8,1.601 0.943,1.068 1.415,2.518 1.416,4.346 -0.004,1.818 -0.474,3.262 -1.=
414,4.326 -0.941,1.068 -2.215,1.603 -3.817,1.601 -1.593,0.004 -2.866,-0.5=
31 -3.808,-1.6 -0.947,-1.069 -1.418,-2.511 -1.415,-4.33 z m 22.605,-2.53 =
c -0.31,-0.3 -0.682,-0.521 -1.116,-0.662 -0.438,-0.15 -0.911,-0.225 -1.41=
8,-0.224 -0.637,-0.004 -1.19,0.101 -1.655,0.317 -0.468,0.219 -0.829,0.538=
 -1.086,0.958 -0.166,0.245 -0.278,0.552 -0.339,0.925 -0.066,0.364 -0.097,=
0.915 -0.095,1.653 l -0.005,5.215 -2.953,-0.003 0.007,-11.303 2.954,0.003=
 -0.012,1.743 c 0.295,-0.649 0.74,-1.149 1.338,-1.498 0.605,-0.357 1.306,=
-0.535 2.111,-0.53 0.394,-0.002 0.784,0.05 1.165,0.161 0.389,0.104 0.756,=
0.245 1.102,0.423 z m 7.589,9.408 c -0.409,1.059 -0.894,1.827 -1.449,2.30=
8 -0.546,0.491 -1.22,0.74 -2.02,0.747 l -2.438,-0.002 -0.001,-2.252 1.203=
,-0.008 c 0.601,-10e-4 1.045,-0.104 1.326,-0.311 0.278,-0.199 0.564,-0.67=
5 0.857,-1.431 l 0.233,-0.589 -4.304,-11 3.11,0.007 2.567,7.328 2.495,-7.=
331 3.094,0.005 z"
+           style=3D"fill:none;stroke:#000000;stroke-width:0.68231;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path1396" />
+      </g>
+      <text
+         transform=3D"matrix(0.99843443,-0.12261972,-0.05593468,0.984024=
27,99.210337,129.70941)"
+         style=3D"font-variant:normal;font-weight:bold;font-size:20.7019=
px;font-family:'DejaVu Sans Mono';-inkscape-font-specification:DejaVuSans=
Mono-Bold;writing-mode:lr-tb;fill:#ffffff;fill-opacity:1;fill-rule:nonzer=
o;stroke:none"
+         id=3D"text1400"><tspan
+           x=3D"0 12.007111 24.034922 36.042034 48.069843 60.076954 72.0=
84068"
+           y=3D"0"
+           sodipodi:role=3D"line"
+           id=3D"tspan1398">Barrier</tspan></text>
+      <g
+         id=3D"g1402"
+         transform=3D"matrix(1,-0.122812,-0.0560224,0.985567,0,0)">
+        <path
+           d=3D"m 111.481,138.146 v 4.455 l 1.969,0.007 c 0.946,0.003 1.=
609,-0.156 1.989,-0.481 0.388,-0.32 0.579,-0.883 0.577,-1.688 0.005,-0.81=
2 -0.195,-1.396 -0.598,-1.755 -0.395,-0.354 -1.053,-0.531 -1.967,-0.53 z =
m -0.002,-5.898 -0.006,3.519 1.969,0.007 c 0.758,0 1.298,-0.131 1.619,-0.=
4 0.317,-0.266 0.475,-0.71 0.472,-1.337 0.004,-0.609 -0.153,-1.057 -0.482=
,-1.344 -0.321,-0.293 -0.853,-0.439 -1.603,-0.437 z m -2.898,-2.359 4.86,=
0.004 c 1.687,0 2.948,0.319 3.788,0.963 0.848,0.637 1.269,1.585 1.27,2.85=
3 -10e-4,0.963 -0.248,1.721 -0.748,2.269 -0.501,0.552 -1.233,0.869 -2.197=
,0.947 1.15,0.112 2.016,0.501 2.596,1.164 0.576,0.655 0.87,1.575 0.873,2.=
757 -0.004,1.45 -0.437,2.505 -1.307,3.166 -0.869,0.653 -2.296,0.978 -4.27=
3,0.974 l -4.86,-0.003 z m 17.825,9.776 c -1.117,-0.001 -1.894,0.144 -2.3=
34,0.438 -0.434,0.287 -0.653,0.771 -0.653,1.457 0.005,0.508 0.16,0.916 0.=
458,1.214 0.307,0.304 0.717,0.454 1.229,0.455 0.781,-0.006 1.389,-0.303 1=
=2E826,-0.883 0.435,-0.587 0.647,-1.413 0.642,-2.472 l 0.004,-0.206 z m 4=
=2E109,-1.137 0.002,6.453 -2.938,-0.002 -0.008,-1.253 c -0.359,0.494 -0.8=
18,0.877 -1.373,1.145 -0.559,0.271 -1.173,0.405 -1.837,0.405 -1.281,-0.00=
1 -2.284,-0.34 -3.01,-1.025 -0.718,-0.68 -1.072,-1.624 -1.065,-2.828 -0.0=
04,-1.32 0.422,-2.298 1.273,-2.933 0.86,-0.63 2.185,-0.948 3.979,-0.947 l=
 2.046,0.002 -0.012,-0.493 c 0.005,-0.483 -0.168,-0.85 -0.514,-1.095 -0.3=
38,-0.252 -0.845,-0.379 -1.521,-0.38 -0.711,0.007 -1.397,0.104 -2.063,0.2=
82 -0.669,0.182 -1.36,0.473 -2.076,0.867 l -10e-4,-2.537 c 0.66,-0.266 1.=
325,-0.461 1.998,-0.591 0.679,-0.137 1.394,-0.207 2.144,-0.208 1.833,0.00=
6 3.12,0.388 3.861,1.147 0.738,0.75 1.109,2.08 1.115,3.991 z m 12.419,-1.=
722 c -0.31,-0.3 -0.682,-0.521 -1.116,-0.662 -0.438,-0.15 -0.911,-0.225 -=
1.418,-0.225 -0.637,-0.004 -1.19,0.102 -1.654,0.317 -0.469,0.219 -0.83,0.=
539 -1.087,0.959 -0.166,0.245 -0.278,0.552 -0.339,0.925 -0.066,0.364 -0.0=
97,0.915 -0.095,1.653 l -0.005,5.215 -2.953,-0.004 0.007,-11.302 2.954,0.=
003 -0.012,1.742 c 0.296,-0.648 0.74,-1.148 1.338,-1.497 0.605,-0.357 1.3=
06,-0.535 2.111,-0.53 0.394,-0.003 0.784,0.05 1.165,0.161 0.389,0.104 0.7=
56,0.245 1.102,0.423 z m 11.996,0 c -0.31,-0.3 -0.682,-0.52 -1.115,-0.662=
 -0.438,-0.149 -0.911,-0.224 -1.419,-0.224 -0.637,-0.004 -1.19,0.101 -1.6=
54,0.317 -0.468,0.219 -0.829,0.539 -1.087,0.958 -0.166,0.245 -0.278,0.552=
 -0.339,0.925 -0.066,0.365 -0.097,0.916 -0.095,1.653 l -0.005,5.215 -2.95=
3,-0.003 0.007,-11.303 2.954,0.004 -0.012,1.742 c 0.296,-0.649 0.74,-1.14=
8 1.338,-1.498 0.605,-0.356 1.306,-0.535 2.111,-0.53 0.394,-0.002 0.784,0=
=2E051 1.165,0.162 0.389,0.103 0.756,0.244 1.102,0.422 z m 2.633,-3.132 5=
=2E844,-0.001 -0.01,9.036 3.673,0.014 0.002,2.267 -10.313,-0.001 -0.002,-=
2.267 3.704,0.001 -0.005,-6.77 -2.907,-0.013 z m 2.896,-5.489 2.936,-0.01=
4 0.006,3.457 -2.936,0.014 z m 17.987,16.237 c -0.694,0.294 -1.393,0.508 =
-2.104,0.641 -0.712,0.133 -1.465,0.206 -2.254,0.211 -1.899,-0.003 -3.341,=
-0.504 -4.335,-1.508 -0.994,-1.011 -1.493,-2.469 -1.495,-4.371 -0.001,-1.=
847 0.479,-3.31 1.442,-4.386 0.96,-1.074 2.273,-1.612 3.941,-1.618 1.676,=
0.011 2.974,0.509 3.896,1.5 0.919,0.995 1.377,2.399 1.377,4.214 l 0.004,1=
=2E19 -7.656,-0.003 c -0.005,0.887 0.251,1.553 0.768,1.998 0.525,0.438 1.=
302,0.654 2.334,0.656 0.675,0.001 1.342,-0.095 1.999,-0.29 0.664,-0.203 1=
=2E362,-0.512 2.089,-0.929 z m -2.496,-6.352 c -0.013,-0.782 -0.218,-1.37=
4 -0.615,-1.773 -0.39,-0.397 -0.955,-0.594 -1.705,-0.593 -0.688,0.002 -1.=
235,0.207 -1.637,0.621 -0.395,0.418 -0.627,1.008 -0.698,1.768 z m 14.972,=
-1.265 c -0.31,-0.3 -0.682,-0.521 -1.115,-0.662 -0.438,-0.15 -0.911,-0.22=
5 -1.419,-0.225 -0.637,-0.004 -1.19,0.102 -1.654,0.317 -0.468,0.219 -0.82=
9,0.539 -1.087,0.959 -0.166,0.245 -0.278,0.552 -0.339,0.925 -0.065,0.364 =
-0.097,0.915 -0.095,1.653 l -0.005,5.215 -2.953,-0.004 0.008,-11.302 2.95=
3,0.003 -0.012,1.742 c 0.296,-0.648 0.74,-1.148 1.338,-1.497 0.605,-0.357=
 1.306,-0.535 2.111,-0.53 0.394,-0.003 0.784,0.05 1.165,0.161 0.389,0.104=
 0.756,0.245 1.102,0.423 z"
+           style=3D"fill:none;stroke:#000000;stroke-width:0.68231;stroke=
-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:=
none;stroke-opacity:1"
+           id=3D"path1404" />
+      </g>
+    </g>
+  </g>
+</svg>
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 1d233189..0bd6e18d 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -260,7 +260,7 @@ spin_unlock(&mylock);
=20
 \begin{figure}
 \centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Memory-barrier}}
+\resizebox{3in}{!}{\includegraphics{cartoons/r-2023-Memory-barrier}}
 \caption{CPU Meets a Memory Barrier}
 \ContributedBy{fig:cpu:CPU Meets a Memory Barrier}{Melissa Broussard}
 \end{figure}
--=20
2.34.1


