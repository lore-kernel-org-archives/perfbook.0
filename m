Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C57080E
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443704; cv=none; b=YSezvGJvb2dTvIUWhe0ZaJHuvh1TyotGfBNfexMCauKyvt8kfFQ+5K5yLQj/RBwzmYlV0OcF7qglXHFSJWEO0i9H0bv8KbwkxujDKnfsNU3+ggphnNXyCaOrrnZN7tjRFQ3wmzvL/jl6MRmXXf/NAVfwcpmY9jMMUbor/pjluns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443704; c=relaxed/simple;
	bh=FBMT93rvvazT7eCCuelGAVQ363EPYs55EoZ3z1Tgkq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQWyMVch2fy6CuVbpVaI5IiNR97aluLxVxcIgc6NKYK6nJskt6FUycJrhbStjz41gNI3X8VXS6npmIPiQfXvvmHlmGAxuGROE2XlJfdauEeIcUIIR/qNzH9NbArYaB214nCIFVQtRkXJfdK8/1xFzUJSBajzRAtHaWkfEJ1dg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQxZrEZo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQxZrEZo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso2441967b3a.3
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443701; x=1773048501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yU/NDMEyAVB+hIS0svG0vqwiaTd2a+cd39AuoVerA8A=;
        b=PQxZrEZodDnLTqBWzaCEhO8+R0cOeo6lwZ2lhKAJQ8xwdZkxWD1fYeus6wfl28fq0r
         J8LG1UZJBG4XQp1Q0YBaS0LYKZopvqrmKkLeSiodn3wJtg3dsG4B8y6xOyGCFM5gZtah
         lJ64IBptsOMct1h+cX/ANcmUopT8h07zqQLuKwCfozdtwgXvpJTTdzGO3Z1d2Wqbxyxg
         t6DNQwWhxtZQi47/gytSfpMWX36UfUT+dNSGgweyVlCSOntIq6LnIT4nevMEGr880/fD
         MSyetzLBzEImXJOf3ZSkaJUzcZNCtB7YIbjIgaaA78uyUpC5te+gE6GOR7n/g2k7vbGX
         WYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443701; x=1773048501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yU/NDMEyAVB+hIS0svG0vqwiaTd2a+cd39AuoVerA8A=;
        b=bxYFxz0QMZ0jKnJSC+C5spGfpnlgpK0l03hM0sz6of0tu2sy9uOXnoCqK3LGLQ5uIq
         LuCa6Yhbd8+V6L/VfGt8jsFyctT5qD7CJYaY8CFvBrZ3Z6n1TNmy5wsiA+qR01P4Fzrp
         tKXE8W+RO6iboVOb1rtdxrNmQ+XWcRmll8mE3z/stmXKxLDnfpjd1x1TbBu7rXismJ35
         r5ZIhsJnAwV8TXpFtbVYtWpLl3S9z+BPRrEPNO7rlXeomUGz2nSXQtYNRurZePOohEPc
         P0zGjoNU9fj38jwOGdw+M6/2UGfJCJS9b4UbF0mOPHnkYrDFexB8EswZhGf9Ci65uZaV
         IGww==
X-Gm-Message-State: AOJu0YxDLlnVA/k0sw07prR2tq0Xg7xrNq6tQ4slRDWyXK7X5INJVToV
	/Nhh4QjAUZm9UWJ2qSPLvByN8+VsGEWMPnZ9QiqjYqn4V1LqevpIm1ap
X-Gm-Gg: ATEYQzyoA+C7swSQj43PBL48P5fZNLX4TjOMyX1an8HDjhgqlaUJmzqmNfGa4YAncwc
	rZ74V4TuAPHN4HFH5K0W5gTSdKU92bsC4jJCcvLo4qK1oL0dm2KlWakpmnZTWZyA2xdk2knRvn6
	bp/PrPrMLEdtfZQcpwEhnx/dJO2c6UiL/d0KxSjCNyHiPA2HmYetq0d6wUSWxFouCcpD40IldQo
	VKicMUUzkKyiJ4w74D8BSKmFpT+yqhpSNBbXxyfqtwllPAlcG9gSS97zgDIuMSH7pXAHQyMcRHr
	YHcajRSHMmpVBXAD7UQ4dDYIqPB0tUvKhgcJTq0Tab+fW2wdAjbkUyUqJ0dWJESB0Gkxl76ePro
	e2zRAEOqT4K0sypF6c6QQk3WNA89rPDF/cIM466DOYD5IqYlt2bI2rtFi4IHrARWulUPyQCmuHx
	/TEXMHlrSKk7EYFbMDWCZrOMqFpafD+ogjar0bcgxmOV+ht1L4w4m+A/6mZEZkqKE/jLoS
