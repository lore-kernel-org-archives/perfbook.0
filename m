Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB84688
	for <perfbook@vger.kernel.org>; Sat, 27 Jul 2024 03:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722050434; cv=none; b=PgWXXU5m2h/BoEVxbAxHEPSBzKdOFv4sRqoJ88GwR28RjtIxjnEj6Dr0e2P7w8DYqkjNfcceU5n/O6nH91uwkWeC9gtMx9e7Q8tnhqSusiD1cEyCJTDMr4ZB8Xr3lwowzzjloPJAmirNYtLtz9TyU6ndh3q1p6BSidv5N4x4qcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722050434; c=relaxed/simple;
	bh=wJMZX0Wlya88O7GOB+q/UvO3aPLrG3Je9NBcQRI3z/c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=CsPeKTEWM4WgvdujE2K8aRIXcqf5VZv40Mq7BH6uqegcCM36EOH04+MLl1ccsZwhPiBRQMnJremyNR2mxny3wF0WxfMYLTLHIHXJ1Mn+tBdeDu+arz7KorR45je133z1vO+GzRNiA9nqT1Sv0KjwFr4H2dIAByJNAreXxGZglvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT8NLi6R; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT8NLi6R"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-709428a9469so131888a34.3
        for <perfbook@vger.kernel.org>; Fri, 26 Jul 2024 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722050432; x=1722655232; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Wz72B+l9ashz9TtydyQiGX8rxup+65pj+9XkG2C5k=;
        b=TT8NLi6RnDtTaDa5ehaG3xJMmZWkFXq/QY1zDlTCw7YYAqgGPoLt/64Ppk81T+X9lk
         ZXeNErD2Z8w4zKLbPahBf3OD98B2Qdjrz89h8C90ZAQtzafIZIiPMHORk7LWxyXcG0za
         zzNMwZzeU/Q7yxdkn6YfbGhfFgbH/RCnWq6b00bzp2YTX6Ho8pjrGi6VCzBWJtemF2/b
         xwG/FrWL3YWAPfnt2klNMww7fUwSJ1QeTNQnfnBYubOe8Y4Y9MYPNL9mudjtS1bEor1o
         zLv1Gy5hFYJ+J6fojZnsdy0OImJY5sw58yOtyvV0K8d23Zu86Xrx2oahaCWioUxogncg
         3haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722050432; x=1722655232;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+Wz72B+l9ashz9TtydyQiGX8rxup+65pj+9XkG2C5k=;
        b=beRHWKlpMc4TYokOlOoknsD3HE0hgu5pDVSlJND5mMSwN2XrY+Mj4Gn8E88xJYyGjp
         zhvrWIvmij8DzOxJwhkwy+e08f4oEXQwICiHRtYMvtW4rJxrdoHpXnRhR/2ckiG/6B9z
         qa7Rps4o6jS27LNCz1oPByXnTjv+EHLiI/pVsrVCSmMGxRVFvgU0XMdjM7qGSwn2FtkC
         LOQzXuAE6tsJj4tB2ZUu+B7/aHJNidLBTfu6pP3RUxPIsvbws2/VaifNoFA7wLbUWJ2z
         pVWoudpVVPr02WHU2Ly6YKBPO4XZD/lrhbp8gr8kcBSKhSSnyM9Zc1c6fqUL0LEjOO6H
         Y9NA==
X-Gm-Message-State: AOJu0YzFZDs0oBuitA6YDSreff+zXkObD4kiELfCktpTiccrhU6aWtvk
	sa22/ApJ7Z04e24mJHFPqyCb0pqY4kYaMUDQAi8m9EAXvCSY/ndi
X-Google-Smtp-Source: AGHT+IFq67ey8fuR6qvClzw/JcC8LTpKBimXBot27dpLFMLgn3QkTGPeXNF+7hJ3GunD3FhMMSh7XA==
X-Received: by 2002:a05:6830:f93:b0:709:3525:eda1 with SMTP id 46e09a7af769-70940c6fdf6mr2072721a34.21.1722050432404;
        Fri, 26 Jul 2024 20:20:32 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8af081sm3403672b3a.220.2024.07.26.20.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 20:20:32 -0700 (PDT)
Message-ID: <0b5765df-1ff2-4fff-ba1f-704c4087e437@gmail.com>
Date: Sat, 27 Jul 2024 12:20:30 +0900
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
Subject: [PATCH -perfbook 1/2] CodeSamples/formal: Update rcu-test.dat for
 v6.10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 12aa01fc..4a958dfc 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -97,3 +97,4 @@ v6.4  21444 11748 33192 35.4
 ""    21957 12064 34021 35.5
 v6.8  22018 12071 34089 35.4
 ""    22108 12076 34184 35.3
+v6.10 22579 12085 34664 34.9

base-commit: f823b459645b872ef3481d746fa82b7ff1a91da8
-- 
2.34.1

