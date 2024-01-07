Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4213ACD
	for <perfbook@vger.kernel.org>; Sun,  7 Jan 2024 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9s3JI+b"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28bc8540299so495388a91.0
        for <perfbook@vger.kernel.org>; Sun, 07 Jan 2024 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704646893; x=1705251693; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpnOxN8JO9b1sMfrrE739Ytq80Sr9C7KdFIwC2oXFrA=;
        b=I9s3JI+bNDpfnimQdg+8MQIGVMQ1wnRMVIE+OU+xqqsdU5lqBlB+3KR9UvhGwOBNL+
         dzMGcyLJwdzTpmxKWFhhwCZWq6PljHR0827c+6nNk9qv1kZBa9BXahSg6ZT34noNeXtd
         YXl05cXRbsIS6y6M/qjCJ6n+9dt/HRHw5Qh1PYY5TfO8F+IM2Q4/U8k6K4ZKxyHz9Gm5
         2VW3Rnbl0bCrsNwW5sginslFTeBhFUuSCgxar7TBDoO/pV9ukoEcmh3HSlZxtJHSfuLU
         XoRjY6BS5NxzK2g1/T4RduiLOyBqARFhH1DDzeWiTfaUznu0yFBdn0BAYnA/5ffLktYo
         uXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704646893; x=1705251693;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpnOxN8JO9b1sMfrrE739Ytq80Sr9C7KdFIwC2oXFrA=;
        b=WTZIdS9KvnJRYQIYVRjaIC5zt3mK9f55gwcbhwO1DIUNniZDzt2Uw39ZBFMaReEuWq
         tToiLzr9krE6RNEFY1bKPl4uLXhDOj3n+A5PdAmfsjjl9O2UECc3G/tMJkmEirJQNLlw
         z0R/fhEc5e5YoEkaOHFMKq9bnvLx7Z2sklHGrjXiUvo6MWQN3UljbPyGnjGOojsvWypk
         B3uEr0QZ7Z1lXAPKEUBOFoffhmJyaZ/qPEcsJp6uqlgNh4WjtoMSW/RphQhLMTUgBv26
         mNbyUvVjczrdxXQA0nT2ofSD/O6JnGkqOt9ixBAqiSAP6n9QjQoDxEAz2j2U218AthxJ
         +CYQ==
X-Gm-Message-State: AOJu0YzPg7vnL1uHo4E7K2iUrFMkXLoRtRTc5XwNsssTHJYCfb0m85hI
	CiqaXSfp/TWD7V60NZGBJybgg6XXEHE=
X-Google-Smtp-Source: AGHT+IHfqmEKIgrUXA7mU6gh4NhyKre5xrIRSQ5Aq2RMhamxuronuEHybwZARnYm1nXNzb7eE4A7aA==
X-Received: by 2002:a17:903:110c:b0:1d4:cea8:5d6a with SMTP id n12-20020a170903110c00b001d4cea85d6amr926070plh.4.1704646893471;
        Sun, 07 Jan 2024 09:01:33 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001d3f03c3460sm4608469plt.158.2024.01.07.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 09:01:32 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 1/3] appendix/toyrcu: Add missing parentheses
Date: Sun,  7 Jan 2024 09:01:20 -0800
Message-Id: <20240107170122.18010-2-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240107170122.18010-1-sj38.park@gmail.com>
References: <20240107170122.18010-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

A sentence on toyrcu.tex is missing enclosing code with parentheses,
unlike other parts on the sentence.  Add the parentheses to be
consistent.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 27c11968..1634953e 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -391,7 +391,7 @@ shows the read-side primitives of an RCU implementation that uses a pair
 of reference counters (\co{rcu_refcnt[]}),
 along with a global index that
 selects one counter out of the pair (\co{rcu_idx}),
-a per-thread nesting counter \co{rcu_nesting},
+a per-thread nesting counter (\co{rcu_nesting}),
 a per-thread snapshot of the global index (\co{rcu_read_idx}),
 and a global lock (\co{rcu_gp_lock}),
 which are themselves shown in
-- 
2.17.1