X-Received: by 2002:a05:6a20:d504:b0:38f:86c0:449 with SMTP id adf61e73a8af0-395c3b30ba0mr10587492637.49.1772443700760;
        Mon, 02 Mar 2026 01:28:20 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ef997sm10882495a12.2.2026.03.02.01.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:28:20 -0800 (PST)
Message-ID: <07fd11c4-3d52-4697-9c3e-1a0549df9bef@gmail.com>
Date: Mon, 2 Mar 2026 18:28:21 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 7/7] intro/coarsen.svg: Tweak size of squares and
 use nuanced colors
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Representing each CPU core capacity by larger squares for 16 CPU
is confusing in comparing throughput of 16 and 64 CPU cases.

To make its point clearer, shrink 16 CPU diagram, and make total
"green" areas comparable between the two.

While here, to be nicer to readers' eyes, use less-saturated colors.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Note:

  Also removed invisible objects in the bottom layers.
--
 intro/coarsen.svg | 1403 +++++++++++++++++++--------------------------
 intro/intro.tex   |    2 +-
 2 files changed, 592 insertions(+), 813 deletions(-)

diff --git a/intro/coarsen.svg b/intro/coarsen.svg
index 1b4c4d2c..12f837fd 100644
--- a/intro/coarsen.svg
+++ b/intro/coarsen.svg
@@ -11,7 +11,7 @@
    viewBox="0 0 249.375 124.375"
    id="svg2"
    version="1.1"
-   inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
+   inkscape:version="1.4.2 (ebf0e940d0, 2025-05-08)"
    sodipodi:docname="coarsen.svg"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
@@ -337,16 +337,16 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="2852"
-     inkscape:window-height="1564"
+     inkscape:window-width="1854"
+     inkscape:window-height="1003"
      id="namedview156"
      showgrid="true"
-     inkscape:zoom="7.6210936"
-     inkscape:cx="132.98616"
-     inkscape:cy="66.329063"
-     inkscape:window-x="182"
-     inkscape:window-y="177"
-     inkscape:window-maximized="0"
+     inkscape:zoom="5.388927"
+     inkscape:cx="140.75158"
+     inkscape:cy="85.63857"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="1"
      inkscape:current-layer="svg2"
      fit-margin-top="5"
      fit-margin-right="5"
@@ -354,7 +354,9 @@
      fit-margin-left="5"
      inkscape:snap-global="true"
      showguides="false"
-     inkscape:pagecheckerboard="0">
+     inkscape:pagecheckerboard="0"
+     inkscape:showpageshadow="2"
+     inkscape:deskcolor="#d1d1d1">
     <inkscape:grid
        type="xygrid"
        id="grid3110"
@@ -365,840 +367,617 @@
        originx="-110.3125"
        originy="34.687498"
        spacingx="1"
-       spacingy="0.99999998" />
+       spacingy="0.99999998"
+       units="px" />
   </sodipodi:namedview>
+  <rect
+     style="fill:#bb5535;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+     id="rect1058"
+     width="115"
+     height="115"
+     x="4.6875"
+     y="4.6875" />
   <g
-     id="g4672"
-     transform="translate(5.5703201,4.3049984)">
+     id="g9"
+     transform="translate(24.375,28.125)">
     <rect
