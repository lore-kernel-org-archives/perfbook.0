Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t4uuqr4g8UC+lS8A1ssaZpAhqpEVAFFWd6+nn7Adgzc=;
 b=VOwP9SJoPEVW+zzOU8ZkPN9BqfmZq2TnZda+4gc4MpqoZQa5UJyHdAWrIXu7451rE5
 AQqdEOJ+2yqLGOF5KwH4wp79+VpBG6kq81cPGZRfFW2Fsh1H2znuxElMciuqqcWGhMEy
 jHtqMQkmhFukEZ7C/LnEvNC1w5t2entFsOgwm3Umv+SpItpCfn/aBKcNIVgXujwSkdBT
 nCICnRS6Ee8hZfrQEov7PB1MlJPhjBzxFa6aNLciFlnK6zHdoFE1Gz8UI/tfrZX81H3K
 IQiJtGbWiVLygQ3Y1XH6V/jvFTlJFWaA+YCYZMrLcCIVahEo+YTMUmN7Dpo/Vx2Fwu1y
 7MuA==
Subject: [PATCH 9/9] FAQ-BUILD: Rephrase #7 to reflect Makefile update
References: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <444cd748-47f9-2f23-520d-b213f746912c@gmail.com>
Date: Sat, 12 May 2018 13:24:55 +0900
MIME-Version: 1.0
In-Reply-To: <8d5ad929-fbac-db70-0669-ee4b117319f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0c02a970a352e72cf6e29bf2707c6404b1939ec7 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 May 2018 08:58:55 +0900
Subject: [PATCH 9/9] FAQ-BUILD: Rephrase #7 to reflect Makefile update

Version conflict of a2ping is checked in Makefile now.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 6faa705..9fb3b68 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -86,8 +86,8 @@

 	A.	Please see #5 above.

-7.	I cannot build perfbook, neither can I find perfbook.log.
-	What am I missing?
+7.	Building perfbook aborts with error "a2ping version conflict".
+	What can I do?

 	A.	Updating a2ping can resolve the build error if you
 		have Ghostscript 9.22 or later.  Compatible a2ping
-- 
2.7.4


