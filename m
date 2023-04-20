Return-Path: <SRS0=++fA=AL=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681976437; x=1684568437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KOKJQD29ULLYqbvH2gFEEOj0spHn0EXRRPx4xkDooFU=;
        b=hoRGUiD17UKOpWSIYAKs3YFbvQ9uH7F2n1Hlu+rCfxoggagM3a6tsjO7aaSSlpFi66
         ldt0TporDc5b+TM1L/U+ZdmIeza4/uBU3zLkN+T8tZsf8pQ7DG8bz7z1WL2MbBqEek3C
         hDhGI60Eql/i9N1bcdMFFNG3wPyvDX0IhlhxiXLEciuOYb3W+N+mj6g+QY+KGgRDbbIu
         +3rNwdtHwX/He5FcXSXhp28dSa8TdZVrJLaxDPz1medcLfEPnE+6TWMQ/xULWxNo3Dw7
         WoHRsaKC/STSk31vqHhBW9HaaxWTzqOgKdwH2gaKLZj7jSxLqwp8h4v3Hn8QblTf5IzU
         RtxQ==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSamples/defer: Make hazard partition consistent with hazptr_thread_exit
Date: Thu, 20 Apr 2023 07:40:30 +0000
Message-Id: <20230420074030.35246-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/defer/hazptrtorture.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
index 29761e3d..acdd532b 100644
--- a/CodeSamples/defer/hazptrtorture.h
+++ b/CodeSamples/defer/hazptrtorture.h
@@ -99,7 +99,7 @@ void *hazptr_read_perf_test(void *arg)
 {
 	int i;
 	int me = (long)arg;
-	int base = me * K;
+	int base = smp_thread_id() * K;
 	long long n_reads_local = 0;
 	hazptr_head_t hh;
 	hazptr_head_t *hhp = &hh;
-- 
2.34.1

