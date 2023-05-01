Return-Path: <SRS0=Fzlv=AW=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682953885; x=1685545885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LRUJ/OCMMS5/Tc4zQv4Q4lcrAG4xwwL/Ti9z2Uh1fk=;
        b=Fx4r6CgocpFAh8lPlL1BocgCr2pgE9FcMEeh84bCLcp6nhohb9qAaiSjGEC5JLO0+H
         5cITh3TFBvDOziQ7bFy8Zg0twMdvikeGZOZ68zOUhin31qzCd/UVezAgczT01olYD0uB
         S76c8gbSWZZ8G/qSHVKXUiouJxWr/N63T5ZGND0e6jjJE05JsLllvrAx++MXx0vcc0u/
         BSLMWbVretqydMpE0GFZwQ1lvVnbCBxE7dN3jcq8pRHa48utIf/e6jl5sxHlY1sqrpFN
         dhxVCtGeTWpyvybiRnof6YhlJI1YJvivoAuE9kndA7q5zoREDC8Yt1Pu0oRrBF0A9sYe
         AFww==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] defer/whichtochoose: Make paragraph consistent with table
Date: Mon,  1 May 2023 15:11:12 +0000
Message-Id: <20230501151112.24312-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The second row of table 9.7 has been changed since 82c89c8.
So make the paragraph consistent with the table.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 defer/whichtochoose.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 10cb760e..af5a09c3 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -85,7 +85,7 @@ The ``Readers'' row summarizes the results presented in
 which shows that all but \IXalt{reference counting}{reference count}
 enjoy reasonably fast and scalable readers.
 
-The ``Number of Protected Objects'' row evaluates each technique's need
+The ``Memory Overhead'' row evaluates each technique's need
 for external storage with which to record reader protection.
 RCU relies on quiescent states, and thus needs no storage to represent
 readers, whether within or outside of the object.
-- 
2.34.1

