Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te2mV8C6"
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AD2134
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:25 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2867ace9967so290061a91.1
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537984; x=1702142784; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+T5DAqFI4/Rt7TCiumJKip49Agoqf7Jxj6pyct/BMMk=;
        b=Te2mV8C6aRm5gJrPIYA+ZasOAQd3r7ti2D7Mn8yAtrv7h+5IqS8Rt2QACWoQuD0Eeh
         4JpFjTu7Zug0JiuZzG500B0m7WCVLWp3z+M3NrpqT8O4LKsytGNCWDCYLwdJ0A6ZpNwH
         4BKCncFyHa6lawxPAcCK8/TFgxP/3EUFcKGoFck3ZqfJXNNQ+G2wmcRSpSNOWAAsPBXH
         uq7kIIVgvDifpZ2Mr8muJOaZCKooJ7ap99Xk0nRPMQdrs8u1YvXs5xKyXv46DUFW7PMu
         jbb2K1RvLLKbZSyqTYsr6VGPss1o+mD2f7Wb1IwnkIS6kWC2NNtaWaPca864GZ91oXee
         fGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537984; x=1702142784;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+T5DAqFI4/Rt7TCiumJKip49Agoqf7Jxj6pyct/BMMk=;
        b=KvSAyq2i8i6rJ760FvtWmaUdcvGxITK8u4LIJWYZQ1nUGBbT3U7uJM1WqppxKLZnB+
         cWrJiHfZGQOkygOXcD+vwhYjisNH6nd2eJ5/VJ7UazceqfUpW7IcV3x9e/+S4zScJEBd
         DzzcWYp3Oc+lqDqU3N9hmVUnvY1xyloUUD84xk9QYzNnI76mIEzkXin2KrPUIKpNJCdV
         mS0hh2NzZSK/eDAutkfPO3tLJr/crdlzJSYIUtnLqkEQFyPVF220UjMbziBJBswJDol9
         DHU/KiWpEQ3ACY9Z4etkrOy33dDJITkawVSZz54AuW1Lau37MC8ndVR5/kUBS+Uc62C8
         mCoA==
X-Gm-Message-State: AOJu0YwTOlGOKpmrlOWlRDKv6UVitJBND3+sBr86/FxSKsz8J1uzFCYs
	cHBnEEstBWfSW2atYAKNwQs=
X-Google-Smtp-Source: AGHT+IHdQ2Ud9SgSToTG8mPsMP84sVpC/fqpZHyCDbJsyrhnJBPPQCE6BHYRdSWG1cW7KbzGvGVuyw==
X-Received: by 2002:a17:90a:8a85:b0:286:6cc1:3f18 with SMTP id x5-20020a17090a8a8500b002866cc13f18mr1044317pjn.79.1701537984629;
        Sat, 02 Dec 2023 09:26:24 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:23 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/7] future/htm: Remove unnecessary extra 'and'
Date: Sat,  2 Dec 2023 09:26:11 -0800
Message-Id: <20231202172614.20239-5-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

A sentence in future/htm.tex is having 'and' unnecessarily.  Probably
just a typo.  Remove it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/htm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/htm.tex b/future/htm.tex
index 1404169e..7a5e4ed3 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -582,7 +582,7 @@ semantics of locking, but loses locking's time-based messaging semantics.
 
 	On the other hand, it is possible for a non-empty lock-based
 	critical section to be relying on both the data-protection
-	and time-based and messaging semantics of locking.
+	and time-based messaging semantics of locking.
 	Using transactional lock elision in such a case would be
 	incorrect, and would result in bugs.
 }\QuickQuizEndM
-- 
2.17.1

