Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCC6EB6D
	for <perfbook@vger.kernel.org>; Thu, 14 Mar 2024 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710417332; cv=none; b=K/7FJ5BM5ISKIqNmmgRCfoCNjHsaAFq/3O9P/2xV//5+FKQrIQ1LienCMKAq8uJ0xZgKgg3cmzr87Dsc1oLTPmEXDs95wnmP7YZGM+c7fch0KHuBZLvx9Cj4lBKNIcHTnqEZRKMkvbmAcmcOW1s9MN96dhCxyRm5Oh0dJcB9a38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710417332; c=relaxed/simple;
	bh=EWZNdpv6Saev9vULvyBwPyQXEK1nFYeXuJA88uWUxiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3a0hmi9OfOSQ2djifstwwQrVGIVrS1oJnuGu6YNSESUay49meg5TSe5Heo0j9JurquvOmSNDfpON7h1DCPyih3tVr/cRF6egcz+Y3Xf5ZpLJ2rXgVt89jdzqywsSakpacanc9LL0mUk3AXxNMB/0MD8/fZM9gjb40sPMfi3+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7OOZyks; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7OOZyks"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-22195b3a8fbso705023fac.3
        for <perfbook@vger.kernel.org>; Thu, 14 Mar 2024 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710417330; x=1711022130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqTnW2Fg7k+jOkGDaeA9wLvhgJWE/VYRHg9v8+PlbXE=;
        b=A7OOZyksUPo2msTIsJob7rQWMqLaKmr18U8Dt33gq06afrxC6RFrPuyf/8AxzkSDCx
         zYD3LuBInVSVgDqN2EUd5t+gEx4uO29HOx/MHYLEeg4hsA7gXh12TtxhkIyPYJSzD54M
         Yo9BMntiB9K8K45KMsIWRn2fOk0ctkZCfhtqE/BQrLTBPXb1Xq0f8gaw4ISNDQs7K+1x
         rioKUvMrNKBuTzRivIYAHAH0pFEBGyFYKnLvPPhLmpicj81w+Ft/V9T2i6kdAIGUqGre
         wegWONmYJ2xiPS+VLhvST/j4uWsId0imsq0XD/sJA51VyQu7pq3VoP1MWESYbpmszDMT
         6hXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710417330; x=1711022130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqTnW2Fg7k+jOkGDaeA9wLvhgJWE/VYRHg9v8+PlbXE=;
        b=Qu+/IH0zXSdl7up4LpMQyHv/SJUcDufIm7c5TUi/+YrTTWWmjLSfFVyqpVhbjbZ2g8
         j1PrBa+obmnsAHAoEoJAHUHwcpAZty9HFV/acBWPzIlxA5yLvFACCF2YGHKY3v5Isu8V
         9e0BCAaaAvuhLsdvKQ7pqpit/yjcMCEWJEKu1vG3GIaFmQG5JmnXxWoKesaUyYmhLr0C
         S6H8ZoX4YbVYqlC6whEV6HRQZoCtKgnhYeDLCGDBL9pSAVTB1/ZosmSy2aZr30brjRPf
         A2KOtLjrCA8Ec5tRXBqlxeFq15B/B301HYoB6qUXuFG03nmHGBWtfgpmCkW6Ka1gCQUY
         zjPw==
X-Forwarded-Encrypted: i=1; AJvYcCVbT0TVpPmECy6sch2/6beEiKr0nNIZEgpKG7mmPdrRBIlKfgj6KAoDLp5TVFO/v7/9gfSrpMUap6VUX0yz8JVm9lzpEdYTUs8=
X-Gm-Message-State: AOJu0YxbR0M+awrFLZanjGVbyprzIJQokpdv97SBt9s+0RU0Ak7qotLm
	WT99gtJoqz5AfiMTPbeuVjMsLAZtFuf7DDxs+x0oCh4CJ9MdQ9n/
X-Google-Smtp-Source: AGHT+IFyBija2vHmhSNxsEIg9MB69GuCS+zRp7O5QbbYmUE+gVV9E0cKli/+duz8O4i1ipfYGN2Jvg==
X-Received: by 2002:a05:6870:a994:b0:220:b771:d9b9 with SMTP id ep20-20020a056870a99400b00220b771d9b9mr1641269oab.6.1710417329940;
        Thu, 14 Mar 2024 04:55:29 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id w6-20020aa78586000000b006e6baf14752sm1285518pfn.58.2024.03.14.04.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 04:55:29 -0700 (PDT)
Message-ID: <7ffe5853-f6a9-4234-8049-8db83b28142e@gmail.com>
Date: Thu, 14 Mar 2024 20:55:30 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] Update rcu-test.dat as of Linux kernel v6.8
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <1a54e6e5-46ea-4746-a35f-196056b12404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1a54e6e5-46ea-4746-a35f-196056b12404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 4ac33da4..c0ac6fda 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -93,4 +93,6 @@ v6.0  19954 10716 30670 34.9
 ""    21087 11457 32544 35.2
 v6.4  21444 11748 33192 35.4
 ""    21530 11753 33283 35.3
-v6.6  21651 12009 33660 35.7
+""    21651 12009 33660 35.7
+""    21957 12064 34021 35.5
+v6.8  22018 12071 34089 35.4
-- 
2.34.1


