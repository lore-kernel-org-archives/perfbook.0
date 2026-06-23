Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181B73624D7
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210611; cv=none; b=grxBt9NJQ+C1pcvxJ8hyyDKxda6X/e7XcHTIULfJOq94mZzTr7X6GPKsN5b3WkizC+96qP3Fwb4OVSmZCcHtRfW+7mDSq9JWj0SdN4wGciroST6y5fIzWQ7Ok90Wbp8mICPVYqDgMhovg0gKrk604wZvNywS2efWZfb3Z3x0pIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210611; c=relaxed/simple;
	bh=eCP4sNG+RQMC7ZkjeHbrfO3AtiRYU1E1HzOCW8VMbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfYCzYkS5SgTHVqPSGtf3e22ubwsz6mnhH+9gKLIqKFwoGS+1KgAal2E11+0VsbqpmkuyxWZu+yRwZI0nUqOgGUHsPlDIIkc4jjIJ9TJ2d70nqXryYxwzGU/yPPsoZPQQS9c1lU7zs93/Bx8y4Ik+r1BWRFSssMutbaXZwwDLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6ydsRfX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6ydsRfX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845537740ddso2111795b3a.0
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210609; x=1782815409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCcFKmVFxezfTkXu5i4TwhXtPJsFOfuqE0FP985iGZs=;
        b=D6ydsRfXflNz2mgQSKsDyEu0JTReFzgkEb44Xa0VQlD5ygE0cwE3DobJYcvZvlI0hf
         vM58487iBt8gb9DBPh493XUW9RyiUVcCc1IBqYsfnQhmdU/TCg0wSqyO9Cjx11F4ZXDb
         Jhf2KzrVFdZE5UJDpKpjey645UYpIN+/MebRdoE/vQDpWJiQDoOO8qhQexURuNjsz8kq
         QxunAn74lFp5uyeQpQ5Sn3LAnLZoh0EJsEqM407RG23pfydCE3vuhvh73jkwOFjnQpNz
         bpO/7aaPJUskHE5JV5dwFpw3l4MH2sVbwdu3FjsS/MPmD35xVh1VMnoIcrYiK3JEzuDx
         3Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210609; x=1782815409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCcFKmVFxezfTkXu5i4TwhXtPJsFOfuqE0FP985iGZs=;
        b=gM1gg6fwqJh3nHhXsswjUW8/5G9+rzzz+w6nKdjr3Ny3Yw2tBoZ7R8iJS32naOY/0l
         B+skTKTXiN22bv0+ZBfbFl6i9YBGw4PrfH8bMhbK6wuH+5TCmcwWSlYaA1cXiMkIEbNO
         8sH8vz5vLi1NSchY/HTKBAMVBwdapaCbmWPF/2Aapi9jr1ZALX/P4B1omW4TENk8VamF
         VYMM0SDYeDRTbqc5j/xDjmTGFAhB9WDkcualFnHwr0m8n46gSlJpGFInlZA7Oifg1DoT
         PUVf7P03vnzel1T6qobS49gyPWtN6n/2+iyiytcC6lzLGYXw5UCV2PR//AF8YwHDvYI3
         Zt0Q==
X-Gm-Message-State: AOJu0YxqmBbtff6Gvtss19OJeDhm21kHC1L+XwST6/YPda/arz0qYziV
	TRUbe3x5bonsF8MYsHwqz1q1Z7CfG4Bz8iyYj9nVjI30gjlvqWrJO9U9
X-Gm-Gg: AfdE7cmcfCeWbuXdbSyuVy01BGiZ97Cfy2YZsBYeY5QeexGXooRNa9xopZer8uNtFa2
	PXbKgRLmj4+SdC4dWeGkjxDtwqh3yRzwf3TbvEdfbQHmjW2REUCbqIWAgjbYxfzi/hFrkW5LnvK
	a+rvmV16OpiICKEyExhWdP9aNNVJaRHh207WmKT63UDAxJQYoXiKBR034xirkpoUoLUi6Zf9200
	yRkdm4Mj98Rgj3itmCcbx0ILmUYtFVeA+ZrxpUZMDEhcbWMyEDAQDpVgDbfJvLpDJ7xPAZD41+E
	0hNerdjKSeIwXWtMnetz35umAHP50QjuSqXe0DHuzprAgini23w+Xb92njFarxRwHoEhyOKB/EY
	IaGUmjSwXJQOLGBx7/ZvsD9y/a2zV2tu6vRvnJ6GLA0TwjT+fuv5zw4VIU2GnW0JkpQ5ZMsv6TZ
	55gptqRVgdVDMZIEDqiqC36ih8biAye09lx6LlVZn7vRnkQMCm2a9A0LQIIQ==
X-Received: by 2002:a05:6a00:1ac6:b0:842:72af:b3b7 with SMTP id d2e1a72fcca58-845508bbcf2mr18917338b3a.33.1782210609227;
        Tue, 23 Jun 2026 03:30:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecad79sm11604910b3a.50.2026.06.23.03.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:30:08 -0700 (PDT)
Message-ID: <19a0a262-957f-49a6-9037-bc7c7ca634cd@gmail.com>
Date: Tue, 23 Jun 2026 19:30:08 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/6] defer/rcufundamental: Fix typo ("cannot not
 return")
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
 defer/rcufundamental.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index edb90e0d..7e06a5ab 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -220,7 +220,7 @@ pre-existing RCU read-side critical section to complete, and
 waiting for a \emph{grace
 period}~\cite{MathieuDesnoyers2012URCU,McKenney:2013:SDS:2483852.2483867}.
 
-In other words, \co{synchronize_rcu()} cannot not return until all
+In other words, \co{synchronize_rcu()} cannot return until all
 pre-existing RCU read-side critical sections have completed.
 In other words, if one task\footnote{
 	Or CPU, process, thread, or whatever name you prefer.}
@@ -281,7 +281,7 @@ thus guaranteeing that \co{r2}'s final value will be zero.
 But suppose that the \co{rcu_read_unlock()} ending a given task's RCU
 read-side critical section is executed after the return from a second
 task's call to \co{synchronize_rcu()}.
-Because \co{synchronize_rcu()} cannot not return until all task have
+Because \co{synchronize_rcu()} cannot return until all task have
 exited any pre-existing RCU read-side critical sections, it must be the
 case that the second task called \co{synchronize_rcu()} before first
 task executed the matching \co{rcu_read_lock()}.
-- 
2.43.0


