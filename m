Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qtpOzT8o5vk8tiN53BkAyco9k28DzKSshi1Gk9MqufA=;
 b=FSL7DSN6WdjJvYxOqYZL8J5pvUZC5dVPCpG9Ud5HG563LC1I/YVhkqwS6WF/gwgNrh
 zhBYpM9Werufr1QkmWqG74B3qdFrk81OID43YqWeHJTs2zkcVacUWh68eVVvbpAY64iA
 FQ01Zra9+HNrnU6G0sNV5DeXcVN8C9MgGBwc9dNZOqYJdpDhFSP+hsE9OIZ7yjdJ4I8w
 V1f7uqhvnIZTYHqjEUSFSHWTzbcRU0MBJ480/o9N/DVVnj5YQC0nUsFmHI4QyecN4WdF
 olI7n3154DdfSANJam+uyTcaxDNM7PrC4qOik8kgG96R5rjjYhLy3Zum+Zds8N062JQt
 8PWA==
Subject: [PATCH 2/3] appendix/rcuimpl: Adjust plurality of verb
References: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <edcb05bb-d688-4da1-c50d-3ad712199919@gmail.com>
Date: Wed, 24 Aug 2016 23:10:46 +0900
MIME-Version: 1.0
In-Reply-To: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a8bfa8fee42830a350729a4b96d1c662ea8cb7df Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 14 Aug 2016 15:06:08 +0900
Subject: [PATCH 2/3] appendix/rcuimpl: Adjust plurality of verb

This commit is to adjust plurality of verbs in accordance with
the changes made in the previous commit.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/rcuimpl/rcutreewt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/rcuimpl/rcutreewt.tex b/appendix/rcuimpl/rcutreewt.tex
index bb7e0e3..c9f2e9b 100644
--- a/appendix/rcuimpl/rcutreewt.tex
+++ b/appendix/rcuimpl/rcutreewt.tex
@@ -3906,7 +3906,7 @@ duration, with line~14 invoking \co{print_other_cpu_stall()} if so.
 Figure~\ref{fig:app:rcuimpl:rcutreewt:Code for print-cpu-stall}
 shows the code for \co{print_cpu_stall()}.

-Lines~6-11 prints a console message and dumps the current CPU's stack,
+Lines~6-11 print a console message and dump the current CPU's stack,
 while lines~12-17 compute the time to the next CPU stall warning, should
 the grace period stretch on that much additional time.

-- 
1.9.1


