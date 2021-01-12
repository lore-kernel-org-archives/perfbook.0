Return-Path: <SRS0=JkcB=GP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=HCpECo7uMlf8NLe3gHFdJRaFnnZMS1cWpu//Ja0g87k=;
        b=S0hGWFrY8VmVQPlnOnje/BOvZZGEiwdZh7GI9poMJeCyw9NNBi/NWhfiW4yRUfa0EN
         mRFaD3O+1tsayud9O4yqT+P0JWati3DtfgXUYa92PSrCbSy+RhEdnkVcgAHbDIuOLhHN
         6YIZCzIVUDVozfkYQMljm2g6AbURNxLWy9lvLgAB0fre0AUJVz+1QM3IIkaa7M54ba5R
         8sb4Jln+w6OHMsgXhsBqiwI+FKKF+az12gUM+NBXJh8ii34mizYMIMKe8JQalQMcLAfY
         PAUzAjwm1Nm0wqb3q2KEYhXxR+e8bz00umTcUO7FJ72VDX1k+dInxHgpOiDKgNzseuau
         9AGA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] cpu/overheads: Remove redundant words in QQA 3.8
Message-ID: <a92aaa31-21f6-033e-1d66-a4b3eac1bdb2@gmail.com>
Date: Tue, 12 Jan 2021 20:21:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7d2c26e77323fdab2c109d9bb01460ecdfd28d1f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Jan 2021 19:44:35 +0900
Subject: [PATCH -perfbook] cpu/overheads: Remove redundant words in QQA 3.8

I had messed this QQA while rebasing commit 4c7151455e14 ("treewide:
Renew format of Quick Quiz macro").
Remove the redundant line at the end of the answer.

Fixes: 4c7151455e14 ("treewide: Renew format of Quick Quiz macro")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Commit 4c7151455e14 was sent as a pull request last March due to the
large diff size.

I feel lucky to notice this error during the -rc days of Second
Edition.

        Thanks, Akira
--
 cpu/overheads.tex | 1 -
 1 file changed, 1 deletion(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index a6f60a5d..87d700dd 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -500,7 +500,6 @@ cycles, as shown in the ``Global Comms'' row.
 		Especially here in early 2020, in the midst of the
 		coronavirus excitement that is keeping store shelves
 		free of toilet paper and much else besides!}
-	those you live with when appropriating toilet paper!
 }\QuickQuizEnd
 
 \subsection{Hardware Optimizations}
-- 
2.17.1

