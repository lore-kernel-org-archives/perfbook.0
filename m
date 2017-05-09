Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34232 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751213AbdEIFJR (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 9
 May 2017 01:09:17 -0400
Received: by mail-pg0-f65.google.com with SMTP id u187so13518266pgb.1 for
 <perfbook@vger.kernel.org>; Mon, 08 May 2017 22:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K7kPaRZla+TEZqXmHXYwOWnOnHsm1K35JSzTMPjqW0A=;
 b=H9cMWyU16kjPEiippoHI1FK0fbiedwE/Cfy1Qo5W7XbjtPetcy+jdAdPwOqWpkRuJk
 ywfEVHJQQlFHBwPBlS1vwNbU5TpLGBUC9vIsQ+b+pWOP/4JQ7HsZyUlruD+53y3hhtNC
 ZDDBv5f4DKxJW2sdlaEjgNLmbq2vu9YVCYWDBj3xPDdVp+SrvPZhYAzN02SNj7AxrBLn
 MYCZtkM6yvjgFRcaf1QUqvKKMM1pdnJBXj698/CFLggOoPKUiPwAwrP7vLkTK2mC25sM
 A3w6h2/8h3+aKt+ah6HjC6hAFs8qrl6lekaT22Bw2sO0SD2hbKKZugAhFUpmBmNje5ZH
 3fbw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 1/2] Replace definition of variable sum from int to unsigned
 long
Date: Tue,  9 May 2017 13:08:30 +0800
Message-Id: <1494306511-9022-2-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
References: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>

 The maximum size of integer variable on 64bit machines is 2^31. Suppose the
 writer takes 5 nanosecond to increase the counter by one, the result wraps
 around in about 10 seconds.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 75a0ca9..059ab8b 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -38,7 +38,7 @@ unsigned long read_count(void)
 void *eventual(void *arg)
 {
 	int t;
-	int sum;
+	unsigned long sum;

 	while (stopflag < 3) {
 		sum = 0;
-- 
2.7.4

