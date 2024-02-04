Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7D22EF5
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065111; cv=none; b=XQTA/Q4MVwfuoL+zczkHw8Kf/Q99SlNqjQ1QKwfbAG5h2Vygccgpy7cpiIDZlfzeR05+4Y4YNtFF+/uAuIQY7ADw53evw177Bo3d1mpK7CpUwqZcFZlmxiLStfalSl+4NVt4dS6d6vOPiYodYeO3/01cMD9I6YZSTfPqvbLzkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065111; c=relaxed/simple;
	bh=gNE3c8Um3UvVpu1xB25Q4dWDzBt6I1BJ2k0zW1ayEgA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=c5jxn5ct4y1Vt8M5S7QiZJTdU9IR8lCh1c3mSh8SflqwVmeKUTLY0m4wrvI7MJ3ULAFCoNnrMA+E6Y5hPM0pBBv9OAqS2iMkuPpoELF5A+Amqa6x/CV2zcTubGP9Y67zDkkp994uYhkLF9XjcXmGrf++hRhbashD9gBRRyhZwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/QBYcxY; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/QBYcxY"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-59a29a93f38so1535913eaf.0
        for <perfbook@vger.kernel.org>; Sun, 04 Feb 2024 08:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707065109; x=1707669909; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVMm0ji+tdUPFJo8kLowjDvGTUJ6x5D1cNG01CB1jxE=;
        b=R/QBYcxYfH3ZMRF6Syg4jUKM8qTMfReu8VDDrx2syWo2f5KFNhDH7eS8tJQPLFdPEB
         96bs5OjAyNWzGso3iXNdwzcet4Cud5AH73Z5E208fYFJ3H/C5fnbGsBS8eN0E3X/F2CG
         L0Q2zLCrINwGP1hpXPk5hOLZQ14vRR6uKoxieclGXAe56/4qoSxfnTfCp+6tKj8cAJ3s
         ra3BjYeW/9qNELerobsqBvR8x3Gd53ygVBR+ggmAdC5lmKw8sC6doFysqfQohm2Cd4K/
         n1XJuUO5SJCp1bSwdHUXeX625Ci3FsiJfIYc9A6y2j5UXcS++NbevhlqaNrxwtkxw2SK
         YKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707065109; x=1707669909;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVMm0ji+tdUPFJo8kLowjDvGTUJ6x5D1cNG01CB1jxE=;
        b=iJ04wrZvjImMMkDN2y/J9tfT+XrZXjDEy7c3w+OGqLzLhKGlEOsxOklBJtrtUveiE1
         /iQ0/Ze37tBBf1w3cdrVIO8hjHppprITdxvf7Z7BZNzw2UISCJjKWmcsbMIOSfcyx0ex
         jea/txswhxexkyXGiKF3XbvhXReRcO3jZvUk/s2qB66tYWvaM0PmYy55rY2RJsuzRgmU
         k/0/qelupBQIV6Q7oXgkcePpFo8wNZZtTMocyBtRP1uHHAci6iDXnIKc7t0/WncyykIK
         NV1eFFkRj/k0L0OVXdwgldGrm6CY8B+tQW6hhKkbf2zUBe81u9l+Zr8MEIspQISCb/Tt
         Iz2g==
X-Gm-Message-State: AOJu0Yws75osC6TQkpWyX+jpbP+YUajeMwHYxoB7Nz+NM0FgcpDnUTdg
	hSyUt02Ne5SG7KKNl4iVI/ukG3D2nnth/hFGQFmGuyt5/9NRS/mT
X-Google-Smtp-Source: AGHT+IFMt+UvEuwWL5hVSs2h7iESdiCU4EXQ5ICidoJwWVw0wMTu7DoFqafJcKicXOjboFwx7+jDeg==
X-Received: by 2002:a05:6359:4591:b0:176:7f72:36af with SMTP id no17-20020a056359459100b001767f7236afmr7031693rwb.23.1707065108961;
        Sun, 04 Feb 2024 08:45:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXRMe5g/HT2H8WgeWTmGOwpVCo7a3nnBmUJk5f8f3pOou7rkrhWTysJqTTFkS4t9h7o+HAvoK6XYx4aXgRUARxfsDhJZPgcwnY=
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id y2-20020a63fa02000000b005d880b41598sm5350014pgh.94.2024.02.04.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 08:45:08 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 0/4] appendix/whymb: Trivial fixups
Date: Sun,  4 Feb 2024 08:44:58 -0800
Message-Id: <20240204164502.15124-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

This patchset contains trivial fixups for appendix/toyrcu/, which found
while doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (4):
  appendix/whymb: Use \qco{} for quoted code
  appendix/whymb: Use \co{} for code
  appendix/whymb: Add '()' for functions
  appendix/whymb: Add missing unbreakable spaces

 appendix/whymb/whymemorybarriers.tex | 200 +++++++++++++--------------
 1 file changed, 100 insertions(+), 100 deletions(-)

-- 
2.17.1

