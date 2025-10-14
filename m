Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899892BAF9
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 02:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760410738; cv=none; b=h2S4qsKJpPf3eP8pYxHos5X0S6yyTyzgexS0XCzbIOdeh8gFQ3mdo+818p9pTKmP5vIWfB2Rna/MQeXHBNnWLtg64V6qwY3BNzFt+Gw5STsi+VSkOjGoUR+LB8z6GXwnbLfYQ7KhRikfQOKhkk75mJeJRqzzq6EsDA0TF2eFIm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760410738; c=relaxed/simple;
	bh=0zmwsO9UU9try21QuduyFoAWe8RupvQTx4wxboxkfFk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=F42vXxfkNZpp9RkTmVRlubh2Os+naCrW6ITWLKr/gZwPKxbbiVIWrJe6+w9JHuTYY+WR6jANxEGyFhs8kM+rLXyBt3r+vcr5QyGu5qvY7u9kyTJKGnp5FEE2npvdgj1HcEqYk/H5HX0K/JwQ9q6pMep6jBAJisltnzfcOPOhoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw2b7GB+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw2b7GB+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28832ad6f64so54143225ad.1
        for <perfbook@vger.kernel.org>; Mon, 13 Oct 2025 19:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760410737; x=1761015537; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hwo+RKCck6DZLB7t4d6XAF1qYX39+jWJFx1gNQ9wRV8=;
        b=Cw2b7GB+VEfIRGmmFihBI7dZycak+LavsA4ivg+T/HuYOnkXb10nAOBykp+XVAiOUm
         J3TAoZF23YCXZ7b7R5KVmpzu5gO3/x1CR9B7d77hBYPQS/7oz9NUKhr3EZEUkMXKbGlo
         jNUq7VggByR4ITVwrlczu7MlIfJEnXHfbVsPrFJeG0cbt87EG3cjDWqk9iQJOEPz27ak
         /xCkzDrqwOx5mzPDaz6TmGXjxvpz/uajZb9KCmOiLqKuJAkexO7oOd5Wczb6804Ury9T
         mE5sigIzk8lmiCU3D2c2AoRWlg9HTChKQDoEr/P01vFqZSJo1Q940+GIjznuxwJTMBTl
         qZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760410737; x=1761015537;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hwo+RKCck6DZLB7t4d6XAF1qYX39+jWJFx1gNQ9wRV8=;
        b=C6EH3Px0aL0yzGN/mf+2+i49R1FQycgsErDvfP3JvISWmQJkI7bUVm2IJzMak/Tpwt
         0msdIobyA8q3zzZhu8UT1jI6YTxYEh4Jcre6z10p2r6ITvXAO6c0rYHVxSvSc3fbRW3X
         l3kbt/cA0CiA8uVCA+Gjws7rSJmOBB0r4TEZrTYPA7IxovKAYswazmqayF2cfaQ2tD8D
         otAmqcqmeTMREe3iHxvJZCWL5d8ok0sDneYGZCVAw3MmuhJtPDqnT6WQeBhEU4VF6bNa
         QM1nCbDrqPmix1pmZuXt/TReIlZb4fzgHrNDllh1P8VUVPoKM+7HbOSQMqbGXIRQDNb3
         juPQ==
X-Gm-Message-State: AOJu0YwEmk868Gjsj58EygU0ky3A2Vl9XCMtxKRsAMRnRAGwfzhK6kat
	96DDzSBIr0SdtS9WxwzZErmTTQFBI3HkbDd86DoqFuwfHmrNeQpGbSj5MmlFpA==
X-Gm-Gg: ASbGncuD8wduvVFRd3ZpPqCzmvR+ib/siO9rU2c5dPuhEE/AzCYiOv9ut+/ck/Aql9D
	2IquLUwKWNDWivs6/qShTP2B/xmph5dubFDs1wr04dbEBD4oW1LDpECMorE2bL6Lxw4D0vSvjBV
	VQYtDv007VIFcDYutGDeVCLvGzc/4o4HxGLHxipsBES+JNx6Js+oaI16JSqt/Klbxexz3TSDOZ3
	X+sjzytaBdriiOSsTuZtfZip+ulRZ7Xgh4MLiEa/gY4LwkuS4jUvY43C1mHHvrWRqo1gp+lmJZ/
	77uYFpRfQ9WyyHwgYiVGfxZaPc47c49Z7qtt2fVxt4yOz9bpEkYESgn9YjFi1CMDs2cRyHo3aIS
	zcikSJWyZhxNcrDgApdCqfjpczoQAcv3u5nhOvboC8CZO2oxDW/zny8oj0Zjosxraw7SGZBeaBB
	N82rHuYXx/CNYKEckpH1gUfA==
X-Google-Smtp-Source: AGHT+IGry0LyoCteCugqC6193gfgtw3dQlstJiF5gDqapZjINVTN/dnF9Do7WAYjethQD1+aPTV3/A==
X-Received: by 2002:a17:902:ce88:b0:26a:8171:daf7 with SMTP id d9443c01a7336-2902723f086mr382586495ad.16.1760410736740;
        Mon, 13 Oct 2025 19:58:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6de2sm148524245ad.18.2025.10.13.19.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 19:58:56 -0700 (PDT)
Message-ID: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Date: Tue, 14 Oct 2025 11:58:54 +0900
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
Subject: [PATCH -perfbook 0/5] Misc updates and tweaks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

This is a random collection of misc updates.

Patch 1/5 improves the look of new snippet added recently.
Patch 2/5 avoids build error of ubuntu:questing based container images.
Patch 3/5 takes care of pre-v3.0 siunitx (Ubuntu focal).
Patch 4/5 prevents page/column break in a short VerbatimN snippet.
Patch 5/5 avoids the use of plain "-" as a minus sign.

        Thanks, Akira

--
Akira Yokosawa (5):
  intro: Use "VerbatimU" env for non-float code snippet
  docker: Remove "-A" option from localedef
  Provide \qty{} and \unit{} for siunitx < v3.0
  cpu/overhead: Add "samepage=true" option to short VerbatimN env
  intro: Say \co{-1} for constant -1

 cpu/overview.tex  | 2 +-
 docker/Dockerfile | 2 +-
 intro/intro.tex   | 8 +++-----
 perfbook-lt.tex   | 2 ++
 4 files changed, 7 insertions(+), 7 deletions(-)


base-commit: f8c73ec9c6006b74bc2d9a87b1379c74b7541e37
-- 
2.43.0

