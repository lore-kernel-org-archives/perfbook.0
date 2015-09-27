Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:33347 "EHLO
 mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1755519AbbI0MCM (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 27
 Sep 2015 08:02:12 -0400
Received: by wiclk2 with SMTP id lk2so71667126wic.0 for
 <perfbook@vger.kernel.org>; Sun, 27 Sep 2015 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=sender:from:to:subject:date:message-id;
 bh=ldOwK86XksEKywqKvHZJYKA3yi+lgBN5H++mdoUaI+o=;
 b=wakkrC8cmRtjV2sJBu/QJaTRP90T9VguOARB6DdgvAK4tp5oMtTLLsbtrVEGjsxmRX
 6jbp0vc4Hrbev4k6uOwAy9Wo3qGCAhvuPiqxq4szlEPZl/cVwCW865Z4MxHjol+0sS1k
 /uCOcSJgEyRoNrIviu+gySC//r+OAXWDOI1zmXSwEPj/z8PHEAg4KROjjmIrXbpYVKb1
 8W3eFR7ixRbE0nFjixJOn3SyOPKQY2bZ2wG9m7Lom3Bkyx84guIPPb/ZKJAYf8Zot8/z
 s9w31wkjLMZTrpEntNWfpoGVZ0Xelkm7T2YBek3lJQUoBeFKOx3v4flvmggSALvHLJdL
 G0GA==
Received: from donizetti.lan. ([94.39.140.123]) by smtp.gmail.com with ESMTPSA
 id wn10sm12793815wjc.46.2015.09.27.05.02.08 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Sun, 27 Sep
 2015 05:02:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] fix typo in quick quiz 4.17
Date: Sun, 27 Sep 2015 14:02:02 +0200
Message-Id: <1443355322-11907-1-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 4e85a9c..ccbe0ad 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -964,7 +964,7 @@ rights to assume that the value of \co{goflag} would never change.
 \QuickQuizAnswer{
 	It depends.
 	If the per-thread variable was accessed only from its thread,
-	and never from a single handler, then no.
+	and never from a signal handler, then no.
 	Otherwise, it is quite possible that \co{ACCESS_ONCE()} is needed.
 	We will see examples of both situations in
 	Section~\ref{sec:count:Signal-Theft Limit Counter Implementation}.
-- 
2.5.0

