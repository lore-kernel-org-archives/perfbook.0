Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72904125BA
	for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 23:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888475; cv=none; b=Br756Y0H6Gbppc/alMp0/WSaR1eDFZzzTa5VTwf4/Ro0Hwnm0xrlsrUL/Kq9K1Z1mf53WaXUuhqovsdMbSb9/4Y6Nb9M6BerbXkJSoND6nswcwEQKvL+Z3l8gwaoTJ1aGqWlGsLsL9fEpbVGhHAf4kzs1zqBPxViua837kdpxrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888475; c=relaxed/simple;
	bh=sAqI4z/L7dwShjGjVUkFpnUO1tF/+N8J7e2eRpm67Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwxaEmaxmHqOi9jjvRw353MzLyoBYAIaqujYa+m4eLYlonLNQOb53YBN8gG0WnBPCtKqglOSs/a0H/9wztKa+1DhD51OcbPzpTByxbQV6+yYWfT1ypyh8Yarjwf4I5CVAlFEYUCtKQd9u+3J8FEb2dg2KFUZJWidxry90eAXeKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK7wkcK2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK7wkcK2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201f2b7fe0dso397835ad.1
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 16:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724888474; x=1725493274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BX/BQCIzA3gDtLEO6+tf9p1vdhbZFXOZJyPLGBV4vsM=;
        b=YK7wkcK2BD9uokG1T5DIV3b4hGZbylm0BJZffqhFOjMHG2D+moLzoCT7j6dngNHUFu
         Ph69d1Qtxgw1m8pEh9/tReQbKyea13z+8k5UkKg54Fb0FTBsdszhIe5aJ1QSns938Y4r
         42ToAv6LyUAIXp1C70YWDXuxSbJkIuv6CO8sMgX+To0R1ANfD6MpIaaCaX1/fcgFgYuE
         +auXgd7X1u3VNmWGV0lNtjJ944cVZSX9SESXNkDsr6k37yacZ0RTvrUEPgLlzUwhNMim
         4Xsdn5cdC0Mb+nXQDpJSSEdsFQhjc2RGk2qoTIug/mhpLZIiLUIzNdX1X/dQdwZmX8ft
         +iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724888474; x=1725493274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX/BQCIzA3gDtLEO6+tf9p1vdhbZFXOZJyPLGBV4vsM=;
        b=WUBate5n3QJST7qTQjEff6R4MFsAX00N/laqaZ8pKtTj+cWAnUmNz1LdISh5mIfWCT
         H2S089lxLyhvNcNj88gydeUEZVJUWDURKJPkmcW9C1nFAclThuEsD6M929omWrci6DDg
         +HZy5yBoxsawX2Qj7Z9Rp01zPlLW3+CXeZZkq42T9Ex5DhgBhzn9V4G1nawNvNAThhG0
         VgXN5dGsl3icbmLSk5WD8R0BTqVRLo9KyCMd+nHpx3DT0orv83+RcRV44pDM8mHaHgIQ
         RbAfiGhXf99JL5d1DQccxTsMwRD8I30BzlOonONI8b7ho9OeJTOb+T8JuECm5vNYu1Ck
         3NYA==
X-Gm-Message-State: AOJu0Yy14uA9Rq5w4ha4nYCPuEJC2o4hDhpzWP9NVIn+qyPsQsEzNloj
	IL6zV73OXohXgXyWTbyP8XKIcNW0Vy/OJiTBkuwrw3vvMOQXcXjs
X-Google-Smtp-Source: AGHT+IHQNjJ6f7aMwDVXak8wQdFlhEgrhQh5QzFH3Sm9siCV+EiOrGNgVf1xaxVaog8q85tSrN4HqA==
X-Received: by 2002:a17:902:d2c1:b0:1fa:7e0:d69a with SMTP id d9443c01a7336-2050c4ba59cmr11166915ad.46.1724888473763;
        Wed, 28 Aug 2024 16:41:13 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1219sm302715ad.59.2024.08.28.16.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 16:41:13 -0700 (PDT)
Message-ID: <db9b9f7b-cbe2-477d-8b15-c4bcdcac30ff@gmail.com>
Date: Thu, 29 Aug 2024 08:41:10 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Figure 3.13 is too tall in -eb size builds
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
References: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>
 <c973c3a1-f321-417b-83e0-b5a4dc521857@paulmck-laptop>
 <59df9d95-9f8d-4eab-afd9-0552ed6f054b@gmail.com>
 <f566b5cf-c7f4-41a5-9cab-e44b8d3eaacf@paulmck-laptop>
 <e74fab26-b30f-4187-9117-4d16c11e94cf@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e74fab26-b30f-4187-9117-4d16c11e94cf@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 28 Aug 2024 07:49:39 -0700, Paul E. McKenney wrote:
[...]
> I added a grey rectangle to connect the two CPUs, which allowed me to
> halve the space between each row.  I also narrowed the gap between the
> CPUs a bit.  For me, the result is more readable in 2c mode and also
> builds eb without complaint.
> 
> How does it look for you?

Mostly looks good to me.

I see a vertical line on the right side of the grey zone.
Having another one on the left would make the figure look more
symmetrical, wouldn't it?

        Thanks, Akira

> 
> 							Thanx, Paul
>

