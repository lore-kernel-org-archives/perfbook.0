Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CF176FC9
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098916; cv=none; b=IGgrV7wAn5eQoSIE+PUHb0+WS2WliqcWM8LPg08sbvLAe9/ns6Aub5KxssjY2h32Xq0FXM5sD2J3sWAGeyMrEp3t3UH2GceviptKaxyeDvOloZVX+wLxkZZ7UdmkyszwyISOJTSIPJpcVADgt7XzX3iG8Y2StkdCz0yk6D7x7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098916; c=relaxed/simple;
	bh=Jl9QPU2r1/2S7cC9EQUVeKmLI0atTKb5Pw2fH8umP/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5Q3NzNHoGM79UqebOR5KFD0SFBx0O6p4riouiI+J0asLHqs9+c6kxlA1LmSVpjEpGcZ3Dp9S2F0AEZ/6GSJZJ9mCq2DVLJUr9JS55NP3Li6LLiCzfiihCQlR4ms+CgbMG4VGaG+Pbuyvy2bhm8i7G+o32XTeQskRh5m/CXwA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmm26G9C; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmm26G9C"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so2063638a12.1
        for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098914; x=1718703714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=14w3qUt/aJcvSLwP7cLJswBND1MWiC8vn8+uho8Plzk=;
        b=nmm26G9CFQnTosyVXjm+M7R4wziWQLpUZXP5/9MnighPi+PRe7KlxClmd09cuw90h+
         5O/hTUYg55b0B2AqdYTfliK0inZWs16C48kxAOvPCpFSbbwZ3avfu7cwj51kom1YWblL
         ZYODvHDeWBdNUWYFrWXGbzJGpKrgA6JqziP1Y80tM3hLaZ7R1vYcqxv+P5KOvrIBBSws
         CbjXHDfJR1/qSw/u6adtQ+cOCyHL/8l6Do5kw5S9Y9WlMPWf6YhiyE9LsaMHDoxOqQX3
         jeCJCRjIzlZUdD16f8q29jt9KBJIVkCiEMOTQzItHvy0OAd0xFc8XoKDsw7M39ja5GVV
         iHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098914; x=1718703714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=14w3qUt/aJcvSLwP7cLJswBND1MWiC8vn8+uho8Plzk=;
        b=aFPsJvjXn1cDzad5s5wrYi18dzYgy9I4rYYQLxlFYcmI9TU5PNDjLHdD/x8i7T+UWS
         vgRqhz8e2IOAVvDNy5qm3SK4U1JKu64AQM9IwY1izkYI0aujdnxUNAq9cu06+mv5sa0a
         v/2SS2ES/+631OZfv6aFkF2rXhNb0LRDnl4OUk8JMabyDzaTJBT3jaLFYGblhpdVdypX
         Q/6XSPsT5oHU7dx0S0IXqKc1BNOdKxBXz44oW6M2NU/Ckz0p2eHG4IEYJPVeXghgzOoF
         rYSsM+pHEkl6xX6FBZz1FhGgTbyRVbvXMixyCdxlC7M4hVdQXZf8P6kjVGNUMzpgeUoB
         GKlg==
X-Gm-Message-State: AOJu0YySgN+ogZONb05s1XQXw38nI6ACnTvEAczgN1PdKbFNhDza81lX
	YS8BFwFjkI+O6PRv3kCk6kWJ3ILgR8fL0laRThb1PDVcfpBxaNmv
X-Google-Smtp-Source: AGHT+IG0u3jYJF7j1w/ajknBMoY2CRFkyeCVuUSVNN5A7CxXEefN2R9oBmCzHMxveI+jsPCKmdMt8g==
X-Received: by 2002:a05:6a20:431a:b0:1b8:54f8:385d with SMTP id adf61e73a8af0-1b854f8396cmr3454609637.47.1718098914084;
        Tue, 11 Jun 2024 02:41:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ab9bsm96626125ad.71.2024.06.11.02.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:41:53 -0700 (PDT)
Message-ID: <42dc80ec-a5c9-4149-9b3e-e04f81161696@gmail.com>
Date: Tue, 11 Jun 2024 18:41:52 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook v2 3/3] Use date as rollback options for glossaries
 related packages
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While discussing about rollback of the array package, array's maintainer
recommended using date as rollback options.

Apply the same approach for rollback of glossaries related packages.
This way, it would be obvious that those packages as of early October
2022 worked fine.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 3c6fb9f3..20394851 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -86,12 +86,11 @@
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all,pdfusetitle]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-\usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
-                              % indexing macros
-% rollback glossaries related packages as well
-\usepackage[toc,nopostdot,acronym]{glossaries}[=v4.49]
-\usepackage{glossaries-extra}[=v1.48]
-\usepackage[longragged]{glossaries-extra-stylemods}[=v1.48]
+% rollback glossaries related packages to versions as of 2022-10-01 or earlier.
+\usepackage{mfirstuc}[=2022-10-01]
+\usepackage[toc,nopostdot,acronym]{glossaries}[=2022-10-01]
+\usepackage{glossaries-extra}[=2022-10-01]
+\usepackage[longragged]{glossaries-extra-stylemods}[=2022-10-01]
 
 \usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
 \setlength{\epigraphwidth}{2.6in}
-- 
2.34.1


