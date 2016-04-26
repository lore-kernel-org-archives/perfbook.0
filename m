Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=d8DyLGdz3MpzypfIQicG1+liIUxe8qwbUlK9+ONpya8=;
 b=HLv3bG9sRoYGMV7stcBhzabE8jtEXrKWxOpvRcEHQJ550IQJfhdmcQjdz9xZzSbr0z
 kbq0b0awcqBLcZUmz8qXF/jNRgurnkDy9LYAkDtjJvsbYsywuwdnO+MA90De/Je7gWwo
 YyrVygHvglmfBz2TbWdqc7HvzZqPj0EDoC1k6AlQDxMarhBo68+RzfcaurV9kctoF40v
 1pV51MJo2jmhd/uXqkzhwPTcs+MsfU0LK3ZGojYtBaBAZshFRX5zirgeLay+94Tb4aln
 XUMN0M1wC91fY/RhGSxt5vEHpbMW0VrlT2TTsXifX28N9B/1Ec4em4/SvX0OIyVvVpHv
 nXyw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] count: Fix missed context adjustment
Message-ID: <e25adb42-263b-b61b-b462-36f26ad1cac2@gmail.com>
Date: Wed, 27 Apr 2016 00:10:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 433278e9a753e4d195ad57508ad15e15859f92f2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Wed, 27 Apr 2016 00:02:33 +0900
Subject: [PATCH] count: Fix missed context adjustment

In commit 3540c4cce34d ("Add verbiage for signal-theft limit
counters."), Figure {Atomic Limit Counter Add, Subtract, and Read}
was split into two figures, and the first part became Figure
{Atomic Limit Counter Add and Subtract}.
However, the decription below the figure has not been modified
yet.
This commit adjusts the context.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 count/count.tex | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 2c9f071..df76035 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2195,8 +2195,7 @@ the result.
 \end{figure}

 Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}
-shows the \co{add_count()}, \co{sub_count()}, and
-\co{read_count()} functions.
+shows the \co{add_count()} and \co{sub_count()} functions.

 Lines~1-32 show \co{add_count()}, whose fastpath spans lines~8-15,
 with the remainder of the function being the slowpath.
-- 
1.9.1

