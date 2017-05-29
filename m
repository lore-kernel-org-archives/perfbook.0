Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OlMTotnz3akCqdxxvnCEFRJjkKU3PW+T9KgpbDO2g74=;
 b=I4HzFOFy1gpvwD8cdtKUy7BYEcbaqrI4t2bf+dKxmRCYfByz5T5Q8XQHVQOURmtAlL
 6o+7t8edP+OVqviWonlJfvRJ2t0f1i007OMGdOamk4MzbpUCOTSOLaiKqZ3+q0P7odwC
 9t5Jx6j8lXj04EFYue+CHKJIntScDpwQqqgIyB4FoYyFOfQ2n91LPETKVAI06N2bvbEf
 oNrxDunf5DSn0oCrNWLWbQNu6TBBk3rn+HBb9IcnHVSPa35TXQnE+qMnxuiOfkgeCYNh
 q9ZZJR5AuWF31Gm+LFgyV/HHkYEReV4fm31SsvU+VHi660Ehn3X8/QuyMg4lnZZdd4I2
 zAQA==
Subject: [RFC PATCH 4/4] CodeSamples/defer: Add compiler barriers in
 gettimestampmp.c
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7422a673-c911-4916-b626-348f693f1180@gmail.com>
Date: Tue, 30 May 2017 07:18:51 +0900
MIME-Version: 1.0
In-Reply-To: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fd5fb9afb6b99b15370a9823b42fa2a92342b92a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 May 2017 15:42:45 +0900
Subject: [RFC PATCH 4/4] CodeSamples/defer: Add compiler barriers in gettimestampmp.c

They ensure curtimestamp is read and written once in every
iteration.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/gettimestampmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
index e794e82..7012caa 100644
--- a/CodeSamples/defer/gettimestampmp.c
+++ b/CodeSamples/defer/gettimestampmp.c
@@ -32,7 +32,7 @@ void *collect_timestamps(void *mask_in)
 	intptr_t mask = (intptr_t)mask_in;

 	while (curtimestamp < MAX_TIMESTAMPS) {
-		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
+		while ((READ_ONCE(curtimestamp) & CURTIMESTAMP_MASK) != mask)
 			continue;
 		if (curtimestamp >= MAX_TIMESTAMPS)
 			break;
@@ -40,6 +40,7 @@ void *collect_timestamps(void *mask_in)
 		/* Don't need memory barrier -- no other shared vars!!! */

 		ts[curtimestamp++] = get_timestamp();
+		barrier();
 	}
 	smp_mb();
 	return (NULL);
-- 
2.7.4


