Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LIk2zqSLagwKSpYStjPajNSeX/hevbm/lYfL6iWONNc=;
 b=OkvAGyYc5akm5qaKr1lZsBGlQ/TEqTd56uvqutxIOWVnkygZhRdlOL2Vao3ixWACCo
 KmvywnYlROJ8gr4/YUimkxusHeLY80649qbnkKFsWrhxm/ifnywb7lC9LhF8cYlc340p
 6kxmuxyfQ9gYI4XL5tUfXfi/lFhJ+gVageCErNZfcjlrmykEsoEUhhnEZMIdn88pdYXU
 Z6ArDo/vZs+VSqx3xUJ5P/tZTpA3GuE7W4W0G0uvoeCO6/tA0Tat+d/V//HI82I/noy5
 yqO795ASZF+H92pnlSTq8HjsgPBhgz3fWupSbRCU8/Qie29Hs3pQ9nLIQj08I0tTGZbL
 oCeg==
Subject: [PATCH 4/5] CodeSamples: Makefile: Add subdirectories
References: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4c6d5458-2ac6-f0b7-e1ea-94289304f056@gmail.com>
Date: Sat, 10 Jun 2017 00:28:57 +0900
MIME-Version: 1.0
In-Reply-To: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7e77e8a2d087b979ab984e9b90731b5db0d1eedc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 7 Jun 2017 20:41:34 +0900
Subject: [PATCH 4/5] CodeSamples: Makefile: Add subdirectories

Add subdirectories whose builds depend on api.h and Makefile.arch.
Now that liburcu is mandatory, we can safely add these subdirectories
which contain targets to be linked to urcu libraries.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 1bfdf08..cef6927 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -1,4 +1,5 @@
-subdirs = SMPdesign advsync count defer intro toolsoftrade
+subdirs =  SMPdesign advsync count defer intro toolsoftrade locking
+subdirs += datastruct/Issaquah datastruct/hash datastruct/log datastruct/skiplist

 .PHONY: all clean pthreads

-- 
2.7.4


