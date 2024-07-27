Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE585186A
	for <perfbook@vger.kernel.org>; Sat, 27 Jul 2024 03:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722050561; cv=none; b=g6Nu/1CEPLQ39sxODOJzbQBdONIOHgbp08ZSrw1B+RnINRT75qvCYOfpuVhldrdSIB6Wt7BcdBAkQtJAMW6vnrMeMa3jq2Xj4HROspHy5u8tQ1I8QpE81uPjMExXMT0PIKMzph/e8ulwc6w5PNLX0H0kS3T2w/eNFJNbOBlAwhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722050561; c=relaxed/simple;
	bh=756z/KP/LAVOYE9P9c4Vn3x0EwEqENeK3iwTWis1NsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVmX2JRN6dN76u2+P74Rt1pTbftuftRuVHQtd9dqxWq+knGC1KTMJzICiZ0h14Y4ej7o+D5FNOIsf7uJ36RhGEIXxECEo4l+WoeEXYl7gTwxkjJmEc1EvXnGQ0c+9fWpwpUw/sdTdhtTpLCFzBEEuukIMaGNA590a65MEcUrN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPYNv3Ir; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPYNv3Ir"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-267b7ef154aso1250429fac.0
        for <perfbook@vger.kernel.org>; Fri, 26 Jul 2024 20:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722050559; x=1722655359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7539sY+Cn2UbC7LpVDd1GkiduqryKY/b8zFGCt9qqHs=;
        b=JPYNv3Ir259rp3+j9Ceq08uH490OU4KEJed3nDouTifKk4u9/Orbs8O6kedAeGa/Ma
         QSWGfJsOBmNg0Zt4KOdoc2YNQzes+TmBua3cBduKWR9OxGVKLv5L7ErJ5/sQEsCdlH6u
         7eCdKfKc2VIzR7w9tqbDu/2Yp+JWtp4IG6sSFRKpijqh6zfsF0H7w3A7oRJL86/VyKfs
         LZ4HzY7JazN9OzKTyjAtRQvE1b4i1M3YVZK4CVKXBtlitz+lotfbd6ynn5c6TkY8+G+6
         4ghHNEdN4vQZ/pjlBPNWR8o9U1QkeLtEqkL0Ut0U941ZeK/ZWwxUBpSoQGOoQ0VnjZSo
         5+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722050559; x=1722655359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7539sY+Cn2UbC7LpVDd1GkiduqryKY/b8zFGCt9qqHs=;
        b=tfZlKn8qxXTk7JlFgk8kFxExRGIUPmn07TyQey3ZbYspbcblbnh8Q5tSQ6lnA7VSmT
         YRbO/xckz0k70/zBKIQN3r13BbI/BHeaPNX+wHr/rVGycRF2lFZHBCVhb3Wxr+5XbMtv
         K9UL3g+O7iveB+fr3AreZAzrT1cmcmehjFowGtJ1cvPZB0yi7OHyMAOwrfYkRhY20k6/
         7aKBE4h2Lbq5t4DjRgtWeNGTWe2Qizs3iTRsDkl7sWYo5x4zWOZvJjnVpjM9QSNqRpzM
         NUkO4BAGg5FcZorH/EVdaFQ+aOTRb3nlJczdAHmpP8HkW9rOTGKSgpzoLDoPpT2WM6oP
         T1/Q==
X-Gm-Message-State: AOJu0Yy9nxJ2rGbmhi8GxfP0GHOZZr4rUBQpOPVNhwrCLdwtkcTwoOqj
	BlABFl/6VOPxNdSIBaPd2ceHXjKWj/Tciq+Z0nNjdD8ZDjxNuPqTgFupIw==
X-Google-Smtp-Source: AGHT+IE1mBSQgnvGtMTgqjw4lS0H2Czpnfb6OLcZZpvETn6h3ZwUi7ARhQma+hzL2v0ihULU+dzsqw==
X-Received: by 2002:a05:6870:c086:b0:25d:6464:4dc0 with SMTP id 586e51a60fabf-267d4d14767mr1917964fac.11.1722050558790;
        Fri, 26 Jul 2024 20:22:38 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead812300sm3383139b3a.114.2024.07.26.20.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 20:22:38 -0700 (PDT)
Message-ID: <5b1be2ec-f43d-44e8-a420-f680ba9dae34@gmail.com>
Date: Sat, 27 Jul 2024 12:22:38 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] datastruct: Fix off-by-one error in CPU range
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <0b5765df-1ff2-4fff-ba1f-704c4087e437@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <0b5765df-1ff2-4fff-ba1f-704c4087e437@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Table 10.1 shows that Socket 0 contains CPUs 0-27 and 224-251, while
the text reads "with CPUs 0-27 and 225-251 mapped to the first
socket".

Fix the off-by-one error in the text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 07f99fa4..352b61fa 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -383,7 +383,7 @@ of the list of complications on
 Clearly, something else is going on.
 
 The problem is that this is a multi-socket system, with CPUs~0--27
-and~225--251 mapped to the first socket as shown in
+and~224--251 mapped to the first socket as shown in
 \cref{fig:datastruct:NUMA Topology of System Under Test}.
 Test runs confined to the first 28~CPUs therefore perform quite
 well, but tests that involve socket~0's CPUs~0--27 as well as
-- 
2.34.1


