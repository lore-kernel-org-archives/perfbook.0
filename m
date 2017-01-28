Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=YJ7xbRmBTqHurX8h5xafWFUTvsBdGAKHxFUqWFaGuso=;
 b=XuRvDuZ8cQHigfgXszop1elsdTHGXWeTCytjHLc7C1B/tpaUDCbdMqINR+b3I/sWL9
 zWpUqNkz6L6YLhf8D5aiGVnNAJUoE1A9wcu0SUpLLFj+eUZxWHi48WQ/3Mb5/coQqDxK
 fjIWYz3KHh5M2L2Fb4+4y5tAyzMqu/WGxOnnwmAJnfAAO7KLhAcA6plbHGhmyKDBm4Ay
 8JzhrhZaV05lWyZOSl58vo5uYGdWL4LMXM4kTkdV7pA7j/UES9qY2mQXwynP0vrEhffn
 ntCfbNvIUpA4EaAKPob3XqCmqY7+P6PiXRrzp34eawRkrKzW7MlXcZJMqrAFoejw3Svn
 bjJQ==
Subject: [PATCH 3/4] together: Typo fix (a RCU ... -> an RCU ...)
References: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6a65d714-864c-2b54-5632-65d53b04a5a7@gmail.com>
Date: Sat, 28 Jan 2017 20:12:30 +0900
MIME-Version: 1.0
In-Reply-To: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5a71dfe6dbac0d358aa2c004a2250279dbd9b1ed Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Jan 2017 00:07:19 +0900
Subject: [PATCH 3/4] together: Typo fix (a RCU ... -> an RCU ...)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 6334886..dd03c8c 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -332,7 +332,7 @@ lock.
 This section shows how RCU may be used to avoid this overhead.

 The code for performing an I/O is quite similar to the original, with
-a RCU read-side critical section being substituted for the reader-writer
+an RCU read-side critical section being substituted for the reader-writer
 lock read-side critical section in the original:

 \vspace{5pt}
-- 
2.7.4


