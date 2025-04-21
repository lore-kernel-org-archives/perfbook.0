Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E443ABC
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229742; cv=none; b=kXtrkoQU7YZZ7UisUhcunC1V1SoZt6x49CjlgsE9ymCQI+cEv+wb3mCzKp0NDwGoQ5oVX8t7/zsQgET2iu3siRq/0nUJYhLUvR2a3cu7MObwVX7PZnZhvVE/trSuw7y/vzj4Z4JTHd9p9zaZf9NoHNOmrDOFmijTXA+x9x/SdFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229742; c=relaxed/simple;
	bh=v+G0mZdCSg09khRpcp5b66yb1CfZcLmGXWsFUXNH3t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkHApbD8RprvAZbF2xfAkPXo/6yo0Bn7AtWakx0nc+xyf837vitkmYZlSyy3YyyhkXHqvPYg8Gc03gtjxN9+O8WwQVauY9CpTuDS/1aLJStJuFE2JKODSYi9MZ4swaB+apRyXlRr0JVViWVoePNTdynTJEk9Kl4FewiIn/+n6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsHoEVZQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsHoEVZQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3026459b3a.2
        for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 03:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229740; x=1745834540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZjXACc7ZSodByOPP7bP7WQvzcnNfHXKJ/Lu08PsWEY=;
        b=hsHoEVZQqh9GLRPskLWHxZtXoYuZyzkkDP0znGWouZUwNMGCXnwjPH1ZBp7y7lwSa2
         m6W/f4n6FtaJoOXm97GnZPMSA8RQDJzd+KY8h15X5L9jwQtwzIAmOvd0uPM8LfO6JxfB
         0Y23oe2Tvnct+N701ZqNgSyX7JcUCMAxKOCv76592Xt8EPdrIK8tcVFSTsGepafD9WL5
         kHoCF/j3SYyInGte1KYsrQCkZemvTh/ZdQ894IjMkVJYrmmZaNrtBLY8DEfeF/WHlbAX
         w9bkTYDVIpcpXt3lL7gIyRsjOeDYc6wLn4kfkcaW8eip+FkCH5XmGPksI4WxySmHSqr7
         SF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229740; x=1745834540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZjXACc7ZSodByOPP7bP7WQvzcnNfHXKJ/Lu08PsWEY=;
        b=WxhXKu7hmHXEpPC4thvPn6X6QagabXzvi0ugl4JK5JnzDiw6owSEhNn1bKakUQ1vxF
         D2on/Ed+uhZd7SHJJCawaIL8mE9SpAPJCB/E9ufYsGAeMSdkO3+YmOwVqxoCsOyYJpxi
         YebTYdZAxFWyU1DEjArIIrr2uQmRsw8uuommzLTUD11FE0AHb9ZhVy7fMQthemI/dwYY
         lMl/09FCbSRd/BaqxGuPdVilNE4Y2WcuGk0LmfxLD7vmsgoTgtLW7KK5Akwl+UKDUE67
         pnRhFry1+cIIYZM6wlGrNbmbJPjLcXd2zjIKV6SKDPbHLOiEu4ioBOhXSWQPZx2Us/Lx
         Cw7w==
X-Gm-Message-State: AOJu0Ywg6fCDiv3xfVWwfSjMI1mz9Cj9oHyX/LDvnchx2LzmewB1K1sz
	KBW8bZGtuAC/DaCu6D9AAzRFLX3EXza5D/dvHaVRt224C20ijyURUokgxsir
X-Gm-Gg: ASbGncsb0518M11J4O4g2rgf7ZemUcp+dEcMaepzjvvnRX3r4HjQZ97kamIsB3PCe0f
	AI5gtc6OsZArJreCI0ndUPmXuiSwQ8eMesyjQiDtJXBOsSOcWuvw7eWRNUkmgcWEqZ5cd44RXM4
	X1gBGxzKLYma1kbKN0AARxjURleOS/xI6pBtV4WPUDC2+gljYm5NWF04pj11NqsvaHCNd4ukReo
	kX/Y/iai8jxwu41W9qHB7wdXMafZkOnNSyoQXLUwPnWA9xAp6KULIz2RTiH0OX6S+cAiM0emJWm
	uQYHGoV4fJwMd8Xu4rx8rhR8I/xQXxVLBWO8GTPMpe51ctlVuNiSqqk9AUWKpdU0FI0WaY+kAeC
	y5u806Tt+/r8=
X-Google-Smtp-Source: AGHT+IG+pPNmgciST1tFynbQ5D8DIkDdtHVYJaYHas0vktOVmuoMxM/9FFdao5IiW6xQQP/zFT55hg==
X-Received: by 2002:a05:6a00:3e28:b0:736:4bd3:ffab with SMTP id d2e1a72fcca58-73dc1591d84mr14593943b3a.17.1745229740170;
        Mon, 21 Apr 2025 03:02:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm6216997b3a.180.2025.04.21.03.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 03:02:19 -0700 (PDT)
Message-ID: <c8cfc076-3d44-4d3d-905f-5f9e972b1717@gmail.com>
Date: Mon, 21 Apr 2025 19:02:18 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 4/5] together/seqlock: Remove wrong index marker for
 "sequential consistency"
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

Commit 1efb66c2b391 ("index: Add index and acronym tags, take two")
made this "sequential consistency" be listed under "Memory consistency".
But it is nothing to do with "memory consistency".  So it should
not appear in the Index pages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/seqlock.tex | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/together/seqlock.tex b/together/seqlock.tex
index 7083e232..aa5afbab 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -132,9 +132,7 @@ notably in the dcache subsystem~\cite{NeilBrown2015RCUwalk}.
 Note that it is likely that similar schemes also work with hazard
 pointers.
 
-This approach provides
-\IXalth{sequential consistency}{sequential}{memory consistency}
-to successful readers,
+This approach provides sequential consistency to successful readers,
 each of which will either see the effects of a given update or not,
 with any partial updates resulting in a read-side retry.
 Sequential consistency is an extremely strong guarantee, incurring equally
-- 
2.43.0


