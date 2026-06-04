Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8204A07
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567804; cv=none; b=RaZHE3mTEZavnltuOsSi5Imx1MUx+ygJIL23DyXSRhOAu5/GHU+NuKJUvQnIGjoAQYjeqJHs30lCtyOz3EsMoCOYbZ9iUx87rBwqO5Hna+wei4iGi3a8lp+JoLSj9haI51hV9GNnxit+8JrgRTDWd5qWOmIOOU+cUBahu1GBAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567804; c=relaxed/simple;
	bh=P7NIKAS2hu0yNS+hehNG1SSeKRx5scIU1PiO34QGJfA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=q7jY6p9g9NgwRC69oxcToFGpLAJTNQOqVkw1bcOCkZ6nmioGYiSTM2ytM2JlBQe3IcBeU+U0+i9F/d7zwAeNL8lbPtqi4wRW7XT+xdKjUgDDgPNO6ixmDG3vY/pBxvxgf7PYE/NdcbSBTe43sBZSiaMhhRHLU5Qwhqiz0imSldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDqgeu3i; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDqgeu3i"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so3527795ad.2
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567802; x=1781172602; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8x/ZhUedzA+ETK1hZwvjOZ6mp0YYVbn7yW2T8yZ8Os8=;
        b=fDqgeu3iERkoMbppLaQr+mxSyqMjAXzr5SaHfpa8XWNjC7snkjfjlUPHt1cYEGEWdg
         mgVO1auU2JOTX4x9UQF6gHxHjLnGw98oa+Kwva+RRra5EZGs8KDi1PdeAuG6ASC0iD6d
         +HRy9Zy7Bnn4o52HOvRNHRvziTY5jQQdJV2v1+Ya5jYJL7VVN2Tp7FGH+ccyOBe/TRsg
         Z2ozV7ZBMnyxM9U2DzblTaq3gLrDB8p5YLdb9o3788SKnty6RJ8Km2XGD/W11IE0scEX
         pWWoQDCYJQSuxl6HSoR78WxHIDIxmIufVz7jk3UPiNcAuUkn9k6Vdia0fDVxZeamJK0/
         PQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567802; x=1781172602;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8x/ZhUedzA+ETK1hZwvjOZ6mp0YYVbn7yW2T8yZ8Os8=;
        b=Hsn6bgj+gwzyfcSbhDY8N/HdhrXJzcc9U052D8IlKXWr/DwKOU6/KFlHtxmgFNS3+R
         FDPtPuhk0vpyAacH607Q71so4094YKXyAmFnGmI6ocNBIxFZlhf67weS9wkO/7tuTJFz
         hY+K9rl5KOzk8oWEDzPJCzaYmhw2vOai98usgDXfwjBr+elTZ0Ky0cjyNWIOQXJZQnTJ
         e74rSS4sUZVvV1D0ORE4SBcoLGjrXH3wsDxEWeLhO5QjVPeln2vY1JZZi5KV68N0XUDU
         OvQK0KA2zLKANTZNm1EaJo/VF7LeJEzW7WMg9beK8w/D8ChbKR/79UGAp+ve0HQmwPUv
         jgUQ==
X-Gm-Message-State: AOJu0YyEGELJkLJzmxBmpqmj/6z6JMhkTvNaCofonvQoi/cqFnDdblEL
	KlOAGWOKc7x5CqwmzuDgN/YarM1gUFaGAeIAIwCj7K3xh9wc8mbzxr0b
X-Gm-Gg: Acq92OE1bTG4sgxp+VCA3cpUxRWe4YdcqcWSP2lYd8RQuJm+WM6CEv2UnibzTO0riQ5
	cBJn9Jja1ZfSHY3moQaxXZrsIYdnjAz0G00ihhcYlx1h/FsJU7ocgTsEdRXPgTzXMXbBszWDo2E
	aNEitLX5gSfQkHghRQ5ji1KtyM95rxkiqaYsYK8lXUziFnrnSBGtO2AJ1E5DOx+Iq/L9XICsrj5
	fIDO9JiGo41Hrq3rbRQHNyeYkh/EPiZWOZXZBiF1uSS5oaxtrc6Jnnk89DMre2pElB7of+CQZ84
	b698v4k2sbAQDdApWVyMNw+rGy5isUm88VgMRF1pcSG5ED3kXe2krQXMH5RtFlTU3N/WIfetwfE
	GIHsSz7olycHGhl6Pr0lRBucuZdHMeu+yDXAO7nsVROBlr+LUosTRBwpU/5zqmRW/v8VI9Ggi7z
	pceb8DhMF/3AxGYDwsQcmgiLC9CcmdmxfUNMWOnG7pAcproyN7E+DMqDjMsb2lQgli6K/9sjxEh
	zrJct0=
X-Received: by 2002:a17:903:2ac7:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1643aafcbmr79175085ad.37.1780567802183;
        Thu, 04 Jun 2026 03:10:02 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cd24sm68872685ad.57.2026.06.04.03.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:10:01 -0700 (PDT)
Message-ID: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Date: Thu, 4 Jun 2026 19:10:00 +0900
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
Subject: [PATCH -perfbook 0/6] Updates for LaTeX2e <2026-06-01> release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Newly released LaTeX2e <2026-06-01> is not compatible with perfbook.
The new LaTeX kernel doesn't allow both of arydshln and tabularx
to be loaded in a docment.  As arydshln doesn't play any important
role in perfbook, I have decided to get rid of it.  See Patch 4/6.

Another recent headache for perfbook is cleveref.  Patch 5/6 resolves
it by employing "zref-clever" and defining wrapper commands in the
preamble.

The other patches are minor fixes.

Updates in FAQ-BUILD.txt and under docker/ should follow shortly.

Thanks, Akira

--
Akira Yokosawa (6):
  memorder: Fix typo ("`" --> " ")
  runlatex.sh: "iconv -l" rather than "iconv --list"
  precheck-tentative.sh: Allow "v4.4a" style revision of lineno.sty
  Get rid of "arydshln"
  Stop using "cleveref" with LaTeX2e <2024-11-01> and later
  memorder: Fix use of \cpagerefrange{}{}

 appendix/styleguide/styleguide.tex | 355 +----------------------------
 datastruct/datastruct.tex          |  19 +-
 fixcleveref.ltx                    |  12 -
 memorder/memorder.tex              |   6 +-
 perfbook-lt.tex                    |  91 ++++++--
 utilities/precheck-tentative.sh    |   2 +-
 utilities/runfirstlatex.sh         |   2 +-
 utilities/runlatex.sh              |   2 +-
 8 files changed, 83 insertions(+), 406 deletions(-)
 delete mode 100644 fixcleveref.ltx


base-commit: 15b4ca760b07bac138b9e0f6467e6733ecc656dc
-- 
2.43.0

