Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627D392C4F
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568792; cv=none; b=fa+l3qk1Mi+Kwc8CrZXLiRLKkWccVu4DrgB79om1rgQPNwIhIgRdAw5fOJzoj7Q9fmiXFdzilMERwPzZCLY581AtRM/zPoh7KxUJMVfa+532SDvLfD1UzB9HMTlDv7np5oy4zlyrdVYlYadWqMgkoumF9mK8MfeWsXS+UyHye1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568792; c=relaxed/simple;
	bh=gykB+zjAq2V/SxkVMoj2VAFA+57w3suq7Lg9BFp2/RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAcXIVr3cOFTzrEyBnD+4pkqW+51hQqTLAk5+gZWhjI7jTpJ1ZzJf/nn6XC1O3BKmpobw95nuRfF/2uBsXDFNApK5jf8aMPI/xPALn0FvWixVrQ891FsOtQTYj6QNmAHQEpbmIzwodm1+7Im0ZCyNeyCrjalMdcVNsGP26XZyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLP2qTci; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLP2qTci"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842307473b5so383533b3a.2
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568790; x=1781173590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lOIiclvSEHU4eZm5ztOFxMVkErkejr0ByldK09nX+Rg=;
        b=VLP2qTciLFhPw4UdIkHFsw4RRCL5g5+l23xPhn9ovzcTyrEI+1XzEo+G/NR84hAtiT
         6qp5K0CZkbPG1ZI/CwEgO6dN/zPdfP914LTMWYDiowsKLCsH59h6pOBwUDO24yqP4JuZ
         qZ0UfIhgoe1fX+VVyCJNZEKQm8fQUr30DsncCk1fLt6RgtgLFtpsv+hgh4b6wmftqUFH
         DWGu191FSwlrVjkR4JIQy1MdJQnUSKC6RQO06cOHeO7oK/BAE4ri2RyAUm8B8nbS2k2q
         70ZaGVZigKzNajsojXRVhDyR4HbfFur4q+T5hnkf8LQXKMhyU1ymuK4VgmV3c6hwJkPc
         jMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568790; x=1781173590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOIiclvSEHU4eZm5ztOFxMVkErkejr0ByldK09nX+Rg=;
        b=XukCaCKAveNC5SKTG4OY+jOQWsOafWVgHBbBSm4vOvYROKP24wc7EykL6tquAmQ/Jk
         GbezeothcsohX70B8YIQsDHbMMqvPc+FiNrX+FiHj9n2XWWwygmCv2a6Wcmt/DkZ0Hjn
         o1BZDjq8y3taIUZJN7qLpjCuFArY+hiOeeMRtWxboeQ1QSplr2GbSxeiD0UksFU6tHOX
         E1EO767mhr6qxTM1jDuR/UCq20knVfUPnbGSWa2TPddWUB+6Ia84s7YpunGJkaUuscsN
         3oQEad2Y9/7WFDBJlomBuESkOyXyDcq/DbHhGiD1m+tWi8XB7VwuZPtoHaTPcWTAnV/R
         6fjw==
X-Gm-Message-State: AOJu0YzdtN/WBxll/FERW6dMIdQg8kPE7thcQVUHVRaw7vWHbsGKwtUB
	IqlnA5Kcy6Il2cOHEyPEO/kQ4hIQBLL2BLCq73mX+CJkl4LDetK+dLiWTFQW64F/
X-Gm-Gg: Acq92OFccwXJUMrPqqweYXZVyxeHcZJPFnH+4re5aEQzti6CSazGIMajxwEeJWU3kuW
	3Qsddy8WbVmm7A3OBvy/6+YHoaN3+YOpqxBZMaChNtremeF5ATTeX9xrdD2PnmAgUUzhw+j5q2m
	MtaBmqjwbJjwG6t/cVUlLPAFRrI1wwWHqY5VxT5YLFzlpqu56xGRUNollmZf68RK0bidTdfA05E
	NTxGXtz2XMHVDpdEuFo/dw/d5kBi7d4uyDx0ZAMSm3oYuQxnSew4pKJYWR5mJd6WoT7GQGLs7uu
	dP6Dfs2AGbCY6KTqpSkZjWs/VYz/RI1F+PDPpHdIfnoVyIbgh464tVg6buuhG5Snogr58/M/eTx
	eIKku/UNL7wtq4yP3qyAxEiowG+YLbPov+1//IkSPZqy+zwxVLvU11bgi4eaztbJBr0ri/O3M3Q
	T7O9Ig+wilqsF75R7KNN7Fs0xjIovmYysDCfnHZj2mBWKA0R09R1494Vr8GI6km67b2p9fUUOgI
	sbfMdM=
X-Received: by 2002:a05:6a00:994:b0:82f:623f:e5b3 with SMTP id d2e1a72fcca58-84284ec082cmr7609607b3a.34.1780568790180;
        Thu, 04 Jun 2026 03:26:30 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm5635404b3a.10.2026.06.04.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:26:29 -0700 (PDT)
Message-ID: <0a6e59ab-86a2-4062-9869-303d878caf78@gmail.com>
Date: Thu, 4 Jun 2026 19:26:28 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 6/6] memorder: Fix use of \cpagerefrange{}{}
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In this case, \cpageref{label1,,label2,,label3} is the right construct
to suit the wording of ", respectively".  The use of ",," as separators
is to prevent range of pages rendered as "pages M--N".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index d0775c36..f3ce94d7 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -335,7 +335,9 @@ Some long-chain examples will be illustrated by
 lst:memorder:Long ISA2 Release-Acquire Chain,%
 lst:memorder:Long Z6.2 Release-Acquire Chain}
 on
-\cpagerefrange{lst:memorder:Long LB Release-Acquire Chain}{lst:memorder:Long Z6.2 Release-Acquire Chain},
+\cpageref{lst:memorder:Long LB Release-Acquire Chain,,%
+lst:memorder:Long ISA2 Release-Acquire Chain,,%
+lst:memorder:Long Z6.2 Release-Acquire Chain},
 respectively.
 
 The seeing and not seeing of accesses works the same way as described in
-- 
2.43.0


