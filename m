Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CE6105
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfhnBRZT"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5c239897895so1296463a12.2
        for <perfbook@vger.kernel.org>; Tue, 26 Dec 2023 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703658979; x=1704263779; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3S44dzzri8HTG2y/VcoFeqTXODoKtX9W+zUnKT8MmY=;
        b=WfhnBRZT/CjwdhLgvsm5x+JIbo9WkbVskCLVpAM7EbsAFT/99e2I8VnyZ5Z5Tp9da3
         OXDFvzoD8oh4Bby7jVt1KXrgDKFlxF+3T1TSOy3E90XIXBbZXLELwqbPLQrsyZd15RtI
         VCMYdLgi7GxDuao6EAICSfa+jSf4jpkoPrKfK/AkSik+HTtDkLymQLkOp2D4lrB6XftQ
         nQoHkr+/R9WGsyfU/NtHOOt71GOidkfn0PDT4zLirdiUUp2O+7RzQmHl/kJ3sfl5eFtp
         peXD8j4jcYa7IJqGw5XIK/ivv7IUsmdKmLSHnfxoYhLJ4nEluIYEKf92mNMjJERwLhgI
         Nd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703658979; x=1704263779;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3S44dzzri8HTG2y/VcoFeqTXODoKtX9W+zUnKT8MmY=;
        b=mRnL58skqApOqNvX3NPuo+SRjsyZDj8iZvaI/fuCRWl4SVItqoP4cyV/wjCwpnnjcw
         pKo04AzAMLmaDM9FIwvp1RCqhoh0v7HxnFsrTEQU8r1m9GJVRhfGfU8Jt9OfDmktV4vw
         pSBhJAle7cihHLtjHDMf7LR3oWWrpOYiQ9BlUYahW18K8eYiZEpS/GNNQvk/iLo8P/Va
         67cAA4f2kW3dcnvxQivgxTKpQkhkeJH710ZsSyQPL2bgCVYPcJIOlxTck9hY4bL5tF7U
         ak5emhiz9rtAERddqRF2PfxOpeafyC2Eq/rwX6AgOcygtupjdhwgGLyhtchXdNakzL0f
         rpzw==
X-Gm-Message-State: AOJu0Yz4B5erECpc3htiDo35Qt3UEuLhZKJ1OKwFnx5g+iP9kVBrciyA
	LHbwHMU97m8fISaOZqTERptQa3IoA4kpLg==
X-Google-Smtp-Source: AGHT+IGUqg+/4RZSKEniEDVwUK1VYjqrQVxX6ZvOAmQd/J3S1Pb3OhiFsWL6cOuFvN/BjEmAQwOp7A==
X-Received: by 2002:a05:6a20:12d4:b0:18f:97c:4f43 with SMTP id v20-20020a056a2012d400b0018f097c4f43mr3463109pzg.79.1703658978967;
        Tue, 26 Dec 2023 22:36:18 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id p4-20020a17090ad30400b0028b6759d8c1sm9165511pju.29.2023.12.26.22.36.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Dec 2023 22:36:18 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH] [PATCH -perfbook v2] howto: make ref to git archive explicit
Date: Wed, 27 Dec 2023 14:35:54 +0800
Message-Id: <1703658954-11210-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that reader can easily know where
"git archive" is.

Zhouyi Zhou<zhouzhouyi@gmail.com>
---
Hi Akira

This is version 2 of my patch "make ref to git archive explicit".

I fixed the problem of version 1 under your guidance.

The idea is originally proposed by our Chinese version editor Yunjing Li, but 
she was too modest to be a patch author.

Thanks again

Zhouyi
--
 bib/syncrefs.bib | 8 ++++++++
 howto/howto.tex  | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 6ee50e3b..63a7a8bc 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -2025,3 +2025,11 @@ Parallel Server on UNIX",
  Month="September",
  Note="Linux Plumbers Conference \url{https://lpc.events/event/16/contributions/1226/}",
 }
+
+@unpublished{PaulmckPerfbookGit,
+ author="Paul E. McKenney",
+ title="Is Parallel Programming Hard, And, If So, What Can You Do About It? Git Archive",
+ year="2023",
+ note={\url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git}},
+ lastchecked="December 27, 2023",
+}
diff --git a/howto/howto.tex b/howto/howto.tex
index 55270cba..e7cd5f3c 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -226,7 +226,7 @@ Here are a few possible strategies:
 	only a blank sheet of paper.
 \item	If you find the Quick Quizzes distracting but impossible
 	to ignore, you can always clone the \LaTeX{} source for
-	this book from the git archive.
+	this book from the git archive~\cite{PaulmckPerfbookGit}.
 	You can then run the command \co{make nq}, which will
 	produce a \co{perfbook-nq.pdf}.
 	This PDF contains unobtrusive boxed tags where the Quick Quizzes
-- 
2.34.1

