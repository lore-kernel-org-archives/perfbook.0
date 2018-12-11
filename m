Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b/uTWqm23HgRHBs5DG8RksVa7yi41ZXJ1b2Y7xR3h4M=;
        b=f8CZCArZxRLGO1/02dZsirL3Cdf8x7qmqoe7zAx/ttYcnTBiIVrGeVeIjhmPCQwlEU
         oj3TPYwjIBCPqXrGzVlfVL0DUwxuDM/nAMFEwAdol9dDMhKp/saHroZ+Oh/iRWCT5H9l
         eTn5/9Kdidt+d687+vUt0EFGfvF9Ry3eo5JEJ1gISRIWU9t0tK/WDQiAYAbv13kSSZ2B
         fEHreaDHos4t5AwfKKO64w4qmNCGsvD97t8Y8nuQzuDqMWdJrCyIU+cRN7PSkDHI1j/B
         TzC6EWzETqf46O63qllk8jbT2/Hlau6oYEQuM++Omh0A9BAz2M+1DzXnvV/I0eh8hdP8
         J0Dw==
Subject: [PATCH 1/4] CodeSamples: Add C-cmpxchg.litmus
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a32788a1-b110-ea7e-f6af-2c4113c4eb4d@gmail.com>
Date: Wed, 12 Dec 2018 00:40:36 +0900
MIME-Version: 1.0
In-Reply-To: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From d724a9b7ffb4b6d648290864c80cd1542297fa40 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 10 Dec 2018 20:39:28 +0900
Subject: [PATCH 1/4] CodeSamples: Add C-cmpxchg.litmus

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/litmus/C-cmpxchg.litmus | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 CodeSamples/formal/litmus/C-cmpxchg.litmus

diff --git a/CodeSamples/formal/litmus/C-cmpxchg.litmus b/CodeSamples/formal/litmus/C-cmpxchg.litmus
new file mode 100644
index 0000000..9579d4a
--- /dev/null
+++ b/CodeSamples/formal/litmus/C-cmpxchg.litmus
@@ -0,0 +1,24 @@
+C C-cmpxchg
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x)
+{
+	int r1;
+
+	r1 = cmpxchg(x, 1, 2);
+}
+
+P1(int *x)
+{
+	int r1;
+
+	r1 = cmpxchg(x, 0, 1);
+}
+
+locations [1:r1]
+exists (0:r1=1 /\ ~x=2)
-- 
2.7.4


