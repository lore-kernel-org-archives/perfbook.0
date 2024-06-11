Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75082230F
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098469; cv=none; b=Exkqjf7mT7gllWeTJZGFAb5HRyNfthDFwmLzhxtAq7mBfsPleVpQhVpfPbQGI15Pb2kMo7Ac91f/DggRU7+E+impboVDQN1ERvKfRYM21TIU++TF2rZzWhhkF9GL4hfm98FRRKYtF+fQqNEVZAkbYMeXgJNT4CPVsYYZzZBSJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098469; c=relaxed/simple;
	bh=vLFhpA0aBrrOt3JKp9EcfzTLNJveGszUidsQ7bve0cU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=hTOY2qJI9mdHxAOQ1mBNVIOuAI9TNke8s/TKk2SMVlLI1gkPR8KXssPvLK30IF/5Fdz+3syvDhqayrnd5M4KEomIsjFTj9ciNeK0I6CHwsvZUUdbyKYoFAsWueSiNico4Uw1VIYQSGiqzSqEaWvxICfeMqepLH6zdHQ/+4JwGeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp0Vojom; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp0Vojom"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b45d6abso43467945ad.0
        for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098467; x=1718703267; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw9S4WZMDsDjapwgMcnV66wqFJlvzq1fJST/BBHkPuQ=;
        b=Hp0VojomykA3iYGdcPoTDmHyGJYdqyGFIb7/4uCaw65bF6qEZ3mcGVOZktPyHbAuH9
         6WTNNB/OLtFU2BQi2xqbYW50BISDRj8X5cpTOKjUrrlRNWE/mo2HZgaQWmdpVde4wRpv
         kWdaCXb4P2XrZrLqY7RXzh0Ecngp4y0KrUg+OQS5UNokL9m5PKXEibw9OicBVkWlPprc
         Gc6eGKfMnAGUFHC+D75oMUkFVd5XDpMG87lQ2rTIZ3cj9mPYlJg7tdMkj/Hl2uUYei+V
         LBDThZ7pyvlIYljyT/A3eJwp+pDeThV0wK08NusoXdfPG1bZ5JvWbrkancUjjevhdGF0
         bq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098467; x=1718703267;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uw9S4WZMDsDjapwgMcnV66wqFJlvzq1fJST/BBHkPuQ=;
        b=asSPpnqbmxkk20UPBCiCam4M+6SJY/A6WDoYjBu0h282Q7IeIH1RJdm9Y5eqrC9Wbs
         CaldgQvor2argPF88EcJ3VabUqH9F84sotDsFXpBye9QuSgtCQ7J70PuL3WqkcJ5rWNs
         w6vZ/H5qodB1WIv9ktrocI4vsWy9ngHIevsHwVwm/1sIRX3C/HMbZ5xR3f16qgu+gVDw
         3BlHun5dCCDYhzo1eLtG9ke0lSA/JWHVe1U8fgf2m10hqBlJcdKF3W4ey/qxMI1/jqDz
         1EcfGPlTthHifBrfF/RtYPn+A0X/uGVK/2dg7EBeUk/0xpOZifC+HA4nvge+YaKrJZE9
         BgFw==
X-Gm-Message-State: AOJu0Yxg3eokIHEMuHVsp2GpQWeX+GH+LKl2oiNB377XIgRdCUNXcs58
	JUOCAR/rkOIZxqkfHrCh+lCibJeV7JMEbhszX4zdPkBlJunQapmy
X-Google-Smtp-Source: AGHT+IHtVl5bIibQrvjNrJ7hw6eWMyxD0WpnRHsC/9xOvVkgyT5NvOhKV0GhNf0WlH3hGodXTH4+xw==
X-Received: by 2002:a17:902:ea06:b0:1f4:8a01:283e with SMTP id d9443c01a7336-1f6d02cc84fmr133084725ad.5.1718098467255;
        Tue, 11 Jun 2024 02:34:27 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f7864c5csm54720805ad.275.2024.06.11.02.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:34:27 -0700 (PDT)
Message-ID: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Date: Tue, 11 Jun 2024 18:34:25 +0900
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
Subject: [PATCH -perfbook v2 0/3] Work around backward incompatible changes in
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

 perfbook-lt.tex | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)


base-commit: ef80c4a3ecb96f115b27f1d60bcf7448074ea2e7
-- 
2.34.1

