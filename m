Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD70430BA2
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443076; cv=none; b=sYtq9Nr/YuUAl1RPdMr2UAL7TtvzsU35iqttgBQh14l0/VDDfEGZTMZ5t5SmGo5Dn1sTApVNA0t6rYldSfRivLmrewhwV2LyHF0V4sHa3I5kXanPVQ+yg5Q3m+Y7wK7jPsbpMPrayT563Ju/9ArRH98OFJlhTwbCuDEJptoO/Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443076; c=relaxed/simple;
	bh=VzzLPPFHe3w3m+naUkNR2NUwlAFjy47MFBBg1Vf9H0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9XE5cuqR7FFLOQpW3lgwIdXmKxlcEL4RyRqZuNwEOfrhg915OSgfwJ97wXnekcEi8bM0KfzSn8RdiP+TOyo1D0+f07cDKfm8cf/BYqS3GyRPjAF/u7YppwJiKspnnbWSPJLxfABd+BQNKWiW3Rh/NzAPQ0DTe2YcBUtvu3yS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djUilxpk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djUilxpk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35990245493so393806a91.2
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443075; x=1773047875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCTTE0vdC1DAdhdPmvaCCCCVjOs+hUOSIyVcUwlmgcg=;
        b=djUilxpkq2f3uqy3AO1upXMJaEVrq/4bts2zTwM/1/NxufMXjDgyZ2vJrmZqmr2Wzs
         e2iy1R+6HiPxOQw1wySrjNwrutvvY6bhBX9ACjpcMYWqrybie1UAo1EIdsSZPj/UYtl6
         FTHa3W8MhUcvxdyEuujwSw/HCFCdlxBZsZe0aVAwyD2JMFOMLql0HF+G2hTpYoGTNT2u
         7nuqDJnpptXIW/+K9Ul8l7bDFtnWjVJ9DMd4rLNK5rfITjDFG+xmdiM3km7X0yCi2cAb
         tjbOskmHqyCVm0u0oeG7IltV/59+gygWpRzQkhkF4i61j1DBNGJMr0Fs+3DfXZD4xPwu
         Ws3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443075; x=1773047875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCTTE0vdC1DAdhdPmvaCCCCVjOs+hUOSIyVcUwlmgcg=;
        b=NxZt3JHKkClyFZLvm2GUQfl27n4mqq+kflCK0hGTUtamQHdUXYtk4TaskrCdBToFW/
         PSUogCa1Xyf85Ii0YyoQbGynV7M1T3l9NKTumrxLsbjuL4Vrn2wuDrd05s6mZtZx7V05
         5dJ5kXnTmDD4X+ACILn4UAKUEGtmhBHgtgdU3VOG6Fmy9w+tI8PRQeIzonTkN0CKb2UE
         ytiRrXnJP/IJmNzN5W99Z6y9t2nXciUYntYX9GT0z5OeFxg3tcWZAS6hQB254KYRE3W1
         /4Wlo4/uWsRUGX2FZDqPdxQgveobHZ3tTeIZKVc/SfHlxyfbrWksGNonmqkj1iuBBCmX
         uCEQ==
X-Gm-Message-State: AOJu0Yzd7vRta5ocIW5RFlqUPWu2fj3OlS1JTX0ikPddIz13Zh595RIp
	zhuZi/JF//x1JboV8aVntdDh22Rh073la7dCbXgqKYawhLeT/vjyCFPV
X-Gm-Gg: ATEYQzw/w60YQfEmLqQOAVYdzVUmYDJ6qUFRD3tn7LLn6FNcjzImegIqTYZUHWzAggi
	j36sy8VYa5lqbvYq3erc3NMzMqM5xbZGbs5uJtQDiDhDqV+/ZReQZGVD3swwhyQIKhlULNzksZb
	t+mJ1A2anQ5TAHbLxjompTMAXtYR1da9hlUdRVfvNezwbxb8zjovqtIt4k1RjN0QkHx2A8GG+Lw
	+AO6ZfZ0Rx2LAyHjBbfgxVKTGi9MqEnGZ2SLiOgWRPojRocNTl6eWjjPA3uNcpE3KjXxcSchV7m
	D/8UT3I2gKZtMJPnwd0wByttNPJW3ljB5wAmB61VIgf5/SsdJTzX/C4raP+RNGd8USk68zucJot
	E+J9iFQTDEsJS2A5Wtn0FEEfIH7MKEk+EvDW+kuNjU8kegABhES6N12oGi7qYcXjWcoiXfOx2cm
	8LkgbB7HrQ7QmhEvNna8K2huzkN9XOrf5IVawdvFj8aPOQMvrOtDx6skYevPSaAMf69wUY
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-3598230ace5mr3377339a91.8.1772443074047;
        Mon, 02 Mar 2026 01:17:54 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599221aa1esm803643a91.1.2026.03.02.01.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:17:53 -0800 (PST)
Message-ID: <099b954b-fc0f-48c8-9bde-23af8a9906bb@gmail.com>
Date: Mon, 2 Mar 2026 18:17:55 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/7] CodeSamples/formal: Update rcu-test.dat for
 v6.19
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Routine update.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 678ec787..ac235bd0 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -105,4 +105,5 @@ v6.12 22834 12313 35147 35.0
 ""    22300 12758 35058 36.4
 v6.16 22370 12983 35353 36.7
 ""    22437 13261 35698 37.1
-v6.18 22542 13299 35841 37.1
+""    22542 13299 35841 37.1
+v6.19 22884 13848 36732 37.7
-- 
2.43.0


