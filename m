Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587361C3F30
	for <perfbook@vger.kernel.org>; Thu, 17 Apr 2025 02:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744855327; cv=none; b=U4ouGhZ/TZQfHw0gUbrJINkXfIxuzFcJDzs35CjSHxUQvaZwSi7X8dSNihT7z0NtaNkmOj+yzUfDedGdHyAlqDeVdNBU+T0Rs9tn0vqZVKwJ22RSFCVo44IZl6Nf+VF+BhmDtUc1MOcCp2hbw867fr83DxRZ1dtasw9g3OHlGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744855327; c=relaxed/simple;
	bh=YSC6Ow9VEl5z8CvI3z7rY19TRihgdKfCE0Xmd82S/nw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Ri08XkggHuPvk10HPZ1sa/mUxE3v4aRSxMWYTRzl4VcUmpGBqgTCOOHPB745Hwv7DuzvaQ8B2KpFqvNybaFOLgkY4xtx+QRY62NHxNIb2EAhD2sg+7iSVXDmvYOWxIK9cozjsjXNA7ya61kAA0Hca0V7jJgZVjXlbrS2oYjnyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOU/ecuL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOU/ecuL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224100e9a5cso3074155ad.2
        for <perfbook@vger.kernel.org>; Wed, 16 Apr 2025 19:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744855325; x=1745460125; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c5qU3X7obs9mTR7GcHkeOQG6hd6esycqoFzkUHwbfA=;
        b=SOU/ecuLcPPlt2a1dr2MgmlhK+uV6bJB9TbmrfbRgWrzaC5rXczUeTNfSupgTrho3f
         77pozzqVWscWed6yN1XTXUoY5yd8H8Wdjnv93d68hJ8Fr5OZCOTTH2ydb1frlZHcgrau
         bE5tYbW/oSCBkejAYD+u6tAQThNqrdMKuOinGqZi6vkh8DTtmrM7KgYJGofXvMaZl3Vv
         siMr25hdWWwDJEidzNhCdfUTBEbdJigNFTrDr62XHDfpG80vwNQ1OCnH055U91HXooYD
         7FVnoxLHsflrT32KeCIn7sXxPgmBgAelrw6FR+9tRUVKGNeWjcrQoDs0RQJK6XsI5IZk
         a8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744855325; x=1745460125;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4c5qU3X7obs9mTR7GcHkeOQG6hd6esycqoFzkUHwbfA=;
        b=W8C0FVm9gd0MkAftVJICg7zhpGs5/25xu8V00HHSrsa0gWulfBU5tfhh5gzoNTTHXo
         aSpXAHgT6Qwv80dCG8ESI9MAMPfFSCS1UB66iZYMAqm6ncJjcRiMQt5Tzx5kqnVSEXYs
         /xzcntNonp+Nv9c94NKoQdhCLJBrEDJlg6O9s/6Kh8A+dfPheLMO0+6MlibTgxgihBhe
         EKwjP+QiVsHxEgdR00emKPz9LnaUr3lHNGyxWYeZ2w9xT6EIDKV/nbny92QTnL4dP2/D
         kIGyAE5J4JYx2QJG7zjPK4ABDDnrY99R3QnOMybCouHcHZWES/aaH9V/vRQcOZDdKkwO
         JTNQ==
X-Gm-Message-State: AOJu0Yy838uOPITwYYD9iIHeMwJ6hzeM2seB3Qc22O4e+3r+Sci+bYGl
	i0X5Prs3lvutO6vneiqNdTYeBEpcGClE8nUCwrnqxDgDgrUnJuzBac6EUA==
X-Gm-Gg: ASbGnctl+8NKsx7wi8BLF/zPZiQuEv+U+RiFhYMRgk8pyD2G97wmyIMx64gc9+rPPBl
	jAnTofgIltqHLt9Vt8jZt9St7ci7uCrOsmnKkdmhuwl8h54+7MkKTv4gDzAnp1UPwFMLjFp6TKk
	vSDnBTs3qiGtAhUaDC/vgCz4w0wZaXwE/qPScIAKI5Il4Z71mu1C8epE7Cxr/cgCCHyVFcJLOXW
	/p7mN2e2WM51Jrs4Yqu1XiohdbsGvS+2GP+HcUMTMvq2Z2SNGhzqaTCkf6OWonxKI5I9I/JcZA0
	v+dzCRZ5Wiz7sR9TMtKhz8HFc67MoR1bwBEy6M2MiPO0ellWDqPiQN7DYbldjRV/KwoBRK3z8kg
	G87UEiiZ+B1A=
X-Google-Smtp-Source: AGHT+IHX/1UjVNUT3oDOA77a9VFPR3KsAqhEoOp2v32iIo4XP0LmjpkCBWfwgo/I7JBDPqvAoPpa0Q==
X-Received: by 2002:a17:902:c40f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22c358ead7cmr50731705ad.30.1744855325532;
        Wed, 16 Apr 2025 19:02:05 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b383csm2670483a91.37.2025.04.16.19.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 19:02:05 -0700 (PDT)
Message-ID: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
Date: Thu, 17 Apr 2025 11:02:02 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Ideas on reorganizing terms in perfbook's Index pages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

With regard to "memory consistency" and "memory model", currently,
Index of Terms pages have the following:

  - Consistency
     - memory
     - process
     - sequential
     - weak

  - Memory consistency -> Consistency, memory

, and

  - Linux kernel memory consistency model (LKMM)

, which comes from markings for acronym of "LKMM".

The redirection to "Consistency, memory" looks strange to me, as

  - Process consistency
  - Sequential consistency
  - Weak consistency

are about "memory consistency".

So, I'm thinking of reorganizing them into something like, including
additional markers for "memory model":

  - Memory consistency
     - process
     - sequential
     - weak

  - Memory model
     - Linux kernel
     - Armv7
     - Armv8
     - etc.

  - Memory consistency model -> Memory model

  - Linux kernel memory consistency model (LKMM) -> Memory model, Linux kernel

How does the above sound to you?

        Thanks, Akira
