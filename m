Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=MnGJjq8m4BPjTFY7OUVdpcyue9NvD45JxOBuK9YnK08=;
 b=JU7JD5FmJ1iHCq3ZVT1PJnZ/lhjfEFa56fAkhEfE8Uo2K+yymy2rWUAGpMh3DZ8EhM
 sgYd3EB/R4oilfTRIdYiqQt8M+AASP1Lolxu/GVedy9gkkHBmE/7ETb8TcNhvNk3UyiG
 +Tg41qKgAAWBlai4PKZo/na2vJ7jacwSwHe97Vtu6Fq6NwE8ZiKuI+RoA7+ckTXKKUv6
 KVgoDPQZJd98KiTY06jJfgphVaqmiUwRx2/xTdZt3Ut1ihYWeupOvWnJ8cAyH0k+o1Gq
 Krmj90Yopm30oeZ6D2bGZb9OOGa9CzV4u3dhFFQjtSJIZ2di12+APFLutz7UKvOGGSmT
 VF7A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Use 'small' font in caption of code snippet
Message-ID: <dad58b29-1422-53cb-b2ab-98b060d5fed2@gmail.com>
Date: Fri, 29 Sep 2017 07:42:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e1a3f7e099581b811ea51ef20b27f019b25edee4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 29 Sep 2017 07:16:07 +0900
Subject: [PATCH] Use 'small' font in caption of code snippet

As code snippets use "scriptsize" font, the "normal" font of their
captions looks too big when placed just above the code in the "ruled"
style. Using the "small" font can reduce the size gap.

Also use colon as a separator in the caption as the same as those of
figures and tables.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook.tex b/perfbook.tex
index 10346c7..84e48eb 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -27,6 +27,7 @@
 \usepackage{subfig}
 \newsubfloat{listing}
 \captionsetup{labelfont=bf}
+\captionsetup[listing]{font=small,labelsep=colon}
 % \usepackage{breakurl}
 \usepackage{graphicx}
 \usepackage{rotating}
-- 
2.7.4

