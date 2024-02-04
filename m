Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1863A
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 00:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707005752; cv=none; b=apK+dZS73aqnZkMT/9LPXJkfaBC/rrb9gERsi/BzFI8cYIEb2jOixt+FTT7aG87Y/N6PQKOW3SBDuY4/YCJLpLV1lMNZDQMq7I0xd4XLpMZt0Sxev9+JIAtK5Q9eYxXnvXbZbm6HkTLvserAcKxoA0GmlQ0dKu2Mx5Ysj9VaR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707005752; c=relaxed/simple;
	bh=TWX9mzBTPSjnoBz25D+ypU93Gx2WzD0bK5f8Mrrz4p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFBi62BzykH2fMogorQeXgPDapxnutnU5BFhmswA4gC1ELh4BtcrTgqsXZHI/sm0IIOxILXyoI4ve1tlO+QXu9F1J/xsZhUWvqVa0mRm6cYfsAO+Z2HLU4NY16ZHeoZ43Q57PgQBYkC2ozh9DYBLBBv6PJ3JBW1IW5s0riEqPOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKhMGw/+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKhMGw/+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso2807386a12.2
        for <perfbook@vger.kernel.org>; Sat, 03 Feb 2024 16:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707005750; x=1707610550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kvSfyp70A8YtBhxOn6C3bBWDeLuOyCS1zfi27j6oqg=;
        b=LKhMGw/+eHDSojDFPSyXlWgXjDzwBR0AgYAP11RWB7u3hGxLyecJDkbnj/H4qZH8Ko
         eYFyu9Rs24RJKL7ebwx8h3SnInbbChx0NUfRGtkeXuEGrc14iJCOyf/0sSvQdW4vV96h
         6VrEDZiFGePFH0ArcgSIlIFgP7HTR4v8XdWFlfsBsa6bFIqDl+cHwsT4AMi+eRlKnUL2
         qTDhv0Gqbmmm+qbOVfado5adTSI7qFy9VVuoj2v6IuuD031sf4ayoNFvBSddDcII4vXs
         y87/B88Tqd1a0rD6R6YkMPLNououRJGnlweGtMI6sa9TU9HHssJPh5ABwwZ0Ip2gVbGk
         UWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707005750; x=1707610550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kvSfyp70A8YtBhxOn6C3bBWDeLuOyCS1zfi27j6oqg=;
        b=H6CgHP+M9SVMgMKOPSuA3dXRbsxf6wH2jxbjPpIQYPbGsULMF2Yc60fsc9S4P/3xxh
         P1Zu/0LvMvGeRFyTat04XnO2kDYXgJLd4l2RxLCTGgUaZD6AfOsT6eZu7wzwmJyygYNc
         8hx8NMBmzAIhTG4PC//0x3dew+F7JVqBTptOcI09HEKUYVQgZaI03nVkNNMt8e7/zuvt
         4wNZQnYoU5J4i3Fe6eNOUfmFm8flsRUdw7Xj2A9FcLJXdN1LXJIoVF6BASAnkeRiDAWO
         QzOCVjkbdBXttte4+H57zUmvQwEUn6PdywJyXzmW1wtZLjDggK6eawIXxup9LdknY4Dw
         Ip6g==
X-Gm-Message-State: AOJu0YyXJ6eCPhxMnp29Ww2Dy48DwPOoGY1A1cIbvL5CueSHR8kdYn+G
	eWJNOEx/gliGfDcMgrHvRmfSppXpkV1LhBAtFNACWjRmt2sELhFcdU90uBjg
X-Google-Smtp-Source: AGHT+IETAahfPeS64pcLVmGfw1ozxWn9nrn8c+y99sljAPRve3w+gz/pzXHmRmUztRrfJgrcwqIaqw==
X-Received: by 2002:a62:ce86:0:b0:6e0:3769:eb92 with SMTP id y128-20020a62ce86000000b006e03769eb92mr669992pfg.25.1707005749908;
        Sat, 03 Feb 2024 16:15:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVKuooOdBngULVWXrVm0tsS/qL/11SI0AT3BFPnCZ984jmRpjAse2BiuXm/dJYCVmy+CaTMyNZ8zZstz8p9KmpA
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id n25-20020aa78a59000000b006ddcfbe736esm4061468pfa.97.2024.02.03.16.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 16:15:49 -0800 (PST)
Message-ID: <94e6b089-db88-41a2-a67c-559407266b74@gmail.com>
Date: Sun, 4 Feb 2024 09:15:49 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] memorder: Remove empty line at the end of
 answer to QQz 15.31
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2cffe54f-fb53-4cc2-a5f6-fbc439c1d069@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2cffe54f-fb53-4cc2-a5f6-fbc439c1d069@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Extra empty line breaks the placement of end-of-answer symbol.
Remove it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 1 -
 1 file changed, 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 55e431e5..516cd9f1 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3007,7 +3007,6 @@ passage of time itself as a memory-ordering operation.
 	Such readers are encouraged to consider why that might be,
 	perhaps referring to \path{CodeSamples/cpu/perftemporal.sh} and
 	the scripts and programs that it invokes.
-
 }\QuickQuizEnd
 
 \begin{figure}
-- 
2.34.1


