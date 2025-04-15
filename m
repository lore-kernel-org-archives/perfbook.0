Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B027EC89
	for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708074; cv=none; b=JU3nKC+eW2F8JLnFJOax1irZLrQQVEz0oXyt9zkEX4jSJ+PYlkXembmDyp6CuBwDZAYPzWlXVZAtEYfDYqG2Vxnc8Px7UfjOMNQrqyKnhkM+a7Dof55I6Zb39nVlyPfd9E3QjdV4mDY7/DMVuAaKTs+M02wGdrZxpp5kciM9w2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708074; c=relaxed/simple;
	bh=+ItfXjiS8XOt7tJ+f1+6WEyiIRpVDky8h6/C5mL651Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=KMLPDt5rrt/uwrba1eiir3pe/MGaijrBYvqYtiaj0R19YG+8gojDFkJYty116+cAF7vQ2E0udILIU70rUKm6+Jny/Q1DUzB85CcrgOgpiZ1qHnpsANx6MCE/SeOa35eDhSIp+LDhfbHuGLs4F6vAX+kqx1b6ZUXl5fNQ5pLfJX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko9h3GaL; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko9h3GaL"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b074d908e56so1639562a12.2
        for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744708072; x=1745312872; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1Ud97cHCZXAOe5eWHd+ueg5TOdcUDAX/0PnLIJBs2k=;
        b=Ko9h3GaLL1oYV0ML6U8s0FFOWbE9TlQIwEoFAZpuoNx7v3IIJS3udBWQ4hj9w2peJ8
         dro3kq8nl+MrXFXI0cvi+Lny6qIsKfMOGPEK+aKIgJPCIr8YQVoY5eJywl3cvnFezhTo
         EcvMx2YnBTeu/g6w1S4sH3hi2jzmbSwRCdmtADRCmjoJcXV7C2gGDKeHZIyP52VJkrfX
         tKcuTqpYGaArIFMC5c2fYa4t9y0nebCB8EVJq1Jqj1hHACuCWApEP+LQgH9bEeszaRxt
         nKRAz92BwlBrDR05gl9PieDffKvDTYjbOU0i0Tjouh8o0zIEYj+rDJX7v2hOb7tSPw4P
         jhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708072; x=1745312872;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1Ud97cHCZXAOe5eWHd+ueg5TOdcUDAX/0PnLIJBs2k=;
        b=BqysFtCFcsJduEdjEQfn4Tb4Yhd38z4Inv3c/GfFK4HI8lYidhDuR/leKGJqmkbbd5
         hLfQDlO+kMR6aUhlauGYT3JUNToyPuUroVw1LFCLrVTOagJOOdOfmbTM/dlh6GyNxUrS
         vayYLu0Tj+P4CuPImUiMQtWceAz2l2RAX+/wZkovRF/9+kF+BbveFTdhZiN7JLu2pvv0
         GYUAAoOyqDuVvRqWK9Z5v3+NheTCe3bEE2204fpcCKtTCpNIEPdQKlKjoIQRVQTZ9z35
         yfHxQrav0gAUmYxudPSMoNhtTU642n0EZ8NZglteCYmtc4O3fB2REDLqXH/u8rlb+dAq
         ydPA==
X-Gm-Message-State: AOJu0YxGfal7imkxKhZZNQFTpKI8QjnjohM2LgYdJTdBLaP74TiAjtPt
	WqgK7rhCA4Gx/QlGpxRFZCs5IslNDzrCDjOaWJKGRY57jQ8DzT1VjfPoog==
X-Gm-Gg: ASbGncsH8Q/dPbR96OaRQFzwCZsw/V0BBWuWH2sLBpEeT8a1mse0NCCQqZalHQP1qwS
	3YNxDrUZ+vYCwD8j1OS0kWst2MemZ/23kHUoDc8Ou7Kl9mgZn+H3pPYEe6l/F3Q4NKVjIvUAo1m
	ixV9XlYordqK161p88UsH6lLm+LFeJOAK0QdHiB3lSvtuu8JfpjP+Z1lz30LB8ABGu9t1nNU5dd
	ZJXcmlJFLBreiCm/+M2KrzPyMbqd1sJb9g578AVpHSo7HhcF2mVSTdJ05t22aEGP69DjPm83Ix+
	6w1RdT7mFph2ghi4sFL5kAQaZdxgvSFa5E7GOTEU+pQ4F2bqrzkv/+Y9KgjUQwKqLGAppNEPoFG
	ydNtZTh7+7Wc=
X-Google-Smtp-Source: AGHT+IF0Azm7FHUTRm/QVaYKbNHwS2PIg3P3KqH556xzQAVHpb/DLIVn2RL4YC2TWvJwWj4x5U+wNQ==
X-Received: by 2002:a17:90a:d64e:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-30823672e78mr22039536a91.27.1744708071716;
        Tue, 15 Apr 2025 02:07:51 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb171sm12617495a91.34.2025.04.15.02.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:07:51 -0700 (PDT)
Message-ID: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>
Date: Tue, 15 Apr 2025 18:04:14 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH perfbook 0/2] Split "Index of People" from general "Index"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Mixed list of technical terms and people's names in the Index pages
doesn't look great, especially with the growing numbers of people's
names.

Patch 2/2 splits people's names from existing general index pages into
"Index of People".

Patch 1/2 is an independent fix of a minor issue in single-level index
pages.

        Thanks, Akira
--
Akira Yokosawa (2):
  Fix \IXhmr and \IXalthmr for single-level index mode
  Split "Index of People" from general "Index"

 perfbook-lt.tex       | 21 +++++++++++++--------
 utilities/runlatex.sh |  3 ++-
 2 files changed, 15 insertions(+), 9 deletions(-)


base-commit: 6e66e280e548545c69dde85f8eeee400f66b4bfc
-- 
2.34.1

