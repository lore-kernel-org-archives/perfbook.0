Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90BC30C632
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067506; cv=none; b=PLnxiNfG8o9nvMgyLFmvkYPI5QrqF4k4Mfjz64MDIA1ngj46cJWkfN8XAEyYBsIIuui9y182297WOdUusZB3dyPo8Pwjzs7XY4Ek0GdDdA3BP4ITVNhRlQHflfohyiCK38udqO4+yZZB2a1bxbJZrF18HZgeTO5RQXLZzI1pTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067506; c=relaxed/simple;
	bh=r0mfuqEr3eizSZqHDkHgfqEuItiEDB270997to3IRyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jK4ttehluidjfk0i1ws4fVVE/5peYlpa7nK3j1J7Y1jCqvUjnUlkV4b5NywlydEEGjORjkGt3crCk45WNvnb9yrlsm2pLiIPUpQUZhF7sOIp6EX4GZ7dER31DTxZZxNxAjgSapQJgSnSRecuRmJKbBo2t5n6R+YJfLy0L27AHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyeIHuEr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyeIHuEr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364ff382b0bso5210060a91.2
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067504; x=1778672304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH3zmEScj9GmPhIniqu2onxyZkcRTOnG4NS+CBVev5c=;
        b=PyeIHuErj3jacRoDqlJldcgq3cjnOz2EQVgG8E1xLZSbnrx6EtcxVCAvbl/QPAtvl6
         zFtYMOfKToXb66qEMU9Vlr2R+CSazXJ8IGCcZfBPGk3ghp0j73rie76LaW5PakTfaq5s
         V0tGYGiEzV2XH3azAQWlGg18GjKEFv2Sd6Zezk+dMuyEq4w8mgUvUMvrvLPcA3KsS3+J
         cU0+BhEWx2MLmAftYWGP5OpehMjEnxFC49hR9cQn9RkJWxS0JaW2SoiGjmO/OeF874+Q
         djjydp85I1yOnEnTN4Z+suTTpMFt7VoY67FlgBqU6ODV6SmtE4jARy9QAjfWuFQneyXE
         A4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067504; x=1778672304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH3zmEScj9GmPhIniqu2onxyZkcRTOnG4NS+CBVev5c=;
        b=oJuildsf058ppUWmFTYTzhVx+4tQ/1awRTmdlqOcU6jYq4yTorRAWoP27RZEi9u5z4
         XBZFvw/C4cBRr0a3WktIEnsqNQCba0ibSjSGFHI9PrVZ3ysAJQaMI5xXnQasyKw2CT/t
         XeQeqhMi1DTTm9cY8pjlYQyl0E7/UKNXBZHaxnpL2Qk38tyTWD8yI6NOkqWIxPaJ/aPt
         OrFkFaMPk43ZtPlRGEX+vzOFoA22BubJEOJzIoahtgwv8hXwNQ4PD7rP2YhpMv9R21Zl
         izfJeRK6aV06ROzfTzT3miU+dccZRDPIaWmZSpeq/LhILkdbmKKIlkKaNrVMn+aprV45
         sD8g==
X-Gm-Message-State: AOJu0Ywn70dmce/LNEAiSsZktMfD45g438yJGzN/wAbg4gMaaSR36SoV
	xL+mcqkF0zJmbbEf9mpTCYw8wN7eEsZXsA4H0aVwZR8F+ktTEEfRUXih
X-Gm-Gg: AeBDiesT9KArqY6JblWgW42QkLuPJFHcWGmTIkDVumJ/HX0x9MsF9xffLPpTPZO1SoH
	Qnodoah9P5YE4vUt9TTJ1xKcG7YPijLk8x1XSW3zpUTHADiqjcZOKw+k37dpHOdnRjKrb2yOUQm
	r9hnR2V9eQdm08fpldK1DGrYBTMbD2d+0PqvXRgAF6mYKkCwgfGkFm1wWgE+FIToW5CGe5nv8Ub
	jNuIhlqT60u4tQALGgHWdgaaP76sMdiFM/4yuNmJiMz7bE+k1W1nvb15jyZ8imOdCivXsdPBrZG
	splisEMmsQtdhDuRmYyXIiMG9cpUFzvjvYzWI4pCJJsHUIfJtjOysSrdpzeaZpIs8unsJYCm4e5
	H4aAng9A6BWnxL5V+mWMCnjwoxvfEJcOorfHfVj5/iFYT3ohOPiLHmiGaHNe+kneLuXpc2oqm7T
	B3pAEWW5HWz3y2OalIRetGyyvD5ZPclLRJ3odNBNMCp6Rr27u+tbzxatMhl+zt2gKW9jIEYNh74
	ZvYpms=
X-Received: by 2002:a05:6a20:3943:b0:398:7792:3882 with SMTP id adf61e73a8af0-3aa5a92fdfdmr3309573637.16.1778067504210;
        Wed, 06 May 2026 04:38:24 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm5317276b3a.35.2026.05.06.04.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:38:23 -0700 (PDT)
Message-ID: <e75ce1d4-62c1-4a07-81b5-4000b1235ca8@gmail.com>
Date: Wed, 6 May 2026 20:38:26 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/8] Update rcu-test-ratio for Linux v7.0
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index ac235bd0..722a08d6 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -106,4 +106,5 @@ v6.12 22834 12313 35147 35.0
 v6.16 22370 12983 35353 36.7
 ""    22437 13261 35698 37.1
 ""    22542 13299 35841 37.1
-v6.19 22884 13848 36732 37.7
+""    22884 13848 36732 37.7
+v7.0  22359 14019 36378 38.5
-- 
2.43.0


