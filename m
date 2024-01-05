Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D92E624
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmpdGGQD"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53fa455cd94so823821a12.2
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 06:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704466320; x=1705071120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pG81XHlCcrhm0qMCOExGsRjOckyjtNvfR9LGSYMKOYg=;
        b=ZmpdGGQD+E0utMVN6F1bvw6D3Ryd2Mz7cArIfpM8xCOBFdOESEbE4XQw24UgE8s4m+
         yUbQYpNhBV1xnw1R4l5auoaSRdUxdrbMcRAbJqDLU0q+B76mkMEcij+BgWK7RcubSrV1
         gT/1GKPzDSvEjh+fUrh532rGYM7bwnXqKZWOTXzH39hgFbgKq2xz+FE+QSilbpz3GBDY
         +flTEj9JncF8VBP4YkXD6KIePpU3Idw7T2gW5RSXFPAmrlJ3UUlSxMf/m1+91nv0AFwJ
         6+ARbTRimM0VJQhgH8l9K/GoW2+U8V5FjF4s1m3IXVoG+kfdyFK/4LCD2YM0UweIoVlv
         I2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704466320; x=1705071120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pG81XHlCcrhm0qMCOExGsRjOckyjtNvfR9LGSYMKOYg=;
        b=ZC+HzjRnNPGaMtomhGdMUQSF54efRulZM92IDf3I3ok8POUQeWw56S3y3TwRjtTVZR
         CIsf+q//5m+cGJqJYm95VJKY/lwLiXGyDHNqVPaQ4Ti+rJZOiAK++G2qPMyR6IVeSIe9
         9GSwMBuYLMcepUAMlk5zXqkq9eX2bnm2XR+gj31esgUc9c8ZDYjVWn9jBOwolylLs3GD
         7bOIrD9nQjBD6pXdUAibspe+/AN6JIM5bUDf1ZQsGvEN2o5oXKg6eScgHg0aSZY8aaPn
         R3EH0lQNw/1owBU2eWEhQihZbUdJz+22O6UM/Ivk6cClIehxTxRCkqxTayMyIeKh4s6T
         K7zQ==
X-Gm-Message-State: AOJu0YynHptoCGouS3AuOxQ8bWrc3m4iocRGjWPTaeDsgSd8xFtD0s+a
	h3h9WHpQRu0rBuBCg6i65yw=
X-Google-Smtp-Source: AGHT+IEPwYs3Sw6ILGI+vuKjVfx8l59H4T756XAV9qWPguOmyboFQ7HXZ49aJm2ukb/m5PwCYjzUaA==
X-Received: by 2002:a17:90a:f2c2:b0:28c:f48c:c875 with SMTP id gt2-20020a17090af2c200b0028cf48cc875mr1964939pjb.45.1704466319667;
        Fri, 05 Jan 2024 06:51:59 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id pb7-20020a17090b3c0700b0028d1e57de4bsm17526pjb.42.2024.01.05.06.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 06:51:59 -0800 (PST)
Message-ID: <da8d5b92-96d4-45b9-bf99-92f113a29fd8@gmail.com>
Date: Fri, 5 Jan 2024 23:51:55 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook 0/8] Use rsvg-convert for SVG --> PDF conversion
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
 <e7070cb8-e9b2-4cf5-8bdf-b844765eedff@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e7070cb8-e9b2-4cf5-8bdf-b844765eedff@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 5 Jan 2024 05:31:36 -0800, Paul E. McKenney wrote:
> On Fri, Jan 05, 2024 at 06:44:47PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> [Cc 0/8 and 8/8 to Leo, Patch 8/8 touches gitlab-ci.yml]
>>
>> Frequent crashes of Inkscape I encountered in 2023, which was mitigated
>> in commit f307e19f2be0 ("Prevent inkscape from interacting with desktop
>> manager"), made me look into alternative SVG --> PDF converters.
>>
>> It turns out that recent versions of rsvg-convert work reasonably well
>> for perfbook.  By "recent versions", I mean 2.52.5 and 2.57.x.
>> rsvg-convert is a light-weight CLI command and is much faster than inkscape.
>>
>> Sequential SVG --> PDF conversion time I get from
>> "make cleanfigs-svg; env time make figs":
>>
>>                 elapsed
>> Inkscape:        21.45s
>> rsvg-convert:     6.05s
>>
>> So patches 1/8--4/8 add rules in Makefile for using rsvg-convert if it
>> is recent enough.
>>
>> One caveat: There is a SVG cartoon drawn by an ancient version of Inkscape,
>> for which very recent versions of rsvg-convert produce distorted background
>> of outlined text.
>>
>> Patch 5/8 retouches the cartoon and put a SVG compatible with librsvg as
>> cartoons/r-2023-Memory-barriers.svg.
>>
>> Patches 6/8 and 7/8 adjust FAQ-BUILD and Dockerfiles accordingly.
>>
>> Patch 8/8 updates gitlab-ci.yml.  It needs an explicit ACK or Tested-by:
>> from Leo before applying.
>>
>> Finally, this series wouldn't affect those of you who don't have
>> rsvg-convert.
> 
> It does seem to deal well with rsvg-convert v2.52.5, so queued.
> Especially given that I was having difficulty with inkscape's conversions
> to PDF for another document.  I overcame these (I kid you not!) by
> hand-editing one of perfbook's .svg files.

Hmm...

I remember hand-editing defer/RCUusecases.svg.  Let me see ...

Yes, it was commit 25238915b129 ("defer: Retouch SVG files for browser
compatibility (2nd attempt)").

Which perfbook's SVG file did you need to hand-edit?

        Thanks, Akira


> 
> So thank you very much!
> 
> Again, queued, and I will be pushing this out shortly.
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (8):
>>   Makefile: Add rules to use rsvg-convert for SVG --> PDF conversion
>>   Makefile: Don't use rsvg-convert < 2.57
>>   Makefile: Allow rsvg-convert 2.52
>>   Makefile: Use rsvg-convert anyway if no inkscape is found
>>   cartoons: Retouch r-2014-Memory-barrier.svg
>>   FAQ-BUILD: List package for rsvg-convert in package lists
>>   docker: Add packages for rsvg-convert
>>   gitlab-ci.yml: Install librsvg instead of inkscape
>>
>>  FAQ-BUILD.txt                      |   23 +-
>>  Makefile                           |   48 +-
>>  cartoons/r-2023-Memory-barrier.svg | 1130 ++++++++++++++++++++++++++++
>>  cpu/overview.tex                   |    2 +-
>>  docker/Dockerfile                  |    4 +-
>>  docker/Dockerfile.fedora           |    7 +-
>>  utilities/gitlab-ci.yml            |    2 +-
>>  7 files changed, 1198 insertions(+), 18 deletions(-)
>>  create mode 100644 cartoons/r-2023-Memory-barrier.svg
>>
>>
>> base-commit: 1ea46c6d43475fbdf97404dec28a58036d505bc3
>> -- 
>> 2.34.1
>>
>>
> 
