Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C2A957
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735432391; cv=none; b=unmRq7glCBvRQcdR92ifgfQgZrsi89yExeMstLj2II2kzPjv0NMc51LMYjBfGpEi8uSnOGsEXWyXZnrBKTesUyIw4QhotY9WldobeueH1oX7rYZfeI909z5RN7bu9hXU9G3Fc2xG4MFCb754Ge74Gx97xee5rgZrIwtpJ0sHSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735432391; c=relaxed/simple;
	bh=mQAACPRbxH/c8OLe/zCCHzUKMVnku7ualCVh7h6rfgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvx5g7u2BViZSMNFL4dIypFjJyCsMwBl6u/hN06IfSZ7Lvtc3HzEtB41HBVFKFDcCtvlperyGM9HOoMmM6rrkT0ubD8vVC121p/HWJahhSdPhUWitTIj+aD4ODjOwmGn9zeeb+P9+LEnoZrSeB3+bjmE1ZfXjyKniEmCnF1DTco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEsT+ChX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEsT+ChX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2161eb94cceso72737965ad.2
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 16:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735432390; x=1736037190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3z5W1kU7davuXcbnuFRwmUJ/kHzEnL/eV6Augo/qolM=;
        b=aEsT+ChXEToxupcsQUsrFEPMSKgi3x1LiTGGbe4k2ETCvTNqKtcRKBcyzPJOv3zDpP
         0Fq64zHoglmKdBWDmi7n017uA5FIpNv6SBGHa743hf5LD1zNlpcSANSmbZo6YC5/p5/G
         9L2ygbuA4a/uKrMp79hKcaeNsD8olZO1W5wl6YtLIpR3ZewOpLZrSTUAe7ekujc/O7H+
         i7VP5EibPkBCcVP4LJ5TND8lBy4RnpiD2mYalxKvjP9XF15pCEkGdosSjAmtFVz37eC5
         JqYOwFIDiid51S1kOk0l/TYq8UieWIWHC5nyF5kLl3EVSIFIOtdx5TWRZCl5ySeSH0hN
         DBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735432390; x=1736037190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3z5W1kU7davuXcbnuFRwmUJ/kHzEnL/eV6Augo/qolM=;
        b=DTQwhMAJGsZyj/dsFslrRBH5NPKhTlXfrirnkgUEAWJFXzaW/Bpvdy807zF+LzSGvO
         KBlJmLkS7IPYEFM+p8ZE5LgjpnqCVB/sRSteIfQa1OvI/7coKBYIJsJ8SyBS7ugDKDKi
         dbN5lY5cSCCVrBC4HcN/Wq5mtDGhRANsEDl+BcNiYLs59UWUDFh+HtbNBhw9YSrojV1z
         nJb/9SINE7w33MLCn6uqmaoodbNw2S/dD2+BCUydPBflHEQHUzK28la8WBU9PYztYd+p
         2f03DwXU20DKLIe8ykQC82nesKwOKE69HGSdFTiX9ftsOEGqSp5NQwziwUR+c8heTm9k
         kWtA==
X-Gm-Message-State: AOJu0YyKiTdEksqT1hooMVO502y5ZqxX6V82W9kw6yZcmIUzV+/Pnmg5
	NOh2IY9julWRCIwv041LkFthc8YQuBEQs/28hwl0t2cTBSTpBBxdWJEaOw==
X-Gm-Gg: ASbGnctUZ/C9ZW9+TfYRK203/8a/kU65UXaV5GgyKEkubz3kEF5csW8DEGMDEyS+H7O
	o06ehcEQC8eclJqo5tpX1ctFOMjHwbMCDg4NOyziCW8mkbgcoM7umFpeCNd9r6SboSgtGEXzp4b
	Rog4ozQhVzg+iAE5FerKXgASwt5E2bsB/c/vm9T6eoxA7uzV5kcakXxjrRJSU0AC88LIOshSwjw
	JcgwiYJHs+jr5/V82tHVF9YdA6EqsojXVyg5c+9FFWLK6+9dh9FceQOwLTqcOAgDEzZXkOmNwPB
	jxhYv5UNUy4hkumKzOnfI10=
X-Google-Smtp-Source: AGHT+IEEocT5u/Wr/mHLoXT3sJ/XumHXGID63zJtlMvK6fd+3HswLXMrXfLfzHAtFwEUZI5UZvJ2xw==
X-Received: by 2002:a05:6a00:39a3:b0:724:5815:62c1 with SMTP id d2e1a72fcca58-72abdeaacf1mr46386276b3a.19.1735432389682;
        Sat, 28 Dec 2024 16:33:09 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbaa6sm16696638b3a.91.2024.12.28.16.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 16:33:09 -0800 (PST)
Message-ID: <c90ba67d-c9e0-4bcf-90d6-ed5d25505872@gmail.com>
Date: Sun, 29 Dec 2024 09:33:05 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
 <e55c82dec3d28d2a88dc60c680d04b25de18ea87.camel@gmail.com>
 <3ba48d72c81ae3aaa6dbfc9bd44fd30f455cd157.camel@gmail.com>
 <24e3f1ee-ce06-44dc-a43f-64ec0a6f4c7b@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <24e3f1ee-ce06-44dc-a43f-64ec0a6f4c7b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/12/29 9:17, Akira Yokosawa wrote:
> The use of $(pkg-config --libs liburcu) didn't occur to me.
> 
> I'll give it a try.

On Ubuntu 22.04 LTS, "pkg-config --libs liburcu" returns:

    -lurcu-common -lurcu

I don't know much about pkg-config, but is it possible to make
the command return -lurcu-signal as well for liburcu <15.0 ?

        Thanks, Akira

