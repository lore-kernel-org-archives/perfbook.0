Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449925634
	for <perfbook@vger.kernel.org>; Tue, 27 Aug 2024 04:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724734260; cv=none; b=mIYIocgTbgSH9nbhbu8SRjoNywVeSXXcf9bq8nbRPFhiwOTARaDOHEX0pTe20K7BEhP8F8I+trUijVqkYcHh7muEv+WYy1C71vACVGYnwoHSZNLKDqovNAP3tdqX9Oc9/G/AmSxCC9fmhC/AbvlrzghnKeCxoR/7sPd6uRu/YCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724734260; c=relaxed/simple;
	bh=or6Yakj/3REliTcXUMvydE/OWr6NIvExDmPwlm8aoRc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Wymlw/4kchcGCXaApZKtRZNHp0pY/vW8VH08jwetEq43yNXCPzL9E7zycrdPsOUPLUBQnxV/Gp2YBUd4miHsQ/4fN1sgTz2ry9plVxxtB8KWU8B7gXMNj7RV/XAh3HVpQNXdR3aXBLN3xG/BJW7ZIwIfl7+HrNIInj3UFZh8t/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEszZx9h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEszZx9h"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71423273c62so3638809b3a.0
        for <perfbook@vger.kernel.org>; Mon, 26 Aug 2024 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724734258; x=1725339058; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W+GOKbHWZqnqYXmSQPJNoeMGRVpWlt5ukgvhAoZBvw=;
        b=XEszZx9huYt9VZ4fNpfip1THZ5jahUYvi9RPs1Tgit98HIE8lvjCw8CGLFKLCTArBi
         4bz57B3a15/nLPWE4GWsxMGJdRc4Oz9xWACtAec3jC67ApK4JUMlTXpmm4vkrnqThJ06
         Ah8Ho9CRBC8qh8cJ08ggbzSMahR5zCmb0RnK0Kf5zrPlah0wp/Q0xuC+U3dRMe9/BDkJ
         nNbpzmF1cSjOyWdLROH4SlerKH40m2HZoX5DqXGL+h1uFEswcxrf6yDWeyzL+GSlWhN9
         1dZiep2+XVC6i0lnracQK62tAadITKfIxQk+8NIYV7/ctURGdpd4n/EnRJYrzZRIWrIu
         OufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724734258; x=1725339058;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7W+GOKbHWZqnqYXmSQPJNoeMGRVpWlt5ukgvhAoZBvw=;
        b=tUfyqnCh2j1sgcmFw4Vtng35j+/AGm9PNMOkah1zRxe7pHZWylehBL7Ld9J5Zq1ckv
         j2ZNslSKyj63/9MXMdI0uQJNQ6mtF+bMCN7CFuNMHogNNxc4wgnHoppd+LP9/Hmz8i6j
         Lloj0A0eJQqgwWvkcDCO6aT4fJVX6eSbhMXj+OC4J6UtFcn7uVJ3IRF9bLHQqhastWlu
         oMhfmHrIIOtItKi2rvzMWLVXUn1Lc7ILlLOIE1RLjl7+vFULRuNt3JbzWKjwDUGTciaT
         lvORF37EQ2j4M2JPrcSoOE1phyOSyW3mwDSicPv3XoefutwUPrf8oz9KUJ16sj9klMIo
         Tbcg==
X-Gm-Message-State: AOJu0YxCNRhWj+4vIa+j1z4XLzdl4Zg4ZZ0cVA7IS/Pd24qbLAH4DmXH
	b4ppKlUrgCP1p/1A8KFczGn8P6IAscibX5Vi8VB9Y+inFU1wArsk
X-Google-Smtp-Source: AGHT+IF0kkOniaR4W8/5pcnDoRedz7eUiPSu9QHjxems4IKZgUWrsVo1/m8p8tGgd1A0wPT5tFFJ6g==
X-Received: by 2002:a05:6a21:1192:b0:1c2:8efc:88e9 with SMTP id adf61e73a8af0-1cc8b58f912mr10969209637.40.1724734258023;
        Mon, 26 Aug 2024 21:50:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385609099sm75002905ad.192.2024.08.26.21.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:50:57 -0700 (PDT)
Message-ID: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>
Date: Tue, 27 Aug 2024 13:50:56 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: New Figure 3.13 is too tall in -eb size builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Leo's latest CI build of perfbook-eb.pdf failed as you can see at:

    https://gitlab.com/linux-kernel/perfbook/-/jobs/7668105673

This is because the new Figure 3.13, or cpu/SimpleWrite.svg, is
optimized for -2c builds and too tall for -eb size.

A quick fix would be to shrink the figure for -eb builds,
but that would result in a small diagram hard to read.

Also, the new figure is not yet mentioned in the text.

Furthermore, the corresponding enum list talks about
CPU 0 doing a store, whose cache line is transferred from
CPU 7's cache, while the figure presents a cache line transfer
between CPU 1 and CPU 6.

My guess is you are planning to adjust either of the list or the
figure.

Tweaking the width of the figure can wait a while. I suppose.

        Thanks, Akira
