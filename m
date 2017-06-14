Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zdFPHNyLILAlLqEf6gvuDxguOMA0uAyxbg4K5lHhHQc=;
 b=WU22ofxDV94aWOyWHpTigtnhkYzYV0vV0SUU9aUI6KlaiM978GE/eNNMVk3627q397
 E9npUSG6Axo1xQpK+VqE4brlQ7f4DJQGgI5p0hMWcie84FunmytrVC2g3lOiQVOjvTlQ
 mjX8T5+zyq6gvfoDKYLNVyvFvYp7x/1Z9KmiZwUX/4w1eI02ShYZjCJgvzYKb/N6PQaU
 dKE0i95VWEvbqIOaswXxi/3Pifxy4oqYitGAX6zAJH6RUnNixafLaNrMy5A1pLE+lowI
 jnGAEWOrQJOn6RRkjiZBd8PA5QUur4O310rHU6IiEv19DOPHkMTUWXTVhepbRT2W7Yow
 6xZg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 4/5] seqlocktorture: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Wed, 14 Jun 2017 23:45:03 +0800
Message-Id: <1497455104-14102-5-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
References: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/seqlocktorture.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/defer/seqlocktorture.c b/CodeSamples/defer/seqlocktorture.c
index fa0b69a..a345a5f 100644
--- a/CodeSamples/defer/seqlocktorture.c
+++ b/CodeSamples/defer/seqlocktorture.c
@@ -78,9 +78,9 @@ void *seqlock_read_test(void *arg)

 	run_on(me);
 	atomic_inc(&nthreadsrunning);
-	while (ACCESS_ONCE(goflag) == GOFLAG_INIT)
+	while (READ_ONCE(goflag) == GOFLAG_INIT)
 		poll(NULL, 0, 1);
-	while (ACCESS_ONCE(goflag) == GOFLAG_RUN) {
+	while (READ_ONCE(goflag) == GOFLAG_RUN) {
 		for (i = COUNT_READ_RUN; i > 0; i--) {
 			n_retries_local_cur = -1;
 			do {
@@ -115,9 +115,9 @@ void *seqlock_write_test(void *arg)

 	run_on(me);
 	atomic_inc(&nthreadsrunning);
-	while (ACCESS_ONCE(goflag) == GOFLAG_INIT)
+	while (READ_ONCE(goflag) == GOFLAG_INIT)
 		poll(NULL, 0, 1);
-	while (ACCESS_ONCE(goflag) == GOFLAG_RUN) {
+	while (READ_ONCE(goflag) == GOFLAG_RUN) {
 		for (i = COUNT_UPDATE_RUN; i > 0; i--) {
 			write_seqlock(&test_seqlock);
 			for (j = 0; j < n_elems; j++)
-- 
2.7.4

