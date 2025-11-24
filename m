Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865DD2E7F1D
	for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975461; cv=none; b=KW33LEP2rJVEAnZAcFYHX0FuPRmvxcdU6EVkoDOr/IqInSSpmgAtvsWTbaydAc79hjiGQ9Rj/Tlw0m+wDS75hGK6uYs/9OuXNYmyQLmqL8BgEh9qIPfUYIUmG7hopLcsNpj5vZYprjX8GNfyYgaf9AYrJj1HUGckVMMez/9fbvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975461; c=relaxed/simple;
	bh=h/LBMD872bP6DBWqqdwcVINbRn4Vrx6eNv2yPtyQKXQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kqVgl3b5VBHQa1pTwrrt0Wd5qe5m1t4ynML/cs7ipFupYKczy7TCFyYVVZw4xYNRQMhaJk+OrYS0edGdJqrzzurBdlmrV7FGnQKZ5FsTc2WQJzpOrB1/NSDmEykT5SynrmSDB2skJ6J+iCQNL8ju8YUl/Ci/4vNI50yTEzAnx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N180peam; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N180peam"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so4308160a91.0
        for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 01:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763975459; x=1764580259; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcYmJZjLsGG3lQsoAseTuhavDC7wwY83reFfQYa2sg4=;
        b=N180peamo+/3mcoijU6Kwt7UBB27oBK0q0K6kqFTPkLzn7BOMQ+t+/LLkrRWMick3F
         +l+SZR7sU5E5LWzuNRgMZrL+5RV3QMN7JjqMzKNzpOSa3nQ4UCi/CjxoPI8T7ddw5ovW
         2JkpEb5uRF+Qv+mAUBh7y9fpAXewtCzn33/ZQDhCcbcny/Uvyt7jBZ3408cXECfG2EVC
         PWInRiLTRPAStXIzeppQ0TRcmsSGcAAF+VvunJXsEIsrQchR6nYEME8MkYnitf0qGpwY
         bgbDLGqy3/IAKj0hkTNqL1N7jtrOjiXo9YNb2d3kV85AQXJ0/ny1jG51x5K0YstL46lV
         oYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975459; x=1764580259;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcYmJZjLsGG3lQsoAseTuhavDC7wwY83reFfQYa2sg4=;
        b=dVl76nUT2vmC3viDgXJf/q1XM3bFcnR3OfdBqCyuMEQQyswPQHHerqdMF/eXYXZa/R
         5b05wEEVqiOC/fRtwwi0tDvsW8q5kpxWVbfXzRI/kWmMIfWrLwpwBm8IpzhBGCia7IgU
         /Y1cJMKOuRG9S3XLcMg3WBczBqhYqIxsqymPx+lAosrVcxvbCQSt8ePfBtEGKuX5eG6i
         n+KXOYTXZbZvRXN5lD9iTdse/xNwj98bJ3cPAqQCPOWsIS2Q6ZLE2ZP6xUF0yU6/vSl5
         hqHaZbxU46fHGDcxrpFQxxnPp8MM85XEEIdY1yoPw3LYSxQc/wgyu5xBCWFtSoJI5ZhG
         JMdg==
X-Gm-Message-State: AOJu0YxFIPKLGb1prNOPUNFOmf3bsiDd6czAG2I0AB0MrxmR2o/zLWJo
	dhqFnCGRqVQOkbTyOlsU+9k7yIGHcW4n5w3Z8hfd2QUp+X9mRPgA8xhG
X-Gm-Gg: ASbGncvYLfMwl0HuemGjr6+UpGE/EJ12FCdMW40itpmVLvPREBezLW3nYJlnnrTSkXU
	ZHJlM1+lRuBPYGwGSE8pG57PG7EtptrDy7cbkTIFhLUXahTgLOkWFRiFowZljdgOWZjykC7CHNI
	CzWryjZAlgxZMXqgiUUgd+UtgYAoa5qlH6sqsh9hu+t2zp/ua5JSc92Uzrqudt/XWRYWq+yuhTx
	rW8kgIUoq+I60Zzq1A8aCf4PA5xNX7jfc2XcbkihiKCjq+EGUnNRShrCIUaDvVtYdpncOIc36pB
	jCVK8ZKA/dseuss97EaB/WLDofUUUWK0ZgNBI3eejQJVoXYWYd2fX14Xj9QsQDdQBoVioCBfPTE
	oMJudve+Ke790DDoeqXX6/YRAkZlv5ETWB2PsXJqQpQstE9H7HRxV69cQ2fwJQ9/4zaSyfNTk0D
	AuyFm61dtFNASJOj2ZmNDFI55/bzKuiWQwMa9ZDLuP1q+JEU/LSApA/Q/H
X-Google-Smtp-Source: AGHT+IFk8wczh0XB1VWkWvn8moukdQ8BilfebD3WKHf7L/kkXfGIzhaEvaDFxTVpNjLnWAn/viVXJw==
X-Received: by 2002:a17:90b:580f:b0:33b:a906:e40 with SMTP id 98e67ed59e1d1-34733e2b07amr7401645a91.2.1763975458798;
        Mon, 24 Nov 2025 01:10:58 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471f8dsm14146124b3a.23.2025.11.24.01.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:10:58 -0800 (PST)
Message-ID: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Date: Mon, 24 Nov 2025 18:10:56 +0900
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
Subject: [PATCH -perfbook 0/3] CodeSamples/formal/herd: Tweaks for new litmus
 tests
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

I see a couple of minor issues in running

   - make cross-klitmus; cd klitmus; make
   - make run-herd7

under CodeSamples/formal/herd/.

This patch set should resolve those issues.

        Thanks, Akira
--
Akira Yokosawa (3):
  CodeSamples/.../herd: Declare non-int reg variables in init block
  CodeSamples/.../herd/Makefile: Add klitmus7-ready tests
  CodeSamples/formal/herd/Makefile: Exclude time-consuming test from
    run-herd7

 ...-rcusync-o+o-o-rcusync-o+rl-o-o-rul.litmus |  3 +++
 ...usync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus |  3 +++
 .../formal/herd/C-double-check-cas-2.litmus   |  2 ++
 .../formal/herd/C-double-check-rcu-2.litmus   |  2 ++
 .../formal/herd/C-double-check-rcu-3.litmus   |  3 +++
 .../formal/herd/C-double-check-rcu-4.litmus   |  4 ++++
 CodeSamples/formal/herd/Makefile              | 21 +++++++++++++++----
 7 files changed, 34 insertions(+), 4 deletions(-)


base-commit: 11bc82274338c587732236210f9f6aaa5b5c0343
-- 
2.43.0

