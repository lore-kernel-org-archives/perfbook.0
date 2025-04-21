Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365FE25FA23
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229672; cv=none; b=LEgAqG708GRDvCyeOBSifU6bQPNO4GPl0tJprpqISPmOPHyxHBXCYdLWSCSnMOmwS40UF4V0wQj6vKccqPKbkFwvHotgpO0mjv9cmj5YIRbRmutrgZJNMox/D8NQKfkdorUWYQk/9oqrEjhu1xoK7XEYyX8bDUuoN4h1TOehJuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229672; c=relaxed/simple;
	bh=L5Z9JZKG7CJa0zzlRVDzGdYodD4w3CBLniezBjA2oDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KopxZZscJ9C5Kk5ZXsWGrNrwxhAAzdlZOVN4NrAZ/oESoEash9STsbMcjE6CoK6ddfvj9qLTzbfqy9jOsxrP0YS5EmQF6TfKeqc9/aeBfWn0OUhtGaQLlZiFOyQSGNjzr/gCtr23jCylsbCCdqrki6sPZ96y3lkhkQBuwzOBtXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBUu76AX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBUu76AX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c3407a87aso57076895ad.3
        for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229670; x=1745834470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8/Q8IkF6/gALzAD2yRCJ/aKqfps0WKgLrt9QkM6V/o=;
        b=mBUu76AXamB8Zp5AhCfNZxTRgcrDEGhVkvocv4Du8Hdff91HKLo9ezHkfBayvMXq1P
         HcI56NuSU0EvKPAbXXR7t+5P7sjWPJzMh7DcJnj6NlE+Rs4MJcndUzX/PWkulBEuEzBM
         540tbaTODuNJUOzseyod2IA+3bZwFt+x3gQ7Ybi4MDXLUOznP8jPUPqt36ROTp/daBzd
         LinMew78c+6CA6rZZjZQAI4xpV+4R62zzkpTN1W+Is8zkflZKw+1wjBei83JiLvz/Js/
         nMiBHWsKNqOlo0ClrxlpR3bT82UqOL35hLegg9lTLZt3Hq8sLJsJcKtsRF3pHfl5ONAs
         2nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229670; x=1745834470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8/Q8IkF6/gALzAD2yRCJ/aKqfps0WKgLrt9QkM6V/o=;
        b=l9erKsH4pUMRCnQEo0Y5FmAK0ErRcVfNUzuNc9mMaZn1JmVp+pBCL+jgHhQTFnNuCY
         jKshHrcLyKIiEC7l6cXdPSuZyebeceQ8nPQZbU+FldgAyjqucLGn3SjKTb1HxRUyTDH6
         RpxAMDs764Ld056GiAYTRlOpxDPJe90wvcEfwRR7iEp0nUYLkwmz6Qkx9NjekRxXmJt4
         PMeEnB5/zrITTuE0IHvpqGrrYUe8oV6TDz4twa9SjgU/HaNN1vE5ZnjAjdVBIRgCGIen
         HzKvWi/vYn5Q3Q5hQSXQpZDPOr73OKCsQEKC/jNSRuB7ytHFSgVSRvKEgcYfVJcFy0EV
         lZHw==
X-Gm-Message-State: AOJu0YynCuPlMARCVe0vb5BzzTpLz2pnq+IZPa2CzjB4rUsLdo4ctHe/
	0mFIDQLSpV1Kq8+2D9b26lwFnrSEvf+f7BHzVlpC2DFR06iBE93WM5Vyg6yU
X-Gm-Gg: ASbGncsHo4oG+mUosxu+osR2Diu68uQOwubbLFV9EyOhgbdDsJMqJ7Cn/o8ZQVJURQs
	2hGcwg5SX849ZZXzpTRK7iVkjgYOvHqat4YOyFy7anqCnEzy3zF581XRL+zG6ZkxZXl8sSn6ZuE
	E9mytGgIRpiSib0lGCLDh6yygxTzRAFljuf+aVxRFCWByJ1JQ6F9vw7CTBWHxZXdW5gwJJkvvm+
	RZ1Ki1FnibKlOYxfCZdDa3kSO5x5/MdaN0mE4fRKPNlnoFkAEQouSt570/qiVdhbBPZJ1bbDmPN
	DKMjGOEnzYrMhoALCxWfyLfVS8T33UTBfq83nOyTuTImkmbKTNgRojEAYOf7Ctl8Evq0Lwsw32K
	m8fEXhRBu+7IrXMZhNzvSIw==
X-Google-Smtp-Source: AGHT+IHMs7Dma/u/1DPo30XvLhGF5E76ZWsNdQKx1p2aB/7GJNMZqViRL4ZLjlBHf/PgP7ZvktWiSg==
X-Received: by 2002:a17:903:32d1:b0:224:fa0:36da with SMTP id d9443c01a7336-22c5358321dmr138743355ad.18.1745229670526;
        Mon, 21 Apr 2025 03:01:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde760sm61400015ad.215.2025.04.21.03.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 03:01:10 -0700 (PDT)
Message-ID: <9fe238da-0307-4551-8487-6a78c5386e2b@gmail.com>
Date: Mon, 21 Apr 2025 19:01:09 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 3/5] indexsee: Add a couple of redirections to "Cache
 coherence"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
 <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
 <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In perfbook, "single-copy atomic" and "single-variable SC" are
mentioned as "cache coherence".  Plain "coherence" is used as its
synonym as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 indexsee.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/indexsee.tex b/indexsee.tex
index 089efd44..fc2042aa 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,6 +1,9 @@
 % effective in both single- and two- level index
+\index{Coherence|see{Cache coherence}}
 \index{Full(y) multi-copy atomic|see{Multi-copy atomic}}
 \index{Memory consistency model|see{Memory model}}
+\index{Single-copy atomic|see{Cache coherence}}
+\index{Single-variable SC|see{Cache coherence}}
 \IfIndexHier{ % effective only in two-level index
 \index{Address dependency|see{Dependency, address}}
 \index{Anti-heisenbug|see{Heisenbug, anti-}}
-- 
2.43.0


