Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+nIULDlaaKi/P4ik8YAVZkuG7W2ds3yIG8PbjpkAjhE=;
 b=WX1GfAOzsenI6CPLJ0odbvYyvRDfMD1lyzgeCyr/4xpnvF2ZF3bwQ6/dIQHs0qZ73O
 2O66P+cQpZk8Bee7m4jHbEQrkuul+Xhr6QdzAGgRB5YnGfcnoZIDmddMx46FVXCPdECM
 PxAip+ncE/yvOI3K+rolImXQmmXTVCauc7Co3lgh0No0YMk1MIkD6/qAy+uLrZDsJAwV
 D40PdmDbn9ElUbueXqaKJVUCm6jTcUM+wCIHIk/ZeQOH1VcoGuTv77lMKEQIxYIcG0Kz
 N+Fw/0CA64Ne0VZE1Kxscyj0wTFw1H2rbgZ6+embOCr6REprGP5Rxb/mPDm0i2tUqcKn
 OqgA==
Subject: [PATCH 2/2] count: Remove unnecessary smp_mb() in code snippet
References: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6860092f-dfbf-cae6-8d89-f0e62057b373@gmail.com>
Date: Tue, 23 May 2017 00:13:28 +0900
MIME-Version: 1.0
In-Reply-To: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From edbd0adf8aafef3704b9059ae484ee44f2aa308e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 22 May 2017 23:46:27 +0900
Subject: [PATCH 2/2] count: Remove unnecessary smp_mb() in code snippet

Reflect the fix made in commit 853027876a8c ("count_stat_eventual:
Remove unnecessary smp_mb()").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index ae624c6..1b5b030 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -793,11 +793,10 @@ eventually consistent.
 45 void count_cleanup(void)
 46 {
 47   WRITE_ONCE(stopflag, 1);
-48   smp_mb();
-49   while (READ_ONCE(stopflag) < 3)
-50     poll(NULL, 0, 1);
-51   smp_mb();
-52 }
+48   while (READ_ONCE(stopflag) < 3)
+49     poll(NULL, 0, 1);
+50   smp_mb();
+51 }
 \end{verbbox}
 }
 \centering
@@ -826,7 +825,7 @@ summing the per-thread local \co{counter} and storing the
 sum to the \co{global_count} variable.
 The \co{eventual()} thread waits an arbitrarily chosen one millisecond
 between passes.
-The \co{count_cleanup()} function on lines~45-52 coordinates termination.
+The \co{count_cleanup()} function on lines~45-51 coordinates termination.

 This approach gives extremely fast counter read-out while still
 supporting linear counter-update performance.
-- 
2.7.4


