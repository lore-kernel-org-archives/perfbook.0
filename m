Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79129E10B
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210671; cv=none; b=MRX6kfBp2zPcmZMiSHgUUpgftUd8j30/P8Z/HnTs0e9lgT5JyUpKjycemxPfOYtFY2ZDq6Fmi314lpVYU2P/i73STn8ZRSuA5759hH6BCT7189HZv5jLUpiuS8QjUDrn3zey3gQ+UcS5fGE8Q3EaUvQwA1+K0FK2/qoVXEl+PxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210671; c=relaxed/simple;
	bh=tQwR+iHnpw2i6vfV/SdLf9sw2qHwdsocz1tHuc6FQ24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrFxY4K6Us68W1rWL2xER/vmfPeHh7m7xlao8OXovrXS3qx2qerHshUGBLDdkfPScHgitZvghJxB3SBg8lIiie3CC7qKHsyDl4/7YeBu4rP3FIWIsWSphU0RORwzRf6SL+jt0mQWzC4b33He+E6WNbLvCR2DcLpviNXzS5IMq8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W28h1DMg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W28h1DMg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so2730012a91.0
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210670; x=1782815470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeHTEuI5SjZ/vvw7dBWKV577j1K7TkHbEHu1BnBuWUY=;
        b=W28h1DMgWkXswu9NR0ooUNFU2fB+4e8RG3xQo5QgR2jjcSIEfkiE6bVIS03usFSjrT
         nksNouEvgsBlqSWm5TwHFf8WYPCdWId+AflGV0uEvU5m24UN1lOOy2E4u4+ckqq4Guzd
         4VHgd27MPXTCLm7FnZHRucAhlgIj965us4QHIavkWH+nI7xUK6S/dm9yRNq15jMSjKPw
         h6pNBMbR0BWLxJMg2tgxnaxg8AjGhOBbsd7uby9M0cXrKgFluU0oZlWzCIp9wtbhxXwV
         py907v5au4Ngc3ZLGxDUc+f+CSqKnXN2hHTn/+QFacAkwJLEdwVaewgGNE+p/r/KHXg9
         8Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210670; x=1782815470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeHTEuI5SjZ/vvw7dBWKV577j1K7TkHbEHu1BnBuWUY=;
        b=nUDJ4zQ2bSNqqpFQq02aycRLtRDC4z08Ufr2PhpZTPLHBXkeqWx0nIsYID5XAje4Bx
         o/mhDCwaf5aV87jLUpXUpl3kBiaWMHsKKA4EEFyPab1EXvqHkfkBNb3fgvnLRkTT7zXy
         08LJV0krndQeTqxNNbBlg2oUen9rUvbRGQYo8wn4YKV20eHMVhk4zWNbEtFk4rIkLmSU
         tbWewnWUt61UmkD/BfPfgoVZDIalLorDNUzrLbLeuALfyVgF7WzeqImdr20zDzz4zXSj
         7I63GjjVOAMy8gYN1W5lnvnhp11mC7Fz6/Io0zlS/6qSjV6a3rRYgm5mkIDcB7VaCQFJ
         Gmwg==
X-Gm-Message-State: AOJu0YzSrG34fgN/JLKVkJNlUZge3e53jD/3Qusm48orUF5FcTr+nD7/
	GPvORRZLj9x39bfVbw4mIAqGrsgiClSYozwlhY9+ueVM5T1DK/wZeSVs
X-Gm-Gg: AfdE7cncpwIGuE/W4gQKUbwSVFhWvi5HZQhDrfj6t4hzNyr+CnawzrVNxIiWl3aH/sl
	g9mewd0OUoTd99sk18zudOyW7HSE9dm6Lmoo0RC79auebs0pt5wIWhgfvnxIA1tXdUbm1uuxBE1
	CCXfBDh3o6u8gauoa8Gv5Sf4n5sJN8sQrEsgTSUfUw1GYL+zApw0KtKghOWBZifOJgAc+zhZfAQ
	FjWgMAIxupgi/lPedoXe/Ucf54RgyA8DvstcE/jZT592UC2+2vSppts5CeCR6c0+xkiycSAXI2u
	TRJg+SNKEhOSPIjbXFAKOI0XIb/P95xWgnoXu1RJccOyXA/I5Vspsjm5QtpgcAR6Bqag6nq8DX2
	U7ZdAXOUiupePUdXzSXnsNqPechs5MX+Ty3RWDRy7pKRmt+85LF1CDLQqy0fZ5vZv5DJuQAuSYJ
	h2J7VItPUju8BAbn2JCU5yCCMZ0Q9YnnySYt7034ie5X0O5E4Vz7zSmhALLQ==
X-Received: by 2002:a17:903:1965:b0:2c1:ef9:4516 with SMTP id d9443c01a7336-2c7c9af72afmr17571115ad.35.1782210669924;
        Tue, 23 Jun 2026 03:31:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105233315ad.37.2026.06.23.03.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:31:09 -0700 (PDT)
Message-ID: <a32da007-d3fb-41bf-a2b1-5f7b3c3423ee@gmail.com>
Date: Tue, 23 Jun 2026 19:31:08 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 6/6] Update rcu-test-ratio for Linux v7.1
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 722a08d6..c04f613d 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -108,3 +108,4 @@ v6.16 22370 12983 35353 36.7
 ""    22542 13299 35841 37.1
 ""    22884 13848 36732 37.7
 v7.0  22359 14019 36378 38.5
+""    22456 13924 36380 38.3
-- 
2.43.0


