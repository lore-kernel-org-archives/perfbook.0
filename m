Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E779C8
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096794; cv=none; b=GrazkA4UB5joT3C+cTn8rE5Wne0PMbd5IrrEZx9zDXM7pigsDte1Gvdrop5g4rpZD62fPfo5PYPlWtA6h5ETTS/VYWrfOuz6mKtCW349aXRZrvsnaMkXsA9VOT4qzubSdutweIXxJaO785Qkzht+KbvOE53mzlm2agfTs88k60o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096794; c=relaxed/simple;
	bh=QmN8s2lWiqx71oCHrdj8b/jSae/i6+Oh7FtQT0Zzx4A=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Y+xCWG/FosjrpgBrr0lLkEtBbXDk9tyVJfzLCRSwM+SRiZfC4ukTIfxbpILVg/W2BAATiACuK3RWDDuNpigoTtAjh2WEZjpCcQwf5p/jEru9cx4cPlJxNV4V1xnq0DBvseVr+tSkcXs6scrykWbdyq+oMNhPMFB/sC5oQYjV3+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQuN4k/z; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQuN4k/z"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f4603237e0so3513000b3a.0
        for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718096792; x=1718701592; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20lhMh+YxrzHifN7Fp+N/NFwzKJqv5ocfMpwVbF+SMc=;
        b=NQuN4k/zI11c/YSrXX1jduZFuRo/bb6o4/bxLI0FCkLKHZUnJdaUQV8q625cw8HY2h
         2buPEEKDXWygBILDUjSTxbmgttMUNKx8Zr1iGW72KLw5flES9+oD7jTZsiR0HOLTgTh2
         H5Dxe0M2+gb3jmiPwD0Lty6/Z11rm4OrNKFaXlmJomB6DkK0C2XkauzZijFZj1jQX8jd
         0Fxt4fmZpSS8BE0ldKcGZJZhHFDcKU0OLkzoy0uMhUJA0Z0gRu5kgb4GdxuW7KwYIBwg
         DDeAH92AdVq5+80ztAV46K6eJmFZAyewxskTT1klBJVSJ0zPgXTVNybSNuWC89FOb7lA
         HFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096792; x=1718701592;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20lhMh+YxrzHifN7Fp+N/NFwzKJqv5ocfMpwVbF+SMc=;
        b=iN8oAztlKZbfzuPOxciE8pbM/MlxcFLI1MIabbGEs87UsW+ZPRMyruPN11qgjBOu2m
         PUctPJYlzl0voj1o40uWJd25z2414kLFQ81bIPY3Cu81/yqjpWpCxJpCqblR5HP8JhFx
         pw8mJsw8JMu+4KRnGY4JV4+JVhBdeOtF7+8VEwy8H34TnRpOrz6GV7FKvXy7yYBsSXmP
         HJU8LJTVCAfRX0TCoOWQ8rSUJv8OVvAdLFcSglyR8Wtf92IkrveUZzo1aacYuEp9l1jC
         AJUFKwFuGGZ7esqTjmItUrsoOJDh4K0Ake54D/rNrjY1A/WcBW96BLbXGaNBLPOwd1HE
         ALyw==
X-Gm-Message-State: AOJu0YxBAkj90xy+XXuI4WjNNXU9Z3aszaVM74rdj2frZv/S+ZrGP5Te
	AJTdm5cxaZ03/uunBzy2fT5n7KsMucEP9NGB6Fnir0jzx4NeHt7/
X-Google-Smtp-Source: AGHT+IGPiOW9Bba7krRBxl4VFX7sTXFKC3diUe96Qj7UHvG1iMb2p2qg7unFDOSVjiGM7/C7VBsN8g==
X-Received: by 2002:a62:e40d:0:b0:704:1f04:954e with SMTP id d2e1a72fcca58-705a848b20amr2675657b3a.5.1718096791822;
        Tue, 11 Jun 2024 02:06:31 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd37949bsm8567296b3a.19.2024.06.11.02.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:06:31 -0700 (PDT)
Message-ID: <43076436-4692-43b3-8607-5ca85a4fb84b@gmail.com>
Date: Tue, 11 Jun 2024 18:06:30 +0900
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
Subject: [PATCH -perfbook 0/3] Work around backward incompatible changes in
 LaTeX2e 2024-06-01
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

As I mentioned earlier [1], recent updates in core LaTeX and accompanying
changes in the array package broke build of perfbook.

There are two modes of incompatibilities.

  1. arydshln assumes array's internal implementation of a past version of
     array, which is no longer true with array >=v2.6.

  2. A "LaTeX Warning:" message in loading parnotes.sty.

Neither arydshln nor parnotes is actively maintained, so here are
workarounds made in perfbook-lt.tex.

Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
earlier.

Patch 2/3 enables a silence filter for the particular warning.

Patch 3/3 is a follow up change to use date as rollback options of
glossaries related packages.  By saying [=2022-10-01] rather than
[=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
well with our custom code for glossaries & indexing.

[1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/

Akira Yokosawa (3):
  Work around conflict between arydshln and array v2.6
  Silence warning msg from LaTeX while loading parnotes package
  Use date as rollback options for glossaries related packages

 perfbook-lt.tex | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)


base-commit: ef80c4a3ecb96f115b27f1d60bcf7448074ea2e7
-- 
2.34.1

