Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B2A1841
	for <perfbook@vger.kernel.org>; Mon, 12 Feb 2024 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707704775; cv=none; b=TpxoXMiD0meWcZespuYeMKTYsJN1xmnHY0kM4diE8A7rG79UZXBbj8lUY4Pl/478hhy5UBSgQbv9ZLp69Pd2RuOoDy9OQuxxMeciT3Ws7AR9pvgFtemlTiIvyMCLvf3n5rUtG8hcb0CgpZiZB10WdHFiJUgstgJVynBezuk8lr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707704775; c=relaxed/simple;
	bh=agxBME9+ovdTRw8d4bWj/fQgeeDXlNGI+ykdGnXNsu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rn4VZhc/JiLgafqvqTk+4mwtBBubW4v9vIwSYrTR+iqhL8N36aYVy3QpsOax/dORhTquUPuUoz/6g3TGgrkmDinPmf0GhQtz1SD0j3xK9GEmd8ZGgN6is+gIwJTR21vFdCBvwpOuHluIe1rX8qO5l32KsqfuXY39iMGYGPKc3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8zctbWx; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8zctbWx"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so2142374a12.1
        for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 18:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707704773; x=1708309573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10poA0RsDhSUNFKERZbG0uefplGT2Nli/LLaEveKIkE=;
        b=l8zctbWx7KqQ90cP0rtEIh87hl0PN10KFY92s2Gpctto80q3HAS30SzdLw8BtpM9og
         IUdp9PRS8jURrpXpszJLQUyZBctc85xL2Twky0zcO4zksddWTaHeCc1zy71iFKuANuxS
         OxA9ywI+TT8FztoKeT6HQaRl5cCZ+dr31/KhCuCf9jfrODcPocmhfxLr+Ha69bVYyR1S
         jLFKIZir0pDbuWIF5zfjFKmlxfBC5oaWfVrVwRx4q4TKh6FfwcKHiKKVX5eNeP7DZM00
         12SeWHMsSuidXz14Uekr78IDZkoPFB3S97JleKJ0MSvmOmvOev0xmggX+blSE8ZXNvo1
         ipQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707704773; x=1708309573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10poA0RsDhSUNFKERZbG0uefplGT2Nli/LLaEveKIkE=;
        b=B02zy4zRa22eSAKEbwWTR0ISxBKtTdZdGI/2geRn1/6aBtSfQFSqkisJvPBSZSulvu
         dFCupoJgFoXrdqZGsBpKkOL9LgekEdEhPuhVnexds6WvKL/ABw1wTwsrZgs7/IMrdRM/
         +c5EDEoTujS3W9bazG0vaQ9OtT8XDalOK/ho0PLMHrT6v5UxtAQkDqu3fe/j1UQPoNVW
         IzkWnR41v10Y4xuCQmh8AM6l8ne+dFOivegQBPq56tfZhNDanup0ngdZtYQfMbNdx8AM
         bzxUpJx76CsVEuIoV7POnDbWMZNTOZWFUC1ZITQVepyvG/fDWUgjxCu++wj1GzkXs59I
         BbOQ==
X-Gm-Message-State: AOJu0Yz21Flj0jAcocDXHQop9jsJH0hRAUO1M+HJKjXVvzUxVATweZUx
	4G9GDx332jfUzUj1kZBxTG4xWwERlM55yxGeARFrACK7OYRRwUIM
X-Google-Smtp-Source: AGHT+IGLvwaQxAigUTf43Qf0KUgw9hmYqZLFp2t6PEIq2McyFj4QSVuNyVNSRtS/9KU2IxFkTQWUxA==
X-Received: by 2002:a05:6a20:4e18:b0:19e:c777:5c61 with SMTP id gk24-20020a056a204e1800b0019ec7775c61mr2066464pzb.22.1707704773236;
        Sun, 11 Feb 2024 18:26:13 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id pf17-20020a17090b1d9100b00297166eec71sm3507567pjb.29.2024.02.11.18.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 18:26:12 -0800 (PST)
Message-ID: <f3a562de-0283-477b-96a4-cd3cdc7050ab@gmail.com>
Date: Mon, 12 Feb 2024 11:26:10 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: memorder: SVG figures incompatible with Ubuntu 20.04's Inkscape
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
References: <6756f12f-ec44-49dd-bf52-e74348a4e4f0@gmail.com>
 <d849b105-a899-4679-90b2-5e655bfabd96@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d849b105-a899-4679-90b2-5e655bfabd96@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/02/12 8:48, Paul E. McKenney wrote:
> On Mon, Feb 12, 2024 at 08:30:49AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I just did a test build under Ubuntu 20.04.
>>
>> Inkscape 0.92.5 crashes with new SVG figures memorder/*-hopes.svg.
>>
>> $ inkscape --export-pdf=/tmp/test.pdf memorder/co-hopes.svg
>> [usual warnings ...]
>>
>> ** (inkscape:9): CRITICAL **: 23:17:05.340: void Inkscape::Extension::Internal::CairoRenderContext::_setFillStyle(const SPStyle*, const Geom::OptRect&): assertion '!style->fill.set || style->fill.isColor() || style->fill.isPaintserver()' failed
>> **
>> ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
>> Bail out! ERROR:/build/inkscape-QIwD1g/inkscape-0.92.5/src/extension/internal/cairo-render-context.cpp:1422:void Inkscape::Extension::Internal::CairoRenderContext::_setStrokeStyle(const SPStyle*, const Geom::OptRect&): assertion failed: (style->stroke.isPaintserver() || SP_IS_GRADIENT(SP_STYLE_STROKE_SERVER(style)) || SP_IS_PATTERN(SP_STYLE_STROKE_SERVER(style)) || dynamic_cast<SPHatch *>(SP_STYLE_STROKE_SERVER(style)))
>>
>> [...]
>>
>>
>> It looks like those SVG figures are generated from dot, and you
>> added x-axis and y labels to it.
>>
>> Can you share the dot scripts you used?
>>
>> Hopefully, Ubuntu 20.04's dot might generate SVGs compatible with
>> the old inkscape.
> 
> I generated them using Ubuntu 22.04 inkscape:
> 
> 	$ inkscape --version
> 	Inkscape 1.1.2 (0a00cf5339, 2022-02-04)
> 
> But weren't we having trouble with this combination earlier, back when
> I was on Ubuntu 20.04?  Now if I can remember what we did about it...  ;-)

memorder/co-hopes.svg has this head comment:

<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Generated by graphviz version 2.36.0 (20140111.2315)
 -->

Where does it come from?

Anyway, I'll see if I can figure out which element in those SVGs
make the inkscape crash.

        Thanks, Akira

> 
> 							Thanx, Paul
