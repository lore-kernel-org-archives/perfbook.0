Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C48814
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 01:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896199; cv=none; b=MOGTZGp/YihIhPF5XawF87UWxFkKn7WNCmkdcf2FgXrVGrZS9bqJlBAG1qyaAbRkGLGI9Chu4wPznd6gOHdJJ9gGkreR55iLz84bEgYcyw4bq8ZroLwoujURMFKziZaq/gX6dPMz4ueq/ISR/ZCjf2oJdhYXHcKuu2VpUxmoxew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896199; c=relaxed/simple;
	bh=FHxcBnD4AJFFYvQVp3sj1QitJk8XrllRBNsOhEX1UX8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mtBVkCpk+/Mj7FP8y6ogRLUAs8RBqoOT/8eWJFFYHuWnw5Pt21LPZhsnuU18W8NVSZr1n8OMruUumdb1w9TRyon2oll93bNw+a31t/lxtFOzgdjR6LsrPMGaSWMwilazrpPY355Ghq1Dbd5Qb+WjmeqlKm2eA6scEIBcCWgL3jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpFJftSt; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpFJftSt"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5de8647f0d5so87341eaf.3
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 18:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724896197; x=1725500997; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYdjRqUJVapZB90HEHiS5XQ/TjqODCn9ZTTMtdFcNGY=;
        b=TpFJftStOeglCxcsEGsENx3zXzQIucQTYXUTaBO0D3mg/8Bq1nzC0n77pzA9NpfQDS
         hbfNQmD+FeU8JPReNX9vOPcCRm9xK+HFdW1G17YGQDSa7I461GxkeMFa/9FraO5udV8w
         sBmwke58o797Oz4NqgjuUEzu2nMI/lvKmStZoWksyDQrx2qtEAZO+1d1NdhbOC5RsBMd
         g98imrfTgu20h8p8ra8A4JfJhodD/3dpyLu4k4YsO2RJCqDorX69NhjvkiEGxenZDzWB
         9pho8/Fa3/tVts9YTbIe9Khz7SOlB1L/Fbfs+mY/2oQPdj8IS9QokN7MXlUjIhyCZ2hs
         7p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724896197; x=1725500997;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cYdjRqUJVapZB90HEHiS5XQ/TjqODCn9ZTTMtdFcNGY=;
        b=d3u5YDV5XILQe5WRDFgLxI61ystsmHpVzvqfPtGhrtk7WDR4nA0cu3gssm2tAN68U9
         qzxlW8kGd91OLFuePlbKtRP3jzF9UMWBbyQ1/tV1/phtThxQBiPZjLD/zY77lc+3Wkn1
         k+P1+W/xhc/bT7jvFvSlHquakLpmugJo7sczIAG1RI5mXMLnGWnW9Ym0Gzdv9W1FXgpy
         nYMz+NCchCAbYoHOWUy+njfrHGMqNecYXulihZvLJTXzell5OFi4/qcub6DSzE/uqeU9
         KHTxjDmZASwVy50HumCrf0UZRc24ODMXFunK1js4D0afO+Ajg7WRvQveMZozGIr6V3zp
         Sr3w==
X-Gm-Message-State: AOJu0Yzl+QICvqVnJXvayog8PhCgTiQ/C1ZMj2g0UuAQw/REB4hzI26M
	C3s0KagsNcZL51HVnS8uC8lVZhObxilD5DpI99v7yvqbTNSlLSk0
X-Google-Smtp-Source: AGHT+IEZEmXCboxt5XapNnj1vn71rmUGW/mR9zrP+l4X12v50cRc2ZTYi9KGrwKsxAN2nPpb3eYNFA==
X-Received: by 2002:a05:6358:5292:b0:1ac:66a0:b6ae with SMTP id e5c5f4694b2df-1b603c5db07mr186287055d.15.1724896196593;
        Wed, 28 Aug 2024 18:49:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575c417sm116058b3a.197.2024.08.28.18.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 18:49:56 -0700 (PDT)
Message-ID: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Date: Thu, 29 Aug 2024 10:49:54 +0900
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
Subject: [PATCH -perfbook 0/5] bib: URL updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

As I mentioned in the off-list message to you, it looks like some
(or most) of citeseerx URLs have stopped working for a while, probably
due to configuration errors.

Patch 1/5 replaces such URLs with (hopefully) more robust ones
or DOIs.

Patches 2/5--4/5 take care of URLs related to "Synthesis OS" and
add a lay summary article of LWN's in bib/os.bib.

Patch 5/5 employs underline-style hyperlink marker in bibliography
pages for 2c builds.  It avoids visual interference caused by
the current light-blue-border style.

There remain quite a few URLs under bib/ who need updates.
I'm going to take care of them.

        Thanks, Akira
--
Akira Yokosawa (5):
  bib: Replace citeseer{x} URLs
  bib/os: Update URLs of papers related to Synthesis OS
  bib/os: Add LWN's KHB article on Synthesis by Valerie (Feb 2008)
  defer: Cite Valerie's KHB article
  Use underline for url links in 2c builds' bibliography

 bib/RCU.bib      |  2 +-
 bib/WFS.bib      |  4 +---
 bib/hw.bib       |  2 +-
 bib/os.bib       | 28 +++++++++++++++++++++-------
 bib/syncrefs.bib |  2 +-
 defer/defer.tex  |  3 ++-
 perfbook-lt.tex  |  2 +-
 7 files changed, 28 insertions(+), 15 deletions(-)


base-commit: 971b39e51a1f3b808fe49088b9e3f3ef0c137aca
-- 
2.34.1

