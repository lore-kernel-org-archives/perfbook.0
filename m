Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6669D2B
	for <perfbook@vger.kernel.org>; Wed,  9 Apr 2025 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211144; cv=none; b=H5p3wDAkJK5FHI+JbpVto9Gv3VdpYMthQRHbhhDvP4bg8BYq/n2+saCI8jtMngVKuBwKu2gC8q1IwAx14SWOSIKFqIpYrsxtDflrU+sW7EhycVyT3LZld7pvfm10pXZTepMelRSBrPO8yV7k2RTHC3JoH+aUEoSjZzeRzTK9RCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211144; c=relaxed/simple;
	bh=PTn35KIM8hDIdNzGnYqFECWCQzDGt+XP1RFRD9enSgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0t17llaHKDcOKZYMgqnjbkUy2DEJtzqD9RcRTLLSq03IDMgZMLEe3azoaeCqPrvijnKji9U+atl3HAvbBAaP3/bQ1qp6I1Zli7+nNKlyps8E1NJBHLKK+1d+FOf33TAgrlVnOQicJxTNzXq8dHY33F+0k4ZS4fEpmGJc/YlAyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfyaJDCM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfyaJDCM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c277331eso915139b3a.1
        for <perfbook@vger.kernel.org>; Wed, 09 Apr 2025 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744211143; x=1744815943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdSgyIufGU8L5Yo0AdNOV+GFC92wQE3QJWxTualViTA=;
        b=EfyaJDCMdd7RK7s7p3+anzUPQAdGFQxBEovumRt3eA0kaVtTMgXqo01E41ME95IY3Q
         nbiwxVaR3PN0YNKhvIfYnvWCLX6H6XCc7f1COHM4yojgYbCgAhp/Z+BBsaGyMV+VB3rz
         NJUMWLGQkaRB+HDf17Ijg6nInMGT+LEUSW2X6rEE3JZJA+MpvhQNgKfFBQx1v/kHBAga
         17LEmNNotOb6vbowLzDP7/RaRspYA5FUYXekxi50wql+lJt6Vj7x/88UguBpskT1JH5K
         lkbP7dAfTaIjZHHjUFpo/BOiw9QlN2kdox0rOdQOKbgEUv6vrX07KRhF4dlKYaJmP/3h
         eUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211143; x=1744815943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdSgyIufGU8L5Yo0AdNOV+GFC92wQE3QJWxTualViTA=;
        b=OIpd9XOFRsPyHujI4VwRmWwiHY9DoVeJlGiWoKsh8k2MfgjI+YIJCVxK8RVO//P7QM
         Q/o9EMG7cVpknrOxNFCwQPH/sYf7eTe8pR7fV9a855LxKMY68snrTojbbgTDfbmr6pO9
         9TtmJV0fVUwhjgPejidE9WFiXFQUuhS6XBEURyBr8+BKR3sg2LJi/G2nKPErbGkoee1b
         3J98TkBxywl8UYtlCeOy1SZV9DxIvIba4DKEITxycG6Ls4MQuU+E7i1Qk4g7+ovlTl40
         GWCgX09TrGyOMgj4uEUqqxm8aDiIa4lsEcQRqpp5Ay/p0T7zvQLSf2C2NwXogdXyFSXf
         b1yw==
X-Gm-Message-State: AOJu0Yy61Hea4S7L8hCRfRcCyq2hsAW32VyuZ2UTvB0Y8wCFG3XGRiG5
	arpd7Qo5Bq+DVJlQn6sMe5+z/qvCMiGml5E+gWXpx8ULJKmSGmuSA+gPRw==
X-Gm-Gg: ASbGncvyXevLfI3XEwDYCJCZgKdF7aQ1KaIeaiXu41mMnz4jomRnITI/rkQ053vYtQZ
	hG8+iS202KQnhPYN1FaQZK5TH2j0bZkt/U3LXwjBTu0x10ZK4LRWVbGUpU5pNvRnhaLAhlGsRYT
	CttUXKH3OBE5lnbrxYpNaiP7/k43TFGgUQftudA3VR55fMBawugyZKp1lXgJnPacACwgf5ITis+
	aHutcBnGr+r2A4FNfu8Zkg0YuMsEZ82krTMb0/waoJ4KT6S75vYTQvCFJz8sPlo2XWA94nmJx/1
	J4X3SyagTYoHEfLT82reGaTCOsg8h2fYGxZNEEDRSqJMDh8EQ5Jb3QF1ddXrrdk1QVdbHleEJIp
	FM/wrg2l0QY2hhDj70uqapA==
X-Google-Smtp-Source: AGHT+IHyKKN49C1XqmC0Cwrv6YM7IeKG2Cnj8lVMxW2pk+UBEzdfsZh0R7FfAVbsaCJMKVcNXWJSlQ==
X-Received: by 2002:a05:6a21:3296:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-20158d9b461mr4998028637.2.1744211141886;
        Wed, 09 Apr 2025 08:05:41 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a081838dsm1362272a12.8.2025.04.09.08.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:05:41 -0700 (PDT)
Message-ID: <89598be4-6b83-4ccc-b954-283082bc466b@gmail.com>
Date: Thu, 10 Apr 2025 00:05:36 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 3/3] indexsee: Lowercase "Heisenbug"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e57996f3-2a63-4de8-8a83-c1a6156a1e76@gmail.com>
 <53b7f24f-b0e4-40bf-aa10-dc681816e6d2@paulmck-laptop>
 <c2c49b57-b7e5-4b3e-b06f-d69a5fb1678c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c2c49b57-b7e5-4b3e-b06f-d69a5fb1678c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Looks like "heisenbug" is used as a normal noun.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 indexsee.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/indexsee.tex b/indexsee.tex
index 4cf02e10..bd80b56a 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -2,7 +2,7 @@
 \index{Full(y) multi-copy atomic|see{Multi-copy atomic}}
 \IfIndexHier{ % effective only in two-level index
 \index{Address dependency|see{Dependency, address}}
-\index{Anti-Heisenbug|see{Heisenbug, anti-}}
+\index{Anti-heisenbug|see{Heisenbug, anti-}}
 \index{Associativity|see{Cache associativity}}
 \index{Associativity miss|see{Cache miss, associativity}}
 \index{Bounded wait free|see{Wait free, bounded}}
-- 
2.34.1


