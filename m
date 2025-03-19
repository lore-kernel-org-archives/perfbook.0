Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9099253B48
	for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376962; cv=none; b=YTHhYEmdXbsgLtoqiU/47P9x4dhsZcRv4AEdmfWR09eDvHrgXxBTcFXkQa1qsFI7Yw63d8fTij4HIs3yNQ+pnBGmBcFa9GR04DqycPuXFuDeK+VSKpKqD8WFaYfl9K6LH3e2KienFVnSq4eHZo3vxMY1T/m9bOvpXQuRPsA7ipE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376962; c=relaxed/simple;
	bh=JBLs5Rij1zXpGsYKFkpwbGJ4vKKKfnWZDNc0SQnRad8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPaPx2NoHLTFKc3dWoI+V5GK3KJ2mJ1l4eLgLSLwyffBfkHqhTu/sic5fWk+i7VvXBFaDQ5baM6T+ex+Ls0PE42FV1vUWs1ykEhba5Bv460tP2VFZFkOoHhr0YvyF3Yi1PKpFwznMP35hfkC3cBdIAm61S9L8/IpBnEK7rYKTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7lwuMQh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7lwuMQh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22435603572so107826675ad.1
        for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742376960; x=1742981760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sH6iCcQFYxPcwHMkZT5HbmiBXIvL9lB1vWBDXneu+T8=;
        b=J7lwuMQhoF0Fn12PwNJiuk3V9otwGR6E3/eliXoVN/3eJ/XzACvWRWtPtPKV7fHRGV
         Z1ppDRFNDQobIaKIyuj1JtUrkGNIdgD8zxz8P9n+asmKPj6mWGtgM8+VkPk09kN+LjRz
         05WT9fSrseTYsh2VnZV8soCIbvfV1Y+i/+e3VVbZ0Lzh+8zWcSpflh/c/YLx4fEDSW7G
         7n9xjFM4/25Wkz9MaLenBNxetG18oPS3BGBYSeT3/ruVfEeQ73gWAI7SyNlx4u+9Hi1K
         ueNcq3LPf0UvrvZqyxdDFN30PowOW7zDnp6q4KXusjVbVlQS3SKRn2VpcEh0Ppk8g9xo
         Ycgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742376960; x=1742981760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sH6iCcQFYxPcwHMkZT5HbmiBXIvL9lB1vWBDXneu+T8=;
        b=JRcmD/TBrnvxSkQkh7SzeZSWZLrmZ8IS9WoBMn16DlNwqQkuVgek/yELU3qgP+/z4h
         AS2OnNVFqolBBKYCHQXoks3NPH8B20GeRne9+43TKr6QdcN1b7TMyJ2qeHkXuzLsadlM
         fACmBTjOVZVYchjS5m8+o+ac1PUEuBkW3vYe1SjNBdeucr9UXJ5dazRy4N2Y2iEk/ldC
         /P8ltJTP3mDE5filS2PVxMQ42KtOhKfyssPcmZYPegOlFGDkKrTc0a95ozaO/a2ZgWdr
         /VB8YeOVkjaQkR8jE20YnVVxvjg94uLJylhuAvzH4z2PNtg0RbqWCtGcPYdxOn31HEL+
         F6+w==
X-Gm-Message-State: AOJu0YzpfYEdZL5eP5EyOHzafPef9QeAkffRKrFdJSInX/6+oeJeRSHA
	DLC7xwoCjI2j6Gt/c0ZTfHMX4aOY+Fox8xVeTyUtEDunGOCLTxvZiQyzdQ==
X-Gm-Gg: ASbGncs4x+Qknt6fvZTSYcAixLT6RwOUyahTdPss48uwYuxxqf1fuuB1UZVG1XQycNL
	n53Bv0ou6EzX6P4YAua9xJ2j0MhdaqWHU7Az3IXV89crEKGqL4Pc1A8HkpEStJFyJ1mGBiLxM2u
	iT3DuBBP+CriluskXgmiGUj8QpSol8GuwSo2ukef7dAMzpt6RsiZSPNbJwJd8bKmPqOrkPjqaeB
	66vfVmjpmFeYUaLsjJoxvvoRPpuiVQ3p1UlhRdzPqpVv1bFIZllUGWy7CqQPS1kIlfvf/qKYvKT
	OPCAVlwFpUpklX+xqKZcniYPw7yY/I6D2pKmtxO/T8/eZmHyRNA7yIHjhBYy3hTo5o8WBHfunvM
	wXNoNDNExEP7Ad/o=
X-Google-Smtp-Source: AGHT+IGOlQps5IXQr8EoK2/i+SjmWVBJTFqRT3J4mf5xdCOalDBcl3HPbENpxGljq+sMMoTW+kgSnA==
X-Received: by 2002:a17:903:2f82:b0:224:1935:fb7e with SMTP id d9443c01a7336-2264992b853mr29703335ad.24.1742376959784;
        Wed, 19 Mar 2025 02:35:59 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe7e4sm109595795ad.189.2025.03.19.02.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 02:35:59 -0700 (PDT)
Message-ID: <ac4ab90c-8eba-4337-ab89-2364af30a6b9@gmail.com>
Date: Wed, 19 Mar 2025 18:35:56 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook v3] bib/hw.bib: Update URL info of Alpha related
 entries
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Ignacio Encinas Rubio <ignacio@iencinas.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Report from Ignacio in [1]:

  [Gha95] perfbook's link is down, it is also available here:
  https://github.com/kaitoukito/Computer-Science-Textbooks/blob/master/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf

Instead of random github repo without any LICENSE info, use a download
link at http://i.stanford.edu/.

Reported-by: Ignacio Encinas Rubio <ignacio@iencinas.com>
Link: https://lore.kernel.org/68b0a4f7-07eb-4e69-96fc-2cc4b40ad818@iencinas.com/ [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v2 -> v3:

 It turns out that I just saw an intermittent issue at
 https://www.digiater.nl/, which is working now.
 Removed the hunk on ask_the_wizard ZIP archive.

 Sorry for rapid respins.

--
 bib/hw.bib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 1a24dcaf..95c72767 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -745,9 +745,9 @@ Stanford University",
  year="1995",
  month="December",
  number="CSL-TR-95-685",
- note="Available:
-\url{https://www.hpl.hp.com/techreports/Compaq-DEC/WRL-95-9.pdf}
-[Viewed: October 11, 2004]",
+ note="URL:
+\url{http://i.stanford.edu/pub/cstr/reports/csl/tr/95/685/CSL-TR-95-685.pdf}",
+ lastchecked="March 19, 2025",
 }
 
 @unpublished{GilNeiger2000a,

base-commit: 87ebe68e3a7d2a7b0b63a7d61283e20434ea6a09
-- 
2.34.1


