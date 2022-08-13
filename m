Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbiHMLK3 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 07:10:29 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F6FD55
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 04:10:28 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id e28so2515214qts.1
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=OOUwHFUqt7JAO28iR7D4r05jKEbkWyQYHGiGAZTvpGU=;
        b=eWd74K2xoPwQ1+LzQ2bmuD0BKL5sA9wDxVoqGiaP2E/xI8tVl24VYNrp6Hs5fyHhvF
         LtStwV22xe1Ah5Mxh/mbgZqeg+E74OBCSi0XaeBg3NQkexvKVT0lbmzrLJ+JTm2XUUGD
         /iXVLxxP4Bz9l3+x587WjY1Qkrn8RZuy3VYfRlngz/q+kvYpQR8ymhnCUjow2+Lm9Djx
         0iCCfIz/NKOaLVnwSZytYAs3FJdNpKYXdW7IrhlQheFsFG1oRvwNoosJ2PHr2njBGxJP
         yK0yfwyVgSWgNuz59INAkK28U7LCx3ERKa1QsDqtA5KBmknFFo6c9YtBD4L8sXLGcL3o
         MgOA==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] CodeSamples: count_stat_eventual.c should use pthread_t with pthread_create()
Date: Sat, 13 Aug 2022 07:10:22 -0400
Message-Id: <20220813111022.2069271-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 5179de9d..967644de 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -61,7 +61,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
 void count_init(void)					//\lnlbl{init:b}
 {
 	int en;
-	thread_id_t tid;
+	pthread_t tid;
 
 	en = pthread_create(&tid, NULL, eventual, NULL);
 	if (en != 0) {
-- 
2.25.1

