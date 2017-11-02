Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:45566 "EHLO
 mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750883AbdKBG6A (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 2
 Nov 2017 02:58:00 -0400
Received: by mail-pg0-f68.google.com with SMTP id b192so4276732pga.2 for
 <perfbook@vger.kernel.org>; Wed, 01 Nov 2017 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KCd1+KdZfOAC4nvO0kmjGWTvxJz1igyD5YSgrr93VVE=;
 b=eGeyRg2+A5q0RYyDJmByDIuR1afNMSzPHtkAxFvcrk2d5eivjYJP2/NLDmzDV/JGmQ
 MCuAbLBTjX7FdRhlSoNU8OQfe4N++z50TF7SRFD5d1h0/452fNDQGljBQP3gdtgDD7Bl
 CHWqaHzhm5v2jjcTdDOiY6dWGWPdkdShQy0a9mj9rrmjKjiANCcZ0oJUj83GlLfUGSDw
 CLRPqz9Ul75X2f7adBtz891rklgr9YOFix52s7R9gc7m2TTzNUOnfgulM03DR+YK9ztB
 ZV6I4uVZ3jK776niK6tKcdofM+DPDhq2S+7I/g1jlaAqMWIUjk43nqYekrTv2mWHDn8j
 ou3A==
From: pierre Kuo <vichy.kuo@gmail.com>
Subject: [PATCH 1/2] locking: fix typo
Date: Thu,  2 Nov 2017 14:57:48 +0800
Message-Id: <1509605869-8186-1-git-send-email-vichy.kuo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Pierre Kuo <vichy.kuo@gmail.com>

From: Pierre Kuo <vichy.kuo@gmail.com>

In 7.1.1.2 Local Locking Hierarchies, below left parenthesis seems
better to be comma.

"before invoking the comparison function
(which is unknown code from qsort()’s perspective,"
^^^ change it as comma.

Signed-off-by: Pierre Kuo <vichy.kuo@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 12a0240..5921f50 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -327,7 +327,7 @@ But the first thread holds Lock~C, so the second thread's call to
 Lock~B, resulting in deadlock.

 In contrast, if \co{qsort()} releases Lock~C before invoking the
-comparison function (which is unknown code from \co{qsort()}'s perspective,
+comparison function ,which is unknown code from \co{qsort()}'s perspective,
 then deadlock is avoided as shown in
 Figure~\ref{fig:lock:Local Locking Hierarchy for qsort()}.

-- 
1.9.1

