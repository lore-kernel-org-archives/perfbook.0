Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545564C62
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896683; cv=none; b=X+Ga4LgRjSL+KwIIly7IQEhRRQJrVK3OI9Zad5Nnk3lQf4Hksa8MjPc0A4fE4hNxsme/E07oWUqv8/SyQHVB6Ne92qMZyIhnaVB+lQepKC/xPU7F6Akv82qbyhVuvu0PuUdZQQTrCVnb7TyyfRSMRQ6SDVBVkSx7+obj6JOup2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896683; c=relaxed/simple;
	bh=9AR3BvN6CcOKsxQQsYG2PYdVCV92kL0LCagPEymUVGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tu6GrEyIRtsSOtpCTKW8bKlLSEJYVKb9joNMcFRdF6CDewpr3ig20QwDNwZ/g5krkYbZlsIaTfhzCIMRjmg/ZI3hBc887ccqWuBrsZ9r9j3qxBn7W0BOz095aLkZEFBlsamxskbkGHUaLK2QKbz5k63Q4z0hqscn87X575b3Crc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFBYUHTm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFBYUHTm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-202089e57d8so970335ad.0
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 18:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724896681; x=1725501481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4Y6BpC5Aae56QxWutQ/oYmUlTf0NjrUnl6Ll8tjpqw=;
        b=RFBYUHTmRLhELmAIgnq1xtz2F1KD2gAC0ceCzIpH+NPwVhHy6fzYVkx7lwmIYGQcAN
         JqHIJhNpo+8XVOOmic0MIuFb0EHl6Z6CPhpZDW4sXoUZZYqmQcAZGdNkIo8B6q3qsmVy
         l8nKWASbfAE+n5TACnsx+mDZRaOYiGE/HLuL6Oy+PvKyJH32TKFb+BWf7UFkHVTjZKUp
         88lOCfbFbAzigBtrFcUi+fIbh6OeKQju794+IDcfigzESRt7nOPPITBXtBXTRE9gwtSO
         qObDCRbjKbIM+rR8+lmOCz46xjByudM3qp5fIMw8+D3SiPI6pWK5MsmsaeWoKSerKLXn
         iZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724896681; x=1725501481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Y6BpC5Aae56QxWutQ/oYmUlTf0NjrUnl6Ll8tjpqw=;
        b=QWVKUDNvnMTILYy2OYRZKP/U3jXE9G2o18YTQ/KGNZw1Nmo8wEXdCwwRhVshW/tD72
         b6IejlufYk5Nmfr/iqJPOXdmChFB3VYTkv4SeiLxYZHo8Dyc67zJluASagx9TAGwbWKG
         t7TUupCqyQCHW4+qSTI/Z0h0fph+e1EcGv1YcRGlT79L0LBuALKaVJNeqUEv6K/7zHRW
         txXTuYdFuh0HNOgTWCgtOwolgLoa2c45gIAzwxQCB6noZWgx/aUI0l2yBp1qVB0w+SVS
         Qf4Wv1cbIzK603qr6MBDaqcPm0jy+1uYF6YZvb6aJQXOCy5Yxn13jktOtzpgjz480ih4
         yYpQ==
X-Gm-Message-State: AOJu0YxHhHKV6DgGrpAOe58dDL6/rcowjgBrw02T2U9anCvYA6GQhrY9
	54032wjYTBImr9eEkZDDU++qWdSwvszRHmiGby9DqhhKKeEsfohV
X-Google-Smtp-Source: AGHT+IE0Zjj0WGupskj2Okll8vbdm334BWVAVy2DZqEBxYtFX62G9R2JNnbCFOE24sPGsmX1BUERYw==
X-Received: by 2002:a17:902:e80b:b0:1fc:4680:820d with SMTP id d9443c01a7336-20516703755mr1197405ad.9.1724896681409;
        Wed, 28 Aug 2024 18:58:01 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515537a2csm1187895ad.176.2024.08.28.18.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 18:58:01 -0700 (PDT)
Message-ID: <f8cbb6a3-1bcc-45a8-8c96-6d7c6f572267@gmail.com>
Date: Thu, 29 Aug 2024 10:57:59 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/5] bib/os: Update URLs of papers related to
 Synthesis OS
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In commit 2dce7928ddfa ("Bibliography updates (append urls -- part 1)"),
I picked a URL under http://valerieaurora.org/.  This one was used in
an LWN article titled "KHB: Synthesis: An Efficient Implementation of
Fundamental Operating Systems Services" by Valerie dated February 2008.
Unfortunately, it doesn't work any more.

Instead, point a page at ACM's "Browse Theses".

Add URLs to other papers on Synthesis OS along the way.

Note: Wikipedia page of "Alexia Massalin" at
https://en.wikipedia.org/wiki/Alexia_Massalin has a link to the
dissertation (cucs-039-92.ps.gz) archived at the Wayback Machine.
The used-to-work URL is added in the makeshift "brokenurl" field
for the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/os.bib | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/bib/os.bib b/bib/os.bib
index 75e5a9bb..7f608172 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -254,6 +254,8 @@ Multiprocessor Systems",
  volume="1",
  number="1",
  pages="11-32",
+ url="https://www.usenix.org/legacy/publications/compsystems/1988/win_pu.pdf",
+ lastchecked="August 25, 2024",
 }
 
 @article{Massalin89a,
@@ -276,6 +278,8 @@ Systems Principles ({SOSP})",
  Number="CUCS-005-91",
  Month="October",
  Year="1991",
+ url="https://cs.uwaterloo.ca/~brecht/courses/856-Internet-Server-Performance-2003/readings-new/massalin91lockfree.pdf",
+ lastchecked="August 25, 2024",
 }
 
 @phdthesis{HMassalinPhD,
@@ -285,8 +289,8 @@ System Services",
  school="Columbia University",
  address="New York, NY",
  year="1992",
- url="http://valerieaurora.org/synthesis/SynthesisOS/index.html",
- lastchecked="November 13, 2016",
+ url="https://dl.acm.org/doi/book/10.5555/143219",
+ brokenurl="http://www.cs.columbia.edu/~library/TR-repository/reports/reports-1992/cucs-039-92.ps.gz",
 }
 
 @conference{Pu95a,
-- 
2.34.1


