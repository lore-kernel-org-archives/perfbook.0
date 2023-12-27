Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF314436F
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeemVjEe"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35fcd6f8accso22414775ab.1
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 03:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703674812; x=1704279612; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s2AE+vckiV9tEmU4b7zTY1/alPw76LojN0Fyyioipg=;
        b=JeemVjEeMH78cVmzzJ+Of/yttwdxMBICfwoVVPD9xY9pHqNl0YetqkMoNcWn2oPsdi
         5SpzPtFK3Q+WAQs8EYr09Fm+qH13M+ZVfCYGB64o9vlwcbMNiaDQqShDIwKGeHeFxgtY
         KsfmOhCcwnLzz4jCjBISZsHXU93UtqSGd1XB6gNwNlq0hckLo6Udx1rv3oAjkA85Ydxn
         InZSmXg4nESTtcfIpJs2QqT8uFvDlzMYGCF1StKZ3P5CIvuj049eQw6b0A+SVCkqrlaW
         qQu8g/2fs++tYNbFQ4QmQpdMy7IqDXHcN4CuTrqsHxVMZuUEWyeJKrfWz/cpQVKKyXIY
         QVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703674812; x=1704279612;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2s2AE+vckiV9tEmU4b7zTY1/alPw76LojN0Fyyioipg=;
        b=qo592kw/eNjI/56ukXxXsJbLYQipALyxmCklUn8rrgLOinXjLLFRwcpBSgSuIgyZEd
         i18RYNOFdkI83KismqeWNfAsfqeG+rBRQbApDmZLzFe8x2Ipv4ox88D4UvD21WGhWzpR
         k2N7+qUxg7coYv7W6cxZYjhg6hLNyEIR0HsxTwIO+SmUEQmgiUTsaN0yq0+wJexTNL4U
         3EoT/j+7tc7nBIWJ3AF1UEUa/0uQ6OUEJ1KMC0EJkrBqTC+TAp/MbckTUtXe6xRHA1iT
         +ijfmlfvM0SX4x3Lb2dxKc5ZGxToIz1SYD/NYlLH9Nmxj4+lvQZIc3E0PbIeBA7b4Th+
         ACnQ==
X-Gm-Message-State: AOJu0YzD2ZSncg5nRWdWrKLHGHjohH2ALzGeBp9a0IZvMTwgzZJJWh8b
	5BWm5wQpZbvJEe0mNkE7IF8ciH7QszSuag==
X-Google-Smtp-Source: AGHT+IFmKYer4bCMNiJLw5w4RFYccYjogie1pxsqboBY7FdpeveLFObLDIbXnj9Ozb+hsmMOXYZ26A==
X-Received: by 2002:a05:6e02:12cb:b0:35d:59a2:9295 with SMTP id i11-20020a056e0212cb00b0035d59a29295mr9065064ilm.41.1703674812630;
        Wed, 27 Dec 2023 03:00:12 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id x62-20020a636341000000b005ce53bf5a82sm97845pgb.77.2023.12.27.03.00.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Dec 2023 03:00:11 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook v5] howto: make 'git archive' in answer to QQ1.3 explicit
Date: Wed, 27 Dec 2023 18:59:58 +0800
Message-Id: <1703674798-26270-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Make "git archive" in answer to Quick Quiz 1.3 more explicit by
adding a footnote, so that a first-time reader, who have never
read Section 1.5, can easily know how to clone the Git repo and
build PDFs.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
 howto/howto.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 55270cba..8d678644 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -226,7 +226,9 @@ Here are a few possible strategies:
 	only a blank sheet of paper.
 \item	If you find the Quick Quizzes distracting but impossible
 	to ignore, you can always clone the \LaTeX{} source for
-	this book from the git archive.
+	this book from the git archive.\footnote{
+		See \cref{sec:howto:Whose Book Is This?}
+		for instructions to do this.}
 	You can then run the command \co{make nq}, which will
 	produce a \co{perfbook-nq.pdf}.
 	This PDF contains unobtrusive boxed tags where the Quick Quizzes
-- 
2.34.1

