Return-Path: <SRS0=B+67=6E=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgOUZzaWar9hlCtmEvlwTlR3Y0vjRmT2snuES3uiqH8=;
        b=D9ElJ7JAkaHApCixu+QS67DBCyma1YsBkWP9M+d9GXHIR0dvNUMLfGuriEBdBiSmYT
         6VaqHzHe8ZFOkjNR3bcQHSkwuAuk+2hOFssyUUUdlbVjiyv4nlfauypHOoFvzlaC2tR2
         vXvoN1pPal1C2NYGPBhwVdL2rrWqEfL2YnooCRmX/QHvQiltDr1I27qo/yxTgi8RfBC8
         V7gPOgrqQFd0I/Ymk+gmPrIwpfxN+fJt4K/NE7DPJPCRIXZcelJNRXun6nHAuDJ8J9+S
         2wcVRg2Ake1H/GjHTR/ius3u1YV2ycY1rHOydU7g1NuGOwqVuA0MncPTf+CyvlTlo2GA
         IhfA==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v1] cpu/overheads.tex: Improve table: Intel X5550 Performance Synchronization
Date: Wed,  8 Feb 2023 02:47:12 -0300
Message-Id: <20230208054711.465997-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

A few rows can cause some confusion on what they could be representing.
Change some of the table organization to it could avoid it.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 cpu/overheads.tex | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 0d8270bf..1bce5cf5 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -322,8 +322,12 @@ thousand clock cycles.
 			& {\parbox[b]{.7in}{\raggedleft Ratio\\(cost/clock)}} \\
 	\midrule
 	Clock period		&           0.4	&           1.0 \\
-	Same-CPU CAS		&          12.2	&          33.8 \\
-	Same-CPU lock		&          25.6	&          71.2 \\
+	\midrule
+	Same-CPU		&		&		\\
+	CAS			&          12.2	&          33.8 \\
+	lock			&          25.6	&          71.2 \\
+	\midrule
+	In-Core			&		&		\\
 	Blind CAS		&          12.9	&          35.8 \\
 	CAS			&           7.0	&          19.4 \\
 	\midrule
-- 
2.39.1