-       style="fill:#ff0000;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1058"
-       width="115"
-       height="115"
-       x="-0.88282001"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426"
-       width="10"
-       height="10"
-       x="-0.88281995"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9"
-       width="10"
-       height="10"
-       x="14.117181"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0"
-       width="10"
-       height="10"
-       x="29.117182"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2066"
-       width="10"
-       height="10"
-       x="-0.88281995"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2068"
-       width="10"
-       height="10"
-       x="14.117181"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2070"
-       width="10"
-       height="10"
-       x="29.117182"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2072"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2074"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2076"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2078"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2080"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-5"
-       width="10"
-       height="10"
-       x="-0.88282013"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-2"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-6"
-       width="10"
-       height="10"
-       x="29.117188"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-5"
-       width="10"
-       height="10"
-       x="44.117188"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-8"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-7"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-9"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-60"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="15.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-93"
-       width="10"
-       height="10"
-       x="-0.88281989"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-9"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-2"
-       width="10"
-       height="10"
-       x="29.11718"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-8"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-3"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-0"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-1"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-7"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2066-9"
-       width="10"
-       height="10"
-       x="-0.88281989"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2068-1"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2070-5"
-       width="10"
-       height="10"
-       x="29.11718"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2072-4"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2074-9"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2076-2"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2078-5"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2080-7"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-5-9"
-       width="10"
-       height="10"
-       x="-0.88282013"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-2-4"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-6-5"
-       width="10"
-       height="10"
-       x="29.117188"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-5-9"
-       width="10"
-       height="10"
-       x="44.117188"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-8-3"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-7-5"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-9-7"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-60-0"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="45.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-99"
-       width="10"
-       height="10"
-       x="-0.88282007"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-7"
-       width="10"
-       height="10"
-       x="14.117181"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-8"
-       width="10"
-       height="10"
-       x="29.117182"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-25"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-34"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-9"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-0"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-2"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-5-90"
-       width="10"
-       height="10"
-       x="-0.88282013"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-2-5"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-6-6"
-       width="10"
-       height="10"
-       x="29.117188"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-5-7"
-       width="10"
-       height="10"
-       x="44.117188"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-8-7"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-7-4"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-9-0"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-60-6"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="75.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-93-4"
-       width="10"
-       height="10"
-       x="-0.88282001"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-9-8"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-2-5"
-       width="10"
-       height="10"
-       x="29.11718"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-8-8"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-3-2"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-0-6"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-1-0"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-7-6"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2066-9-4"
-       width="10"
-       height="10"
-       x="-0.88282001"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2068-1-6"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2070-5-2"
-       width="10"
-       height="10"
-       x="29.11718"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2072-4-8"
-       width="10"
-       height="10"
-       x="44.117184"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2074-9-9"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2076-2-6"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2078-5-0"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect2080-7-7"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-5-9-0"
-       width="10"
-       height="10"
-       x="-0.88282013"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-2-4-1"
-       width="10"
-       height="10"
-       x="14.11718"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-6-5-3"
-       width="10"
-       height="10"
-       x="29.117188"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-5-9-7"
-       width="10"
-       height="10"
-       x="44.117188"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-8-3-7"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-37-7-5-2"
-       width="10"
-       height="10"
-       x="74.117188"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-9-7-6"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="105.38251" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-9-3-2-60-0-4"
-       width="10"
-       height="10"
-       x="104.11719"
-       y="105.38251" />
-  </g>
-  <g
-     id="g4672-0"
-     transform="translate(130.57032,4.3049984)">
-    <rect
-       style="fill:#ff0000;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#bb5535;fill-opacity:1;stroke-width:1.08953;stroke-miterlimit:4;stroke-dasharray:1.08953, 3.26859;stroke-dashoffset:0"
        id="rect1058-3"
-       width="115"
-       height="115"
-       x="-0.88282001"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-7"
-       width="10"
-       height="10"
-       x="-0.88281995"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-86"
-       width="10"
-       height="10"
-       x="29.117182"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-4"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-7"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       width="61.119938"
+       height="60.381855"
+       x="127.47325"
+       y="2.8422923" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2066-0"
-       width="25"
-       height="25"
-       x="-0.88281995"
-       y="0.3825016" />
+       width="12.431194"
+       height="12.324226"
+       x="129.6875"
+       y="4.6875" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2070-7"
-       width="24.999998"
-       height="25"
-       x="29.117182"
-       y="0.3825016" />
+       width="12.431193"
+       height="12.324226"
+       x="144.60493"
+       y="4.6875" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2074-97"
-       width="24.999992"
-       height="25"
-       x="59.117188"
-       y="0.3825016" />
+       width="12.43119"
+       height="12.324226"
+       x="159.52237"
+       y="4.6875" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2078-53"
-       width="24.999992"
-       height="25"
-       x="89.117188"
-       y="0.3825016" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-93-9"
-       width="10"
-       height="10"
-       x="-0.88281989"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-2-9"
-       width="10"
-       height="10"
-       x="29.11718"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-3-5"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-1-4"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="30.382504" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       width="12.43119"
+       height="12.324226"
+       x="174.4398"
+       y="4.6875" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2066-9-7"
-       width="25"
-       height="24.999996"
-       x="-0.88281989"
-       y="30.382504" />
+       width="12.431194"
+       height="12.324224"
+       x="129.6875"
+       y="19.476572" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2070-5-3"
-       width="25"
-       height="24.999996"
-       x="29.11718"
-       y="30.382504" />
+       width="12.431194"
+       height="12.324224"
+       x="144.60493"
+       y="19.476572" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2074-9-97"
-       width="24.999992"
-       height="24.999996"
-       x="59.117188"
-       y="30.382504" />
+       width="12.43119"
+       height="12.324224"
+       x="159.52237"
+       y="19.476572" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2078-5-9"
-       width="24.999992"
-       height="24.999996"
-       x="89.117188"
-       y="30.382504" />
+       width="12.43119"
+       height="12.324224"
+       x="174.4398"
+       y="19.476572" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect1426-99-7"
-       width="25"
-       height="24.999989"
-       x="-0.88282007"
-       y="60.382511" />
+       width="12.431194"
+       height="12.324221"
+       x="129.6875"
+       y="34.265648" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect1426-0-8-1"
-       width="24.999998"
-       height="24.999989"
-       x="29.117182"
-       y="60.382511" />
+       width="12.431193"
+       height="12.324221"
+       x="144.60493"
+       y="34.265648" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect1426-3-34-4"
-       width="24.999992"
-       height="24.999989"
-       x="59.117188"
-       y="60.382511" />
+       width="12.43119"
+       height="12.324221"
+       x="159.52237"
+       y="34.265648" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect1426-0-3-0-7"
-       width="24.999992"
-       height="24.999989"
-       x="89.117188"
-       y="60.382511" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-93-4-1"
-       width="10"
-       height="10"
-       x="-0.88282001"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-2-5-6"
-       width="10"
-       height="10"
-       x="29.11718"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-3-3-2-1"
-       width="10"
-       height="10"
-       x="59.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
-       id="rect1426-0-3-1-0-6"
-       width="10"
-       height="10"
-       x="89.117188"
-       y="90.382507" />
-    <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       width="12.43119"
+       height="12.324221"
+       x="174.4398"
+       y="34.265648" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2066-9-4-8"
-       width="25"
-       height="24.999992"
-       x="-0.88282001"
-       y="90.382507" />
+       width="12.431194"
+       height="12.324223"
+       x="129.6875"
+       y="49.054718" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2070-5-2-8"
-       width="25"
-       height="24.999992"
-       x="29.11718"
-       y="90.382507" />
+       width="12.431194"
+       height="12.324223"
+       x="144.60493"
+       y="49.054718" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2074-9-9-0"
-       width="24.999992"
-       height="24.999992"
-       x="59.117188"
-       y="90.382507" />
+       width="12.43119"
+       height="12.324223"
+       x="159.52237"
+       y="49.054718" />
     <rect
