Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59952F5A0B
	for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975784; cv=none; b=g9PM9iQuI9MFSHZrNT0+IJA/SZm9WmZRx/YNz0G/1x+1KaAxKfnCvTecZWFVNKCl94MsA/8JeT1Dl1OUD8Wyg1CT8v8ue7G6jWeOdIpnoaxajCE1VDQsh8UKTmwUTTz8/iX2WXtarzJ9PDsuZOyKeUJymLWEGLTiu/RqcrzWz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975784; c=relaxed/simple;
	bh=LTWF9bWYM63paQctKYcNo30DOZt3A8z+ME9j87cqg+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiE4LlryzZUSAEJbWR2LWiczj/UWYdfXtPS8HDf7zOcrhrjou5VqiAsoCkwxjGVbFwefX90FAfdtjrNlOtwc279fRNe0Q3Ui0CbRUPsc4uTLbh4zHbIdyvqLtNP8vm694n8dZszmMOE2+HFV4+wgRPpl7tWRpyCmaPCY1YQ8Pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0sjvxu8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0sjvxu8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-298144fb9bcso44208805ad.0
        for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763975782; x=1764580582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMtqSrITwuOfDm4jdF21kZRA816ZlvGbONBDBXuTcvE=;
        b=C0sjvxu8b1pUaMcU0Z3k6iws4B7GOroAQ+F4mVbj8lCcZ+LMOlg6V+thD1WtZ4HBxK
         9ooJHsWSNKSaZUZoWvXwawSwf7ycc0aY9M1gMlHm6QIXFsZEqS1d5dIdAjPkFg2ml454
         0zouyNMDEm6DLt+mLCYjgEj/Yh+MFK11LkYCW5PLYbKFnuzGuoTvAp1/Ep3vQMzP3x21
         W+mXhg8IIzrRTM4DpQnyarHbT50d+L6CdQzj/pGnPnGQsHTb+7hT2eppdETDjKzNdvpN
         yeKejNliO58okpt9Btp8RptOLfXitmX/U/od7zqXltmjnZkU1BDet+LV+cg2yQoRE92G
         6egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975782; x=1764580582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMtqSrITwuOfDm4jdF21kZRA816ZlvGbONBDBXuTcvE=;
        b=HzpKbF1ER0Ao26vlMFHAyIiC7yduNnC4bQADOFd/8Vfd4zBR+jd+XnT5xWuoYiDRqH
         wl1VV606eqKlfOKej05yE8YXsgg2dkpbpk6t8drF6cHH9HtSTMu4/eukCSi9LYqwGMDn
         MNGaYNIya1IFqQo6A6XH5vylpey7hu+Hdd/wvyNMpKQY8bMGBQoDl0MWn4X2sqMmMfq6
         z//8PkNtHR2QzrN4SsIE8WsJWlYmOpcmfQp07vgNfYV+zZb1XCN9DdDwmCrW5JDK7pQ/
         rrdrt+Pjx/dN9dtlBbZLkfh+i1H//QpRaa2fVGBzqQ+CC3d7n7lH5Wuh5kk+6mVVn3G+
         Vkog==
X-Gm-Message-State: AOJu0YyDKjP/aEM3DGLPKmIn5ToF8uCUFAFGc32TAhkRO2XpGEEPCIcC
	soK1fvsDnmiR7A7TG73ze60MvHrDNHyFK63OLA2ATMzF2z8+zBZLC5V4aGtTxA==
X-Gm-Gg: ASbGncvEcguQ+0Zsg++qJnp2cVfk+rItnTcIsNYIKe80fSKFTBchYgzIoU1DKKXGrAH
	NybmlRqsx21n31BRROC3PDO6otJA/1pmnss1r+6TcgwdvE+kPkxNHvMyXfVHOQpn5U4w7oGEISj
	2+ioJJ2Re0IBgiqIcTTgmq5vrOV/tmxAPlU3EbDvnmjPzFxuC6i7oMkvPofoXXB6UqJu7jgDLm9
	qqyefPp+c4O8B0LWcFMHqGck7zNUvxi4ZhyM5m6DSjxRYECGla7NAaBQ7Tt1lUwYIlQUEXynmMa
	wC+0fOjrssL/6dnmBAsNgEcdJrlAYJVJ/dnwKO8b5EvmQ/iErj6TcFLXGyAihnavElhXvP/4bZx
	iQN4aWXNjJ5oVmZjZF4fhvjcUpcUp/NbjCM4Nrc7BI7Ro0dX8lCLBe6rqTLUOeB1pVqbDElNWcz
	Bso+RPW7PwMURCmY9OxQyYU1nEoIGZOl1V8h5rDjSXc7cS3tyYCnIOkroE
X-Google-Smtp-Source: AGHT+IGlkYzIDhrB9aSAp6oJjzJSV72IM+XT7FzBziMlROq2TSH/0ZtMSTgtx0qGSjwKaIqkJI9TzQ==
X-Received: by 2002:a17:902:c949:b0:299:e041:ecf6 with SMTP id d9443c01a7336-29b6bf5f087mr114873165ad.40.1763975781886;
        Mon, 24 Nov 2025 01:16:21 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1584c7sm128191405ad.44.2025.11.24.01.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:16:21 -0800 (PST)
Message-ID: <85114b57-7716-4487-985d-eebb344ab174@gmail.com>
Date: Mon, 24 Nov 2025 18:16:20 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/3] CodeSamples/.../herd/Makefile: Add
 klitmus7-ready tests
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While here, fold the long list as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 069f77ea..257ee556 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -49,7 +49,15 @@ ABSPERF_SHORT  := $(filter-out $(ABSPERF_LONG),$(ABSPERF_TEST))
 ABSPERF_OUT    = absperf.out absperf-all.out
 HERD7_TEST     := $(filter-out $(ABSPERF_TEST),$(HERD7_LITMUS))
 HERD7_OUT      := $(HERD7_TEST:%.litmus=%.out)
-KLITMUS_READY = C-Lock1 C-Lock2 C-RCU-remove C-RomanPenyaev-list-rcu-rr C-SB+o-rcusync-o+rl-o-o-rul
+KLITMUS_READY = \
+    C-Lock1 C-Lock2 \
+    C-RCU-remove C-RomanPenyaev-list-rcu-rr \
+    C-SB+o-rcusync-o+rl-o-o-rul \
+    C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul \
+    C-MP+o-o-rcusync-o+o-o-rcusync-o+rl-o-o-rul \
+    C-double-check-cas-2 \
+    C-double-check-rcu-2 C-double-check-rcu-3 C-double-check-rcu-4
+
 KLITMUS_TEST   := $(addsuffix .litmus,$(KLITMUS_READY))
 
 .PHONY: all clean litmus2herd run-herd7 run-absperf run-absperf-all cross-klitmus
-- 
2.43.0


