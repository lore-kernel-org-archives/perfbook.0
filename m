Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=date:from:to:subject:message-id:mime-version:content-type
 :content-disposition:user-agent;
 bh=pH9ekuw54wpYmsf6MB9WracqRnGIKcByb3x4pB5lD2s=;
 b=gtIJwl8XOUm3ISae8AAJVs0VR2PaSzwlDPLhitOmMXc8n5UeP4aue/L9tdEgg/ukGc
 VJNXTHgowC0d0wbPvZp3LlX972redZBiR0pw4CZirDNjIVlmZcMf54QOnV+YsYTReXA/
 S4wAHTcTWudSRRJIdZCYrqXBl0wFtAIhBF5GRXOLlL1D9aumMtk3Q6peqlBfKZeDOHa5
 ghELBOkXlz1A/9Lv0LbkT5hU+RiLPKrSYltfjZSxSy8fwA9T/JeLOJyBATEI+TMzkZkI
 2cHJlvzjGqrnCeRBPmPk9aGKacagA3HOPJ5ZHJd6SnY8m2rSiXE0b3qf79zm6WY1K7mc
 4zFw==
Date: Thu, 19 Mar 2015 21:30:21 +0200
From: Andreea-Cristina Bernat <bernat.ada@gmail.com>
Subject: [PATCH] api: Add multiple header files
Message-ID: <20150319193021.GA30095@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: perfbook@vger.kernel.org, paulmckrcu@gmail.com
List-ID: <perfbook.vger.kernel.org>

Add multiple header files to avoid the warning: implicit declaration of
<function>.

Signed-off-by: Andreea-Cristina Bernat <bernat.ada@gmail.com>
---
 CodeSamples/api-pthreads/api-pthreads.h | 3 +++
 CodeSamples/api.h                       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index f877097..35f4efb 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -26,6 +26,9 @@
 #include <errno.h>
 #include <limits.h>
 #include <sys/types.h>
+#include <sys/wait.h>
+#include <poll.h>
+#include <sys/time.h>
 #ifndef __USE_GNU
 #define __USE_GNU
 #endif /* #ifndef __USE_GNU */
diff --git a/CodeSamples/api.h b/CodeSamples/api.h
index beda5f9..bb46828 100644
--- a/CodeSamples/api.h
+++ b/CodeSamples/api.h
@@ -420,6 +420,9 @@ static __inline__ long long get_timestamp(void)
 #include <errno.h>
 #include <limits.h>
 #include <sys/types.h>
+#include <sys/wait.h>
+#include <poll.h>
+#include <sys/time.h>
 #ifndef __USE_GNU
 #define __USE_GNU
 #endif /* #ifndef __USE_GNU */
-- 
1.9.1