-       style="fill:#01ff00;fill-opacity:1;stroke-width:2.0625;stroke-miterlimit:4;stroke-dasharray:2.0625, 6.1875;stroke-dashoffset:0"
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.02115;stroke-miterlimit:4;stroke-dasharray:1.02115, 3.06345;stroke-dashoffset:0"
        id="rect2078-5-0-2"
-       width="24.999992"
-       height="24.999992"
-       x="89.117188"
-       y="90.382507" />
+       width="12.43119"
+       height="12.324223"
+       x="174.4398"
+       y="49.054718" />
+  </g>
+  <g
+     id="g10"
+     transform="translate(0,1.875)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-9"
+     transform="translate(0,15.781536)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-4"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-8"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-1"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-2"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-9"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-3"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-9"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-0"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-8"
+     transform="translate(0,29.688071)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-5"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-0"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-9"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-6"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-3"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-8"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-5"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-6"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-1"
+     transform="translate(0,43.594607)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-59"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-84"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-8"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-1"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-0"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-30"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-4"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-4"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-4"
+     transform="translate(0,57.501143)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-7"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-6"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-3"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-17"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-5"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-9"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-6"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-2"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-7"
+     transform="translate(0,71.407679)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-8"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-5"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-7"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-4"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-1"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-85"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-97"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-53"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-83"
+     transform="translate(0,85.314214)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-1"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-89"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-6"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-43"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-33"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-86"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-0"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-48"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
+  </g>
+  <g
+     id="g10-89"
+     transform="translate(0,99.22075)">
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-9-77"
+       width="6.8016405"
+       height="6.4325981"
+       x="24.118195"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-91-64"
+       width="6.8016405"
+       height="6.4325981"
+       x="37.953682"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-71-30"
+       width="6.8016405"
+       height="6.4325981"
+       x="51.789169"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-5-3"
+       width="6.8016405"
+       height="6.4325981"
+       x="65.624657"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-77-09"
+       width="6.8016405"
+       height="6.4325981"
+       x="79.460144"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-73-2"
+       width="6.8016405"
+       height="6.4325981"
+       x="93.295631"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-56-54"
+       width="6.8016405"
+       height="6.4325981"
+       x="107.13112"
+       y="8.5917482" />
+    <rect
+       style="fill:#5ae069;fill-opacity:1;stroke-width:1.36425;stroke-miterlimit:4;stroke-dasharray:1.36425, 4.09275;stroke-dashoffset:0"
+       id="rect1426-05"
+       width="6.8016405"
+       height="6.4325981"
+       x="10.282707"
+       y="8.5917482" />
   </g>
 </svg>
diff --git a/intro/intro.tex b/intro/intro.tex
index 4d51a965..68a52608 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -1127,7 +1127,7 @@ thus being as large as possible.
 The goal of this approach is to reduce the fraction of time consumed
 by synchronization overhead, as illustrated by
 \cref{fig:intro:Coarse Partitioning Reduces Synchronization Overhead},
-where the green regions represent useful work and the red regions
+where the green regions represent useful work and the dark regions
 represent synchronization overhead.
 Of course, the coarser synchronization on the right has only 16
 partitions compared to the 64 partitions on the left, however, it
-- 
2.43.0


