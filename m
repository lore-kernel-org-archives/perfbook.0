Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xjv3sbWifRSnjDE/nFKCkCFVQ6SHkrDqXIve77inrag=;
 b=qBAHmIIUX9vFZbfycua2XdOAqWi3hLtWOpeolMikAGQcz8cSt9lvY8y/aIJD/l/kmY
 S2W3bsVO+6j4vIKT5oWrUV+Bof6d8tnFL9Se9t7DQo8HiZfeTU0TcR3IFl0VUCPh+MjK
 /IVZWIwyTry5aubv2FJoJFvWaUir7xsFQU7hOFbqHyuwvU5fIIV/fkEQIz1jH5kj5xAe
 BwkeAy7BzuOxUr1y18JhVUtbkzfqZnvATCZtXUGmjLcFg0WDFhXXhrF/SO5CZjlR1M9x
 BNcJbBsZBRihDOEne4CaR7FqqLt0Gukbtn0nxaosOYbSMRbQ4zfZlBCXhhD7LZlxGQF1
 BcGg==
Subject: [PATCH v2 5/5] memorder: Fix table of 'Summary of Memory Ordering'
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
 <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a0cf704c-4b57-2743-b06e-af482cab0dee@gmail.com>
Date: Sun, 17 Sep 2017 00:12:19 +0900
MIME-Version: 1.0
In-Reply-To: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d4c4e843d7810ad589f256868aafb3cb06147a80 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 23:34:05 +0900
Subject: [PATCH v2 5/5] memorder: Fix table of 'Summary of Memory Ordering'

"PA-RISC CPUs" column should be stricter than "(PA-RISC)" column.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 596367d..ae9ad7f 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3762,7 +3762,7 @@ dependencies.
 		 & ~   & ~   & ~   & ~     & ~  & ~     & ~   & ~ & ~   & ~ & ~ \\
 	\cline{2-13}
 	& Non-Sequencially Consistent?
-		 & Y   & Y   & Y   & Y     & Y  & ~     & Y   & Y & Y   & Y & Y \\
+		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & Y \\
 	\cline{2-13}
 	& Non-Multicopy Atomic?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & ~ \\
-- 
2.7.4


