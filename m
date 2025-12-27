Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEAE26CE33
	for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766824887; cv=none; b=fheXtmOwJdi61kHBTDNPBloGCZ6kzQipfXLUvyU0dNUZW8if9nTXS7ccOHvH3FOf0nwmNWuMEcsUMbW0qDv93gCxeDa1yp/7T2R3zqb7K6h73FbtRJVf9VfoTQcHeSx26mh+rKYEY6beMW9uW3FCM13OXXzLOIlgFhbzcnbPCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766824887; c=relaxed/simple;
	bh=4shoBaK9LMBE9pmfapXmakjNtqWCRB07SElMohwFT44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XM3G1v1993arPnpkO0wnUFI31m230DN6/IsL6jaLgVtOt5O8CUdHmWMSxh/PhHxgY9QmNLYDSFP+peKtQRIaGP5ASuacD5v6pKl5c2aj3beDfGFbJGV7erWGSu0Plkkv4NbAf3a5ua0KRlQuY63JMezl2QKa99JFz6WIVjG1YlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8PNFkG1; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8PNFkG1"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so6733976b3a.3
        for <perfbook@vger.kernel.org>; Sat, 27 Dec 2025 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766824885; x=1767429685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhQ3TZ4Eb8r2lHnueRXYlwNWe4IC3X0PxzY6Fp7BPMQ=;
        b=f8PNFkG1a+eAOAqZPyaNhfyjhkbgHbimzOY+7p0SmgkKVqwoNwsWTHHQapzSZuZest
         1OV5Wz0teFUbVG4ISr8/YQzxbyebkmO5AyZUnTxxgbLd83IEFsq7/w1RHVmCgV2no5KP
         LgJmojPEcHQIGY/9DU+EUtBrmqmojO5TSDNCOXJJCJZKgHXSmNO/BFAV7YMm4EDPHRsd
         u/bnYxq/LsT0eWmitmFA1dDypCGyvMBV1TxxgDPGpKaepzrm+rG8eyL/MTjFUNmkrfYh
         P02Jw/Aj9ze1jqFWj71WqrZSX6616B26RFEsDUI6MAbs4uykxtv4YrHXVkGlgUy5sFvq
         Xl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766824885; x=1767429685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhQ3TZ4Eb8r2lHnueRXYlwNWe4IC3X0PxzY6Fp7BPMQ=;
        b=UuTyOP7a0TEIP87tCJVQEkya9jrR7PX+bsyArC595sfmoaUv5aztQufXyE1au8Jp/t
         ZdnkMIfnrK8c7DwF3t3iW+IEp8tDqyD7mO/bJyU9Obhak33WyHUPS7H/iAkpAAthsHc1
         9I53o/EF3u5GfoK0PzS1zcSkr0DVDC4t7YGb0MeRX3hckzvb3ksbUBUifxBrBAlHKDNs
         ColP0sE9LOEzBj8nCjfKEsHRcDbOlnmevxFQsffKbkDjGvyK/zR6yteh0V2mr+3v2tTx
         oW+n/cuZjbAZ0EQOPq07a+XlfsNifIyJ/PnnKYLN2wVIJgX3Duz9/9SVYoaD/L/4lgXI
         wdOg==
X-Gm-Message-State: AOJu0Yy5eQQgwjpcrpm/e1CDdzLz1OBpxIzXboGaTRslV5kea0WUhlyR
	GVOBjdCX+gjqNQ6KdO90X3NDGb06nonb3VFm/3K9s7SvX3alpNNCvM3cPlNB9bst
X-Gm-Gg: AY/fxX7k4XxfaOkxiEmvOLuE0Lkx5ajXz+XuMFGEUNufumaSdyTGVgsmiIsxV8hEB5j
	1pvxpLBmxEkiTo0IIsCbpLAFGpG+HXarVGeASrbf4QW4sHcMrybkzwgFAgod2q65QATUjx8pZvT
	IyfUpzYzzHOpDFX5uf/nvQdUlBDJL8/vQlEg75heYkqgMitHJ3AxX/19jTlWb+VNqP41k98LJqF
	hLX+vmqvK3CSBqYM4GU6OOPf7k0oP2uuw46yzTbx51wsMF4a1Qb7Lx3ar2OMKoevbw4XP5JGWsd
	4qrgXwJGhIJKEsM6TLWmGAjEIQxLMR28T9TE1/NnjJiDZ51bQGSm5lCQjXE7fpNWOMxEbXs2J+S
	6ePMqJreWUi0M+IQ7RdOl+ct3krOFzIQ1HmsgMa5a5PS8EdHlq4hR7I/DIhO5a8iEy+Php6ac6q
	+gpKdYbscL/fRQ+DLbkkq9diopwDmwp/4NwOin4ClFZXzZeEmmuS25gOLF
X-Google-Smtp-Source: AGHT+IGAn5ugDC3JpAd9nR6/tbpvOjhwPgQ07CU6WZsqeLcXiTiNvMe2k9UfYeQ7nohRUdVTEmmadg==
X-Received: by 2002:a05:6a20:244e:b0:366:14b2:313 with SMTP id adf61e73a8af0-376aa1ef20amr23838719637.70.1766824885316;
        Sat, 27 Dec 2025 00:41:25 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b06besm22278259a91.5.2025.12.27.00.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 00:41:25 -0800 (PST)
Message-ID: <bfc37f7b-1539-4c85-bbc0-accda1ca4432@gmail.com>
Date: Sat, 27 Dec 2025 17:41:23 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/5] CodeSamples/formal/herd/Makefile: Add
 KLITMUS7_EXTRAOPTS variable
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <43d0a319-a3c7-4b91-88b3-d8f029019d9f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

klitmus tests involving RCU, expecially with unconditional
rcu_synchronize(), tend to take much longer these days even with the
default "-expedited true" klitmus7 option.
Remove explicit "-rcu yes" from klitmus7's command arg and add a
variable KLITMUS7_EXTRAOPTS so that those tests can be added by saying:

    make KLITMUS7_EXTRAOPTS='-rcu yes' cross-klitmus7

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 959b8ed7..ba023d0d 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -114,7 +114,7 @@ cross-klitmus: klitmus.tar
 
 klitmus.tar: litmus2herd $(KLITMUS_TEST)
 	mkdir -p klitmus
-	klitmus7 -rcu yes -o klitmus $(LITMUS7_HERD_TEST) $(KLITMUS_TEST)
+	klitmus7 -o klitmus $(KLITMUS7_EXTRAOPTS) $(LITMUS7_HERD_TEST) $(KLITMUS_TEST)
 	tar cf klitmus.tar ./klitmus
 
 help:
@@ -124,6 +124,7 @@ help:
 	@echo "Other targets:"
 	@echo "    run-herd7:       Examine transformed litmus tests by herd7 with LKMM"
 	@echo "    cross-klitmus7:  Cross-compile transformed litmus tests by klitmus7"
+	@echo "        Say \"make KLITMUS7_EXTRAOPTS='-rcu yes' cross-klitmus7\" to include RCU tests."
 	@echo "    run-absperf:     Run memory model benchmark tests of absperf"
 	@echo "    run-absperf-all: Run all absperf tests (including those take quite a while)"
 	@echo "    run-dblcheck4:   Run C-double-check-rcu-4 (takes 20 mins or so)"
-- 
2.43.0


