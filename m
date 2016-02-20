Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:36651 "EHLO
 mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1753150AbcBTN1l (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 20
 Feb 2016 08:27:41 -0500
Received: by mail-pf0-f176.google.com with SMTP id e127so66891829pfe.3 for
 <perfbook@vger.kernel.org>; Sat, 20 Feb 2016 05:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wuqsft0VFaJt5doYQgIuheR6N5wyTiAf5n4rqgRIWJI=;
 b=Img+ShaQ/En3f9wfQ1Ovo/0oBk9rE3EUrGVF5s4NKphQ8tNj/qFkR4eA8gxriVKcEY
 9hKJqzuT7p79x9mzR8+MHWHy4wVgAxki5WG5zWBYKLVd5HCf5aF44JL6Vd6dblqSrJmD
 uMoKyhQHmtU+FpGr7NuzpcaQQH8C8APUPxzQXsmPMapXpdHy/pOc0DnMwBmG6ctFZK8B
 qQIgl+R/wtXpWB4DyfVeZ6U0fWar47B+ZKRbXV7Y5nWQgD1avqpjewOlgzbRPxvXGXIz
 pthKfv8zDawF/fC991+x7aCuc3ZVf4viwHvBeFwx90Rlt3rTf+R4qeBb0CGi0ratcWuP
 6Qzw==
From: Hitoshi Mitake <mitake.hitoshi@gmail.com>
Subject: [PATCH v2 2/2] Let a writer thread go back to the original CPU in the
 toy RCU pseudocode
Date: Sat, 20 Feb 2016 22:27:31 +0900
Message-Id: <1455974851-10000-2-git-send-email-mitake.hitoshi@gmail.com>
In-Reply-To: <1455974851-10000-1-git-send-email-mitake.hitoshi@gmail.com>
References: <1455974851-10000-1-git-send-email-mitake.hitoshi@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: mitake.hitoshi@gmail.com

This commit a little bit improves the logic of a writer thread. The
new logic lets the writer go back to the original CPU after run_on()
the final CPU.

Of course it is a trivial improvement and original two lines
pseudocode is beautiful. If it isn't worth to apply, please ignore it.

Signed-off-by: Hitoshi Mitake <mitake.hitoshi@gmail.com>
---
 defer/rcuintro.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 03d6e12..135922c 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -166,8 +166,11 @@ quite complex, a toy implementation is exceedingly simple:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  1 for_each_online_cpu(cpu)
-  2   run_on(cpu);
+  1 int orig_cpu = smp_processor_id();
+  2 for_each_online_cpu(cpu)
+  3   run_on(cpu);
+  4 if (orig_cpu != smp_processor_id())
+  5   run_on(orig_cpu);
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
-- 
1.9.1

