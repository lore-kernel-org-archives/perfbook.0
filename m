Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36342 "EHLO
 mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751291AbdEPNlv (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 16
 May 2017 09:41:51 -0400
Received: by mail-pf0-f195.google.com with SMTP id n23so18888046pfb.3 for
 <perfbook@vger.kernel.org>; Tue, 16 May 2017 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=qOeSvbU7ZVQPCjOsvfOGtcwcrQ+e+dB2+zzSXdhhrNs=;
 b=uxPElwPi4cOZrEp5lpSW3epQqL1euUDNWCwvM/th3SfaJf1zUvfY6BwOkcEazUmhkv
 TgghkKWqaFQeCLEeS3TRhrjpLk+VgoeNshksWUEMeVNXtfQEyFuPiqOGJn1WtrEvx1SE
 /Erzeeja6Tar+wO6A6i/yUudoVcSeG7WCOZFm0bKSXbN7vVgRbhRggiCNkzyAP7fFv4w
 K+o5skgmxQ2C7PTA52dLS6iEnUud/EwVpP1xz1rXaBcKPvLrBWCFaRrh0EVHqgAt8Z7u
 ueaesuwJE0MLHnTSo0WN7zYAmXh1U1bZHAJVK5VPsbzerCT7H3nIp4vIssmkKyEbZ04I
 PChg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] count_stat_eventual: Remove unnecessary READ_ONCE() and
 smp_mb()
Date: Tue, 16 May 2017 21:40:26 +0800
Message-Id: <1494942026-6736-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>, Akira Yokosawa <akiyks@gmail.com>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 464de30..1365168 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -40,16 +40,17 @@ void *eventual(void *arg)
 {
 	int t;
 	unsigned long sum;
+	int stopflag_l = 0;

-	while (READ_ONCE(stopflag) < 3) {
+	while (stopflag_l < 3) {
 		sum = 0;
 		for_each_thread(t)
 			sum += READ_ONCE(per_thread(counter, t));
 		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
-		if (READ_ONCE(stopflag)) {
+		if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
 			smp_mb();
-			WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
+			WRITE_ONCE(stopflag, ++stopflag_l);
 		}
 	}
 	return NULL;
@@ -68,7 +69,6 @@ void count_init(void)
 void count_cleanup(void)
 {
 	WRITE_ONCE(stopflag, 1);
-	smp_mb();
 	while (READ_ONCE(stopflag) < 3)
 		poll(NULL, 0, 1);
 	smp_mb();
-- 
2.7.4

