Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F97E1C69D
	for <perfbook@vger.kernel.org>; Thu, 13 Nov 2025 00:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762993174; cv=none; b=QLYfufASRgXHMvTBjWvzCs0NN+womELc5aBt6CLuthk6GltPsKWwbNOf7ERZEz9xgQ6XuYqjbCZHwEHpoRFwyjSb00bPBFBGDAspJZZN42n2XcHpt2edDNgYudFjKRDsFJU0sdAIKW7bwBN38HLiVtM4q3J2Zy7h0IPy6qpyRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762993174; c=relaxed/simple;
	bh=CgoEAqO3DMmD8lxWklfApV9blMHKMLpBwVpeDXgd7kk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cyutRMy7NktzyBU3YndPFKKBxXzW2iY9uUTumtlSV59OllEY1lEGPikiB/DAiSEHaMKOeNkHkx8wgW6fGUZpA4ylu+SgOmGzKHoCrGnIBfPq8yzwZd/QtZkDpXbY24D//qWN4/P4+nwewygYSTktSi4bCBZxluj+voSXCG2PfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSY8zTgc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSY8zTgc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b80fed1505so172368b3a.3
        for <perfbook@vger.kernel.org>; Wed, 12 Nov 2025 16:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762993173; x=1763597973; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t9450gSElkzd+t0utC8dAdyaWcDFEG1AyLZyH/cHNY=;
        b=mSY8zTgcX/NbMb+jxDJ8w7pE7iCktZ4Ls/k6hyeAcojjpndcC/oxmTBc9kUAhzLtMB
         9dqiJt/gZ4QaI1rlmYowZ4/mbZXVozpCSn1WDEop/Cv7DQ/iedJcxAXxMrmh9vOgGbQd
         JCwcLPFaMMPqLGR7IyLv7r04GoIVMaJNjuGdmVBEwyAnaIIMirHX8+ETelggj4LaAhgY
         tsoMSfa0uP3ioswl3kql2G338TkKSg+BJ9Ah+riZif0rFCtFPfoU/aUgtK7ynNofFeHB
         6uIoeDMRLCO22sAQLtBq8uM0Q3TwRzU7/m8lHRuDgaGGhzZFZwaV/00Ub7kzcZQE3E/Q
         hJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762993173; x=1763597973;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6t9450gSElkzd+t0utC8dAdyaWcDFEG1AyLZyH/cHNY=;
        b=HLJfbq1sG2M8yUhhpo/4TVhPmutj9Z5pRjXWn+/FF+jDjcTab6NiBdyEHA1rD0thAi
         fs1LUmy6R0ZIXNczz70PAVPQYb0zN867h0n2mdFrHIyU8hO0Ze3aq8I1nKfQSNdhfq5h
         xb1+yxQxVxv4Yb2KmoKycrQgEolnfkTiL/8r2dJUdsKiWFfw9Daw19SmIozLdmqv2gJ2
         nYbYHtrqgH4AvuPhepMYhVlR2LA997fgDaED/ZWLgDM2HGpPm7W3ESKeYTTtXOCA4Lb7
         fbSwcZz7phKftIwbd+Lzk+zdH6n3TUyEdVbek2SZS6/wRX3dX1nsIvNbMFR2hPFUY/7d
         nAhQ==
X-Gm-Message-State: AOJu0Yz3nGZDvhZ1qBETxZHx8R8p6Q+LmNUI7jR0u7YdJ2D76+COFccM
	E5cQh+mHjt81MkELSa+p+jSNgHqmsBEHpVYH1JyTshtw65hAP15Km5CV
X-Gm-Gg: ASbGncuCfKvqC2E+olRB8LfMkOepGSqRcRpsry/NbUUthvyFEilnnNFmfu9khvLBbdf
	VqyZBZD6lSzRnRN1vUgb4LQmMbbds1I6I9bdRniIR69S+MpR+L1lazOQ52s3OmWZ8SrYraYEyzt
	maAw05LsUt7b0iBmUJ4sbSbXQ3RzirUBLUkEx0UPxQOal5iwpGI4bYJBL4mrglsEm9acPMhBRYT
	tR3229qwL3w+3WMGyq63kOubBSeFNM9Nk1Zg1m4yP5oD4hj6oaWVgBxihPmgYRW0cEQw69Gnrhh
	9v6511j7vMa6LFOmV793rAvO+/EeRtoipgytcGjt/PEJdC9X6djHg2EI8J1invrE68EAmISaFMf
	REdQ1Y/pwoUGQ2Im3j5eEDAcEbO3RWx8eelHpOqOIEpN1mKGaNglpQYwyelwRdRFRbIIi1uXCA8
	/z9S/8iMypCGyaAdQTtq3wf8qGsVIUZufR8sUsH4UsyJmlGg==
X-Google-Smtp-Source: AGHT+IGWxQM2kOO1QXjuV/S84KOEnG8QWbbtNGy5Z1GpkphtzH5ypt8Xfhz+we0I1QoUkE+FcodM/g==
X-Received: by 2002:a05:6a20:3d84:b0:342:fa4f:5843 with SMTP id adf61e73a8af0-3590b717de7mr6607483637.43.1762993172589;
        Wed, 12 Nov 2025 16:19:32 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm249986b3a.23.2025.11.12.16.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 16:19:32 -0800 (PST)
Message-ID: <23edc53b-c087-45ce-a874-8142da4286fd@gmail.com>
Date: Thu, 13 Nov 2025 09:19:29 +0900
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
Subject: [PATCH -perfbook] defer/hazptr: Fix markers of final qqz in a series
 for "nq" builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Final one needs to be marked by the sequence of:

  \QuickQuizE{ ... }\QuickQuizAnswerE{ ... }\QuickQuizEndE

Fixes: e736a602fdcf ("defer/hazptr: Add steps to move from refctr to hazptr")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This will remove extra "," in the box of "QQ 9.11, 9.12, 9.13," of
"nq" builds.

        Thanks, Akira
--
 defer/hazptr.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 0fd63d78..22fca499 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -398,10 +398,10 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 	operation needs a minimal number of hazard pointers.
 }\QuickQuizEndM
 %
-\QuickQuizM{
+\QuickQuizE{
 	What needs to be done to convert reference-counted code to
 	instead use hazard pointers?
-}\QuickQuizAnswerM{
+}\QuickQuizAnswerE{
 	You will need to:
 	\begin{enumerate}
 	\item	Allocate and deallocate the hazard pointers,
@@ -415,7 +415,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 	counters, there is no efficient and scalable way to determine
 	precisely when the number of hazard pointers referencing a given
 	data element has dropped to zero.
-}\QuickQuizEndM
+}\QuickQuizEndE
 }
 
 On June 17, 2023, the ISO C++ Standards committee voted hazard pointers

base-commit: e736a602fdcf8ff57537b2f692a745eb331c74c8
-- 
2.43.0

