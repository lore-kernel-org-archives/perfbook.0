Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841832D787
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWpGC+Fy"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-58a7d13b00bso2923795eaf.1
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703669689; x=1704274489; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dVYMq5a0GevCnW1zVO/1PdCmBGIXbk0CKwIw3fnKLk=;
        b=FWpGC+FyRDUtb3JfXqp5YDThrW6vRMoLKOAeQsBs/U5xQ/MXlo3FY4EiWtwLxA6Wql
         ZsbrRy1dqjPxHsFAq6QWkor8vNQwo0Ck6R30zX3o/NYmW3ii2vsaLMsGJMhitbAvcJmY
         2xLvsTxbZfYsW4aZ8Vcgxvve+mCTU7ePx5Ufe0HSEGPGitcaDIKLcIEB/pJ9Tc3DjXqA
         IG5vHfgHAACSaPjhHd3YnXv3h5yVowcgi1E4pXa+huYsUlBpqRzOVq13GbUXOr+NzNWS
         aeBw+c/RlDCERRdI9FEgYJ5N80OTGZRAZr9qwVTQuXoUP8FIajpM51LJWP/2Qgrcxz31
         XaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703669689; x=1704274489;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dVYMq5a0GevCnW1zVO/1PdCmBGIXbk0CKwIw3fnKLk=;
        b=plHgb4sqv9EG4ur9qbkZ2sgtljWP/d8VsHYPE3rBOOiPKyjPFgFXdkqIcll7L6Tvv4
         d2Y1jiXVdFpsZ6mlbwvcL7FBxAslaHMX5Q9EQ1OwRjYCfiNSuhfd2DfpIRBvk7XAp0cA
         OskRWr+w3oQsdLGiR0zhDLB5qbsZQiN2abf4UnzdUr3nhZpmc3yvBtkf02Ba47JzBOef
         Ae5lTzEtiG/+lPyyTQYBnuvuFluPeNa+mjW23sdMbeJZIm0cnYsWpCsHl1SFhhNnxXIZ
         JiTosIEJJnnOOvxibnAl3ooBQspZuQ44zqmM60OQbSw107lKbp4IR+S8SM6F2fvb70T5
         LIig==
X-Gm-Message-State: AOJu0YwFKiP0svYEeQ9oJeqYAR42/bhdNhfSY2QpcrXrswpN/LfT8+R8
	v1QSUYH73q+oFSuaL3Pl9wc=
X-Google-Smtp-Source: AGHT+IFD3HrYjMOSM7F1K5i3OSIxqyLELCnnD4iL77zya02C+g8EC6TjMdDz1mPdfLR6IWjoBGVr2g==
X-Received: by 2002:a05:6358:3a02:b0:172:ea55:1ae2 with SMTP id g2-20020a0563583a0200b00172ea551ae2mr10550037rwe.37.1703669689424;
        Wed, 27 Dec 2023 01:34:49 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id p2-20020aa78602000000b006d9ac45206bsm6456556pfn.206.2023.12.27.01.34.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Dec 2023 01:34:49 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook v4] howto: make ref to git archive explicit
Date: Wed, 27 Dec 2023 17:34:25 +0800
Message-Id: <1703669665-21764-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that reader can easily know where
"git archive" is.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
Hi Akira

Thank you for your valuable suggestions and guidances, I learned a lot
during this process ;-)

And I invoke make -j 20 in my ubuntu 22.04, everything works great!

Our editor Yunjing Li is still too modest to provide her email, sorry.

Thanks for your patient and hard work.

Thanks
Zhouyi
--
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

