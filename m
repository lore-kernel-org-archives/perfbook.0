Return-Path: <SRS0=Fz29=AN=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682159674; x=1684751674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tu9M+6xLB87AN2a7cbFbQqI1ZulGw/XqjJ2NbsJbB0=;
        b=g13hWUMEmyqMQeuua7gL/nAhHATlROZaMAVy47uPnn1B8Wgcwql8fR+UBrwmrYBpVB
         5rgSNjTOHvV2ZHQ970a29MHvqBukFczSRoXc7rtZrvBZkZ4ykn/Gzw9XbdzZeEhMtIvo
         RMq9ryZOVxPECNuSKVjn4IH5rA9S35OIfbXZLdzXI9ruME52YmgGwbMPyXRq9IIX2JWS
         su+5qWL2AInR6DS+VhyORiJWXQEio8DFz8ldnfD4MhnqQraRa3uedUtHfA9wJwn9ZG8i
         f/J9OnNmf3f6JfLmiwzXd1fLSWyIda0Fo+coOt3uyHVEAjq7rX+n7A0M2PzwtOLve/Ym
         TJdg==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH v2] CodeSamples/defer: Fix hazard torture
Date: Sat, 22 Apr 2023 10:34:21 +0000
Message-Id: <20230422103421.1382-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Because hp_try_record() must check for concurrent modifications,
we should not dereference the pointer. The arg of hazptr_read_stress_test
is always NULL, which is designated at time when create the thread,
therefore, all threads will store their hazard pointer in the same slot.
Also, hazptr_thread_exit will clear their own hazard pointer from
smp_thread_id() * K.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/defer/hazptr.h        | 2 +-
 CodeSamples/defer/hazptrtorture.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

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
index 53efa259..acdd532b 100644
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

