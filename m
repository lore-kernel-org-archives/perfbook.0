Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C04A1C
	for <perfbook@vger.kernel.org>; Sat,  1 Jun 2024 02:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717210493; cv=none; b=O6A4Yy2a7eKFEFdKuct4XTV10IGkzVw6eoH34ilifcDrPxgkpeWgV25tua+Bat3Cd+lQJaRpAQ8Xhxb/rf0nbQq1QwvBoe4Z4xs/IpjGalKxstKFra22zeJizW8XLNRJO3M62ZCj0d4mjsZ1zj0h/StZ9XXgCLMqX3WoERB0ZPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717210493; c=relaxed/simple;
	bh=Womr93Pp236SigDechEBG8kfYAXet1tUdIESLi3JR3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4jbVKZmtM7Ub16D63XpsMk41Lu3J7twvHvNLuTm3fwVIpJbYT5WCm0bBfaOiTg43il4NuUwSaBUxc7fj/MmKFMLue9HnMJ8VtMj5O4Aw1BleqrMNpxG044EHZnN6SDpvv4psYM714x/iNVH87YUpO6rzI/KkGQXBkD0SnF+EWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHEQ53Xg; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHEQ53Xg"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6c821775f82so102512a12.0
        for <perfbook@vger.kernel.org>; Fri, 31 May 2024 19:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717210491; x=1717815291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34/pSZGLZfqoLdx6PsN7DFTZ+H86v0Hxo8f5r4Cu7p0=;
        b=RHEQ53XgamaZx1lWuDlQF0Nx9qzqA2K4hUnJYs8tv32hM3j+zuQOm0LWcy4GpVp/9l
         0EtF9lJOXYG6mdzJEFitaIrCUOE/9eeGnSEWV+YhVHV8AOqBPUxwNQe7EuT8gE9kr2sY
         e/bqP5nr3sdq6lXmeKdeuvK4Go8s2TwhcNpInKz27Z/HMkQy8vmOh+NICZyhz3zlTKzy
         CPZqvC8bnvpVXW8vsOCv8nwOHqvwkbSicNSPlFsDPtNkrtLqaYDra9+E7yWMGtIi1VZx
         /8zEft8C0Aq5FkKhyHP7vKDYr8ky3w+r/c2pM00JavmFum4w22KJa0xA+HAXVJHbm7J6
         K2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717210491; x=1717815291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34/pSZGLZfqoLdx6PsN7DFTZ+H86v0Hxo8f5r4Cu7p0=;
        b=KVuXmdslp3CazvWyQNntkpC9tb8FmXUqn8hF3tYoPR/f/OgtpooWJ7rvxsj1q8ayed
         JF6bGGSpEHEV5CWQMC+LqzNlgYvTtawiUXK7+LWr2x/4igGy7EH/6oJwg140ziFv/cOt
         ZoofsYoQmu+GrsghbgVoZQFrt3Nyh4FMuFmhArtjxEDxJ/8M7SUKOeAra0g3/zxHN810
         PZOpQHNDgrThx1KkNrWbEyu0fT3DMtVi18Ut2pN8lzPpz8qU5PvTn/2o1vO39LXlfI3P
         IYNfjOwwIQw6udP5W65MJYENiBsgDl+GrXVgJByujdtg87arOHyjvh2+XrWc9hPp9Om+
         Lgdg==
X-Gm-Message-State: AOJu0Yxn2zYew0tmwCct6jcNko4lAWjWhLel5+xDUpqSoOrJpRZN6+1S
	S63mlqSxwPzNwqvzg0b7//x7c8MVDUriSvdi0YEJrMrShQC+VduA
X-Google-Smtp-Source: AGHT+IFqPHKTs1sCa6/Zaab8wzRx9RCIApqMs3CA1FNX61IpjmsWs2MCbYzlP5FoosemWivXBB/VFw==
X-Received: by 2002:a05:6a21:7888:b0:1af:a37e:367e with SMTP id adf61e73a8af0-1b26f139070mr4338336637.15.1717210491001;
        Fri, 31 May 2024 19:54:51 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd945sm23402365ad.161.2024.05.31.19.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 19:54:50 -0700 (PDT)
Message-ID: <f3aa05eb-828f-4a10-a735-5976f3bd9771@gmail.com>
Date: Sat, 1 Jun 2024 11:54:47 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] Don't remove $(SVG_GENERATED) in 'make clean'
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bb58334a-c475-47db-87fc-d24b8ebf80cc@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bb58334a-c475-47db-87fc-d24b8ebf80cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

"make clean" is supposed to remove files generated by running pdflatex,
not those generated in the earlier stages, such as *.eps, *.pdf, *.fcv,
and so on.

It was a mistake in commit dac608ac4e69 ("Plot RCU-test-ratio
on-the-fly") which listed $(SVG_GENERATED) in "clean".

Fix it.

Fixes: dac608ac4e69 ("Plot RCU-test-ratio on-the-fly")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index dc8fceec..762df051 100644
--- a/Makefile
+++ b/Makefile
@@ -654,7 +654,6 @@ clean:
 	rm -f perfbook*.sil
 	rm -f CodeSamples/snippets.d
 	rm -f *.synctex*
-	rm -f $(SVG_GENERATED)
 	@rm -f $(OBSOLETE_FILES) $(EPSSOURCES_TMP) $(SVG_EMERGENCY)
 
 paper-clean:
-- 
2.34.1


