Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A0E1E990E
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411033; cv=none; b=Stty0PAqKPVYbluzUyTK/njaTcP/Ot8JLyFJ75SD2Fmb2VqVbN8y5XiVsiaXtxgjN4l3XAAKhs0J9uV5DphSHn1cHTD9d8ubYYdHaDNJRiq8AzZROUnzE+Zp2U8CRC761fN9FdHQ+JDPyiPuSJr1oJf9qbGFP5F0DObifR3hhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411033; c=relaxed/simple;
	bh=FGwbr2jSP/wzwbYIJy0PuzF0h9Oq8Me+3ttJxAenDGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bu9ZcIhGKCe86EfsmaWr5ceXM0VRM2aR44UO5WzXNCKgu3FNPtOQZR+guXiTy50/Yb1ku9MljfMQiKPbNGT84/G+BlkN+A5YDNFBxreLx0OVoljAHFPjzFo4KkUig8WA7Iy1Ho0FapKHNJAfhWa2sfJSKcnqkxM5kX+630WrsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za2uce6W; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za2uce6W"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so4308616b3a.1
        for <perfbook@vger.kernel.org>; Mon, 13 Oct 2025 20:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760411031; x=1761015831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgBJPqO1gJ0Lhnr7Cwt8ur3sk4TrxjE+vlAZIuYc+tY=;
        b=Za2uce6WM5gW5N+hWocKBuTIhg6KsWRIqX418MoGOxOqy/79vg8OHqQH6Nji1Zynby
         GdDyXZEYAFvrMFj3SJTpyQp7ohnMohtTtXQQrg/zmqS7AKRBrv4nGxpvQyJJzLDSfaFJ
         MslYT2pjK0IYmPscgy/oR730omJfRjAO/J+FzFJgDsklcOL/+asXj/0yD+vC1uwyi9c4
         5ogj4hCJKsGGcskyzNdymLvG/0hiRQl72VKx/eb/UAUxHQyL+clB/l4xIAj5GVXmGS0Q
         hAI540yfOvO+xB7LINy2rAuisAB+7zv8t+zeb1bU2J+4CywKLulIzTiETLgufwBd1CeU
         nwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411031; x=1761015831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgBJPqO1gJ0Lhnr7Cwt8ur3sk4TrxjE+vlAZIuYc+tY=;
        b=qRPFv53XoGjKmv2prZV5e6MTcGQxgZFQAseFgYxWG3SZv/SynRCDaJyvj4wvWFAh86
         9T57l5EFCDdtH2y7mx8qc3l1FEkGeHjtIZVWWmC/ZDj2+exnd6qVd2SBpGyX/O5LlZmm
         /8lolsF/SSTgxvod/Vk0dvX301QProzaADXqzDK7HcQ0DUuWoCJxLn8fqmHXxMERWTch
         ikymi2eTgGp5rVVzQAm6I0bzSof6T+MnxGYjAG5pYOkuzjFBAmSBFqU7W5/iIO167eMn
         RxIC+oJoXVylSW/HF3NN3lZLttG5mVEn7j4WfAqhw521EL/d2l1PkskxjraRICrgvc/4
         e2Dg==
X-Gm-Message-State: AOJu0YwcFi2K4SnfJBfsz4qwDgC79eHV5OLwJSQ+pLb8j/Gw1CLVVmBw
	51CVLpO36FdsrJ02oV2l91zicxylo72Xxfi4ErwuiNRctNGil4zEmqlSFZXI1Q==
X-Gm-Gg: ASbGncvdApQf7A4v2HPoo9h85PKES2BEcUkZ4yJ1O/kM4JhvhKUcmayCPglJ/ePHfn+
	ajF33FvESG0Z+/RYh8FJEzdN+u2aP8Vy+UC8iwSaXhKUomhocxaTPs0JjTkdKw0NmpDVEQNgBeq
	8GmipEVWtV0oK9VxOCQiUR8BZ6MVEGGy6Q8f7nguRIP13pJjDvaOc0akuuOM7uwMWmE72hTbwZM
	nJYVULL/G2XmVvWv06YB2kkHg6lLwgDx8Pjb0KfwGJMVbAhUrGjx1TfG/XGXvdX3477RnoMLqOf
	MvmvXuyK6ey3EUyWmHmHB5drhw91OmmZL1/b3BjNc3BCB8m7eZWxa2R5s8wqsJjhMS5CbPOm3JT
	XhJCJKx5Er9yeo8ILoQCP4mN1lBXWghLMxK7hY9lq5of0qycDMmVdr451fSi1WY4LOrvlEAM0yQ
	iM8aqeiBMDGYjJUtz/7pYUVA==
X-Google-Smtp-Source: AGHT+IF9cwWbn4+x23BUpSzf647636p68sHSmB84X8wbSv9v8d+oy3iAMMlirX07BkyokDt/aIojDw==
X-Received: by 2002:a05:6a00:391a:b0:781:220c:d2c1 with SMTP id d2e1a72fcca58-79385709914mr29268841b3a.2.1760411031296;
        Mon, 13 Oct 2025 20:03:51 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992dd854a2sm13228999b3a.76.2025.10.13.20.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:03:51 -0700 (PDT)
Message-ID: <8842c155-35c9-4084-8d65-090429b77e0c@gmail.com>
Date: Tue, 14 Oct 2025 12:03:48 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/5] Provide \qty{} and \unit{} for siunitx < v3.0
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ubuntu focal (in ESM life cycle) carries siunitx v2.7u.
Provide fall-back macros for it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 1c7ea47e..e1dcd03f 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -92,6 +92,8 @@
 \usepackage{braket} % for \ket{} macro in QC section
 \usepackage{siunitx} % for \num{} macro and \unit{} (such as \percent)
 \sisetup{group-minimum-digits=4,group-separator={,},group-digits=integer}
+\providecommand{\unit}{\si} % for siunitx < 3.0
+\providecommand{\qty}{\SI} % for siunitx < 3.0
 \usepackage{multirow}
 \usepackage{noindentafter}
 \NoIndentAfterCmd{\epigraph}
-- 
2.43.0


