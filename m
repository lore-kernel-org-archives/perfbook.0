Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CFA29
	for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 05:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742360774; cv=none; b=scxx0vQu6+Fb4mYvBdSHFRfpS6zBlK1ARgbPrLPbztTDP2r/BtBojIhH3Q/UcqFdeiGSQl5SNpuSibZmO2SGECmo9vT1pqmZojz2sC2pgqr8GPfJ7rUig999gbtVR8NqOd79BaTNfxhhg3rVYPyoZWgNFh8OmQCaBoImLPPtpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742360774; c=relaxed/simple;
	bh=/JciBvlE6Mx7bNyaJXe7krQS660j+8FcGjmlsAHH/b0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=GB7EGyJ3L/XjAZlycogZrxIvNTYcFi4FwQLhKUbNyrgF05xeiPkTeH/hEJyMysjAp3R/Oj8JhhLKo1A9VKrpLszfG5MEIr8nCoU1+Px0vUYUs25XK4ibJCzR7/U59S2r1rx5wtnEpMFYzi3iX0XrpIdQnJUv7Ucc8wdVDduwtsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXcbNr8R; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXcbNr8R"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224100e9a5cso124255365ad.2
        for <perfbook@vger.kernel.org>; Tue, 18 Mar 2025 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742360772; x=1742965572; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bzEslsPVuUCI3R7vJhND5x5wIeZNw71XIGedWeXcZY=;
        b=hXcbNr8RYJcon/4RE+uOMkkFJLIgzgiV+cUVpg+fAhwrXD897TI666lDKdURFpf+If
         o1BuntbBGP4YEnZ7/tnlERsR5zuHeMOMFPGRdpoeAsHxFahnxyIwhYOvC2tM5vhgulZr
         BdH2BDt/JAsY2j9jzN+yLDOFph3p4A1XVT2p2DvG4YXl54E8ozUwElqYh/eWwLYpphrb
         ug3l4fTv/0zyvz2fTeAyzNs4Mv0tAFo5gKeBPFsyEgOhpqAsn5NALOivTctfbAnka6hn
         oTFYc9rk2h9oDnNPWOgZlqx2Jg23UrtqIYeCsuJrxHlrdO35w5fVGQZZz06WgS1WuqGq
         oYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360772; x=1742965572;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6bzEslsPVuUCI3R7vJhND5x5wIeZNw71XIGedWeXcZY=;
        b=mR8/TLJc78HWzY2EMzOAR1GgmMzl5eWSB0ldGdZa1OZaFlPG2rvMWnqR6Anop56B3D
         nHRvDDAzrpGdZm2qp8FfYpWsmFq6t7rAuKB1WdvE1xirWd2NqYmjNwRA322dl6esu3OG
         yQCLLgDpgW8gkIlaHTZ5pYjyZABuyDIrlDHXnGGSVfSJtWh8FxTcgIy7kvioTLklRvDU
         WxUedmXSq/Klb0k2aZ+rhwgPOJgbDXSSUACixRytT4QkALYHWG2rNLUt+sgaIyWHHAEx
         RFUcd0GqO8mBkTdS8PvA1qHtGkU6LUHTiUoAKp4UyiX96OAnumAArE0g2JKfP6eRemRx
         qJFg==
X-Gm-Message-State: AOJu0Yx7Vz7ejJUfONYA0Io0R8femdK58QYazQHI/mvc50+1XqmC/ytG
	g5b0+1VDnYs29Rfvte0M4+PW3D7mn+nQwXXxC4eRqRUoxE+A6ee7
X-Gm-Gg: ASbGncuTIVWpGuSxB/zgrV63luMWb4+o4k86qx7JGYr7aHJgfWzhZTRzeXNubMHNgyn
	WaBZZBNV43m0IFVjTcz/jb7Bgu4d/+N3c0nUOiCVhQAo9UPCSUKv9tziVIVcetLcSV74ni4GOsj
	BlENKBVxltjalA8LYk6HsE+LV8McGlfeF8tn4mk9+vxoYwgtD7x6xhTWrISNvIZbHW7IbJWHnGG
	MeGwnmETS+McTdP07Z+AmZrEAiK54g/RDWJeYm4c0oI6WpJqybIeV/Ux6yRBp8CcTLqQ8WJvaU8
	cR/1bNYjIcYrBQkYogZ1Tq/QgScob9u5TfhtRJSL02USavBU27CJMHMCfBcYh9xk7id+m4WQ0ZI
	Q3rurQduW93LpvRw=
X-Google-Smtp-Source: AGHT+IExYp2zFDGEyN25TLkLfuqjkAZZLfvmw1hLz9KMyqVc5W0rTPXA+F3e138CIuTPZPzlu2Zigg==
X-Received: by 2002:a17:903:8c7:b0:223:432b:593d with SMTP id d9443c01a7336-22649a500dcmr18807615ad.42.1742360771968;
        Tue, 18 Mar 2025 22:06:11 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2264798c3bdsm6589325ad.90.2025.03.18.22.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 22:06:11 -0700 (PDT)
Message-ID: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
Date: Wed, 19 Mar 2025 14:06:09 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Ignacio Encinas Rubio <ignacio@iencinas.com>,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH perfbook] bib/hw.bib: Update URL info of Alpha related entries
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Report from Ignacio in [1]:

  [Gha95] perfbook's link is down, it is also available here:
  https://github.com/kaitoukito/Computer-Science-Textbooks/blob/master/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf

Instead of random github repo without any LICENCE info, use a download
link at http://i.stanford.edu/.

Also update the info on ask_the_wizard ZIP archive, which used to be
hosted at https://www.digiater.nl/ but not working anymore.
Wayback machine might help those who has interest in the future.

Reported-by: Ignacio Encinas Rubio <ignacio@iencinas.com>
Link: https://lore.kernel.org/68b0a4f7-07eb-4e69-96fc-2cc4b40ad818@iencinas.com/ [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 1a24dcaf..ec74646c 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -336,8 +336,9 @@ System Programming",
  Title="Shared Memory, Threads, Interprocess Communication",
  month="August",
  year="2001",
- note="Zipped archive: \path{wiz_2637.txt} in
-\url{https://www.digiater.nl/openvms/freeware/v70/ask_the_wizard/wizard.zip}",
+ note="\path{wiz_2637.txt} in zipped archive at
+\nolinkurl{https://www.digiater.nl/openvms/freeware/v70/ask_the_wizard/wizard.zip}
+used be available until March, 2022",
 }
 
 @unpublished{MichaelCree2010AlphaLinux,
@@ -745,9 +746,9 @@ Stanford University",
  year="1995",
  month="December",
  number="CSL-TR-95-685",
- note="Available:
-\url{https://www.hpl.hp.com/techreports/Compaq-DEC/WRL-95-9.pdf}
-[Viewed: October 11, 2004]",
+ note="URL:
+\url{http://i.stanford.edu/pub/cstr/reports/csl/tr/95/685/CSL-TR-95-685.pdf}",
+ lastchecked="March 19, 2025",
 }
 
 @unpublished{GilNeiger2000a,

base-commit: 87ebe68e3a7d2a7b0b63a7d61283e20434ea6a09
-- 
2.34.1

