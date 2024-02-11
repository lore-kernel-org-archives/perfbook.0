Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FA154B1
	for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707694254; cv=none; b=jKdpKuGawVfeg4Dgbqle/8tECMhN2I/40U9peFUKotlbyzQCMF8B0ntvN6NBevHniPeKMPXLJnH0KoddUTCv17xMF2KFC9VKLya/rMNHfwwg1+ok2a/GkTS0HADFnjOdo97I+bP2CSJEIP2r3ZBrEiV7Ro647u7HpdGqXiLqcLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707694254; c=relaxed/simple;
	bh=siuSJYaPCaZ8ajpTSorZ9Z6lW4KrLwyqZKSNzPqM6G4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=EqK9L8Wdn8nr8lTy/B5TCDGTp0xwvCZZ/Rx/wWWbJoDZGZCckeihEGecPsF00+JzDVt2TQBRDKquRfp4M7zxiVdOX/8NuUvj6mpPB0Vbu+bEVAm7c88Yvt2Ehk2Rlm4nAx71kkABPxi6beLHQaPfG5WV1JvMlsGvik3rhLFvIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4Kh1zg2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Kh1zg2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso2448187a12.0
        for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 15:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707694252; x=1708299052; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xodF/vbtXfpFbvIUaMshGAsnQHNeGWbt8+c9ur77WS0=;
        b=S4Kh1zg2jrvOxTMULtHKBb18VMvlY1NBnJvZ4vJlmX+yQbB5mp8UAh3XTDl1G+RC/X
         Zozt2B63yKVLDbsDtiEsBfoP2LVXzu2BuO/iAtTjK/ECXcuTssWalNRVsaSK2jOsuoWD
         R4nD4sSrN2dEM5D57AxrTmMVx/ye6RLT5Sde45tBMHVI0R+Gl5ZYstqwkTSGBNurfXvR
         B8TaLKpcVEHQe77bHBYfu7yXyeUX+FAEw47U3KnIXScFSvFIo+x5AVj1VpSEAr5NgnBj
         HHaQkNrkXubCe/UroZdfRsxGVigET9aVKb55tIvQ84giTuRA5eVF79+noRJt0nGPcjEK
         m6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707694252; x=1708299052;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xodF/vbtXfpFbvIUaMshGAsnQHNeGWbt8+c9ur77WS0=;
        b=Ofx4h2DAMB4tYzA4G1W56AW8Wk3UOlNnExlYmwi566Ur6g/5b6bHyD0tQtcBqd2dvX
         8dXEf0/EvMynqRhncsTMGb2Af4PWTjv+4CcqqEFMw0BF7eaTyqtF6Gm4GuSNEhGvxrjg
         GFpdVHuTdesa2gvOwbsP7KHoW+s3VQWyWCWaJAmHB98UQTUcVk/RH1mUEd3SXneUCZ+D
         RgKBVIA0uN6nbnmceFR7KyFMMGmjvJ+/DTX2V8TRT0HSxuKDKyE+1lU/ug1gn63KpaSK
         MskyyoUiblaw2wPEm4uYVUieTGMZkznxFmhlA2+na3BgnYg4aTzy19tY9ZKjd+B+3McT
         Idhw==
X-Gm-Message-State: AOJu0Yy4R8xzfDgFYbkGXAExomXdC/bzFf9DrPaD631WDKHEmRkl3vcg
	iMZJHP2Uo5VWFipsmH2b3hTiZ/o0noj6oWYdcyY1Te1vmTCgliFUWCii1Ezx
X-Google-Smtp-Source: AGHT+IFK7giIe8keoK5++baE40pYatmM/2oRNXxLfSHq5bWJkQxdw07QGLvlSRVUkLMPG3JSz5YEsA==
X-Received: by 2002:a05:6a20:e617:b0:19e:3a8e:e73f with SMTP id my23-20020a056a20e61700b0019e3a8ee73fmr7301654pzb.26.1707694252372;
        Sun, 11 Feb 2024 15:30:52 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id o125-20020a62cd83000000b006dff7fd5dedsm4436403pfg.9.2024.02.11.15.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 15:30:52 -0800 (PST)
Message-ID: <6756f12f-ec44-49dd-bf52-e74348a4e4f0@gmail.com>
Date: Mon, 12 Feb 2024 08:30:49 +0900
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
Subject: memorder: SVG figures incompatible with Ubuntu 20.04's Inkscape
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

I just did a test build under Ubuntu 20.04.

Inkscape 0.92.5 crashes with new SVG figures memorder/*-hopes.svg.

$ inkscape --export-pdf=/tmp/test.pdf memorder/co-hopes.svg
[usual warnings ...]

** (inkscape:9): CRITICAL **: 23:17:05.340: void Inkscape::Extension::Internal::CairoRenderContext::_setFillStyle(const SPStyle*, const Geom::OptRect&): assertion '!style->fill.set || style->fill.isColor() || style->fill.isPaintserver()' failed
**
ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
Bail out! ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))

[...]


It looks like those SVG figures are generated from dot, and you
added x-axis and y labels to it.

Can you share the dot scripts you used?

Hopefully, Ubuntu 20.04's dot might generate SVGs compatible with
the old inkscape.

        Thanks, Akira
