Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c9+PlVOCkHgPKKNH6Y5eI62wZY0Vg66Tin1W29B3RsM=;
 b=sztzoFyroweID4aWpaqMFydPOMpzm18yWklEgw+eHMwtRmbUxA+bwKT8VU87SR7NMp
 64uCXFkc+ICfFwM6c9NpgegV2nlvGQWnHtX9SIosRGjjzf+aPQZEKfRtYF/iiittNmKp
 /+xalM38fshh2Jp8ocBAu2artKEXlR36cXNkCUV3T1cs8VFYonkp/2IjqWigcZDGq/PG
 cn9j9L9h/axR4C94GjRbjEF1+76RsFPFe6R8pHhgEZ5IziwoU+RcAWgiPubUynslJaRq
 bBUrrlYMTkgsWvNGZSaddU9K/AJ9Ca1vhLgB7ANYXQ3J6FLJF9RroPLbGhzWkCORuRer
 1pcg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 12/17] formal/ppcmem: Fix typo for \co{}
Date: Wed, 21 Sep 2016 11:44:43 +0900
Message-Id: <20160921024448.24744-13-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 9e0392a..c18cb9a 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -165,7 +165,7 @@ exclusive'' in ARM parlance and ``load reserve'' in Power parlance)
 and store-conditional (``store register exclusive'' in ARM parlance),
 respectively. When these are used together, they form an atomic
 instruction sequence, roughly similar to the compare-and-swap sequences
-exemplified by the x86 co{lock;cmpxchg} instruction. Moving to a higher
+exemplified by the x86 \co{lock;cmpxchg} instruction. Moving to a higher
 level of abstraction, the sequence from lines~10-15 is equivalent to
 the Linux kernel's \co{atomic_add_return(&z, 0)}. Finally, line~16 is
 roughly equivalent to the C statement \co{r3=y}.
-- 
2.10.0

