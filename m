Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNIrW77P"
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CC611F
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:26 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cfd78f8a12so14314245ad.2
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537985; x=1702142785; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oKpABs2FizGJm2drpOyK/pzosQ6yQNDwx/81M1DUrvo=;
        b=FNIrW77Pr/Ssn/w92aaQH5Qj9OVvI56FAIgwd2rFbRZptL4gENZtagdy5DZfXvNXjB
         Y5j8fpZkjzabfdD3Tb9nmwiNaO84r4MSKIJAN5b4YXqbJ9KVr1J7bUGS1IeUky3aYJfT
         HvzlXql8zBvN3j3pZ6pM+wqPC/urgDVsZ5ZhvNP/Llfz2ATgiLb3ilgtYP/YxeuX0mlN
         7sQNXbfSVMC/MFLdfSIL1/uPOYe3tFepJJVePn5wnHVa+nokfn1+1Lyw0kMcDsKnDn1G
         fPbAUqN7o6XW6aTsp3GeJs1ukp8CBsWcccGqRoeJIqjaG/ietZrqbFF+IqEWgWjRkQKj
         x57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537985; x=1702142785;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKpABs2FizGJm2drpOyK/pzosQ6yQNDwx/81M1DUrvo=;
        b=DzZziA3G2L1+qKXHEgq8qTNA2/jbvOTJ/vjVoQ+L6M74CC03+hppTcIrScZ3J+v+Zv
         cgdVthwy84UeJ7Ij9ZCs6hQ3HGpewY5Ky0qIzWEVoX8oSobNvhQyXHcBF9AM+Gh6XKwK
         qvCuc4qxCaVnsxXab5kbMaRGWdOXKGOV2jn1rcb/fqfDv8RiP8EIQq7KXMocz8jKd7P6
         dDE+ww91BuhoWiddFoVZ0Wk+5TX/8t9q6TkFTwclRlEY+BAUtWnhrNa1tVpzj3oUbt4/
         wTqZc259CXfc7ioL99Lsv9d7Rz/7kCpfov46gE4dY4qpp2ZC6WfE+04PmBmB/EWzVmVb
         z35g==
X-Gm-Message-State: AOJu0Yw4V8v+VEzVkIsKS9tCaBhYOWzhLO4nwG+mLAolZ7CTSML3keEM
	MYJGRT8KzFTx4X2BF1jkd+0=
X-Google-Smtp-Source: AGHT+IHPco1kid26j9G671RbHRKyYpONozXSCLX6VcJINWtjLrdzCQl6faHmDqXeVBOKr3k50Axw1w==
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:e2d7 with SMTP id z12-20020a1709028f8c00b001d06ffde2d7mr1485249plo.113.1701537985601;
        Sat, 02 Dec 2023 09:26:25 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:24 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/7] future/htm: Use \co{} in favor of $$
Date: Sat,  2 Dec 2023 09:26:12 -0800
Message-Id: <20231202172614.20239-6-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

A sentence in htm.tex is using $$ for a code snippet.  Use \co{}
instead.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/htm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/htm.tex b/future/htm.tex
index 7a5e4ed3..fd5a81d1 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -628,7 +628,7 @@ semantics of locking, but loses locking's time-based messaging semantics.
 	When worker threads complete their feed, they must disentangle
 	themselves from the rest of the application and place a status
 	value in a per-thread \co{my_status} variable that is initialized
-	to $-1$.
+	to \co{-1}.
 	Threads do not exit; they instead are placed on a thread pool
 	to accommodate later processing requirements.
 	The control thread assigns (and re-assigns) worker threads as
-- 
2.17.1

