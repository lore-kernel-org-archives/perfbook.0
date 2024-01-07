Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2698B13ADE
	for <perfbook@vger.kernel.org>; Sun,  7 Jan 2024 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6e1VUdN"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7fb34265fso52356739f.3
        for <perfbook@vger.kernel.org>; Sun, 07 Jan 2024 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704646895; x=1705251695; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HNAapI6ovqiM/CV/GA5mus095xzp7Zx1Blag0KBxABk=;
        b=F6e1VUdNdvNWJF+24OLmCt3BtdsvbLqod+0UneJMQnPDry45kfDHk2lrQQgRzL/Q/3
         jDCxmRSGQbKKeDmYCAfsOIHvu3knWGL2r+W8Nvyz/Z/LTyCWEdqw+vyKkse4Xdhpfnox
         5XaPPge/tBqY2IDCXHOWnyAeES1++uuaCUtm66VDGqV9kqD6ZzRRv7U/h485cNNhZ82o
         eGJSCGYFUwQJ6fmnTk3EWSOxgSwaG2Pi9e9F/MCzLZ1wdlZKcg8SPxXDCFsUsqWe/fI7
         /L9r5R8DMPsIY/r2EUBn6OlxcLvLQlZlSbJsDc+ZGa76Fmc//NKufiDMVB3XMsiChZVx
         Dh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704646895; x=1705251695;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNAapI6ovqiM/CV/GA5mus095xzp7Zx1Blag0KBxABk=;
        b=Aaxo5j2scToIvAAZV6m3wdUlPZ7e+YVQp9bGoyZjMLlySXP2luNJO8lo/j5KixuDhq
         fVHyojlSDAhFO+sOMJV1mAIoqP8M3JhnskS18sf8elhvA96iY2ED8uUxdx7t7Xiyn1Yj
         BSu0t8QbWasgkVAHCDcDv7NkMZ8+VqRomomOz9Q9MCveVGmSN95voHC/TmBVfTyEVkhe
         CXidA4YJc9UtR8W+xcYoqVhgSGalSnINY9w8l7X4310PwMqedXSlBodBRHbw8aeEltBY
         oxYFlfp+RiILtapsPfj0cIBl1EmYiC6x0PWa60ZZDfssE9wOyw6qF1ytDTHCav62AwxE
         PGIg==
X-Gm-Message-State: AOJu0Yw8bC+ObCslpZ6HMfRQP9hXTZR9CqvKE/yWLrcGP3B5q4r4rNJW
	3QyZgpXRg4DkHK97CIdOqyh82OJWXmc=
X-Google-Smtp-Source: AGHT+IGlnkYNQfN6BGAdqf3oyKl1TUx5xoBoAuVoFTfL5v3gKToAtznezRtsBdOvmHH6/oYsv02Mcg==
X-Received: by 2002:a05:6e02:1d94:b0:35f:e963:b990 with SMTP id h20-20020a056e021d9400b0035fe963b990mr2964420ila.54.1704646895093;
        Sun, 07 Jan 2024 09:01:35 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001d3f03c3460sm4608469plt.158.2024.01.07.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 09:01:33 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 2/3] appendix/toyrcu: Use \co{} for spin tool
Date: Sun,  7 Jan 2024 09:01:21 -0800
Message-Id: <20240107170122.18010-3-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240107170122.18010-1-sj38.park@gmail.com>
References: <20240107170122.18010-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

formalregress.tex is using \co{} for spin tool, especially when
mentionging it together with Promela.  A sentence in toyrcu.tex is not
using \co{} for same representation.  Use \co{} for consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 1634953e..4083f9f0 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -535,7 +535,7 @@ checking of \co{rcu_refcnt}.
 	data element.
 
 	Exercise for the reader:
-	Use a tool such as Promela/spin to determine which (if any) of
+	Use a tool such as Promela/\co{spin} to determine which (if any) of
 	the memory barriers in
 	\cref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 	are really needed.
-- 
2.17.1

