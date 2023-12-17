Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC94652B
	for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/XyRjO3"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-58d06bfadf8so1889021eaf.1
        for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 09:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702834891; x=1703439691; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKD7zMucUtQjEH5b4N2nDCbiQZqLpd4M6atUneH22o4=;
        b=c/XyRjO3KjcWmTXrjsAd7gSMCCxpq/4iVLM7RvesgDs/wrmEjMFYLACPPZAIAFJdzM
         esnFiMspeRxumHSVjSzA9yeV1nk60yh8GKTMeRPDXg7yLC31AdxkTpGQno/6xhrplRUu
         QonliIXXfgr5s4QiaHYao/hwGEI7QpOXFNK4+YI0xPSoRd7/V6LQ3ds5BmcDS70NDgG4
         aVublEpstTV6kd5CNJKmIJOsOqW+nmLDMkp13I0yXYiTf999y6AiWGud+K/WRbbCWumU
         /W7SFA8xpd6bMwB1gBWnNKlsTHZn8GN+XnKGJJRmSW63i7DYVCHNnu7hCoIGxT3LHw39
         6zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702834891; x=1703439691;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKD7zMucUtQjEH5b4N2nDCbiQZqLpd4M6atUneH22o4=;
        b=VD8saXqzR6VE93ri4rUx26uyMRX+kB5b8pub3A8gWCJvqt/U8zYAkGBSFNii9iKCTM
         T8e+u1hkTSrtqbWD8XIj1+f/berQqYcWZ9JzoXLOWb7vb+NXLbYlIi+HoRGNy53VbJkx
         wZTyYxwROe6Lbtna6bfvL+qrRc4Wyvs37pnb+qSWxsaj2o8VG/j819+7KkWV+RjUFtpI
         qk3fhEc0mefgQgHP0EQvcXL0Elr2OUa1akCZSXTEWLwYsds5DeyaBKgQVYMJwReZVJTr
         7ovdBJzXe5J8cxRej92gApK88croGUsjYntn+YuhmC1VQerfWVp1zg/8x3YiNcWWxdKe
         cy/Q==
X-Gm-Message-State: AOJu0YzM1atIzUW+rF0OKCvns0gdMoSaODPY2oNOBL/zpaFO27ypwcHw
	W+sqqDFMmLy4ARIwCEpGO4U=
X-Google-Smtp-Source: AGHT+IHtWiHNNZac/ND3hWkaULn2FuWx4pN9PMKuAD2hh1Ey7qpe7+KYB2lxJMI3DOr+QArvB3c0Cw==
X-Received: by 2002:a05:6358:9d94:b0:170:3684:315d with SMTP id d20-20020a0563589d9400b001703684315dmr16290766rwo.45.1702834890744;
        Sun, 17 Dec 2023 09:41:30 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a195d00b0028b6a72dfb5sm1696815pjh.21.2023.12.17.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 09:41:30 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] appendix/questions/after: Use \qco{} for quoting code
Date: Sun, 17 Dec 2023 09:41:16 -0800
Message-Id: <20231217174117.6714-2-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231217174117.6714-1-sj38.park@gmail.com>
References: <20231217174117.6714-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

after.tex is using ``...'' for quoting some variables of a code snippet.
Use \qco{} instead.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/questions/after.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index c165eb0e..d6b0dfdf 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -13,15 +13,15 @@
 An important non-intuitive issue is that code can be delayed at
 any point for any amount of time.
 Consider a producing and a consuming thread that communicate using
-a global struct with a timestamp ``t'' and integer fields ``a'', ``b'',
-and ``c''.
+a global struct with a timestamp \qco{t} and integer fields \qco{a}, \qco{b},
+and \qco{c}.
 The producer loops recording the current time
 (in seconds since 1970 in decimal),
-then updating the values of ``a'', ``b'', and ``c'',
+then updating the values of \qco{a}, \qco{b}, and \qco{c},
 as shown in \cref{lst:app:questions:After Producer Function}.
 The consumer code loops, also recording the current time, but also
-copying the producer's timestamp along with the fields ``a'',
-``b'', and ``c'', as shown in
+copying the producer's timestamp along with the fields \qco{a},
+\qco{b}, and \qco{c}, as shown in
 \cref{lst:app:questions:After Consumer Function}.
 At the end of the run, the consumer outputs a list of anomalous recordings,
 e.g., where time has appeared to go backwards.
-- 
2.17.1

