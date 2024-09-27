Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F0EEAA
	for <perfbook@vger.kernel.org>; Fri, 27 Sep 2024 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727480010; cv=none; b=XC0NXmPacbO5bHGPGVmaRt9+1theuLlF4+pYFhJKc8ENXtpzLEDhCUaayeV4AmhvQ1RErQGo1Tqb9hbbkLrkYVuE+gc9hw9SJq7YOSuzrXj3tFSZqbBPxB+hs8ZoM6jgHqPTRNEkzS1zOdMPjUmfKXodJtfMdSaX80XsbUPWakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727480010; c=relaxed/simple;
	bh=fBY17m736XsDrx821P4KGwYc9c3GCcYLFIflI/wUQgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdeRUGADhNF/v/mGq3OPpwdN4W9scovWWCXQNnc9heuUjEfOPBmYQGWO2f45idNK9lG8+wLLE5U2T2jYgr2Z6CAKpq1qHITfNclH88R1E5kaxR9pHfvmwAXHdO9MSlCINrT2AfhVFDt9ZuxZt0YULefwsAK2eSLW0zlSLDAj41c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiFMJmna; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiFMJmna"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71c5df16b10so792838b3a.0
        for <perfbook@vger.kernel.org>; Fri, 27 Sep 2024 16:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727480008; x=1728084808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qFIpX2VKaU3nyrz9bHmUG/7O+2DCsv1xtXK/FB+Lfk=;
        b=XiFMJmnagic185rnTpMlSyfs+0Ca5cXfNQKeD9AnKVDsJvw9k1FhGkWFU9AEKjAh45
         BRfhZEbv9fo8tLyGtA/x+85iM47g7E+WB0ZOr++HiDWkYKZx4rnQuw+xwNPM1a6uOXUG
         1a/q5zeVymfwpqD+rpwaIASRz5Qor+6h60ZH8f6s3/kPA5ZPSscckmUPdivOlRADoSQO
         h+cXeCN0DSv4CjpBgJBLAc2dLSbzWAOYcC7vhB91PTjR8hVGU5z7t3YdhEoUEFI31au5
         EMbpsJj+B2UWIa4EIfdIAudM2ziQgrXD0CrE0YlO6GFHbH+vlGqVJado3zEoCsiNNEg6
         SXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727480008; x=1728084808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qFIpX2VKaU3nyrz9bHmUG/7O+2DCsv1xtXK/FB+Lfk=;
        b=Gi9kErgjiKKePfamD83/JEBQTHGHQ8mit4113dybPePJ8Cxvgx63bzSlqY1N7ddF+d
         xJaYCEBGcvG85k6dPQmaAM5nv/H8V8uYCpE0qVjipjwg27HOVdaQ3Gq45NfwEu4hk3+b
         Tn2KYsWW/fgQaiu44VETphLrIu4SwfMn6m7bOkggs2ZeuVoyTJAgArvVnl4NBEvB/h66
         47rDEzenxKaod76OEJklhcu2MDd/UHNrwxeKuHZSrvK3uHUjAPwTxy4Le7GXlLsD8TqM
         2TQOK+7n+to7T/NbytCzjM0DLVgmJERU273YGINS/V0G4GxOVQ9rnlUtCH2RkZJrNdgC
         vmHA==
X-Gm-Message-State: AOJu0YyE5hZzk+tP5F6saJ8R7Wi4QvADUYChJ538cyWizAzjrXcq4IxT
	d5Qab6zIV3+YLI/XYXrMqOqGK3LFxFKKLHTKDzBb0w1U5PvT2Ffe
X-Google-Smtp-Source: AGHT+IH+46X5GY9l2+XxZd+47B1oASA8NYbOwldO4Prt7LyClaw/s2DIyMk990SvDTPmxJHpMR8MuA==
X-Received: by 2002:a05:6a00:2396:b0:717:869c:2c60 with SMTP id d2e1a72fcca58-71b2607039fmr7470884b3a.26.1727480008482;
        Fri, 27 Sep 2024 16:33:28 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652bae3sm2201326b3a.172.2024.09.27.16.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 16:33:28 -0700 (PDT)
Message-ID: <a945cd96-6be8-48d5-8b15-889abd08c6ef@gmail.com>
Date: Sat, 28 Sep 2024 08:33:25 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] CodeSamples/formal: Update rcu-test.dat for
 v6.11
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <f92aa1ae-7a8c-4b42-be76-591ea765d53d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f92aa1ae-7a8c-4b42-be76-591ea765d53d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 4a958dfc..e56d1d7c 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -97,4 +97,5 @@ v6.4  21444 11748 33192 35.4
 ""    21957 12064 34021 35.5
 v6.8  22018 12071 34089 35.4
 ""    22108 12076 34184 35.3
-v6.10 22579 12085 34664 34.9
+""    22579 12085 34664 34.9
+v6.11 22676 12095 34771 34.8
-- 
2.34.1


