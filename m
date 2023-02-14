Return-Path: <SRS0=OGBw=6K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCJQ/zRKtRl56XkczIBrW+g5PgIuFnUZJqqBfsa+bb8=;
        b=ZCKDmmYFRCE1IAJOvVixba1t+yG9O7FRBY9XszxUSpHPjNTCS82Fd2SR4MyWpJepsa
         gSBviTvX9UjQHXdaJTTLU1VENkHkRY/tG5PRMUFBBKeoKeaUXwS4w+OpRCGk7/TtMKnD
         L0HGVKsBntLuHJp/9vaKxcky1zMc6Pt+ZZj/tRH9dA0vNvmFBYpH/pPDBkuVhsyi4iaY
         op2U8C3dbv13tMEry2LPCPfGEktUwvhYHiZ3O2jyu0hVy+UzK4oRzSH65qdFX8qvyZLy
         VnjA8kW34HZucgDWRfKPxGM49upCUqOKdFXeeVuRlQC2liiDxRnnTwyqHKjGCsnPLwXf
         7TsQ==
Message-ID: <eb00c9ea-ebce-698d-a751-053ffd96d308@gmail.com>
Date: Tue, 14 Feb 2023 19:08:05 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/4] cpu: Add page reference to Table E.1 in QQz 3.8
Content-Language: en-US
References: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index af17b3cfdf2f..ba4a33a4c45c 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -469,8 +469,10 @@ thousand clock cycles.
 %
 \QuickQuizE{
 	\Cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
-	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} says that
-	on-core CAS is faster than both of same-CPU CAS and on-core blind CAS\@.
+	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} on
+	\cpageref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
+	says that on-core CAS is faster than both of same-CPU CAS and
+	on-core blind CAS\@.
 	What is happening there?
 }\QuickQuizAnswerE{
 	I \emph{was} surprised by the data I obtained and did a rigorous
-- 
2.25.1


