Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA951E5B73
	for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766825437; cv=none; b=JO4g7rL1VLuiPxY80NM/ten/9FKqYr97xl8WnpT7Xv0uvS9ECvpEDwHQsn51vpb9NMvmA3bDF0R467Hb5pkW5gH/iMGR8LlOG1tDB/hZjw6rNREP4/hg/e0HdFAnx+if7x0FIYNVJwfuTgC9H5cC9VfLfgEwxi6maoiG41UhBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766825437; c=relaxed/simple;
	bh=/Ws6WbyP9gu3Gmplil7rl/keoiHbfLSxJDTDeHh+I+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFpfX2VQEAiSJSiCaUOpPFcWWeDa+mq93g2JFB4JEE/BobC9HHxRsj+eK8zGVTXRfF2Mi1P1NY/Cc8sNxzrWKT+w2/VsjGXu9Cw5i67sHAcWTU43JpW89hCp4nCeSfimfpVWM3ce8DLsqvjCEKu80vpJfTP3vjsJ4IYaP3UhHi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nf1OZMq0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nf1OZMq0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c27d14559so6071866a91.2
        for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 00:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766825436; x=1767430236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ctlulie+JbXWZs6oIm+GFLRTXyaLHgmI8WVDkPV/lI0=;
        b=nf1OZMq0Tp0+VC4vmkaW0fTZBznof04+O7EZWE04noIUTDx2JetQCyMENByT/1yS1t
         Zu8Ulod2vlZxvtvFi48wFJAcmcAei5GLOpXxk3ell9veLhj0NeinIcA1ejzJm2xXd/to
         yTs/51K3A4kCoKDcFfvRzoZUShaQBotkIEn1Wiz8Lxr36RghgM9bGk74jYmDO5/oTTZR
         GGrvj8YS6GSYn0eIQWnUInTzuDfLWk/3ITac8342SEkbhhEDfIN7rjScNDxc638M0L0Z
         IFbASvWRjTM7il/dzAEJO5eJ7yg62RBOkRkaHzNQXxMWVmBgDKYDk481BUcCzawcBU+3
         x7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766825436; x=1767430236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctlulie+JbXWZs6oIm+GFLRTXyaLHgmI8WVDkPV/lI0=;
        b=AHccn2Dh6x0ziiU3X3NHkO5nIwIkuuDk4PqrYqB822jaKtvD7Xo/9KC9NprDpk7ZZs
         YBBi3P8CNdaLgADAm61SQ0WCBRE59VV1ZRkywdhcFlfJfRj978ds9fLQNsqZpoVmH8Kv
         bGf0b8jdtler2fVtdJbfpC8slaHjePWVF6+MKpH4v7hrZRlDr7463GhjdZSo4hQLa20e
         Z8UDtAXfS2F5UKGltVA5IKNxwoSEQFxFXuOqcHwcps70C6TjWYEzXDcIgwnxUzOFPmNM
         3YweLLfIyLnu5bFvDEEu5ukGqGEer8txp6FOaqFGb6/YNwsamz8+CJGDlj8sCVEYUpNb
         msBA==
X-Gm-Message-State: AOJu0YwYfprsaGEuoWbgpwfdy9Y7b0AE+3vFBj/PgziT1SbN0eB5NowR
	dIdWv1Hbv6fZFGhS5vSXi/zx5eEa8/zvj/Thnig717HPhQNfpH/dxKeD
X-Gm-Gg: AY/fxX4YadNrqB3EmGEcb1oYfftwIoTfxZb+r5Kr/x/kIVVAsRYNoI+l56P59nh3l1c
	vulZcKy2FJYDZMbPd1G7F65BtO3mK4+MdFvUqQu+/EFnHwqiS+aQQNIhkzNi3CE0y3xEev/KhsV
	jcZyk1LcUhpqO0EtisZeee1ScSktpaoKRD/WuZfy77Bu1CHnaqxSHZr7Vj0XqhrGc74HqZKW5oa
	2QmTZwqlZh3BK35AIqt+6woO3pBJ2Hn/giYEWWfg8v0V5deNzE+RG6ApsrpRt5s84BUFF6jyK4S
	OgvCpGPvEPZ+PW/95FPb5Jx0JnVqCw6YRInDkZ6ybisTcjLEutVLQH+P4hQtCOal8snkV8s4aJd
	ZrGuDqkSEL2Nb5JYYjfNN/Nw2YThXSptPMZiu6kLElfHFsuY1uVxfaXoQkHDac1sPGePVYi/tWL
	Twk5lzubR4HbgR4pfea5RJEeUhizZdIyMrsQZuTDixjJdfnfgefOii6mFO
X-Google-Smtp-Source: AGHT+IF83w1TCUow7P1qcr/pXNa8yuU+TS2cyA9A8tTXLJCbYD1PwNMll2a6lpPU5ITs4wTDHIrpTw==
X-Received: by 2002:a17:90b:5610:b0:34c:7182:cf9d with SMTP id 98e67ed59e1d1-34e921c7373mr20389814a91.25.1766825435636;
        Sat, 27 Dec 2025 00:50:35 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a164d0sm20755932a12.10.2025.12.27.00.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 00:50:35 -0800 (PST)
Message-ID: <7374a013-df0f-4368-8e66-8a650cc732fc@gmail.com>
Date: Sat, 27 Dec 2025 17:50:34 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/5] toyrcu: Replace \co{} with \cref{}
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Trivial typo fix.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index cfd6fcb6..e19b2408 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -861,7 +861,7 @@ grace periods, preventing grace-period sharing.
 
 Fourth, the need to consult \co{rcu_idx} slows readers slightly compared
 to the implementation presented in
-\co{sec:app:toyrcu:Scalable Single-Counter RCU}.
+\cref{sec:app:toyrcu:Scalable Single-Counter RCU}.
 
 Finally, as noted in the text, the need for per-thread variables
 and for enumerating threads may be problematic in some software
-- 
2.43.0


