Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417BC7CF3E
	for <perfbook@vger.kernel.org>; Tue, 30 Jan 2024 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628835; cv=none; b=to4JW5IiJlumpPVGMFyyMcyJYuuNbXOCtGQtRFVGEyliYaI0JMeIMDO30zbUB+WPfL4GJHJz158tgLNZfBP5wN+oaEjLSqmsEjf1eiVhtMoFaG3y/fXtCzJkHySxwQd7Z0XdBmtzVohnXbaDec2afucWvEo04v0gF7hNAwFxjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628835; c=relaxed/simple;
	bh=I7z4SXbmbD+x5ghQBeR7Y6iGoBxginR2m6lR/PvjA3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4xs7zkCJqNKO9aZg+LHCESZfRLFCHfmdk49ntGvduxQAPRLT2C23sKWK7VaI9zsQbdztX+FBAPJQg/99ztXZQaACArlNuxQ46pS1T0bvogUVleTFtM/LBToZ2EZoIykINX+ePLsIiFFc1uG6PIWsF0K7Ul6QDojtR148xKNPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGubmfiv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGubmfiv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d8ef972451so10252845ad.2
        for <perfbook@vger.kernel.org>; Tue, 30 Jan 2024 07:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706628832; x=1707233632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9YX1lHofD0AmdJYEfQ7bjCwSQKfAjSK8Q24vnrFva4=;
        b=VGubmfivnr/rtvKYfJU2xWSPsAFyw4rOJqaj/gYIb2VnW/vYzjmgseURIJE7dEffNF
         4564rrib0UU8JVLCeqPnsvAE2J29w0JS/hHZzvYWrqKf1qj7kEG7T+tm+oUWOTu535C/
         5yvWxgJsxNEXghquySH3/KQurMk8LfNJiBraarNdaCLwzn5rtUYka+qWnP6aV9qAK9aa
         rWdmW7VjfiyTWPqquU54JaA4e5T65wPe7WbDjUZ29F5WaODMNcaAFIRps7wJFsadq3rT
         UMOUKTaFHdKEZHtPYdPsnWFt9p/ulkubPymr0fv1FiSXfr02+KgKOmDm7D0QbmOQZOW4
         NXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706628832; x=1707233632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9YX1lHofD0AmdJYEfQ7bjCwSQKfAjSK8Q24vnrFva4=;
        b=fgv9mHXyRNXmszk+YZphplBkHGDAbk4qjHTcHUWNSRBBG6RYA52b0b5ms08qT8UdW0
         YZZl2ikEZZsXi894ssVQC40KSmZBF1KH67hJA3FEKfUWMKA6aTQfWZJyUQMQrPCLZH7i
         XSesAByaCSQzBU0fkIjoVaof27K7I9EHljIooatZTfOkxryKxDQ3754tg57YNqJ6nuzb
         PKQ5ixn74FjViY7250GNaa3xwzrkKjNbhEHKpwvmvOEKa0j+fbi5r/tt5bjrGB8WvZrH
         fSxr0iWr8sWpJWQ0Mh3xhUzQ+5P7suPrlN0rY2NJ+1S1ln+xpR1wxuBGHc0ogF0EbnLb
         vPnw==
X-Gm-Message-State: AOJu0YxIZph1fx0AcdjQtSzgIdl2VlGfE0BOp3tw31Jb7JVeEwaocSiD
	b8hd/m4QM1UdVmvSll34/OCNeeiuDZAtHfkDuFaCi1QqmL6k1NzGk5Rt1Lby
X-Google-Smtp-Source: AGHT+IEdznzshjEGeQNCKsfvtL0ROm9a5VWpYgd5PXWzdli7g6RabKdjkDtVdwOk1v89T1BBsW7sLQ==
X-Received: by 2002:a17:902:e746:b0:1d8:f072:ec9f with SMTP id p6-20020a170902e74600b001d8f072ec9fmr3851107plf.28.1706628832222;
        Tue, 30 Jan 2024 07:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVG2RNIG04rVI89hLyh5Ew1b83qansUbcpgDsN3K4ZDeRF3naC5eFkFWDwIIvk512Cw3bkR7bfd7GuEZ0leMwWr
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm7291841plr.8.2024.01.30.07.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 07:33:52 -0800 (PST)
Message-ID: <f69e5960-6078-42be-9f33-f4ff70f162eb@gmail.com>
Date: Wed, 31 Jan 2024 00:33:49 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFT PATCH -perfbook 1/2] CodeSamples/cpu/data/.../plots.sh: Fix typo
 in xlabel for fre plot
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fix trivial typo in xlabel.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh b/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh
index ab2f318f..5b589858 100644
--- a/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh
+++ b/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh
@@ -37,7 +37,7 @@ plot "coe.dat" w points pt 6 pointsize 0.2
 gnuplot << ---EOF---
 set term png
 set output "fre.png"
-set xlabel "Store-to-Load Latency (Timestamp Periods)"
+set xlabel "Load-to-Store Latency (Timestamp Periods)"
 set ylabel "Number of Samples"
 #set logscale y
 set xrange [-250:50]
-- 
2.34.1


