Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03345014
	for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 17:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgQRUDSZ"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1fab887fab8so2003049fac.0
        for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 09:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702834891; x=1703439691; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lb+fXzKNGTBzrM0CLOskcCC4P4KPzu5Kojx5NPuuF2w=;
        b=IgQRUDSZ1vvjBW1+gsE0FYQqyS8orjjtu5SX3umu5SBRn+/xZKcTwqIXGLf7LO0G2j
         55N+EN/tLSWvQ8h4PIiU9gNolLaD+V3P/IxL+92gxldwNETDJCIIaKs+VuGR6RtZ4CkT
         zXc7lIDaxx1MEBOCdgWNJpSx76D9RBE2vBp089eNX2LvZgmzEXhHWniXH7kr5zQ5U6Uv
         l7a3AaMBZw8SVFpDRinp5g1TD6RKrducmhSjoEiG5/1M2wp8rLxT+5wnVJSL9s/EvP2C
         ajz/bbmhUDUJC7rGPFWPKDG9yXD919+J8AwcdlqFE9XK88SZLcApLiFpBjMv6IIVAlBk
         xbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702834891; x=1703439691;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb+fXzKNGTBzrM0CLOskcCC4P4KPzu5Kojx5NPuuF2w=;
        b=pYtqiCubbW1icHFJm71llvMv/Rm261oOvKEjQg62KGWsDFvpzoyjxc3ahaCB80J2bD
         mKHrok+YslSEdjtyqiHHz6UyEbd1hIvcZz6DJqzZZDLk9eJC1nVgME1VoQoSobBeCtB6
         KtCwmxFWo2WKy7Ehd3/EeATLBk1KFF3rOD1ar94J3MweSJsrdmQ5aOQ3VNL001wyAAVM
         vxtwm9HMW2dUocES0xe1/pYYtMLfTtWTzdEMBxXQ+Rler/F9ujGBwNeIsNTZoA+sKlxA
         ziGehejlqcmF0DpyPX+5GFB5Qh5OsLQVmMforzP5MimJkdFcvwZd0GlyBofZIK5kmHWP
         6/aw==
X-Gm-Message-State: AOJu0YxDV23rC1XYukPr5EKFjU/ujgyuefu2rWowOcjMFfXurU5kT14j
	P4bZkxiY+lg8gZ5zTFTI/5kVHMFNsReSrA==
X-Google-Smtp-Source: AGHT+IHXLNkMQYJwFsM1fatoZgOtL16PyXXKxwgKdhBnzadlBA1T/ugrfTx9hGVftjuBVAjTcp6Y2Q==
X-Received: by 2002:a05:6870:858d:b0:1fb:2f58:f1c4 with SMTP id f13-20020a056870858d00b001fb2f58f1c4mr18603581oal.48.1702834891466;
        Sun, 17 Dec 2023 09:41:31 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a195d00b0028b6a72dfb5sm1696815pjh.21.2023.12.17.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 09:41:31 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] appendix/questions/after: Use \co{}
Date: Sun, 17 Dec 2023 09:41:17 -0800
Message-Id: <20231217174117.6714-3-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231217174117.6714-1-sj38.park@gmail.com>
References: <20231217174117.6714-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

Some code snippets in after.tex are not enclosed with \co{}.  Enclose
those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/questions/after.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index d6b0dfdf..768888ed 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -45,7 +45,7 @@ e.g., where time has appeared to go backwards.
 	Here are errors you might have found:
 
 	\begin{enumerate}
-	\item	Missing barrier() or volatile on tight loops.
+	\item	Missing \co{barrier()} or \co{volatile} on tight loops.
 	\item	Missing memory barriers on update side.
 	\item	Lack of synchronization between producer and consumer.
 	\end{enumerate}
-- 
2.17.1

