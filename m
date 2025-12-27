Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B31E5B73
	for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766825498; cv=none; b=FtCkY/1O0jWkpN0ZDYs+3Fm18f0Pb4FK7JkT7GBGgqW3+nAMUgW0YqCAwVrLw1xB8Scxh3wFoIaPRGmnCUNnrihCpZzpYxWrfwbI1sgh5mMJqNZ+8X1psQWltk9fD0UsfhzLAPVFlQvf5F0I6v+hLivtbYqFVVzNAlRJHhI27lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766825498; c=relaxed/simple;
	bh=RPBhfDJmIC2Zf6sypNbcgHhiqfUFn7ROf8FQhZMk0fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoLCzp9U9OqMhuYYPfoze0rhyAJrDUU5TEPi1D2bks9ftE0cOKSCK3z2cXttC1wb/OPJbYwT8aYUWq+k+kDQIDP8/t/8Tv6ceDV1HenyXvouK4mk6Y9BxWjsIR3y5dYMPN3skzLjEzaa4RdFa6KGcwRoyUdyc/Ur8YMn6VKj+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaPSxmpH; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaPSxmpH"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso7800707b3a.3
        for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766825496; x=1767430296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAPTa7r9kNgsHf5Y8CV2AGfz/TgVCdhPdr+H7U10CAk=;
        b=XaPSxmpHsSpBMp4Or1IYGR9ZlSagvpEeIFyGhQt6Zbhxipp796Z2eoSkhEa56fTCMn
         YHGgtbIfopd+r9XF3cV0A0RKxT/DiBgvLDekzymOpvdThZLYR2HlzpFviFBmD9el2w42
         U0Lt1FG+s4/I0omCvE7Y0Z1MvgQmXVMVx3nb3xJ2nUt4Ahaw8sRmXWi32MrKP/UlPvW3
         weTWjDxxcAyEjaYhVbykEwcNBwGwnLKPJ93uhJcV1hq5PuIsPGQgknDOa2XwMpbijDRi
         hx3UDgVhQiYjL/ACP2tF8kOcH+O1reOsEj9aOHD79t6gVpYjacuOQ9UFDhqSGCrVUVpf
         ljng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766825496; x=1767430296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAPTa7r9kNgsHf5Y8CV2AGfz/TgVCdhPdr+H7U10CAk=;
        b=n9srON+6baniml6xw4qVzxZP1UDEmxmsjWNbUSmBJ6f8+7iM4v/ElZArtjzoOb6EXw
         LzIpF5DDP0rtGc6hSS+NxcIr7hOwvDt8TnpiIXN2agFRvIEznKjMd8DOHGE0wAzOlgDn
         lrLMO4ZE2SwfAqxW/mlgPQRR0HMp4iaYshoMLfY/w9yAAVGe2ePvenjoVrlDrvfrmtYj
         JLq9QBrUEORnzbFq1erPyNjgaoDvdWxiDGPcL01+iTVmSzBu191k5S1jaCM+n1SeoyoY
         BL57x08QH5wtIwWaQFrryn8akXjb1pYiawjsOrN5oYM1Pj41S9hWtrovb3QjUyt/i3WJ
         FzdQ==
X-Gm-Message-State: AOJu0Ywhhh1ddtUFlk1VYTuilYkVgUwoD/ah8vQIwhxYBXMK/QWVkH9o
	prjvRoF0eLB8w/W7LIS15u9gsfRL4jqeidu70/OgzOf0ql8n8obSMNAH24BvO2qL
X-Gm-Gg: AY/fxX5bRh0+lXaJq43F28VhgdoK42hQvPODhLosKPp5n8ftwWQtW3qSwkoNOs1Bqo1
	5PqMsJVR1/vr6ZewWJcF4qmt0nlIdL1UXB9aHHOwffHD4iAZQb1bV2wzZvybpkJQSZhtKJKk4gI
	8N8xz7gP98mds63mrTapRI1kdsXa8T3aOHb64IZKsx0YaldwTfZyBcLBG7GBvU3/DP3/dC1+c8D
	LZp7w8WUAXLkQL8PaalXGwQXPyB8sL0wMwaNv2VdcxfBlTkhDAiPrgBkV4cqS03mUEYyOjn/4qI
	3RRD+gTr2FS+l0seBY+blzbRPeBOvwjP8wlbcvVzVdq6PPMeTK9fHUB1nhCCzEyhzX4yv+d+1H3
	iRTnvcuqLWTFoqDRPceiQKmooks1KAUXK0jLgnUUNoXECrFGgj6qNsnjH5upmdp5VX7JoNCF11x
	UCDX77I176BaCar4spU+Yk7gvc1Zs65zBRwlVrU+gXmJJHwSXdRP4H7wxw
X-Google-Smtp-Source: AGHT+IEGc0QOp+l1gydkQybI439b6gbHvcvb8dqgH1RwmxA1xDXMieAoZMj4DM5CLciO5oQH8CCbRg==
X-Received: by 2002:a05:6a00:27a6:b0:77f:efd:829b with SMTP id d2e1a72fcca58-7ff648ee39cmr18809293b3a.22.1766825496501;
        Sat, 27 Dec 2025 00:51:36 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f300sm24075421b3a.54.2025.12.27.00.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 00:51:36 -0800 (PST)
Message-ID: <a3265682-142c-4d6a-be3c-72bb64cf5dbc@gmail.com>
Date: Sat, 27 Dec 2025 17:51:34 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/5] toyrcu: Mark inline enumerate list as such
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the "enumerate*" environment provided by the "enumitem" package to
make the inline list construct obvious, with non-breakable spaces
applied implicitly.

{} at the head of each item is to escape warnings from punctcheck.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index e19b2408..b623cd83 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -744,9 +744,14 @@ that polls each per-thread counter in turn.
 \end{fcvref}
 
 This RCU implementation imposes important new requirements on its
-software environment, namely, (1) that it be possible to declare
-per-thread variables, (2) that these per-thread variables be accessible
-from other threads, and (3) that it is possible to enumerate all threads.
+software environment, namely,
+%
+\begin{enumerate*}[(1)]
+\item {}that it be possible to declare per-thread variables,
+\item {}that these per-thread variables be accessible from other threads, and
+\item {}that it is possible to enumerate all threads.
+\end{enumerate*}
+%
 These requirements can be met in almost all software environments,
 but often result in fixed upper bounds on the number of threads.
 More-complex implementations might avoid such bounds, for example, by using
-- 
2.43.0


