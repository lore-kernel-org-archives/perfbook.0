Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A99522C
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgcW20wK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d420aaa2abso12093245ad.3
        for <perfbook@vger.kernel.org>; Tue, 26 Dec 2023 22:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703659174; x=1704263974; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYFXa2mdyxuQV0pl2aPse2XWmJWUqcs8va9ZqMKou+Q=;
        b=JgcW20wKk4HDivTC8pFWhbWwJndNZokUiMlIy6mmxBMoMRiLXDWdFQB4tElUPXPenv
         miv71ffFKXndJe2Cq71BNdT2pBxIsW3neeWaihnNDPPryAfvt2om5NdJoco8It5rI3ud
         atQgaVAfQKLZ9UeBCbkLryYnO0eBmd1Nz8MmOJLTneWjvhXaFnAI8v1yXBdWphtpONvj
         FRaO/Ir2HN2NvQ5I4OkyI9m8BQcgXpbv6YPVCIIV1qsY6lJgnD0lNUGZUVvtHg1AVIvg
         z2q2LyzDgXIHylYsxEn3iPehVDtTIyxlEtPef9HXI/Uk3VK5yOqAUCxw+cP0EMKZ7/CB
         b7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703659174; x=1704263974;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYFXa2mdyxuQV0pl2aPse2XWmJWUqcs8va9ZqMKou+Q=;
        b=YiiO73g8SGpQth6aZFcN5hSRNS7YQDOdUPiHOtFoWr0pXt7SNr7Nh2nmmm+iY4XiD1
         Dvz3F55xTbCUA82tVcfE6NaLND36yIzXysgTxmA36xUKd3v0bSRcr1CDY3dLpDoZHbwT
         f/Ys4wZOPCKxAVSffXil9H+92QO4Mtn3hzXTWq9gAeHeR8DgmWeSfCBi29Fy4UfJy5O3
         a5FtWpS8on+d51wqUKv/z6VVIeSMCuk0gDZD1lhUEjhfY6fUGNtlwndF2AgVMZ2gmqJW
         KZK7ALxsfsPeSUc6oMp1u+q9/DLABGyL5A+GRZKDo2OF9Nz+YpXaJ3BOugfsGsWx8dmu
         pCMA==
X-Gm-Message-State: AOJu0Yy3DTJHcSAFdpGNZZJ1QNJFsxzZnPdlOlB7/Aw8PuZ56iw8Ngx2
	23YN30WU5Bla44R0rX/T70A=
X-Google-Smtp-Source: AGHT+IHfASxIPYFxBLuVXhHYwkhqtzK6G9z6cgg0kdAlr0UKe3y1zCPVi/pBfAsfL+UMNDHyPCXrfw==
X-Received: by 2002:a17:903:2614:b0:1d3:f33c:e2ae with SMTP id jd20-20020a170903261400b001d3f33ce2aemr3303289plb.3.1703659173934;
        Tue, 26 Dec 2023 22:39:33 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709029a4600b001d458ef49f7sm4752817plv.107.2023.12.26.22.39.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Dec 2023 22:39:33 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook v3] howto: make ref to git archive explicit
Date: Wed, 27 Dec 2023 14:39:20 +0800
Message-Id: <1703659160-11466-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that reader can easily know where
"git archive" is.

Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
Hi Akira

This is version 3 of my patch "make ref to git archive explicit".

I fixed the problem of version 1 under your guidance.

The idea is originally proposed by our Chinese version editor Yunjing Li, but 
she was too modest to be a patch author.

I have forget to add "Signed-off-by" in version 2 of my patch, sorry for the inconvenience that I brought.

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

