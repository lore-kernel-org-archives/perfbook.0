Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q/M8vFftlykWecXXL4YYU6Uqza8s6hb+EJeG683+qqs=;
 b=uTObj3NkzI4t2U1nSAwrV3VWTrhdd8Hzz9onGneV3Jbg/75+C1HWpwrg633G6jkhgn
 upbEyG2zHhVu2BXp11BUQPjOmdjLtfPb6fxotOHJtvULbLlVQIIIcMc94b//WPs50ylA
 jBbduksGtv8PGISQiS3B21D/5sABUXNM7smm3nPcabGDhH9EFyAQPSBN4IEKsJFh+ub1
 oDpJwIK79DMrhDb5crUbQ/tZrYVX9b3Rp8ldrVWZt7WRhNXXsPbuOStITOq4hGdFAHNg
 s9aW5Q9CBbPfxALDgGvavhz5lUO7b7tbK8070JnlKRNCvD/8RnTl0Cnc3xdL29Bd6/wo
 zqeg==
Subject: [RFC PATCH v2 2/2] CodeSamples/defer: Add compiler barriers in
 gettimestampmp.c
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5dc9b95d-c1aa-1aab-c9d9-179967b4f634@gmail.com>
Date: Tue, 30 May 2017 21:07:50 +0900
MIME-Version: 1.0
In-Reply-To: <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 489b5e3bdeba2f9b733dbe3d85390368dd159174 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 30 May 2017 20:40:04 +0900
Subject: [RFC PATCH v2 2/2] CodeSamples/defer: Add compiler barriers in gettimestampmp.c

They ensure curtimestamp is read and written once in every
iteration.

[Revised according to Paul's suggestion to use WRITE_ONCE()]

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/gettimestampmp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
index 2abade4..fc5718d 100644
--- a/CodeSamples/defer/gettimestampmp.c
+++ b/CodeSamples/defer/gettimestampmp.c
@@ -32,14 +32,15 @@ void *collect_timestamps(void *mask_in)
 	long mask = (intptr_t)mask_in;

 	while (curtimestamp < MAX_TIMESTAMPS) {
-		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
+		while ((READ_ONCE(curtimestamp) & CURTIMESTAMP_MASK) != mask)
 			continue;
 		if (curtimestamp >= MAX_TIMESTAMPS)
 			break;

 		/* Don't need memory barrier -- no other shared vars!!! */

-		ts[curtimestamp++] = get_timestamp();
+		ts[curtimestamp] = get_timestamp();
+		WRITE_ONCE(curtimestamp, curtimestamp + 1);
 	}
 	smp_mb();
 	return (NULL);
-- 
2.7.4


