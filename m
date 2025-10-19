Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87728354AEB
	for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861647; cv=none; b=msAnbvoUct70qYDPaGr4PTP4xXiTfHeymbRpXLoTuVJZtHgK/4Kl+fZbLVGKSqzD6PhTtbfAGRR5YRGLJ12uP4NgGIHoNN15V2YwvnakxwBIjcFBFTvsecOVBM7qQ02lzfoJOvIK2fBVft0J4Dosq3jMvhjnyz3j5D9IxMe8mpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861647; c=relaxed/simple;
	bh=6HaVgxBnVQ7pEINUx78Cp8qlWCJNKF7xGErh30JqeEI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=NcgGJYLa9M9TthVdQmxjDrRBEBJZHZWhMfmR6I3RT9G+Pnzs7H9EADLdVAj+W25cfkPROBlRU4e4NH0EsjNfhGVmBce8p/oUd1c5gU4sIvribRQv5qbPaNuBm0zFFzuDN1uiKcVUAN0iypZEUXv1mVLn367NSaPIWfTopf4q/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYMCeO1Z; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYMCeO1Z"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-782e93932ffso2908525b3a.3
        for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 01:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861644; x=1761466444; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZgMA/++SZ5OMyfo2lWaoIRgQjMt/gNjZN7vZGC8CN8=;
        b=OYMCeO1ZLoUxIzjtB7CILT3+lhsq681HcuONchFaXnVyPZc+DgT9laut+Q1OVR2fQ9
         HqR6muLd771USamFERfk48uh3BNK7tzE+x4LQ8qQJoHcn5qomN0fIumlkn6yGOP1k84H
         n7585q9WX+hZ9WEfhWVhBvy8OzcTXbZ/FAecPzR76MklpxsqTd0EQT6sKQOsjZBwOkib
         yMRtUytsH5un0MrQdgPP/xkfP4zOHrOtKu3Uve0xNor/L43GypRBy29u4IyhhNYS6YNz
         ZmXCrVKrJFJfNxW6+ojTnvXZg+mPER+Ad/c2uryuLRHW2d9iRjsBq5HUiA6ijHsPL6LT
         5rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861644; x=1761466444;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UZgMA/++SZ5OMyfo2lWaoIRgQjMt/gNjZN7vZGC8CN8=;
        b=LkGwT1hPuzv5Hj8Y6/tdoju937mhQr4nItdo7G0kA5uB01YSuftXybi/QJA8GD/BDo
         ig4A0EEUf6+fdgXHHqTVFsNH04urUkVmuD4nJbRYjfe7zCPlBgV4qS0A7sU9PB6YShkl
         /oLA6Z7QdTLiR655osg5ZPI2L9/aidZEceJaotlDnhr1VwNyShw0tViee1TG03NSNt4F
         FDZppVMQehBmypSwzIQkXne6+BvRvjiB7FIJxoIm/3PxWX2T9U0It0yZl5kn0kS2HnIC
         nm9qyGTnDyNr5ucOdTk1ur2MosrasSkPzTpY7u6CgQdo1XEv5nRW8qRu5F34GCYY6XXx
         JxwQ==
X-Gm-Message-State: AOJu0YzaH9JNreP6CeVKpop9B2qqnPLRTji9UWG6zjl30nhOb2VgWdey
	IL3KXYmXoAR6RKCJclwYmD6SzXEd1E+HRSY6vfYWRTsSAIddAKKIwDd5jPafzA==
X-Gm-Gg: ASbGncu09cJkXwQEEOB6bwg7f2+AIQCSgEnTBNyLoYmhto9oAjadpVxmGpb120Ncv3d
	yQFqo8HHS8tF1DakMuA4FC1TDhXG4vkrx4ymT/jPfy1MEVwXhqXuxc9XTmcPfOTALuuK9tQGNpf
	iHleYQp0CKAQIioIicJjmjAqc9BPfxiKSn+3nHQCgpWyeWLbSTy+Ilu8oeTiAywb5IcZU9W5YPi
	7EX7eIn+Tk9XDTrHNm4DI//bLwUoDWOla1F7Q8gGUOY0pP3W3vptlvFj7B8fuGoD6NvL5/VT6Oi
	v/xVFuzpT+CsUb9Gjt5i/F+TNjZSxFB+XWnx5KaU/ZpZAqG5i4CNUT1f19j7q1e8aIy9viRXTvN
	GKK9Ii/dG/neZvWljTaXcsToE8jFdKPorczPSKlhrurEZm2F1aoHBfiPEuLJgfXpKIs5xHESyTI
	CtzlX4sMOMxspIvNj7DdIDwR/VetZjeR5CMwyeYjTAkOPcgQ==
X-Google-Smtp-Source: AGHT+IHHk29DY32MLdsT8f+xivoajCNZIBCUPBIVgAgPN4uWYhRBsIUMteCWUvxtRllO7aZ5DseMyQ==
X-Received: by 2002:a05:6a20:2443:b0:303:8207:eb51 with SMTP id adf61e73a8af0-334a864aaf2mr13821407637.55.1760861643743;
        Sun, 19 Oct 2025 01:14:03 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff184basm4865398b3a.15.2025.10.19.01.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:14:03 -0700 (PDT)
Message-ID: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>
Date: Sun, 19 Oct 2025 17:14:01 +0900
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
Subject: [PATCH -perfbook 0/2] Work around regression of recent fvextra
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Commit cd98035a31bc ("runlatex.sh: Detect fvextra versions with known
minor regression") did not fix anything.

Having seen that the regression is spread to a couple of long-term
support distros (debian:trixie and opensuse/leap:16), I think a
better approach is to patch the (LaTeX) package on-the-fly.

Patch 1/2 reverts the first attempt emitting the suggestion only.
My preference is for you to drop the commit, if it is not too late.

Patch 2/2 implements the on-the-fly patching of buggy fvextra.

        Thanks, Akira
--
Akira Yokosawa (2):
  Revert "runlatex.sh: Detect fvextra versions with known minor
    regression"
  Detect buggy fvextra and apply patch on the fly

 Makefile              |  1 +
 fixfvextra.ltx        | 11 +++++++++++
 perfbook-lt.tex       |  7 +++++++
 utilities/autodate.sh | 17 +++++++++++++++++
 utilities/runlatex.sh | 16 ----------------
 5 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100644 fixfvextra.ltx


base-commit: cd98035a31bcefff91d221aa25df2b7b98da243d
-- 
2.43.0

