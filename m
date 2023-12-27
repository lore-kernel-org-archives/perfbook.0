Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43C20E3
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxDPaYzo"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bbc7746812so30241b6e.2
        for <perfbook@vger.kernel.org>; Tue, 26 Dec 2023 18:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703645403; x=1704250203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRXsmNPZIrF8xWR4qSmHsgRM7t3tCYkjwzKyGyKksA4=;
        b=ZxDPaYzod7nQ//xz28Dx9NaKFqz/di5VkESvB1hqCXM+zuDbYoziEI5+CkDKrByHj8
         x0VOTIvA1fQc71g//Zjh/XWG24EpjOTTa6o1/fC6mHBVHKWi+caOPXMopkUa/BnGYaTK
         57KlT/LcBNh7prwl1hUBwqohvzmAAs7FxLHPJfvS16+vX/SZh+1Y8IR5PwR6cl94iIB1
         s+n9tLg6g7aky7Ff4aDEyt6ZG1j3Omcmlq9SF1bZS+WkJEAQnSFYHioncNnpcxIyZfBI
         g5SJCtkfM3aO40uUn6+raW2Vgr5fdnvn/odpkEkzeUbM0p5TV+XIPqaYimdCvOm3Xeuf
         geaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703645403; x=1704250203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRXsmNPZIrF8xWR4qSmHsgRM7t3tCYkjwzKyGyKksA4=;
        b=RSbxhIdxH/0J+JOHiLxajVt0e+n2osomgxsHuOu8Pdmz67/sHBrb7JSqGqZSIeejhj
         QPPuPqPu4m4pON3yBz3GP8yGWiMqZdAoLldB3uQC1mNw6CFfve73ENmwQ79Ln5mT8lkt
         hEcIFwpz4wblZy9KOP2vG/Mn+4rwBC7BsJzB8/Bhqs0M+IXxg2Qxn+ezz6NNllSlAVXD
         3d4/W3xpw22vLfeID73OpMGqvfgJQx7lBOFMs3BycjjTtaYD+R4ai/sZ2b0rXmjiZooJ
         gFcf7s6RH793LR+SOb+x4ypxbujb2JYZlpxyELyyfNPKqtrwIuQBZgNWgqrqyyJ1Q8sF
         V9Xw==
X-Gm-Message-State: AOJu0Yx8f0HV8bdpiJTHJX8UWySlCzD43HYXVltZ/hF4/Vgc5kkMwt5V
	hX0c7njO9pyAbVKbDPNHEmxZq4flyuE=
X-Google-Smtp-Source: AGHT+IEpyuXfc9CTOZoS7cVoIF7qKO9PT5B7zZWR3jYhQFZX9kX4mKarvLz6XYh6eCI9JWGlNyl9KA==
X-Received: by 2002:a05:6808:1b28:b0:3bb:9b57:36da with SMTP id bx40-20020a0568081b2800b003bb9b5736damr6175359oib.81.1703645402972;
        Tue, 26 Dec 2023 18:50:02 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902860200b001d33c85ce1bsm10739140plo.2.2023.12.26.18.50.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Dec 2023 18:50:02 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E6=B4=B2=E4=BB=AA?= <8241764+zhouyizhousihai@user.noreply.gitee.com>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH perfbook] bib: make ref to git archive explicit 
Date: Wed, 27 Dec 2023 10:49:54 +0800
Message-Id: <1703645394-30331-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周洲仪 <8241764+zhouyizhousihai@user.noreply.gitee.com>

According to our Chinese version editor Yunjing Li's advice,
 make reference to perfbook's git archive explicit.
 
Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
 bib/syncrefs.bib | 8 ++++++++
 howto/howto.tex  | 2 +-
 legal.tex        | 5 ++---
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 6ee50e3b..4f347488 100644
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
\ No newline at end of file
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
diff --git a/legal.tex b/legal.tex
index f443df37..ca21ecaf 100644
--- a/legal.tex
+++ b/legal.tex
@@ -42,12 +42,11 @@ Source code is covered by various versions of the GPL\@.\footnote{
 Some of this code is GPLv2-only, as it derives from the Linux kernel,
 while other code is GPLv2-or-later.
 See the comment headers of the individual source files within the
-CodeSamples directory in the git archive\footnote{
-	\url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git}}
+CodeSamples directory in the git archive~\cite{PaulmckPerfbookGit}
 for the exact licenses.
 If you are unsure of the license for a given code fragment,
 you should assume GPLv2-only.
 
 Combined work {\textcopyright}~2005--\commityear\ by Paul E. McKenney.
 Each individual contribution is copyright by its contributor at the time
-of contribution, as recorded in the git archive.
+of contribution, as recorded in the git archive~\cite{PaulmckPerfbookGit}.
-- 
2.34.1

