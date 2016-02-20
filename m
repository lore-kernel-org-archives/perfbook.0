Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:36613 "EHLO
 mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1948978AbcBTIwd (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 20
 Feb 2016 03:52:33 -0500
Received: by mail-pf0-f172.google.com with SMTP id e127so64520060pfe.3 for
 <perfbook@vger.kernel.org>; Sat, 20 Feb 2016 00:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g8Y7Ssj8SdQunYEJ9JWSMffjLFe3wEcF05slST7IIQk=;
 b=y00qZzXOR4kRN4fWJrKH46Nm6nBqJME2n9JheacxVt8jHS9RkV+DdjCOsyVmwXVlGf
 xF1xLOSHbpIdqze5uvlBFQjJ0UOW2WPWZy3HhXSaMD0Nxjz4Aaxgwz99AAU31hFlMziz
 uGSHCKeFNecYOT6IECOsRWO0oU3UBPZb5reX+OwFeuZmOl4rEZoFsNdWvCoO87pqCXyN
 rcpWrcpRuPi6EfDT1mVtDiXlwitNHwPLZla/eHeGzmnDKhBxJSgSWyru9oOy8by7sBWv
 B4zfBbhrNjEvjJtJtc7owKMXYPAbFVZLLH5d61p0RTECu7tXJJBuD3/q11OFkxNIYbCw
 1zNg==
From: Hitoshi Mitake <mitake.hitoshi@gmail.com>
Subject: [PATCH 2/2] Let a writer thread go back to the original CPU in the
 toy RCU pseudocode
Date: Sat, 20 Feb 2016 17:52:02 +0900
Message-Id: <1455958322-25225-2-git-send-email-mitake.hitoshi@gmail.com>
In-Reply-To: <1455958322-25225-1-git-send-email-mitake.hitoshi@gmail.com>
References: <1455958322-25225-1-git-send-email-mitake.hitoshi@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: mitake.hitoshi@gmail.com

This commit a little bit improves the logic of a writer thread. The
new logic lets the writer go back to the original CPU after run_on()
the final CPU.

Of course it is a trivial improvement and the original two lines
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

