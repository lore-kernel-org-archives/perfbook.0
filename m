Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37013 "EHLO
 mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751221AbdLIPXN (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 9
 Dec 2017 10:23:13 -0500
Received: by mail-pf0-f195.google.com with SMTP id n6so9002205pfa.4 for
 <perfbook@vger.kernel.org>; Sat, 09 Dec 2017 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=q1I11/uHAfOud/SRklAMmmBcIIa16tU/ZEHEACnYHDk=;
 b=Ak6+SGz2NAgHpRMo0Er1kan1DJ8PYJIh7nJ34PlTjwL4C0vtT1qVwvMVF/WglQEYQ3
 2RXHTQhERcNYHMgy6YwZMOZgd8quoej1wBjGY9CdkS0Zi/RcuDtpZlkhPwaPfxwzCdkj
 g9/D3zSL5CHRGO/J/yywzteDp/0HOA1pqbwdXyk0gLrLZpactDjdPZKZO2ZXlDPmn+9T
 Chl09WZgWQ70reNRfqvUddxlRCzv/QRLHT48vTcF69HVowcsnmW3+TvPr/r9yCPEYRTw
 ndYID9h1V7oUTo/EGFoo6XmAW6GUOvoMzDXipi6dwKsS5731/vrxHdxmKDUjrOkDmuna
 OVfw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] CodeSamples/formal/herd: Import absperf scripts of Paul's
 litmus repo
Message-ID: <84124977-6d34-3760-b596-0b7d5502373e@gmail.com>
Date: Sun, 10 Dec 2017 00:23:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From d44f361687f33ef3c293154d94a18571591d97ba Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 8 Dec 2017 00:11:26 +0900
Subject: [PATCH 1/2] CodeSamples/formal/herd: Import absperf scripts of Paul's litmus repo

Import scripts as of commit 62d56aa9b4a2 ("Make absperf scripts more
flexible") in Paul's repository at:

    https://github.com/paulmckrcu/litmus.git

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/absperf-reduce.sh | 30 ++++++++++++++++++++++++++++++
 CodeSamples/formal/herd/absperf.sh        | 15 +++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 CodeSamples/formal/herd/absperf-reduce.sh
 create mode 100644 CodeSamples/formal/herd/absperf.sh

diff --git a/CodeSamples/formal/herd/absperf-reduce.sh b/CodeSamples/formal/herd/absperf-reduce.sh
new file mode 100644
index 0000000..0c338b8
--- /dev/null
+++ b/CodeSamples/formal/herd/absperf-reduce.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+awk '
+/absperf/ {
+	curtest=$1;
+	testran = 0;
+}
+
+/^Test/ {
+	testran = 1;
+}
+
+/maxresident)k/ {
+	if (testran) {
+		curtesttime = $0;
+		gsub(/user .*$/, "", curtesttime);
+		testtime_n[curtest]++;
+		testtime_sum[curtest] += curtesttime;
+		if (testtime_max[curtest] == "" || curtesttime > testtime_max[curtest])
+			testtime_max[curtest] = curtesttime;
+		if (testtime_min[curtest] == "" || curtesttime < testtime_min[curtest])
+			testtime_min[curtest] = curtesttime;
+	}
+}
+
+END {
+	for (i in testtime_n)
+		print i, testtime_sum[i] / testtime_n[i], testtime_min[i], testtime_max[i];
+}
+'
diff --git a/CodeSamples/formal/herd/absperf.sh b/CodeSamples/formal/herd/absperf.sh
new file mode 100644
index 0000000..4b54680
--- /dev/null
+++ b/CodeSamples/formal/herd/absperf.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+TIMECMD=/usr/bin/time
+TESTBASE=${1:-litmus-tests}
+TIMEOUT=${2:-15m}
+ITER=${3:-10}
+
+for n in $(seq $ITER)
+do
+	for i in $TESTBASE/absperf/*.litmus
+	do
+		echo $i
+		$TIMECMD timeout $TIMEOUT herd7 -conf linux-kernel.cfg $i
+	done
+done
-- 
2.7.4

