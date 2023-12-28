Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812711106
	for <perfbook@vger.kernel.org>; Thu, 28 Dec 2023 03:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmuETMF9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28bfdf3cd12so2391175a91.3
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 19:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703735721; x=1704340521; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLzLsNoO7+qYCV7I/qVkX8rWFtmN7CvlQw0nqZKj8UM=;
        b=dmuETMF9wL/ffXLPasjO6j45/maMB1lWey2YavQxvXNj7oQA6UwUN0Ol4MgPbJ3Jrs
         YFC3cv0cBSQIzX8i7O5t/59v4eda4lKr4CcoAiGk4GdYUdyQ0lRruM0/BneIJK8C/5sA
         sS0nfEgg6jB8v2qj1AUNNErg77+Kl7Ik6QfvC9X/qvI49mmQxhdEnkazN/tvFvbSGI1X
         XGZn4bMN8WlIlen1Zr5+H+hshanPJXYRtlgJvD5Ig1BXsSfh13byN6f2mAL0qcMazBpj
         ZIrsXlDw7g8oLsfnZcHeoXFf5HaycH0l6IboU7d+Guck2SLRhnjfr5D11j0FHS/egf5z
         m6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703735721; x=1704340521;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLzLsNoO7+qYCV7I/qVkX8rWFtmN7CvlQw0nqZKj8UM=;
        b=MxbkTmISdyDtF3GkgEBQRHl/X9wBZQ9km/cYJ7Ts6JMlve/O4lq3N64uNlN+AQf4X0
         EPOStG3nm9N9S6JsLpg7OB7Y7vmCnbITZ0PIKViu10XszDRdQD/cIJGJ3wZzZC0L/AYO
         eZiuZ+Z1c/FdN+oepiwDFcOseG2YLLcH39A23JQ7gfu9L7V8uAF7ZSQYQoo2EdPAVWMU
         zJCpFwa7vIkYaDQgJZM/SQCUKBXIvP10HS6/qj5P6Kckma1GX46xPaM1wfLLCFdkVNhh
         67vzerD7YJZ4Gy3CM5XP4TxXGNqydOead6TaV90aF2+8GionoG9Q2P3hw6uxu+/Jk76U
         kvCA==
X-Gm-Message-State: AOJu0YyD6R77hUOHXyMt6bb4GUnRQ3XjbqR81LfDsUp3SKN0D3oQzyJz
	AlTRhNlTegE4y8lEqD6AqZHRn4G2fQlMmw==
X-Google-Smtp-Source: AGHT+IFr8CFKGSeBY5WKjJsAqMqD2dMFV1kUVyyTrAkI3/8KmZAtEQ54Mv7D7UJguw5ePSUogdxLyA==
X-Received: by 2002:a17:90a:ba17:b0:286:9ff9:ab9a with SMTP id s23-20020a17090aba1700b002869ff9ab9amr2978992pjr.66.1703735720613;
        Wed, 27 Dec 2023 19:55:20 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id so17-20020a17090b1f9100b0028658c6209dsm17656056pjb.2.2023.12.27.19.55.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Dec 2023 19:55:20 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] cpu: make Quick Quiz 3.6 more explicit
Date: Thu, 28 Dec 2023 11:55:00 +0800
Message-Id: <1703735700-611-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
firsttime reader know that another choice is CPU 0 sharing a core
with CPU 1.

Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
hi Paul and Akira

This minor fix is also reported by our Chinese version editor
Yunjing Li.

Thanks
Zhouyi
--
 cpu/overheads.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 1ee9c52f..a2ec2998 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -262,7 +262,8 @@ CAS and lock, respectively.
 \QuickQuiz{
 	\Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	shows CPU~0 sharing a core with CPU~224.
-	Shouldn't that instead be CPU~1???
+	However, isn't it more logical for CPU 0
+	to share a core with CPU 1 instead of CPU 224???
 }\QuickQuizAnswer{
 	It is easy to be sympathetic to this view, but the file
 	\path{/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list}
-- 
2.34.1

