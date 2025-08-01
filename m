Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C49315853B
	for <perfbook@vger.kernel.org>; Fri,  1 Aug 2025 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047822; cv=none; b=Y4wYTyxrdKe//Izff6o0uhB1qMGO1Cyho8znEG0kiWb4FP8lOKMwGC0RTkGdjAK3am6l/JSRto6VaNGbvWvyjqlcTVELMVbnyGY7aCIwIWN6/qTc4GELXSeqh9m6SbtG+H+h/ZcuwCnSJ9darNdQjRDiEQQIdW7XrfLLDRadjkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047822; c=relaxed/simple;
	bh=h1GySvn+gvLhNjH/i2T9Rf2C9ii/YS0xQv27F/5acwI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FsCzNH+LjTlwzZH3LjJAuJyveUDzfhiEoR+y7/qrLcf51LPlE6Ppg62p/JTzpp2DCoU6S5PwRptE1VanCj5FnieTyvuZEZctQG7KTaoYBfoMhuiGJ2+1BnJZaurNzlAn1nomzF+XW9nXoDHmIdeopyTdXUZI2MFIudijcIN/tfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZoBatdU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZoBatdU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bc5e68d96so1471007b3a.3
        for <perfbook@vger.kernel.org>; Fri, 01 Aug 2025 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754047820; x=1754652620; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egt7iyxKtFR5SgnzLNZ1cwEyQrGRfjr39oMK+n2tUaw=;
        b=GZoBatdUkSJiKpB7qDwoXhUKQyJcJPtASYz12Qb5cEuWjuO+W/PcpKwgSO+RxF9n+a
         FMb9P3Z15U03evHZmu+sQlcPuMBTGx43dU9lYxMzYquSgmas8ORMi3Rq9zppI0lUf68a
         h6PZ0PL1VanhjyoQ/nhb6zAsbFB++gEmh4GyfA/H6jJ5zPpSApRCLUPgXBqlzJJyCbI0
         5vCV9FQVQU0DHIZS9q1xJXmY3siYtCL7g3aY6Fw5wnJqDr4A7USSzqaXlRB+HDIZJi2f
         W8nV6UPmiZa6EqZKhgWNtmVV5zPlSLYhExLcoPvu5hvaIW1KIWWg1wdBWDxM+VS4npRm
         Z72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754047820; x=1754652620;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Egt7iyxKtFR5SgnzLNZ1cwEyQrGRfjr39oMK+n2tUaw=;
        b=O5PqnKZco/w0zjq97UDrf4z5WvPF6ucVdPN99iUKYEi1x0c7HTAHm0Vx27RU1R8hti
         W4wHxL3/16LR3u66BlU72E4BW93llvUVadIMVMoOt4TTNN26pxtr9cJ4YEpdT3uGvkz9
         WYfug56ENJML4ygKu/AYiV64qwywk6gU0/ElHhzWBqjZ9b42mg1o0T+83vf7dpX2znhc
         2eWZbLTOKfR+38giTCX6u6ga4Cm8fTVUm/W8I0QMaeRt9SqB44wPgGQfPMDkQgcNXSxn
         uLMOm+PXfybX7BmwK8Zs0BhfFcmwEf+K+y0+vLQJ6gWndZj3HKe0TkDmpyaFP6uabT7A
         Uwtg==
X-Gm-Message-State: AOJu0YxmXMJ75LBCJtpibYwMAf+mPBzYnPSeJZfYDwJ90PyA2FgjEIeH
	s1E17F8carK3tIbKSaDepCtZDngJuNSjMqH4MOpk7xjpNBBjpOSZRtu7
X-Gm-Gg: ASbGncurO1VRTemfy4V4ILJYU3qDQ0SjYFCQa0PJouiZU4/2Emr7/6K93c2Q7jlnOmO
	rGjiTI111zEW1DHZqN93q1u7g0mRwpMCK5sBHMUm11NkPi3/TFOHENDdrzJtiCqQ2nKu86mYYHi
	q31colrCny5psfhUiLNPcclfFbnviH6BSbiHUDbSil0SlHRt0UxioLHA2oy77T4tUGZ6VlmmOEU
	iaIzMPTTVKN+qpQ+LuF/7FtdGHzF2xQVd65ZkPX/1pmrshyyeIIv0TMqfM+Kwmudy7ithhtV4wl
	ryvwOYyCh4Nb5zSfoO7oY2Suzftks9k5T9Chg7kgxgIW8FYQzrpenLNzYJG7x8YeHfQysHB857X
	gGMsidZ4T6nbE+b2v/ZNODzjg7e9F6G86oG+7A84iI0jriH2VJ1KfjwT4ITrNvUwfmDtO
X-Google-Smtp-Source: AGHT+IEb/9W1FbzM9OtyiB6b7yieMnH09hz8Ooh+k9jupMQoGOHifOecqQ5HsnIXtLIIcdoX+QOjZA==
X-Received: by 2002:a05:6a20:7f94:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-23dc0d7f0f5mr19055294637.7.1754047819548;
        Fri, 01 Aug 2025 04:30:19 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdc8c7661sm1669736b3a.76.2025.08.01.04.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:30:19 -0700 (PDT)
Message-ID: <29fc47c4-7ad5-4ac8-98e8-0e6cd76988f2@gmail.com>
Date: Fri, 1 Aug 2025 20:30:15 +0900
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
Subject: [PATCH -perfbook 1/2] CodeSamples/formal: Update rcu-test.dat for
 v6.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index dc7ac7ec..d63c1bd7 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -102,4 +102,5 @@ v6.8  22018 12071 34089 35.4
 v6.12 22834 12313 35147 35.0
 ""    22961 12414 35375 35.1
 ""    22107 12620 34727 36.3
-v6.15 22300 12758 35058 36.4
+""    22300 12758 35058 36.4
+v6.16 22370 12983 35353 36.7

base-commit: 7348873f5c9fc45a42a6a6b1463631f212bd2661
-- 
2.43.0

