Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085D13C807
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075555; cv=none; b=aytv06Y8oR4hm7LAp+fSSRxhRzh6ay8cwdcq3pJqmBMe3j69a7toXob2GP0OY9v3wTEOXneVMqXYjDBYjUbd5rhnfRBGAL1VMXLmOiKeVE/RIu8X1iJk7fK6/QpLBVXDwSQAXO28v/7OKZzZGClBIE9NxBJEtgnNHkwjhJmFHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075555; c=relaxed/simple;
	bh=GRCI4hRtLra2398w2Hh9tiwRDIbD7FQFL+7nCOt3Yhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVsa04x+YN5ck3fAiHpaWOAeTL5OOPVFL3Oh4HGpiDCnKwgLIts9s/oXpDJUvWo/vthIOJJO/vLowuNmPHKheCF8+0SnnrDbeCuFMQK3HrMXHCPIF7tuGjx4PVXgb7JqIhj+h56rPqDU9yxDvVD4Fq2peJ82YzoDB0V0CJkYpWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RArtVigz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RArtVigz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2161eb95317so196681325ad.1
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075553; x=1736680353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldDYxl252SvQv6XTFXDJHW+yklF2g43YgLC16/ZHSrs=;
        b=RArtVigzJG/ARW3smPXYIU6ZTChONE2B/qbUy30Zjpt7opnTZEfdJi8878HECMBXPi
         kd22o87wrNvs2sWQJIbSavXz/S8M4Apxz/S3/82j4HMHH6z+VccxKt068GNhHw2eLw9Q
         rR5f/PDauuGqPhZCXmCjHDoMZhSrMxh7qWabmEH2cSaPXEBswogfT/wDv/Uj0Ck4e7FM
         OO1U+RC4vMYYLwvt4eugddpSES0PmFpbCktotJpAQYt31DPSjvdcBJpLRhYZFq5bjZG6
         PB7k93fzAOicMr/Rc1yf9A0N6puJez1XfWX+uHpRg0xy9PwIndNOalQoD0vUedy2/z9S
         q9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075553; x=1736680353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldDYxl252SvQv6XTFXDJHW+yklF2g43YgLC16/ZHSrs=;
        b=IA/ETfQX2Sn1RcXDFARg2Y3DE+PkB3nOMCPhvecoKDVPQs1Kle+mt42WYFBhbKiU/R
         YierZLuuO/4K7JVm3WRDtStNBgKfJk89MU8vKGF8wRGOBhGJOq61sS71l9J9nI3EwQxZ
         nMhMRUjArQkd3FzFvJEepLNVWFdBopYfr1QeN+/V/BAxnQ8lVVWLeH6MJAOdx7loh7/l
         9FfKP2u7FSrNF0UFqFfGkDHoZ7RLlHITXiq2wQ4a/nOzOJOb0ej5SxDktBG2c2PwCvu1
         j7eAVTOf+QcuXy3BeUWVZ7CoiDIY7QwghIQlb+o2xwDALDy2Nqp5hTSlMb8Aj3GY1KDc
         Y+zg==
X-Gm-Message-State: AOJu0Yy5adhjnSzOX4Jm5rlk9Gpllw9dILpt2I3VNY30nxKsHuIXZ606
	exMRTrWsVhQIfsGdX73eliYJEqksAQ2wGSJgxhI08vcK5lsNcDVknIMuSg==
X-Gm-Gg: ASbGnctYOfqKBo/HJS4/Z8udY1glqEvEgsY1tRL1k9HeFyxpYZ7NwRhYg+TtAnEi188
	6P5anZyyV1SPm1UTQP4htcK/E/5Ez9CxL1jwUsGE7c6v8hkiHEXOa1R6mkoOqZ4rhf2nrfR6RFX
	r2L3u0n0phEGCYIEN5+DFJIGQglo0VMJ0QHFGJFr0Gj8q4gr+XQjneZwxNhucrjeRTT7YE+isJv
	Kht8IwDU4w5sxmkrinIGZAD2P++QZPtRbc1JET6Zm0VvS2cVKCrB11cA8zd5/Xh94Dmg5sLZ/mS
	2FMsiUz0hPVR/iBXtKC7ASc=
X-Google-Smtp-Source: AGHT+IFjtzbu4rl2kHlAHCAmK2nFKGiLDY07zrgQfa1JIfL9steZVOZFvi/narBQwwxouH2yS0Mmrg==
X-Received: by 2002:a05:6a20:9191:b0:1e1:b60c:5bdb with SMTP id adf61e73a8af0-1e5e049f2d1mr86817150637.26.1736075553130;
        Sun, 05 Jan 2025 03:12:33 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b1ce01b8sm22931064a12.20.2025.01.05.03.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:12:32 -0800 (PST)
Message-ID: <866ed90d-da73-4e40-ba04-b6cac4e93725@gmail.com>
Date: Sun, 5 Jan 2025 20:12:32 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/6] CodeSamples/advsync: Add explicit type cast in
 xchg()
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Building with CLANG, you'll see a couple of warnings while building
under CodeSamples/ as follows:

    cc -g -O3 -Wall -o q -DTEST q.c -lpthread
    q.c:39:12: warning: incompatible pointer types passing 'struct el *'
      to parameter of type 'struct el **'; take the address with &
      [-Wincompatible-pointer-types]
            oldtail = xchg(&q->tail, p);
                      ^~~~~~~~~~~~~~~~~
    ./../api.h:778:49: note: expanded from macro 'xchg'
                                                 ^~~
    1 warning generated.

and:

    cc -g -O3 -Wall -o wfenqueue -DTEST wfenqueue.c -lpthread
    wfenqueue.c:38:9: warning: incompatible pointer types passing
      'struct el *' to parameter of type 'struct el **'; take the
      address with & [-Wincompatible-pointer-types]
            tail = xchg(&qp->tail, ep);
                   ^~~~~~~~~~~~~~~~~~~
    ./../api.h:778:49: note: expanded from macro 'xchg'
                                                 ^~~
    1 warning generated.

This is due to indirection-level mismatch in the argument of xchg().
Add explicit cast and silence those warnings.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/q.c         | 2 +-
 CodeSamples/advsync/wfenqueue.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/advsync/q.c b/CodeSamples/advsync/q.c
index 4198b3c8..8997a460 100644
--- a/CodeSamples/advsync/q.c
+++ b/CodeSamples/advsync/q.c
@@ -36,7 +36,7 @@ int q_push(struct el *p, struct queue *q)
 	struct el **oldtail;
 
 	p->next = NULL;
-	oldtail = xchg(&q->tail, p);
+	oldtail = xchg(&q->tail, (struct el **)p);
 	*oldtail = p;
 	return 1;
 }
diff --git a/CodeSamples/advsync/wfenqueue.c b/CodeSamples/advsync/wfenqueue.c
index fed8d87b..9970b075 100644
--- a/CodeSamples/advsync/wfenqueue.c
+++ b/CodeSamples/advsync/wfenqueue.c
@@ -35,7 +35,7 @@ int q_push(struct el *ep, struct queue *qp)
 	struct el **tail;
 
 	ep->next = NULL;
-	tail = xchg(&qp->tail, ep);
+	tail = xchg(&qp->tail, (struct el **)ep);
 	*tail = ep;
 	return 1;
 }
-- 
2.34.1


