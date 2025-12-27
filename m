Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12E684A35
	for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766824615; cv=none; b=e6aFLzTlQwQQzEgav6zpfhQAhx4oehgNNKxA4NKJSIBL+RrDSwoKK0+JvN9KhIIAYCs1kc9YjLR9wpDMYq0OoarMwTiZIhwUQmuctQg+xjDjKyZPTw8tvyKbE5gZrsQJd4qtyPt8uxSV4Ny5QWoQNiQdoCQm3V1C5UzAVLPOQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766824615; c=relaxed/simple;
	bh=+a5bGOTwiQ0YlZnECAqDREqmkdW4oIo5WnJyNIIDUOU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f/2WdH3rbw4W1hq2sGys0WgYBiXvwlgUwmqaht2glkDvtXC7iYAgwx39fAOjpzGg+rw7Gn9lpbP03bl8T5hHyaS+YtHJVHwbY1CeQUQFqUdfVT2CPvBjSTEQqgDHbjNFD7fJ/1c1nbwf1Ychw7zrkDk1fod3Z6x6OgpKGMQnyO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWFpzQJ9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWFpzQJ9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so6824597b3a.0
        for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 00:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766824612; x=1767429412; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ/RZeI7muDJbXGRD0VziyPvvHTkRhFSLSuu7JB5tf0=;
        b=IWFpzQJ9ia0Y2klFuOl06YlD++5XK3iCZD8ug1e37bTM6saXZ+Mv8/CCsopoMd3QkF
         moPwMQ7YV1Cw3huD+n5aZBJI5rZayZu7ADtT/EVFwHlbX9t2FLRP/U2rZhhW0vGi9VcU
         CBiQAFGTSoyMoiC8fHcxP/xAyZ8lWRSh+3bFb2zijTQbPG1RYIY35zcqG5xcxacr9+sN
         UNVbDdkshShdctrXQ6vF2YF4Bo+i/Rb4rei0HkLesWfTLI788b+BTfehvUKrOqpXT7dv
         cbWkn7r3i+z7NY2/9Sb0napR3G+2Az7LFC2LB9TPccGVz0BozfgJTGQdAAxyr2o1osxB
         FTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766824612; x=1767429412;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQ/RZeI7muDJbXGRD0VziyPvvHTkRhFSLSuu7JB5tf0=;
        b=c7uhyUg3zhFk5Dq5Bljpzx1+smZ1iUudjPnEFmjI1YkoX1vWjQwfl+DAh3stBSTck0
         1+vyKZEpHj8LzQANMrVs1htJ8khfv8GWYXwyVIarPL2e8tlhYjWhkOL70qkMpqzUIGKr
         GI+BMoNBSVH4CWDVmsWjJaAAdLGUBJ5j+KCKG/79YS38eFgR0BDwRRypou+YqSBGur8o
         /zP0RS1qD8nA03gpmFh1g3ePfi2RXRGwlibqxoZ8lkGpR6VwTGrzVJeZ1+gCXW1wansi
         o715TFpbwtzw2/aRRCuC953cD2h1E4QmGdVbaZzTqlLQoqKR+Xaq6fIp95Mu1hu+sd2c
         hRRQ==
X-Gm-Message-State: AOJu0Ywu3BjCTlb0Rbii4Nt0cHJweqKA80NgFH3PhMdA7Tz4G3Y9Xiuv
	Xr4b7p00cODpr5ZKgvsur4+AErKYWiWzP4SexJZkYNZIyHSydGGWyvpRhhCRCw==
X-Gm-Gg: AY/fxX771wondMUjdABSqXlIK502aQoPHMfu8i5KVX1qw3YP2aKl873P2yKYw0SBfXi
	S7MqeHJEeNIPW6w7fofVDVkv3RmhetCm8Ih0g3czbhqu1RB3JFvQQmI1/JEwvzHghZu9c9cfo7e
	vGDpjnsg2V56wjaCvsUjkpDEsjU4IBi6JgT3hUP2beSw4BBfWyUFb5Dp28COih3kz1MXij8NgNT
	hDWFabddEf5BGlR2tCqLXh+HePPhaM+w3W0oosCeC47x/8ciXedFDTj38Oh0YyF6vQkwEgu0o8O
	rdm6ED3iO0OdFaxd8LizFXUW8p51cPmZNwOlz0sDTZkPDiZlUAHqTEUKRgHlekTKP+5v1PlxpLw
	KQnEg44ov9kpYQZkIhAcaUFiYS6/y57zEeWsJugF5Oxw2OwadtlpqEZuqJJe/INexFTsC6wra2R
	aYjB/ZzVeyvO9mGnRE3xLKEZGdLPseT+DhOC9xGkVHo6dUOlZLw2/FhOyy
X-Google-Smtp-Source: AGHT+IFopkXWatiqpV2gyX3zmftGw4MjfkKXcBEM6O13Gtv/UtVc6pnR2pMuOC2akQ9jQwsUR+PrZA==
X-Received: by 2002:a05:6a21:99aa:b0:35d:d477:a7d8 with SMTP id adf61e73a8af0-376a8ebe380mr24291923637.36.1766824612160;
        Sat, 27 Dec 2025 00:36:52 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbd618sm25276910a91.12.2025.12.27.00.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 00:36:51 -0800 (PST)
Message-ID: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Date: Sat, 27 Dec 2025 17:36:50 +0900
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
Subject: [PATCH -perfbook 0/5] December updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Here is a small set of patches for December.

Patch 1/5 is another routine update of rcu-test.dat
Patch 2/5 mediates longer run time of RCU related litmus tests under
kltimus7 by exclude those tests from default list of tests.
Patch 3/5 works around a strict policy on ghostscript (gs) under Ubuntu
25.10's apparmor.
Patches 4/5 and 5/5 are obvious fixes to your recent updates in toyrcu.

As for Patch 2/5, klitmus7 converts synchronize_rcu() into
synchronize_rcu_expedited() by default ever since herdtools7 7.45
released in 2017.  So, the longer time to run suggests decreasing
trend in "throughput of synchronize_rcu_expedited()".
Have you done any benchmark on such a thing/concept?

        Thanks, Akira
--
Akira Yokosawa (5):
  CodeSamples/formal: Update rcu-test.dat for v6.18
  CodeSamples/formal/herd/Makefile: Add KLITMUS7_EXTRAOPTS variable
  Makefile: Let ghostscript access under /tmp
  toyrcu: Replace \co{} with \cref{}
  toyrcu: Mark inline enumerate list as such

 CodeSamples/formal/data/rcu-test.dat |  1 +
 CodeSamples/formal/herd/Makefile     |  3 +-
 Makefile                             |  5 ++-
 a2ping-rule.mk                       | 40 +++++++++++++++++------
 appendix/toyrcu/toyrcu.tex           | 13 +++++---
 epstopdf-rule.mk                     | 48 +++++++++++++++++++++-------
 6 files changed, 83 insertions(+), 27 deletions(-)


base-commit: f10ba2161229db12af9a1e38fd23850483721b7d
-- 
2.43.0

