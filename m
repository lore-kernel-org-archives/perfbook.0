Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA039AD6
	for <perfbook@vger.kernel.org>; Tue,  8 Apr 2025 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125843; cv=none; b=DWt/SnR2NzXnn1HrLUWkbG6g8+x28WlyayLx5zlkHnuMdHj1dMM8PeEZsp7RQdqjhXS9wzWLxfK+t+dfQyQf+3GC6PETNNRgMnPb3vfMvYxOsXJYqRStnO279yyfYBWVEE1CIHl7u5r1lDoOFCCMnKnhJetKHA6154CwiHjzqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125843; c=relaxed/simple;
	bh=55G3ebZyFoLjTJXAE5y1a5UdEAZJNaC6QD7oB8jMRzs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ojaQbBB4qt8gklVR1ymmbQ8vRJiPfYa4HBEEGUd0J34tUbwQYUTbemS4c6CyOB3rNSforsp3Gq8e7iQdHcVI5p5cXg3X5ql5YeqjKjRJEHTCXncTwUpl3M6lBi81fgi3mGxKWmCiiPVUWH1ek4XN36rFdxNdwQpnz/9St+46dZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9O1UDUI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9O1UDUI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b433so56350275ad.2
        for <perfbook@vger.kernel.org>; Tue, 08 Apr 2025 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744125842; x=1744730642; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9ihgYjWH2MFfls4EoPANIGtjiFR1+5xecE4XJRREgU=;
        b=i9O1UDUIWe1h+VdvCh+GSrNkSInAVlehfdl9QU8H3c72yBrJxZVq4yLg84fW9gAV5w
         0mv1//hq7a/zMuba+y87PX3wQgjSUDAHMFrhVX91pwjWC3TuOwdeA9LEp2s5utY41oqz
         llh1IXzRfIrfV8aFZiYhbdkbhPR1JyHIOdY6hyy0Hx+xiyNHdMGaHLQUkSsXh3cQL9/G
         jb3pdFp+uk+HTb5MpUV32sXPCnaIf4cJr+yKReon0O8q/NHt9UO2jRkyINC3mBXOIQj3
         DLdvaex3u3iexbUcqhWn3dsvQwTnSEZETJU44DeXt33IPTrVagmYyxVYOhb0JPWjJxyS
         i8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125842; x=1744730642;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v9ihgYjWH2MFfls4EoPANIGtjiFR1+5xecE4XJRREgU=;
        b=PSkxsf3tAU9fV+C0D8FsvFiI70feGqldd3SjM4br1UOWyZrkl8g5Muss6otHDp/njx
         wnHnoBa/boC0+eMYBhM2kxGuDBeO3BaZbaHlCtNQao7AXtKm8jdKy39QHwOHKaO04F51
         5rj8fGrJ/w0VACI4iD6Sg97vxIGdWIo6qj7kqVh6vKuf4sRCN2fP7/Ws23YNT/iLHyeC
         vmznMlLje+/W9QiU81hDHxIwoEtAVKXeV43vp5WPwj5rA8X2WUn7A3x/6jZl/nkvV2Ot
         XmZPfrxnn6lxEm07mN2PB1dCxAREuyQfwNhOxSuBk6sMbBYYqtTY7yuAu1ZL2Lu7jEfL
         4ENg==
X-Gm-Message-State: AOJu0Yzq5l6pK0apvvGWhot/vSq4k9yApK/mGqX1Nop1Tsk0f37JF1Dl
	AOG6/bAGhOk1nHEd4SXdS2mTE/P/f6Hev+8UtB+BNAJWrPil6KDLyhdLAQ==
X-Gm-Gg: ASbGnculP/IyKuOzmS5TH5BeHJY53a4WgPWR2yiAFkHc76+hU/4EhAT4S8LrB2mm1Ho
	O344wWKQvIKY87oZsubSoNVFi2WynDcTbdbv/IFiCdbKvfIGfSt2elsZ608arnyZIAJwQmYW0r/
	qV2i2N8bOjBvCXeHcDfFKax3cFgwmhWlyGDbAN8a+OkrY6CU4PLHadDCfnvhIqkAocfrzKyUO8E
	wqUGnUPffff8oGIYIKFbHYTSHyLtTnY+49Xlm2hDO0T6UbSUknZUpXAKDq5hHV7H9vlSQjkh0xr
	ycwILFd54b57z97WWTxySW7Loiecj6EVmyOUzoIW6YXCBftx7Im/ckSlNeYytHNAGvPOs39k7Sw
	PexaGQVJBXjAiG961sDetMFzvVQ==
X-Google-Smtp-Source: AGHT+IEmsTt3UnXBEsYdcFtf4QZhJ4bhzdwExrYzWC684iC1L0/eQobH/6hVwrSGYd3fsPfjzK1eEg==
X-Received: by 2002:a17:903:124a:b0:224:2384:5b40 with SMTP id d9443c01a7336-22a8a06a057mr274050565ad.24.1744125841758;
        Tue, 08 Apr 2025 08:24:01 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1c97sm11058626b3a.19.2025.04.08.08.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:24:01 -0700 (PDT)
Message-ID: <e57996f3-2a63-4de8-8a83-c1a6156a1e76@gmail.com>
Date: Wed, 9 Apr 2025 00:23:59 +0900
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
Subject: Re: glossary: Add definitions of the flavors of multi-copy atomic
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Current master at commit b8bdf71fbc31 ("glossary: Add definitions of the
flavors of multi-copy atomic") has new definitions of:

    - Multi-Copy Atomic
    - Non-Multi-Copy Atomic
    - Other Multi-Copy Atomic

Not a big deal, but do you mind if I changed the latter to
"Other-Multi-Copy Atomic"?

I'm asking because the Index pages now have these terms:

    - Multi-copy atomic
    - Multicopy atomicity
        - full
        - non-
        - other-
    - Non-multi-copy atomic
    - Other multi-copy atomic

, which look fairly inconsistent. :-/

I think you want to say "Multi-Copy Atomic" in the glossary,
and I can tweak index markers so that above terms can be listed
simply as:

     - Multi-copy atomic
         - non-
         - other-

, and in single level indexing mode:

     - Multi-copy atomic
     - Non-multi-copy atomic
     - other-multi-copy atomic

, where "full(y) multi-copy atomic" is merged into plain
"Multi-copy atomic".

Do they look acceptable to you?

        Thanks, Akira
