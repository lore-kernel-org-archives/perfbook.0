Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=MjgtkkbtRiJ4mKGTBESiVkWziOk6j/+a1y5RNd9qv+I=;
 b=I4ZIC2ui/pXjV+9BIdfKGx2+X6eHiHYojWmozCPdRRb/L61XRxpIKvQta4G0+/C2K0
 NyU4oQ8/0Vh4zxyIYrFMqoshBhy5YgUt3ufSapNOE5IF9wFMiK4qW80W7oiiJvTOjR8r
 OFkHDpEzz97b1d5wRtnxL2ToaQk12gZSVMDXxH2Mk/er44QkDdDQoDtRsijHglCRIN/s
 WxkSvDEZDKrZJ/kGyfzdf5MLLnv/yyKG5hw+841uqEgtaevlBtiSkoW2LGlcIdKAeN0O
 pM3JYRL1NcO5yMpJrkzAMuRGAcR+V61HZ9rIuJkBeM5uX+pvy/mdZE5vpGNArmt/OJpu
 sX2Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] howto: Embed mailto: link into perfbook list address
Message-ID: <082e1ee1-267c-7143-5740-0f6a0ac47b16@gmail.com>
Date: Fri, 30 Dec 2016 09:17:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ad87c108ddaea7b5521ccfc9b57e8aa99fb20258 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 30 Dec 2016 09:06:12 +0900
Subject: [PATCH] howto: Embed mailto: link into perfbook list address

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index b48ce3f..9a8604c 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -394,7 +394,8 @@ Other types of systems have well-known ways of locating files by filename.

 As the cover says, the editor is one Paul E.~McKenney.
 However, the editor does accept contributions via the
-\co{perfbook@vger.kernel.org} email list.
+\href{mailto:perfbook@vger.kernel.org}
+{\nolinkurl{perfbook@vger.kernel.org}} email list.
 These contributions can be in pretty much any form, with popular
 approaches including text emails,
 patches against the book's \LaTeX{} source, and even \co{git pull} requests.
-- 
2.7.4

