Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Tgcji3yEF0zFeGcLa4eXVn7Vj5EGq+Pr0pxpcHKz+ac=;
 b=LvFHf+7GmAxDU4I21+roxuEQV8yof0RQpZAsTmSoeDGMsjIuqvBWoQP9rWVKjNfaYW
 XyXIho4T5XcCBNlv/z5zkypV2m5N5Yg/9KC/ztX+COWoPkAie+N/sCPgqUPoh1yYnU1R
 +V42JGT+hKUHSn+LHBeXaXhqLjLz3op33klQAYtuHErQjPajpBvsawgxWZoLIMMBSZKU
 v3U5kEWKCGtmQS87mZRrNitZHQ1hwsvY9asqmuApcGTUq/jSYaOgZCZbBqIBbbALzH89
 VJvu/L5pavJ8/6c/KvNj0mPvkyqn3gV+rJYI6uwDBNMfTCsPlc7RZ9qQtfoGnAFvPksf
 6UhA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH] advsync: Add litmus tests of control dependency
Message-ID: <491b2704-0d61-aebc-0787-94cd0da74694@gmail.com>
Date: Mon, 17 Jul 2017 23:28:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 892d8e1014c5bca1c83fbc35bcc1951c6c497b7f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 17 Jul 2017 20:56:19 +0900
Subject: [RFC PATCH] advsync: Add litmus tests of control dependency

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

So I converted the 2 examples of control dependency to litmus tests.
I mentioned the name "C-SB+o-c-o+o-c-o", but it should have been
"C-LB+o-c-o+o-c-o".

They correspond to the example after the partial revert to the
two-CPU example I submitted earlier.

Do they make sense?

          Thanks, Akira
--
 CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus   | 27 ++++++++++++++++++
 .../advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus        | 32 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus
 create mode 100644 CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus

diff --git a/CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus b/CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus
new file mode 100644
index 0000000..023af2e
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-LB+o-c-o+o-c-o.litmus
@@ -0,0 +1,27 @@
+C C-LB+o-c-o+o-c-o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 >= 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 >= 0)
+		WRITE_ONCE(*x, 1);
+}
+
+exists (0:r1=1 /\ 1:r2=1)
diff --git a/CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus b/CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus
new file mode 100644
index 0000000..80dc2f6
--- /dev/null
+++ b/CodeSamples/advsync/herd/C-WWC+o-c-o+o-c-o+o.litmus
@@ -0,0 +1,32 @@
+C C-WWC+o-c-o+o-c-o+o
+{
+}
+
+{
+#include "api.h"
+}
+
+P0(int *x, int *y)
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);
+	if (r1 >= 0)
+		WRITE_ONCE(*y, 1);
+}
+
+P1(int *x, int *y)
+{
+	int r2;
+
+	r2 = READ_ONCE(*y);
+	if (r2 >= 0)
+		WRITE_ONCE(*x, 1);
+}
+
+P2(int *x)
+{
+	WRITE_ONCE(*x, 2);
+}
+
+exists (0:r1=2 /\ 1:r2=1 /\ x=2)
-- 
2.7.4

