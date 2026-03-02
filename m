Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF4430BA2
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443157; cv=none; b=Gp3HjeNpTFwrn/rZPjfXQBT3EZwEA0V0KPPffWMzO2uvdA6bEtuCrRRIR4CkN2D9KwxzurfQDGWx9K8uwhI1ozbhYYBi/+2op357I5aYgw8D9V9PHrcqCq8xruHq2jgf/z7/Tq/VgGM8zPeuIiXo7iHQrUZ9eSNTlGaS4ceaJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443157; c=relaxed/simple;
	bh=lfnkOwEoHCjKyMolIvpFXM43ihFE4YmPSPQqW7sMi6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFXnAuKXMTbxuevqvglYFiXLiyJkv9Ig7RQe7Ge/5qu005JVW7XNL4e7aGKXINoPA0Qt4uq0+AVTZlRRK8fwB+h6QkeNKdZS8cYoilku0LzkVNv2vq04KJc4CT/5uuB2+uas7aBR8NgQRquo9jW3hntXfVS8CHnmU/koA0lSiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rc1kHSKQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rc1kHSKQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aae4816912so28653375ad.2
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443156; x=1773047956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ayqMaIU73IUbxGRy2NYw9900Za4n/zPH5xS5lCQo50=;
        b=Rc1kHSKQyIP/kedPTPvELusNxXlZD5tQPQYrekPBqP33SCu+n2tpw0rZoZWMR7Hk1j
         lBBG6Npcbem8xgoE57SaeuQq4WWotxPipodT1cRlDpjg1TY/tXM2P2A8UQLWg3GCBXx6
         YDiOyl9NoEK1QCtZCMzdiGml1h1oTyIOMlJj4V+Qiuy3cLmw6pHR11u/Qe3xlBNS4VLg
         PTIyEuEPMevDMuTRkHu6YUc2WVm/fCRdRDMf78uocyx67SlyalLJwLm9KjO8whj94kL3
         JSUuJtSGeP7vGknQUsO5WDoix/pgYRcYuOaUFZIu3ytf0Co4u+P2RUcqeUlHCtFRG1B0
         TplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443156; x=1773047956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ayqMaIU73IUbxGRy2NYw9900Za4n/zPH5xS5lCQo50=;
        b=IVE1sARz1Tp4J1j0p/0BTX7MweVvI7ZNBH8T11vL6pGpEDf1eljerziMOavt9A/Spx
         nbg9oL264FdUwV60n77g01Jbl7qhc04/eigg34ZMKFETao7GXU1H/C1VVpCaZlwRrfN2
         3CPYbtcAsGfLiGde/lPUWdHAN/JAmu4OsQZ+SYjgHGFM17p/O0k1LyYjlU1QuC6MG+vx
         IjE2KJ/uAovAMRFrJpwW4gh/ITc+rkBq8x82U9Ty041LdNE7VOYeQMLsTDlBHS8I3pxa
         x4cyRn4JLtZu10To+x6W06iHhYEadYz6y0Kbn8K9lbhzQvltmxdmI8AlZo5XgMHkPGGc
         zBiw==
X-Gm-Message-State: AOJu0YzzLoMXp72sghappV4TTFpZXtVjLMP4R6pChB5BrVVkwsHprUbV
	r2UUkR989HgRoMLeFTjs1u6bKJr7JllBYGVRhi+/23fWObM0LFwOLZd0
X-Gm-Gg: ATEYQzzYJeGIMUUj+metJg3GQsMxSDluMZW0kmDS2qkSw6bWlvwo6ch0PwlxvKxhxsG
	hpisnemGRMAGa2O0e1NsPerXynQnhGGeWt8FT3eSRrUqWo4MMgcvIxyXwaATx3lBYDdI7obC4Tv
	UscoxYdrqQiQM7JWMK3Jx244yCHU60SqdKZiEHRHC44Gro5YW77O5i5r6VIFAyQ4gP/HubWxVvU
	x9wJGb3bTG6G01X6TS80kBRotBY/NKZEbhilskEK+nCWMbwUe5pakOIooclNvvMbX4IjQAAoasA
	6w7bOo+Ks+TDTjTZWDivpRJ//9IlrqgxZJh/8HcjBdjTmkOG9I2YR2+GX39UlRe+HdynbPKMQYS
	+gflxbC7vAa4yRJ4ChckTEtTYEK8V/zAzsMoS9jTXWPM7EGp1dWEly8D4rfqN2f8z6FSX+fLkWE
	BNNNK4tQdkCub+o+Zgrb3VHsNzRhvqcMHhdbOhn6f0EXwExH1g7YJBGtwf4P9xswOIdhyf3IBrY
	ctmmTo=
X-Received: by 2002:a17:902:c947:b0:2ae:489b:496e with SMTP id d9443c01a7336-2ae489b4c87mr39891165ad.27.1772443156064;
        Mon, 02 Mar 2026 01:19:16 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f9c2sm137537715ad.51.2026.03.02.01.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:19:15 -0800 (PST)
Message-ID: <a0fd13bd-db34-4248-a319-764c55677d40@gmail.com>
Date: Mon, 2 Mar 2026 18:19:17 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/7] formal: rcu-test-ratio: Adjust legends'
 position
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Legends at the top center of the chart are getting closer to the
"% test" line.

Move them to the left and add a box surrounding them to prevent them
from interfering with the chart.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/plot.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/plot.sh b/CodeSamples/formal/data/plot.sh
index 93b13494..c8661284 100644
--- a/CodeSamples/formal/data/plot.sh
+++ b/CodeSamples/formal/data/plot.sh
@@ -22,7 +22,8 @@ set y2range [0:50]
 set style data histogram
 set style histogram rowstacked
 set style fill solid 0.7 noborder
-set key top center
+#set key top center
+set key at 50,39000 box 3
 # Set linestyle 1
 set style line 1 \
     linetype 1 linewidth 0.5 \
-- 
2.43.0


