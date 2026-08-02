Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2902C11E8
	for <perfbook@vger.kernel.org>; Sun,  2 Aug 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785666872; cv=none; b=JM8x5Ioi+dHUsVhJxo2BiY9Ddg2aEmfSP2+voXcjc1C2mnA+N065vmkde5Jhj59Nm+v9hSYd2aPnRea+eVYCWytMNX3/4jDylZvTTntTkVtFy3zgLI84Nsc/ES2PnX9wDojOyAR1++UF/u2Qe2Jyj8kJzr/2FrZR9OCanhB5BkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785666872; c=relaxed/simple;
	bh=mloXKVUyzyrtcjjYMRj+UaRPqiINyy98c5JATjGAw/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOEkxWf9K2Qox7MTzrvZCJpt0wb/fK6NSjQo3QJXyO02aTJ4P6YkaONwC8P3AtEHSuU5uA9O1UkRAIoLEX4PYJ0U72ofxYrX25QZ+p8M5i9BhRs8I20S86ot3IjGQl0adUn2dViVRr5PW8W6SOuES5JpMVaZHIj5vYIFZGuLt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToafVZs0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToafVZs0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2620097a91.1
        for <perfbook@vger.kernel.org>; Sun, 02 Aug 2026 03:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785666871; x=1786271671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6CZyVDgdxbLQpBcnb6VdTnQZq8DxKFLDtg3B/7xKjU=;
        b=ToafVZs0YPFGlp6YWzpPc2a6UPCdqmdxC0PJGCg35FRcLEmBwOiCK9N5m6AhD/mHE8
         KFy6Z5rQbTxgxlnZBkWcBYzVmWyuXFQUCdRoVnCNrn2gaQEcwD5uS2NE2/SEcOfb+9kg
         YyX1tZn7SXThC111F94p882RMvCtjpr7dCBQHpxp8yZrBGr4IC0M8zDmGq9yIe2Tx98p
         eJ5BEYwRk7gO5NrDqzCgtPpC9PWzdcf10PI115KpWNaEC07RrVnzS1ZFXrMKxuynxWqg
         5ahkZtVQCS2bSbPZo9khKtgDYoERBG8Ojmwhz10gJYtD+1LkX4YyJkzLPPh0gsg2z07r
         AbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666871; x=1786271671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6CZyVDgdxbLQpBcnb6VdTnQZq8DxKFLDtg3B/7xKjU=;
        b=YtCO3tXCpY+VdJ4UZuNhBrgDxVLhWgWJUUOFmGKz18Bc9BFJZxtxb6VmPoh+1KSnwh
         paZqv5pxF/TuERiVCjaViWwi2jyih7QMKCOTJcyER03pGx17yKXYyU77v4o/372QvrAh
         UANFFf4uH46TfoLZsDFXskp7YdOEqGJe1DKIO22wD9662mA5fpI9agv0NJujoXWOoSCI
         zKhOATyFgzRO7cqNTOFhKnqc3tD+G+sHvSF4jT21ri0BUzXTGLsONYHC3SMVW7oB2/LU
         ldgUonckbixHXM4rEjB890hde37a+Lb1EmyiuMKztTnTVdtbyoLKUDArezbj3HkBE7eK
         R2HA==
X-Gm-Message-State: AOJu0YzkLF3w5ZqVQVtlwBAgf2mi33CPveV0vGomELtNkl2Tf1HIviMR
	xyw6nbRlBzIAHFUXBmtatoUNplkXNMKcIu35UOX/jU49KgeggITrh4hW
X-Gm-Gg: AR+sD12hkGS5ToHx6+ExnlP5DT/ox1FBA4ucMBG7VssVIaxT1FtOyMA6CnM6bVPIudH
	PXso5AxxyLoglj3xlCktf7BbvO6AShMokZPNloWWom1nU+RkSHK/3+NRGkoLJn73j3PFbxZ7d2p
	0W+Z8yUDIbC0fNtoIb/etIiaSpL5d1lC7n0boDitxT3h9IY+zCdBGf/vLOE7M4ynssDCl8xmsi5
	LP6lWdBZx5FGOItIzqmWfKB5CrisDBm8D4kj3DgFlrwIglGHXvMd/WgUExRFRPqjsPOjoe4VYie
	Jooa7/O6a99v0ZDd2LFJTqBt4J7uAOuw5mYEf8nmMxvepZawkFzoPGpVvZ1SlqRYDehmUCcMzNG
	reNym7nKUw151YF2Ddol+WR+HJtX7u9jhT+ts2ekE8K1W577esgNk0JD8lUHobED9C/+IIE610d
	80OXsmauoxCXPzMkZRq/0dyJAZpOuIriFZMewuR34l9FES/knQwJL4txhQR+AS018u2ilurqRQc
	dR1bWqJlZhCd53b+bhZknFgSM+EZHCcgg==
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr5625809a91.22.1785666870797;
        Sun, 02 Aug 2026 03:34:30 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b0f82csm1724419a91.2.2026.08.02.03.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:34:30 -0700 (PDT)
Message-ID: <5ae8a9a4-21aa-4714-8520-78dcbf05d41f@gmail.com>
Date: Sun, 2 Aug 2026 19:34:28 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] toosloftrade: Fix up sentence structure
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <277da031-ffc7-4b19-a632-5e3ba7d5dbec@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <277da031-ffc7-4b19-a632-5e3ba7d5dbec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed off by: Akira Yokosawa <akiyks@gmail.com>
---
I think this is what you wanted to say.

--
toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d6146b47..ce32a35f 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2243,7 +2243,7 @@ with a check, as shown on \clnrefrange{B5}{B6}.
 Although this transformation is often desirable, it could be problematic
 if the actual store was required for ordering.
 For example, if \co{do_something_with()} contained a write memory barrier
-(Linux kernel \apik{smp_wmb()}) would order the store, but not the
+(Linux kernel \apik{smp_wmb()}), it would order the store but not the
 check load.
 This situation might suggest use of \apik{smp_store_release()} over
 \apik{smp_wmb()}.
-- 
2.43.0

