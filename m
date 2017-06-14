Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CEq8SvLpMHnn7lBE9A5eAvUNdLHagoAV2UrrzTHdp14=;
 b=e8N+sy1bVMtsEF77aNm6nSYbnl5BMZyGinzBwDLjGNU/fnXIgDYz/M3VFUTLIRUqEm
 HRyvMR2D8QrlkNoMwAoLIoRmbLdVO3HBMPiJX/lvbn+0tDpylhvxEwwoIVjvBz25BSIF
 far+eON7o9F2fz/FAqeQFnm6RMQxDlj5Rsy6O82dotIhMSiJ/SetAXdLYSUmUMSRVd9c
 Baxd1exlkW8BJLqcH/Nvu6ec18qjwUvljqUGzk8iywkfJpC+/DVr3cJVJ0zhW5zV3f7o
 hsiO8jXgO2ucxJdHeUdZ/te8M8LH9dyRYkUB6ur8gKDd/uJzHxu+dyUyQwsJBZlcNGeV
 Fs0w==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/5] hazptr: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Wed, 14 Jun 2017 23:45:00 +0800
Message-Id: <1497455104-14102-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
References: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/hazptr.h        | 8 ++++----
 CodeSamples/defer/hazptrtorture.h | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
index 391d281..48bec0e 100644
--- a/CodeSamples/defer/hazptr.h
+++ b/CodeSamples/defer/hazptr.h
@@ -65,17 +65,17 @@ static inline void *hp_record(void **p, hazard_pointer *hp)
 	hazptr_head_t *tmp;

 	do {
-		tmp = ACCESS_ONCE(*p);
-		ACCESS_ONCE(hp->p) = tmp;
+		tmp = READ_ONCE(*p);
+		WRITE_ONCE(hp->p, tmp);
 		smp_mb();
-	} while (tmp != ACCESS_ONCE(*p));
+	} while (tmp != READ_ONCE(*p));
 	return tmp;
 }

 static inline void hp_clear(hazard_pointer *hp)
 {
 	smp_mb();
-	ACCESS_ONCE(hp->p) = NULL;
+	WRITE_ONCE(hp->p, NULL);
 }

 #define hazptr_clean_pointer(p) ((typeof(p))((unsigned long)(p) & ~0x1UL))
diff --git a/CodeSamples/defer/hazptrtorture.h b/CodeSamples/defer/hazptrtorture.h
index 9341765..2188ec1 100644
--- a/CodeSamples/defer/hazptrtorture.h
+++ b/CodeSamples/defer/hazptrtorture.h
@@ -286,17 +286,17 @@ void *hazptr_update_stress_test(void *arg)
 		if (i >= HAZPTR_STRESS_PIPE_LEN)
 			i = 0;
 		p = &hazptr_stress_array[i];
-		if (ACCESS_ONCE(p->inuse)) {
+		if (READ_ONCE(p->inuse)) {
 			hazptr_stress_idx = i;
 			continue;
 		}
 		p->pipe_count = 0;
-		ACCESS_ONCE(p->inuse) = 1;
+		WRITE_ONCE(p->inuse, 1);
 		p->mbtest = 0;
 		smp_mb();
 		p->mbtest = 1;
 		smp_mb();
-		ACCESS_ONCE(hazptr_stress_current) =  p;
+		WRITE_ONCE(hazptr_stress_current, p);
 		hazptr_stress_idx = i;
 		for (i = 0; i < HAZPTR_STRESS_PIPE_LEN; i++)
 			if (!hazptr_stress_array[i].inuse) {
-- 
2.7.4

