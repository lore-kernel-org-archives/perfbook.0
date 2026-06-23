Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE4375ADD
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210023; cv=none; b=aBdPrmZU4zO8sbTTsIyZ/pjU/kRmKgi01a+Z4cCwhN6EjxisptkmJeTdjhYla4NIr1pE1Zsq0Hre+qXEaReKlYByQhTM/RZV/u5AbJktiSyD1zIll+NkMGbEgn1qSiS7WhUzdbhKD09m085b2hGAwrAOJEfBSjVOV3wWbRcva4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210023; c=relaxed/simple;
	bh=9O1GPomY0SiFomP00OdMjn70QEVjUWnXkInSbq7pArI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=DMB2IDC7e5zg2ZDfLkvsbiZVqU6fyynrwDORWaSoWxwiHfredaqfYgYx/XI2fCyCVoa03vMya8gruXeeM3bhFWsKmDH4FpKz5OyZyL5sv4an5HU/toSaps66aLBnb5DMTg5PsnehXiSblST3HCaI9MhGSFiadJtoxboYc1Mg48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHp4B9dY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHp4B9dY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423610ec93so5057531b3a.2
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210021; x=1782814821; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cVY33KIBLPITsl0qSk3ch4avPHHz5EJPuleR0LVPF0=;
        b=ZHp4B9dYixy7oBFSkNNoelQ/Zi2JqYQ7WmszrngPx22KpkjNyHmdzqGPdH7ifbaK5D
         tfvqa4p1jSqTpQNwQcoP7fYDLsVy2s0jk4QteTpJHiLeNDFecIMZIdWdp/8RzHMbEV2l
         wRwYVppiQY/f3uW2hxGVwlD56qknBJyGBGXhzoPC/rUKnGA80vFU9YecyW29wnVhQx2j
         SJd9cIF+uxszUYV1O3myKDZKoznvBCMDyXtly06SwNocqnPE2vPikT1YoAcq5wUDXh8X
         cvsT0bb1AKkti+hKKP9g08ACijbou7sJ+pHiDagpMbMP22WsjzYdmJSVoBaxnJYEqeZB
         2P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210021; x=1782814821;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cVY33KIBLPITsl0qSk3ch4avPHHz5EJPuleR0LVPF0=;
        b=Rap/rMuNzGs9y/OJFQbkZg3vUFxaEBElWAcGldEBFpdl1rr6jAiWZmy/gPta3v8VZY
         YvY63XmGaUxAF2CtIslWAGJ3dKNBA5Y5dfR6XyCVgWyuseyEQzZl9f9Z5K4PRg139kTJ
         Z5t6IX1MVgJ4WeKZ5qcFWoaZmd2QtM5spF5HLKmEHyu/opDsbHJqtsIpWVVX99XRhxw/
         tdAlk+2heL+54nKqp+vMYc46KKqtCpu6anLYAY8Fu5HmCslpHNVXQ77295HSnN02gNsb
         1lePXs5fTd38rQgPULcbXexgAyV/hKvQvNuHu2ysM44XIvSM5YbHIPTmcm4bwIJZ9C3c
         NoNw==
X-Gm-Message-State: AOJu0YzpXUMNYCKfr4LXAZAO/jEUSxbpcjaotaMDMJ5TKkq2mvGGDtlk
	x3I4jKLftMkDkWERsfS8SeiKBmUaTVoTi0YydgaEK1kDR/ChMdOlIWz9
X-Gm-Gg: AfdE7cnWpRebreJD5qT7f40MxBCSD0eNoDBgt/ACyaOs9ZP2D4NRSGfEuXwvHAnmD0f
	IVOVL6hRAhZTtfX4AXlcZ1zFIB/gToVY6V6rKLelaps0f2Ws5+GzsOurqpgcOeqf2Ny2mgvYzFj
	+ncM2uQFX9kpsa8T+k4T+lXmZtMPeiMbcd8AhRG/XK7ec+rrfm7brclOSREVxKaa+7PiAfXcHNJ
	ynY2Yut+BnI6n7TQLj//E9UVAHZMvdEGmnrXL5C9VH+7encj3XZUqO3tXc9hJ0+Vlut4xNgx9aR
	5MYOWj98+vBfDYKfayT6s0VF7czwVD+hyhzEj4lLSrffyRsBIX9t4e3lQhj8tLT1EEHdWEVsVan
	jSv/cDDvvKTQdvSmLcZZOYG2rJLhV0VNT4oSTdup70ZzicOTYOt3o40n6cxGpFllFYvkFoLKMZ7
	0CavX2ncKFa9Lys++o+WcKe8joHeW8ct0BDqU4UUZ8JDNJTsJcxrlJrHmlHw==
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr18918078b3a.9.1782210021111;
        Tue, 23 Jun 2026 03:20:21 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm9789522b3a.12.2026.06.23.03.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:20:20 -0700 (PDT)
Message-ID: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Date: Tue, 23 Jun 2026 19:20:19 +0900
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
Subject: [PATCH -perfbook 0/6] 2nd batch for June 2026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

I found recently added listings 9.13 and 9.14 can be made
more consistent with other code snippets.

Patches 3/6 and 4/6 are my attempts for making them nicer.

Patch 6/6 is the usual update of rcu-test-ratio.

The other ones are minor fixes.

        Thanks, Akira
--
Akira Yokosawa (6):
  runlatex.sh: Cope with missing cleveref.sty
  Stop loading braket.sty
  defer/rcuintro: Tweak Listings 9.13 and 9.14 by employing fancyvrb
  defer/rcuintro: More tweaks for Listings 9.13 and 9.14
  defer/rcufundamental: Fix typo ("cannot not return")
  Update rcu-test-ratio for Linux v7.1

 CodeSamples/formal/data/rcu-test.dat |   1 +
 defer/rcufundamental.tex             |   4 +-
 defer/rcuintro.tex                   | 114 +++++++++++++++++----------
 perfbook-lt.tex                      |   2 +-
 utilities/runlatex.sh                |   7 +-
 5 files changed, 82 insertions(+), 46 deletions(-)


base-commit: d7c24ba666e292263b36954f8d07974422f3e034
-- 
2.43.0

