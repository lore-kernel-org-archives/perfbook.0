Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C739446D
	for <perfbook@vger.kernel.org>; Tue, 17 Mar 2026 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734802; cv=none; b=ME8nPZBm7FOLIVdckx5Y7sb0uZDD2cEQeY6pSQVtIlcJlTg78P/PHWea3vgnRD04gmD7DVfLq9vt2U5xu6e+PHAyTSiDQ/g7KNI7kaIuIZLtLSzFQAFL5mf94DEB97sYtD0qrs3yZ65Kw6gutAfh06KxJE9Hnlx7ZwHRuVRMdGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734802; c=relaxed/simple;
	bh=hzo+5wTMQ5xZqqaE1pUAqF9QuJabv2//ajt9lgvGNFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMTvqkvKmrlHw39iouF7OvLebOQE24PIXTJJSaTct4s1DhmE4D2VEVTCcC6BK3rKJrOBY8hZ1yUx8n9/WFSgoImHfgp312arEgzw6564tfiDIjO39L82f0RKeNNEAntyRj7xw3Xwwgr5cBCXbi4j9Z7iKOhmhvFTvo2bPTkJdj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5E5jlen; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5E5jlen"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad21f437eeso4790335ad.0
        for <perfbook@vger.kernel.org>; Tue, 17 Mar 2026 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773734799; x=1774339599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiwBBa99CmavrNV1506nrQQHHuBPI27RDUUp1586jPA=;
        b=B5E5jlen51IjWKvTGExoX/Ien23LbykCNx9V79leYllzj6alQhkGi/WFuKml/I/+oY
         cSHT5BELUqqdgkwjIDIGFpHipeMX1GbRJ0MejGT3oTYhRn0aQR8vDpnfNRfMZ65eviqD
         U+aDENKqPBg0yIOkDehrrmP+5YAye4xMeDSUZVOF7ftxl2onE3cX4AKwrpyjYygWbY+d
         7ozffAyXe52v7Xrv4oVidC82M7peKL4Wlh6EPxuiOdPnqJiS2joulzBV40z+2leLOxHe
         x9OCgsGSIXJaqhmyBQrKb6u8Ssiy3OuZ1eMtC2ykx8dYrotlqvcEErmAtetse32paUVd
         qUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734799; x=1774339599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiwBBa99CmavrNV1506nrQQHHuBPI27RDUUp1586jPA=;
        b=iGWowVKoGU9uo9d1uUq6qPFrBYmPa/mkO4Gev2rxxeXNemyJtRkQuUjnXihGfOHNSG
         NG9izMEvOXf/QnEzBYYki8ECKVeeuhMAALfF9yXeA2OVGnOON40S9YHANyCfH7Qk0v7V
         z/wrB05Wfhkpn95TXJhvOd9AgXx9znIeX8KOHosKL/8Q0BBpR7jzNnOG1Z2BPdB1RNBs
         vsnn6e5a+JiX6TmnEoNm3YiXZ33Qb7AfI//1S6EHdVLNsrN4RumxiUV0TT9aVtvaoVIs
         jW3/XuT6Z17UvNLU2qe2HdlwfvGPZQ2kIkV6RDeOkbuw0yHstYAKBCsAHQH7J9HXCUR4
         T+ug==
X-Gm-Message-State: AOJu0YyY1M98b+yVJviZRj1+s97q4tnuUHCy4OYr1dzSy88PX5cwjMQn
	UwzlnIF598l2XWb2OelQKi0CzrasTEz9RXcYM9n5NuwMp+36VRIIItxNEb9dEw==
X-Gm-Gg: ATEYQzxaR62Cogi/z7UuDr5zYhJiYGoY3dTY7Su5CQ0jbldhGhXA0Tsw4w8x9eBDEsR
	DQw80FS+N8C7XKnSX4p8Fxr70pOIeAr4jjHdCYZ/FbaqenfWDeMSS+WmACd1Q0Tj2M567mQr3MF
	+j3iKSHYRjDCtjZi55mwvLeBPm+NBgaVKpyOlf+robJjKz7OJY3aTTOoFk9lEu/l8D2SRYhIcXW
	oEbzSzLc812AEbvFPZfplqiPY8Qw0x4m2+z6o1P/CgIxMPGM/MB5jzVo8cKozf9xOTv8byFl5y8
	yPGg19BYe0TTfGSj7ftv1Y3zaxrT5FG2koZI0AcwQA3MyKFR/F95j0rtfA2+zAk0Qf3Jz6u2ype
	f4Nsxq0GR1z0iriziyUYdmWZD7QP+6Fwjzcxf7lkngl9ho04hdAUh2ecv4ZAJFUeaZTgDKUd3UO
	Lep7Iz/g7AsxE+aWgZf+ttYQihc9sMOSvPMjL5Mptv00vr5o9DIdL5vi9hFXtf2XHayQqF
X-Received: by 2002:a17:902:d54d:b0:2b0:62cf:3537 with SMTP id d9443c01a7336-2b0635d8d06mr27825115ad.6.1773734798988;
        Tue, 17 Mar 2026 01:06:38 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05f0ab25fsm39872785ad.35.2026.03.17.01.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:06:38 -0700 (PDT)
Message-ID: <c4134e51-141f-4d45-9dcc-8606a965e850@gmail.com>
Date: Tue, 17 Mar 2026 17:06:36 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook] Extend buggy fvextra version range
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <7e535d83-2f19-4423-9a7d-297fb4b4d8fc@gmail.com>
 <d73323f6-769b-4ca5-8a43-dc67264922a8@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d73323f6-769b-4ca5-8a43-dc67264922a8@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> On Mon, Mar 16, 2026 at 06:15:56PM +0900, Akira Yokosawa wrote:
>> Unfortunately, the tentative fix to the regression of fvextra has
>> failed to convince the maintainer [1] and fvextra v1.14.0 was
>> released with the regression unresolved [2].
>>
>> Extend the buggy range of fvextra.
>>
>> Link: https://github.com/gpoore/fvextra/issues/32#issuecomment-3942491507 [1]
>> Link: https://github.com/gpoore/fvextra/releases/tag/v1.14.0 [2]
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Looks like Archlinux's texlive-latexextra (2026.0-3) comes with
>> fvextra.sty v1.14.0.
> 
> Rather annoying, I will admit.  But I am glad that you have a workaround!
> 
> Thank you very much, queued and pushed.

Well, that commit d64549469b75 ("Extend buggy fvextra version range")
is missing S-o-b from the committer ...

Thanks, Akira

> 
> 							Thanx, Paul

