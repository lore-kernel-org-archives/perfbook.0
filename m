Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7E208CA
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 01:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896788; cv=none; b=rLpemiOmXRhuNYJzB0PDlkNxM8GkL81UoO9n86RQJs2VvC6hMD9e/Bj9ig1ktlmRr+HLONIRhB/NO0y1ZVVLzGfNz14YgAtcx0GqnUbYq/7R4+JpZNW+7O2SGYQY6WWNmBCnLXN/VcVOGcO/yVu+8HonmiiWY/jV9oQ9d6nwL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896788; c=relaxed/simple;
	bh=TgfE02/euPegTZ252BzwdZLSfVaQ8+tMDP1k5FGoPyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqhrEMMkR9B+0hWBUAz6mS+OMgFLPXujJ5TvfK9XaspRZkA/apK1PQXqmPg3ReWAyFTSROTMam/g/rGf1I4Ttb/o+a/ojnr2KnUJEsuBNxD37xDgMk6KlD5XgiCWyhkP+0Pt4Vi34cGz5CUPbVJv7tY9lyeeVpj+57yT/kJkLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dotyzyFp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dotyzyFp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d3dc25b1b5so81972a91.2
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724896786; x=1725501586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lR7sKMMUzX50eDRlOTVXQEKIMWD6u084ad+zhztHbys=;
        b=dotyzyFpRMXPunhK3CmPbpt+1hzx3kPCOJCDBJO97jxuxY2OpIJIb46xuAabxLQW7V
         oA9jVxXsN6VALcx6XHGQq5tdicwKNqQfqX53+b0SRpLU49zgK/f5S0KDcQb376xKZG6a
         xLwugEAwHJAiUowHY//Mir/Y2Cj5bUzxPqXds3hIu8bvx8LLlnBo9ZjxV5af7YePRWPM
         Mc/Sww1YTGBVltGsOVPhqKTXosUFINRu1tvzkhvgdllXMsIDpVsqZwKLj1DbnM1eDxBN
         fRwruuLz5Y976i+I5PN4Rf/gk87JooiTj1q5Y1Rv2xQvlbDBmncm7ZP4wHhqVltIgrMU
         8dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724896786; x=1725501586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lR7sKMMUzX50eDRlOTVXQEKIMWD6u084ad+zhztHbys=;
        b=JPQ1wk/ptIiki3r+Ej/h7DUCr4Fz7+GP31juDwiN+rnDn4AyvoDFb3btv9HUv45nR5
         OcMXH0w2btGSKjvbrOp65C3klI/h/ESYaX0elHgxNfB3Rl/6whG2vipGnDQD59Yp0ALo
         ftbOoGYfr3Jmzj1E4uILgIQcHywKZ76PkWzEybQMjq3W2K+2S19Y/MUXw9HOrVj14s+Z
         a02RT0lUYalRo9oE/PN20Gt6bh//IERr2Kf8B0jRv+iynDunzFEBT9dKJj4XYJEnviTo
         cF/mXv/fE753kM+PTadOOnRdwpBQ/vv8zT2kuUbdZUClrjdb66LoRAj0I3OsMPZ1Wkbn
         PUmg==
X-Gm-Message-State: AOJu0YwZna7nDU8wM1bOfV3gnO78kni2fWtbowMK1w6lbgARUEk934fW
	KbRqHXk/0hjsFrRAdkJRFTHCiKNCXic+FOeK6oASBIh/LF6zP67N
X-Google-Smtp-Source: AGHT+IHbEJBYetLXkMu6BsHJeY/cc3PXUdT2ZplHhFEvelH0MJTk0MuLCEWNhdMTx+nulH9NbPf9sw==
X-Received: by 2002:a17:90b:4c4e:b0:2c9:64fb:1c7e with SMTP id 98e67ed59e1d1-2d8561b1952mr1342411a91.14.1724896785862;
        Wed, 28 Aug 2024 18:59:45 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b141fc9sm157798a91.30.2024.08.28.18.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 18:59:45 -0700 (PDT)
Message-ID: <83f8dc7b-7920-4a2f-9103-f5e9f5bf8263@gmail.com>
Date: Thu, 29 Aug 2024 10:59:44 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/5] bib/os: Add LWN's KHB article on Synthesis by
 Valerie (Feb 2008)
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/os.bib | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bib/os.bib b/bib/os.bib
index 7f608172..301c74ab 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -1016,6 +1016,15 @@ on Operating Systems Principles",
 [Viewed November 26, 2008]",
 }
 
+@unpublished{ValerieAurora2008Synthesis,
+ Author="Valerie Aurora",
+ Title="{KHB: Synthesis:} An Efficient Implementation of Fundamental Operating Systems Services",
+ month="February",
+ year="2008",
+ day="20",
+ note="\url{https://lwn.net/Articles/270081/}",
+}
+
 @article{10.1109/IPDPS.2009.5161046,
  author = {Pradipta De Vijay Mann and Umang Mittaly},
  title = {Handling OS jitter on multicore multithreaded systems},
-- 
2.34.1


