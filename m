Return-Path: <SRS0=++fA=AL=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681975770; x=1684567770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNTZKVEDbe/MN6p+PzANOmziCNLGWYH99UyeoJMlZVQ=;
        b=EHRDKjTA1QKcdmsFSGSMMczmJx7yV1pg8UAeuRDqGnImoLi2TEhXrsMGR6fehL5azc
         8D/eNIVNphSMonAp+5NKcrgMjRUQE/pr8Cl/JpfcopST/S6py+3/9NRnRPkjV1PDY8w2
         02feHFzWTrqVhf2QQI1zowYGa7enZAEuBqts9azB1yGfgTOvjfR/If4UFvkQRVcvLbQA
         spNQO2w/LNfJYbU/f38WlGE6toMb2Oi8UAwWyPCaAjtLaAmf3g/Sjx24XtncjnMezf8z
         PzJfB+37yYIGvQfaWvJsKV7Dd8bR22Lyy874sVV7TmcVT7vCFwJLioxgSWYZXurFYdnE
         ERHw==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSamples/defer: Fix hazard torture
Date: Thu, 20 Apr 2023 07:29:23 +0000
Message-Id: <20230420072923.35042-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patch fixes hazard torture.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/defer/hazptr.h        | 2 +-
 CodeSamples/defer/hazptrtorture.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
index 759ab53d..e061303d 100644
--- a/CodeSamples/defer/hazptr.h
+++ b/CodeSamples/defer/hazptr.h
@@ -87,7 +87,7 @@ static inline void *hp_record(void **p,			//\lnlbl{hr:b}
 	void *tmp;
 
 	do {
-		tmp = hp_try_record(*p, hp);
+		tmp = hp_try_record(p, hp);
 	} while (tmp == (void *)HAZPTR_POISON);
 	return tmp;
 }							//\lnlbl{hr:e}
diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
index 53efa259..29761e3d 100644
--- a/CodeSamples/defer/hazptrtorture.h
+++ b/CodeSamples/defer/hazptrtorture.h
@@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long [HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
 
 void *hazptr_read_stress_test(void *arg)
 {
-	int me = (int)(long)arg;
-	int base = me * K;
+	int base = smp_thread_id() * K;
 	struct hazptr_stress *p;
 	int pc;
 
-- 
2.34.1

