Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5B176FB8
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098616; cv=none; b=eRtV7H+q8eZ2SC7QBqF2zzGtHvbDuKKnw8dom1ovILER/8jjo75IHpL2NGw6ekOYclBbiOH80V7LoOEIvvTt/3w/1ptcinT7rV1gE2aSIRHKW1kPKM39lAO+X1OBcPASaq5kAp0py/R9AdMu8BySlfEUZKew8VQ7UF+xFsDLv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098616; c=relaxed/simple;
	bh=FuZRIGwQem2YoDOjUF+XEOvDTXd4T/g2vneIvXH3zCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRG+2M9dOjAoX/RgapQu1gY/O9Ff3f9G1AdFMONtN+flqLSMGnqXWAv9GX14CEGSRZpJ6zfKDrz0n2pTRL67eNSQ2UnJwqpB1BAdR/iiTcIOTZqpLvdmzhLLOB8f1mkGykEYF8a7i12ItF+A2wlbK2jYZWIYbGCMvosMJxMsCCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFtBsKyf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFtBsKyf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f480624d10so47698165ad.1
        for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098614; x=1718703414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2cQE2Ovdl/vSw65SPbGuOJrQmpBwxJVemEQSq1xqqQ=;
        b=fFtBsKyfw4vsQ7uL3zjDLXDdwhri9kgK4kOkOvs82bndL9LRKE5IHfyHqtNJegctLi
         5vdTmDB5DOxbpCFIMVlO+HhL9VV+gxC8EUyqRSiOv4OG1jnOFcw0ifRlzXEThfRDiLMX
         F6zRRpxtL+uwZto/GPve7eNm6ydsYmMRBG6LvZIo/KqbQke0lG/8np5Uq0u6JZUbAvh2
         VqEA2e6IWIg4vtJMvJVH4zx9k+K9DN7G2sJTiudMWnPlvC4pffKcHzG/1JtUyTUJ/6T6
         vQ12rj7RrTu7c52T7/CV2Ngt8OMA0UnTu/out5IDBJKXH7zdRjYMWMZBdTk7POQOHEzX
         6Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098614; x=1718703414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2cQE2Ovdl/vSw65SPbGuOJrQmpBwxJVemEQSq1xqqQ=;
        b=vFQRlUxNHnZ3kk4tyscSfXiCrrVqEY3Pxcv+gLK04s6semycDIOqU6i/k9/3gZPaRM
         BSiQBR/Cv3bTsNNidyCcvwQSb45XHFTwzHG/CyeITwomnttWLRd+Cw/wW9PDeBy/EN6F
         hKDNhcF15qB9vaF7ay6bvD5WmiBXdiJT/KxDItMx4MmeXSTT8eKdoe3tUiKwww8s9MvM
         M/eQLWnKIOaXknFDaadnL/OM4I+Zl7ACLdCaKiS4GBee+7csjVlILkeN4J/5I1fmXHH8
         isU46nmhi9X/MceOTWdvbG+dIqrdvyokr0ELzYwgIVOf4S32FbaQrHr5N9vM5yNyTcX+
         FuxQ==
X-Gm-Message-State: AOJu0Yw2YP7aBgWdybHJjvNsU25inxZQTMDWxsc2JFg7aZsvu4NDs5nB
	8/nSa+zN9d5IS3u57gpPD34qW/FXvF/LRJUGPmXZMqnBzk0nQZXRX1AO6Q==
X-Google-Smtp-Source: AGHT+IEFB94lIv3Ymi4wEm5qjwkiBSrx3Mz0whozkx3/ejLM9F+uAiRnyK4bWnjYhhU9Xqyw+8BXUw==
X-Received: by 2002:a17:902:a515:b0:1f4:a6cb:db3d with SMTP id d9443c01a7336-1f6d0397784mr112882155ad.44.1718098614099;
        Tue, 11 Jun 2024 02:36:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71c7f218csm26119795ad.5.2024.06.11.02.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:36:53 -0700 (PDT)
Message-ID: <e81a8b3a-9542-405c-baf9-c18a11c98e0a@gmail.com>
Date: Tue, 11 Jun 2024 18:36:52 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook v2 1/3] Work around conflict between arydshln and
 array v2.6
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Version 2.6 of array.sty released along with LaTeX2e <2024-06-01>
is not compatible with arydshln's assumption of internal behavior
of array.

Stick to a compatible version of array by adding \RequirePackage{array}
with a rollback option.

Use of date as in [=2024-05-01] makes the LaTeX code compatible
with earlier installation of TeX Live, where the latex engine can pick
a suitable version available.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
I have tried to contact arydshln package maintainer, but failed to
get any response so far.

---
 perfbook-lt.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index fd598a56..ad4463be 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -9,6 +9,9 @@
 % within a page. See: https://tex.stackexchange.com/questions/183149/
 \ifdefined\pdfsuppresswarningpagegroup \pdfsuppresswarningpagegroup=1 \fi
 
+% Work around conflict between arydshln and array since array v2.6c
+\RequirePackage{array}[=2024-05-01] % One month before the release date of v2.6c
+
 % standard packages
 
 % A more pleasant font
-- 
2.34.1


