Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Kf32IfhXOZv3vqZHUwGI9xvWmG58bnMMrew5YRMF1E=;
 b=iVeYIRsswrX8kqpNRYE3J3QXt2KGm8+emHqYgzGjQfP3OeBxbmnX/9zKA0V5EkC9QM
 naP0JGW451Q85CI0wwYTvLfE6fIbQAc33fb2rHv54mJ0DfnOyv9DE2AT0IYac+4JzDy3
 3SeZ1bd8tQGWEcgHyAMFbsU8GYxO9IUxCOFdPtpkAgfGSsgBVpGddmVFBVFDOfHT8d/W
 sBTYXR++wuEHGZUoZRGsumLUoz4/YZbxcJw9Jy+l91+6E2sSEaguOC8MtGlGyC/PJNMr
 MJ5szkS3szWWRS6r1ODcEgizXR4J8kfF5/Ifbh24AY+0p3mGV9awG5kSST8grfhht69q
 VlMg==
Subject: [PATCH] CodeSamples/count: Use READ_ONCE/WRITE_ONCE in
 count_nonatomic.c
References: <1ac811fa-ad08-43aa-ac74-e6367c33e742@gmail.com>
 <CAFMy-Rk76bc+oOXq7ijGT4wzYkFbs1F7bkLWQ-VwE_O2Q-Z2VQ@mail.gmail.com>
 <45701c97-023a-190f-0113-9b272fbd8e41@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <59ab187c-a663-1e84-9241-919f358ba663@gmail.com>
Date: Wed, 12 Sep 2018 19:53:24 +0900
MIME-Version: 1.0
In-Reply-To: <45701c97-023a-190f-0113-9b272fbd8e41@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Imre Palik <imrep.amz@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 13fa1b9b162483df5d88b7aefe408a4e17e83338 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Sep 2018 19:27:41 +0900
Subject: [PATCH] CodeSamples/count: Use READ_ONCE/WRITE_ONCE in count_nonatomic.c

Without them, inlined accesses can be optimized away by "-O3".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_nonatomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/count/count_nonatomic.c b/CodeSamples/count/count_nonatomic.c
index 90979c5..50df475 100644
--- a/CodeSamples/count/count_nonatomic.c
+++ b/CodeSamples/count/count_nonatomic.c
@@ -25,12 +25,12 @@ unsigned long counter = 0;

 __inline__ void inc_count(void)
 {
-	counter++;
+	WRITE_ONCE(counter, READ_ONCE(counter) + 1);
 }

 __inline__ unsigned long read_count(void)
 {
-	return counter;
+	return READ_ONCE(counter);
 }

 __inline__ void count_init(void)
-- 
2.7.4


