Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42182374C
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065114; cv=none; b=sK4uh9Fo1x99DlmGPWbVEe+h4/R3RyR0c8m1/tyWWn3A4+7wdQT8E3UTp7meuMM1sPpEX3h4No4f+BOOokCXwRuMClm7hfake0Nb6xPA+N+xOd5K0ROdzGCbqB1YiNDhJjm3+y39vvg5IuE8/B1eO5iu2K04Zjzco5jY5N9li4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065114; c=relaxed/simple;
	bh=dU0m4MasyOfztyHjEuNuRIOPdjVUgFWYt/01hS2esn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=siBl+JuQdVreu0QKEXYHbLwmshw2gsrkbnqhJDI9SAn7wTZutBNC/Ne2jtRiBtzGqI/50FIiqeltusxRRTWYH4gv/8JESh4XtK+lsPICywsDCYS5xkzvjLcs2gLBT9O8A9KcK6eknu/abuB2J8b+ijrGfLi0KLrNsvWOvaLgKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJLipthR; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJLipthR"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-363b2cc93a8so9468205ab.3
        for <perfbook@vger.kernel.org>; Sun, 04 Feb 2024 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707065112; x=1707669912; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GgjzRZbhlkbU0tbjpYcnecf0XgDDuxgH24kH5Mi63gg=;
        b=mJLipthRToUA2Wa1iN/FbdMDX8nVuUVlqAQUKlEpUoiITP6A2XB6Jg9ungBVBzXPYq
         gKALPRDk+OGtSO4PRt3LHRoX1UOZjCAid4YoTT+xbcvPIAsPfpiy82S6HxapK1Vwl3ST
         Z8ElCRj96IAv0R1PzYpIW3Nr17B2XLxUrUEkYceXsoKfqmhOXaI2G67ZdGWS7Tn8Fm0+
         rLUt/Nbg3jsR+hSze/CfH9g6zldQv15TmhhXMA3vIaqkwtmfaIwI6ZaSNbNkzXny4CYd
         qeYtjfEjCofqhK+z2O58z4tne4h/OuHu/SMmY/RjUQhqBL5lDRwwkuBuY/roTOwoTBtv
         /u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707065112; x=1707669912;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgjzRZbhlkbU0tbjpYcnecf0XgDDuxgH24kH5Mi63gg=;
        b=cr5ZlUk0EqjIlp3Iu/kBI7IHTiisZNPckD1sgdzvlVamtEfL080l53pw7m/66R3FMB
         vm1N+hHgvNN2Aig8Zj7Jc9yZCnM9H2KVhomnASXtuplUKPTWSt92COV2IZIwyxnj6gky
         KdvsUdqxQxABYpQmRDQc7BZBKDvKhOn+aBrn3LyxLN4CzqPmV0h/lSM69lJYNY/xoh3s
         b2NBj3ZycxXGI8R6qHygO9w3eN5p+OeNkDIqIYqYf7XTsGOLB5zJJ0VNmIUfEIDzk1qu
         UGrBoaAJr5vnrp7F1xaRQX2ZAnz5aPJ0wi1CwpooMnmZzbBI6LTrazKib3y11BBlnGc2
         M9Mw==
X-Gm-Message-State: AOJu0YzC/L6S6pilBT9j8qmsjK2soLu9/a0eu6/46EgyvjV/Ul5M7UwE
	l9ZXniPt1/YRtmd5GRKvfg2wA+dSPkqy8H8LYstKorQLSyMnN/5IotRtnIfj
X-Google-Smtp-Source: AGHT+IF33fw/4jk0d5/Yb02t5e4AF2hMQGY5K+qGJ0LVJ/OOKCid6uiO2F/tfebXciHLdb4krRrXDw==
X-Received: by 2002:a92:d2ca:0:b0:363:b7a0:b1d5 with SMTP id w10-20020a92d2ca000000b00363b7a0b1d5mr7590716ilg.10.1707065111932;
        Sun, 04 Feb 2024 08:45:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVGNHkuVst1OJ4tMZwciUDDUp34DWVQGQMaoCSqBmvj8uBOY8E0Mr39rM6B7viGkqdtTeLHaMZXDyIfkrYXEu1BuQrItKLIe9M=
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id y2-20020a63fa02000000b005d880b41598sm5350014pgh.94.2024.02.04.08.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 08:45:11 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 3/4] appendix/whymb: Add '()' for functions
Date: Sun,  4 Feb 2024 08:45:01 -0800
Message-Id: <20240204164502.15124-4-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204164502.15124-1-sj38.park@gmail.com>
References: <20240204164502.15124-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

A sentence in whymemorybarriers.tex is missing '()' for functions,
namely foo() and bar().  Add it for the consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 5cc7911b..a7f97897 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1374,7 +1374,7 @@ only on the CPU executing the memory barrier.
 		to minimize the resulting stalls.}
 }\QuickQuizEnd
 
-If we update \co{foo} and \co{bar} to use read and write memory
+If we update \co{foo()} and \co{bar()} to use read and write memory
 barriers, they appear as follows:
 
 \begin{VerbatimN}[fontsize=\footnotesize,samepage=true]
-- 
2.17.1

