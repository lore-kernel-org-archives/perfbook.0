Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A52505D3
	for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742374448; cv=none; b=hTBfzbSdM6u3L914oMUjwxORU9ODtMjPtqZeArKWFSI9clgTIWkJaLe1v1M0J0jOrvuasSOEke3swbTvaYHZlfoN4oobH57nGCHydD9Jn6bZTwPUcGYFwoEwz9qwYeRKfQeEfQXwlSdZ4Yun0btRmOYjAJ++zDF9cpeSwwMYHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742374448; c=relaxed/simple;
	bh=sPQQ85z9FZXvIO0P6vOInZGeRqM3lnURH8RCHAyZx0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVanwW+kkeO3a+NKyjz7rjEb5b4aIenKkCojGvCi/2wC/4nq1VotjzVTjn07IVLa/aX2e5Z7sVHPFpHbWaYHECOZwpO4jF6upeuGo8AfOK3vbI4FxRzbB7FA2EDrO+G1wu4FS8WBPtNJg9LSaH6/KEVC++7IBOVO2jvUBMi2LFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PthqoZ5A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PthqoZ5A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225e3002dffso74334335ad.1
        for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742374446; x=1742979246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsrDRi9aFkRXvtFqkZGDdjTnd0WDp0iQC2AFJW0mnuU=;
        b=PthqoZ5AlueD/OefG2d4V+n9V0fGNmy0kOXbh+Z69GqSVlHr7tpDorVcqsMyJ1jMRd
         +wa93P7cqZ2JFtJVEYBHqaaDRLG6GdS5cljx1TkdGOtVhH7T9nOv/tIt0lw+JpcjGSUx
         QnX79m1ibsufdvVVqATlp66gHhM+DZjql+07JWgWAsMm8e2r+TIY9fWH95NSWqqPfD9s
         eR4DtSjgxfsnEqdUlW8ckZI91J2GzIhdKEsLyafE2Q6P5ipgMK6fM9eVRXXYA7NAs+8e
         Lp9GFqdEUBlmhF3WDJPAo1P36l+snpLMmiNXvqXOGlW8NQFmgOVo0tYXA7vSVLm1MJTZ
         TAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742374446; x=1742979246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsrDRi9aFkRXvtFqkZGDdjTnd0WDp0iQC2AFJW0mnuU=;
        b=rqs96jo1YRMTJfmE36+0amPuDXvIIvjjL4mX2w+qtL8Orof+PRCBmWwVbqH0msiQdV
         fKtNF7KuCzRyKhvGFcmTN9SGVgVp9A4zS868TH1VVmooSXWD2bDpVGbCllJnaYVSwGbS
         HoL2WvrO40cqKW3woCAT6jeg5hDibTLWVLgbqWTvQg694OlcEGirmgRz2j0vKgQ5k+YO
         DIUopQewjeruiNprJ0PN8V5lp9uiKrL/ql6k08i5Ku2hBGcf3v2MNLxkL3usHj+toE46
         E+JnER4hT21nR/63jCClO6uRRsuV6EjCiO5Q7kJXSZspIedvC6t1uwrqVj4XpZozhy6M
         Y0Sg==
X-Gm-Message-State: AOJu0YwCo2DRW0qlFsJ/iuXw06LX/Jo2E33oj/vHckzcWvJ7D4msbaVu
	Kd9dgoGMMmbZQE2FUd6YsgyNHZC2Q0Ik5EKEGGpsH/Idn0Zi3Wbi3N2Itw==
X-Gm-Gg: ASbGncsdRz7C4ZG4Q9zHkYnbqiT5fkY97rveN6pUHRgKCwMmIEa/i49CtnaDLf4fbTC
	oPgKbR1Cz5Uvf/a5dLKf7lc8XiKLI6upyaOwGuBklfb8rdC2KkVuymIO7odKgO5l5/LgXgzhvnm
	8LJ7oU0k8pm1+U5fWe1mnaeQcJ4ya4VUXMUByt0yaqGzrEohZEuKyQFLCXlFCWYwzikbimGQaU8
	jCmrGlxe+wCVKQbY3pwJwWSP79yGzL4XTJWY9Wejnh3dnWILg8zyaXRfi4ZWl/Lb2PTUIEnAH8l
	eHhXOntfRgEoaaun6P3Z69+tcOsklU+ua0C24qMgjN21g27xgVjcjZJ0oN6d3c1ZZLEn5r+J1jC
	oRaWttLU1TY8QHQtBz4k2Z1nLFQ==
X-Google-Smtp-Source: AGHT+IGaEudRRpQv1isCqbJqmOA4oIISwIEIJDcpnCGA8lffEadF4CTxDyN3CvYb6aFhCT/eQQf7yA==
X-Received: by 2002:a17:902:ea07:b0:224:e2a:9ff5 with SMTP id d9443c01a7336-22649800955mr31906525ad.9.1742374446290;
        Wed, 19 Mar 2025 01:54:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbfff4sm108007645ad.210.2025.03.19.01.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 01:54:06 -0700 (PDT)
Message-ID: <902ff65e-bd27-422f-9824-1fc6b1c6823d@gmail.com>
Date: Wed, 19 Mar 2025 17:54:01 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook v2] bib/hw.bib: Update URL info of Alpha related
 entries
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Ignacio Encinas Rubio <ignacio@iencinas.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Report from Ignacio in [1]:

  [Gha95] perfbook's link is down, it is also available here:
  https://github.com/kaitoukito/Computer-Science-Textbooks/blob/master/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf

Instead of random github repo without any LICENSE info, use a download
link at http://i.stanford.edu/.

Also update the info on ask_the_wizard ZIP archive, which used to be
hosted at https://www.digiater.nl/ but not working anymore.
The Wayback machine archive can help those who'd like to see it in
the future.

Reported-by: Ignacio Encinas Rubio <ignacio@iencinas.com>
Link: https://lore.kernel.org/68b0a4f7-07eb-4e69-96fc-2cc4b40ad818@iencinas.com/ [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v1 -> v2:
   - "used be available" --> ", used to be available"
   - Fix a typo in the changelog (LICENCE)
   - Reword the closing words in the changelog.
--
 bib/hw.bib | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 1a24dcaf..82c8b687 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -336,8 +336,9 @@ System Programming",
  Title="Shared Memory, Threads, Interprocess Communication",
  month="August",
  year="2001",
- note="Zipped archive: \path{wiz_2637.txt} in
-\url{https://www.digiater.nl/openvms/freeware/v70/ask_the_wizard/wizard.zip}",
+ note="\path{wiz_2637.txt} in zipped archive at
+\nolinkurl{https://www.digiater.nl/openvms/freeware/v70/ask_the_wizard/wizard.zip},
+used to be available until March, 2022",
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


