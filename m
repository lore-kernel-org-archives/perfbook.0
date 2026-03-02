Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C442DB787
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443476; cv=none; b=aRiIVfoghoSLKeYo5QfeeUH3Py47WtZ1olveJDwPUkzGlmtzZVnhknpaz29yS/dZGdsYUkT3PcGYNVMwnUS21fHGXeCb6/HXxTco07N5+96CvJpwDxO+XXjlNRzc0jvc7FfXBP24R1IOIQaFeAwgZ1iKFGkgkCG9gNG9WawAv68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443476; c=relaxed/simple;
	bh=RdoIvVtyfJd1O6rxN3QG/MZnGEbVuBXGfh5Z/XkOm78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAzU0OXpHjXiCvcgZ9BODGcwjqmL//M8XFUwsRwhdWTctb0Vxsb7P0vrPjZe+jQo9L1SeWE55eP6vJOn4TwlvhS1HU9v6Rkoycq790bs09r8+yxvxgweSuTjkPpvMR1O40JzxlLv0jAWX+wCfqdgZXWQYlzTpFvWIzii+zgqIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHq5ZFO9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHq5ZFO9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8272c559597so4176642b3a.1
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443475; x=1773048275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ptTBB9Nl++SyHUrizjAnJl7taSDq63O1jIm3LZ8K44=;
        b=QHq5ZFO9oNTMEBEaS6mcpWU8ze6ChNpLCmPozm/IHx43uPKrn2J/nJ9Vta0HIxf4jq
         e+scYN/SppYxO9Sa5wLUQ+1rcPwBUJn5nZD4vTdb6sBbc8qgsDE7yp+beX+SHiwUiUap
         aKu7P7UxxHdvtS1nMmPRZwW9nWUkq+Gc6yEc8JNINr+yDpdN6s8i0AXD5XES8+L4nfP/
         ctrOO4NCoT7TwxaX31vRv2oTFyZ//I6AbWLTQcn33j9NbsxCyzPFX1dsMVieKxY+UVO6
         duicrDF9uXAuUS6qJroEIe3vfF69uRhmZz7cD1D7wyP7stnt3Ds/kARDpydJdd6GIcy4
         9iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443475; x=1773048275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ptTBB9Nl++SyHUrizjAnJl7taSDq63O1jIm3LZ8K44=;
        b=uLX3OZX28CSi+35QB8V28bBF9YnGMPySotzdThwPXbAE04HQhvkGxhJnE+B2RTGkDD
         2FjZ7Nnlxkp7xKMhZ40ixosMbOkIRPz6C2bfuGkwhpBE4sQ/jeWIujng/qK8A5Ub94bd
         D48nHOeU4VCQ261dnwnEfmXvdzjor0dKY2vJFSAr4AsblbbVHjh813IPyOyc6uOdKLV8
         XCCm1hjFq3anGsPZenW/uMX4bC+mDO18GZZETMnX4r4WraKdjozjbHXvpeHHodo/C2Nq
         YM976ZAKVi738unFqd97w+1cPkMOzb7hu+xyQoE909vgOnVDRk3ktpRWpZlqfyGX/1D+
         RrIg==
X-Gm-Message-State: AOJu0Yx9cPo4hbqZj9EfyEVbv9lhzWFAc9sSvYU9YJmvgqsQqySahX13
	X0MN1HpHLtEQWacDy06V94pZJT1yEry1xElSpjdbRsNWavsVM7XmFweX
X-Gm-Gg: ATEYQzzFwg/s76TUVF+jeVvsWNfFESto4a8X+/p8mIlLnk0KjXCXT7pPTmm6hLNHM8g
	1K2OxZVfRQIQgqcpG4t4JRWrFrj+3B+tOSceDmYzUHjxGKJldfLaqHVL9LsDKwI9k9uqhooz084
	tib2+yBT1Ok27zHvetgWkSvQFAS2eUtt8IyDdxcISEj/eD+2QLw49k4AnoitYJ1fTZRJNbkEqIC
	9voNsdYXtiQqEUL5AK8bKis8qS9GatHk3tC/yyMVH4sBLAT4j+wJNJMIRodldfj0ALWcb/Ehbfg
	RVih3I6Yxizz4Q+oEjrpk8mYwEZF5xO7czyNQRcFD8no5HL8w8InqceGNgX68uZby6/gMfhMblU
	zyqo2sTpp0p5MvK81KaWGSDhb/V6OFWjgYtjJ79FVQHHsFHHw2Rzgno4QKMztD49JDehq/RttzD
	xX+jmEF3i/LBs39PvILg/u5eJfmChlaYVGS4qoh9Mq+i24iPCyn84UNqwo6l89YdW4RRqO
X-Received: by 2002:a05:6a00:2356:b0:827:3222:c4c with SMTP id d2e1a72fcca58-8274d9f3f30mr12458177b3a.39.1772443474939;
        Mon, 02 Mar 2026 01:24:34 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff372fsm12628951b3a.31.2026.03.02.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:24:34 -0800 (PST)
Message-ID: <ca4287aa-bedf-4301-850d-6856e05d2d09@gmail.com>
Date: Mon, 2 Mar 2026 18:24:36 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 6/7] Define pagestyle (of titlesec) for section-less
 appendix
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The lack of any section in appendix "Glossary" causes its odd pages
to have empty header.

Define a pagestyle for it and print chapter title for both odd and
even pages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 78a26c21..5509d455 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -62,7 +62,10 @@
 \usepackage{tabularx}
 \usepackage[hyphens]{url}
 \usepackage{threeparttable}
-\usepackage{titlesec}[2016/03/21] % Suppress number in paragraph heading
+\usepackage[pagestyles]{titlesec}[2016/03/21] % Suppress number in paragraph heading
+% custom pagestyle for section-less appendix
+\newpagestyle{sectionless}{\sethead*{\chaptertitle}{}{\thepage}}
+\newcommand{\sectionlesspagestyle}{\pagestyle{sectionless}}
 \usepackage{fmtcount}
 \usepackage{draftwatermark}[2015/02/19]
 \SetWatermarkAngle{0.0}
@@ -188,6 +191,7 @@
 
 \IfEbookSize{
 \usepackage[section]{placeins}
+\renewcommand{\sectionlesspagestyle}{} % ebook size's header is empty
 }{
 \usepackage{placeins}
 }
@@ -708,7 +712,11 @@
 % Glossary
 %% Reset footnote count
 \setcounter{footnote}{0}
+\begingroup
+\sectionlesspagestyle
 \input{glossary.tex}
+\clearpage
+\endgroup
 
 % Bibliograpy
 %\bibliographystyle{alpha}   % Use genuine alpha style (In case of build failure, use this instead)
-- 
2.43.0


