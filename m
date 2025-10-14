Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E82D29C7
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 03:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411186; cv=none; b=Y4drZhcXWG86pIA66afTKS6JQKv7NkvXwW2XIqXmGVYFSxz+J2KnJ+lc2/Fnfi7b3aMk0F3LyDH/0EPKoXoidM6jXu1qua2CTTQurzVTZQwoyiptqWzebpedpr3l3eIbOZKk9tKCjtqo2CVt+/D9UsTXvAkzlShv5Fsjv9rYga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411186; c=relaxed/simple;
	bh=2Vp9eglr8lKYbrQe+k1fdsek+b5bhzy4P/Zyi2bHR7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRscN7OpBt4n9J1TB99cl+uWcPbD2RogzIBxinzAzNk+gn4tT9tuxpoL/019l4XG98LlsE59xxIRkk2cWPmlRNbWnK6HOo/eVtQ2WJVysFSUWJ3evnKoi6834PDm/ujN0X5GbzcNLppM4zzpgwMfAdngHzpWyMgn3A4LZFFwO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=empS0VNv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="empS0VNv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so4984832b3a.0
        for <perfbook@vger.kernel.org>; Mon, 13 Oct 2025 20:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760411185; x=1761015985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzMnJSnT8sRqgA23OnTGZ1aGCWV47FNReN1Hv4Mdtco=;
        b=empS0VNvbfOIVIPStAXm17u7HMvrBaWXfvyBCdlkA2Pzs7Txd2YrplJi5EtE0nkBzF
         iOMtuYRAdyM+5Cua9nEFrOyrg1NCXCBe4kQZ1tLkCWVprP8H0B4LvsdNTElULMfOzynp
         iW3uvzSGvcBQLvVeKOg8W023w56AI0pPf6YeuXRSiIrF0z3xd788y8MGT3kyD8XDoePl
         lPBUN8e16Cu74UMymPEZx/ZOH/Hyg1U4IQCZB72Wm8h1nA03M8XWhvTbdw8gFDZQYRXj
         VemZbjWsT57VqU7qtfNqpz3uLiJ0QLY3obNkFYpAMR32ODnlLHLx5IM/9sgwSFQx4CvL
         s2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411185; x=1761015985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzMnJSnT8sRqgA23OnTGZ1aGCWV47FNReN1Hv4Mdtco=;
        b=wAwIFP2BAltUChIhOdAsVGWBTteHVrlm461qM8pbw1OtnH5C1CiI30sI4da1miAOVK
         1CpOEIyCGGozznwEL2YtZCaW1gDO323NyVXowBi7uWaiYeCRQr/7r3PWkLudceEzapeH
         5+BwZ88sxxjqbJfTIPcShZXLOgbSWzTeEGoosMje7RGUVjHPloYgi2AfwxWmIs3O1cmB
         QEDpQOLlzHvgbcK4u+cQDG+fbdSZxBYgBgSBtkNxxZDK5RxJEqSA0faJ7//Y8Ice5+Y7
         SjrRUe48uj/COVbUkIoY1ISsY2zPCGA1OIQI/HGOSAXrMT0FTy3Oe3B4rPwa6tK+Zfc3
         zlpw==
X-Gm-Message-State: AOJu0YwyIOEWSnPveuYSZaq8NKVwpzMNBhXMCHCDLMndfMKWXrpq9GMs
	nFHlOhFZSmQfPfQJFnaKljn7e1cmUewcuzo/rrctWupbuuKcv5o2dBni
X-Gm-Gg: ASbGnctwv9FKTWweyeDewGw+XE0MLwyrd+hEwuSmOvJexvMMmY5CmB/b+Q/qxRbt0Eu
	fwMZPTN6OnZWdmwmDV+9uqF5YA2gW9TklvlGZ04Oh6vKJB1Gi8YXWmB29/SbEoIMXfq/nN1IrjL
	n/tvcIsKLjFdyJxDMry5bT/jy9rIhhZ26FZM3E70i0L8zwpe5Ov7BwMU2lh5JQJcoyIghtKLRQA
	mC5ADb/jSG1XMIeTTfDW6SiE6toDTx6T711+ZwsZpH2iaQxhkXqAD+IhwkXZvvNTN5iNBxqopfS
	SVT3xx65nqXbtxg6bHxmtb16I+G9RBgqTkKOrR1O3oVsKBU5ho3NNy6aje3c/IzLQ1twXm+O43E
	fxNJa1zKmfbrSKrwSx0JySPlvswqPv+0DPzhQKoYycotIr3SSeNNxiYNDXl8Ncz/9mXBR/SSJNW
	BXL6nHNsAhnLJAuQe4qqU2EQ==
X-Google-Smtp-Source: AGHT+IFy/TO8Q0cj5/KRyg6LgHEsi8XibDVCpUPgnrRxJXiJjYrbiGEkzF9X4emqpAeByzEYDm63Cg==
X-Received: by 2002:a05:6a20:6a09:b0:309:48d8:cf1d with SMTP id adf61e73a8af0-32da8f7bb52mr32549004637.18.1760411184659;
        Mon, 13 Oct 2025 20:06:24 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d61aasm13917686a91.17.2025.10.13.20.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:06:24 -0700 (PDT)
Message-ID: <c3733e7a-6604-42d4-8bb1-53785fa47e54@gmail.com>
Date: Tue, 14 Oct 2025 12:06:22 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/5] intro: Say \co{-1} for constant -1
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index fc0f97e2..4d51a965 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -1207,7 +1207,7 @@ struct htab *hash_lookup(int key);
 \end{VerbatimU}
 
 Here, \co{hash_add()} and \co{hash_del()} both return the exact number
-of elements in the hash table after the operation completes, or -1
+of elements in the hash table after the operation completes, or \co{-1}
 if the operation fails due to duplicate key or non-existent key,
 respectively.
 The \co{hash_lookup()} function takes a key and returns a pointer to
-- 
2.43.0


